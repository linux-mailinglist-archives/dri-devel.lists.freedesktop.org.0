Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711692B4DB1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27EC6E9F6;
	Mon, 16 Nov 2020 17:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6296E9F6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so45162wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9DOFB5vifJrGCOQSMWDE/st4cKx6AKkD/v2b5HFyfb8=;
 b=X+iICUpO07+6FTpBe9dc71KtGg8uVMewqxXw4D54HQsNDi4x7YTQk2GI/vSs8br2zi
 crL563AJExk5eH18GIwjCAD0tshWPsin4COHswwCL/nH8tx33M1PjxIOU3kiTc8Fvs/u
 gSRDchhQJmAEdF9gUpcdoeNucpAXAp8CNKCRwvF3+HVAfYHagK75m6m7RatkRP0atc2m
 9zQwBX4MPKuBogzEL+AppX1vdWxnkxbscsUjUd8g1/tOhIMjquQ7asSMKY52j9Lc9L2n
 TOYOoTdPw779Nlt23XfL9DpCiipWJ7T1NQval3HatqKNeblalmvAiatADjg04bp4H9PL
 Wj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DOFB5vifJrGCOQSMWDE/st4cKx6AKkD/v2b5HFyfb8=;
 b=RrPxSMVYaKs28bUsr9RU/Lmh+TYNiaImRSXyQNWIaKG2PJGz7LMmQyR8XFKbskxw3w
 ysKDQSO54CmOJA+X7/8wDmESsecHliCw3ZWDJwqZkWL3N/GXyuOaV4O00EM9PFGiI44g
 Tn6It4vzIRFo7a3Ar7+2Pzi3hWTiQfIieHKnYv4+/G6f6OqyX+lfkr6TTnYeUTE0qeK3
 DRgWa0q8KzPS4FuGsih10ey5vUx/CVQYUgA4FKT+rDlcFLkgCbQsmQs4aeLT2+vm0Oab
 yjiYhOz7NNhjcLunrnk5vo3om8YvQoNp0MA6C9mGPqiNmM3T/BW314R+tLu6W8FkBxYn
 fI6A==
X-Gm-Message-State: AOAM532MASxaHqk2aFHME/eHBqVkknAL/8QbW5qJt3xVZExuQ6g588V4
 aeA+4n1OAt2GrBL/Ybkg89msiA==
X-Google-Smtp-Source: ABdhPJzQZhOALgumhAbivo10Vy33TnY2EYrd0cLJQ2AYyUelagMOBvYfUJ3vbWdMCxrsbK35mPWjMw==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr15729wmi.156.1605548508417;
 Mon, 16 Nov 2020 09:41:48 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/42] drm/msm/disp/dpu1/dpu_core_perf: Remove set but unused
 variable 'dpu_cstate'
Date: Mon, 16 Nov 2020 17:40:49 +0000
Message-Id: <20201116174112.1833368-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jOiBJbiBmdW5jdGlvbiDigJhf
ZHB1X2NvcmVfcGVyZl9jYWxjX2NydGPigJk6CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfY29yZV9wZXJmLmM6MTEzOjI1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkcHVfY3N0YXRl
4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogUm9i
IENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBLYWx5YW4gVGhvdGEgPGthbHlhbl90QGNvZGVhdXJvcmEu
b3JnPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6
IEFiaGluYXYgS3VtYXIgPGFiaGluYXZrQGNvZGVhdXJvcmEub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY29yZV9wZXJmLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
Y29yZV9wZXJmLmMKaW5kZXggMzdjODI3MDY4MWMyMy4uMzY5MjdmYzA0YTM4OCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYwpAQCAtMTEwLDE0ICsx
MTAsMTEgQEAgc3RhdGljIHZvaWQgX2RwdV9jb3JlX3BlcmZfY2FsY19jcnRjKHN0cnVjdCBkcHVf
a21zICprbXMsCiAJCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUsCiAJCXN0cnVjdCBkcHVf
Y29yZV9wZXJmX3BhcmFtcyAqcGVyZikKIHsKLQlzdHJ1Y3QgZHB1X2NydGNfc3RhdGUgKmRwdV9j
c3RhdGU7Ci0KIAlpZiAoIWttcyB8fCAha21zLT5jYXRhbG9nIHx8ICFjcnRjIHx8ICFzdGF0ZSB8
fCAhcGVyZikgewogCQlEUFVfRVJST1IoImludmFsaWQgcGFyYW1ldGVyc1xuIik7CiAJCXJldHVy
bjsKIAl9CiAKLQlkcHVfY3N0YXRlID0gdG9fZHB1X2NydGNfc3RhdGUoc3RhdGUpOwogCW1lbXNl
dChwZXJmLCAwLCBzaXplb2Yoc3RydWN0IGRwdV9jb3JlX3BlcmZfcGFyYW1zKSk7CiAKIAlpZiAo
a21zLT5wZXJmLnBlcmZfdHVuZS5tb2RlID09IERQVV9QRVJGX01PREVfTUlOSU1VTSkgewotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
