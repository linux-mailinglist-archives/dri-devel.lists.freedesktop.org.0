Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4298D4C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F456EAA7;
	Thu, 22 Aug 2019 08:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F426E386
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:35:52 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f17so1879020pfn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sdUK8Tz+No9ik1oP4rJK2D1dir0wSzSoNAXhDl4taSk=;
 b=hw/U0dzK6FRNTGr4ni9bE4jTLtUhRp6ytXupFFu1Fbx0vsnhttkDEzssu7reCI2iKD
 2jVqTubM4oIMa5Ljy4SXdCg2x5KudJrzc2SNdHyet6+g43IqzIQ3luJgcb40/vz1oX8C
 dFOxZclu363GM3/z+K6gwcIFAPJql4/ERZbdGFuvTYyPtVig7LnqOlxnMqM2Tywui/mx
 nNO0H/yBWuOSaCru+PRPsSVJns07vDD9y+vXwxcvr+cm69BbL2E0grTlG9UTRZQ0bnRN
 xpxcFgtlBxXlihLegw+qzsEICyue6KGrFVpASGxb+LO1ObWQkNqNYwVJihvijyHhWxMR
 uaqw==
X-Gm-Message-State: APjAAAUDw6YzsTCK97LqvbsOmyWZ/VN67vt0B2IezEg4FtOFxBktrK55
 6mg35yeRNeZBk6tL8Gl9dZY=
X-Google-Smtp-Source: APXvYqzhi9ADS9jQyP0DX2AofcafTJCGGSi827XjE1MNu6fFpByuoDh3+ceY6sG9VVVL1Kgt4I4h3A==
X-Received: by 2002:a63:2b84:: with SMTP id
 r126mr30871227pgr.308.1566408951638; 
 Wed, 21 Aug 2019 10:35:51 -0700 (PDT)
Received: from localhost.localdomain ([183.83.90.246])
 by smtp.gmail.com with ESMTPSA id q4sm31360714pff.183.2019.08.21.10.35.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 21 Aug 2019 10:35:51 -0700 (PDT)
From: hariprasad@freedesktop.org, Kelam@freedesktop.org,
	hariprasad.kelam@gmail.com
To: 
Subject: [PATCH] gpu: drm: exynos: Remove set but unused value
Date: Wed, 21 Aug 2019 23:04:56 +0530
Message-Id: <1566408896-8212-1-git-send-email-hariprasad.kelam@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+CgpmaXgg
YmVsb3cgZGVmZWN0IHJlcG9ydGVkIGJ5IGNvdmVyaXR5CkluIGV4eW5vc19kc2lfcmVhZF9mcm9t
X2ZpZm86IEEgdmFsdWUgYXNzaWduZWQgdG8gYSB2YXJpYWJsZSBpcyBuZXZlcgp1c2VkLgpmaXgg
RGVmZWN0OjE0NTE4MjYKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNh
ZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2RzaS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKaW5kZXggNjky
NmNlZS4uNTMxMDg3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwpA
QCAtMTA1MSwxMiArMTA1MSwxMSBAQCBzdGF0aWMgdm9pZCBleHlub3NfZHNpX3JlYWRfZnJvbV9m
aWZvKHN0cnVjdCBleHlub3NfZHNpICpkc2ksCiAJCX0KIAogCQlsZW5ndGggPSAocmVnID4+IDgp
ICYgMHhmZmZmOwotCQlpZiAobGVuZ3RoID4geGZlci0+cnhfbGVuKSB7CisJCWlmIChsZW5ndGgg
PiB4ZmVyLT5yeF9sZW4pCiAJCQlkZXZfZXJyKGRldiwKIAkJCQkicmVzcG9uc2UgdG9vIGxvbmcg
KCV1ID4gJXUgYnl0ZXMpLCBzdHJpcHBpbmdcbiIsCiAJCQkJeGZlci0+cnhfbGVuLCBsZW5ndGgp
OwotCQkJbGVuZ3RoID0geGZlci0+cnhfbGVuOwotCQl9IGVsc2UgaWYgKGxlbmd0aCA8IHhmZXIt
PnJ4X2xlbikKKwkJZWxzZSBpZiAobGVuZ3RoIDwgeGZlci0+cnhfbGVuKQogCQkJeGZlci0+cnhf
bGVuID0gbGVuZ3RoOwogCX0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
