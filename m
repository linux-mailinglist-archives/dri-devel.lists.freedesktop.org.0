Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054DD07EF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F09F6E8F1;
	Wed,  9 Oct 2019 07:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6ED6E20B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 08:24:14 +0000 (UTC)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1iHkmy-0005wy-RZ
 for dri-devel@lists.freedesktop.org; Tue, 08 Oct 2019 08:24:12 +0000
Received: by mail-pl1-f200.google.com with SMTP id y13so10360779plr.17
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 01:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EpUnbaIFIsvPdXiYRFuIt+BLr84ee69Iv1VzaPWhcis=;
 b=rxR4jqrSg6lTES4gXQr9KYFVPJsQOfnfiDomlOi9T/sy5r44LiD+QdqLrCNeskRqQX
 53iERxZ5AkDRAsiASi0vDfU8mf8DifKKg9/Sip59mAgKDon9hQxg3alpQWmfV5Ruybm3
 LipBSBf3Jy37j9nnP6oSW8s8yqHCpfWkFLJWvNumMZCBFcoIR9E5AkxocyblbcglrYEp
 RtA5Pq3DdWr87Ibp1SX8XXcxvZ3bfajB4+egHz7zcfryoyAp56GA/yTPdkGOk14K6IvV
 amFzL+tDqFK26LBTtevqUFRCWnd+zxHq3OvM+dwhEAqAKwvvx7SPfLmsqXYJzxcvS+cO
 aP/A==
X-Gm-Message-State: APjAAAXiolHKWjIAgyyY4ml81RJJXozflEI83S0cHMOWBs7NGs63aVCd
 N43xQ3zIHmgiFbjGCQr9+mlsxW+bS9XTvoowIgO0bsDOZJw27Hf8QeednRWm+akohkGEUZXxClL
 fl6jbkSfDcQ7/EnJ4j+gQEzRGkYBjWx79kzkkNSIwY9zp9A==
X-Received: by 2002:a63:5020:: with SMTP id e32mr1929503pgb.302.1570523051556; 
 Tue, 08 Oct 2019 01:24:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8lfZOtmUGBUaLob+ysCYWb5ZUJKfV0ywa+5MiQ2rXppPua31DNuu2dIyLeNUpx64VLUVV7w==
X-Received: by 2002:a63:5020:: with SMTP id e32mr1929478pgb.302.1570523051170; 
 Tue, 08 Oct 2019 01:24:11 -0700 (PDT)
Received: from 2001-b011-380f-3c42-1138-6cd0-3dc6-cfa2.dynamic-ip6.hinet.net
 (2001-b011-380f-3c42-1138-6cd0-3dc6-cfa2.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c42:1138:6cd0:3dc6:cfa2])
 by smtp.gmail.com with ESMTPSA id w189sm17403666pfw.101.2019.10.08.01.24.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 01:24:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH] drm/edid: Add 6 bpc quirk for SDC panel in Lenovo G50
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <54557F79-6DE1-4AA4-895A-C0F014926590@canonical.com>
Date: Tue, 8 Oct 2019 16:24:08 +0800
Message-Id: <E40AB4FE-7F61-48C9-A1C9-C24454FE0586@canonical.com>
References: <20190402033037.21877-1-kai.heng.feng@canonical.com>
 <54557F79-6DE1-4AA4-895A-C0F014926590@canonical.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
X-Mailer: Apple Mail (2.3594.4.19)
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIEp1biA2LCAyMDE5LCBhdCAxNjowNCwgS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVu
Z0BjYW5vbmljYWwuY29tPiB3cm90ZToKPiAKPiBIaSwKPiAKPiBhdCAxMTozMCwgS2FpLUhlbmcg
RmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPiAKPj4gQW5vdGhlciBw
YW5lbCB0aGF0IG5lZWRzIDZCUEMgcXVpcmsuCj4gCj4gUGxlYXNlIGluY2x1ZGUgdGhpcyBwYXRj
aCBpZiBwb3NzaWJsZS4KCkFub3RoZXIgZ2VudGxlIHBpbmcuCgo+IAo+IEthaS1IZW5nCj4gCj4+
IAo+PiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4MTk5NjgKPj4g
Q2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY0LjgrCj4+IFNpZ25lZC1vZmYtYnk6IEth
aS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4KPj4gLS0tCj4+IGRyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMyArKysKPj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPj4gaW5kZXggOTkwYjE5MDlmOWQ3Li4xY2I0ZDAw
NTJlZmUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4+IEBAIC0xNjYsNiArMTY2LDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBlZGlkX3F1aXJrIHsKPj4gCS8qIE1lZGlvbiBNRCAzMDIxNyBQRyAqLwo+
PiAJeyAiTUVEIiwgMHg3YjgsIEVESURfUVVJUktfUFJFRkVSX0xBUkdFXzc1IH0sCj4+IAo+PiAr
CS8qIExlbm92byBHNTAgKi8KPj4gKwl7ICJTREMiLCAxODUxNCwgRURJRF9RVUlSS19GT1JDRV82
QlBDIH0sCj4+ICsKPj4gCS8qIFBhbmVsIGluIFNhbXN1bmcgTlA3MDBHN0EtUzAxUEwgbm90ZWJv
b2sgcmVwb3J0cyA2YnBjICovCj4+IAl7ICJTRUMiLCAweGQwMzMsIEVESURfUVVJUktfRk9SQ0Vf
OEJQQyB9LAo+PiAKPj4gLS0gCj4+IDIuMTcuMQo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
