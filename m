Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E8A756D9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 15:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C901610E275;
	Sat, 29 Mar 2025 14:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="YNkn4w94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721310E275
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743260120; x=1743519320;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=YNkn4w94Z6aRReUovXVftYB5CCupKkxjCiU91wnsyHRgIHn1ZZtt27GucW5Lrymy/
 qVSa1+s3KQsRcnhmBnlVthmkCmaEg+l6CPF9tAlfpOjgcsCZdvSCdT0XoiRQblY3qc
 0bgmBtsj/oPDDwK5HAIe7D933OCwFXnvYxAi3BjOSmlH8wwyNQZ85mIUP82uw3ASKY
 04mjSbu/y9ooGNdmbDleOKpPQWcpF+QBpPdDp5FEMLN2YnIGg+j+0s2tNtdj1ADdZs
 dU0IMhOFC9s8CxwnP2yqxrUqyKljy/kxUm5OlOKFkaacMJj71p+OfYFtP/Pz1h7Jtb
 SZ7sVP1wuvMRQ==
Date: Sat, 29 Mar 2025 14:55:16 +0000
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
Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <j1-AeCci4JRhG2yr3xmRvMWGCHruvIf9aKX3fcirtJVleSQVbwyboGfCXRD0w8-WRM4Dc5h3GMu-Kw83d7wHBASg0HQnW8WQWh-_bGN87h8=@emersion.fr>
In-Reply-To: <20250326234748.2982010-33-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: d79ff0c43d08b2fa798213c8c2cece33da525524
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
