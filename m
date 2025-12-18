Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC6CCD0B8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 18:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200710E42E;
	Thu, 18 Dec 2025 17:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iGr7Y3CC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6C510E42E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:57:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4FD24C1A5B6;
 Thu, 18 Dec 2025 17:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E891060715;
 Thu, 18 Dec 2025 17:57:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A06F102F0B52; Thu, 18 Dec 2025 18:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766080624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hfjPTiTj6ZdkdYZGnVitsFcTdohCcb99bmn8EmWvop0=;
 b=iGr7Y3CCTTFBm/bhBysKQve3LHUeC7y/VgDirxYytfGX4AXbl6i8cTDxhCKsF4wjwZ2TFS
 JB1fSRt+HU3g37xej4RKT+P1nqpveMTFOVcmDGh3P6BWvkRtocUd6+cLWS4NJpS63GerVL
 OG1PRISe5uDFSXpEP5qil4QBERSgXoIyVtxVdNr/Fwkw9CGzkfYrQEkekGgbmpdVpf1DTI
 sb8WVSRvROtnL+EbSrKN5eXyZXTvxcrJ1WOeWJg6/A8wfqHyBt5RDo9rGS+4U7YP51t4WH
 ORfKwhr5n6R4Cmrh7IkkfbYxmYUusDkce0/e2+bLtx+ft/TwxOgbQv21QJN2Ag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:57:00 +0100
Message-Id: <DF1JBWO8RNUD.MJHWQYKGNU2P@bootlin.com>
Subject: Re: [PATCH RESEND v2 03/32] drm/vkms: Use enabled/disabled instead
 of 1/0 for debug
Cc: "Haneen Mohammed" <hamohammed.sa@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Melissa Wen" <melissa.srw@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, "Louis
 Chauvet" <louis.chauvet@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>
 <aRXmghF0m0ypbQMs@fedora>
In-Reply-To: <aRXmghF0m0ypbQMs@fedora>
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

On Thu Nov 13, 2025 at 3:09 PM CET, Jos=C3=A9 Exp=C3=B3sito wrote:
> On Wed, Oct 29, 2025 at 03:36:40PM +0100, Louis Chauvet wrote:
>> Debug information are mainly read by human, so display human
>> readable values.
>
> Today I learned. I wasn't aware of those helpers, nice!

Me too! :-)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
