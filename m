Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008F437D2C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD92F6E5A2;
	Fri, 22 Oct 2021 19:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1DC6E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634904901;
 bh=61vV1s5G2weNUykUdb0d0cHAkEucmz4Ikp2vx99z/Xs=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=bjoaz9OBdJwqxEcENX6bSvr5RhxnVu21ei+mhYnzEUx6lnk+TsRe+82YkMv6fFfYe
 udgnOaHvkphnPlktB+zn7KW9NGLeb2Wx8WfMKwr/dixeQqCNO7tZhainHDT4hPv1vi
 Kw8NDMIfZVjLpJ1Rj83LWYHr2sEUmVGDkK1QNHnc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.252] ([5.166.175.137]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1McpNy-1nCOzH1dze-00Zu9p; Fri, 22
 Oct 2021 14:15:01 +0200
Message-ID: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>
Date: Fri, 22 Oct 2021 12:15:00 +0000
MIME-Version: 1.0
To: dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Joshua Strobl <joshua@stroblindustries.com>, Arnd Bergmann <arnd@arndb.de>
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: Linux >= 5.14.12 and 5.15-rc5 fail to show anything on the screen
 with CONFIG_DRM_SIMPLEDRM=y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HtEtJuQL9K29NOEDtDwW3WT3O+T5J2ZQRUAqCDW+Q0Y4N1cvKEY
 +6eU3WCDyG03MrBQPWcQ21UNLMuawu4HF397rUGwx8jx343E9KEvZbwWRVKjaUg8ZifYsZf
 e7OHHwzcqnYOdW6vUCE690XPeZUzFN6ca5RDxB4kbgbBfbOW0W+UOPCi5jaAjRDLw5YPgHk
 GjhavNI9j6yv93hHe5Ajw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zzE7hZay5dE=:9IV3j9pdsjupCKYUx/VDPL
 BclP2hkavSDmqD/48QhJ/v2Y7yN7E3XrLPXYfwyjVeaN1HcaC/zCtCjL1rDlssAofYMnEqDeq
 V0vjZtdJxLn+G34wNEZaME5Qxsfxu150ZIzE9rrI6fP7PT098WZvQXFOOAnkxSNJo/rfu+xmh
 jrWRGmNsezgn+pg/5iJzTGpqWQfLy4uxDOJDQc5b/EVO1nvtCK4J5a7+9Lu6IAiiByM2KMo3R
 Wuueb4nbPGVOerzxcWIxISTSe0qhley6aFkOV140ZPpND7n8ExMOlAFiInhAxtPBtMDXTIUbe
 0KxAxi12HBzZ8lMFMb0UDCCY+3ONZsFTJOIoTzrZNG0D2LG9g26sl8ImTa6yxsq+I6oNXfHV4
 T1IJYnRiw2I3Ipa9Q4A30kt3p4eZ4SGTDq32RokPXDkzrzrKPwdZMGkSAkTGSjYgsSUCz0q9Y
 sgHBlthCXxQeEBVU3TzJx/1izVrS4nyuDcZJLorgeuTa7uajQaFxZvdldX1LJIJX1UZDg9TC7
 vDw7gNAUmsxqzPZjadLkDKGDoq/cluCPoUv0bPEHXwQsOiPjTclhjXCBGFwm/WtOljEH0Zz7q
 Sn5k1uoxMma+KwnLtNYk5n420QW+ZUDhv9el4ek3pJuBM9h3qzh9DCUJclcgU2iEEQpxLx31e
 uIn1hW4zM/gpSn1Xi5WBOan2RfzsHaEX8PjBxwBkTKM9pwR6zGJwdz8CErlRCQfkkJ9gqapnG
 Zrv6iax+x1auqcrtub+CiaybWs0o5DRhzAya/ecx1iDcaEJQzPhtrKwZegsZ7SqhLJeCuTbT5
 ZJbQVP+xc6MgNnP6GURE9sMmiE3XDqpWNfQWwZTHx7csCJgvR0q63fHu1Lg7RQYtobUTeYJ3m
 +lg5iMnKcCvhOF1RnkyHZbCQh4b2LR9ggTTay4zJI4NaQpOupHH9fj6myZb/e7uDlD6YrUi0b
 ymRhsiZs8BfOo3eZLQLYG5nN3mcKNv4p8yRB1lsl+Q81zn4Ce5Ku4DxYcC/JIEaoQ2mQj3vmd
 FhuvGzuCPoPo3TqsW2/p9HjJBNNGla3hLFnki3QXbECcXUgRNyhXo239n+jXuWRnVQ==
X-Mailman-Approved-At: Fri, 22 Oct 2021 19:02:19 +0000
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

Hello,

Kernel 5.14.12 introduced this change, git commit
ec7cc3f74b4236860ce612656aa5be7936d1c594:

=2D-- a/linux-5.14.11/drivers/video/fbdev/Kconfig
+++ b/linux-5.14.12/drivers/video/fbdev/Kconfig
@@ -2191,8 +2191,9 @@ config FB_HYPERV
       This framebuffer driver supports Microsoft Hyper-V Synthetic Video.

  config FB_SIMPLE
-   bool "Simple framebuffer support"
-   depends on (FB =3D y) && !DRM_SIMPLEDRM
+   tristate "Simple framebuffer support"
+   depends on FB
+   depends on !DRM_SIMPLEDRM
     select FB_CFB_FILLRECT
     select FB_CFB_COPYAREA
     select FB_CFB_IMAGEBLIT


However if you enable CONFIG_DRM_SIMPLEDRM=3Dy along with it, the system
will show a black screen on boot while logging these messages:

[drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on
minor 0
simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to
setup generic emulation (ret=3D-22)
fbcon: Taking over console


When CONFIG_DRM_SIMPLEDRM is disabled it proceeds to boot normally:

simple-framebuffer simple-framebuffer.0: framebuffer at 0xe1000000,
0x300000 bytes
simple-framebuffer simple-framebuffer.0: format=3Da8r8g8b8,
mode=3D1024x768x32, linelength=3D4096
fbcon: Deferring console take-over
simple-framebuffer simple-framebuffer.0: fb0: simplefb registered!


This is discussed here: https://bugzilla.kernel.org/show_bug.cgi?id=3D2147=
23

I really don't know what to make of it but I definitely don't like this
situation.


Best regards,
Artem
