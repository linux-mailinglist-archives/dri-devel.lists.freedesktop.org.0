Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CDCA17C1A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F49910E556;
	Tue, 21 Jan 2025 10:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OjqKOjDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A3410E556
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:45:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso37798025e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737456325; x=1738061125; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5+927yDcfTkIOGouFWigCtvSDidRLS7ZH3ez8GRWqN8=;
 b=OjqKOjDnNncrMjxhWQOZsLw7qVvlfZFmGYULmGmsTv/ToIS0jrIK3PvVQhc2hS2Z16
 XLrHeYEVxoLq5BPdGkniGOYASGiTBvB8is89n3Olblv4njRkPfo9SihGj13CsekTFq0h
 p6md0gdIyD5Ash4i4wAnybn1lce29n14BdmZxgLPEcdAw1ag0jNhFIXd3EZGxEEY7M0V
 NpoDv6CVYjfezjmSU2sbIaN0PSNJ5ZIOTSklvqa+N5o2ILqlSJh54EbunDh9QkxmjKQz
 xFsgyiVr15bezfttOXNJgsjR5B8B5RVLQ1D4l+AuQ63sXAfJZDd49IQsNmUoopcBMVNR
 YWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737456325; x=1738061125;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5+927yDcfTkIOGouFWigCtvSDidRLS7ZH3ez8GRWqN8=;
 b=I+j4aVbjUiqCqPB45GnLpAmgty9TclJnqlHWwwz5tadwUwnwH/KpmFj0Npfed2WzCs
 jrsrOsTIcSBv2ys4jdO/AQR22xeEVH1/+5MJjSaaO6sZoJuno0v4lowFVAXkIh7medF7
 2i1PExmX+JL1U7HlWIov11w4BlSzWprQDqcFC7Eu37CA6e13h8pi7OlTgx97hJ96oYyY
 tZ0wjp0R/GMbbjIz2F9m/LoizYZ2+JDQWO5Fue6Tl+koHKntmg9u6CdYpj1tFpVPbhuj
 pPw9/p0ZGqrWuODZlhH2+MusqMD1tMR2NInJGYgC8906RoTMjmJOigj3jOaKuePciYfa
 uLKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5DxTB1TZtp0uGIZ44FL11GEWgNVoZJLTtJNqm10LsbGitAd+e/ipEYasYWWcDMXA0QD+Mylodybc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlKClL+slWLwQX9nh6OoT7yd6oHDKyX6+6XI9qCaCWB+zax5fg
 ET8Oq0TGx4hAse4VwmLmeSu7VWSTo/0yUVvbWke+5nNrxqbN+GaI
X-Gm-Gg: ASbGncsDB3senKywU8hLrpylxtcDoskGfvqx65WJQj5Krv9jaKOqccJ2sydpeui8w4t
 9N18/vuTCU9B7S2Wt4zNal4VEPWb8jYri1TKbhNFfzZKU21TIFakOJ2XM5XpSgTp4SEovWaJa7c
 7zJE0fT2y9IzhU0KhrV1+6CzzecDz8M1FgdDq8l6szfrc4uMh85Ua/nsCvFPXcbaBIf8NgynNBB
 D/STbO9KzXmitgvA76ZXMjn3gblsmTMox9QKnkBV6KI5qjU4NNR2YIBNV9DbdfhXF4f
X-Google-Smtp-Source: AGHT+IGoEzxq0HPWhuGQ495VDSXx5P9J5zdFjyXfhO1hziVwbrGp6oAHmMzXz8FDgj9b5VZ3m5AxLA==
X-Received: by 2002:a5d:6505:0:b0:38a:88ac:ed10 with SMTP id
 ffacd0b85a97d-38bf5789edcmr13155035f8f.25.1737456325275; 
 Tue, 21 Jan 2025 02:45:25 -0800 (PST)
Received: from fedora ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3214fc9sm12736519f8f.6.2025.01.21.02.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:45:24 -0800 (PST)
Date: Tue, 21 Jan 2025 11:45:22 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v4 3/3] drm/vkms: Switch to dynamic allocation for CRTC
Message-ID: <Z496wgH0AyaoSHdW@fedora>
References: <20250117-b4-vkms-allocated-v4-3-8ec8fd21aaf6@bootlin.com>
 <20250120162327.2866-1-jose.exposito89@gmail.com>
 <Z46HL-eSSA2EsPCi@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z46HL-eSSA2EsPCi@louis-chauvet-laptop>
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

On Mon, Jan 20, 2025 at 06:26:07PM +0100, Louis Chauvet wrote:
> On 20/01/25 - 17:23, José Expósito wrote:
> > > A specific allocation for the CRTC is not strictly necessary at this
> > > point, but in order to implement dynamic configuration of VKMS (configFS),
> > > it will be easier to have one allocation per CRTC.
> > > 
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> 
> [...]
> 
> > > +	/* Initialize the writeback component */
> > >  	if (vkmsdev->config->writeback) {
> > > -		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> > > +		writeback = vkms_enable_writeback_connector(vkmsdev, output);
> > >  		if (writeback)
> > >  			DRM_ERROR("Failed to init writeback connector\n");
> > >  	}
> > 
> > Hi Louis,
> > 
> > Thanks for fixing this error condition.
> > 
> > I have been working and running automated tests on top of this series and
> > I haven't found any other issue.
> > 
> > Reviewed-by: José Expósito <jose.exposito89@gmail.com>
> 
> Thanks a lot! I will merge this tomorrow.
> 
> What is your automated tests series? 

On the kernel side, I keep working on the ConfigFS patches here:
https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/

It sits on top of your work to switch to managed memory. But now that
the code is merged, it needs to be rebased.
You'll notice that I kept your signed-off-by in many patches, as I
tried to reuse as much common code as possible.

About the automated testing, the series could be split in two:
- vkms_config.h/c, which is tested with KUnit
- ConfigFS, tested with IGT:
  https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs

I made some wrong assumptions with connectors, for example, it is
possible to create a device without connectors and hot-add/remove
them later, and I'm still fixing them and writing tests.
Once that work is done I'll send the series to the ML.

Jose

> I will also send tomorrow a new rebased iteration for:
> - https://patchwork.freedesktop.org/series/140786/
> - https://patchwork.freedesktop.org/series/133698/
> - https://patchwork.freedesktop.org/patch/625883/
> 
> If someone can look on them and leave some reviews, I will be very happy 
> to apply them!
> 
> I will also send a first version of the configFS work (two distincts 
> series to make the review easier). 
> 
> Thanks a lot,
> Louis Chauvet
> 
