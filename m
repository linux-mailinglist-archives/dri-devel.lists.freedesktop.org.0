Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D976620EF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD05889970;
	Mon,  8 Jul 2019 14:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF9B89970
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 14:56:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so17462387wru.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 07:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6A2wEUKZ2w/NmNg6qTXlBT+G1/lwdgA/OS6jqf9rino=;
 b=UND8ZTTagfTCwzUbmla1Ltu2x6oKB7UKmlXFWgbgeLuS7jWH9fbbJtcZ7Gk4r+2sxK
 t52YT4ycllKZYUBNX1OVoUkoNJP1XL54wu05nPS2/3yG7oidp2ogGSQNEuYSUA207K1K
 JWSxqtXcdrJzbkkEteDJf6RnlDVcSwHJ5qr3O/iQxmcUDbYINR7wPo/g8uLjVL1HNvrE
 Dkv4j2mvHbi4rRKvq+2MJWtAyxGsPrLbOi8wqRPMoFAFRSfmnOQskmpEKOGaobtm7cDJ
 kk0kebAtNHGtj+D2MbacBygM9mDQ/82pwuRGqL1tc0bnleNAQ7Uc7kkPQ+ObMVwp6KC7
 Bffg==
X-Gm-Message-State: APjAAAU1YBGwnM9OyIToHuffWjFK64BJcGUeSh+O8FffXIawh41AdGgC
 n/u6rjNyQjJ3Y2/h86vXgyf9mw==
X-Google-Smtp-Source: APXvYqyH59Nm3vbt1NDiGZ18Kibh0K801N8w6r86bMR01GEi1FwpjHiY3T3JJRdiyapDKZbulvXwjA==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr12453877wrt.182.1562597795750; 
 Mon, 08 Jul 2019 07:56:35 -0700 (PDT)
Received: from e430.riomail.cz (188-175-152-238.client.rionet.cz.
 [188.175.152.238])
 by smtp.gmail.com with ESMTPSA id f70sm11887595wme.22.2019.07.08.07.56.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 07:56:35 -0700 (PDT)
From: Josef Lusticky <josef@lusticky.cz>
To: sam@ravnborg.org, robh@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add DRM ILI9341 parallel RGB panel driver
Date: Mon,  8 Jul 2019 16:56:16 +0200
Message-Id: <20190708145618.26031-1-josef@lusticky.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304125033.28841-1-josef@lusticky.cz>
References: <20190304125033.28841-1-josef@lusticky.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lusticky.cz; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6A2wEUKZ2w/NmNg6qTXlBT+G1/lwdgA/OS6jqf9rino=;
 b=Dqch3UtvFbjZcRo5gHJVFBzEKhcPph8OZmmoJTmPBDsWNPjViVCMuu7wPPoPZdp1k4
 LP/1TsEzimCbte7BWjj3Tv94twyynDQNDJV7HrL80G2ZoMc4cqh9mCWOO3bp/78zKIdH
 hF3oE1Fniib0IL1ML64vdfY/VODiTFbSB+4f9x2bbj3kxznUdgzqzIREN6UmWg4xAnSW
 A14UpCnE9qpDgT5RCLotQyyThqduZYGclAKC3lxn8y2tSmS8uKQcO25GextJKUqqUcuK
 bVfvkHRezZvolWW18DbUnJPg+Cqup2Di4fWkMLCuLkiSGN9POyuqAeuEpBtE5DTI6j0H
 jGyA==
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
Cc: airlied@linux.ie, thierry.reding@gmail.com,
 Josef Lusticky <josef@lusticky.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksClRoaXMgaXMgdGhlIHYyIG9mIHRoZSBwYXRjaC1zZXQgd2hpY2ggYWRkcyBzdXBwb3J0IGZv
cgpJbGl0ZWsgSUxJOTM0MSBwYXJhbGxlbCBSR0IgcGFuZWxzLgoKVGhlIElMSTkzNDEgY2hpcCBz
dXBwb3J0cyBib3RoIHBhcmFsbGVsIFJHQiBpbnB1dCBtb2RlIGFuZCBTUEkgaW5wdXQgbW9kZS4K
VGhpcyBkcml2ZXIgYWRkcyBzdXBwb3J0IGZvciB0aGUgcGFyYWxsZWwgUkdCIGlucHV0IG1vZGUu
CgpDaGFuZ2VzIHNpbmNlIHYxOgoqIERldmljZS10cmVlIGJpbmRpbmdzIGluIG9uZSBmaWxlCiog
RC9DIEdQSU8gcGluIGlzIG9wdGlvbmFsCiogbWlwaV9kYmlfKiBmdW5jdGlvbnMgdXNlZCB0byBp
bml0aWFsaXplIHRoZSBkaXNwbGF5CiogZW50cnkgaW4gTUFJTlRBSU5FUlMgc29ydGVkIGFscGhh
YmV0aWNhbGx5CiogTWFrZWZpbGUsIEtjb25maWc6IERSTV9QQU5FTF9JTElURUtfSUw5MzQxIHJl
bmFtZWQgdG8gRFJNX1BBTkVMX0lMSVRFS19JTEk5MzQxCiogS2NvbmZpZzogZGVwZW5kIG9uIEJB
Q0tMSUdIVF9DTEFTU19ERVZJQ0UKKiBLY29uZmlnOiBzZWxlY3QgVElOWURSTV9NSVBJX0RCSQoq
IG9yZGVyIG9mIGluY2x1ZGUgZmlsZXMgY2hhbmdlZAoqIGRybV9tb2RlX2R1cGxpY2F0ZSBjaGVj
a2VkIGZvciBmYWlsdXJlCgpUaGFuayB5b3UgUm9iIEhlcnJpbmcgYW5kIFNhbSBSYXZuYm9yZyBm
b3IgY29tbWVudHMuCgpKb3NlZiBMdXN0aWNreSAoMik6CiAgZHQtYmluZGluZ3M6IHBhbmVsOiBB
ZGQgcGFyYWxsZWwgUkdCIG1vZGUgZm9yIElsaXRlayBJTEk5MzQxIHBhbmVscwogIGRybS9wYW5l
bDogQWRkIElsaXRlayBJTEk5MzQxIHBhcmFsbGVsIFJHQiBwYW5lbCBkcml2ZXIKCiAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9pbGl0ZWssaWxpOTM0MS50eHQgICAgICAgfCAgNjcgKysrLQogTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dw
dS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzQxLmMgIHwgMjkxICsrKysrKysrKysrKysrKysr
KwogNSBmaWxlcyBjaGFuZ2VkLCAzNjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5
MzQxLmMKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
