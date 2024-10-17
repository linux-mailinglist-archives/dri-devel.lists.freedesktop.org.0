Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341079A2504
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690CD10E1FE;
	Thu, 17 Oct 2024 14:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G7QqYDS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A26210E1FE;
 Thu, 17 Oct 2024 14:31:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0709A43D35;
 Thu, 17 Oct 2024 14:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A337BC4CEC3;
 Thu, 17 Oct 2024 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729175464;
 bh=6UufKdmFAaPHOMthzmMqIm4AhJNWurr7EeT+mEyvhbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G7QqYDS98+RNBTT8+wxwSLCvqxCPxErdQ9HoJ1W7UJOu9d+FmwiIyPa8dCi91DKnW
 pXNHwGaL6xwDUbC1PaZvjSbRmNMDcSF8lzrVMweWoL/NSw5HjcNvk65h+eEnMOz+yE
 WldD5wxOo0b+T3bhwT6REndZSUhQXRg2ornLLYp+QtbstWPtW0ru5piedlJkTt1vdU
 ynhSup7thSLhuhwd4Bjw7YSIClYfiVIXd3PH7TVtzhyNdITLOq4+ONhrWgyQKJNe0K
 29VD2z0tGuH6AUQyze5Gen0s3x4f6wzEKg7ZjW6haVkYOdkgr8mbMhmLnKi22piOld
 eSQNCJMepX4jA==
Date: Thu, 17 Oct 2024 16:31:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 00/23] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Message-ID: <20241017-didactic-hornet-of-glory-14fcce@houat>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mna2pfiquhuwbp5i"
Content-Disposition: inline
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
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


--mna2pfiquhuwbp5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2024 at 06:21:06PM GMT, Jessica Zhang wrote:
> Changes in v3:
> - Dropped support for CWB on DP connectors for now
> - Dropped unnecessary PINGPONG array in *_setup_cwb()
> - Add a check to make sure CWB and CDM aren't supported simultaneously
>   (Dmitry)
> - Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
> - Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
> - Dropped duplicate error message for reserving CWB resources (Dmitry)
> - Added notes in framework changes about posting a separate series to
>   add proper KUnit tests (Maxime)

I mean, I asked for kunit tests, not for a note that is going to be
dropped when applying.

Maxime

--mna2pfiquhuwbp5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxEfpQAKCRAnX84Zoj2+
dt09AYCudzOjIU8min87jZcaPuELHHOnPZG6jhTh5dZH5K8Oe9EURIc14NX99aCc
tpYOeSUBewbLNSeA+CbKa1xstbwsaBZH7imXMUy/5oQkeNNNc0iwd7Uvwsip5rkS
aQBrPzpRxQ==
=Yh5a
-----END PGP SIGNATURE-----

--mna2pfiquhuwbp5i--
