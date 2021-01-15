Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA162F836E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674426E483;
	Fri, 15 Jan 2021 18:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9616E480
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d26so10186986wrb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fAAEuD3RlEr/SK+ua/zk+cZbQLwjXz0Jv5gG/pDSRFI=;
 b=RNlz61U66+BUG1s+nfI5teKJXRzuhAMcV/qAFVRXV+wo32MjqVdz82qZ+lAO7fU6y1
 6AeYS8NZOV1XOpHbW/l8uDFRm91lwC39apk+K9velV1B1eYzstpRzlMpCDA8KTHqXr9w
 UKqvIVaChpMvb5Xu2BYeV67rF7W62o/haTbVgcfVDoNHWaS2uYXSsrYQuwtsaA7cFUD0
 1d4o9RxUprSwq8f+2rKLEt1HiQFe3SzaQ+tFDP7FSt6o6cK8dxAjmEmaTxYFQuKq5WbD
 s1Im/XIHYHvruuyaGxAt3cLHIhdXy44KcuI/A0h5AKziCv8119TfPyA8Cbu5/MZhOwBg
 4szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fAAEuD3RlEr/SK+ua/zk+cZbQLwjXz0Jv5gG/pDSRFI=;
 b=q33uAj0kRLsYI+u9OAmr9rhrvILMmSiBkdsHWuAtyN94XlYaO40ORsa8jzIavSGiiG
 //1xNaEr30qw0pEHm4/i2NkqgHU6+phqR9Gu9YjUzrZcsegpznFis+iemH0SqpLeWyyy
 s3/FW5oZ0PBWuFPKqQfEflzUv341jzoxLVW0+7jsf/oGm1WraZHHvHlwUhS9z8JavKjA
 o5k2lZm50mAADqVHHOlrbJmQsETV72rgiW0xskmomeB2R9H3QBWIYN/fi3TE9fdX/RJk
 rEICDqN5nnoP9zLC5HDqoVS39tRk7nTWyEPIJ202b2eeskRYh3TRneHCuzBeFOpdBIo4
 n3cA==
X-Gm-Message-State: AOAM530x+/3L7PNvcBF1TLR6aM/FXQ2LFEEfKZXjEKCEFjiQG9PaUkaw
 DlwU1Igu621HTgjty1hErxAiz68UWgwzkniX
X-Google-Smtp-Source: ABdhPJzlmSdMVzlgQMNkUxNs186KSUwDnAnO4SsNgnPYTbXf9gsWuDYH8x8BWmMJW6fVGztzH9DU9A==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr14777366wrt.396.1610734413540; 
 Fri, 15 Jan 2021 10:13:33 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/40] drm/vmwgfx/vmwgfx_fifo: Demote non-conformant
 kernel-doc header
Date: Fri, 15 Jan 2021 18:12:45 +0000
Message-Id: <20210115181313.3431493-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c:299: warning: Function parameter or member 'dev_priv' not described in 'vmw_local_fifo_reserve'
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c:299: warning: Function parameter or member 'bytes' not described in 'vmw_local_fifo_reserve'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 7400d617ae3cc..20246a7c97c9d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -276,7 +276,7 @@ static int vmw_fifo_wait(struct vmw_private *dev_priv,
 	return ret;
 }
 
-/**
+/*
  * Reserve @bytes number of bytes in the fifo.
  *
  * This function will return NULL (error) on two conditions:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
