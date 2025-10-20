Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741FBEFAB2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C8010E117;
	Mon, 20 Oct 2025 07:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vAeyrdcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0228A10E117;
 Mon, 20 Oct 2025 07:29:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5D3345A20;
 Mon, 20 Oct 2025 07:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3CAC4CEF9;
 Mon, 20 Oct 2025 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760945386;
 bh=RjFIO1r+q3N4OyF3t30qtbjkFjY6rLYauIxFwgJyc/c=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=vAeyrdcOI9qcmWbUpZE9/z+Sl2jCVjp8VSJg2+jTF9+jFlbtbrDl+p45ManKysmLP
 TvvPVNsAFnAHX6nHQ2oDoa/VXuUHMbHvkNQF6fhJqiV7yBrgVq0u2kWYnmcnSXg0Nn
 Kecr2BCFSw+0euZ+q9PfTNq5xAzS42H+gYXKSBaWFVtQVvRPLJcSgP0OjZUxSHTFvW
 rbrnlVs2S0U8uU7LOxEoP3x7I9o6nRz8tEEuIAEzlCh6dzOMbz6mhxe7fH9DRCgSpm
 2pCCXmB460gJrnuVj1pke8LKKbEBHFcKVqyQnLKJjSOa3gJNRDwxqsBdWgJaGCgmyV
 KjO3o6mxbPACw==
Message-ID: <66c4428b2129ee017133e9e2d6693295@kernel.org>
Date: Mon, 20 Oct 2025 07:29:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/atomic: WARN about missing acquire_ctx in
 drm_atomic_get_private_obj_state()
In-Reply-To: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
References: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, "Dan
 Carpenter" <dan.carpenter@linaro.org>, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
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

On Fri, 17 Oct 2025 19:33:26 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> The crtc/plane/connector counterparts of
> drm_atomic_get_private_obj_state() all WARN about a missing
> acquire_ctx. Do the same in drm_atomic_get_private_obj_state()
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
