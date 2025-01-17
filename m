Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F206EA15278
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 16:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0434B10E15E;
	Fri, 17 Jan 2025 15:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X4bTgiTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18C510E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:11:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so24171125e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737126694; x=1737731494; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pekHVxf/ttoG9R46riopbQafADFU7Gi1rdzDwGi1/SA=;
 b=X4bTgiTn9cWXv108JeRhqFmzC7GBqh1rRrTIiAkxj6x8OfAygjRwd0B7yXCZAMqPz6
 +G7aTSuxY4lIGS0q9BjA6DvKpWg71cmARCeU+Dm4ZE/Ag/VgVzBDv9MyN8YW4FJ3NRfl
 rnWE1Qj7cNgVdHjg+3FKl8xV7UTf4NyLT7XSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737126694; x=1737731494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pekHVxf/ttoG9R46riopbQafADFU7Gi1rdzDwGi1/SA=;
 b=mG9vkLrVUyJQ6TMw+oTfe0rRHihi5ahjVEeeFfnTUGMmIZlKkbCBvCthULpOr/Y+QC
 jLJIP1Q0FDDDFBDw5w+SlVqAi13yoaLAT91XwumL0mMrdc4TQ2tBJfShp1flhH2gG7vt
 WU0PasiGtEKwyTf3nCKWwpO8X/20OOvBTeqp+Rel+g4TukeBuO8MYwdovifOwvHRl0xh
 fo6UzawW8Ad68fX2HEUFt/9Qijq3qjo+oBW3ekwCpK4F8rk7C1Up9Gt0uRIoFRTTQhFv
 zvdL4DpVOuWW49vXXf/+WMvg9K7zB5wJz211jvypRVbmmfENLkR4NJ6C+Kz2+sEnv8cH
 cgPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMcE4w9xdUgY/Uxj1sZOXfqwT7VG3hHV52XfAOSHO8/5A5RvxV/Gf1mjqiqIlGwZnuq3mvUVnTsBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwNiKSc/+uqiuwhDWb1ij1Hq3wW8b+qLX0zxr/iR1JWSpqNJ6P
 UNJTyVGGVUk/fn760eSrGP7P6QkQUyVV3Sfg/YIydYKN4so9j6Sz4gOurHFZYoI=
X-Gm-Gg: ASbGncv8VElI1IdMraQANy2oaQl2zab7nADYv/u2qljcTzzvodbrVFonwHVeTkKPkMM
 UERM24EKgE7l+xICkzD2IRTsD0qGouIedrqLz03k3U6mJqf8znymsiICfRUiuyXfjqQ7/YBCvpP
 2ge8Qs2tEEYKLSz7+GSZyHTegpgH45ldZmgiGGP4to0qMJuB/vmK5PMvVo3S7PduGvpBtTHWYcE
 sOzgFhtS/pX0qzptuPCBPA1S8JwWu6edD8TYcabqTsivpGrIJaGqiGF49dBBNytIu67
X-Google-Smtp-Source: AGHT+IF73lL6Kjo3I9LTRG8P/o5zjbTIw37pEm5uCicjXhtcR8WMg5rbZBAI4jBX4D1S13Mc3K1Kzw==
X-Received: by 2002:a05:600c:5486:b0:434:f586:753c with SMTP id
 5b1f17b1804b1-438913ca694mr30636765e9.7.1737126694048; 
 Fri, 17 Jan 2025 07:11:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890367b48sm36478655e9.0.2025.01.17.07.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 07:11:33 -0800 (PST)
Date: Fri, 17 Jan 2025 16:11:31 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "stable-commits@vger.kernel.org" <stable-commits@vger.kernel.org>,
 "oushixiong@kylinos.cn" <oushixiong@kylinos.cn>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: Patch "drm/radeon: Delay Connector detecting when HPD singals is
 unstable" has been added to the 6.6-stable tree
Message-ID: <Z4pzIzRg2xpYv2mJ@phenom.ffwll.local>
References: <20250103004210.471570-1-sashal@kernel.org>
 <BL1PR12MB5144226AD0D6697DBF25ED56F7122@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5144226AD0D6697DBF25ED56F7122@BL1PR12MB5144.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 08, 2025 at 12:02:03AM +0000, Deucher, Alexander wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Sasha Levin <sashal@kernel.org>
> > Sent: Thursday, January 2, 2025 7:42 PM
> > To: stable-commits@vger.kernel.org; oushixiong@kylinos.cn
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
> > Subject: Patch "drm/radeon: Delay Connector detecting when HPD singals is
> > unstable" has been added to the 6.6-stable tree
> >
> > This is a note to let you know that I've just added the patch titled
> >
> >     drm/radeon: Delay Connector detecting when HPD singals is unstable
> >
> > to the 6.6-stable tree which can be found at:
> >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> >
> > The filename of the patch is:
> >      drm-radeon-delay-connector-detecting-when-hpd-singal.patch
> > and it can be found in the queue-6.6 subdirectory.
> >
> > If you, or anyone else, feels it should not be added to the stable tree, please let
> > <stable@vger.kernel.org> know about it.
> >
> >
> >
> > commit 20430c3e75a06c4736598de02404f768653d953a
> > Author: Shixiong Ou <oushixiong@kylinos.cn>
> > Date:   Thu May 9 16:57:58 2024 +0800
> >
> >     drm/radeon: Delay Connector detecting when HPD singals is unstable
> >
> >     [ Upstream commit 949658cb9b69ab9d22a42a662b2fdc7085689ed8 ]
> >
> >     In some causes, HPD signals will jitter when plugging in
> >     or unplugging HDMI.
> >
> >     Rescheduling the hotplug work for a second when EDID may still be
> >     readable but HDP is disconnected, and fixes this issue.
> >
> >     Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >     Stable-dep-of: 979bfe291b5b ("Revert "drm/radeon: Delay Connector detecting
> > when HPD singals is unstable"")
> 
> 
> Please drop both of these patches.  There is no need to pull back a
> patch just so that you can apply the revert.

Since we've just been discussing stable backports at length, how did this
one happen?

949658cb9b69ab9d22a42a662b2fdc7085689ed8 is in v6.11 and 979bfe291b5b in
v6.13-rc1, so there's definitely a need to backport the latter to v6.11.y
and v6.12.y. And maybe there was a cherry-pick of 949658cb9b69ab9d22a42a66
to older stable releases already, but that doesn't seem to be the case. So
what happened here?

Thanks, Sima

> 
> Thanks,
> 
> Alex
> 
> 
> >     Signed-off-by: Sasha Levin <sashal@kernel.org>
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c
> > b/drivers/gpu/drm/radeon/radeon_connectors.c
> > index b84b58926106..cf0114ca59a4 100644
> > --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> > +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> > @@ -1267,6 +1267,16 @@ radeon_dvi_detect(struct drm_connector *connector,
> > bool force)
> >                       goto exit;
> >               }
> >       }
> > +
> > +     if (dret && radeon_connector->hpd.hpd != RADEON_HPD_NONE &&
> > +         !radeon_hpd_sense(rdev, radeon_connector->hpd.hpd) &&
> > +         connector->connector_type == DRM_MODE_CONNECTOR_HDMIA) {
> > +             DRM_DEBUG_KMS("EDID is readable when HPD
> > disconnected\n");
> > +             schedule_delayed_work(&rdev->hotplug_work,
> > msecs_to_jiffies(1000));
> > +             ret = connector_status_disconnected;
> > +             goto exit;
> > +     }
> > +
> >       if (dret) {
> >               radeon_connector->detected_by_load = false;
> >               radeon_connector_free_edid(connector);

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
