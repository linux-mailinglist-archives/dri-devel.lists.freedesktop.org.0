Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C543410F2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 00:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3216E20A;
	Thu, 18 Mar 2021 23:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96796E1E8;
 Thu, 18 Mar 2021 23:20:30 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id a11so5466450qto.2;
 Thu, 18 Mar 2021 16:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OQr5EWF14LJSJDPiUoRbhnzYOObAaD7LteF3BV720o=;
 b=BH2GYsC7xrZSawjjvrKi7E1Kc0MBUY8y3HbDcq5CoOVdgvAqd/ZFIB91Cgc4k24rxm
 Jzwfs4OmkG9SSzow3D9RFnInet04tcVAHbS/kvSsZo/n3wxPB0ZblXDe3S2OibEmd00+
 2wsux6NTtdhAS8FBJSVsSQ3LhL8Gz6KcRjYaQRvxrpQ/CdLD9OilEIqqorp2N5IIlFgQ
 vSfj3p9QLGIcCjJ3T6/sZS8Wc6WdrI2KjRy68H3dlh3MLK8Tuu55nd7bh4U3mJAvrkV8
 mietxE68ggbzTJUQQQoU3iZg2WPP9J/kj8U1ZCpLkuFHBhwTnOAJ+EVDGJfNYbTOR4C3
 OztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OQr5EWF14LJSJDPiUoRbhnzYOObAaD7LteF3BV720o=;
 b=MvqTOR2uaAW/rt7c7bhFtO3RaVY+BwJ3/g/d/auhk3b/KRy/b79+SFouTLQbsjYzIP
 l0U7Dl1GhkkTV72JcC51t/BO9341Z9qXnJjd3AMYWSOeUIwlr8rJfZTPZOZCiEamj56v
 hJnSscPBK+NFXruFnSloeS6k1oRkBRotUm38knVtBDLgARClJi6js40OiNQpSxBKm19/
 2X/1UAEJW082aUTMaKTZGsYEwfa9YixxunYecwVblP+iPqVJKIvkWpUT501G7mRh4qR3
 yw5ShU5FAKAKHzwNkNLzAQHQPlztpJDpVHyuAX2gRW5cQOg8hvRME7dRnzALFHCM3gB4
 /evw==
X-Gm-Message-State: AOAM530ii0t5nKwraVCeSKntgYOrmS+ci2qeRhJ0orCRQTo6kemUeA4Q
 nWQLszoe3Wca7QvqbMJd54BieBQbMPTZSLer
X-Google-Smtp-Source: ABdhPJxfhehGR5xA4asaV7R/Ng3L0bjA7nfBuq/tPpOKrgowt4gEhjUFzXDP4Br4uw7hPIybSiRzxg==
X-Received: by 2002:aed:38a2:: with SMTP id k31mr6157793qte.187.1616109630065; 
 Thu, 18 Mar 2021 16:20:30 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.63])
 by smtp.gmail.com with ESMTPSA id b17sm2438571qtp.73.2021.03.18.16.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 16:20:29 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, John.Clements@amd.com,
 guchun.chen@amd.com, tao.zhou1@amd.com, Likun.Gao@amd.com,
 unixbhaskar@gmail.com, Bhawanpreet.Lakha@amd.com, ray.huang@amd.com,
 Jiansong.Chen@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix a typo
Date: Fri, 19 Mar 2021 04:48:15 +0530
Message-Id: <20210318231815.19546-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/proces/process/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index bf3857867f51..c1d5a3085bae 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -598,7 +598,7 @@ static int psp_v11_0_memory_training_send_msg(struct psp_context *psp, int msg)
 }

 /*
- * save and restore proces
+ * save and restore process
  */
 static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
 {
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
