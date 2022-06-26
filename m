Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E531355B073
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B889714ADA7;
	Sun, 26 Jun 2022 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E573214ADAC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656233776;
 bh=ZFGBcXlbrCHF+be4GQg7uC13WF9mgD7i+lqdKLnCSr4=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=VIHqlQqRFsH+LJ/yrYEaJR1OCTIzcHkyYIMwAB8+UimjS8tqoDuYky82wHIxN3KBr
 wKKMXXj08l42/RVLhHEWx/DkQwoHlhTBij0x+we4QjqSS7VK7cNWfCiSIDkJgmbxQ4
 FbW78aClxR8QwhNzO4Of11t+va78htcbJ/edBHxY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGz1V-1nt1iV2v5f-00E4ZR; Sun, 26
 Jun 2022 10:56:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v5 4/4] fbcon: Use fbcon_info_from_console() in
 fbcon_modechange_possible()
Date: Sun, 26 Jun 2022 10:56:15 +0200
Message-Id: <20220626085615.53728-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626085615.53728-1-deller@gmx.de>
References: <20220626085615.53728-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GwYLRlYcYSCrPinUPpHjchZEy81xsY2p0rPbgLqXwQIDH8NeJTE
 zsj7TIiP6QBry+KMBypGIZzBWG6j7TuLqMSsPJLyV0ybns+LWrwgducIJRManOxsm8hzJv6
 4fDLNWhZuQkfs2mk/R/eJVkCUofNU72VmB7BgnEzZi1DKybqn36zXJkFDhP7f2CZp1RnQOa
 TuYuFA5xooeRnnWrrpTOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SvKKZQHhA7c=:weX0hM3mMX8OCPGIPRy7JD
 pA82T7n1ASDp9NRNpzHCMkpb83oEh6+zAaLkqhoSJYaEFND0UPdJcCsNH7BXXmOLVeFJDzN8s
 61I9b0Ilgm2OnF4oXW5OmomzqZcGx49SYlzEFLWaDbXw3pU2mQg9Evt/XVQSZqdzYW6pIWo2A
 EsREjUFwKybV06l90J8Tp6NHdM4QGXbdtcaETqLOJZ6MqAYAfaSnEPfz9D3l4wQDOVAtHxbQy
 19gIISdmjtNksu57my0olHbO/cM6ew1qgERhrDGsMuO150wQgXOdmEU06glqSeB48SzRAlCrH
 /GwAvgToRAjnKHd2SzB5XezD3HxrYf2kNiX4mXJstdhWWJ++c1Pa3xAGfql6UL0VctEQ/K9jz
 le6xwuwzkxc5+xMkWtk7GAi1c7zJQNI9AHZq1KZcn1EBEzrLP8RsRKfwmHbr4hSI1rLlbeAyZ
 nATiIpTDo5Lzqr7JsTDj25vJILnxj0jlXCzUhasOS9qKbCBGP57QV5V6+66GUwGOmhmDo0IkP
 RcNg6r3Dn8VTF5+Xq9sw3zFfzR+NGVOvqOcbniYHrw4/g/Ay7r3VJWf8aQ7OqF4pATv0NCmsf
 JYa+FfhPzfw/yO6orL4F5ZiLejimwmVXsrzVNBUDlZTav6usjG1fIJi/GhufCghblcUr38dCa
 kCqGkt4Rw3kAPPynCQYP9Xq/v/ngtGr5CQwoAC7dSU20I2fQXRlSvFW5+Ngep2RB4VTAmvt4K
 T6B2p7U4i9CPc/L+SES78dXj1dlhkEJ62OtLM1P9fW+uT8YwwTTVGUMldd+bPP1DNvLkGRpl/
 rrMRljEQpJbE3J8KYAc4UDkcw/TRgC94qdaaVAkr33i3uEK/1oMhzdCfmDn+mWGWcTUAsCT5E
 G5nqOpOtL15aulj+oulHBIHZXJLCSdYGD5IZTsSPwrAcebCx3EkrvjsXHrZ3EEWohvCQp4AeJ
 D6Jcd4nlcBFtLA1lnoFxrkm6GwZr7tlXQXHGbHSmFynUUbhkePeNjqnWqKEjtYbWTHWm3oiAQ
 c7rfH8aXD48jgMhtK/fdq6++h/3h3tzoZOEjQchAzSkRPGGMCxkw6M61GM7rB7MpvjREzuJMr
 trdTPMdjzbvSbfAAj1XQicWIu9Kgr3YMiocgw7WByTjQpYj7gbdUu1y+A==
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

Use the fbcon_info_from_console() wrapper which was added to kernel
v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_=
info lookup").

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 69c7261ac334..2ab7515ac842 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2751,7 +2751,7 @@ int fbcon_modechange_possible(struct fb_info *info, =
struct fb_var_screeninfo *va
 	/* prevent setting a screen size which is smaller than font size */
 	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
 		vc =3D vc_cons[i].d;
-		if (!vc || registered_fb[con2fb_map[i]] !=3D info)
+		if (!vc || fbcon_info_from_console(i) !=3D info)
 			continue;

 		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) =
||
=2D-
2.35.3

