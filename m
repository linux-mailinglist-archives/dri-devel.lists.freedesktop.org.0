Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CEB4AC493
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9115110E2F1;
	Mon,  7 Feb 2022 15:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5445F10E2F1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644249573;
 bh=PusMMyGB9j5DK/8vXLrKOspyncNsqPE/lT4eYDsczGg=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=MWAlGodzVeN6qDGckdBNG7jVQI1D4G3FGRCts92dqf4re06jAx0RAvVGN94GLSZsF
 nBq5xI30Np+VG9gNbTV9kc2ZJKNZKMdH9eBmtvqVY0CKZHFyTIWZueYvOre3kyZCQJ
 7aLiTiba+ZXhQUZ4wBNecFMSM8NgAk/Poa31byas=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.138.144]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE6L-1nb7Jn3lyV-00Kkth; Mon, 07
 Feb 2022 16:59:32 +0100
Date: Mon, 7 Feb 2022 16:59:31 +0100
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] fbcon: Avoid 'cap' set but not used warning
Message-ID: <YgFB4xqI+As196FR@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:7yeZODKsx7xdHU5ifkxOE+5vb8a+10rpbvvIunOEeGsYcBNTQpz
 vg+w4W1qpadTKmjuV1H3Y1zr4TYIdaSFxAD/KEjbe+BD+oucJAwrd/uunj5UB1FsBRH55C+
 Ud+78k6ASXaCSuP2tAgCWe9g2MqmRSWnKOfQ75pYJEUVHaQIVhi+sRFmIXJTPed++EjWe8o
 KZvddRQwfZ9SyO6EVmFCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OzctJeUi67Q=:Iy24IVJoggi57NpvVvZBYN
 0HWh2fw4f6fejxqtxLPR2FSwitvwB6Veim27b3KwHcZgwBqqUK/TioOj/M6VHtjrh6zVKyEfk
 lnT+Vt2eNcQx7h0ZM01aQWrYTH2ReFaehb8aSUiMBNlnfGbWPLMaOAvLbz52wFfpSuXMsRiFZ
 NberGsM9BsFzA/d85kfeRrSohVmaHmHtIPfCx4BZBxgoPyIPx1RaQ+BZ1IP2FTz7F7CKhtloq
 wAvFXHM3/GQcZyYurZqpdmUBAY0QIVsPySNiqHRdNlYqRRhvay0awxHKj+Vsz3lBLA3zHd32F
 CNxR9kQpCWqeVwbV6+yV+pakj7RYvxDE+u5/VWHwECUp1C/CLMb5odj8g9UCxwGDezGKHhK1I
 IfskoR/M9uBdfty8xEup1Klk9ZzAwV2a5CmM/owG6xBlOB9m8iSLwRdieuZbE4E/B4qLa/28C
 cNMgAPN3kii+hds77m+NSNzDGOR/d+vfitBKC4hKFmH0TYuMW1tsGqn9F8jEwydh01YY0ZdVe
 hAE+i134WuVo7fvR3syMiIP0udFjBqt+2zGYDOmDcQXbtMHMJOZV8Att6Iw8IKknsCbU6G2ev
 x+F8CJZiDCjiOgM7pk72XICxfBengXBoZ8mjJmUIOhRqRDncaIAXfTM+t6CxOca1LZubPp0/D
 DEYIaexAIubxEQW3QSCJj68NZfowRXk2N8snZKoYv/iQSihVLb+B0elzBHNoME0WsU96zhmRP
 oL0FuFeL0wggCDxLzv8si0zAkfrkk8hexXNtjgsn/nRJpYczazRQlMysY4CnmpUS5zMZot0gD
 jYaMoUUsA9u8KrGZVfn9SyGLDPP5u3vHO4msg7kCW9eNRofKJE7jtXQkaNUQEocfhWozYUu/+
 2LdPUac5yy/CCPhjad4RvBFslFU/KBGeVGpvuCzajw8qz8h6WtfPBzND6EjwqxXorgNLAIvvy
 a6aR8PoLMDzjtWPnpp5XT94casH2sjTfO7Ely/8zeXXtJGqtJsveS58BP4kNcW6JtKKq8esrS
 jeIxoUQdAmMGtrSvVX4uwUlYyqp6UdSXPMa2cwZ2D13Bnpd1iQOm/zi1d5St/q99GVj4yLoX8
 XGITfh2nz/kd/8=
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

Fix this kernel test robot warning:

  drivers/video/fbdev/core/fbcon.c: In function 'fbcon_init':
  drivers/video/fbdev/core/fbcon.c:1028:6: warning: variable 'cap' set but=
 not used [-Wunused-but-set-variable]

The cap variable is only used when CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCEL=
ERATION
is enabled. Drop the temporary variable and use info->flags instead.

Fixes: 87ab9f6b7417 ("Revert "fbcon: Disable accelerated scrolling")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index f36829eeb5a9..2fc1b80a26ad 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1025,7 +1025,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	struct vc_data *svc =3D *default_mode;
 	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
 	int logo =3D 1, new_rows, new_cols, rows, cols;
-	int cap, ret;
+	int ret;

 	if (WARN_ON(info_idx =3D=3D -1))
 	    return;
@@ -1034,7 +1034,6 @@ static void fbcon_init(struct vc_data *vc, int init)
 		con2fb_map[vc->vc_num] =3D info_idx;

 	info =3D registered_fb[con2fb_map[vc->vc_num]];
-	cap =3D info->flags;

 	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLEVEL_QUIET)
 		logo_shown =3D FBCON_LOGO_DONTSHOW;
@@ -1137,8 +1136,8 @@ static void fbcon_init(struct vc_data *vc, int init)
 	ops->graphics =3D 0;

 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
-	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
-	    !(cap & FBINFO_HWACCEL_DISABLED))
+	if ((info->flags & FBINFO_HWACCEL_COPYAREA) &&
+	    !(info->flags & FBINFO_HWACCEL_DISABLED))
 		p->scrollmode =3D SCROLL_MOVE;
 	else /* default to something safe */
 		p->scrollmode =3D SCROLL_REDRAW;
