Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C02A3E92
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7896EC19;
	Tue,  3 Nov 2020 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30DA6E554
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:20:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d142so1146276wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=e5kjyidWL8cmpiZH3KN4gbQ7mPV2yzGx2nkYanw2be0opJ+Vz0F/h7+cASkSpyPvft
 Cq/QKHKgAn39kkunAelTRvo6+t//6O8sFAxBBIWVN/D/sXHLN0TcApD154vCBfBKfHLt
 cLayxxCVPglJdryRP0qymWqoSldB8VezR3ze+ww/h6mL64irtmyW1Iv/4QeMsHgFEmU1
 EnCxPQadIxfRrkqDHNb0AWnJ/TDZd1tbaPxP67i/kRiJU0AadmF8tkFzS5SiBFs65eHd
 s2porevmNAwd7EJUylR58be5iKdfMpI6Ofog3Lr78MGsAlfmarg/IAiyvFrSdsneofbm
 aJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
 b=RUcmggluLJViZrmx+525ZPuLh6+VbaNwMGR+EHK4tmViY09ik9rhxoP3JWyxbL/O0P
 j3Lf2h8/3G4/Mju6y3lrtihpGDypDNIK0xMgeo/j+6MEIBs+PtPPJoDcgXK/K9xgTvox
 Oj4Eabcu9d28Lc30T5QFmN8sdr/w3kdw++VXleavqjxfqhA41D/WE9T+/h6tvrD2LNj5
 CUWFx7kh9H+LfpDgdtE5KXjvdYvc2vbq3JDaeUK8bXMW8DKHyBNStY9pGlm2/7t5dm3J
 H8YG7eWh9u4L9FHJLxNzT2tCIldLN+cshzzR0hZ+C0lrrF3fgEin9w1cnUxvgEqS8wRn
 bz6A==
X-Gm-Message-State: AOAM5319Zj6Sl07YtUuk409VPQa4f13DdjJPQH3WnvE8OkrOWIhDxl0c
 1mjBIEzPx9ymEe/d79q4USVrtw==
X-Google-Smtp-Source: ABdhPJwLl/Yb+dmot3Qj9GobH6d2VSIEqfIwMoXbr9WYE4ZivqBC7akLVHb/L/C2gNGglG2Ytc/IgQ==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr17871137wmz.87.1604330453311;
 Mon, 02 Nov 2020 07:20:53 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr.
 [90.8.158.167])
 by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:20:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 6/8] drm: atomic: use krealloc_array()
Date: Mon,  2 Nov 2020 16:20:35 +0100
Message-Id: <20201102152037.963-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201102152037.963-1-brgl@bgdev.pl>
References: <20201102152037.963-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-media@vger.kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..09ad6a2ec17b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -960,7 +960,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		struct __drm_connnectors_state *c;
 		int alloc = max(index + 1, config->num_connector);
 
-		c = krealloc(state->connectors, alloc * sizeof(*state->connectors), GFP_KERNEL);
+		c = krealloc_array(state->connectors, alloc,
+				   sizeof(*state->connectors), GFP_KERNEL);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
