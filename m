Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D11191CE3B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA5B10E05C;
	Sat, 29 Jun 2024 17:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="mCcyH6DR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D6410E05C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1719680719; x=1719939919;
 bh=tft2Nf6iGn4XIjB4HEC7J+CNAzFuU3OF093lxc9Y1fY=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=mCcyH6DRiyP0W2GZlWrg8XR5Ls5DfAz+My//zM13B+MhMfUAaAET9YY17Lves9YuX
 3cjRly/vAn1vnDPeqt+3dxvoVB+C1GW4Qb5L4KXluQkB8yUV/veJZa1TE98QdA/oYB
 Q2Hc1Ky84XdcZdAUtkLpXUbNgZmvwEu4gga172gbOoaZ7xn8449Rw2ZB/jzhfXOTOo
 sPwpQNwtYruKNb80ii+W3E1SA+KdQFL7F2YPk9sfYKRVbETbvIGP5NUQLUJufXJaiu
 1IPpPePAJ3I5NYR02MIRR7ll/oq2mOY2RNN9Gbu6rzr//TXTVXfGIsFwvU5R94Cfye
 edpdgWagl/NEA==
Date: Sat, 29 Jun 2024 17:05:16 +0000
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: AMD GFX12 modifiers
Message-ID: <vahBbQHXGpyFcIwzIVTPHRnphiAma3_wNbTftk7O3I6gN4gToIj3zIJrIkO263Ly61q2HArlyB1lvyKM1FFyqkqAdLH195Y41xK8GWL4ZBg=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: c974146c6cc03a98bbc91c23a6e3d14cf48bc4ce
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

Hi all!

In 7ceb94e87bff ("drm/amd: Add gfx12 swizzle mode defs"), some
definitions were added for GFX12 modifiers. However I'm not quite sure
I understand how these work.

Tile values seem to not be in the same namespace as GFX9 through GFX11,
is that correct? In other words, can GFX9 ~ GFX11 modifiers be used with
GFX12, or are these mutually exclusive?

AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK has a comment explaining
the 3 possible values, is there a reason why #defines are missing for
these values?

The comment lists a lot more swizzle modes than just 64K_2D and 256K_2D,
any reason why the rest are missing (at least for the 2D ones)?

Could you explain how the new GFX12 modifiers work?

Would it be possible to update the comment on top of #define AMD_FMT_MOD
to reflect the GFX12 updates?

Thanks,

Simon
