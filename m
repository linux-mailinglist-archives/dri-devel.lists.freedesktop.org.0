Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476C92D7163
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223EB6ECB8;
	Fri, 11 Dec 2020 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6856E435
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 17:34:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id t7so4756555pfh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lNV+r0IppAZRJTMBGlPd7aQiGXuhonx9MT/VwxzjdOI=;
 b=ViSLsucSzbhWox3QJJ8d+ac7h6BvoCeM0lqomCBd4vRbFl+CdXiFn0mDlGOlptmyYI
 PPMPfTqfeT6WHQVekZw+odl+rTG6kg89jekdO/s5m++np+ENtoDqN5QujPzHYY13ImTX
 bXlQWP6DPnjzgeeSdQwhfD8/KHEXXxuh175Bmi80EQQW5Hq1k8DyH78SiJRKjRoBImIa
 5UpOnyoozg27bHEKkdci3fBSk0i9SV/40J6bF7M0PBPQZeT2BI3rlfCiwxcVfi9Q01LO
 6NcMDeMYmsIpgy4feBzzwvBbDHGjRRbnIl2q2TLsqDx4ijjJPnocdKXZUjRjo8hILZwQ
 UkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNV+r0IppAZRJTMBGlPd7aQiGXuhonx9MT/VwxzjdOI=;
 b=gzNv1kFFp594xeRpsdLy0zJSGlxXFxqSj4nsnY2d+iR/JwiDmWv6eTHhtDlcrkwWkb
 DhCmWKUpOhX3XFv4DX8saOGFtRTgcdTgzwiBAsq5xRT3icgb0d/JVcqZiaemJZsko6NI
 xQ8OgffXYz1Ct6rcHUy51O4dJ99Nek7UCucKaGYwLE61XuGonpltpPswY1sgXwBaWRsa
 jXGodMAwr0jISE9v9m6tJdpufFgUCszvZv2XUffaNiGB5Bo+680etFvmR8ajIklWXGBn
 d9FIMO04nbMlJdwQZ3cHEBj/rZUeK3BFNlUzY6H25TJsAnWqwdLckJfwNhAhWuiT//d6
 15qQ==
X-Gm-Message-State: AOAM5338B/ouGkISPMIA7gSjhTke2Rmh+5Dg+TrPWKR0iLKbyH4K1OpZ
 w+LSI/oXJVadDFfAItM4easKBULZ7DU=
X-Google-Smtp-Source: ABdhPJwNZKeRKA6MI5jWS1XQbWp2xNRfwbC/lQQAa0pRweX0TNjTfHxDqrkpIiT0lSE76MavwUqu2w==
X-Received: by 2002:a62:5f81:0:b029:19d:ccc0:9c42 with SMTP id
 t123-20020a625f810000b029019dccc09c42mr7786239pfb.61.1607621644944; 
 Thu, 10 Dec 2020 09:34:04 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 136sm6796774pfx.112.2020.12.10.09.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 09:34:04 -0800 (PST)
Subject: Re: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-2-maxime@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f224bd8f-559d-0692-9025-4ee30d0d0846@gmail.com>
Date: Thu, 10 Dec 2020 09:33:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-2-maxime@cerno.tech>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2020 5:46 AM, Maxime Ripard wrote:
> The BCM2711 uses a number of instances of the bcmstb-l2 controller in its
> display engine. Let's allow the driver to be enabled through KConfig.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
