Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759ADA11B76
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BC510E51E;
	Wed, 15 Jan 2025 08:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="EyeLe8h2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B9710E515;
 Wed, 15 Jan 2025 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1736928259; x=1737187459;
 bh=Z5inlJxMurSHYB3t8b1zfq8d2EdlQvI9ZmCDh+UPX1k=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=EyeLe8h2MU7CzWUfpwvdiapl3ITKmY+Lr5fB0oUuNimyl7K79f78vTWG45L5379Ue
 FhOiswrjGEo9gmUOGWPopF9s5k9GEB1mvaNwJJZFbouLvmAmUJrMDhgpIpDQwoQjQ7
 oPjfYdv3051gqVPK4pxo5PiSinw1s6ejOiTHzEUGEqFRDEducdWmrFXFqNz7u4vmIW
 eByli6hNQQBN5ddWGwFIA1dWGbOPOxktHuIsI1BhTnnauXmUNGagOU/tWSZZlV8WWb
 KfmUZ8Q2NfbJBQWR6ToQsphJdoFNRXfhvyye3E2NoI59Oh4eHCNJdNTUwvshz9g3Hl
 Uzbhat/0je+Dw==
Date: Wed, 15 Jan 2025 08:04:16 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Message-ID: <VuB1bzC8-OmJkpsruFPIliNJDtjPACOabarfYceRZtyBwlToiOYx1ury1sjz3qa0FtHLUKR6z0m5tFVo-rkX_vL9g5XfIK7TiT-yMhKV8nQ=@emersion.fr>
In-Reply-To: <20241220043410.416867-32-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-32-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: e18ecf66cfad279fdac21232ace434d1efb63a31
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

> The BT.709 and BT.2020 OETFs are the same, the only difference
> being that the BT.2020 variant is defined with more precision
> for 10 and 12-bit per color encodings.

Just to make sure, the spec defines this precision, correct? It's
not an AMD-specific thing?

> Both are used as encoding functions for video content, and are
> therefore defined as OETF (opto-electronic transfer function)
> instead of as EOTF (electro-optical transfer function).

Ah, and IIRC the OETF is not the mathematical inverse of the EOTF,
right? So it makes sense to have separate entries for EOTF and OETF
and their mathematical inverses.

Again, I am no HDR expert.
