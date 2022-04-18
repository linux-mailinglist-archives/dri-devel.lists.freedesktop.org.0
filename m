Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38705505EB7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 21:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAA310E18A;
	Mon, 18 Apr 2022 19:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413F510E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650311317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xoFC0RlqU29MoZ59ErURITWrPmQFVCqFinpLIIkANfM=;
 b=Ep2XXYVVY8f9LcjjbgjtDd8sqpv3Q95Yfh1lqTyOKf6396frvqqIOPU6S58hpB3BPqBC68
 j9hAnZ/Sp+KfKAQ9VfHEiwfOigQo7PvX+xO/BY7x4wWagiI8uPL00UWMmYW4LxbRrwwCLE
 Lxx69SiRBN7ZWQKQRM3A7Q1SJcDMES4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-6TErtWL6OqqS_k10F-57XA-1; Mon, 18 Apr 2022 15:48:36 -0400
X-MC-Unique: 6TErtWL6OqqS_k10F-57XA-1
Received: by mail-qt1-f198.google.com with SMTP id
 a25-20020ac844b9000000b002f1f8988487so2749241qto.17
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 12:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xoFC0RlqU29MoZ59ErURITWrPmQFVCqFinpLIIkANfM=;
 b=cIwal1No+de2N/+ddq4oBj8JbrX3Ld5OwX3lWpmLsGMojjJuxCUjQ5P4naGFM6Wk4Z
 JJuF7mzO6fHweYclJg/PMuEgJ2m10g8ySg+t99MinFt/d4QhHfrQ8XEr8B3FxnT8fwJE
 qyzAJMGHL6ibO0dJh/O29p0NODlxRWebE7PExyOtM9jHakuaGegCbF5a90Wskq6MQ6L9
 JH05qgVlpI8nH8GGDvh/i2KUlneIaZRI/rNqNZSy8R9c3nbYLw6TsndFHdyWT3AW7QXc
 c7xTGumFUYE0TqpazWng+153QqXB+v6iXtVzUEf4gDivNmiyMRlrbSPCNrPg5DZNK1/Y
 8Rag==
X-Gm-Message-State: AOAM530MitO5uhLDSVjOMXd6icv+szZqsnW064PX032+nUZU5m7lVM3Q
 vHXW201MuGanrbDaOSm5xOduyDqNFB+ds3sBANS3s6Kkq4+eoVg3LHvNXTLLXUngTFpHnVxHKn8
 34uNMEP4WPvDrRc8Mf4mkHg2J2r5x
X-Received: by 2002:a37:5502:0:b0:67e:a143:80da with SMTP id
 j2-20020a375502000000b0067ea14380damr7634840qkb.329.1650311315542; 
 Mon, 18 Apr 2022 12:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygpNhttVMJUTFKmX/4Fl6amPuHUl9AtPkfNHtmHbJyX+T1xlwpJ6/GzrDPFtzLWBf4yMrmnA==
X-Received: by 2002:a37:5502:0:b0:67e:a143:80da with SMTP id
 j2-20020a375502000000b0067ea14380damr7634826qkb.329.1650311315300; 
 Mon, 18 Apr 2022 12:48:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 3-20020ac85903000000b002ee83037459sm8393773qty.42.2022.04.18.12.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 12:48:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, stylon.wang@amd.com, Jun.Lei@amd.com,
 wenjing.liu@amd.com
Subject: [PATCH] drm/amd/display: add virtual_setup_stream_attribute decl to
 header
Date: Mon, 18 Apr 2022 15:48:30 -0400
Message-Id: <20220418194830.3266024-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports this issue
virtual_link_hwss.c:32:6: warning: symbol
  'virtual_setup_stream_attribute' was not declared.
  Should it be static?

virtual_setup_stream_attribute is only used in
virtual_link_hwss.c, but the other functions in the
file are declared in the header file and used elsewhere.
For consistency, add the virtual_setup_stream_attribute
decl to virtual_link_hwss.h.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h b/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
index e6bcb4bb0f3a..fbcbc5afb47d 100644
--- a/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
+++ b/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
@@ -28,6 +28,7 @@
 #include "core_types.h"
 
 void virtual_setup_stream_encoder(struct pipe_ctx *pipe_ctx);
+void virtual_setup_stream_attribute(struct pipe_ctx *pipe_ctx);
 void virtual_reset_stream_encoder(struct pipe_ctx *pipe_ctx);
 const struct link_hwss *get_virtual_link_hwss(void);
 
-- 
2.27.0

