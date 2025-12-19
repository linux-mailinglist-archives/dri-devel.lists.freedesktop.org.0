Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0CCD17BE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEC210F076;
	Fri, 19 Dec 2025 18:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tJmXhadt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB610F076
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 18:57:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 133831A22FB;
 Fri, 19 Dec 2025 18:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DAF676071D;
 Fri, 19 Dec 2025 18:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F03810AA97F3; Fri, 19 Dec 2025 19:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766170621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RmCTYOkLyMFlEpQTZJwkNePqb1kEiFRaGXXCzKCVgVI=;
 b=tJmXhadtAXW2id6tPw99/G0Yz57W4q+RW+QWfu1InNlZ4uwINdN049i3oscEQyEq6ArX5m
 Gl0de0nT/R+O8jKgGRKll6Y4JujykcbjIXDSEqr60mv/MQvc7vqtd4fjft82f5B8DhQsCj
 2Rcc+9awHC8DcBUBxfA46B4wPR/HbWbjXBhmphL+31SzkEtdmSVUEHWFF7bzzFDyE+4Sgk
 baFzjPT1vXyWk+Gnlm/SYIAYv+WlnsAGz/g6gczDJDnWq34lBQqEbHJ+xb+fITfyUg2tYg
 /HgLV5Kmn0f/SGJmLrUZy1bh25QmLEoA6uyuK8pQx8Cp0WcVbTsgvOp0UaJkRw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 19:56:58 +0100
Message-Id: <DF2F8CUZLGAW.ZFYSFQURBISD@bootlin.com>
Subject: Re: [PATCH RESEND v2 27/32] drm/vkms: Introduce configfs for
 connector EDID
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-27-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-27-a49a2d4cba26@bootlin.com>
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

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> Introduce new attributes to configure EDID of a connector:
> - edid_enable - chose if the connector will have an EDD or not
                                                      EDID

> - edid - raw edid content
>
> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
> x86), it should be sufficient for many tests. One possible evolution is
> using a ConfigFS blob to allow bigger EDID.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
