Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7D8BBE1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 16:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73796E161;
	Tue, 13 Aug 2019 14:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B45B6E15A;
 Tue, 13 Aug 2019 14:46:31 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 1029060909; Tue, 13 Aug 2019 14:46:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6E0160735;
 Tue, 13 Aug 2019 14:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6E0160735
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Remove Kconfig default
Date: Tue, 13 Aug 2019 08:46:24 -0600
Message-Id: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565707591;
 bh=RX2ZuF7FyFcwrhLgH5WfnjLf77k36pqleRUFSlPzjAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Kq2sUkhYJde1OCI+XGoMCQ1KWgoN1wYhrwueI7SaGan6MrH35iNl+Zi+TqTzzPoId
 M0qtLXdJUNZ1FWiKvZyh3vbDVjm2T8XKJggIBT0fnY1v4aQOu0R6cqBARRGIvS9fuv
 hyT4rcepA3zOzuV4aCB98tN/PZtXwGeJJE1maVSE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565707590;
 bh=RX2ZuF7FyFcwrhLgH5WfnjLf77k36pqleRUFSlPzjAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JVkr2CyLqGfAWWlP5g/MRzjweIo9GLa0Ux6gwF0J0OlH/8mterC9gwFPLWi3vS2J7
 w30oaM1JVjd8fNub6OcR9ZIU1NyBhzkML+DqrB5Riiyr38Onp1fXLELcHWA2yCNILj
 dhGGuKsLLxjH9Qi0h+hUfo5XN97XTPxiD93zLQ4g=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHRoZSBkZWZhdWx0IGZvciBDT05GSUdfRFJNX01TTSBhbmQgbGV0IHRoZSB1c2VyIHNl
bGVjdCB0aGUgZHJpdmVyCm1hbnVhbGx5IGFzIG9uZSBkb2VzLgoKQWRkaXRpb25hbGx5IHNlbGVj
dCBRQ09NX0NPTU1BTkRfREIgZm9yIEFSQ0hfUUNPTSB0YXJnZXRzIHRvIG1ha2Ugc3VyZQppdCBk
b2Vzbid0IGdldCBtaXNzZWQgd2hlbiB3ZSBuZWVkIGl0IGZvciBhNnh4IHRhcmdldHMuCgp2Mjog
TW92ZSBmcm9tIGRlZmF1bHQgJ20nIHRvIG5vIGRlZmF1bHQKClNpZ25lZC1vZmYtYnk6IEpvcmRh
biBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9t
c20vS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vS2NvbmZpZwppbmRleCA5YzM3ZTRkLi5lOTE2MGNlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9L
Y29uZmlnCkBAIC0xNCwxMSArMTQsMTEgQEAgY29uZmlnIERSTV9NU00KIAlzZWxlY3QgU0hNRU0K
IAlzZWxlY3QgVE1QRlMKIAlzZWxlY3QgUUNPTV9TQ00gaWYgQVJDSF9RQ09NCisJc2VsZWN0IFFD
T01fQ09NTUFORF9EQiBpZiBBUkNIX1FDT00KIAlzZWxlY3QgV0FOVF9ERVZfQ09SRURVTVAKIAlz
ZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MKIAlzZWxlY3QgU1lOQ19GSUxFCiAJ
c2VsZWN0IFBNX09QUAotCWRlZmF1bHQgeQogCWhlbHAKIAkgIERSTS9LTVMgZHJpdmVyIGZvciBN
U00vc25hcGRyYWdvbi4KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
