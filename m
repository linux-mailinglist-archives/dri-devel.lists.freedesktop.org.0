Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED029B20522
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBED10E106;
	Mon, 11 Aug 2025 10:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eh8e9UXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5512C10E106
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:20:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so26073725e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754907629; x=1755512429; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NZpTdvjjMejLLhaYHvyR2raa5LMl9BHUnCARklYUP+o=;
 b=eh8e9UXZfvQRiBckuGgaZebziKHwAzUwSEhZp9J/cpKO1F5cQfucnkCfhG1bvIft7b
 8tx7ExYRVPYe9F4jZfGmLn/T06yXP8Iy09qizWttubxxdeXAr5gopJEYvZgaewDrU1Sy
 7lIUoHxfSofm8auhRftn5XOWSamSKRetb1lBoztMb2Dld2LxooC7IsQNwV+HDSInhTyB
 WLG0ElgGL58VNyiBwueN1jqUAwBEeL9At8pGig8DudyrQm1N/pdGYEgaZUIW1f1dHMbw
 tBmE5tMT9aDei04hudC29F0pzmoGeWY77P4DhgqrGcUVP8IQVkVnMbZfrrDkdnM3xsUU
 VfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907629; x=1755512429;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NZpTdvjjMejLLhaYHvyR2raa5LMl9BHUnCARklYUP+o=;
 b=R+UvdwkeLHWPQI53kieorRQgXQY8iRFzBMQsRYFy0xso3Cp95AU95ym0e6T0s08p/c
 R5oBpPo0fo9DTgB+ph85TD+S8ZI6mMEug2G+x+N+oEwTAd049BYU1tHwqBMlnTS7eCmw
 aj5oeOczcurios/eWSKzilGYu+7YJGmhU7Z+flQhMGQJxSZFgBiqrIKHoeNLmkL+DqX/
 g7NFjyJEkmE/WKUEOdR0a7wvwPpkC+GTiGWocaECRj4nCZuCVTRTLkAeQBwuKPE6zLRB
 1+iKHT42MhqOuch5QPLtnxW3gZspvhScklLy5vhbbORD9G7nZHdCKxD3A2FVZBvH4YPL
 viQQ==
X-Gm-Message-State: AOJu0Yw2slPiO4LNLx1hHttGcBAMpnbJmtHeZVU5Vb3uWL+uQXGtuUXB
 3l5T0GgQS5XAy6B+3/T0PSsYJyf36BZvf4M4ZMp5axbg0iDiLUEz+e7KF7/4XQ==
X-Gm-Gg: ASbGnctv0tBwPTTIUMLZzkE7rlGhAX3S+bgUlapnvFN5sysD9XysCyWlwu4tspDZ68v
 q7cHtViy12cqb+7QVPA1+DHv5RsYRRzh5hEgku6zCpGkpJwElv/mkpLt8fIiH6O4rFa19OD9rV6
 ltewfJq1l5G/bpgpAb3DJeHeWGCp4BZNLdsPTb/oR59hclNcA6iPvItTPTkILtNMHn5ca5uRQmJ
 F9e2/MflFetoeNnzOZRwIjJ18v2dp/Hb8yshrABI6Mq6wRm+7F+2QxMo9yqfmZSpdi8ipkrzNG+
 EHmRliNJm9gptvH9YJ05JLX/i8O/kHPm7VB79vPsibaIOjBiuyHQ+zclLo6xoVna1KscHEhpY2g
 wZD8KcUh8vS0AkByMAOA=
X-Google-Smtp-Source: AGHT+IEs4Lq9BOGpVc2btlMMqynUJQn4kWFGLeZFivMk+A/tSvqhdDW6A+kL+397aUF8uNTTsBcnSQ==
X-Received: by 2002:a05:600c:45c7:b0:458:c002:6888 with SMTP id
 5b1f17b1804b1-459f4fc0ee2mr86755375e9.32.1754907628494; 
 Mon, 11 Aug 2025 03:20:28 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453328sm42111649f8f.46.2025.08.11.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:20:27 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:20:26 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <aJnD6sUjrYQh9j0Y@fedora>
References: <aJTL6IFEBaI8gqtH@stanley.mountain> <aJXcN52fxSF3XLeE@fedora>
 <aJYDP-VFlrCdSVU3@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJYDP-VFlrCdSVU3@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Fri, Aug 08, 2025 at 05:01:35PM +0300, Dan Carpenter wrote:
> On Fri, Aug 08, 2025 at 01:15:03PM +0200, José Expósito wrote:
> > > drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > >     231 static void vkms_config_test_get_crtcs(struct kunit *test)
> > >     232 {
> > >     233         struct vkms_config *config;
> > >     234         struct vkms_config_crtc *crtc_cfg;
> > >     235         struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
> > >     236 
> > >     237         config = vkms_config_create("test");
> > >     238         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > >     239 
> > >     240         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 0);
> > >     241         vkms_config_for_each_crtc(config, crtc_cfg)
> > >     242                 KUNIT_FAIL(test, "Unexpected CRTC");
> > >     243 
> > >     244         crtc_cfg1 = vkms_config_create_crtc(config);
> > >                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > This file has no error checking.
> > > 
> > > I didn't send an email about it at first because this is just test code so
> > > who cares, but I was recently burned by ignoring errors so now I'm going
> > > through a bunch of old warnings to say that, "Hey, if the author ignores the
> > > error checking that's fine, but I'm in the clear."
> > > 
> > >     245         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
> > 
> > While the "crtc_cfg1" pointer is not checked, we check that the	number 
> > of CRTCs matches the expected value and...
> > 
> 
> Ah yes.  That does work...  Sorry for the noise.

No noise at all, there were other places were the check made sense.

I sent a patch fixing them:
https://lore.kernel.org/dri-devel/20250811101529.150716-1-jose.exposito89@gmail.com/T/#u

Thanks a lot for reporting this issue!!
Jose

> 
> regards,
> dan carpenter
> 
