Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5C4480D4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B596E0B7;
	Mon,  8 Nov 2021 14:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DEF6E0AB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636380431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOreeT9xy7J8ItI94NHKifuwS46AUpOFOueH2yffi6I=;
 b=KKVNeWo5ig2LBJSGCBB3DJLQARzu4wndpl916olDH2ZNSciFJJh51r7LcDyb3WqH/aamfi
 4u6ywGXLdTyb4h9lsejufWeTGVzPXcZswcduC7TBhViaL9awn0EuN2It6Z6ECK+lpWK+b5
 PdvwMDY37XoRkB1j/8jI/AIi/ONCV3Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-2-TqsR_wOl-T79gNPWATyg-1; Mon, 08 Nov 2021 09:07:09 -0500
X-MC-Unique: 2-TqsR_wOl-T79gNPWATyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso6259800wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VOreeT9xy7J8ItI94NHKifuwS46AUpOFOueH2yffi6I=;
 b=viKmqT2wvwrZB4qCTmCHh59ISoBMyocncbQE+rhqJF8put1EG0ZXwgXIGLFUqSDZ5H
 KU6iFQayH919Kq7PwuqSXiufTnXb2JP+53kxTE/Rq9Q4ySyh5+oIbvEIjuXTBsRRwYa4
 RdRZRFm5JSOYCItS6EeI2YCANjcfQ80PRgXH3vRF1vB1ZZaST4G+BDnD6nJfQNKW5NES
 P0w0cOuhFIqVvyeij7k5CLvjlj3ceYcUvczxuPPLVfLiQy1gw6Rh/nHl0XP2voZ4MqPB
 ZhveiwyMEHlWvvCK3gYakIjSeEUIRsao44riEiFsxsbtrnS9se73rHGUxHM9CbBngB1Y
 F1jg==
X-Gm-Message-State: AOAM531htTw9q5EY3OiYuIXd7/EzcKw/c2ZuBiB6Xt7jwubJ5cDkY0Uf
 QE+MMKxWkUHKjxd+nizLwPRC1T20HAqKG+bmgxRxEKfEVu1Bcf/Z8v5UoemgsozCTeFyBk6Jm8J
 wRXDyiU4tugEeM16ux9m50sFmU3Dr
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr80152wrv.106.1636380428653;
 Mon, 08 Nov 2021 06:07:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsYYuejGw7CybgaCxd/E1fUntxtMWk95iWPCbVv910JhxO1p9TBwfd54lnbUNLk9ILcI1Iiw==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr80114wrv.106.1636380428489;
 Mon, 08 Nov 2021 06:07:08 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m14sm10081696wrp.28.2021.11.08.06.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:07:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] Documentation/admin-guide: Document nomodeset kernel
 parameter
Date: Mon,  8 Nov 2021 15:06:47 +0100
Message-Id: <20211108140648.795268-6-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>
References: <20211108140648.795268-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel command line parameter is not documented. Its name
is quite vague and is not intuitive what's the behaviour when it is set.

Document in kernel-parameters.txt what actually happens when nomodeset
is used. That way, users could know if they want to enable this option.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v4:
- Don't mention the simpledrm driver and instead explain in high level
  terms what the nomodeset option is about.

 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git Documentation/admin-guide/kernel-parameters.txt Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..f6434aff943d 100644
--- Documentation/admin-guide/kernel-parameters.txt
+++ Documentation/admin-guide/kernel-parameters.txt
@@ -3521,6 +3521,13 @@
 			shutdown the other cpus.  Instead use the REBOOT_VECTOR
 			irq.
 
+	nomodeset	Disable kernel modesetting. DRM drivers will not perform
+			display-mode changes or accelerated rendering. Only the
+			system framebuffer will be available for use if this was
+			set-up by the firmware or boot loader.
+
+			Useful as fallback, or for testing and debugging.
+
 	nomodule	Disable module load
 
 	nopat		[X86] Disable PAT (page attribute table extension of
-- 
2.33.1

