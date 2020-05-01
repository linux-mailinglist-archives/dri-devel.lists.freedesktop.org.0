Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404581C0EF0
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645496EC10;
	Fri,  1 May 2020 07:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DDA6EC10
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 07:40:13 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o185so4250151pgo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 00:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QD+OM/IPa9x7hJvHclwxEGNJ9gIn9LRrmuc2cMqM+jk=;
 b=uHgfP9cWbKjgsICCn22DXY5E8YVkK4lR5mSH38oijVyLq+WDsYAckO411+fCRx4fSG
 92T98KiXWYh/Veuu9k4mILrjo6zo4M8S4hPIn1pjXH4afDJRgMkF3HIHomYHPtbJ2CIT
 oHO3AozrS69KPbj/CTUAtS0sIYMkdKaiEqIvnSOR5NCG1ZOjYGvWsRTbWlGF2X+swrpU
 pF1SZxSAvCiYlvGEZHBmQuMPgM/YMkwvPoLMwh2SWAo7qUkc5ifkQoPpgJfJmVVL5VBG
 jEdBB2/STxwoSAR6Dj/ZZDJ0PZXyVaXxiFVJoKoWWEDCYQLst2EN08W0fE9yARqfug+f
 NI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QD+OM/IPa9x7hJvHclwxEGNJ9gIn9LRrmuc2cMqM+jk=;
 b=c75zsyh87E0EpGJpg+D/34GwVmvaw6sjtXYbySvObwDfNPjc/JpEFOjfXiHGgD+dcD
 qTuw34hteiwW0jq/UlXBRmrqokhRJneZOOns1E3lUTPRaDV5Ok4CTC4qgFCZ/XEA7PN+
 Sw+IjvVSQVa2J9PTMuaeJU0XbL8vuVTCQ1u+eNgiZ+5aMb6J03fvWznU6/bSEQDB0vYy
 kBK5CyfgWHYJITJoadNfPV1jWlFIRiZfmdgyKZYsI3Jt/4k+/4CdvnoROQ/hntYwJSOm
 Nys21x89lBa/1FxkDN0TtGL9Wx383iMzTbQsQFBNy3WCF0k6jJ0UA6eqZOS/bp0ISQak
 2cxQ==
X-Gm-Message-State: AGi0PuaMQxxwCqNBjnfJ6+7nHAlk1rlnqA8TjNaQRpOibYHBklgRQIQZ
 QkF3ye4WRBROAHi3FPwTtFA7cw==
X-Google-Smtp-Source: APiQypIe0OyaYrak6ULk6jy1juCWPHfm+627JYy+N9jmFW5Ppc7wa4zxgW6OTSiIq3XBtubeLxsMWQ==
X-Received: by 2002:a62:e113:: with SMTP id q19mr2839382pfh.107.1588318813249; 
 Fri, 01 May 2020 00:40:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 w12sm1557841pfq.133.2020.05.01.00.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 00:40:12 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 4/4] example: dts: hi3660-hikey960: Add dts entries to
 test cma heap binding
Date: Fri,  1 May 2020 07:39:49 +0000
Message-Id: <20200501073949.120396-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501073949.120396-1-john.stultz@linaro.org>
References: <20200501073949.120396-1-john.stultz@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sandeep Patil <sspatil@google.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm@kvack.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds example test entry to create and expose a dummy "camera"
cma region via the dmabuf heaps interface

This isn't a patch I'm submitting to merge, but just an example
of how this functionality can be used, which I've used for
testing.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mm@kvack.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index c0a6aad9593f..5eef1a76d51a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -81,6 +81,13 @@
 			reusable;
 			linux,cma-default;
 		};
+
+		cma_camera: cma-camera {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x24C00000 0x0 0x4000000>;
+			reusable;
+			linux,cma-heap;
+		};
 	};
 
 	reboot-mode-syscon@32100000 {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
