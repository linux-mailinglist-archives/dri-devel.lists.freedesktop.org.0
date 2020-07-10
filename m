Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D221C04E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 01:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE726ED6B;
	Fri, 10 Jul 2020 23:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A7D6ED6B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:47 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w17so2836167ply.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOEifiIh+gw1ksCpw3+MdPsiCbOdQ0cDfgdVRKb9Csc=;
 b=k8zU2rjLwwu9xxH6CtqzfzziVe1vGy1bbnfaYS4aV6d8OBtTZkbwlSOJJvvmPXJbSR
 e+lH31NsyffijpPqmezQuKlLqrpVO65l/rRqLmPGfkCVwXEwRCH5bYRYw15DCh6yEcR+
 41eQMVmiDyHYBBVuEs5cYvgWCaYuLUL9AnpjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOEifiIh+gw1ksCpw3+MdPsiCbOdQ0cDfgdVRKb9Csc=;
 b=I9dEw1Ir6ydINdg5DrQ38H5SvmkokoDhc3uZBj82ZWrTnueEIHYscbZ4k7asufhQ9P
 GrBaBEh1sPqo1FiTj7Ojte8+BucrS8CGdfcGlq/3q5Y2ZxrvdkLxD2VFtJnNKdK0jIMJ
 kH/irufLOtC10GHl/BGrsRgll6McrDnOTQVIhakZ+33X14IdapkkNS5F5GCukTEfxYzF
 VIbHi0MQJTsjMQV6srwcfDzS7HHmNKhnlbVwNdo6x5YB/p6cIF1JXyuwNNMKnrGxRgpZ
 9FA6OCw2oF2hjPfjX/NfmohlhvkiLJo7DhCpwK0LU/YEv//p/WZbsk5qWKlktr765whP
 81tQ==
X-Gm-Message-State: AOAM533zBXsswEbYmJ/qDKOwh03ZZivtu/7RvGj+kCgeMcQFiBz/Bhlw
 pR0lQ9rDlOmI36PacrHWBWxuGQ==
X-Google-Smtp-Source: ABdhPJzdSjyDJg2gb4e4NI73Cop7js70UClKGQIJKPQF33PAmLwF3oSqZOi78uGWEWIaJ81gbrnxfg==
X-Received: by 2002:a17:90a:cc:: with SMTP id v12mr7439843pjd.96.1594422167234; 
 Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/9] dt-bindings: msm/dpu: Add simple-bus to dpu bindings
Date: Fri, 10 Jul 2020 16:02:17 -0700
Message-Id: <20200710160131.2.Id4b5c92d28b7350d047218774afaf69b683651e0@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a whole bunch of child devices that we really just want
treated as other devices to instantiate.  Add the "simple-bus"
property for this.

Commit-notes
This bindings file really needs to move over to yaml.  Hopefully
someone at Qualcomm who's working on display code can help with that.

Right now on Linux we have a manual call to of_platform_populate() to
populate our children.  That's pretty non-ideal as described in
another patch in this series and I'm trying to remove it.

I'm not sure how much of a hack to consider "simple-bus".  I've seen
it used like this before, but if folks tell me that it's terrible then
I guess we'll have to figure some other way out of our crazy
-EPROBE_DEFER loop in Linux.
END

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..b88269524365 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,9 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  One of:
+  - "qcom,sdm845-mdss", "simple-bus"
+  - "qcom,sc7180-mdss", "simple-bus"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
