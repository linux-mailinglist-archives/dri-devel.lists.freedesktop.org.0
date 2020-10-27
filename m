Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148729C9B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 21:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D036EC3D;
	Tue, 27 Oct 2020 20:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC806EC3F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603829238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=SHVkPineI031WVJrbCGteqt14oTNuWFr/V9p8cK86AE=;
 b=QmiThCpSS6ULANkkigSJsaQ8g2B9aGAhRXUqd3ukDk/CsFZBeEOiYCnAo6SHJAWntwSSaQ
 Sw/dQi9FOakjMBiaNPiFi6yMK+Pv935ckaiJt2NxVJanpAYil1gUqukNbvugiUgzTh6yVL
 a1F7RZJFMDSeVWlXV7zPQapAwOJOvXY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-E3bXDQCpNxaa66wNgMFQQw-1; Tue, 27 Oct 2020 16:07:16 -0400
X-MC-Unique: E3bXDQCpNxaa66wNgMFQQw-1
Received: by mail-oi1-f197.google.com with SMTP id v145so1200608oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SHVkPineI031WVJrbCGteqt14oTNuWFr/V9p8cK86AE=;
 b=repo3eKERUUM4GFEKX2cyRY8Lehl+BExXUNIrFyJnPjtfGfOoh0QwJs7+iMbN27aps
 baqn3g/B8f6CDsemCRaX6FETmpulDJZ9YobRXuptOhY48T5kY0nKGEUq02b5KOm0wr+N
 gks29HRuyN+t2eUvMBuC/A7vrQ8TH8QLdzA5kT++fkrJi11cYmWzBkyss3zgBznfGFfx
 iApjbAV/pkUZaE3WuFppDaSn0DwpW0XmPATU4iVr/W/j/kkjZhnUrs4O8cs6O+WBYJLT
 X8z94F6gQloVowZ2/RQtc4/kjUkIPzGv0vGUwZoueFvF3e5NomOM8Bb7kFwaMR1qoUBC
 iwYA==
X-Gm-Message-State: AOAM531oWbNwkW9t5dEHpab14JB9NvUW7YDMh2EWynhf8nS0qpbCET3x
 HshuwDxZvgxFdnr9XRVxxCsVMhp+QzFLMA5WErqpJTki4mDU8Xgo8nRaCGix+PGjPMQtL81yG4X
 KoKhBAJzB7fNSvPFyju2Y9jamzcio
X-Received: by 2002:a4a:6f4d:: with SMTP id i13mr3144428oof.25.1603829235842; 
 Tue, 27 Oct 2020 13:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa7KOheJ0ATgvhFY4mH04BC/Alap4L0XFHAP4s1GjDF+o8lWmc2BUU9x307je7dwCZ/9PAwA==
X-Received: by 2002:a4a:6f4d:: with SMTP id i13mr3144389oof.25.1603829235626; 
 Tue, 27 Oct 2020 13:07:15 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id o8sm1981630oog.47.2020.10.27.13.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 13:07:15 -0700 (PDT)
From: trix@redhat.com
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com, Aric.Cyr@amd.com,
 Tony.Cheng@amd.com, Igor.Kravchenko@amd.com, Charlene.Liu@amd.com,
 colin.king@canonical.com, Wenjing.Liu@amd.com, joseph.gravenor@amd.com,
 Bhawanpreet.Lakha@amd.com
Subject: [PATCH] drm/amd/display: remove unneeded semicolon
Date: Tue, 27 Oct 2020 13:07:08 -0700
Message-Id: <20201027200708.1596235-1-trix@redhat.com>
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
 drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
index 7b4b2304bbff..5feb804af4be 100644
--- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
@@ -858,7 +858,7 @@ static struct clock_source *find_matching_pll(
 		return pool->clock_sources[DCE112_CLK_SRC_PLL5];
 	default:
 		return NULL;
-	};
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
index fb6a19d020f9..ee5230ccf3c4 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_log.c
@@ -280,6 +280,6 @@ char *mod_hdcp_state_id_to_str(int32_t id)
 		return "D2_A9_VALIDATE_STREAM_READY";
 	default:
 		return "UNKNOWN_STATE_ID";
-	};
+	}
 }
 
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
