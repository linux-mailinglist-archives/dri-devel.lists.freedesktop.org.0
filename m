Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561468949B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453F910E73C;
	Fri,  3 Feb 2023 10:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2359810E735;
 Fri,  3 Feb 2023 10:02:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u9so464780plf.3;
 Fri, 03 Feb 2023 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BG2QYvy6NMh3jkUceNvjWVdBbpNIzuoerxuxOO9e15w=;
 b=hNvMzC7RPAckWz7Z2Qk/u9uDSOaeNgibp3y0pbCj3dUMyWcnazq467VyDLAE7Uj3d+
 Hp1zHYFUQ+ymjA7vvesMXLXQlR3ZCGtO9nDPjDrmvHtiqAoCVkotR9iYfdok792ktY22
 dVbbMPbKQ8mPs/e46SBPxHxARgmpU+mJBjSHv7thd/lpp2k4Un9JMnxjGLuncHxF/RUL
 pD8y2Ml8GRwWXIGIRZwhE+wB3poEavRbZNRLXJC2N5MOnf/NjtwXM+bJswMQEBnLw2+e
 Xqlt9ngIcG5w09YsTnyzVSncicip44pBj1M14JwwvKa/zkHmDIBYC1WZD4vRNBzKI4e9
 Xn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BG2QYvy6NMh3jkUceNvjWVdBbpNIzuoerxuxOO9e15w=;
 b=4Hx3LBkRxwQQyYAZDn3J5FstFhyns/FgAzrYkP8ttT+IxqDrQZdlzmQtKH4Jao91o6
 2a/eAZ2PMM6zbFoLjxmUrjUVGORCgyiVu9rOoTbkCH7cV/6n2/yTxSc2vg6CcdH6fjXx
 nk3a9uXQaA+A8sx0OlXarCSfqKcve0iPuBJXUTfNw91LWnD3tm8oXwpYsxkTLJQgRocs
 nAcvJp+l2vkgX6YLwHxCgCFOrvFW3rrirtaWvC6CqH/A0YiWd0uB69e8+pjevJ6pRfeQ
 /O4HMeTVP43MY6/7P+f1RirpNPKgytYJm+z+JSxqwuCc7ipu+HBroKNDujHPLySUw5b/
 JK5Q==
X-Gm-Message-State: AO0yUKXqSAHQX7uCxe9Mt94O0ilsm4yay39WO/uEh1h1bM2vL8+8ZGzb
 nlK9Q3DWoPO4pXvBBMEOzrA=
X-Google-Smtp-Source: AK7set+R0TEkeypd3nINmPSzcBNxBayigz71nAlhY7yu1gmDzLP7p9w777hoCF2OhaAxhY11nHoCIQ==
X-Received: by 2002:a17:903:234f:b0:194:4b98:42c8 with SMTP id
 c15-20020a170903234f00b001944b9842c8mr11309975plh.28.1675418566654; 
 Fri, 03 Feb 2023 02:02:46 -0800 (PST)
Received: from debian.me (subs09b-223-255-225-232.three.co.id.
 [223.255.225.232]) by smtp.gmail.com with ESMTPSA id
 e12-20020a170902784c00b00192b23b8451sm1194930pln.108.2023.02.03.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 02:02:45 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 7B73E1054B4; Fri,  3 Feb 2023 17:02:41 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 2/3] drm/scheduler: Fix elapsed_ns kernel-doc error
Date: Fri,  3 Feb 2023 17:02:14 +0700
Message-Id: <20230203100215.31852-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203100215.31852-1-bagasdotme@gmail.com>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=bagasdotme@gmail.com;
 h=from:subject; bh=qrXofAp66flXv+Lia5rtjdHHkc9E4+c8afVKnwKMo98=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMl3bi8LuVLl4BMdt8Vjx6WHU75L7q76orZFacUmve8tRyp5
 vLTyOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjAR7wkM/4v/hf88NL12XtLb9addPR
 9ETmTL89Vyub4v7u8H15mdgasYGVbbNJpdPNs3mVXUd8bzWzedfun4a+bJhHr5T7lnbZOdww8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Srinivasan Shanmugam <srinivasan.s@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warnings:

include/drm/gpu_scheduler.h:232: warning: Incorrect use of kernel-doc format:          * @elapsed_ns
include/drm/gpu_scheduler.h:238: warning: Function parameter or member 'elapsed_ns' not described in 'drm_sched_entity'

Fix the error by appending missing colon to @elapsed_ns name in its
kernel-doc comment.

Link: https://lore.kernel.org/linux-next/20230203135027.1a4679d3@canb.auug.org.au/
Fixes: 248cd9b265fca6 ("drm/scheduler: track GPU active time per entity")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/drm/gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9a50365621ed8d..9db9e5e504eeb3 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -229,7 +229,7 @@ struct drm_sched_entity {
 	struct rb_node			rb_tree_node;
 
 	/**
-	 * @elapsed_ns
+	 * @elapsed_ns:
 	 *
 	 * Records the amount of time where jobs from this entity were active
 	 * on the GPU.
-- 
An old man doll... just what I always wanted! - Clara

