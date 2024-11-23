Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F19D68A9
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 11:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B4C10E1F1;
	Sat, 23 Nov 2024 10:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mdPpTT2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA03B10E1F1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 10:45:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AC7B240007;
 Sat, 23 Nov 2024 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732358743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aYdiCI79UAXlQ4Q5feHcWKcAp8LcgfO+BRF/bN8ehU=;
 b=mdPpTT2KzWRZfjlzeQyozkoNx0HEC6qC4lWHgfPoyGNTQIJiboFPBFTVrp4GIRjS7znwQV
 5xgxPIxA5z3p5XKXDuyKe0y3rB9dqHJ/2GdABrM+iGTB5CGi08jxf8Gg3UFAnznDXi4ncy
 h6SSabj8IPt2zCMacDrXtz2Nzc1hwzQzg9DdGgDTvd9IjtzFdeKn9lgNCEGCvIoJm4cWgV
 ZrEsc7+Fu6LVxnyTbq8osqC7U8cpXSdsHzIX9Zzs6YkU/82Fs82VxGANEDLDkfdBLlfJr5
 dE313YgdjLCQ8SrB1XgaGETaVdtI56kUqsZ48oOC+9molfvnaWLvnIJqHeS6bA==
Date: Sat, 23 Nov 2024 10:45:42 +0000
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: dri-devel@lists.freedesktop.org, Ian Forbes <ian.forbes@broadcom.com>
CC: =?ISO-8859-1?Q?Ma=EDra_Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_v2_17/18=5D_drm/vkms=3A_?=
 =?US-ASCII?Q?Introduce_config_for_connector_EDID?=
In-Reply-To: <CAO6MGtiYbPZvL=2ycHb50ATaikUg+mR8xRcxGLyme7FcCTkDpg@mail.gmail.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
 <20241122-google-remove-crtc-index-from-parameter-v2-17-81540742535a@bootlin.com>
 <CAO6MGtiYbPZvL=2ycHb50ATaikUg+mR8xRcxGLyme7FcCTkDpg@mail.gmail.com>
Message-ID: <277AB18F-2DCF-46C0-92EE-7519196CDF60@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 22 novembre 2024 21:28:00 UTC, Ian Forbes <ian=2Eforbes@broadcom=2Ecom>=
 a =C3=A9crit=C2=A0:
>I didn't see a `drm_connector_attach_edid_property` call in this
>series=2E Did you forget this? Virtual connectors don't have this
>property by default=2E

Hello Ian,

You are right; I did not call this function=2E As mainly tested with the D=
P connector type, I never had any issue=2E I need to check if calling `drm_=
edid_connector_update` fails if the EDID property does not exist=2E

Thanks,
Louis Chauvet

>Ian,
