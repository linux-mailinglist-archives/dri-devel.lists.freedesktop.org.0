Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404755713A9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F2218ACE5;
	Tue, 12 Jul 2022 07:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8E18ACE5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:58:07 +0000 (UTC)
Date: Tue, 12 Jul 2022 07:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1657612684; x=1657871884;
 bh=qMP2jhF/K5broDheRcU+BA/IfQaOFC/DIVl6e67nksQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=Hepi0+XwNssLLWvw4kF+vf6AnpFe3t9VHd8SKNue9eq5naM8d1CL0Jz9fdpm5GOFL
 /UFZd/BwznMKOmxdcNc5Si7bhHGYFkyNlLUa1I5Xn/qBa9uYkCu6aBojmpU9f4NJr2
 P4Npjm6DcSupVR1lTBrQYSjPFyKQFyxEgUNAChUHPFR+cyQo9LEeaIw2frT4U7Ijpi
 nMFN1P3aMN937FZ1+sHmUQja1TSDsQVS4PchmxZarpoItlCtSsWEQ1pVdyeLH5qoYR
 4eesih0adQvHpNwOaHPgAPeJfN4RcUai3oK5bI++KGteyuekywf74UGy/2TV6JBcFw
 XHbrj3K0fVSVA==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 8/8] drm: Introduce
 DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
Message-ID: <V4npQW70lq2fmFQCS45Pi5za4dAIHAcKN3ph0n29v3VDeGIre_VtIQme28j6SyRSSZoYC8FYDfkeuY94iRWiP6qy1XzUrx1s9UTEXj7LAW8=@emersion.fr>
In-Reply-To: <20220712033246.1148476-9-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-9-zack@kde.org>
Feedback-ID: 1358184:user:proton
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, July 12th, 2022 at 05:32, Zack Rusin <zack@kde.org> wrote:

> To do that introduce DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE

Nit: maybe we can name this "DRM_CLIENT_CAP_VIRTUAL_CURSOR_PLANE" or
even "DRM_CLIENT_CAP_VIRTUAL_CURSORS", since "CAP" already implies that
this is a capability that the DRM client supports.
