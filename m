Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463C60FCD0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 18:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0434610E0D4;
	Thu, 27 Oct 2022 16:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B964010E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 16:18:51 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id z17so1312620qkj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 09:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6xBCapLuegy5t6LeNmW/iLXMOnO1TWAslQw9kSN5ZQE=;
 b=cYNEY/42iuBJiY48wnREorcd6CF1qdMuC9l0BGaMTmIzJmOpZDj8jfi+mhojx+L1WS
 WS9YCcgihsE/BCTOIDugnV9OV0C81mkh3wDxHXkLH/0+MM8F1DurFp7nv0bikq1z2x7Q
 U8A26L+WFHPikV0tko+cWgsM1+y1lbCznEyld8C6KxyGlWVw/FG9hjFOb+YFuDHC/NJQ
 a7Z+ZVMtcfsS9jAtAftdj9n7HxjReB5/Yu+GJk4zx7gtt+mdT7cuLtT1mJssoyqgh8+Q
 wOjwGYR6pxp4StcnP/gSbq97kZ1bWdJgb8961jjbEMPz7/JDVRH4Qx29QBrbfWKss5rf
 /T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6xBCapLuegy5t6LeNmW/iLXMOnO1TWAslQw9kSN5ZQE=;
 b=K9kknh3Fje8PoPTns9aemDCIVt+KhFHI/NwOYtS/8vWljPqPB3ScfSUP1KbETxz/f1
 cz078D+NJFLEssmcWHITq46KO/b8HJbV2rD3cU9IlIpfEddbtfMXg4P+pY9FrScseWrv
 0pWFX/0qY75YgW2Hk0R2CkhkB5bmtz85/SL4u56amBer2/C/KqQOCuHTnW1/fZ+qR0QE
 F8afuT2HyTpZd+XfNM7ihYKuw65IFZ04KLzDcBjPGrQvyCnX8fEmzzO7u7NAZbXvuF0U
 9kQwZ0M82FxZ5ArpxYAweFhdQmRLiWgvrc2UnG7nnipgIKYcPQZs4Lt1mRCAmAmK139e
 IMFw==
X-Gm-Message-State: ACrzQf1zravkQNILw2ViPE4xLOe3AvKdfoVK2K/ACtwpTrZCPcucswgB
 Oc9CBs+7wSPQAk/38CSrhw4=
X-Google-Smtp-Source: AMsMyM7y6pBhRWHyk3gEP/quq0Bt5hzt68CLUdXsusst9fyCc+DeqkZuiYXsme1R8nfvw0hHU/LDaw==
X-Received: by 2002:a37:40f:0:b0:6f8:e1c1:9630 with SMTP id
 15-20020a37040f000000b006f8e1c19630mr7169903qke.710.1666887530696; 
 Thu, 27 Oct 2022 09:18:50 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 c17-20020ac85a91000000b00342f8d4d0basm1089183qtc.43.2022.10.27.09.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 09:18:49 -0700 (PDT)
Message-ID: <7fbd1497-cc73-9cfb-7ce5-c86406dc1b04@gmail.com>
Date: Thu, 27 Oct 2022 09:18:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 0/7] drm/vc4: Fix the core clock behaviour
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Florian Fainelli <f.fainelli@gmail.com>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
 <20221027145914.jv7krzw6fomffyai@houat>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221027145914.jv7krzw6fomffyai@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Emma Anholt <emma@anholt.net>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/27/2022 7:59 AM, Maxime Ripard wrote:
> Hi Florian,
> 
> On Thu, Oct 27, 2022 at 02:52:40PM +0200, Maxime Ripard wrote:
>> Hi,
>>
>> Those patches used to be part of a larger clock fixes series:
>> https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.tech/
>>
>> However, that series doesn't seem to be getting anywhere, so I've split out
>> these patches that fix a regression that has been there since 5.18 and that
>> prevents the 4k output from working on the RaspberryPi4.
>>
>> Hopefully, we will be able to merge those patches through the DRM tree to avoid
>> any further disruption.
> 
> I intend to get this through drm-misc, but you just gave your
> Reviewed-by on all the firmware patches but the first. Are you ok with
> this? If so, can I add your Acked-by?

I don't feel legitimate on any of those patches, but the firmware part 
is something that I can understand, gave you an Acked-by for patch #3, 
hopefully this allows you to merge through drm-misc now.
-- 
Florian
