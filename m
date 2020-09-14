Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF32699E2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F1F6E820;
	Mon, 14 Sep 2020 23:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17AC6E820
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:44:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6820821D24
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600127055;
 bh=+OhI6QNHCUTezEy3dC8zYNoj1C1U2IUoG/B2Kdfhl0Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tldsgMhMqLV/lzvk9W8V5/yK35Olz+LfV3L7KOMtcrLzTTSw9fIEELANJodDHRdQD
 B2T06DyfTxiJHGrZBjdCQxk84dzjB+FaMfaCJZXZ86nBGTk2e53cS8NF4dcy4+EixH
 rkXN5fe+bf0vsl7ZMkLPt9XaQOHrlWvtn5Lg5UjE=
Received: by mail-ej1-f41.google.com with SMTP id lo4so2356622ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:44:15 -0700 (PDT)
X-Gm-Message-State: AOAM5335ynfJ6S1OWE/XWOZX4Mxg0eeG/6mhP2Tgj1PE5SkKk+Ih1dZ/
 LlvvBOYYSM/e+cLOQ8YnHrTUg1iY2dKVL4E0vw==
X-Google-Smtp-Source: ABdhPJyYu9jlk9XD95lFQa7HI5Qb4vp8g0UXjCYsPMegPd9apv/vOGC9kUF8wL49jyw/7LJM+MYuJZzZHH36b+Lyj/4=
X-Received: by 2002:a17:906:8690:: with SMTP id
 g16mr16850817ejx.187.1600127053936; 
 Mon, 14 Sep 2020 16:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200911112151.3220469-1-yukuai3@huawei.com>
In-Reply-To: <20200911112151.3220469-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:44:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY__jzUgrz9UuRFn104ePfMY5sR4vLuRRFNWVO=1naZUntw@mail.gmail.com>
Message-ID: <CAAOTY__jzUgrz9UuRFn104ePfMY5sR4vLuRRFNWVO=1naZUntw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_hdmi_dt_parse_pdata()
To: Yu Kuai <yukuai3@huawei.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, junzhi.zhao@mediatek.com,
 jie.qiu@mediatek.com, yi.zhang@huawei.com, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDEx5pelIOmAseS6lCDkuIvljYg3OjIy5a+r6YGT77yaCj4KPiBpZiBvZl9maW5kX2RldmljZV9i
eV9ub2RlKCkgc3VjY2VlZCwgbXRrX2RybV9rbXNfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+IGEgY29y
cmVzcG9uZGluZyBwdXRfZGV2aWNlKCkuIFRodXMgYWRkIGp1bXAgdGFyZ2V0IHRvIGZpeCB0aGUg
ZXhjZXB0aW9uCj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCgpS
ZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4g
Rml4ZXM6IDhmODNmMjY4OTFlMSAoImRybS9tZWRpYXRlazogQWRkIEhETUkgc3VwcG9ydCIpCj4g
U2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDI2ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBpbmRleCBmMmU5YjQyOTk2MGIu
LmE5NzcyNTY4MGQ0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAg
LTE1MDcsMjUgKzE1MDcsMzAgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShz
dHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gZ2V0IHN5c3RlbSBjb25maWd1cmF0aW9u
IHJlZ2lzdGVyczogJWRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0KTsKPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNl
Owo+ICAgICAgICAgfQo+ICAgICAgICAgaGRtaS0+c3lzX3JlZ21hcCA9IHJlZ21hcDsKPgo+ICAg
ICAgICAgbWVtID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAw
KTsKPiAgICAgICAgIGhkbWktPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW0p
Owo+IC0gICAgICAgaWYgKElTX0VSUihoZG1pLT5yZWdzKSkKPiAtICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoaGRtaS0+cmVncyk7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGhkbWktPnJlZ3Mp
KSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoaGRtaS0+cmVncyk7Cj4gKyAgICAg
ICAgICAgICAgIGdvdG8gcHV0X2RldmljZTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmVtb3Rl
ID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5wLCAxLCAwKTsKPiAtICAgICAgIGlmICghcmVt
b3RlKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIGlmICghcmVt
b3RlKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAg
IGdvdG8gcHV0X2RldmljZTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaWYgKCFvZl9kZXZpY2Vf
aXNfY29tcGF0aWJsZShyZW1vdGUsICJoZG1pLWNvbm5lY3RvciIpKSB7Cj4gICAgICAgICAgICAg
ICAgIGhkbWktPm5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHJlbW90ZSk7Cj4gICAg
ICAgICAgICAgICAgIGlmICghaGRtaS0+bmV4dF9icmlkZ2UpIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgIldhaXRpbmcgZm9yIGV4dGVybmFsIGJyaWRnZVxuIik7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQocmVtb3RlKTsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSAtRVBST0JFX0RFRkVSOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
cHV0X2RldmljZTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gQEAgLTE1MzQs
NyArMTUzOSw4IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10
a19oZG1pICpoZG1pLAo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBm
aW5kIGRkYy1pMmMtYnVzIG5vZGUgaW4gJXBPRlxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZW1vdGUpOwo+ICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChyZW1vdGUpOwo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZB
TDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNlOwo+ICAgICAgICAgfQo+ICAgICAg
ICAgb2Zfbm9kZV9wdXQocmVtb3RlKTsKPgo+IEBAIC0xNTQyLDEwICsxNTQ4LDE0IEBAIHN0YXRp
YyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLAo+ICAg
ICAgICAgb2Zfbm9kZV9wdXQoaTJjX25wKTsKPiAgICAgICAgIGlmICghaGRtaS0+ZGRjX2FkcHQp
IHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGRkYyBpMmMg
YWRhcHRlciBieSBub2RlXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gcHV0
X2RldmljZTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gK3B1dF9kZXZpY2U6
Cj4gKyAgICAgICBwdXRfZGV2aWNlKGhkbWktPmNlY19kZXYpOwo+ICsgICAgICAgcmV0dXJuIHJl
dDsKPiAgfQo+Cj4gIC8qCj4gLS0KPiAyLjI1LjQKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
