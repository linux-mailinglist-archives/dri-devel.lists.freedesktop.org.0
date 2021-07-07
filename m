Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A393BEA4F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4042D6E190;
	Wed,  7 Jul 2021 15:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637276E193
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 15:05:20 +0000 (UTC)
Date: Wed, 07 Jul 2021 15:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1625670317;
 bh=rZAPUdAYpWrluzUYeNpUT2MZcVIIb1mgZTtYpre2bl4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NQvPeNUcOT8PPyld4n5saLgskJfEZvUk1zw2DU/RfCLnuhVrc0c44YCoId5Q895bo
 jJTLIwCU3nPIye/e8KJos+p/AX0xJoKzU1rvQcajXZL46JM+8dLrhmuknzilDWGvoG
 dgW2RyaOA8yRpVHQ3NCRPQB0NS4U0hhwmffoCXioe01mo4RiKme1c8aHLNBW1TX8Wx
 IfkQfrM9U1sCRHXuXQXSE2vqS2TltNEQFqAzhMOfgsrIWhjdDlyQedL4hGR2FDBXGS
 1dy2TYBi5vVh+jHHOQGSvd+IVeWSTrHZmfD761Aka3OkDXNblB51j80kS6WIgrKMpJ
 jKFdjltflZK1w==
To: Lee Shawn C <shawn.c.lee@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/dp: follow DP link CTS spec to read link status back
Message-ID: <j5Uvw-gNT4Egur_E6SsYoqn09GYXBESdyvFJ7GTdVjIbEQcnysdO4wJtgcsQk_u-lHzyQtQjY6-Ahz66UaQFaaw2ZWZPxkZMzMwMaP5YEr0=@emersion.fr>
In-Reply-To: <20210707150042.6376-1-shawn.c.lee@intel.com>
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: Jani Nikula <jani.nikula@intel.com>, Cooper Chiou <cooper.chiou@intel.com>,
 William Tseng <william.tseng@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +=09=09=09=09       DP_LINK_STATUS_SIZE + 2);

Suggestion: use sizeof(full_link_stat) here instead to avoid this
getting out-of-sync with the real array size?
