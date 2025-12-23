Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB96CD8CDF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 11:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F139210E1AC;
	Tue, 23 Dec 2025 10:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="H82h4AMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76D10E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 10:31:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 370624E41D50;
 Tue, 23 Dec 2025 10:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0961960716;
 Tue, 23 Dec 2025 10:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D8B710AB0177; Tue, 23 Dec 2025 11:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766485860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2g1qXDZ8qC3enLzm06mnRisnivOXR8McVYT5wHnULDs=;
 b=H82h4AMtc0zK44p1jGc1xgNRn5y90UO5mxI+/c87p5QzL/7GYKg84lCFGfjsvZAYVIzYJD
 N9MvxKpw3LRKsIdQSX09aDRiG+96oDTA43UIKnTZaIoSvmRRVGx2nIs27whksDUIU6+z4m
 MGl5pGBkIsqcLZOqisCIpLELjP1scG4WDvpbDQjGeDu53Obc42fx4wz7Vl9zM8B17Dbz6N
 YIRj+zepv1o+CIIF4D9Jvef5ivuWSA5CY9Fval1igrBz6ZEBs7O2edIgY17T1re3Yx7a+d
 DvnE9nucheG4IYP1FkvvblSA7a6AYNPyGm49xdVCVLz0PVrtiiAP2/fQf2bbgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 11:30:54 +0100
Message-Id: <DF5IZ2FTYT6J.1AEBT9D30GZYM@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 00/33] VKMS: Introduce multiple configFS attributes
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
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

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> VKMS have a wide range of options. The aim of this series is to introduce
> many configfs attribute so VKMS can be used to test a wide range of
> configurations.
>
> PATCH 1,7,10,13,23 are to expose human readable strings from drm core
> PATCH 2-4 are to expose human readable plane type in debugfs
> PATCH 5,6 plane attribute
> PATCH 8,9 plane rotation
> PATCH 11,12 plane color encoding
> PATCH 14,15 plane color range
> PATCH 16,17 plane format
> PATCH 18 properly use zpos
> PATCH 19,20 plane zpos
> PATCH 21,22 connector type
> PATCH 24,25 connector supported colorspace
> PATCH 26,27 connector EDID
> PATCH 28,29 preparatory work for dynamic connectors
> PATCH 30,31 dynamic connectors
>
> PS: Each pair of config/configfs patch are independant. I could
> technically create =E2=89=8810 different series, but there will be a lot =
of
> (trivial) conflicts between them. I will be happy to reordoer, split and
> partially apply this series to help the review process.
>
> PS2: I will apply the patches 1..5 after my holidays, they are reviewed
> twice.

Be careful: as of now, patch 1 is not reviewed (it's new in v3) and patch 2
is reviewed once. I'm going to review this series however, so the count
will hopefully change soon. :)

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
