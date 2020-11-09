Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F42AD108
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFA8898C0;
	Tue, 10 Nov 2020 08:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6BA89930
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:07:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o15so383636wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1txfIvaUE40Ou/j75EYKcgw6u17F5C6+DdlKPQ0ay3M=;
 b=bV0WOhcjc6Y2rIR+7HT+QGO/LnwlTLaGqiH/bueGYgN1eqaiyqgBu630Wi1/Fe4Izr
 My6WbzMB2G0+0Jww/tXr7Bv9T9tCSh7nAf3FDc9HnmXqm0/SZK/yuCq88k07niiSIbdE
 Kni1bJikZg3lnovvS5+pSl6sF1scmJC1eailBHWvAIqLxr8aFY7ZvU8r5E11qXi2Th71
 zhnarT2xZ1wCpMgNr9yCr/3M5lq5u3cCkFTpjL9pfSKNowIMNdFSn0mY3iQlibP5Tto4
 Lgmzc95ZSUUq1X+Al8zvn1+ubttScKkHoe5x6HV2U03u2h9rIhdyiJw4IDWSPdJhmDMn
 +W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1txfIvaUE40Ou/j75EYKcgw6u17F5C6+DdlKPQ0ay3M=;
 b=h0Ge+842/12oQF0oNc5QJv8KE4rbZfBZyhBslD/QwrDGVjQTN9i4wfKIsLyupl9n+M
 Q3gDJI4/1H8N4DBfbPn2U0XRqw/GlTG3IkYWoFU+buXGBLea+9laq87dZRheeqX/WH6G
 CKizMe0G3/azHFoSnglQQz4MqpWw0o1ojUlNKHs2jAuUKU2Df3GQhXwA0dWf1E3JUJYF
 e1CsIdfu9m2YwAN6okCLMRhlkbIvN+vs4xYg7fNYvJWFYoXfrN0nT8r7iZI5s5Spmyzc
 vLgm82pjrl0Tn1GECN6f+Xk3ZktVaOLDDZQWPPbTOBdhL/P8KPm12fmadAuOHvkVf5/2
 fMcQ==
X-Gm-Message-State: AOAM532Z8ljiLT0d7itO+MrjN78hLJB2HZuL/Ow/I4vbY9oXH9kYDR3y
 HQlFyDAHeVkyG+H0YP6WoefIGQ==
X-Google-Smtp-Source: ABdhPJzHXOuOWGraTd+tlh1Rh/Cikbums2QDN+ELEwiirpKRCwDTD+P/KjLkxHpoeG3VOPOYn45WFQ==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr11725240wrr.303.1604920024684; 
 Mon, 09 Nov 2020 03:07:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:04 -0800 (PST)
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
Subject: [PATCH v3 3/9] ALSA: pcm: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:48 +0100
Message-Id: <20201109110654.12547-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index bda3514c7b2d..b7e3d8f44511 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1129,8 +1129,8 @@ int snd_pcm_hw_rule_add(struct snd_pcm_runtime *runtime, unsigned int cond,
 	if (constrs->rules_num >= constrs->rules_all) {
 		struct snd_pcm_hw_rule *new;
 		unsigned int new_rules = constrs->rules_all + 16;
-		new = krealloc(constrs->rules, new_rules * sizeof(*c),
-			       GFP_KERNEL);
+		new = krealloc_array(constrs->rules, new_rules,
+				     sizeof(*c), GFP_KERNEL);
 		if (!new) {
 			va_end(args);
 			return -ENOMEM;
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
