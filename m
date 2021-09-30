Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E941E2B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 22:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FCD6EC69;
	Thu, 30 Sep 2021 20:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3E36EC69
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633034114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ddey/K9wpIxOBXbjiNaGsj4E/caV13pJbiNDITnKjiA=;
 b=Zzin6+sLBOzPqnpTzTLf29IayZAP6Ki+vLqoJpSdoCeVSDPrH9PM0P2GCvL6jMPUUIIeBy
 FQ47bM0FAv9QE8QeprLadk+EmNKlzKOEQj6VD6sj3wlNPtWxJpYQwIPmC3JJv5bFtrQxCO
 y4RjVnhvWw86yQ6/RU/WZrPosB/ZYTw=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-z50PK7DhMbiMsojDl9xnRA-1; Thu, 30 Sep 2021 16:35:10 -0400
X-MC-Unique: z50PK7DhMbiMsojDl9xnRA-1
Received: by mail-oo1-f71.google.com with SMTP id
 y10-20020a4a2d0a000000b002ac6b0dd16fso5587930ooy.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ddey/K9wpIxOBXbjiNaGsj4E/caV13pJbiNDITnKjiA=;
 b=CymmHaIjuqBBFPPtlS+1XtrJG3ncIEdvg2oMLDO0y8LmXSWTlkuYFb6HVbbplysmzl
 z5yfVrGjoIAFczUWvn4gZjWs5/cPLUzAfarZCw1g5V4M2VTpJNvRDxMC+ryvNtAyIQNF
 /kjrNyEw2V93RRpfH9gQ4+EDgxBUDI+SSc3D+oh36NVhRuI/2jCBgJvDD9JZa3busZkh
 uIPi0K7frkEKdaOlVb95EJd01mXtsPCRI+HnO0VGX2MPOD9DfTuoXT033Xwm3IAJeEpj
 s9iwrbmp4wlBAeS30DUV+O5C63VZd+wpgxNysklWo4kpJu6Igap1vpq5zzB/8CWnnEjb
 DGIA==
X-Gm-Message-State: AOAM533qUu035DIR03Zeqoe0Y4/TDI+sU6/6iIJNyFrRrJ9VWYtEgOsS
 4XvbVHASHv3PJc4A0J9gKW2GtfA2VCNYq7Ia8RSaFvhVzf4XkbZuHoUOPzz5koo5MtmrNisx2IZ
 fdojEsRlbmKpRdOXpZYecg+g2E0P9
X-Received: by 2002:a9d:eac:: with SMTP id 41mr6915151otj.38.1633034108767;
 Thu, 30 Sep 2021 13:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHDY1UmnahWM3r/K2pa4cUoccqfVEBvB3ig9Y7Mb2SIBYYFlvI2J1A9NKArgCzNIpdaObCPg==
X-Received: by 2002:a9d:eac:: with SMTP id 41mr6915131otj.38.1633034108556;
 Thu, 30 Sep 2021 13:35:08 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id a23sm769273otp.44.2021.09.30.13.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 13:35:07 -0700 (PDT)
From: trix@redhat.com
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: match the signatures of the real and stub
 kgd2kfd_probe()
Date: Thu, 30 Sep 2021 13:34:58 -0700
Message-Id: <20210930203458.441556-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Tom Rix <trix@redhat.com>

When CONFIG_HSA_AMD=n this there is this error
amdgpu_amdkfd.c:75:56: error: incompatible type for
  argument 2 of ‘kgd2kfd_probe’
   75 |  adev->kfd.dev = kgd2kfd_probe((struct kgd_dev *)adev, vf);

amdgpu_amdkfd.h:349:17: note: declared here
  349 | struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
  struct pci_dev *pdev,

The signature of the stub kgd2kfd_probe() does not match the real one.
So change the stub to match.

Fixes: 920f37e6a3fc ("drm/amdkfd: clean up parameters in kgd2kfd_probe")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 38d883dffc20..69de31754907 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -346,8 +346,7 @@ static inline void kgd2kfd_exit(void)
 }
 
 static inline
-struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd, struct pci_dev *pdev,
-					unsigned int asic_type, bool vf)
+struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd, bool vf)
 {
 	return NULL;
 }
-- 
2.26.3

