Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB3460B718
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80D10E750;
	Mon, 24 Oct 2022 19:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980AA10E735
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 19:19:19 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id r19so6225612qtx.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 12:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vOSW4zp7h0M1kGzDu+VDLbhY1Nz07dzMROKp50qg0is=;
 b=AOsdx80LfH0rCtKsPduGSBeAAxIc0bD6B2tviT3zmM+U5YoRbN8c0gOYVd0CqaCm0R
 9sdbMCqObzbNVjBFrKG8I0+eVd2H2FwJ0ymNtjpf2M0AjWx22inkKmxb3tQjU74cM15b
 +hmEc5wUnlFI6uHvObJbIf87xVHZj9gMvGPUiOOfw71fYhaAeMLxMVueGZq5rDcLWPyD
 mfoz8fiFccldajFBXFkoOgzXt56FOgBas82kcOwyjlpHlYPY5SZY43gcM6gWt1ESSFyX
 BOMTikRXAQ2UGexI13xvm3JaCj0SWJ1SdV+mS3NoyABicdm7SaX0mTQp9sYXE3MaVmx4
 XD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vOSW4zp7h0M1kGzDu+VDLbhY1Nz07dzMROKp50qg0is=;
 b=y/JIUUDWiDqIB2P9zbWdZQRpjmKVnDJsjDmKPh4a0mng+PPG33jgIZenNd5NJ50kj4
 W6thn/oDSCc/BgxgftH1/cD+3Du+/WBMePOGyI7hDVHveklZNYvIjDNkMMN8mpHfsgpt
 cltcrFSs9asd5aiESVS3bSWYlWpPlQrbYU17GAP+vKqQLhOC5/YNJi4NfnibTQhCEk21
 RHk81bQ8y6Jw7SC9q3O2su8sxIuUg//Q6WL/szhtr6jvyIO9M8yzScJC7klqAOkfjdgs
 F7XFkwpRDt2VjesbO5TFxP/19HOP1/kF9NA2bsxw+C0gpjSFepOt9wB+1WnJGfYjRVMi
 o2Nw==
X-Gm-Message-State: ACrzQf3YvXc0DJCSXZ5jl3NJd2LRd1zE1toGcTZ6Ld92I7LVaJNIvAeQ
 9TfiuB9Njqss7eZlquP5zkQ=
X-Google-Smtp-Source: AMsMyM6AVe+NA415k75JCzANA73liFiHt+KIKB6eDL9eiBKdiUkrgH4qwdfMVkDalSZWj5rT7ZL/tg==
X-Received: by 2002:ac8:5e4d:0:b0:39e:cc0d:3428 with SMTP id
 i13-20020ac85e4d000000b0039ecc0d3428mr10980479qtx.44.1666639158575; 
 Mon, 24 Oct 2022 12:19:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 b24-20020ac84f18000000b00397101ac0f2sm432651qte.3.2022.10.24.12.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 12:19:18 -0700 (PDT)
Message-ID: <17868eda-d450-8780-18b7-e52af86b3d3e@gmail.com>
Date: Mon, 24 Oct 2022 12:19:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/7] firmware: raspberrypi: Introduce
 rpi_firmware_find_node()
Content-Language: en-US
To: maxime@cerno.tech, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 David Airlie <airlied@linux.ie>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-1-a1b40526df3e@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-1-a1b40526df3e@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/20/22 02:12, maxime@cerno.tech wrote:
> A significant number of RaspberryPi drivers using the firmware don't
> have a phandle to it, so end up scanning the device tree to find a node
> with the firmware compatible.
> 
> That code is duplicated everywhere, so let's introduce a helper instead.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks for re-ordering the rpi_firmware_of_match array and avoiding a 
forward declaration that I was initially confused about in v3.
-- 
Florian

