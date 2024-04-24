Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754768B0EF5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8510E7B6;
	Wed, 24 Apr 2024 15:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Mnqevzsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6410E7B6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1713973708; x=1714232908;
 bh=qntz7NEjy8Uw3byQss/GlXZ/zSHWpTQdt6m+O4Psisk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MnqevzsqWAciiCfZ6wlVJGF7a9yA6Wl+cSleolKMiC22oMhkL51yYrWJl+tr7crmW
 NIhiQErq2/xkqhdOOTQ2CVBo57XcReAPVLnGr0axa7tnOnA3vD6nRHs/PNindrNjvH
 ttQrFvH3fQ+7924UF3Npv4pRcvbohrStm9TFkVrsDoPma5rJLIPeVP6urA/7z2BP1V
 muygRxJg1/cSAQBXH65hC+pamt3CuQ5krKgo/mrzaAcd1JiktjHTg4r257iE3ejIiH
 TKoIjMqYYNu57dpWvUAvOheFq4T0q2L5K5EVeyIogRjUj/kaYNlRZ78x1GErZTkbnp
 CcSxaxT0taFrw==
Date: Wed, 24 Apr 2024 15:48:24 +0000
To: Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Joshua Ashton <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] drm/uapi: Move drm_color_ctm_3x4 out from drm_mode.h
Message-ID: <mB2sQaqlBgdsUPAXqWyd03aZAS8h1JKTff3_efNWi5uTEnwBWzIuRSEL72CUCohJ06bEzN9n5jvVzB4rApwfSB1fxwQWDBri4RZ9oSujNlg=@emersion.fr>
In-Reply-To: <20240422085857.17651-1-ville.syrjala@linux.intel.com>
References: <20240422085857.17651-1-ville.syrjala@linux.intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: faeb2fd5a3e7037615a0e5ff82a689c9a7dc9fe5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Monday, April 22nd, 2024 at 10:58, Ville Syrjala <ville.syrjala@linux.in=
tel.com> wrote:

> drm_color_ctm_3x4 is some undocumented amgdpu private
> uapi and thus has no business being in drm_mode.h.
> At least move it to some amdgpu specific header, albeit
> with the wrong namespace as maybe something somewhere
> is using this already?

If something somewhere is using this already, I don't think the name
matters? In other words, if there is a user, such user would be broken
when moving the declaration anyways, so it shouldn't be more risky to
do the rename as well?

I'm holding off the libdrm header update until we find a solution.
