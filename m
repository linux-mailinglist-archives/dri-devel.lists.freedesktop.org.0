Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4C2CE96
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 20:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B996E044;
	Tue, 28 May 2019 18:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D076B6E044
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 18:26:59 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id w21so8286869ywd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7yQwjOt7RMrp1ZBk1OxLjkgfAWLV7jytWzkNhOC/gSo=;
 b=Sew/+onW3/LNV1XtjWLe/jg4oFU4sO0XfUelvfxJZRclzysAqs88aa1r99Vt1SBJav
 ciPEQJE8I0w240ssFW0pUnYcQALRUaVUrKc3TyooieF4qrZthhN0yzWHTruelLL/WANy
 b4OEL8wOVdD3SDwb/nCs/BaFFUqUWYsdoR7IpmXdkAg+DS1Vm85zOw0X835YREFxG+72
 Z7+DtUg+iyW1gWs1XWaQpqrhGplNKdfiI64oGi959llY7EjTI1XZQTdj1ypGCEf/X65o
 yF/TGE+jvLKUOesW1Y3kx1q97RD5DK2ADhhNB7K2WjE0fQlYEmwtlvzntwIXdGtY8h2h
 5VSg==
X-Gm-Message-State: APjAAAUh5yZ4RWsc93GHqL4DsBQhfhlLtx3JJhx83YkXI0f5+vTv2T+7
 7Hu1iowH38lw2CFC2CNrUS5TfCBcSI4=
X-Google-Smtp-Source: APXvYqwkVpRRs8Qgo+zPcrAGSyRwpY4dtidnfGumjxN0qS9GnudEVQSJTf+UCPIbxqw9EoC8hLy70w==
X-Received: by 2002:a81:4c46:: with SMTP id z67mr28249618ywa.267.1559068018920; 
 Tue, 28 May 2019 11:26:58 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k205sm3703061ywc.69.2019.05.28.11.26.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 11:26:58 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Remove bogus comment
Date: Tue, 28 May 2019 14:26:45 -0400
Message-Id: <20190528182657.246714-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
References: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7yQwjOt7RMrp1ZBk1OxLjkgfAWLV7jytWzkNhOC/gSo=;
 b=MgIkNC6iYi6IaMypw2y0pB+JJFA7DuzlPTLK6XWFNg0cyQ3XitlHichVLmjm2VvW26
 1X9tsHoz+96lwpx8YhVv+xUuNPCGaGq4mFgdgwwAW4/G9Vd0Ma+RNmZZOMUuidPwVFpp
 eDRKoy+rhPuEwr/TpulzUEmq1AWZvSt8leutcH/Tfhet984feZ6CybJf1TTjqQE6lcCN
 WQqnpd8zXcwgKdbAU43qLdVvl3+aBv2GlPTS4q8bbFk44kOx2NgHQd8kDzh8TNHn59cx
 1mKGNDlE64VrYkYmnTFeOZxpzky2Og9XSMRvp8rAFbq64N6jMmI3Y2OkX7B6PfkmdDeT
 TKQg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIGNvbW1lbnQgZG9l
c24ndCBtYWtlIGFueSBzZW5zZSwgcmVtb3ZlIGl0LgoKU3VnZ2VzdGVkLWJ5OiBKb3JkYW4gQ3Jv
dXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfa21zLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCmluZGV4IDg4NWJmODhhZmEzZS4uNTBkMGU5YmE1
ZDJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCkBAIC0yNDMsNyAr
MjQzLDYgQEAgc3RhdGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1
X2ttcykKIAlpZiAoSVNfRVJSX09SX05VTEwoZW50cnkpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAot
CS8qIGFsbG93IHJvb3QgdG8gYmUgTlVMTCAqLwogCWRlYnVnZnNfY3JlYXRlX3gzMihEUFVfREVC
VUdGU19IV01BU0tOQU1FLCAwNjAwLCBlbnRyeSwgcCk7CiAKIAlkcHVfZGVidWdmc19kYW5nZXJf
aW5pdChkcHVfa21zLCBlbnRyeSk7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
