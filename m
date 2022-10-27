Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75560FCCA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 18:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B96B10E693;
	Thu, 27 Oct 2022 16:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D544210E693
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 16:17:54 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 8so1325324qka.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WNivv6DRz6IEkkxyGRhb+JocG+RcUmjQEd9pXKbOdDc=;
 b=NxS8gxZ5r2NidNCaiTXc+eL/q287MblVn2H5BsRA7or5nWiqGB6CkpEOwUw0ckzECs
 yjt3sPFNpfdMT+XrqidYEuhYGhrNNGz7B5Ez9Mm9CiJfpcEJssXc8dloV8nM93+xBrHR
 +aiqUB+ntichlicautD/OLfx/lO6ufjVKVMarUVBt3o8uR13AnIHVVSJH6nz3jcv/qmF
 tUicgzZbJew7Yno+y1GqF7887A2KZPqZJSE023H42rx2wsxA6+S6S7ACNHWdStf6TZa0
 ypb/lxBeharZN2Y2L29TT9md983qf412hShCxXQBnRVxzDhwVcJnYzhl8+mHxknZTr6Q
 WYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WNivv6DRz6IEkkxyGRhb+JocG+RcUmjQEd9pXKbOdDc=;
 b=jOO0VzdzN+AXHMIQASvIByunFp0I/k8/OofSh/xg1ozCwK0UXC450xYssF9sfUD2SR
 wx7HhVxEjxMaNln3OrfhyvsK6BqWKIQ1Dn+pTnkSr3VAVPohVLHuG6NQX35V9XLCS6u6
 hUAZ55YdqJlufBuZqkvdeMsjgHfoTyinJDkky+KaMw/NWyRgL97QE3E0bQWNtUKzuRDS
 N7IkL/d5TKQuUBp8ToIwajG4tzJLw2xY0rv6iAJqko7dxuK13ZCkhn4Zw6x4qQvJSYGL
 TuZqQn1c5F6E63MYTSfJduQENOgWPHNFJ7WwKw3fp1xeHiOHB9k3ybpQULjFjM6zC5Tz
 iGFg==
X-Gm-Message-State: ACrzQf3sh5uYvIPQc8H5+BPxweW7lftfyUUYa5xOP66uHP2CvyZut98m
 n8f8hXiDvcL+dxfLxhdUSz0=
X-Google-Smtp-Source: AMsMyM5vHmoX2lyAii7orMewell05XbgGBaMZ0nuXVmF0ltTsUChJojDSXLe3If80wF1op6DMfBhEQ==
X-Received: by 2002:a05:620a:40cb:b0:6ee:79ce:e985 with SMTP id
 g11-20020a05620a40cb00b006ee79cee985mr34437793qko.219.1666887473804; 
 Thu, 27 Oct 2022 09:17:53 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 y27-20020a37f61b000000b006cf19068261sm1177502qkj.116.2022.10.27.09.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 09:17:52 -0700 (PDT)
Message-ID: <5c26e62a-0e69-aad6-c72f-eb7fc28051cb@gmail.com>
Date: Thu, 27 Oct 2022 09:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
 <20220815-rpi-fix-4k-60-v5-3-fe9e7ac8b111@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-3-fe9e7ac8b111@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/27/2022 5:52 AM, Maxime Ripard wrote:
> The firmware allows to query for its clocks the operating range of a
> given clock. We'll need this for some drivers (KMS, in particular) to
> infer the state of some configuration options, so let's create a
> function to do so.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
