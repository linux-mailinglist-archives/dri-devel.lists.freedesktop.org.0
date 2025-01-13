Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BFA0BFBB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 19:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0B10E085;
	Mon, 13 Jan 2025 18:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="djH4Vcaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1999 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 18:23:23 UTC
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F3910E07F;
 Mon, 13 Jan 2025 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736792602; x=1737051802;
 bh=N/vuTYAMgwItZ38XD28tjmHIGa2c176dnzKIH0kQz+Q=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=djH4VcawAZXKu2lUJtW6WCrrOywuGPB/zS3iHnG43qeE5QPejIxjuREqTlTMb/4hH
 sBWkVj4sCUow5Vr8R3dDrXmu76TY9e/Tto1Rli0SbKTQ3r6hu/6kmWWy6b80s7pl+h
 +ft/KumBcBeCKjhFAyLP1WythIo6qH+zayKx7PEHn5T53C/7WKOE1gzyr0FRbFxL5N
 5HvDp+aZstpLEwKyua8uMG/52RKSy95wxBPVu8umwOPmXeKeo3jC1C+AoSLgS7usF0
 QqZFbx2aUog3d8dKe3I6w51aStR01GBiPLLkvTIs+ykWUvh6ZSbX7Oiz0YAUUCPTRI
 GgAXhuNVL0X0Q==
Date: Mon, 13 Jan 2025 18:23:18 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 13/45] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Message-ID: <AJXss1OmMMC2tqJmFXzUC-YCESFw4ncGj-sEh-B1LuuDnPL-0hOQ3kSSM5DtkYvFv8bHRpMxguAInlYiw8AdkstU_jZVp0ly_EGq0P_m37M=@emersion.fr>
In-Reply-To: <20241220043410.416867-14-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-14-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 6127e2e54c2bbe06b7d22142f86435b148d097c5
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

> v4:
>  - Don't block setting of COLOR_RANGE and COLOR_ENCODING
>    when client cap is set

Can you remind me why these should not be blocked?

We should also add doc comments in the color_range and color_encoding field=
s,
to document that drivers should ignore these fields when the cap is set.
