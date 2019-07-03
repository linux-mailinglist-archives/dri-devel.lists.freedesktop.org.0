Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC25F39D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F496E2BF;
	Thu,  4 Jul 2019 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15A26E202
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 21:43:30 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b7so1924773pls.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 14:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bC+NSmuLWEsv6oPx3XnIf+0FW2175TmLMl+WAygDkKU=;
 b=o/+IPsAJQyfCGfheWcT3KvfJc3LHQP0lKMhc3N2mdFir2xRZLJAkyGF+rdCQkyh3kB
 pP/RKbTdBMvpMX32gsSABRqga5pxsEiUKiV1rSBtMXaODKEKrBbXBicDmEJoBGPNAop/
 vlXDKPdqUQfiB6Y5VcMtqApUdr/bmZFDM9PdNTyOWp6rLInbT2EeiF4T/0FboSaNB+yd
 Q+I9weK9S137jQSGLyNCnuP+LVeLg+9vV8lbHUsaoHRWFCOfwdt7yV1YWIqvs7Dasw2u
 K/K+XTJwwniTSbrq/HWFLkBiIUamxmWtkUNEPiPOHbI0XB4a5t11mDfUnx+ES3ZzkRt8
 2aMw==
X-Gm-Message-State: APjAAAUWQGJHNMHr3BfnJ3D05nj4UNrKwRH9L2HzHOrwgOYWsXYmJelt
 /IFSht58TVmphndeYEiANug=
X-Google-Smtp-Source: APXvYqxupxMQrDq3Zqb7a37DqR6TG00xKI9iD9hNoRiw/XNAJDgi2Ws6jxpFETlLyzILp7T0P7jCkg==
X-Received: by 2002:a17:902:bcc4:: with SMTP id
 o4mr44071677pls.90.1562190210539; 
 Wed, 03 Jul 2019 14:43:30 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id b24sm3234095pfd.98.2019.07.03.14.43.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 14:43:30 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: 
Subject: [PATCH 0/2] ti-sn65dsi86 DSI configuration support
Date: Wed,  3 Jul 2019 14:43:26 -0700
Message-Id: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bC+NSmuLWEsv6oPx3XnIf+0FW2175TmLMl+WAygDkKU=;
 b=JPU5nLksJvt0fUeU3xq3KmutnplMnOxOQRJMgALyn2JDTEs5VeXoR+TfYHByBEcnwO
 zRU4F8bccZJ5ugFn4+d3zDBIXx2rwZU/8FrH8RnjCv/gcc8Em1b4q5WhSWqWtRQdWFC4
 BHDKHrHUr2XtytxOWj12mL54u8hMaSKtbKkac0KmwXRmvKTy8Y9V5mu7X42Rj7j0MHjZ
 Pvdq8uQ0I3QwczWfCZyvW1t1OIHsiax8Ej/J96sk7N4iq4gY6pUxq3a6FHF+rJr9apzL
 UdQjtwm5iUPR6chrAFY7V9VGJr0kiFjr5KEDgrlxH1+90wswDHf0/LMzlOQe6Rslqsbx
 qK2w==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 broonie@kernel.org, Laurent.pinchart@ideasonboard.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRpLXNuNjVkc2k4NiBicmlkZ2Ugb24gdGhlIExlbm92byBNaWl4IDYzMCBkb2VzIG5vdCBh
cHBlYXIgdG8gYmUKd2lyZWQgdG8gYW4gSTJDIGJ1cyAtIHRoZXJlIGlzIG5vIGluZGljYXRpb24g
ZnJvbSB0aGUgRlcgd2hpY2ggYnVzIHRvCnVzZSBhbmQgc2Nhbm5pbmcgYWxsIG9mIHRoZSBidXNz
ZXMgZG9lcyBub3QgcmVzdWx0IGluIGFuIHVua25vd24gZGV2aWNlCmJlaW5nIGRpc2NvdmVyZWQu
CgpBcyBhIHJlc3VsdCwgd2UgbXVzdCB1dGlsaXplIHRoZSBhYmlsaXR5IG9mIHRoZSB0aS1zbjY1
ZHNpODYgdG8gYmUKY29uZmlndXJlZCAiaW5iYW5kIiB2aWEgdGhlIERTSSBjb25uZWN0aW9uLiAg
U2luY2UgdGhlIGRyaXZlciBhbHJlYWR5CnV0aWxpemVzIHJlZ21hcCAob3ZlciBJMkMpLCBhZGRp
bmcgdGhlIGFiaWxpdHkgb2YgdGhlIGRyaXZlciB0bwpjb25maWd1cmUgdmlhIERTSSBpcyByYXRo
ZXIgbWluaW1hbCBlZmZvcnQgb25jZSB3ZSBoYXZlIGVzdGFibGlzaGVkIGEKcmVnbWFwIG92ZXIg
RFNJIGhhbmRsZS4KCkhvd2V2ZXIsIHJlZ21hcCBjdXJyZW50bHkgZG9lc24ndCBzdXBwb3J0IHRo
ZSBNSVBJIERTSSBidXMsIHNvIGFkZCB0aGF0Cm9wdGlvbiBmaXJzdC4KCkplZmZyZXkgSHVnbyAo
Mik6CiAgcmVnbWFwOiBBZGQgRFNJIGJ1cyBzdXBwb3J0CiAgZHJtL2JyaWRnZTogdGktc242NWRz
aTg2OiBBZGQgc3VwcG9ydCB0byBiZSBhIERTSSBkZXZpY2UKCiBkcml2ZXJzL2Jhc2UvcmVnbWFw
L0tjb25maWcgICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2Jhc2UvcmVnbWFwL01ha2VmaWxl
ICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLWRzaS5jICAgICAg
fCAgNjIgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgMTYwICsrKysr
KysrKysrKysrKysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3JlZ21hcC5oICAgICAgICAgICAg
ICAgIHwgIDM3ICsrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCAyMjIgaW5zZXJ0aW9ucygrKSwgNDUg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9iYXNlL3JlZ21hcC9yZWdt
YXAtZHNpLmMKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
