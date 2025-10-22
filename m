Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E0BFBC28
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C709F89561;
	Wed, 22 Oct 2025 12:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="u1/DgKoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9EF89561
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:02:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 050C54E4126C;
 Wed, 22 Oct 2025 12:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBAEA606DC;
 Wed, 22 Oct 2025 12:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2BCB102F23A9; 
 Wed, 22 Oct 2025 14:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761134536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pPxJMHRq1l2rmXPvs2hWIXztWS7OsJftqAuKJvbSq2A=;
 b=u1/DgKoOMDae0wpLByNIw1iXCHZaEPUH/CPq3mejkEtMKyQrMFrT3+OVkGCMBo98uaShXI
 PUnqmjvS6/BlHsHKS5jVQQQkFIvjetly+eQTvmIec7ksLPoTrTqUfd0K9XOofGgXIZqGQk
 ckNpX59vM0pr9vwH9qJAhwigxIAwTB78QFe/pAKMzYqFbLGZBYUA68BDyAj/1XIVX5usOw
 SxXJEUCaVIWmB1+O8ZGtKkFxBkYX3uih6/6RImgQTmHwVXkAerkZR447TEBoULV14m2DUM
 pe9MabgNRcGuAxwEY7J3tKYMJ16J3m/8iZtxeSHAJcqWnRwuz4pu04qjpBRAuA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: louis.chauvet@bootlin.com, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org, 
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH v7 00/16] drm/vkms: Add configfs support
Message-Id: <176113452848.3036504.515555677643836936.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 14:02:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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


On Thu, 16 Oct 2025 19:56:02 +0200, José Expósito wrote:
> This series allow to configure one or more VKMS instances without having
> to reload the driver using configfs.
> 
> The process of configuring a VKMS device is documented in "vkms.rst".
> 
> In addition, I created a CLI tool to easily control VKMS instances from the
> command line: vkmsctl [1].
> 
> [...]

Applied, thanks!

[01/16] drm/vkms: Expose device creation and destruction
        commit: 7965d1c5354a868063f61eb101f892480ede892f
[02/16] drm/vkms: Add and remove VKMS instances via configfs
        commit: 13fc9b9745cc5dbf38c4d559114cf98f8179b95f
[03/16] drm/vkms: Allow to configure multiple planes via configfs
        commit: 2f1734ba271bb98d582b02f72d77d1c7710a8d7a
[04/16] drm/vkms: Allow to configure the plane type via configfs
        commit: 187bc30625f3e0ee8d0b3694592c4b8ff771c845
[05/16] drm/vkms: Allow to configure multiple CRTCs via configfs
        commit: 3e4d5b30d2b262c6db84773cafe9097f7ec61ff5
[06/16] drm/vkms: Allow to configure CRTC writeback support via configfs
        commit: ee5c2c7d4bb6998ff11778436acbdc3154ce74ef
[07/16] drm/vkms: Allow to attach planes and CRTCs via configfs
        commit: 95fa73787a7947a8fdfbb1ad310c3f11b26065d3
[08/16] drm/vkms: Allow to configure multiple encoders via configfs
        commit: 67d8cf92e13ec05e64745ae7b63545de5d8e867a
[09/16] drm/vkms: Allow to attach encoders and CRTCs via configfs
        commit: fad1138b2377aa094b1c80fad852eadbcf3a85c3
[10/16] drm/vkms: Allow to configure multiple connectors via configfs
        commit: 272acbca96a3c6f43414e10d433befe2bb906d7c
[11/16] drm/vkms: Allow to attach connectors and encoders via configfs
        commit: 64229b846a7e5b54cc076092475280888f74c92c
[12/16] drm/vkms: Allow to configure the default device creation
        commit: 8c29107a6119289b57d2a80a9db849c4bda66a74
[13/16] drm/vkms: Remove completed task from the TODO list
        commit: 085dadb3101d7c37d8296580c946f5f1a2153628
[14/16] drm/vkms: Allow to configure connector status
        commit: 6f00987f5ce39bfbc01af7230d3939149b006f74
[15/16] drm/vkms: Allow to update the connector status
        commit: 466f43885ac0b75efe8107d82f7c60d7daf64f54
[16/16] drm/vkms: Allow to configure connector status via configfs
        commit: f97180f094aed00bae9776f00ae61c7c020b4d79

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

