Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340965A500
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9F10E10B;
	Sat, 31 Dec 2022 14:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn2189.outbound.protection.outlook.com [40.92.63.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE65010E05E;
 Thu, 29 Dec 2022 13:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNS4jp+cf19e2H8x2LatwC8Hp7hlACQbdCJJe3giFx3TB1ApJL9vrcK+miOKZXHkc9X8YlQiH/hgRaQ4XJQvwOcoNSOAsJ6Uf23FTDByYocl/rRkdfs4koKdQsn0MIUK0m8zJALghOCAUXW+Yjxb7eeduIyDZbKLUYxtz0xgc22cyieeQhoUQhehXZ6d2fo4EzpKWW8fGQ+LNXK8R4f+tUKZWqewTCx9PJChCBeGHKec7gxVx+U4tkCf1NFGnOoUO9Oy1WP3+FxNirXJaD3gJoIiduGTqpfGpb3g3ges1X8oQN0eg/rRDyIOr5p30a1wn1dbovtmqgfdUaIx6STt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4sEKuRdSV1eGMTKI/BrW8wP3LoxL8J190/W6HAe9O4=;
 b=jAeu7FFOxIvFuO/tn7k/5TYsEX0j9AjFhfVAW7K19KXNwvJ1pSUr70MUHyS3IFyMNRGywwsSYcVFCqSqkujC1PjAv7RgTg4+uzxaJN+a1DlrllBnYoHeSfaMa0ztPUOMaFhcyQNWM9MXyq/7LqfHAI/Ktp6NJDNxS6OFFyVMTBqZIIpVUUY4HycBqjZVE2IKaP1KFikkXqMH/3Xjrk/ciGuAn4bKOLIIoFPWnBcVUYIzaUbMP8uLCqvDTKEkfAIDk8DcaQ5dLXM8Jc42b/zMJl0DomtCI/J4rKczoLP3GtIUNW6fCMav5bvFwvRWqYtWM1CfK0gv2bp+z2chh/Bi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4sEKuRdSV1eGMTKI/BrW8wP3LoxL8J190/W6HAe9O4=;
 b=OlH4RHOAQaySYMjodbdSMa2c6d+oQw6Z04p1afixzVJOSbRUCwJ6HttdIZzOyw75As1z+SCmyJSsyRfSdx6+hWC4RSvnc9qlbKp5UWXfkStq6Jk5hk7EQ2vxguPsW+D7srYuWjD3lGeDo9iaWtteupuJIMGRtTTUefKWXqwuGLzJn9j5MYAAgrEhliLrL8wqxB4yjA6t+Wq8GdlxBYlW+Ky2viZzTz3xje9WkxjDJvCsWssN5icuvmQUoL4Mgjbx8nICsfli8TRs0EfVHkCyqjQTHeZRzShLAm+geyMoqcCppx8LvYmEkVV/D0y+e/oq2OSUBU9wAT2PQJDqFoW37A==
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:169::6) by
 ME3P282MB2626.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:115::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16; Thu, 29 Dec 2022 13:27:27 +0000
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2]) by SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 13:27:27 +0000
From: qi zhou <atmgnd@outlook.com>
To: "matthew.auld@intel.com" <matthew.auld@intel.com>, open list
 <linux-kernel@vger.kernel.org>, "zhi.a.wang@intel.com"
 <zhi.a.wang@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fix gvtg cursor position if it is negative
Thread-Topic: [PATCH] fix gvtg cursor position if it is negative
Thread-Index: AQHZG4eUlO6VebNR50mtjCIRm5fqp66E2jBu
Date: Thu, 29 Dec 2022 13:27:27 +0000
Message-ID: <SYZP282MB3252C832275ACAD8C8C2A091C9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
References: <SYZP282MB3252074E5A0A1C467337132AC9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <SYZP282MB3252074E5A0A1C467337132AC9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [LVo5SZwuP6AiZP0E16U1TMNxwPpiVhMt]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYZP282MB3252:EE_|ME3P282MB2626:EE_
x-ms-office365-filtering-correlation-id: 73c4fa68-f318-4605-1db9-08dae9a06e1f
x-ms-exchange-slblob-mailprops: EgT5Wr3QDKz918u76bcdvRMWUZXhBQCAJL9uKGdeHbeboL+FBVsfOZCqHvoGt/iho6kUuNsqOyXCCPrIY7KNnUSGis/MZ+4415HLWFkq6lgkfyGIw5w/h9sDaleJaRkRM3PcH+4j/0BxRD7CwPfwSYOBRpS6KJYEssDwG6qrrH9WKDzEUkPJJduG+dRdOGqoL8XoAvcz/WbxdZnLI5fR13aNWUlFXFUY0zAjPexxujHD8o3iQTdtoX4vJYJp65994TRrYf+jsoyoLVI8YEJn9785Tr3YMLKkb0B1O8Tfdz/zkztSQWpQulrejfm8yga9y5AWryYISW0zqdDBPG4sl3Te7XpKDAwZisNFizQ/Uy1/nH/C9ngmKvkTFxYRCCQIRHcfwzA69umLP929zuieBCQADwGOr+WWHNTKWUwRVXWnpsgPNrian4rRbM+NMtn2kwSe5CBuInw56Ivw36Tvekfgc0JmVI1WGvJEJOT1vklebXjST48Mv9LEIL00f841xiTYAAevximyKzpjSXR008e9ZpkYqSNNMwRmgnrldPW8nvt7guXdyLLBDoGYUtE2ZOuR6J11g/tUugvT5hySZtsTdnkuzgvVJ/FPLyR9n+MQT6cdMHxhaZCO07mMZ4szTXoV5+SkQQB709sVpnyh/ZdrFOFlisz8wcJy0j1VhhAl1gCB9J+3il4YxUtGFPGGi0onYdFHKjzxex97B4JRMNUXAijcRYonzjdyN2CGM0o=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6L6XZ1fOzrE4jIgm4JmnsXUrrV3NX+P/vD9IfGJu4cSmZGRihbFw4btBZQHjJDRWuR+MeG9wgatsA2i1Y+Z8QypWG7YS5vjZe/ew7LeOhD9HsMo1xOXs3p9vshzjcu+9Ouu+CEAO9dFk/kpA8He4Ae1OM16nMccnu046OiLKqfwjo8UC0GMc6a8wmAufvFSkfW8r1dkHcE45pLpSPqVOumXneo3PO/SWfhKGE6fvlKIVcndpGgxirRouEOSKg3PDZ+3Y/gS+tX946F7lyEipwlypLhl3GTgflDEZ/V7Jr7qRE/0uoIJC8V4LORnI96kbvyVN1JIY1gXUbQoLYVcGZljXayFuuQol2UWz/LgZ8TuiMA6OPScvdtuGWXyQIg7bcvsCoKznqohznIaQCMss6A+PYkU8sXHw7yDkvsNHtkzMHldXZntJf+5zLgMEe2Oiv/b0lWkW2hay4hGPiIWvlHkEo/8Zox4mtXYKUkNwU20MnYQQbz9r7p2/n/nbdW6IktavKsLh0uKyBbafW6muEuVozEWtJV0sS5/F13gyVKWAtYZ15JyMHn0wt0RHu342QzN0cJj3HaX5TZPWCd9eAvt9v/6qN/VZRinLPf+4w48kCo5RGZ8mZcjwuAGs7qBiz6Cqr/yJvCXj0nTCGn57q/PV47+SXFk3ddtRHhSzsdE=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CSw2kqIV0/DvsqFJ/FoaYZb/nwDM8BFcsZbNhluzjSQTQiaTzSflnyn5Ge?=
 =?iso-8859-1?Q?dMe734+ZT1/l/h+EQbvl7qPhxx3PQmAs5hRj0Gma8QbvjR8P16OuG1HXop?=
 =?iso-8859-1?Q?NQwLGPZs/j2cCEcuel0NhP9J1EFuzN/A0de9ljeNEI9QR+1UhK8Nhu/yWB?=
 =?iso-8859-1?Q?LYfi8jyW68S4xB8mA9W57Bu5KRunXahkzZkFeJkcJbT+WT56zOF4v0f5b1?=
 =?iso-8859-1?Q?Mu06LjXTyur7ZGsxP3DEkJ51tjhUFt39hYq+RWR9MjnSBLJXEvrko+fZbB?=
 =?iso-8859-1?Q?a45cqIhcyb6fL4qdIZbRK4HDCHDKJ+7lZ1zCW7n2J0fma37QaTnwc3flY3?=
 =?iso-8859-1?Q?9BDSCaIwENwQKUNRNGO/3UhdobpZAh43OEk2Wm4rraUqSZpTY+m4b6PycI?=
 =?iso-8859-1?Q?K3/Q2P32UHp1pAAzipmQAGvipvuC88qR5KXs6/L/kukBG4GAh06Df/Bq0y?=
 =?iso-8859-1?Q?9ROoO6SbPXX/vFe5m+Vw9+EkPGWw3OJg1IeC/bmueJ5MWbh40XtWWPodTl?=
 =?iso-8859-1?Q?y8lOwnBBmKNmrzX2RONWYj9fEvQkp3KXEKXKoA4e3VV0EV7emhaZraw/8I?=
 =?iso-8859-1?Q?5sFrdfvj2X+np6QyWVjogalkKQp1oxQKjBJ392jydJsull6hFo56CxtfQJ?=
 =?iso-8859-1?Q?rf+ZTI9lbWozy/+U2ipvPPsT7e/hRIB0yLj3P6r1m9X4Dy3id66yo0sytC?=
 =?iso-8859-1?Q?9uKo8cKLrTyGDLSNrPjb/s7Y2yji9WWLp93FJrzYZRreb6/ongmXu54GXF?=
 =?iso-8859-1?Q?o0IvfJQ8AEKqjZinp3ZcWSmGF1UTfW+V8Rx7b2hSH9ijHc++5b+XG7Aw67?=
 =?iso-8859-1?Q?A9w5iSSuZaO4l99oUvN1aAyRYd+Zu8VYe/hKc6Bak+JshsrxBQefVJbedm?=
 =?iso-8859-1?Q?sEbiKjL3RN2fSK1jvDvpS5cR0VovPJC2zkONPJ7+Ym+zBHwaWYOrJbEUl9?=
 =?iso-8859-1?Q?2Pe33sVeObPQc4VC1zZuu4fYUOG9ZiGWKYaeZqzfwQELBZF21X5t3lT3Jy?=
 =?iso-8859-1?Q?P94HmOqGQLf1KiDBv/zCGT0Hy7I8QRKTLTt3l8DUHfOXTLD8G/8lZeMIt3?=
 =?iso-8859-1?Q?SIHysT6CAgHz5MbTyinUiRRdoTTKJQmaRldaD+t2O9vkLquuYFps7+FxiM?=
 =?iso-8859-1?Q?oRy5s7aV0+YQmxipFAQwD0KlrhDbPAa2AZALT7ZAG+KuwIYCFrZ/5Y5UGr?=
 =?iso-8859-1?Q?VrB0ELsETu2ih3Cuwekcbj1WVuOmTWRqvZ10wjzlhDMzKu6IS+fdkjDdP/?=
 =?iso-8859-1?Q?oEqtpM+Su0SZqfN8l0FjHzjuct/El68J5ggq5bRzdYV+oyw+KxG5NBEzfH?=
 =?iso-8859-1?Q?JGg9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c4fa68-f318-4605-1db9-08dae9a06e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 13:27:27.7293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB2626
X-Mailman-Approved-At: Sat, 31 Dec 2022 14:30:00 +0000
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qi zhou <ATMGND@OUTLOOK.COM>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To test, you need patch qemu too, I paste it here for convenience, and I it=
 have been sent to qemu dev mailling list=0A=
=0A=
From 4f14d6216d3f05f01ffe419ff0baeebe416a3e58 Mon Sep 17 00:00:00 2001=0A=
From: Qi Zhou <atmgnd@outlook.com>=0A=
Date: Thu, 29 Dec 2022 20:25:06 +0800=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative=0A=
=0A=
It is valid if position of cursor is negative(not hotspot coordinates). for=
=0A=
example: precision section, resize, move, north east arrow...=0A=
=0A=
Signed-off-by: Qi Zhou <atmgnd@outlook.com>=0A=
---=0A=
 include/hw/vfio/vfio-common.h | 6 ++++--=0A=
 include/ui/console.h          | 4 ++--=0A=
 include/ui/gtk.h              | 2 +-=0A=
 linux-headers/linux/vfio.h    | 4 ++--=0A=
 ui/console.c                  | 2 +-=0A=
 ui/dbus-listener.c            | 2 +-=0A=
 ui/egl-headless.c             | 2 +-=0A=
 ui/gtk-egl.c                  | 2 +-=0A=
 ui/spice-display.c            | 2 +-=0A=
 9 files changed, 14 insertions(+), 12 deletions(-)=0A=
=0A=
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h=
=0A=
index e573f5a9f1..8048816176 100644=0A=
--- a/include/hw/vfio/vfio-common.h=0A=
+++ b/include/hw/vfio/vfio-common.h=0A=
@@ -166,8 +166,10 @@ typedef struct VFIOGroup {=0A=
 =0A=
 typedef struct VFIODMABuf {=0A=
     QemuDmaBuf buf;=0A=
-    uint32_t pos_x, pos_y, pos_updates;=0A=
-    uint32_t hot_x, hot_y, hot_updates;=0A=
+    int32_t pos_x, pos_y;=0A=
+    uint32_t pos_updates;=0A=
+    uint32_t hot_x, hot_y;=0A=
+    uint32_t hot_updates;=0A=
     int dmabuf_id;=0A=
     QTAILQ_ENTRY(VFIODMABuf) next;=0A=
 } VFIODMABuf;=0A=
diff --git a/include/ui/console.h b/include/ui/console.h=0A=
index e400ee9fa7..589d0fd621 100644=0A=
--- a/include/ui/console.h=0A=
+++ b/include/ui/console.h=0A=
@@ -264,7 +264,7 @@ typedef struct DisplayChangeListenerOps {=0A=
                                  uint32_t hot_x, uint32_t hot_y);=0A=
     /* optional */=0A=
     void (*dpy_gl_cursor_position)(DisplayChangeListener *dcl,=0A=
-                                   uint32_t pos_x, uint32_t pos_y);=0A=
+                                   int32_t pos_x, int32_t pos_y);=0A=
     /* optional */=0A=
     void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,=0A=
                                   QemuDmaBuf *dmabuf);=0A=
@@ -362,7 +362,7 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,=0A=
 void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,=0A=
                           bool have_hot, uint32_t hot_x, uint32_t hot_y);=
=0A=
 void dpy_gl_cursor_position(QemuConsole *con,=0A=
-                            uint32_t pos_x, uint32_t pos_y);=0A=
+                            int32_t pos_x, int32_t pos_y);=0A=
 void dpy_gl_release_dmabuf(QemuConsole *con,=0A=
                            QemuDmaBuf *dmabuf);=0A=
 void dpy_gl_update(QemuConsole *con,=0A=
diff --git a/include/ui/gtk.h b/include/ui/gtk.h=0A=
index ae0f53740d..bb28360185 100644=0A=
--- a/include/ui/gtk.h=0A=
+++ b/include/ui/gtk.h=0A=
@@ -182,7 +182,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,=
=0A=
                           QemuDmaBuf *dmabuf, bool have_hot,=0A=
                           uint32_t hot_x, uint32_t hot_y);=0A=
 void gd_egl_cursor_position(DisplayChangeListener *dcl,=0A=
-                            uint32_t pos_x, uint32_t pos_y);=0A=
+                            int32_t pos_x, int32_t pos_y);=0A=
 void gd_egl_flush(DisplayChangeListener *dcl,=0A=
                   uint32_t x, uint32_t y, uint32_t w, uint32_t h);=0A=
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,=0A=
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h=0A=
index ede44b5572..646db069b8 100644=0A=
--- a/linux-headers/linux/vfio.h=0A=
+++ b/linux-headers/linux/vfio.h=0A=
@@ -720,8 +720,8 @@ struct vfio_device_gfx_plane_info {=0A=
 	__u32 height;	/* height of plane */=0A=
 	__u32 stride;	/* stride of plane */=0A=
 	__u32 size;	/* size of plane in bytes, align on page*/=0A=
-	__u32 x_pos;	/* horizontal position of cursor plane */=0A=
-	__u32 y_pos;	/* vertical position of cursor plane*/=0A=
+	__s32 x_pos;	/* horizontal position of cursor plane */=0A=
+	__s32 y_pos;	/* vertical position of cursor plane*/=0A=
 	__u32 x_hot;    /* horizontal position of cursor hotspot */=0A=
 	__u32 y_hot;    /* vertical position of cursor hotspot */=0A=
 	union {=0A=
diff --git a/ui/console.c b/ui/console.c=0A=
index 9ff9217f9b..8dffacf07d 100644=0A=
--- a/ui/console.c=0A=
+++ b/ui/console.c=0A=
@@ -2049,7 +2049,7 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBu=
f *dmabuf,=0A=
 }=0A=
 =0A=
 void dpy_gl_cursor_position(QemuConsole *con,=0A=
-                            uint32_t pos_x, uint32_t pos_y)=0A=
+                            int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     DisplayState *s =3D con->ds;=0A=
     DisplayChangeListener *dcl;=0A=
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c=0A=
index f9fc8eda51..43c00b7a75 100644=0A=
--- a/ui/dbus-listener.c=0A=
+++ b/ui/dbus-listener.c=0A=
@@ -188,7 +188,7 @@ static void dbus_cursor_dmabuf(DisplayChangeListener *d=
cl,=0A=
 }=0A=
 =0A=
 static void dbus_cursor_position(DisplayChangeListener *dcl,=0A=
-                                 uint32_t pos_x, uint32_t pos_y)=0A=
+                                 int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener, dc=
l);=0A=
 =0A=
diff --git a/ui/egl-headless.c b/ui/egl-headless.c=0A=
index 7a30fd9777..7a03b08d46 100644=0A=
--- a/ui/egl-headless.c=0A=
+++ b/ui/egl-headless.c=0A=
@@ -110,7 +110,7 @@ static void egl_cursor_dmabuf(DisplayChangeListener *dc=
l,=0A=
 }=0A=
 =0A=
 static void egl_cursor_position(DisplayChangeListener *dcl,=0A=
-                                uint32_t pos_x, uint32_t pos_y)=0A=
+                                int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     egl_dpy *edpy =3D container_of(dcl, egl_dpy, dcl);=0A=
 =0A=
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c=0A=
index e84431790c..a454402212 100644=0A=
--- a/ui/gtk-egl.c=0A=
+++ b/ui/gtk-egl.c=0A=
@@ -286,7 +286,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,=
=0A=
 }=0A=
 =0A=
 void gd_egl_cursor_position(DisplayChangeListener *dcl,=0A=
-                            uint32_t pos_x, uint32_t pos_y)=0A=
+                            int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);=0A=
 =0A=
diff --git a/ui/spice-display.c b/ui/spice-display.c=0A=
index 494168e7fe..347c3917bf 100644=0A=
--- a/ui/spice-display.c=0A=
+++ b/ui/spice-display.c=0A=
@@ -1002,7 +1002,7 @@ static void qemu_spice_gl_cursor_dmabuf(DisplayChange=
Listener *dcl,=0A=
 }=0A=
 =0A=
 static void qemu_spice_gl_cursor_position(DisplayChangeListener *dcl,=0A=
-                                          uint32_t pos_x, uint32_t pos_y)=
=0A=
+                                          int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     SimpleSpiceDisplay *ssd =3D container_of(dcl, SimpleSpiceDisplay, dcl)=
;=0A=
 =0A=
-- =0A=
2.25.1=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
From: qi zhou <atmgnd@outlook.com>=0A=
Sent: Thursday, December 29, 2022 21:17=0A=
To: matthew.auld@intel.com <matthew.auld@intel.com>; open list <linux-kerne=
l@vger.kernel.org>; zhi.a.wang@intel.com <zhi.a.wang@intel.com>; jani.nikul=
a@linux.intel.com <jani.nikula@linux.intel.com>; joonas.lahtinen@linux.inte=
l.com <joonas.lahtinen@linux.intel.com>; rodrigo.vivi@intel.com <rodrigo.vi=
vi@intel.com>; tvrtko.ursulin@linux.intel.com <tvrtko.ursulin@linux.intel.c=
om>; airlied@gmail.com <airlied@gmail.com>; daniel@ffwll.ch <daniel@ffwll.c=
h>; alex.williamson@redhat.com <alex.williamson@redhat.com>; cohuck@redhat.=
com <cohuck@redhat.com>; intel-gvt-dev@lists.freedesktop.org <intel-gvt-dev=
@lists.freedesktop.org>; intel-gfx@lists.freedesktop.org <intel-gfx@lists.f=
reedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedeskt=
op.org>=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative =0A=
=A0=0A=
From 8d2a0c2c265119cb481deab825ea59c9605f3bd8 Mon Sep 17 00:00:00 2001=0A=
From: Qi Zhou <atmgnd@outlook.com>=0A=
Date: Thu, 29 Dec 2022 20:15:51 +0800=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative=0A=
=0A=
It is valid if position of cursor is negative(not hotspot coordinates). for=
=0A=
example: precision section, resize, move, north east arrow...=0A=
=0A=
Signed-off-by: Qi Zhou <atmgnd@outlook.com>=0A=
---=0A=
=A0drivers/gpu/drm/i915/gvt/dmabuf.c | 5 ++---=0A=
=A0drivers/gpu/drm/i915/gvt/dmabuf.h | 4 ++--=0A=
=A0include/uapi/linux/vfio.h=A0=A0=A0=A0=A0=A0=A0=A0 | 4 ++--=0A=
=A03 files changed, 6 insertions(+), 7 deletions(-)=0A=
=0A=
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/d=
mabuf.c=0A=
index 355f1c0e8664..b91122b33222 100644=0A=
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c=0A=
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c=0A=
@@ -299,9 +299,8 @@ static int vgpu_get_plane_info(struct drm_device *dev,=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->stride =3D c.width *=
 (c.bpp / 8);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->drm_format =3D c.drm=
_format;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->drm_format_mod =3D 0=
;=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->x_pos =3D c.x_pos;=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->y_pos =3D c.y_pos;=0A=
-=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->x_pos =3D c.x_sign ? -c.x=
_pos : c.x_pos;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info->y_pos =3D c.y_sign ? -c.y=
_pos : c.y_pos;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (validate_hotspot(&c)) =
{=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 in=
fo->x_hot =3D c.x_hot;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 in=
fo->y_hot =3D c.y_hot;=0A=
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt/d=
mabuf.h=0A=
index 3dcdb6570eda..4103106d7cc2 100644=0A=
--- a/drivers/gpu/drm/i915/gvt/dmabuf.h=0A=
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.h=0A=
@@ -41,8 +41,8 @@ struct intel_vgpu_fb_info {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 height;=A0=A0 /* height of plane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 stride;=A0=A0 /* stride of plane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 size;=A0=A0=A0=A0 /* size of plane in bytes,=
 align on page */=0A=
-=A0=A0=A0=A0=A0=A0 __u32 x_pos;=A0=A0=A0 /* horizontal position of cursor =
plane */=0A=
-=A0=A0=A0=A0=A0=A0 __u32 y_pos;=A0=A0=A0 /* vertical position of cursor pl=
ane */=0A=
+=A0=A0=A0=A0=A0=A0 __s32 x_pos;=A0=A0=A0 /* horizontal position of cursor =
plane */=0A=
+=A0=A0=A0=A0=A0=A0 __s32 y_pos;=A0=A0=A0 /* vertical position of cursor pl=
ane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 x_hot;=A0=A0=A0 /* horizontal position of cu=
rsor hotspot */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 y_hot;=A0=A0=A0 /* vertical position of curs=
or hotspot */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct intel_vgpu_dmabuf_obj *obj;=0A=
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h=0A=
index 23105eb036fa..a9b93251ac7f 100644=0A=
--- a/include/uapi/linux/vfio.h=0A=
+++ b/include/uapi/linux/vfio.h=0A=
@@ -720,8 +720,8 @@ struct vfio_device_gfx_plane_info {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 height;=A0=A0 /* height of plane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 stride;=A0=A0 /* stride of plane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 size;=A0=A0=A0=A0 /* size of plane in bytes,=
 align on page*/=0A=
-=A0=A0=A0=A0=A0=A0 __u32 x_pos;=A0=A0=A0 /* horizontal position of cursor =
plane */=0A=
-=A0=A0=A0=A0=A0=A0 __u32 y_pos;=A0=A0=A0 /* vertical position of cursor pl=
ane*/=0A=
+=A0=A0=A0=A0=A0=A0 __s32 x_pos;=A0=A0=A0 /* horizontal position of cursor =
plane */=0A=
+=A0=A0=A0=A0=A0=A0 __s32 y_pos;=A0=A0=A0 /* vertical position of cursor pl=
ane*/=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 x_hot;=A0=A0=A0 /* horizontal position of cu=
rsor hotspot */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 y_hot;=A0=A0=A0 /* vertical position of curs=
or hotspot */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 union {=0A=
-- =0A=
2.25.1=
