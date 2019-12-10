Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C689A11826E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE51289E3E;
	Tue, 10 Dec 2019 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0746E82E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:36:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y206so8712813pfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pu4/2ANQPmHZrnKzXtjqAfHQuVoyYqqMUD1zdA8TWA8=;
 b=EmG29wWHS2gp76gw5j3GqEm4nyPPfdATY90pc5UqygzKBc5TDmqGPwDFS7SRnJlaKv
 7plSFyoJZ824pMoBZx6dPBwetD31p5nCUr99dOefcYmnK2WlSDRMWCsxBGIU/hbT1sFi
 J5sqKnPsNI9YxRaOlVp1uuFE5MzhrlflzX/rTinscA52tmvAGE9MsWDUpVe+WmcUVFJl
 KePxNMxLVpYxBNdIsG6b5Dg2Z/ZlxyxdfpToy3Q6Pxlz8OCRAWtD+qD3vQTXA4YXXgx6
 UqFPjmi0QcIjF5O6pmS/9lCY/VNKg1V2uMy9j9pynP7yKD1pfyoo+6JVC6P0IBOl7r4o
 U8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pu4/2ANQPmHZrnKzXtjqAfHQuVoyYqqMUD1zdA8TWA8=;
 b=iGwoir5IuD/hg8U6pRBTr+oKmouNDGQ7jHMEbktxWbeE9fYHk8dj+9iPE0rXr9uric
 /zA171YBri3fsa6cBs1wdQ4szofaCPyAoHvY4TnZHQHRf2+qDAxABs0QE4HWwvEr2Bci
 IlyykrvyM8u1PPR3YdmD6mtJImwXatUXmFqz79qC3GEA/mnh4vBW+ZgtCbOoN2VUU+2O
 MtSEAz75FKigqr/bArnFrAjduBfc5FA4LUOGxCxuSZoRh/LbEfUCqsaQio8u572fDNan
 OOapRXhy8bxuh2Ff0SG84WS9nCk2URa1p4XBj8Yxdhi244g+1KMcVc9cZPsafGxuZ8i5
 bpiA==
X-Gm-Message-State: APjAAAV0A7a8iabNRLQDFdyrllZqBr74H+TaqoQGhb7zsc/F+QaIKSR0
 7N5lgl8q2A45ejeYnfjMeGE=
X-Google-Smtp-Source: APXvYqxgmOJlJQT/f6GLe/LclnoUiDgzdOI5a+hO/n4LoErVTMkV97Glbmatf5OUJuzw8HjBO71M9w==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr25582339pfh.92.1575967007902; 
 Tue, 10 Dec 2019 00:36:47 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y128sm2246632pfg.17.2019.12.10.00.36.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Dec 2019 00:36:47 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kevin3.tang@gmail.com
Subject: [PATCH RFC 1/8] dt-bindings: display: add Unisoc's drm master bindings
Date: Tue, 10 Dec 2019 16:36:28 +0800
Message-Id: <1575966995-13757-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 Documentation/devicetree/bindings/display/sprd/drm.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.txt

diff --git a/Documentation/devicetree/bindings/display/sprd/drm.txt b/Documentation/devicetree/bindings/display/sprd/drm.txt
new file mode 100644
index 0000000..7327b9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/drm.txt
@@ -0,0 +1,18 @@
+Unisoc DRM master device
+================================
+
+The Unisoc DRM master device is a virtual device needed to list all
+DPU devices or other display interface nodes that comprise the
+graphics subsystem.
+
+Required properties:
+- compatible: Should be "sprd,display-subsystem"
+- ports: Should contain a list of phandles pointing to display interface port
+  of DPU devices.
+
+example:
+
+display-subsystem {
+	compatible = "sprd,display-subsystem";
+	ports = <&dpu_out>;
+};
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
