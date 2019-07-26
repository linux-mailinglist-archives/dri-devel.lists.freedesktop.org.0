Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E778608
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126EC89C55;
	Mon, 29 Jul 2019 07:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3066ED24
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:28:13 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s19so36844927lfb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9BcHX1v0OYZtD+fOK5bR3iP5Bzz548SH0Qfuyk3u+M=;
 b=eUjD+qkkvDO5FvtUas4cctfSBHQRutXqLCy26VzSHIuB5n9vhSIufgovMWG8Pb5C0e
 r2kOFo9RD880LbVp+i1ss34YdfnS/hHu5RPpyRnAHQPEoxtCLOTNWi8zPkzyUsRY82SU
 Dk2Qo5mEPmmvBtSFCd+NYstgxniLgQPImTfLu/qIeBiAcCDyx7yHdK++dJYQ8n4XjIC9
 cwe/GBRh29B0U9L9UWounaBtAzjP166q4sde9l2q8lGVkRB639av/0AE/4rtzpnRM+XX
 UQlWQoMaV3s6DJfGPLOeWDR9Bik0tR865GrPydjtIIPAuGj71O2dxM1EwBvP/qM7LajS
 vS2g==
X-Gm-Message-State: APjAAAWI2n+Wo6ijqzdJssnETXmJoVoA5MYnutACtGEU73A4XlC7MqiW
 D3OeO21RAQ5xBRRYxo7WGnVLpA==
X-Google-Smtp-Source: APXvYqxB8OuCSnAveM3yLRJ0PfblnXOWtOWvNxXLe9Ac4zMOsHOMqT4GraqxuwItrMX1jGyDWSK9Hw==
X-Received: by 2002:ac2:5337:: with SMTP id f23mr44970761lfh.15.1564140491963; 
 Fri, 26 Jul 2019 04:28:11 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id k124sm8319427lfd.60.2019.07.26.04.28.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:28:11 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	wens@csie.org
Subject: [PATCH 2/2] drm: sun4i: tcon: Mark expected switch fall-through
Date: Fri, 26 Jul 2019 13:28:07 +0200
Message-Id: <20190726112807.19615-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9BcHX1v0OYZtD+fOK5bR3iP5Bzz548SH0Qfuyk3u+M=;
 b=cyWwp9fJP19UoMGz9ozXhDRzbbe71Ox1BNxqfqJHcs+M2C7zqmX99TGYs/etpPyptI
 ky7wdp9/Qddn/czFwkgjlUz1gwSELt2+LGXRhe+pdvLqYxXC06fCbOldfaPm6hpWdP77
 ZZQku0IkEG2Z/1DNOXZS4wpuT6hHQsHDRgIzWccW28SZ+XVK+9njzTCM+3vv/tkswX1e
 Ci/jzIwZt6kclF/FxcjlYH6SYv59ApVqKvlTl1ILvaCM6qYPtUgZIpIAc2zMrVSOhJrZ
 R4s8hnHgjUZNMD2NT8+TCnx6u58Uzm/QdaSw1OHjF+PURt8z76b7If9U0mXHxFsxAzQe
 mP2g==
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
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBmYWxsLXRocm91Z2ggd2FybmluZ3Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCB0aGUgZm9s
bG93aW5nIHdhcm5pbmcKd2FzIHN0YXJ0aW5nIHRvIHNob3cgdXA6CgouLi9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNGlfdGNvbi5jOiBJbiBmdW5jdGlvbiDigJhzdW40aV90Y29uMF9tb2RlX3Nl
dF9kaXRoZXJpbmfigJk6Ci4uL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmM6MzE2
Ojc6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsCiB0aHJvdWdoIFstV2ltcGxpY2l0
LWZhbGx0aHJvdWdoPV0KICAgdmFsIHw9IFNVTjRJX1RDT04wX0ZSTV9DVExfTU9ERV9COwouLi9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jOjMxNzoyOiBub3RlOiBoZXJlCiAgY2Fz
ZSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4OgogIF5+fn4KClJld29yayBzbyB0aGF0IHRoZSBj
b21waWxlciBkb2Vzbid0IHdhcm4gYWJvdXQgZmFsbC10aHJvdWdoLgoKRml4ZXM6IGQ5MzUxMmVm
MGYwZSAoIk1ha2VmaWxlOiBHbG9iYWxseSBlbmFibGUgZmFsbC10aHJvdWdoIHdhcm5pbmciKQpT
aWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjRpX3Rjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKaW5kZXggNjkw
YWViODIyNzA0Li4wNGM3MjFkMGQzYjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwpA
QCAtMzE2LDYgKzMxNiw3IEBAIHN0YXRpYyB2b2lkIHN1bjRpX3Rjb24wX21vZGVfc2V0X2RpdGhl
cmluZyhzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKIAkJLyogUiBhbmQgQiBjb21wb25lbnRzIGFy
ZSBvbmx5IDUgYml0cyBkZWVwICovCiAJCXZhbCB8PSBTVU40SV9UQ09OMF9GUk1fQ1RMX01PREVf
UjsKIAkJdmFsIHw9IFNVTjRJX1RDT04wX0ZSTV9DVExfTU9ERV9COworCQkvKiBGYWxsIHRocm91
Z2ggKi8KIAljYXNlIE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTg6CiAJY2FzZSBNRURJQV9CVVNf
Rk1UX1JHQjY2Nl8xWDdYM19TUFdHOgogCQkvKiBGYWxsIHRocm91Z2g6IGVuYWJsZSBkaXRoZXJp
bmcgKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
