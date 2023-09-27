Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E37AF7A8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 03:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E49D10E456;
	Wed, 27 Sep 2023 01:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D784010E456
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 01:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695777794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=hoIddslBpfI1TPj5mn6dpXA+XNTRF7QFam+9kYeCug1JFEuzpTVTQZpm4FxYin00j5C9eA
 Q6T28QRf4ooDhFjsaYwsn5aA7gFkzd+ihYzgo2Mr0EFj69AkpVk7ZMorWavLMu9y4UQ9ux
 Y3JrBtwN8h4Kqni8UOD/D5VA1yyEZKQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-gWHOOxF7PayZ919p1Cq0Zg-1; Tue, 26 Sep 2023 21:23:12 -0400
X-MC-Unique: gWHOOxF7PayZ919p1Cq0Zg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-406227680a9so31067245e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 18:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695777791; x=1696382591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=A8RgM1lbx6Dt+gm0deWzO16bHxCoJvvkc1Lg36OciYHr/HrtcVgUle5YL1UhSJuuSR
 EhB4ptpRs/P6SSX4+3YIvaAP5DTllmud1AkSjA8V1t3LYsQnHB2PoPTrl1UmorlPvQ5/
 eT/aEYaK+cJr8D+pjokVjTCE+Q5AAQTgMjIUZYTSE7AmIXSgC6vxwDJAEeKkzRhktMc9
 KFDNsMaezMeDKrtYk6vVa9Xfgj+iKxog8Vw3pLcWD71MWzP5lOCHgYPcadcCF/7l6x4u
 m1k8kyzf9zaY8KFSAxZx499g8BRMRwdTAyAMyduuC2iYHyIX87Zqu3cUZajutudDvULG
 7zBg==
X-Gm-Message-State: AOJu0YxfcN9UlpovAT2eBh7EAXEYAaDzyp2Y9QZ870piNVjYDjVTuIoJ
 jTwQKQx+VpM9NZYsMwr80zALnp8tE165NO8EOwxFQEiBv7EPZscPlM/nRLGL1jRczg/0yk58+4g
 g4IpQwfISZUvrGn1sgmi3Qyf346td
X-Received: by 2002:a7b:c4cb:0:b0:401:b2c7:349b with SMTP id
 g11-20020a7bc4cb000000b00401b2c7349bmr507505wmk.7.1695777791536; 
 Tue, 26 Sep 2023 18:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvmAbCdHBtbBPYY6OwA93/GuTSA2vpx2zUL7qz1gxZ/SxzZagjHJOuLVzBKH22yWaBd8jbvw==
X-Received: by 2002:a7b:c4cb:0:b0:401:b2c7:349b with SMTP id
 g11-20020a7bc4cb000000b00401b2c7349bmr507483wmk.7.1695777791184; 
 Tue, 26 Sep 2023 18:23:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o12-20020aa7d3cc000000b005259dd903e5sm7355596edr.67.2023.09.26.18.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 18:23:10 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith.ekstrand@collabora.com
Subject: [PATCH 2/3] drm/nouveau: chan: use channel class definitions
Date: Wed, 27 Sep 2023 03:22:52 +0200
Message-ID: <20230927012303.23525-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927012303.23525-1-dakr@redhat.com>
References: <20230927012303.23525-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use channel class definitions instead of magic numbers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index dffbee59be6a..ac56f4689ee3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -442,9 +442,11 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise dma tracking parameters */
-	switch (chan->user.oclass & 0x00ff) {
-	case 0x006b:
-	case 0x006e:
+	switch (chan->user.oclass) {
+	case NV03_CHANNEL_DMA:
+	case NV10_CHANNEL_DMA:
+	case NV17_CHANNEL_DMA:
+	case NV40_CHANNEL_DMA:
 		chan->user_put = 0x40;
 		chan->user_get = 0x44;
 		chan->dma.max = (0x10000 / 4) - 2;
-- 
2.41.0

