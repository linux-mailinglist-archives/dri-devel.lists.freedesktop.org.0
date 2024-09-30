Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C398A88F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A326410E536;
	Mon, 30 Sep 2024 15:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Oa6Stl64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA25B10E536
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 15:33:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAF6240002;
 Mon, 30 Sep 2024 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727710389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsQ2CTA2pljllkiENrEWMPdAOoEF3CDQQvjJFAj8G3E=;
 b=Oa6Stl64jTk6jv2DwNuaOnzTX59OBAhDQLe1mZGTedF0TAYJz/yQJahT1PFe1VgtUkaY5L
 08Zaj/VXhKj64j1EIbzmWJ5jgxu6K7wfbVnPDzDwS8Nj2rEUpLQswOlSiaBqHQl4JUbeK+
 hx/1yhragi8D4polubNgmU1+hqZQm/nBogSKsWaldW9VjFrrMOZM558/WvBvKAPG1FmgQN
 aLwsZaLueES58huOq9V4/pExRcrEsEXGUEZ3W4XOVD0g0qwpoUHMGAUQnsOGWYx+KPpBOL
 cbq3/5yi7d1hJ7gVmXlLGwqYXEoRUra0UEPnOSDJX3FWNKHOxkpvX4zoYrar6g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Sep 2024 17:31:52 +0200
Subject: [PATCH v11 12/15] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-yuv-v11-12-4b1a26bcfc96@bootlin.com>
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
In-Reply-To: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=P2BW0rn/HzAIDwl58Rwi6B7V7fHRrzFFCT1b251G+Ng=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm+sRw343Vaj2Iumq11WgviSJGj3zkNoVfohiNT
 qdz9KVUqRaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZvrEcAAKCRAgrS7GWxAs
 4glKD/4mZuw+3SRXem2zT235pwvh8vL/tWupHQ5xcG+H/jViTi0aqn5mI3MmpUeGHFD0yTetFIy
 70kg08BsCX2H5IwLTJlKX9wHqmzUljMSYjTz//T+Orv8rXL2wnwcDcAAIn18nwOuNcU2REtWEJx
 p3OYXxXwi04HIgOLMql/Z3HEN+0RzGFWcPh/Kns7SCKUVJxmg4yQ/00qYafkWcyYNuQsU58h6ew
 Y1yBWlYloCnBlCIIbzf9fUtN8OPqTq+cHJYta08qRNv0M9YMoH8AXkEGMM+StTzjVMCjT1IJcvy
 //UbwRZ3xhtjHfhQdXRnlEHpQpf+mQC0+ojnPJwVlNjaTI1utKRhfygBAZQGM4B7/RVqGwW90q6
 zGj0qRimkcE6YSF3zQpFEy9ncWdvI9TuLytfN1PhSlmFDk4EYxfCaeqbkFRwvl4AXfK0nPF0iIc
 h1Mbz84DqopKw9pikv6Srj+oEQcA7YJrVBI43BEgIuzWQYxsf56IKGg0ht1oeb+bZM0QI+hsfdn
 7qWmKaqtrVGtY+uNlIWgcqPej3HrHkN0vR39azOHXkDclXgGk7ivq9nwBCdaoWCn5tDDwA+1Siq
 J//1osRl3D8Q6Ok6Ke+QdchMVlmeIZHjswd6zYpPrismQh4KhpdoMGTEPCleWL/Ssodk41L6v0k
 vvhNxKmwfFG2HDw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

From: Arthur Grillo <arthurgrillo@riseup.net>

VKMS has support for YUV formats now. Remove the task from the TODO
list.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..13b866c3617c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
 
 - Scaling.
 
-- Additional buffer formats, especially YUV formats for video like NV12.
-  Low/high bpp RGB formats would also be interesting.
+- Additional buffer formats. Low/high bpp RGB formats would be interesting.
 
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).

-- 
2.46.2

