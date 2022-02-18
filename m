Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972E4BAFFF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 04:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EF710EA91;
	Fri, 18 Feb 2022 03:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1A10EA91;
 Fri, 18 Feb 2022 03:09:53 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id de39so6691298qkb.13;
 Thu, 17 Feb 2022 19:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=smgI3MOP3ZExWA5vhZDRgT/sxoUbszVrY843KRx6UAg=;
 b=LD9RgfrJLO3yiJqzb0a/d85Ea/mQa6ykDAloz/d7bw2cxwQ/GLWKDDF6lHPBtQT1en
 Jyoxwiofg1/Rei0oCty7JNAK2/hYSrKLAnZR7+AG0GGz6GN95Fn//ed2HKf7p1eyuBTz
 NOkLHT6HidkAjcDphEeoN+VKyd1FKDXmDq4Rp/Knhcisjq9ViwkGwiBsrSa3WtuFS+gu
 oIMWT0KN6n5+99MHCyLUvN3ma4zsLNZnV216Pz+Z/FOsSa1aHNySa6kSbHkHKEFm4Zat
 voFG48IDr0WMp0EYu3WUaKtnybxQibI1g0twdGQZuJw37hNyfmx63Na9LYudiDFrYOMP
 uTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=smgI3MOP3ZExWA5vhZDRgT/sxoUbszVrY843KRx6UAg=;
 b=ZBbs1Jxsf0FYc25n6Nd53JJhb6aYkWbv/PbVp6PE+vZmCGW1YgYFywXsGOtQo5lI+8
 tXOx28yX5k5eHqOTtjhDLZdF9ZTaiLcCD6XgLREZd85r/KGVtjicl0X+aWpkIOdVF0F8
 23Uyd6VV1aONz9Z+aqEINgetl5BCRJ2WJ1q0TuEXD135PNYJVrtLmqDJ+I3wNqQL6R2F
 he0jF6tPC6w50dkcs71Z7PhzpZl/IBfoD6EdYZP0EDiASjGNulf3utwlGvfws49kZH+k
 n5tZbdofIQyPnqlr+6D7jXF4HQiDXgpiXSSPkux27gsTx0WrceBwQEh4afPsnlKJElqa
 /6lA==
X-Gm-Message-State: AOAM532/6EijLWtft6RZ3r/rkrREIRpewG2HpwPqw0BMQ+juE52SVCFR
 3YLbiYfrD9iZs6nG8Exs6iY=
X-Google-Smtp-Source: ABdhPJw1Q3QSxbTpFYTAMVPiPbtJT/XnqEZtz0Oe56QkRWMBRMl8AHCPp743iOr09CjOYbqSk++aSw==
X-Received: by 2002:a05:620a:11a7:b0:60d:df4a:f732 with SMTP id
 c7-20020a05620a11a700b0060ddf4af732mr2948880qkk.244.1645153792105; 
 Thu, 17 Feb 2022 19:09:52 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id x13sm22366287qko.114.2022.02.17.19.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 19:09:51 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Felix.Kuehling@amd.com
Subject: [PATCH] drm/amdkfd: Replace one-element array with flexible-array
 member
Date: Fri, 18 Feb 2022 03:09:43 +0000
Message-Id: <20220218030943.1905838-1-deng.changcheng@zte.com.cn>
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
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
index 482ba84a728d..d7c38fbc533e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
@@ -310,7 +310,7 @@ struct cdit_header {
 	uint32_t	creator_revision;
 	uint32_t	total_entries;
 	uint16_t	num_domains;
-	uint8_t		entry[1];
+	uint8_t		entry[];
 };
 
 #pragma pack()
-- 
2.25.1

