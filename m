Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801EA1997D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 21:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D6E10E750;
	Wed, 22 Jan 2025 20:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="pdcvE14s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BD610E750;
 Wed, 22 Jan 2025 20:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737576329; x=1737835529;
 bh=aOltVRCRIbGGZDP3YC9ExIFQ+TYQ++Xv+LEXjB/fIHQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=pdcvE14scXTsHJohleFuYDu4vo2QnIo4D6BkCMcrlOAPhGWraVXgHFA4+bAmJeDCw
 BLAYHfhggcdtpKPi0FaYJ5C022JfgD3cmIvxYxdB+GJd6HeoeLTXghVTHFSXzn5Djl
 Khh0R2Q/dKFIxJVsOl3xOa7e5BXghBeKfdseOv5HJsuFctVwAhInebE6yaUp4ddaiH
 dcdl4jGd3lHyN9OPjHeyOgSaQqPffEF6++sSgbifmaB2Z7tCIZQFbfLMcmlCxN7bmP
 JVcLx2SzBP2JSTt75OYbvpgnP8O9+pAW0179vGSvMoLzhjsIoyd/OUx6yrbnKElYEs
 5LcUThSvTSYUQ==
Date: Wed, 22 Jan 2025 20:05:26 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 13/45] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Message-ID: <de8sNlfu5pHPq6-I3AM-2ac7K5roGJ4YSveKaMoa6VirdarNanUSrICpZDqZVaRTdDE1AumfIiTskD2587KZhi0Y_Pvd5tPH-B9oUfXpf0g=@emersion.fr>
In-Reply-To: <d4920377-eb29-447c-97c7-be14f3484e57@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-14-alex.hung@amd.com>
 <AJXss1OmMMC2tqJmFXzUC-YCESFw4ncGj-sEh-B1LuuDnPL-0hOQ3kSSM5DtkYvFv8bHRpMxguAInlYiw8AdkstU_jZVp0ly_EGq0P_m37M=@emersion.fr>
 <d4920377-eb29-447c-97c7-be14f3484e57@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: a69f989121b1fb7ad8f0d1784b20754e984eb3fe
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

On Wednesday, January 22nd, 2025 at 20:48, Harry Wentland <harry.wentland@a=
md.com> wrote:

> On 2025-01-13 13:23, Simon Ser wrote:
>=20
> > > v4:
> > > - Don't block setting of COLOR_RANGE and COLOR_ENCODING
> > > when client cap is set
> >=20
> > Can you remind me why these should not be blocked?
>=20
> I initially blocked setting these when the client cap was set
> but that caused some IGT tests to blow up and then laziness
> won out.
>=20
> I had another stab at it and it looks pretty simple to fix
> IGT. Will prep an update that blocks setting these when the
> cap is set.

Cool, thank you!
