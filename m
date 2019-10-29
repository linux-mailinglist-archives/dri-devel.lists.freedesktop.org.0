Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A2E8F3B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868866E51B;
	Tue, 29 Oct 2019 18:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48136E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:26:08 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D50021721
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:26:08 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id t11so2997064ybk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 11:26:08 -0700 (PDT)
X-Gm-Message-State: APjAAAW9XUTZwoPWV5R84chKhqVplQJIq5PDw5E+nGFMlr65c0+EwynR
 k90IE9DPjHw7+Vjxc7CICrCZxVmuk27KJI7flQ==
X-Google-Smtp-Source: APXvYqwFNWuzIjHFIw4D1DrdoBULCXJ8PyRfbcXJhzZThgQrb2mqofhnB0oQTAt2TqFMwYk9GkYYmUHEYUt6vWHFEtA=
X-Received: by 2002:a25:3ce:: with SMTP id 197mr19217412ybd.255.1572373567370; 
 Tue, 29 Oct 2019 11:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <1572314250-6463-1-git-send-email-wang.yi59@zte.com.cn>
In-Reply-To: <1572314250-6463-1-git-send-email-wang.yi59@zte.com.cn>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Oct 2019 13:25:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJiT5t1xsOR6LkCHQgQu=jSo_KCKxf78dhnzcNsxRj3=g@mail.gmail.com>
Message-ID: <CAL_JsqJiT5t1xsOR6LkCHQgQu=jSo_KCKxf78dhnzcNsxRj3=g@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panfrost: fix -Wmissing-prototypes warnings
To: Yi Wang <wang.yi59@zte.com.cn>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572373568;
 bh=0KTYYh/jhIbkXAxzdXFRSuGrcd7MS3TmgKMN3V8tevQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=miCvECNShxOUEFwBQ5hmMk2oasl0FiQCUEArwKtWxsW4UifClVjdmIEgYIgZ8mLl4
 QABvnlyl+jkl1CrBilXkuqdh1G1yjS7xJw00a9CfFTgcqpVeiPx4G5MuycyQcq+Mg8
 oe/a1ctmd5Gh4BtmckE4VntCT0cp+jUaEXVroOh8=
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
Cc: xue.zhihong@zte.com.cn, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, wang.liang82@zte.com.cn,
 up2wing@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgODo1NSBQTSBZaSBXYW5nIDx3YW5nLnlpNTlAenRlLmNv
bS5jbj4gd3JvdGU6Cj4KPiBXZSBnZXQgdGhlc2Ugd2FybmluZ3Mgd2hlbiBidWlsZCBrZXJuZWwg
Vz0xOgo+IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmM6MzU6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5mcm9zdF9wZXJmY250X2Ns
ZWFuX2NhY2hlX2RvbmXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+IGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmM6NDA6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhwYW5mcm9zdF9wZXJmY250X3NhbXBsZV9kb25l4oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KPiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNu
dC5jOjE5MDo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBhbmZyb3N0
X2lvY3RsX3BlcmZjbnRfZW5hYmxl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jOjIxODo1OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBhbmZyb3N0X2lvY3RsX3BlcmZjbnRfZHVtcOKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X3BlcmZjbnQuYzoyNTA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhw
YW5mcm9zdF9wZXJmY250X2Nsb3Nl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jOjI2NDo1OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBhbmZyb3N0X3BlcmZjbnRfaW5pdOKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCj4gZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZj
bnQuYzozMjA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5mcm9z
dF9wZXJmY250X2ZpbmnigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+IGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYzoyMjc6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhwYW5mcm9zdF9tbXVfZmx1c2hfcmFuZ2XigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYzo0MzU6NTog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5mcm9zdF9tbXVfbWFwX2Zh
dWx0X2FkZHLigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gRm9yIGZpbGUgcGFuZnJvc3Rf
bW11LmMsIG1ha2UgZnVuY3Rpb25zIHN0YXRpYyB0byBmaXggdGhpcy4KPiBGb3IgZmlsZSBwYW5m
cm9zdF9wZXJmY250LmMsIGluY2x1ZGUgaGVhZGVyIGZpbGUgY2FuIGZpeCB0aGlzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogWWkgV2FuZyA8d2FuZy55aTU5QHp0ZS5jb20uY24+Cj4gUmV2aWV3ZWQtYnk6
IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gLS0tCj4KPiB2NDogbWFrZSB0
aGUgcGFyYW1ldGVycyBhbGlnbmVkLgo+Cj4gdjM6IHVzaW5nIHRhYiBzaXplIG9mIDggb3RoZXIg
dGhhbiA0Lgo+Cj4gdjI6IGFsaWduIHBhcmFtZXRlciBsaW5lIGFuZCBtb2RpZnkgY29tbWVudC4g
VGhhbmtzIHRvIFN0ZXZlLgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMgICAgIHwgOSArKysrKy0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X3BlcmZjbnQuYyB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCnY0IGRpZG4ndCBzZWVtIHRvIG1ha2UgaXQgdG8gdGhlIGxpc3Qg
eWV0IChub24tc3Vic2NyaWJlcnMgZ2V0Cm1vZGVyYXRlZCkgYW5kIEkgbWlzc2VkIHRoaXMuIEkg
YXBwbGllZCB2MyBhbmQgZml4ZWQgdXAgdGhlIGFsaWdubWVudC4KClJvYgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
