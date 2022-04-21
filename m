Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1A650A0D8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA47410E402;
	Thu, 21 Apr 2022 13:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A81510E3FA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650547836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kiIHIoB66u3RP+01+bNiod8V2ewZbyshShw0I7c9tlo=;
 b=jEpKuTyjR9Ylt/SrPsszv+1kDoScyFUJEW6O8FajK0sMGqWCE34ELoeJ3jV1LW4n/CWCbX
 2r/e0LGdWFYsoVmbiq5VqjzNNZMnDFaRAuw2hB5Tjw5hfxhutgFKm50WcK1N31kckUc1xc
 yGkOJel21JqW7Hd9G37WsxYzm+nVREI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-UKrPHfpSPsWMWL_idl1XhA-1; Thu, 21 Apr 2022 09:30:34 -0400
X-MC-Unique: UKrPHfpSPsWMWL_idl1XhA-1
Received: by mail-qt1-f198.google.com with SMTP id
 u29-20020a05622a199d00b002e06ae2f56cso2963467qtc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kiIHIoB66u3RP+01+bNiod8V2ewZbyshShw0I7c9tlo=;
 b=FFl9/Y85etNbdSEG867Xz5PFZ670ZUVWxfl3/C3VxrSTvnyQxfzrnfYOxqJwpAKdgg
 V1UH9vBt1PFCJOppwC06rhkqMD6y9alNiGmYr9jGwAgMfAT0lqs9q4x7NaLzriNJz7fE
 LpGk6DJ/ujGY7q/vA7dG52gAokzSsSUh5Uyq3+gcoIFeA/I5zfRX1EU8uqQLKbZDsdnR
 TK2piWNJtwIyg0A1bFMY4msgGdrn8ZzKROLtbTrYugue0IW41yniuPxIo6X5BqHsbdNw
 ZJTQ4hlfAWjzy4wZi0Vq+yU588txOqhz5va4rtEpmosdrg+guC/0pPcHOKusyKC8clyF
 vxmg==
X-Gm-Message-State: AOAM5301wWioqKrx9hTf7Jdrd6naiDmguy4uArwbuo031WFvg/lX2E9B
 G0cVh1pIF+gG+Btkgs80kpxgLcImk6xYHEkTh6GCB6QL4cMyvv5oalzNJga0HMdKGdfqL325UKL
 7V/JYlbJAXhN+EXxyJIF5jU9YffmI
X-Received: by 2002:ac8:58ce:0:b0:2f3:5057:569 with SMTP id
 u14-20020ac858ce000000b002f350570569mr1048208qta.367.1650547834133; 
 Thu, 21 Apr 2022 06:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpPugCA4lCUt4oXKL9cMiCNteKlh+teO35BdZL1at8SyJW/uWnkJiuXZUWX83fHO6di9S8CA==
X-Received: by 2002:ac8:58ce:0:b0:2f3:5057:569 with SMTP id
 u14-20020ac858ce000000b002f350570569mr1048197qta.367.1650547833945; 
 Thu, 21 Apr 2022 06:30:33 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a0e8400b0067b1bcd081csm2706827qkm.66.2022.04.21.06.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:30:33 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/gsp: change gv100_gsp from global to static
Date: Thu, 21 Apr 2022 09:30:28 -0400
Message-Id: <20220421133028.724954-1-trix@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports this issue
gv100.c:46:1: warning: symbol 'gv100_gsp' was not declared. Should it be static?

gv100_gsp is only used in gv100.c so change its
storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
index 2ac7fc934c09..6c4ef62a746a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
@@ -42,7 +42,7 @@ gv100_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 	return 0;
 }
 
-struct nvkm_gsp_fwif
+static struct nvkm_gsp_fwif
 gv100_gsp[] = {
 	{ -1, gv100_gsp_nofw, &gv100_gsp_flcn },
 	{}
-- 
2.27.0

