Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FAC9D1E3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEF689F85;
	Mon, 26 Aug 2019 14:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BB289F85
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:46:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y8so15576667wrn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKqFlQ5uAweiWoy5Q0NBtlqDIxAoWdFqAZ3hE0aWMrA=;
 b=JN8I8GalPWnewEPpoaNnGZDkTGz8xQiM9CJRVA3VyW+Mb4PlXDJCXSsHdnclD7WPL0
 5LEt3CUa8PVAUnQTBOpxDGB1RwmqcfgeetEkSKnjtBUexdXD8LhhPUbRJim/CBR6gQsx
 oh2S2/WLmvw2XpzhY+6RCztxv4G8qIwwSwliH6G6rfgluRiRwksx3424x/xir5dgcRaB
 o+KGc2GaggTUb/XzizSypM0vfbnKcuA24z3iRFV5u7VlZVZyoTICotOaQ7to3B1JDskn
 NzOkJ8M7TWvSzz1lvtgUBIgS43vETQ9tO5g1XKTNW7/AiVS95DRo33by8TsEcEQRiMQ7
 eIQQ==
X-Gm-Message-State: APjAAAXc/Davk8X2im9N+CspCFiL6+crxPzxTCP7NVjAdomYAw/+H4QN
 3sIi8B2DeQ0wQ4SeX+w9w+zck3NOMq0DZQ==
X-Google-Smtp-Source: APXvYqzj8GflBpfqyAQoqHVpAUfVZVDf2xgGir3LWPo8zTibAZW8llY0SCOEuBpqNLk+uWaJWp10ZQ==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr21617046wrp.176.1566830811145; 
 Mon, 26 Aug 2019 07:46:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e9sm12984595wrm.43.2019.08.26.07.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:46:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: vclk: use the correct G12A frac max value
Date: Mon, 26 Aug 2019 16:46:47 +0200
Message-Id: <20190826144647.17302-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKqFlQ5uAweiWoy5Q0NBtlqDIxAoWdFqAZ3hE0aWMrA=;
 b=oOsWkVyy0OVNO3GEWtL9KUlBPcNQ8EXb5NCLaRrryxI86WLE7itY1IhCRJ//gMudtE
 MI6ag1jiTbVVcDqAqXe22G5Ebaq5BNPFjs6B3Wib8wz4iLstk/g8GUietWVUDOVMtFLD
 B72moJ69pMr5bro4U1czlxVb8JfS6SU1/pnwUeOux5P8jlS5AmQgmodOo1MfubsAtRFd
 6thkrxpAUURZh4j5Bx+8fONziNmU3yKSV12jDFNhld88vr6ZzSyAwVmUIXXrkmddsp89
 B3dw+IJyZkAPVaiO4vKQIwopRI6ZxW7dUD8oDdsLLhWbf2C5s+AV7/4TTATXNxBIP2Vf
 RzRw==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxjdWxhdGluZyB0aGUgSERNSSBQTEwgc2V0dGluZ3MgZm9yIGEgRE1UIG1vZGUgUEhZ
IGZyZXF1ZW5jeSwKdXNlIHRoZSBjb3JyZWN0IG1heCBmcmFjdGlvbmFsIFBMTCB2YWx1ZSBmb3Ig
RzEyQSBWUFUuCgpXaXRoIHRoaXMgZml4LCB3ZSBjYW4gZmluYWxseSBzZXR1cCB0aGUgMTAyNHg3
Ni02MCBtb2RlLgoKRml4ZXM6IDIwMmI5ODA4ZjhlZCAoImRybS9tZXNvbjogQWRkIEcxMkEgVmlk
ZW8gQ2xvY2sgc2V0dXAiKQpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyB8
IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCmluZGV4IGFjNDkxYTc4MTk1Mi4uZjY5
MDc5M2FlMmQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKQEAgLTYzOCwxMyArNjM4
LDE4IEBAIHN0YXRpYyBib29sIG1lc29uX2hkbWlfcGxsX3ZhbGlkYXRlX3BhcmFtcyhzdHJ1Y3Qg
bWVzb25fZHJtICpwcml2LAogCQlpZiAoZnJhYyA+PSBIRE1JX0ZSQUNfTUFYX0dYQkIpCiAJCQly
ZXR1cm4gZmFsc2U7CiAJfSBlbHNlIGlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJsZShwcml2LCBW
UFVfQ09NUEFUSUJMRV9HWE0pIHx8Ci0JCSAgIG1lc29uX3ZwdV9pc19jb21wYXRpYmxlKHByaXYs
IFZQVV9DT01QQVRJQkxFX0dYTCkgfHwKLQkJICAgbWVzb25fdnB1X2lzX2NvbXBhdGlibGUocHJp
diwgVlBVX0NPTVBBVElCTEVfRzEyQSkpIHsKKwkJICAgbWVzb25fdnB1X2lzX2NvbXBhdGlibGUo
cHJpdiwgVlBVX0NPTVBBVElCTEVfR1hMKSkgewogCQkvKiBFbXBpcmljIHN1cHBvcnRlZCBtaW4v
bWF4IGRpdmlkZXJzICovCiAJCWlmIChtIDwgMTA2IHx8IG0gPiAyNDcpCiAJCQlyZXR1cm4gZmFs
c2U7CiAJCWlmIChmcmFjID49IEhETUlfRlJBQ19NQVhfR1hMKQogCQkJcmV0dXJuIGZhbHNlOwor
CX0gZWxzZSBpZiAobWVzb25fdnB1X2lzX2NvbXBhdGlibGUocHJpdiwgVlBVX0NPTVBBVElCTEVf
RzEyQSkpIHsKKwkJLyogRW1waXJpYyBzdXBwb3J0ZWQgbWluL21heCBkaXZpZGVycyAqLworCQlp
ZiAobSA8IDEwNiB8fCBtID4gMjQ3KQorCQkJcmV0dXJuIGZhbHNlOworCQlpZiAoZnJhYyA+PSBI
RE1JX0ZSQUNfTUFYX0cxMkEpCisJCQlyZXR1cm4gZmFsc2U7CiAJfQogCiAJcmV0dXJuIHRydWU7
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
