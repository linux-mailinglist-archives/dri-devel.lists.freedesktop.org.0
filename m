Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49EA38939
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6204210E0E5;
	Mon, 17 Feb 2025 16:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OAssSBwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C552410E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:34:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso50211575e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739810066; x=1740414866; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LlEc/1DhhuQ6PXgaEU0RmiNtz94/GUUPYpvE7Dfmipg=;
 b=OAssSBwFmpW45yyWkmVhM6+lTDw+NFOQx93JogaHyw1OqVa2sV/Rpu5Kd5lWmJa9RZ
 XlvcvMuFd5FZIn5N7woMn7PBGhoC8PUgWtQG6yfH/vhdf80WIYOefLWQKe/HTzMubK6L
 KT6Ls8qmQS6pVn2hUXowaUkfS5sBliNXDumJ2maG73yUbHmo3q8JhgZUoB4ZlDvDjXBv
 Yy1/OlwSdFD9jM3bq/TrMgwPIAQEtPs7pW1MzUj1esZ6s9Vj1AB1u2HwoOMO0OzLWtWE
 u8mwXD60nLZQXRXRsbQf2NNP77/SHv9l6QARLrpGdNhJ/z2zBvA2InlWjaufW/Y1Seu9
 ZqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810066; x=1740414866;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LlEc/1DhhuQ6PXgaEU0RmiNtz94/GUUPYpvE7Dfmipg=;
 b=wI4oKohNsZ1vQML3sRQbFvVLnKCqNr3d/y/5AZGo3bcrJCG/web7aYJRNsDWFeZAtS
 K5Vnx6lPKQlRzG+A6QyoPzbd81o/e4nt3S/ZBjgd54h4kZcWF21nS9q1oB9uUf2phdKL
 QI2IZY3yEqDZnBuyaYwuT3M1J9LwWOiUrX1tFSG95vbJP0PCISxpya5ug0oCNQOKwjaA
 FNooLd/sq3nvaz8ec83Ei3a5MyScP10d9NqSWRT2Rfuto03zAILbijfc0bhO2UL72My/
 9FV+QOrjo1Gt8dGO7y/M54Zf+jPfyWB2Y5TNCWlsXN9eFjy0+dIbjEIqqptuxLz34Hyl
 FI2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI8kcUJNUiSlnOAZIy/fs5ZIRGgVvp+9KXOGQ7AnOl24rvXHiiN5gdYSSvOtKvueUBdjOmmwz8PGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOCAiiZdvii1E8xubbBAO9uEXMDDso/nKl38a3JBXNM1NOkilQ
 dEc3t6Qic+SCjKaVDzmVFXILMp6WkKhLtF3nLkO17WCh3CuVjcZC
X-Gm-Gg: ASbGncum5kxsgS6N/+tI2z/hdBnK9Vw/uH+xqzzioY49JiBusLFq3+fbhllk/QuSaeL
 N9pKP3tBuixOzY9ytU/y2+CiOFyt+W+UVgXj9KIt4y8rAeO5Bdhs+wh2dbK6Upd0GI1hTEB1PXM
 zSjQo5KiF2uxJBPYfJgb5LW3RZDLxek5S5q5lssNIXNgMJA9QSoczLJXM6JSem6A1FhUjL2E7C5
 vetWduZRdOXdYGQzpRBTI5JfaR1hmU+lgt/TBAy8OYc5uHKPi2OKIelHckYPNLwkCIMkUnIv1q2
 ty2MKOMyoDESFjY=
X-Google-Smtp-Source: AGHT+IFMADmMY55Rroim8nNi4dr7lMdcl4XT7qcZvO7BoawuPszaqx+VZtHAReeiQxnTw3eLfeBMEA==
X-Received: by 2002:a05:600c:3b8c:b0:431:5c3d:1700 with SMTP id
 5b1f17b1804b1-4396e716f3dmr90733195e9.21.1739810065996; 
 Mon, 17 Feb 2025 08:34:25 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439617fccfesm124645735e9.11.2025.02.17.08.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:34:25 -0800 (PST)
Date: Mon, 17 Feb 2025 17:34:23 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/14] drm/vkms: Allow to configure multiple planes
Message-ID: <Z7NlD8kWkUxojYWy@fedora>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
 <20250217100120.7620-9-jose.exposito89@gmail.com>
 <6b29064f-104a-4f9c-a9f6-8f4a862dbcd7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b29064f-104a-4f9c-a9f6-8f4a862dbcd7@bootlin.com>
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

Hi Louis,

Thanks for the quick review.

On Mon, Feb 17, 2025 at 04:45:37PM +0100, Louis Chauvet wrote:
> Hi José,
> 
> Thanks for this new iteration!
> 
> Le 17/02/2025 à 11:01, José Expósito a écrit :
> > Add a list of planes to vkms_config and create as many planes as
> > configured during output initialization.
> > 
> > For backwards compatibility, add one primary plane and, if configured,
> > one cursor plane and NUM_OVERLAY_PLANES planes to the default
> > configuration.
> > 
> > Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   .clang-format                                 |   1 +
> >   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 140 +++++++++++++++++-
> >   drivers/gpu/drm/vkms/vkms_config.c            | 127 +++++++++++++++-
> >   drivers/gpu/drm/vkms/vkms_config.h            |  75 +++++++++-
> >   drivers/gpu/drm/vkms/vkms_output.c            |  42 ++----
> >   5 files changed, 349 insertions(+), 36 deletions(-)
> > 
> > diff --git a/.clang-format b/.clang-format
> > index fe1aa1a30d40..c585d2a5b395 100644
> > --- a/.clang-format
> > +++ b/.clang-format
> > @@ -690,6 +690,7 @@ ForEachMacros:
> >     - 'v4l2_m2m_for_each_src_buf'
> >     - 'v4l2_m2m_for_each_src_buf_safe'
> >     - 'virtio_device_for_each_vq'
> > +  - 'vkms_config_for_each_plane'
> >     - 'while_for_each_ftrace_op'
> >     - 'xa_for_each'
> >     - 'xa_for_each_marked'
> > diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > index 6e07139d261c..fe6f079902fd 100644
> > --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > @@ -24,6 +24,10 @@ static void vkms_config_test_empty_config(struct kunit *test)
> >   	dev_name = NULL;
> >   	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
> > +	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
> 
> Instead of testing directly a "private" field (planes), can we use something
> like:
> 
> int count;
> vkms_config_for_each_plane(config, plane_cfg)
> 	count++;
> ASSERT_EQ(count, 0);
> 
> So we don't make config->plane "public".
> 
> Same comment for connectors, crtc and encoders.

On other calls to list_empty() and also list_count_nodes() and
list_first_entry() we are also accessing "private" fields.

I'll create helpers in vkms_config_test.c replacing the list_* APIs with
iterators and send v4.

Thanks!
Jose
 
> With this:
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> (sorry, I did not notice this on your v2)
> 
> Thanks,
> Louis Chauvet
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
