Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23865A0BF60
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBAC10E773;
	Mon, 13 Jan 2025 17:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Z2RDJfWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61110E768;
 Mon, 13 Jan 2025 17:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736790956; x=1737050156;
 bh=00oohxG2ENBD620y2NzHy9am+xwx4Uev5Yp6+OeKEoQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Z2RDJfWtzg9K5L08PeJ8rmJllJ1XjpfPJd6MfZKofo+Fcd2qHe1b3IeuHFaoaQc+Y
 zJdMumpV7cgV3m9d59BqjxU1vNPw3wJiEw5H5NyI+Fy5be+qtlKKTaEGGwZtLu8//v
 Ev9pSsNXpEXp43f9ayaEa2LLvjlH3698UKewxyqzBK5La7DElNcsyviUUXQPx3HwUf
 9FegyzdfSv79TX3hxENzbWdaM7yRAbpAmczpOvjYP9wOqqlAiu4kKBzJnanm3qo7vP
 NL6VjTEHE0sh+AsPII2mG7c/3azQBM+G/acnemmzXt8ZTFT8M0wAKM0znDbz7Ugsxv
 TbecYvLsOAFPg==
Date: Mon, 13 Jan 2025 17:55:50 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 11/45] drm/colorop: Add atomic state print for drm_colorop
Message-ID: <1zmGFMUcBfgfEUAEkLVnwzcj1RfRjRDxKySH440YYL_wFCch3KdHQwPSw88tmKpeRB4oqWElJOfnurOTR24hWLEG847ec4PNN5NsVPCKWYo=@emersion.fr>
In-Reply-To: <20241220043410.416867-12-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-12-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 9ac866638b5b58edfe72e9fd30ea44c0a0bb43cc
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

> +static void drm_atomic_colorop_print_state(struct drm_printer *p,
> +=09=09const struct drm_colorop_state *state)
> +{
> +=09struct drm_colorop *colorop =3D state->colorop;
> +
> +=09drm_printf(p, "colorop[%u]:\n", colorop->base.id);
> +=09drm_printf(p, "\ttype=3D%s\n", drm_get_colorop_type_name(colorop->typ=
e));
> +=09drm_printf(p, "\tbypass=3D%u\n", state->bypass);
> +=09drm_printf(p, "\tcurve_1d_type=3D%s\n", drm_get_colorop_curve_1d_type=
_name(state->curve_1d_type));

Could we only print this field if the type is 1D_CURVE?
