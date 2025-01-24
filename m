Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F6BA1B15A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B365710E2B9;
	Fri, 24 Jan 2025 08:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Jl1niQVd";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YEg77N0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62010E2B9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1737706113; x=1769242113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ee9Z73nJiEodTFyA1UeYjGLWrpWYwOH4Re+VXBTC4b0=;
 b=Jl1niQVdCVYQlh7vjQ5vQ3jjjg4XOOoHqECAbnyF4RPpGWKDKDsWdLTT
 H+Xdm6KoU1Lu9OHZELhB4TFqGbxg14y/21h15K9mhnH2syXFRJO+Sd+gI
 3IjVu402Z61bxbTpMJ0GGWBY6gdFV+8+Ta6N/qD4MxHnM8TyPzLv4plwE
 ABr8qiUAylrFoO9ktuFYYNEavDHLtxNeZz40VPfGoEeYe2w96XkCLHhdG
 uhbkMtNH6x8l8yjSY53F23BuPZonQ0Mazp7MUezIz487ZCAufdyNmeSEs
 ft5WfaKOgYPSJMNAhLvkZq3odSElQa6wtJPFhTmzOVDBovJm5+zyAWQco A==;
X-CSE-ConnectionGUID: DTkRPhDpQiyHzbwpUzhMxg==
X-CSE-MsgGUID: +eRVUqSeTiqHGnLh7d/akw==
X-IronPort-AV: E=Sophos;i="6.13,230,1732575600"; d="scan'208";a="41263769"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jan 2025 09:08:31 +0100
X-CheckPoint: {67934A7F-23-1D00F64B-E6C57517}
X-MAIL-CPID: F2C97A19665B5576AEBF5D6B532EA834_3
X-Control-Analysis: str=0001.0A682F24.67934A7F.00A2, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F3A3167C60; Fri, 24 Jan 2025 09:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1737706107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ee9Z73nJiEodTFyA1UeYjGLWrpWYwOH4Re+VXBTC4b0=;
 b=YEg77N0wRb/EYKr/TQD/J3wA+0c3ZpfavphDxkmI2D3MmV3wMKQdiyhzoH45dLIS0WxSAr
 du9T0zaQ783BeqPMvFBzRh9K4UmQx8vClRKQZRPdEcrhjm0HqYZP8Xyw9+ZpyL+y3EEjhX
 DPbC3qKoNWXUMb+iCGIIlOV3VftRCq3j9B6ml2OYWLqCwMdF2pb/Km9QtYKyuwAtJHQS2D
 NY+zxNayGP69VqM8zF6oUPBb6ho3e643P+xeqbFxtUkyV1SrOZRLJG4Mw6v3NA+NQGDr2p
 S04EH5hmg1m3GUFRYBnnG1KjrS/FxbV2xkn+0yITydib3gjH6io9jdIZyxiifw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 sjakhade@cadence.com, jsarha@ti.com, mripard@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: amishin@t-argos.ru, jani.nikula@intel.com, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, devarsht@ti.com,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
Date: Fri, 24 Jan 2025 09:08:21 +0100
Message-ID: <9431081.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com>
References: <20250116111636.157641-1-j-choudhary@ti.com>
 <e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Donnerstag, 23. Januar 2025, 17:20:34 CET schrieb Tomi Valkeinen:
> Hi,
>=20
> On 16/01/2025 13:16, Jayesh Choudhary wrote:
> > For the cases we have DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
>=20
> Any idea if any other platform than K3 is using this driver? tidss=20
> supports DRM_BRIDGE_ATTACH_NO_CONNECTOR, so if K3 is the only user, we=20
> could drop the legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR case. Which would=20
> remove quite a bit of code, I think, and make the driver a bit more easy=
=20
> to understand (although I think it could use a major cleanup...).

=46YI: Not directly using it, but patch series [1] is at least touching
this file.

Best regards,
Alexander

[1] https://lore.kernel.org/all/cover.1734340233.git.Sandor.yu@nxp.com/

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


