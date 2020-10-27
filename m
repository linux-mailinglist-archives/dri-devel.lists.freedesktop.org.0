Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0629C859
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8EA6EC0D;
	Tue, 27 Oct 2020 19:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116446EC18
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603825660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=l0PCwDa1wHGV+Q/jQHXorblfnJ1kxgpeCNddFrrP2u8=;
 b=DVWQEmwsHVuNj1CUczWg7D0aYOyzxiZFqWZYzi2iTK+zx7YUo7MpklqQRxPHMAdcHMdivf
 1r+E5ThCsrFAPM9ujIFs6GF5LJB4auyTjTCyqnkMVTpUeMRj83m0+A4D6MwZRgl+sKCZLj
 9hmMJDyGL1xd9Ss5uzTetxArIuLeQ9M=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-qRLgUpCeMfCMIJN8-CdoqQ-1; Tue, 27 Oct 2020 15:07:33 -0400
X-MC-Unique: qRLgUpCeMfCMIJN8-CdoqQ-1
Received: by mail-oo1-f69.google.com with SMTP id q9so1221967ool.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=l0PCwDa1wHGV+Q/jQHXorblfnJ1kxgpeCNddFrrP2u8=;
 b=DamSOr9Moixzvq332gFdt5afc6RR2CQDZ6UMWNjD3sVX00wWGzwVe7VAsuJxHB/MWM
 d+iZpWAaEUlTP5xlEuchTJNeTQSDNKczXg1wq39dbpzxL5RHNszPtIHMPEiKgvtNEppv
 ErkU/agC3FyOmwMngPJEJmRliYeQVnY7efoSKKwfeAnnPYBneoGNDGFc/TX40xx2GiR0
 UM/KfpVwJ5Ig7gxtMKPK+BdB3SRBjqga5fXfiVTpD/Xv+xgz3KNQVfMib4TWnfWaGL1+
 aiOIjtkfsI4+lptX/PYgsSuyEX6NmS94krHb1xXh/aqScaKeYk7ElRTrPiz2lsA4CoJ5
 JVpw==
X-Gm-Message-State: AOAM530XfrWTA1GdKnI1CmuxSdgiBds/DZBQlbqjAc6GQaQkjJ8eRis1
 f5y/RnuASodsqUaiAVXIzxUy5qEMorSxcAd+65PGV13uBHPmfE3Qb1CbmoiQOR0BoDZgpewjyij
 788C8a4FRdkciVY1a2/mDOh6ol9iO
X-Received: by 2002:a9d:491:: with SMTP id 17mr2601951otm.338.1603825652820;
 Tue, 27 Oct 2020 12:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWW33cuqBanM3RqWmNlIAsoMbT3S8VnWYdIw36FDCID2skFOgGdV/X/Ei7bypd9s6bTTHJSg==
X-Received: by 2002:a9d:491:: with SMTP id 17mr2601933otm.338.1603825652601;
 Tue, 27 Oct 2020 12:07:32 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x83sm1765339oig.39.2020.10.27.12.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:07:32 -0700 (PDT)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, jonathan.kim@amd.com, harish.kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, zhengbin13@huawei.com, luben.tuikov@amd.com,
 Joseph.Greathouse@amd.com, Hawking.Zhang@amd.com, guchun.chen@amd.com,
 john.clements@amd.com, tao.zhou1@amd.com, Dennis.Li@amd.com,
 Stanley.Yang@amd.com
Subject: [PATCH] drm/amdgpu: remove unneeded semicolon
Date: Tue, 27 Oct 2020 12:07:26 -0700
Message-Id: <20201027190726.1588801-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 1b213c4ddfcb..19c0a3655228 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -654,7 +654,7 @@ int amdgpu_pmu_init(struct amdgpu_device *adev)
 
 	default:
 		return 0;
-	};
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 8bf6a7c056bc..a61cf8cfbfc3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -953,7 +953,7 @@ static char *amdgpu_ras_badpage_flags_str(unsigned int flags)
 	case AMDGPU_RAS_RETIRE_PAGE_FAULT:
 	default:
 		return "F";
-	};
+	}
 }
 
 /**
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
