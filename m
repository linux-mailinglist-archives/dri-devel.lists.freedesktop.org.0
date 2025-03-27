Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE4A74184
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 00:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B228510E18C;
	Thu, 27 Mar 2025 23:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="vp9kG+uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8025110E18C;
 Thu, 27 Mar 2025 23:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743118187; x=1743377387;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=vp9kG+uUY6Ix3vr/xhgweQVTTYAZ/fDbxLqsA3HIRUzGfSvWIuD0taR03d2srUygc
 PIANVaRI5LlBOJi2XqVeRvT8LI3ah5E+iIO+tgsR52j42KTCuAk3FjmOdoOpNb9b7f
 l3IbdAQBhJ6GjIP2o9hqKPOEweDTr8gc9PhJ3TApI/683Zh3r7+e2UFwiPmtEfbR74
 DiyrbIJw3W6wiuShsccEEkFsUA8tzgC+EF4S/6wZXz/vHyDGz4WQYcQrmVYBmIHGQU
 g/8dMdFbumuu9LBn3HlvQM7yRdhWwV9Vk9jlUIq9fyaZBSxwF+tlcWLFAsuAFgL+z0
 NqZDdFKJbu6eQ==
Date: Thu, 27 Mar 2025 23:29:44 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 09/43] drm/colorop: Add atomic state print for
 drm_colorop
Message-ID: <Q-rAxY2lb3kDx0w098vK26UTq1OGtxV7haK6H4E6BzCf_g2QvSPP4e_tMKBOCC--MEBsdl-cNqzwaLO1DBQk1R50wT9dNZcygBYhI3t9Ves=@emersion.fr>
In-Reply-To: <20250326234748.2982010-10-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-10-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b863460bc8e659bca0c34befe189d1067e7dd521
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

Reviewed-by: Simon Ser <contact@emersion.fr>
