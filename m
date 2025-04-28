Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD4A9EAA6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 10:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3110E3CC;
	Mon, 28 Apr 2025 08:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dbWmVRgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC0010E3CC;
 Mon, 28 Apr 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=asq7zu1/ieevisO4S1keqCQ4x3VurV65KCckwW+DKVg=; b=dbWmVRgDRvw1h86hzWgzlJ1WhB
 j1jK1YULsoIKI6YUpDdKxTCMNLTKlXYplFJqfdBBuungyTYuUgh4NuVkET1Cj6B1NKt61j7N9Cgbb
 aNgrpdGGBp/zGaclvpe0HDvEOv94kNcKBf3aBN1kOr3+u0VhAOm48Nyms9+R1HeEuCLhXTuqKU9Iq
 BxTsxdjmHYTmSp5qhafR9GZrdff8ymXFBOdxeNSinLWCcr2CUTp02bm1y5sgmeV7G4Fg5Hj3Gkow4
 /kPMsoHDl7h596rjAbuuJJrQywWlkaPluthCwvks8a68TCN9XyLa82JsLodnSR/d/g/DzL2IjguXg
 iNx+tIgg==;
Received: from [159.147.214.238] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u9Jl9-009gdn-Im; Mon, 28 Apr 2025 10:22:39 +0200
Message-ID: <ac7e3350fdfde6f04083c82e2dad02330ff3372c.camel@igalia.com>
Subject: Re: [PATCH] drm/doc: Start documenting aspects specific to
 tile-based renderers
From: Iago Toral <itoral@igalia.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, =?ISO-8859-1?Q?Adri=E1n?= Larumbe
 <adrian.larumbe@collabora.com>,  lima@lists.freedesktop.org, Qiang Yu
 <yuq825@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,  Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Christian Koenig
 <christian.koenig@amd.com>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Date: Mon, 28 Apr 2025 10:22:28 +0200
In-Reply-To: <20250428101302.2df2f9cb@collabora.com>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
 <123343432f17913452ba9cbef6161837cc3c07d8.camel@igalia.com>
 <20250428101302.2df2f9cb@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

El lun, 28-04-2025 a las 10:13 +0200, Boris Brezillon escribi=C3=B3:
> Hi Iago,
>=20
> On Mon, 28 Apr 2025 08:55:07 +0200
> Iago Toral <itoral@igalia.com> wrote:
(...)
> > As I described above, v3d is not quite an allocation-on-fault
> > mechanism
> > but rather, we get a dedicated interrupt from the hw when it needs
> > more
> > memory, which I believe happens a bit before it completely runs out
> > of
> > memory actually. Maybe that changes the picture since we don't
> > exactly
> > use a fault handler?
>=20
> Not really. Any mechanism relying on on-demand allocation in the
> dma_fence signalling path is problematic. The fact it's based on a
> fault handler might add extra problems on top, but both designs
> violate
> the dma_fence contract stating that no non-fallible allocation should
> be done in the dma_fence signalling path (that is, any allocation
> happening between the moment the job was queued to the
> drm_sched_entity, and the moment the job fence is signalled).
>=20
> Given, the description you made, I think we can add v3d to the list
> of
> problematic drivers :-(.

In that case we should add vc4 as well, since it is the same story
there.

Thanks,
Iago
