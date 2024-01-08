Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D9F8269B1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67AD10E19F;
	Mon,  8 Jan 2024 08:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0210E19F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:43:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 09374B80CBA;
 Mon,  8 Jan 2024 08:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0939C433C7;
 Mon,  8 Jan 2024 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704703388;
 bh=ONpQpasH1EpF0QfzOoESnLV0nkK5pqZuGimeaXXRUdQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Co3ybWoLdthciXX1KfJQo7Y9LEEKlY9NMYTo0K/96S6v7axXEPg/SFyg6eYNZ5zYS
 qRE/aHZe7GKoKDKBrB5PkjrVRcaPqHzoGdSUQjYKhnv9OOodvdGRm3HWKa4BGLjUNn
 BctbmokG8z8Fd/Qmavkjgx7SX1Egq1ZpOMtu8cY67yXvHigiOt+RSur//+A5vobsNX
 b7wnzkVNG22GvMDqtAaSac1eOnDl27Lhwi8a4x1PoIW6AZuhiZ0pqoHThB+IfmPma1
 67xkvXp/kkZHrI/eKlHv1QqxzuGgbOs3IVmjdXyQ73Umgc2gWlVMOZBBlCOG9IVCFe
 E4LlyJhV0Mbcg==
Message-ID: <4a4b24fc85d28f08a9e2f6c84a72f4fa@kernel.org>
Date: Mon, 08 Jan 2024 08:43:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vc4: don't check if plane->state->fb == state->fb
In-Reply-To: <20240105175908.242000-1-mcanal@igalia.com>
References: <20240105175908.242000-1-mcanal@igalia.com>
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
Cc: kernel-dev@igalia.com, Dom Cobley <dom@raspberrypi.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Jan 2024 14:58:36 -0300, Ma=C3=ADra Canal wrote:
> Currently, when using non-blocking commits, we can see the following
> kernel warning:
>=20
> [  110.908514] ------------[ cut here ]------------
> [  110.908529] refcount_t: underflow; use-after-free.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
