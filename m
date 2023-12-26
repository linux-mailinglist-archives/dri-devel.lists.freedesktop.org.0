Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6027981E6A1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 10:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCB110E047;
	Tue, 26 Dec 2023 09:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 453 seconds by postgrey-1.36 at gabe;
 Tue, 26 Dec 2023 09:46:13 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CADA10E047
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1703583972; x=1704188772; i=markus.elfring@web.de;
 bh=QEIlNohXQKR5iUvYT2jHXT8Fr7MmOczXQbaPuHwZhWk=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
 In-Reply-To;
 b=pvcFW2mSCuF9ILmVdyqf6/ZIfF1Bp2YMWUbFJWC8n8qKBghjohi1ewToaw2FNfho
 RXFPOFbbYkkSPmDrA+gXoxL/6cd9lMkum72kjN3Qb1X3Jd24E6u0g+Y7ClX7fyZuy
 f4/EPpSSPLLjQVxd04k1jQdGmcdbE4trWWWSySHNbxbzEKSwsd1mIccq7O9u+EjC+
 efYrmeZzz+xL5AOF1l41iPssOiy6a8/dmmVkLir24OweADtB8ePluMHQD3zRRZye2
 ybYlPJRwEkcOvxlg1knD78DZ9NbaWxuDPhi+cLyb01furt/4Q8+lJMqXeJM47zW0m
 GNVcnbyl59iC9WqUMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIc7b-1rWeFb0x1B-00EoEL; Tue, 26
 Dec 2023 10:40:50 +0100
Message-ID: <7c6a919c-3757-42af-aee4-3d48721d1959@web.de>
Date: Tue, 26 Dec 2023 10:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] drm: property: Delete an unnecessary initialisation in
 drm_property_create()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
In-Reply-To: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gHRM60fhbiROJai12btJyLRtTcOd7dO9E0nCoV0k4kI2NBX1xi4
 7CaFJ2MqRCS3EHB4tsGMJ4lf3o0qYjBCYPC9yunWXgxZ3RwuHNqmmHStQSXiziC5JQgrldI
 ntssKn3BLAuw3gvZFt3VmkSKemER4GRqnCxY9LZAJ8nLgChA9FZg7Mxxa09u5/yszpHqJzr
 JakSRCxwcYASditzdkqtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gljqOLCqXLQ=;x20GOpeX3B3G3AqjdqQaLRQZ73j
 QC2lXrWqsKXfu3EimjtFIR0i7TOZUjzioUhMyJUs5VXm965UaM0W+0beqgTmFh9tF2Z5gXGfd
 Im4misHfGHueJI3UHmvo/y7bNo66Mv/DUQC+6gO1p2dx7ArmZXjlTyZlANNe2jmDg5M0y74qf
 dSzH0kIRyC8GHNLgPQKrpqkyLJAQ6Eyiai/WygZzL4se4ayeQStH8upoDxtsP0GDgzyep88nC
 Qs8m/jXVpeTkaQBwmFCUQv0i6UsrUx+URTRSJvLC9HoYDL2Ug6Vr2t4D9BrYjhmxJtOnfJ4Mn
 yKC1fjr8VPu4vT7/+7pxBXJ7fKZaVxm+Aw1jC9Ferk6Rn5A1V/gOglnuCsTjwT0RT7fnXEGou
 QGQOPxV7is8+RV8vcpOD3mMiVQzjU24vx92vFD09JmXl1vyffBEvKOQACteWDeWbp+0o50t2W
 xNuY9XAjmzLo41R/TZYvd1qUVPOBr0JR4gvxVpS1gA5IXf3xWikrvKAaGADku3T3+/GsqAp7z
 Qn/zMB9LXmgNItXL+dcFxG66JH5ZD0lYR3ZyMQKzLmZBgNapGA7LD6NFUy9UUQ2bQnYT/P60m
 twaaSJj8N+Ywv5HQ7T/h2S2Ujis5zBZWkr+gzoIJGE3SYwEASTR3wedaP8QQZbvtd0liHOjbx
 +iVWhfIAvJyVfO66TiE7tLRKw63f8JjNo4S26q8EYuLs1uggc2p+R+bbWwMZkA7oITVJkGXnt
 Ez0PVuEqL6Ya8SUfmr/Ghcf+PX+4YgsYzrRpWOhwjx7cWDoX4ItWHYs7GGiY6Aj7l85z8bBc6
 ST73S/uI0e/4jbj288izsVaBrCmv4e/+p0Fzy/Rdh2XcVSy5yXdpJaQuY7RcPa5/aZv4zTWPX
 pV5HjsdWMS1BuBvIOixEgKEwfLbaqkn0ZuPCzpbxCqERYp0htEfYU13f6DJbeTY3AmbcyKZCq
 cWVrcg==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Dec 2023 08:46:12 +0100

The variable =E2=80=9Cproperty=E2=80=9D will eventually be set to an appro=
priate pointer
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/drm_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property=
.c
index 3440f4560e6e..ea365f00e890 100644
=2D-- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -98,7 +98,7 @@ struct drm_property *drm_property_create(struct drm_devi=
ce *dev,
 					 u32 flags, const char *name,
 					 int num_values)
 {
-	struct drm_property *property =3D NULL;
+	struct drm_property *property;
 	int ret;

 	if (WARN_ON(!drm_property_flags_valid(flags)))
=2D-
2.43.0

