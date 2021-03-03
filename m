Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D832B835
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBD86E8FF;
	Wed,  3 Mar 2021 13:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B722B6E8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:05 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w11so23713853wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BjfwsSGdxPmrvaJOjBX9ijfyCI7yYPSZw53zZSFU+oQ=;
 b=sGQaCdMVqDriVS+b6KY0lBnm3pYMMCpz4EqqljOvMl7zgk5jRtBQ2i2oPWzoFCYHiP
 sz+9QyRiQeLU9+2j2CdDvc1h+dR8wwSwQ4ITxc+oKDq1N0/R8XSEkNboWDtqtZRMnXCa
 YoMKsx5UXZ2aTahxpyoVfcxkalHnJTobJl2WL5kI/S1/jtfJWJAav5w2Elr9j1T8x+Dh
 jpIeXoXtZ2FbJm1MLHx/hwVEq1Jn/d9lhTNu4mndi9xm78/Qc0H5eJXr6CNQ9RIcsbEf
 88pL/SiRunxWo13GmHuvzJddVrxHN4wVC1cRR5BhEEa84NvYQTR1psg5kWSKOi2m0li5
 tZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjfwsSGdxPmrvaJOjBX9ijfyCI7yYPSZw53zZSFU+oQ=;
 b=OgD31VGCMXaGkF0pYBL5iuHdm4F5ILI9MyeFUEsY2XsxFL2eIycFKykVlDhvg8dQAH
 KZ8I2gqc+KJTR6s5GqBXPVF9UGK/FSfeNRryEiV1MxyLzVIRuvERyKOWm2Vr4HyLtxUw
 3GUQtClY2TMc5OHvHjsDnbEQbIQAgT7AsaFYqIuKns+fuuBrZVdT3EQWSqFySxYUmx03
 6FGRLdwmPc4PDvaxxCOmuH/NDe6PGL5nmnveGdW8Y3rINPFj800DgqE4tZFxcGjZA+Xz
 0rhMJY06zV6fkyAdlgSmH5vzcIfsElqJICNpqvFF5eKaW32KLf8cGmHhKiY/rRGG8auF
 VOHQ==
X-Gm-Message-State: AOAM531Pf5W5leqclgDZ67jK/eLbeWyh6/1M+0s7ZepV8nJil6AEC1nN
 7PpJl8PQC97lY0NmEBsZjvDslg==
X-Google-Smtp-Source: ABdhPJzH4w3Zis0RicRCbLsKI5Q9wSbWJ1nQ6IQidubaAIk3XcmrOVqPNyRlg8jIRjJsYzSZNZTzpw==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr292223wrc.3.1614779044383;
 Wed, 03 Mar 2021 05:44:04 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/53] drm/vmwgfx/vmwgfx_fifo: Demote non-conformant
 kernel-doc header
Date: Wed,  3 Mar 2021 13:42:56 +0000
Message-Id: <20210303134319.3160762-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-13-lee.jones@linaro.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
