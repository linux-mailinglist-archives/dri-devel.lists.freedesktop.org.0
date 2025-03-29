Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392DA756BC
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 15:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248210E257;
	Sat, 29 Mar 2025 14:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="hx/yoyZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch
 [79.135.106.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFC510E257;
 Sat, 29 Mar 2025 14:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743259030; x=1743518230;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=hx/yoyZpD0fFLC0LEoUqL1kVbWUYAlVHtKRNJiAjaoKp6nPduEYBX0Ebw5d/Czu0/
 d/3f52NYwL+XIIei4x/sXqDWzlwvxuF3D9LEuLHi2XeTBY180ddeMrpBY7bYlql9iG
 yeXWbSfm3sMH8p2vXMnxsKTWUUA/vXaPU+Z1iRWE4gxYW+K9w/Ae4UUu3C1rRovXba
 1/Hx6FXlQiAkyuR/8DFQByw+yAJ3HfLhju9z0LFCzOqDtyh4sK0EVxT5tOgOYmlGPA
 gcQke99VG8xjZLdHzckWP4DhW1gU41b85dI1BqAGqQhZMMpzZtnB30deV30m5WDwjQ
 5GCMxl3fUoZdQ==
Date: Sat, 29 Mar 2025 14:37:05 +0000
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
Subject: Re: [PATCH V8 11/43] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Message-ID: <yKCDBb-qsK7qRMuSSBgmsRSvVXvgqwx5FKp-uzTXjlP-drIUUvSJLZGiuE9ZbAR4Q5k15kZQ38gYLI2KwisI4yiW5sZFLDIVPtwdjIVY1JM=@emersion.fr>
In-Reply-To: <20250326234748.2982010-12-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-12-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 9e313b25b3470230dc6ff95fce226ab9f34b4a69
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
