Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9EA0C9E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 23:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3589EAC;
	Wed, 28 Aug 2019 21:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7C589EAC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 21:45:04 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id t24so884077oij.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 14:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3BRznw7W8ExG2xqwSL+qcCCTF7qtixX1kVjq5WpB9B8=;
 b=KHdmss0cMZxJzF1wQECqjjaA/3oaArAG1hHoPkzzb0j5iyTNZKrw0x/r5+i0NPnoCA
 5ULq8bj97xOurZjZVEOQlIuQ8H4OFjU588s5V4xHsJVE0c6xDxaZMiMpniuM5W5k0M0S
 DuKlLJlV1/LuZPE83taPtmaz3SptDfShQHljohG4MTYxlr/TrPflrgs7CYb5gSjxqUGn
 /scTV9KYniXk55l6f2roOUZy51cPiu+DAAoZz1M4Ibw5je21wiOTLzRwxEArZimWeGRw
 QZlsLnCQPAHUAjZ/KnAnmeRkXTWkIRBhKXgg7/Qe0XjPF/SeExF0qPT1HJQ/QPRKWbHe
 GgLg==
X-Gm-Message-State: APjAAAXyUZ3RSsrUQZaUFdyG9TdKBU9AQOZsooxpI6Qfrw5lsE+FnRON
 hMUunsUKaZYzsbk76d6ry0xOQzM=
X-Google-Smtp-Source: APXvYqwWyUu61tAJJPPkBOygOuXHaR90ro3L9y+vM21Pmm6DC6T7jptFSAdv1NKq/Cc3ecYvIQ9N3A==
X-Received: by 2002:a54:4814:: with SMTP id j20mr4208111oij.33.1567028703777; 
 Wed, 28 Aug 2019 14:45:03 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id p11sm102431oto.4.2019.08.28.14.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 14:45:03 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Wed, 28 Aug 2019 16:44:59 -0500
Message-Id: <20190828214502.12293-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgY29udmVydHMgdGhlIHZhcmlvdXMgQXJtIE1hbGkgR1BVIGJpbmRpbmdzIHRv
IHVzZSB0aGUgRFQKc2NoZW1hIGZvcm1hdC4KClRoZSBNaWRnYXJkIGFuZCBCaWZyb3N0IGJpbmRp
bmdzIGdlbmVyYXRlIHdhcm5pbmdzIG9uICdpbnRlcnJ1cHQtbmFtZXMnCmJlY2F1c2UgdGhlcmUn
cyBhbGwgZGlmZmVyZW50IG9yZGVyaW5nLiBUaGUgVXRnYXJkIGJpbmRpbmcgZ2VuZXJhdGVzIAp3
YXJuaW5ncyBvbiBSb2NrY2hpcCBwbGF0Zm9ybXMgYmVjYXVzZSAnY2xvY2stbmFtZXMnIG9yZGVy
IGlzIHJldmVyc2VkLgoKdjI6CiAtIE1ha2UgJ2Nsb2NrcycgYWx3YXlzIHJlcXVpcmVkLgoKUm9i
CgpSb2IgSGVycmluZyAoMyk6CiAgZHQtYmluZGluZ3M6IENvbnZlcnQgQXJtIE1hbGkgTWlkZ2Fy
ZCBHUFUgdG8gRFQgc2NoZW1hCiAgZHQtYmluZGluZ3M6IENvbnZlcnQgQXJtIE1hbGkgQmlmcm9z
dCBHUFUgdG8gRFQgc2NoZW1hCiAgZHQtYmluZGluZ3M6IENvbnZlcnQgQXJtIE1hbGkgVXRnYXJk
IEdQVSB0byBEVCBzY2hlbWEKCiAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QudHh0
ICAgICAgICAgfCAgOTIgLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZy
b3N0LnlhbWwgICAgICAgIHwgMTE2ICsrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL2dwdS9hcm0s
bWFsaS1taWRnYXJkLnR4dCAgICAgICAgIHwgMTE5IC0tLS0tLS0tLS0tLS0KIC4uLi9iaW5kaW5n
cy9ncHUvYXJtLG1hbGktbWlkZ2FyZC55YW1sICAgICAgICB8IDE2NSArKysrKysrKysrKysrKysr
KwogLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0ICAgICAgICAgIHwgMTI5IC0t
LS0tLS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC55YW1sICAgICAg
ICAgfCAxNjggKysrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQ0OSBpbnNlcnRp
b25zKCspLCAzNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnR4dAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
Ymlmcm9zdC55YW1sCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC55YW1s
CiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS11dGdhcmQudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQueWFtbAoKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
