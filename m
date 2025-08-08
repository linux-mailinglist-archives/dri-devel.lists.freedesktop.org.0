Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9DCB1E9CC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A89F10E939;
	Fri,  8 Aug 2025 14:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ESVlSFmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A5B10E939
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 14:01:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so1788836f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754661700; x=1755266500; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n1XiY8m6/AGSbbDTnf79UXW/LRh/7HiyFNqbxnnVz0E=;
 b=ESVlSFmUI1rQ5KnvQ31Bk8nz8eYHtI4mZ26iqBghnF430bee5eoh03e/hQbafBVAgX
 234LB7keiKfWHRyNFSMyEbBOvFrHh/TPE38S2NWKGFWHq+afIBvU/G4stmvF88mZY2zS
 4Q4s/G3tJdNMtzItw6m2nklXMqEj3nJ8NE1rw4e42vvoXjiHNYraYrteCMPSail3eHyv
 ZZhVtGfNGkV3LWVZfXj1Hntv9S2yggPkugm38r6BdPZAbra8+w8xiYNnUqAdKOZEM/8s
 3aU1eOZQsv2lVE27z5UKW5y2RWBlF72SQPpL3k3QpG5rUniqz91L3DLP1eCXLAxA1NVk
 A/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754661700; x=1755266500;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1XiY8m6/AGSbbDTnf79UXW/LRh/7HiyFNqbxnnVz0E=;
 b=mKbd/omwtluj781jVmHg2ci37f44v+/8KL80WiL9ydxhMOy3ND3urECzca03gLbM4N
 0mFPSS17RlWW3qYLlifg/jYlPM+oLdyUk/hFhau3iS4s0+NO5WgI5jf3gUiDZyowOnVt
 iixR4YPKGZR7nxXagpfboipqtJElLxiXOUIu5H6OIg32L3PlJypY1qtfQGihHWAUMwwP
 XQgTeh1+eMcDGPs4YTQ0SyWm6k/UwwBG7EsZP9nzyx5bqMOwo6ZWBsjuNPcgUuxIjcbC
 1kvhnK4PK0Y3XZqqhuYfnwpTHvbeB1+k9JOVyWcZiLEQWaUvNggPVEODIv8aanQLXJw4
 uZGg==
X-Gm-Message-State: AOJu0YwLdrR2yJBj8EBrcvl03H+jUiF3zRudhBbhnJfRuMLBqRhPY2+X
 1vCyTFv58OyQcHZZHRXF8QCfkni6lpYvK+hc/ZjCq85LWXEwCMd8IvWjCjOKPzmddKg=
X-Gm-Gg: ASbGnctMbWHYKSWjl5igxSQVYp+8PbjMiPRCOxxUpVlDKn1q6Qi6i28HzDJ2eppldso
 W6zxnqbtTf6U0cbG4KT9t74Trex/Pyi1C52oPbHh+Y/xu+O4Jnrhy1yR/T/ZSuXI1e2J+0X+/K+
 LWn1QdEw3s4nT/wnVcieEkcGHnTsfufKllro7Yj2ByQQ3tPUSnFBc6UyC6bbqELiKK+PkTDgvxW
 HLvReKu4WyMnKs0AxNmX2YA8xn0bag6mS7aYIL2MNpaEpvo4LPjXJ2C3Tl8Go4414vF4WXUvOOh
 eTKtj0FUh5Bdte9kjmja+MMOt8xGzvnyljVOyaedRXPW9ts1/lcRy0KmWsQCrfEA336FBmgxgCf
 ATJCpV0sU75avxjQLoxFu6FckszE=
X-Google-Smtp-Source: AGHT+IF2AtXUmbdxLlC5J5PAr4HWcxwaRs2Wu9PGUcZTCsXeTu1uympPgvhYtpcQmrrz1HmtWb0btg==
X-Received: by 2002:a05:6000:2087:b0:3b7:8338:d219 with SMTP id
 ffacd0b85a97d-3b900b4719cmr3051250f8f.3.1754661700053; 
 Fri, 08 Aug 2025 07:01:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3b9160sm30550941f8f.21.2025.08.08.07.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 07:01:38 -0700 (PDT)
Date: Fri, 8 Aug 2025 17:01:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <aJYDP-VFlrCdSVU3@stanley.mountain>
References: <aJTL6IFEBaI8gqtH@stanley.mountain>
 <aJXcN52fxSF3XLeE@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJXcN52fxSF3XLeE@fedora>
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

On Fri, Aug 08, 2025 at 01:15:03PM +0200, José Expósito wrote:
> > drivers/gpu/drm/vkms/tests/vkms_config_test.c
> >     231 static void vkms_config_test_get_crtcs(struct kunit *test)
> >     232 {
> >     233         struct vkms_config *config;
> >     234         struct vkms_config_crtc *crtc_cfg;
> >     235         struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
> >     236 
> >     237         config = vkms_config_create("test");
> >     238         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> >     239 
> >     240         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 0);
> >     241         vkms_config_for_each_crtc(config, crtc_cfg)
> >     242                 KUNIT_FAIL(test, "Unexpected CRTC");
> >     243 
> >     244         crtc_cfg1 = vkms_config_create_crtc(config);
> >                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > This file has no error checking.
> > 
> > I didn't send an email about it at first because this is just test code so
> > who cares, but I was recently burned by ignoring errors so now I'm going
> > through a bunch of old warnings to say that, "Hey, if the author ignores the
> > error checking that's fine, but I'm in the clear."
> > 
> >     245         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
> 
> While the "crtc_cfg1" pointer is not checked, we check that the	number 
> of CRTCs matches the expected value and...
> 

Ah yes.  That does work...  Sorry for the noise.

regards,
dan carpenter

