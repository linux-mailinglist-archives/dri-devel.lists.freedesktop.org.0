Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F15A756DE
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 15:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7467110E289;
	Sat, 29 Mar 2025 14:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="rAAZmuGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 575 seconds by postgrey-1.36 at gabe;
 Sat, 29 Mar 2025 14:58:15 UTC
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2D610E289
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743259718; x=1743518918;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=rAAZmuGxqu419GCztwFx/cs2PuX6RlUR3VweuXBGgLE8/47FCkcr5uKAAITqi8hLG
 xoW9VOl3/5k6JGUYtJPhK/Bh+jd2f/CZV8O55OFWib3n01y6rrTDEQ4GXTG7d3u7mr
 W56xFyamkLxqEmWa3dmkDDOkoWiHqz9Z/Zyxse4zPJomwjRFkv7aeoIyl8JyfbxhBz
 x4VNinyc5CX0j6adCfZQRVpCvZhCNGMgWSA2PVd1VGMDZBEuBTXWEQi/+l8FFE6BVl
 sXlM/yHc1k6Jlm9lyRIiyvNm98ogwbmVo+ASCPjOGSXy5KyrSlSywSceHI610O7j5k
 SP730EhgykZxw==
Date: Sat, 29 Mar 2025 14:48:36 +0000
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
Subject: Re: [PATCH V8 28/43] drm/colorop: Add PQ 125 EOTF and its inverse
Message-ID: <_Yyvm1FTf4SaETjcDmCFOxoSr0oOyom0-HXF6P0yxjd1m_iaKIJcXLURx8jRsPkEbgjZEXG1LgP2yH-zXHyeM4yKT1ww-NSaORAVC-yIgAY=@emersion.fr>
In-Reply-To: <20250326234748.2982010-29-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-29-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: e60880b245023de10992c52b3cf430ddfd339231
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
