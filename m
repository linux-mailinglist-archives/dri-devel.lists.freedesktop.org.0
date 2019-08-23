Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992509C6CA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720B89939;
	Mon, 26 Aug 2019 00:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4586EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:07:53 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h27so949213lfp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 04:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZHcoLOCEDvNdiKJSIaGU9TMbH+mXTX9zteaN4YnDK00=;
 b=a0WgGRQ/91U9dchJsRvgYYpvHnkkvzDlsU26Pwdt6uRHcgqIA+j9w36pbpITfK3Tgl
 fAqatupGPbpDl9lVw0e+KmgB52jGv/nO5+VESSfeWsnj/bI4vnVxgWK4Uq3rOMHGlzHs
 aOxHi7zPv43ngQeNkUeoHEZX+xIBqt/ZFCryl3wvXY+VMTJNM3Lyt9A9KCpelPROYcd/
 SoHpQoRP4b0KT2WG/JsocF/jzkeOceSm0DRU2WNEOJ4mdlbyYsHeVv79fuYQ4hlMsOuk
 JszEKYoXIP5jEoggDrQdbekphD5A0bBVJ5j2wxolOgi4GZRjGD5Tt96aATKyl3dK0zS/
 5i6A==
X-Gm-Message-State: APjAAAWC2AUSoSODYtS377ioozYA6HIl6PCCKfbCNT6skBH8dwl+Svls
 AAFNGHfRMBrIebm85+6XnaMwoQ==
X-Google-Smtp-Source: APXvYqzi3fwiyJBZWIDhJNnGDLtbqn6NPY5vwE/i10iohempQV8GMBpKT39wg3/8zN79Mnf6fd6bZA==
X-Received: by 2002:a19:2314:: with SMTP id j20mr1185222lfj.22.1566558471447; 
 Fri, 23 Aug 2019 04:07:51 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id r23sm596312ljm.59.2019.08.23.04.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 04:07:50 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, matthias.bgg@gmail.com
Subject: [PATCH] drm/mediatek: fix implicit function declaration
Date: Fri, 23 Aug 2019 13:07:36 +0200
Message-Id: <20190823110736.26117-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZHcoLOCEDvNdiKJSIaGU9TMbH+mXTX9zteaN4YnDK00=;
 b=cPSKEtJOjYq9WsIijVXnZyKIbicP5PMiaPAcAAyh8mxF2fDAkuuFN3FcjHGy6xOiA8
 dg3q+8r842lRJFe52waZ1pWOP1wKwsDLDgKLqIpRczfz3K1GCezlxU2eAw9eIZbMKxrf
 mrn4ekEkBMNN05Alm52osCbJSaG9T3p08S1uk/Etvu7P/iU5q1BQZIwSb0LvUTNiRtvb
 cYFDDf3S1vHAgguA6kMPY4lnFgRTA7hrkOSRgVLfAkUQYbXFTy9PUohmSf4W+STJYWLK
 3ZPZzlh8ATubZ3jKVG+Q0Xc8NiATpTsN2VCfjDHzuS4R6vwvK+BZ87tC4ou5Z6faQS3u
 BXhg==
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyBtdGtfZHJtX2Rydi5vIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IgaXMg
c2VlbjoKCi4uL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jOiBJbiBmdW5j
dGlvbiDigJhtdGtfZHJtX2ttc19pbml04oCZOgouLi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYzoyOTE6ODogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mCiBmdW5j
dGlvbiDigJhkbWFfc2V0X21heF9zZWdfc2l6ZeKAmTsgZGlkIHlvdSBtZWFuIOKAmGRybV9yZWN0
X2FkanVzdF9zaXpl4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
ICByZXQgPSBkbWFfc2V0X21heF9zZWdfc2l6ZShkbWFfZGV2LCAodW5zaWduZWQgaW50KURNQV9C
SVRfTUFTSygzMikpOwogICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgICAgZHJtX3Jl
Y3RfYWRqdXN0X3NpemUKLi4vZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmM6
MjkxOjUyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YKIGZ1bmN0aW9uIOKAmERNQV9C
SVRfTUFTS+KAmTsgZGlkIHlvdSBtZWFuIOKAmEJJVF9NQVNL4oCZPyBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICByZXQgPSBkbWFfc2V0X21heF9zZWdfc2l6ZShkbWFf
ZGV2LCAodW5zaWduZWQgaW50KURNQV9CSVRfTUFTSygzMikpOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVRfTUFTSwoKUmV3b3Jr
IHRvIGFkZCBhIG1pc3NpbmcgaW5jbHVkZSBmaWxlICdsaW51eC9kbWEtbWFwcGluZy5oJywgYmVj
YXVzZSB0aGF0CmlzIHRoZSAob25seSkgaGVhZGVyIGZpbGUgY29udGFpbmluZyB0aGF0IGRlY2xh
cmF0aW9uLgoKRml4ZXM6IDA3MDk1NTU1OGU4MiAoImRybS9tZWRpYXRlazogc2V0IERNQSBtYXgg
c2VnbWVudCBzaXplIikKU2lnbmVkLW9mZi1ieTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVs
bEBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jCmluZGV4IDU0NTM2MTc2YmNiYi4uMzUyYjgxYTdhNjcwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwpAQCAtMTAsNiArMTAsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5o
PgogI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFw
cGluZy5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X2F0b21pY19oZWxwZXIuaD4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
