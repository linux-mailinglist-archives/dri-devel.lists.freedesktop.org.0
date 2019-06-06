Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E938570
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670CF89B20;
	Fri,  7 Jun 2019 07:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CD889709
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:04:36 +0000 (UTC)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hYnNy-0005Z6-QG
 for dri-devel@lists.freedesktop.org; Thu, 06 Jun 2019 08:04:35 +0000
Received: by mail-pg1-f199.google.com with SMTP id 21so1097366pgl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 01:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=AiCZ+eWnELxsFCfkNHpZ8uErbdptfu0aYCu6DgRNOow=;
 b=hozCA4VGLUGL5AqGkZxY8UGeGP2Sqmp5OvOlPspHkpu2rB0l7qjmBDp3Y5TdqXNORG
 HotJxX3I/vDr5pldWujCcxGRPi0KmGUzMFVq3IiytaFNz1hy+uwwbH/HuGgYFk+1DX5o
 i3pc1WgXMa5MEcSRUOADzNLevq4blfQVRjkTSVQisyAGGhRyXM08pbLYhRvuw9k/Bat+
 DvhJVUbWAgVx+XE7pm4X4Lq5RUqfg5tHDxOg8w3Pnaa0jkGstwhJb8BwyJeg2WIoiwZW
 XCs6QPQxWA/jpXMS+9Df+bRgryII+r8jWYq33o3gKADe4SDTUqfW1GLGXHm+fftaUt3y
 k4kA==
X-Gm-Message-State: APjAAAVO/wKBKmBxWo6ta/cT7CeXobXpPyhOFxoWxxzKAXL3VLwIgkZJ
 aDin9pY2IJU6JH6RVSPlFUj8FonQp/R6g6cJX72Q+NMGpv74JROUtQlmgrwtwKs5H5jHI2efO+H
 HwKYknTKu21TA1HOlBC6RQAbTJyKM6S7A9um+INXPy8lLog==
X-Received: by 2002:a17:902:3fa5:: with SMTP id
 a34mr47447530pld.317.1559808273091; 
 Thu, 06 Jun 2019 01:04:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSL9CxDGC2OiUM9isEnbmxV2GSn8dHls2aVW2WpOdz4AmFmP6Zv/jGob/jsAUodbFR9junzg==
X-Received: by 2002:a17:902:3fa5:: with SMTP id
 a34mr47447510pld.317.1559808272766; 
 Thu, 06 Jun 2019 01:04:32 -0700 (PDT)
Received: from 2001-b011-380f-115a-4031-dc0c-76c4-a6d1.dynamic-ip6.hinet.net
 (2001-b011-380f-115a-4031-dc0c-76c4-a6d1.dynamic-ip6.hinet.net.
 [2001:b011:380f:115a:4031:dc0c:76c4:a6d1])
 by smtp.gmail.com with ESMTPSA id n70sm1047794pjb.4.2019.06.06.01.04.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 01:04:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] drm/edid: Add 6 bpc quirk for SDC panel in Lenovo G50
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20190402033037.21877-1-kai.heng.feng@canonical.com>
Date: Thu, 6 Jun 2019 16:04:29 +0800
Message-Id: <54557F79-6DE1-4AA4-895A-C0F014926590@canonical.com>
References: <20190402033037.21877-1-kai.heng.feng@canonical.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgphdCAxMTozMCwgS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29t
PiB3cm90ZToKCj4gQW5vdGhlciBwYW5lbCB0aGF0IG5lZWRzIDZCUEMgcXVpcmsuCgpQbGVhc2Ug
aW5jbHVkZSB0aGlzIHBhdGNoIGlmIHBvc3NpYmxlLgoKS2FpLUhlbmcKCj4KPiBCdWdMaW5rOiBo
dHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4MTk5NjgKPiBDYzogPHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmc+ICMgdjQuOCsKPiBTaWduZWQtb2ZmLWJ5OiBLYWktSGVuZyBGZW5nIDxrYWku
aGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMKPiBpbmRleCA5OTBiMTkwOWY5ZDcuLjFjYjRkMDA1MmVmZSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCj4gQEAgLTE2Niw2ICsxNjYsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVkaWRfcXVpcmsg
ewo+ICAJLyogTWVkaW9uIE1EIDMwMjE3IFBHICovCj4gIAl7ICJNRUQiLCAweDdiOCwgRURJRF9R
VUlSS19QUkVGRVJfTEFSR0VfNzUgfSwKPgo+ICsJLyogTGVub3ZvIEc1MCAqLwo+ICsJeyAiU0RD
IiwgMTg1MTQsIEVESURfUVVJUktfRk9SQ0VfNkJQQyB9LAo+ICsKPiAgCS8qIFBhbmVsIGluIFNh
bXN1bmcgTlA3MDBHN0EtUzAxUEwgbm90ZWJvb2sgcmVwb3J0cyA2YnBjICovCj4gIAl7ICJTRUMi
LCAweGQwMzMsIEVESURfUVVJUktfRk9SQ0VfOEJQQyB9LAo+Cj4gLS0gCj4gMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
