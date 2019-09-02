Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66616A54DC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79687899E8;
	Mon,  2 Sep 2019 11:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7DE899E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n2so12832993wmk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2IW4DNBUNyoNJNhigs6P/ckWxw60zSCUMq6ZBsXHIA=;
 b=KUYIWn0ekDO0eafh2Qbf0Nh6wc2tVg2PJrDm22CgRxyQFnFnEqA5NdByEHODIpyowv
 V79Tv47J+TkWVBMx3ivMDDrc0jVCIY0k3Qn6KTFs6p1tqaYRrUF2GB0iJrYifgWGDG4w
 YwO3BBxGTC0JDcxeeVrHcVMV3IfaJ0NvtCcmGWpfa/W9M5DNUKR4PTBj5SiQgQJ2dXEL
 ckwg+AYidiNVsnxbxNwMHQV9Aa+45P9xSeRAjkDTdH27QeRtQ35ThTqmLh9yE/sUILXo
 UBWHvWMvaBDgC/ZaB0uxHOouW557YRZ+Bl2DFHUj72eJM93IKKrCgIYpfXb6ci9cpOpK
 pJFQ==
X-Gm-Message-State: APjAAAWrjcHUTsdzHBSp7y8j7ir6xO5YbDc69AuCyHaARYlgOlR/4E8r
 X0tqh5fewVaHU8Gih9SiANtcZ7Bg
X-Google-Smtp-Source: APXvYqwyqPDRvddinM/OKCzzWAWFQfvJQhWEZu1fcTIdSZOSGXSnen44H+0ctPSwSleL4u4xN3PiKg==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr35486344wme.26.1567423883621; 
 Mon, 02 Sep 2019 04:31:23 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id y3sm29087416wmg.2.2019.09.02.04.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/21] drm/dp: Various helper improvements and cleanups
Date: Mon,  2 Sep 2019 13:31:00 +0200
Message-Id: <20190902113121.31323-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2IW4DNBUNyoNJNhigs6P/ckWxw60zSCUMq6ZBsXHIA=;
 b=Sc6sAYTEJ9V/lhVTiNAUznHQ0HWPMk2QTZLBOHrJu9tb1fXbMO8AQ5q/UqLTvWpHN1
 2M7QU/QY4CbnqF8zGV8qcpXZr5zdIBvcnZdt9CYb2RiJahYqKH6HgliXT9EtJ62p5hSa
 pyhIfYMTFJOnAnTQv/JVLSzU6EDHwhuaPvIc5vQaVG9tB8I2h44KomckpU79/pzQrgYt
 tGwSvGubH5SYOcf/vcgpCCHN4OfOKjRT48gtIEqnNIgMGZxPx9pCt598GTtm2yKCEVPR
 74Jlpsps+XrzL0djKGGKqVtwXiCRlYgBw/udouyo+xLSM30MWC0RAD/Dk19Z4V/MCNIR
 UZlA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhpLAoKdGhpcyBzZXJp
ZXMgb2YgcGF0Y2hlcyBpbXByb3ZlcyB0aGUgRFAgaGVscGVycyBhIGJpdCBhbmQgY2xlYW5zIHVw
IHNvbWUKaW5jb25zaXN0ZW5jaWVzIGFsb25nIHRoZSB3YXkuCgp2MiBpbmNvcnBvcmF0ZXMgYWxs
IHJldmlldyBjb21tZW50cyBhZGQgY29sbGVjdHMgUmV2aWV3ZWQtYnlzIGZyb20gdjEuCgpUaGll
cnJ5CgpUaGllcnJ5IFJlZGluZyAoMjEpOgogIGRybS9kcDogU29ydCBpbmNsdWRlcyBhbHBoYWJl
dGljYWxseQogIGRybS9kcDogQWRkIG1pc3Npbmcga2VybmVsZG9jIGZvciBzdHJ1Y3QgZHJtX2Rw
X2xpbmsKICBkcm0vZHA6IEFkZCBkcm1fZHBfbGlua19yZXNldCgpIGltcGxlbWVudGF0aW9uCiAg
ZHJtL2RwOiBUcmFjayBsaW5rIGNhcGFiaWxpdGllcyBhbG9uZ3NpZGUgc2V0dGluZ3MKICBkcm0v
ZHA6IFR1cm4gbGluayBjYXBhYmlsaXRpZXMgaW50byBib29sZWFucwogIGRybS9kcDogUHJvYmUg
bGluayB1c2luZyBleGlzdGluZyBwYXJzaW5nIGhlbHBlcnMKICBkcm0vZHA6IFJlYWQgZmFzdCB0
cmFpbmluZyBjYXBhYmlsaXR5IGZyb20gbGluawogIGRybS9kcDogUmVhZCBUUFMzIGNhcGFiaWxp
dHkgZnJvbSBzaW5rCiAgZHJtL2RwOiBSZWFkIGNoYW5uZWwgY29kaW5nIGNhcGFiaWxpdHkgZnJv
bSBzaW5rCiAgZHJtL2RwOiBSZWFkIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQgY2FwYWJpbGl0
eSBmcm9tIHNpbmsKICBkcm0vZHA6IFJlYWQgZURQIHZlcnNpb24gZnJvbSBEUENECiAgZHJtL2Rw
OiBSZWFkIEFVWCByZWFkIGludGVydmFsIGZyb20gRFBDRAogIGRybS9kcDogRG8gbm90IGJ1c3kt
bG9vcCBkdXJpbmcgbGluayB0cmFpbmluZwogIGRybS9kcDogVXNlIGRybV9kcF9hdXhfcmRfaW50
ZXJ2YWwoKQogIGRybS9kcDogQWRkIGhlbHBlciB0byBnZXQgcG9zdC1jdXJzb3IgYWRqdXN0bWVu
dHMKICBkcm0vZHA6IFNldCBjaGFubmVsIGNvZGluZyBvbiBsaW5rIGNvbmZpZ3VyYXRpb24KICBk
cm0vZHA6IEVuYWJsZSBhbHRlcm5hdGUgc2NyYW1ibGVyIHJlc2V0IHdoZW4gc3VwcG9ydGVkCiAg
ZHJtL2RwOiBBZGQgZHJtX2RwX2xpbmtfY2hvb3NlKCkgaGVscGVyCiAgZHJtL2RwOiBBZGQgc3Vw
cG9ydCBmb3IgZURQIGxpbmsgcmF0ZXMKICBkcm0vZHA6IFJlbW92ZSBhIGdyYXR1aXR1b3VzIGJs
YW5rIGxpbmUKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogVXNlIERQIG5vbWVuY2xhdHVyZQoKIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyAgICAgIHwgIDIyICstCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX2hlbHBlci5jICAgICAgICB8IDMyNyArKysrKysrKysrKysrKysrKysrKysr
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHBfY3RybC5jICAgICB8ICAxMiArLQogZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMgfCAgIDggKy0KIGRyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9jZG4tZHAtcmVnLmMgIHwgIDEzICstCiBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZHBhdXguYyAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5j
ICAgICAgICAgICAgfCAgMzIgKy0tCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgICAg
ICAgICB8IDEyNCArKysrKysrKystCiA4IGZpbGVzIGNoYW5nZWQsIDQ1OSBpbnNlcnRpb25zKCsp
LCA4NyBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
