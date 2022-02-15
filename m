Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E8C4B6717
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 10:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23D710E419;
	Tue, 15 Feb 2022 09:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7B10E419;
 Tue, 15 Feb 2022 09:11:56 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id m25so16741959qka.9;
 Tue, 15 Feb 2022 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBQscFyooYL0WHuST9zmiXq7toDSTo9x20y433njXvY=;
 b=CUvbeESCjAqhXzzfxF/YYa6U3SM4LMGYKlC7SDkDR1uhzWCLBoEldyNjHc/MwM+Jqt
 4pPfqpLePsZCSFx+7tpIPqSBGnq4Hjeg6k1HyrJZukjNbYEQuobWYo41naoqODynPPZo
 f4PX12XFozrF2o7h/ScjfH+qvIh6UT068hiTttGh0P4ulZuLI4lN0Rv0S3ewaEoYQ6H4
 D8C69zV9DlfMSDeJ6mK8HrE+xx2GzFkpH79qQaz+FiWQVwyzsvhMl8DaNIWLVrAG9iol
 d5IUK6aoMjRZQB2RfR0jEzeIYr6EChVWSe3awOtMZy1hiEkWLE7zO2rmxvsnq2gZT6PF
 7Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBQscFyooYL0WHuST9zmiXq7toDSTo9x20y433njXvY=;
 b=UlDyrqhnbhWnEuL/2sDlfxQ+91qxB3jsjqdYy9u1r2DRkA/xIWCDVtUaI7BH+CRByp
 nL3Og3RPvDvCBaFIjC7v30PdAYdjpuwrQDjJ1EJxUGeQe5oFLrk4BVhYMR1vQvGjyHsw
 4v2zhN/GzJHSi3LO6VmLxfcDY/kWAz1e78oJ/EeXef0S14uMsMq/VX7G8qWKRlMhDHoT
 ADf341wJzGPudMD17AD/y9yS+2F5pyoucs/QjyPpsZwyGHK6XmKoambN8E0JGQbNVE04
 8Ux2QiKGqE7zF7b28A1XYurQcDcGQe2IS1ZGHISGjs3pdRtbQ4ryAgE/T3+v50xXDQ8X
 rjzg==
X-Gm-Message-State: AOAM5333rpIMRWN8dNsx4Sn1WFQVAYVW8cPWavKxBPHjUrRhmS7zd/F5
 BI0FvMBXh01y5SuXmyX7vB4=
X-Google-Smtp-Source: ABdhPJzt2l3x8XeZpyli8EcdnuyjGHmBO9r/EPioUdHk5iFiWxXUFc2BA0D+lX3UAgQSkHxG7KiAfw==
X-Received: by 2002:a05:620a:2589:: with SMTP id
 x9mr1457241qko.335.1644916315265; 
 Tue, 15 Feb 2022 01:11:55 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id r3sm16683371qkm.56.2022.02.15.01.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:11:54 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Felix.Kuehling@amd.com
Subject: [PATCH] drm/amdkfd: Replace zero-length array with flexible-array
 member
Date: Tue, 15 Feb 2022 09:11:42 +0000
Message-Id: <20220215091142.1775600-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use "flexible array members" for these cases. The older
style of one-element or zero-length arrays should no longer be used.
Reference:
https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index e54a52785690..7d39191d13f6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1084,7 +1084,7 @@ struct kfd_criu_svm_range_priv_data {
 	uint64_t start_addr;
 	uint64_t size;
 	/* Variable length array of attributes */
-	struct kfd_ioctl_svm_attribute attrs[0];
+	struct kfd_ioctl_svm_attribute attrs[];
 };
 
 struct kfd_criu_queue_priv_data {
-- 
2.25.1

