Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE485207
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4F6E745;
	Wed,  7 Aug 2019 17:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987FA6E745;
 Wed,  7 Aug 2019 17:24:32 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4E3FE60E73; Wed,  7 Aug 2019 17:24:32 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A1E060ACF;
 Wed,  7 Aug 2019 17:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A1E060ACF
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Make DRM_MSM default to 'm'
Date: Wed,  7 Aug 2019 11:24:27 -0600
Message-Id: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565198672;
 bh=9K1MOxiCxYs/25EyWmBrmkD80zO1z57WgiTXJ3f3y6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=OxCnwmzuQnMmlh3okgONlCz5nhylnjZ13rQgFQHfSjlepS/i8uCL6MM+bFrvIWvXn
 SKLFfBy4Aws2Cy9BQpBrZbOeulOU4rFgFrqY5u4780x9d23NgBy/obA1FgV7QRr+/o
 wsz3UYoCy8ZSgp02JhVCruRzZ/W1ZGn+V/08zcFA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565198672;
 bh=9K1MOxiCxYs/25EyWmBrmkD80zO1z57WgiTXJ3f3y6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=OxCnwmzuQnMmlh3okgONlCz5nhylnjZ13rQgFQHfSjlepS/i8uCL6MM+bFrvIWvXn
 SKLFfBy4Aws2Cy9BQpBrZbOeulOU4rFgFrqY5u4780x9d23NgBy/obA1FgV7QRr+/o
 wsz3UYoCy8ZSgp02JhVCruRzZ/W1ZGn+V/08zcFA=
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

TW9zdCB1c2UgY2FzZXMgZm9yIERSTV9NU00gd2lsbCBwcmVmZXIgdG8gYnVpbGQgYm90aCBEUk0g
YW5kIE1TTV9EUk0gYXMKbW9kdWxlcyBidXQgdGhlcmUgYXJlIHNvbWUgY2FzZXMgd2hlcmUgRFJN
IG1pZ2h0IGJlIGJ1aWx0IGluIGZvciB3aGF0ZXZlcgpyZWFzb24gYW5kIGluIHRob3NlIHNpdHVh
dGlvbnMgaXQgaXMgcHJlZmVyYWJsZSB0byBzdGlsbCBrZWVwIE1TTSBhcyBhCm1vZHVsZSBieSBk
ZWZhdWx0IGFuZCBsZXQgdGhlIHVzZXIgZGVjaWRlIGlmIHRoZXkgX3JlYWxseV8gd2FudCB0byBi
dWlsZAppdCBpbi4KCkFkZGl0aW9uYWxseSBzZWxlY3QgUUNPTV9DT01NQU5EX0RCIGZvciBBUkNI
X1FDT00gdGFyZ2V0cyB0byBtYWtlIHN1cmUKaXQgZG9lc24ndCBnZXQgbWlzc2VkIHdoZW4gd2Ug
bmVlZCBpdCBmb3IgYTZ4eCB0YXJldHMuCgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxq
Y3JvdXNlQGNvZGVhdXJvcmEub3JnPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vS2NvbmZpZwppbmRleCA5YzM3ZTRkLi4zYjIzMzRiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCkBA
IC0xNCwxMSArMTQsMTIgQEAgY29uZmlnIERSTV9NU00KIAlzZWxlY3QgU0hNRU0KIAlzZWxlY3Qg
VE1QRlMKIAlzZWxlY3QgUUNPTV9TQ00gaWYgQVJDSF9RQ09NCisJc2VsZWN0IFFDT01fQ09NTUFO
RF9EQiBpZiBBUkNIX1FDT00KIAlzZWxlY3QgV0FOVF9ERVZfQ09SRURVTVAKIAlzZWxlY3QgU05E
X1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MKIAlzZWxlY3QgU1lOQ19GSUxFCiAJc2VsZWN0IFBN
X09QUAotCWRlZmF1bHQgeQorCWRlZmF1bHQgbQogCWhlbHAKIAkgIERSTS9LTVMgZHJpdmVyIGZv
ciBNU00vc25hcGRyYWdvbi4KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
