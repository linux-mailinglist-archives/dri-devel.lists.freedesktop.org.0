Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C1260A06
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 07:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC476E123;
	Tue,  8 Sep 2020 05:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F36E123
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 05:27:26 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1483713pjh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=megRWY3ZaQN3ZA6JEAJTYYOu0Tr5nK5nmeK6Ia55Lzk=;
 b=T3MR83jWTrAJiorw5rUmpPX0PA6Gd3ZbyliB5vgAvoEBnkY4lkmmgDDuZqleHaPmIF
 3aeAgl3qDZB+ZMduhjzbqaCtY4Rr2jfJzRAaBbiNKVY5TiZCMXclDHE2PH1m4NzixKHB
 kDYWJKFV8V+PpGJbgO0T0iKRB0JKCNQaCWXUGrkedifvduXBaJbz2uqKRvnTSnZLByHE
 UOAFtiS+CUIcsflHzGJGiaRp5gptCVZc5T2IJFYeRpXClSXDsJGBtWc8ctDBjkUxgaWr
 0VD51cG83sU/GNlPC1q/7n/BNFRTBJVzIwUmB5sZg9eWd4dCAr5VMx+pRxQchvHwokE6
 o+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=megRWY3ZaQN3ZA6JEAJTYYOu0Tr5nK5nmeK6Ia55Lzk=;
 b=VIgQludI+IlaLNyVrqLPzJZN2/voveFm3W9gKAFmXVvSWRG3TAmLuphbSDE4liydlx
 6WA092oRywWUdqajULF/36MSzRT5L0bZkDXdpEXYb4SW/U8LpGWZA5itmQGK8CZCm6UP
 UCIUl/KgVyijkA6oShvszYmGml7O6uNpfApjcZngnOireTUdCjB+kepRjcFTqrUMZ5lK
 avA5+mV9lgp7VrDLmClMRrGrUyxWWPQmydWUKnSOns7mkoaO2zLlUp53cijEYK++vwDK
 tLJMHnKJDmLP+rTg6C3FCL7ByBeZX6nO8fNZzTACeOKIuR7OPpx3Ru/3Ux4Sypxwtbx3
 VYfg==
X-Gm-Message-State: AOAM530njV54dHbOVhJCeaNTxUdei9vI71AUbYk/13+9HX0EXvQgwOZy
 jUbLQhZQNOXitem6avfCg/w=
X-Google-Smtp-Source: ABdhPJx+PDJgcJW7cIH8v7Ef48LHWInZkpb39FIH8XpgDnnwE50SyS0Cy/+1ksG/XzieCnfppCFpoQ==
X-Received: by 2002:a17:90a:184:: with SMTP id 4mr2455432pjc.148.1599542845734; 
 Mon, 07 Sep 2020 22:27:25 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.129.64])
 by smtp.gmail.com with ESMTPSA id h7sm5348417pgc.58.2020.09.07.22.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 22:27:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/radeon: Add sclk frequency as hwmon sensor
To: Alex Deucher <alexdeucher@gmail.com>
References: <61af3cb4-9bfc-0e61-de9c-4bb15afdd652@gmail.com>
 <CADnq5_NOUxxTkBLfmZhaDSvOGy51F+HYQKvcHuC+e4U7W6eLNg@mail.gmail.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Message-ID: <75b33a59-9394-0cf6-7026-8cd14c0f1ab7@gmail.com>
Date: Tue, 8 Sep 2020 10:57:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NOUxxTkBLfmZhaDSvOGy51F+HYQKvcHuC+e4U7W6eLNg@mail.gmail.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/1/20 2:03 AM, Alex Deucher wrote:
> On Sun, Aug 30, 2020 at 3:25 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>>
>> This patch series adds support for reporting sclk and vddc values for Radeon GPUs, where supported.
> 
> This commit message should be specific to this particular patch rather
> than the series.  You could probably expose mclk as well.
> 
> Alex
> 
> 

I only have a Radeon iGPU, and don't have a Radeon dGPU to test with, so that's why I didn't wire up mclk.

Yours sincerely,
Sandeep
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
