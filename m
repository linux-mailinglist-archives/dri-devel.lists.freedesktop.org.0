Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90FCCD0FD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAAA10EA3F;
	Thu, 18 Dec 2025 17:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TeOMwZeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732BA10EA3F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:59:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 582064E41C92;
 Thu, 18 Dec 2025 17:59:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2552460715;
 Thu, 18 Dec 2025 17:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CFAB8102F0B31; Thu, 18 Dec 2025 18:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766080785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JcRJBYdg+mMo2FaDW2kt8JpqFPY0us9vM839n1+cKd8=;
 b=TeOMwZeK1kU8ygOCUEV63INU3k0t3WOJILyiYt/KIK4NtANP7fqfSxKmnbD1Dmz1iLuKxW
 qHRzmtdZFjqw2fYeEdOPEFRqA6aFDjOWB87egArVMstv1cv5iqqsvdJspV9qZI0H6p949w
 iLxtEKr/1F8Bv2MbZth1AvtthlVs2OH6aP3eMslxbaqrQ+6w9Jy6QF8cOnfd3ndQ4PJyUu
 pR73Yfpy+aOCFQlcea6VlZ0NtG55i76W42CBywmAlhUynoxojP8Te71pt21bGzH7szMzLo
 HH2DhaGOgonlW7+hJiHjz527wUcuBJaG7Qddx4Wle2JGeRyxM27bo55oq5M/vg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:43 +0100
Message-Id: <DF1JDZFKRUY7.1X2VH3FB9B1AD@bootlin.com>
Subject: Re: [PATCH RESEND v2 13/32] drm/drm_color_mgmt: Expose
 drm_get_color_range_name
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
 <20251029-vkms-all-config-v2-13-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-13-a49a2d4cba26@bootlin.com>
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

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> drm_get_color_range_name can be useful to print debugging information.
> Export it so it could be used from VKMS.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
