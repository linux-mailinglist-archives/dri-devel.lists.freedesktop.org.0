Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16A533190
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E3110E205;
	Tue, 24 May 2022 19:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD710E205
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 19:08:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gh17so24236310ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OulZq3Irlc58uEaDk3npzMcuhHJigRPmtDLvl24/rI=;
 b=WyOcrh4LJIMo3HCPOQWirbN/TJkvHif36lLojpxyJDhYud5TualgotcCkgcTvRO/pq
 fX1q0MxY4T7EUloEsrlNE/ubBG25fPlKLtE+zICmsYR9xVa8f0DZQ/3XC/00d/ZrfBj5
 7mjAAMXBwdKl4PzJmzUoqmFmmnuKiU6taXgjxER0By1YWVzrnw9+cfXMG3kuX9fW9+nZ
 H/pGzVoOP6cLrBSqzgjj71UYdJ5pstv9aa7alosWyvC1UzTvPQLrZD3+9UR+e6ggOa9h
 OeHRY9LY3AgoQUPrh4lnsrQwSO4hGnqeyP2gbTb7soQ6ieftA61Nf93Eig9+zZEDAu+H
 nTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OulZq3Irlc58uEaDk3npzMcuhHJigRPmtDLvl24/rI=;
 b=pJbh0hWGluM5M5iB9FooXy9qFlhnJZns6zTKJicbNVNFCTsy31kEk/2mvHzWwo3U9D
 2uIGUQNbwdJnd+TzbEjLnbD8mjJh/OzmSITq76ryexETuasyCeaPcQPHMrsk8lGqxN8v
 V+byf8jUFm1oq2uG1DPEGqbxx59mVCLnMCjci8JjtWJShFo7lWxZJmE/VP6XJGHivgR0
 nMo0GV8V3EaxnuHzHmlJcVPNk0spEpNUc/Rq1EDGOcd+PyusIutmzmvb2WNl+3tt0AsM
 U66nBZU3vst6GWuW0pRvRsJdKGY0+57RPtu1DIQNL7g50czsJv0FK2ctBIr5spAWyN10
 9GLA==
X-Gm-Message-State: AOAM530YWIF2pjHlahc4OIGHy7wG0utl7NrQWi/O1rBv+Yugq5NCy6F4
 Vk1drT/OWdX89D0eADgvlug=
X-Google-Smtp-Source: ABdhPJy6tiBlS7Y9PEG2y6NKd0gtJct5hHGBgdFkw2WWZBgKIw/lQUaM7aC1rncE2M7LApgGvxxnRQ==
X-Received: by 2002:a17:906:4787:b0:6f4:2f25:f9ff with SMTP id
 cw7-20020a170906478700b006f42f25f9ffmr27258921ejc.116.1653419334498; 
 Tue, 24 May 2022 12:08:54 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 w9-20020a1709064a0900b006fed85c1a8fsm2777972eju.202.2022.05.24.12.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:08:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard <mripard@kernel.org>, wens <wens@csie.org>,
 "benlypan@gmail.com" <benlypan@gmail.com>
Subject: Re: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
Date: Tue, 24 May 2022 21:08:53 +0200
Message-ID: <4711779.GXAFRqVoOG@kista>
In-Reply-To: <202205221848264427024@gmail.com>
References: <20220521133443.1114749-1-benlypan@gmail.com>
 <3173956.44csPzL39Z@jernej-laptop> <202205221848264427024@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: samuel <samuel@sholland.org>, airlied <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@lists.linux.dev>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 22. maj 2022 ob 12:48:27 CEST je benlypan@gmail.com napisal(a):
> Hi Jernej!
> 
> > Which SDK? All SDKs that I have or found on internet don't mention YUV nor 
RGB
> > scanline limit. That doesn't mean there is none, I'm just unable to verify
> > your claim. Did you test this by yourself? Also, please make YUV scanline
> > change separate patch with fixes tag.
> 
> Here is the code about scanline config for V3s:
> https://github.com/Tina-Linux/tina-v3s-linux-4.9/blob/master/drivers/video/
fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_feat.c#L55
> https://github.com/Tina-Linux/tina-v3s-linux-4.9/blob/master/drivers/video/
fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_rtmx.c#L1212
> 
> And here is for D1:
> https://gitlab.com/weidongshan/tina-d1-h/-/blob/main/lichee/linux-5.4/
drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_feat.c#L182
> https://gitlab.com/weidongshan/tina-d1-h/-/blob/main/lichee/linux-5.4/
drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_rtmx.c#L1588

Thanks for the links!

> 
> I was tested it on V3s. Without this patch, the plane will not display
> correctly if src_w large than 1024, for both YUV and RGB. I don't have a
> device with D1, so D1 is not tested. But according to the SDK code of D1,
> the scanline value of mixer1 is 1024.
> 
> I'm new to submitting patches, So may I ask a question? If there is no
> problem with this patch, what I need to do is to send new patches as you
> suggested?

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

I already requested changes, so you need to send v2. But wait until discussion 
is finished.

Best regards,
Jernej

> 
> Best regards,
> Genfu Pan
> 
> 


