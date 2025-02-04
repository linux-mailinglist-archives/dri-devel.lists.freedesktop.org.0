Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077CBA2702A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 12:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70C210E5F4;
	Tue,  4 Feb 2025 11:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="d9ay6Twc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B93110E5F4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 11:23:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38da66ce63bso394552f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738668215; x=1739273015; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwZVL4ItsJkt8HNxEi75zW4gz8K6ibP33hH99+wCC+M=;
 b=d9ay6TwcSbYheeXvSw4Nrp91CWyPPj2bTNZ/mFLD0X2n2MbBmUpAoegRNi6tXYwmom
 W+wQzVAnbM7GWyZJGUa8uxg/p3EGbdly+2pcbImq6ptlnwOfCdtrzYu9Ojvb946UKcsE
 Du44ZEd8WbJHFMEMvzJBOnI+mRReb3/t6qq6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738668215; x=1739273015;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QwZVL4ItsJkt8HNxEi75zW4gz8K6ibP33hH99+wCC+M=;
 b=JRBaWivYUfOWTLZvmtRatHpCcaLE6TZpmCcH1+oxnCPl/o4vayObiOm7etY25mtWiZ
 u3PK2DtbKLiDh/aJrVNKXBgfeRh6PHZLQlVrvUbxza9TBxxLy3Osb2Tqj8zLy1ap7EQl
 fRynKPDjP40qNw8xbQYARaRiyD5s0xlEVkWWq6NUU6e74+FHyX2tmb1l7x1Kspn1jwEl
 zbn5fmyzdOTzBErn4I5tFoT/6cxNxlu6RF5RYfLt4Y8sK1IP9VyZTqqntbi6mC6BNydh
 cVDtqF4HNnvFjXDekpBsx5cQHNxijxtBnB95o3o9XZEWYdtZGg8VwE/VtWu95CbYsI/m
 uW+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfe2SMd4Gt9lyo1AEx1ODsL3RvTXgHbVRiBNx2kvesvIg9ed1pKC0RKfoU/zmYsc2bFjE9PCYJbEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVW4KDB/K6f/hMJDxBiiPpf/P5wb0zyoGgp3B73fYqVmdJ0gq+
 BQt81RSntRTSON6Pl70JzDILbT5l7mVexoD7RWI2B6fytSl9UgyqMaTgAy/WSWg=
X-Gm-Gg: ASbGnctll6CjRkJ/stlRQ0xofAsdh8K4Sph+h7mOiryjg568EEsVYnxBkQUgcNqcsYj
 vmIQPs1BdaV7rJFGXEe/m40zZsLNXkel8TSOIakv/nPbsY69adoYGH+m/+stL99XYPBDePS4OGI
 xSJ53Kc4G6kgNVqzcpOuc1wqELiQ8qyBKogJWGBn9keAx34V6DRorkv9iUOJeHaT/do1Gl0NVDC
 LPAZg/Tx53DmParWIpHJ1oUyGEU7h16oLDOhjkLLpAtULGhW4+Rmo/LZQfGY2L1EmdDhfEva+cc
 JLjQ55VDv6Z/Ba2909+dBShiZik=
X-Google-Smtp-Source: AGHT+IF2ySgp494p/EV3jZKnKGpN7wWzTUU0SAUoEk+okGZwJMzwTcVEw8ptZMAaJniZlJc6TyKp+w==
X-Received: by 2002:a5d:6c66:0:b0:38a:88ac:ed15 with SMTP id
 ffacd0b85a97d-38c51932019mr17414601f8f.4.1738668215002; 
 Tue, 04 Feb 2025 03:23:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e5d4csm184805245e9.19.2025.02.04.03.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 03:23:33 -0800 (PST)
Date: Tue, 4 Feb 2025 12:23:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com
Subject: Re: [PATCH v3 2/2] drm/tests: Add test for
 drm_atomic_helper_commit_modeset_disables()
Message-ID: <Z6H4sjDt2ewIiObs@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241211-abhinavk-modeset-fix-v3-2-0de4bf3e7c32@quicinc.com>
 <njx2ogued4bbu3ub5jlnczql3x2dr4i72onhmh35tgxyuf3lek@3liwh4butumk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <njx2ogued4bbu3ub5jlnczql3x2dr4i72onhmh35tgxyuf3lek@3liwh4butumk>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Dec 12, 2024 at 12:50:35AM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 01:18:43PM -0800, Jessica Zhang wrote:
> > Add a subtest to check that modeset is called when the connector is
> > changed
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> > Changes in v3:
> > - Use BUILD_BUG_ON to check connectors and encoders array sizes (Dmitry)
> > - Renamed functions to be more test-specific (Dmitry)
> > - Added comment description for test (Dmitry)
> > - Return get_modes_fixed() directly within the encoder get_modes
> >   function (Dmitry)
> > - Move drm_connector local variable declaration to top of function
> >   (Dmitry)
> > - Changed drm_test_modeset() to a more descriptive name
> > ---
> >  drivers/gpu/drm/tests/Makefile                |   1 +
> >  drivers/gpu/drm/tests/drm_atomic_state_test.c | 244 ++++++++++++++++++++++++++
> >  2 files changed, 245 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Pretty sure this blows up with CONFIG_DEBUG_WW_MUTEX_SLOWPATH enabled.
Seems to generally be an issue with our kms kunit tests, so probably also
something we want to fix in CI.

Plus a pile of work to sort this out I fear :-/
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
