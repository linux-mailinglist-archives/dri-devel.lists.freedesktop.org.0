Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA1A43D97
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D410E641;
	Tue, 25 Feb 2025 11:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="AxteAyoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.protonmail.ch (mail-4018.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86ACF10E642
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1740482918; x=1740742118;
 bh=ZQXxRbGSbgaGwmvDUWTC+pRYlOBypLZ3GUVr0VwDJPI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=AxteAyoh1Ndq3clbbRBTUZ2xnHUSiouoadh0WlYouQSeOf5ulzIzm0T4wUrgQxY/g
 kt781UFS8xyyitbW88nxpR3babxwwqqXeAfFh4dld+4k/drUi6Pbq7t7UXieDNwJ7J
 qqx1iPQAEKe4Bd6tgAQ97tTI9BvcWCIYWhL/STi7MYm+K/gojiGL5J9QW1/2FNYFbZ
 OgHrda1tuDJAZx3rdSKVVjJHAb/VvUW1HeDdCNPSWvN6weJEnoE0Pgg9qll64eDppC
 3QHAzBAZbMHaM/24OKFAoWl3Wz3HRLFKkvc+qhKV4y7oBipj/yY7XH6HyRLfLDCIon
 JBtaeFIC31jLg==
Date: Tue, 25 Feb 2025 11:28:33 +0000
To: Louis Chauvet <louis.chauvet@bootlin.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com
Subject: Re: [V7 02/45] drm/vkms: Round fixp2int conversion in lerp_u16
Message-ID: <sumH-jMWxEB0ReC-xhqT2YbATq4l_TMfU2_ogO2tyM7iYG5Fp0XM7guLPCcUOuxW6uLW1YOoTNegOUOJVGiWYDxGaaGcXNjA5eZ8axRgl8E=@emersion.fr>
In-Reply-To: <99a8779c-bb1c-44fc-b8a3-56ea80425c15@bootlin.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-3-alex.hung@amd.com>
 <99a8779c-bb1c-44fc-b8a3-56ea80425c15@bootlin.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: cf61a1186044b1d7546ebd6adf0b44a16b7373c1
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

On Tuesday, February 25th, 2025 at 10:37, Louis Chauvet <louis.chauvet@boot=
lin.com> wrote:

> Can I extract this patch from the series and apply it on drm-misc-next?

That sounds completely fine by me, and TBH it sounds like it could even
be drm-misc-fixes material?

We need to be a bit careful when merging patches from the same series
via multiple trees. Maybe we'll merge the colorop stuff via the amd
tree? I don't remember the rules around trees, and I don't know if it
would be fine to merge the vkms changes in that tree as well. (I only
remember Simona recommending against merging via multiple trees, because
it's painful.)

If we can't merge the vkms changes via the amd tree, they will likely
need to wait for the amd tree to be merged back in drm-next?

If we merge some changes via drm-misc-next, then we won't be able to
merge the rest via amd, if the rest depends on these changes.

Simon
