Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9686101B1C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6B76EC08;
	Tue, 19 Nov 2019 08:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547006E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:32 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q28so953521lfp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+LP/oqYLNI/WjFbU+/NZQj8FBgrncVTG91u48nmPhw=;
 b=fwHSxU7S0t/WcEuysias6zyzpxdYYD2AWpgsoNfIRQaSqcjxSdR4903ZamfsyDXdgf
 jrg/++PN+jN071P3UW9cllMABg5Tv/I/HB62N+23MHEO5rHl1VIGPFoLLPCO0sLEb9hv
 dkMXdj7WO1yUSueVncWeJ8IcGLrxFt/XIy3MIi842TDtbc7Cc2kV8CvvApSdiGERQ06v
 ZZd4RmYyVnWiL4MP6NWJX/NrN5ykQ+qu9PS/C7wACbGBI0JMWGst4ncgXv+wROo4TGHL
 ZBVj3ATmx7qM7YF5jJTLmDsgcGh8ThugpbMXIUL3WRa6PJP1VKeMMPOj1vrCGnF4Elky
 pbIw==
X-Gm-Message-State: APjAAAVR4zhiW4lzpc2vVPfp/zuaraRy5zGFnmlAK3ELETqrLoQl7VtQ
 CJzDF8SrTpZXil4E9Nu+acw=
X-Google-Smtp-Source: APXvYqxOWxh/C2yG+0v+6CTM3jtniOCxIbWzkA4MxVnyi7RbbNMgB8/QIqmT44xuJVCgU5F6/zJgQA==
X-Received: by 2002:a19:7510:: with SMTP id y16mr885929lfe.24.1574107530519;
 Mon, 18 Nov 2019 12:05:30 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:29 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 01/29] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Mon, 18 Nov 2019 23:02:19 +0300
Message-Id: <20191118200247.3567-2-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+LP/oqYLNI/WjFbU+/NZQj8FBgrncVTG91u48nmPhw=;
 b=J7gO1jvnzvd2hzgw2WlUrI12hvo+RAUFlxPNMOtMmAHWMN9YtS+lfkgjTAxy2CJ1xt
 aLyGBb3tprQmNFCMQzoS3nUUUx7d6bDsx9sm537i1ybwKHRTJS8JcL5qtJj/piMtzx9I
 gAci62RFvH76iewW0RPzUPL5OdJZqSlv9OSI6L1V5Yx28GNVRGGUGErxSYUXnKq3EJ9l
 AzreYAuwgSnlEg9sydIm0X2Av44DA0zz0SFUQ7mRAVWIbxqLUt4Fu+ubXm46An4w4t25
 /lMVvKOrnEbiP21FKe0F3f9CVtP5ZNc9bSZg0mk9XW//f9tgMNV1gxGjLi4T7uJXiH35
 nYxQ==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkgY2xpZW50cyBh
bmQgd2l0aCB0aGUKZXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIuIERvY3VtZW50IG5ldyBpbnRl
cmNvbm5lY3QgcHJvcGVydHkgd2hpY2gKZGVzaWduYXRlcyBtZW1vcnkgY29udHJvbGxlciBhcyBp
bnRlcmNvbm5lY3QgcHJvdmlkZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlk
aWEsdGVncmEyMC1tYy50eHQgICAgICAgICB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtbWMudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1t
Yy50eHQKaW5kZXggZTU1MzI4MjM3ZGY0Li5iMDc2NWQ1Y2IxMjQgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRl
Z3JhMjAtbWMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtbWMudHh0CkBAIC0xNiw2ICsxNiw5IEBAIFJl
cXVpcmVkIHByb3BlcnRpZXM6CiAgIElPTU1VIHNwZWNpZmllciBuZWVkZWQgdG8gZW5jb2RlIGFu
IGFkZHJlc3MuIEdBUlQgc3VwcG9ydHMgb25seSBhIHNpbmdsZQogICBhZGRyZXNzIHNwYWNlIHRo
YXQgaXMgc2hhcmVkIGJ5IGFsbCBkZXZpY2VzLCB0aGVyZWZvcmUgbm8gYWRkaXRpb25hbAogICBp
bmZvcm1hdGlvbiBuZWVkZWQgZm9yIHRoZSBhZGRyZXNzIGVuY29kaW5nLgorLSAjaW50ZXJjb25u
ZWN0LWNlbGxzIDogU2hvdWxkIGJlIDEuIFRoaXMgY2VsbCByZXByZXNlbnRzIG1lbW9yeSBjbGll
bnQKKyAgaW50ZXJjb25uZWN0LiBUaGUgYXNzaWdubWVudHMgbWF5IGJlIGZvdW5kIGluIGhlYWRl
ciBmaWxlCisgIDxkdC1iaW5kaW5ncy9pbnRlcmNvbm5lY3QvdGVncmEtaWNjLmg+LgogCiBFeGFt
cGxlOgogCW1jOiBtZW1vcnktY29udHJvbGxlckA3MDAwZjAwMCB7CkBAIC0yNyw2ICszMCw3IEBA
IEV4YW1wbGU6CiAJCWludGVycnVwdHMgPSA8R0lDX1NQSSA3NyAweDA0PjsKIAkJI3Jlc2V0LWNl
bGxzID0gPDE+OwogCQkjaW9tbXUtY2VsbHMgPSA8MD47CisJCSNpbnRlcmNvbm5lY3QtY2VsbHMg
PSA8MT47CiAJfTsKIAogCXZpZGVvLWNvZGVjQDYwMDFhMDAwIHsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
