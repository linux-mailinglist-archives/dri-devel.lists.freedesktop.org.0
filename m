Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83170B0935
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584E6EBAA;
	Thu, 12 Sep 2019 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCF66E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:49:06 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id d17so23148570ios.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 04:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pt9n59Xh89lcvDG7F3KB+ad2c5bCRWrFgBU89mDdIF0=;
 b=TsWOoeP4PP00bpRweU/qWtc8YRYXVlKVY3/EKx1TCQQsPpbD94n5YiBq2W7n7UZzaX
 U4yu/WUzhrRGcy3/mXPxwoALvnkpDSgkZD8y6iO4fKtJyIQL5C2GHvjAYb2vKgIUVSMo
 GD4b4OG6H17N53x/s7aaYFOvlp5OFNBYjuVsK3coXMBVhyFkWLCHpLGleUT5VS4qxLi0
 dguXm7gDtpp1D+kBJIIE7NwCPg9Du8yDPkcqswp7mbtDC0A71uLHt5i+Z11tt9YWLRNy
 HJsc5INuEk83i12IAyZiB9XfUq4n4JsYsJt9D+CfxzlyBifQw+G3sTVM8Z19CDsm6EsQ
 SbhQ==
X-Gm-Message-State: APjAAAVPBFZ+1KuiuZlJjMUpReis+2dMntV7OYy5FE7WvOy+wFlNhXcH
 c7lu/XEjICOapUmrlqcBIq7doZYfBT6yx4HQagvWaw==
X-Google-Smtp-Source: APXvYqxlBQa/pWCmQtM8lPVAXpB2e9g5uT8Bm+hPW3kKFvwwJtOaLE+5YYKw8CrWQllIEI6Nk4MBeu28X+R8MWb0zlk=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr6876408iof.58.1568202545749; 
 Wed, 11 Sep 2019 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-4-mathieu.poirier@linaro.org>
 <20190910143459.GC3362@kroah.com>
In-Reply-To: <20190910143459.GC3362@kroah.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 11 Sep 2019 05:48:55 -0600
Message-ID: <CANLsYkzE+Qnb4v-WQMy1OYQOdwjXhjPAdD7gWnChmVTQNcxs+A@mail.gmail.com>
Subject: Re: [BACKPORT 4.14.y 03/18] drm/omap: panel-dsi-cm: fix driver
To: Greg KH <greg@kroah.com>
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pt9n59Xh89lcvDG7F3KB+ad2c5bCRWrFgBU89mDdIF0=;
 b=s3IP81L3ko+a35IbBsxOpDaYKcaLR+XsiyXdS+gACPhd3Zg9tpfEB5s0WqsNCkb/ld
 jzTUe0fr1/fKFvBulJ05ljCkKy7aFniUsx/6UVED3kqEIStfMaB42lhaQZ6EzbV5QXY4
 noCXTdBBYecwqpAwxOla7XRqIqdkiIkbdI/FZx1MdWF6MlBDq+sIMJjoKAK497BZfbez
 lzT/1oSxZ598DrjH0jMYFrrYBNm63v6Mcuam5ZhavAkwpykZp+yxR3QJPKxFGYHrVHBt
 7mJJp2Xc2WiAbX6JH4hmNJXZgnvgemVDhBPkYw7uHXbKMiIOu/deHKuCywSvZJdYqLHk
 YIRA==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 "# 4 . 7" <stable@vger.kernel.org>, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBTZXAgMjAxOSBhdCAwODozNSwgR3JlZyBLSCA8Z3JlZ0Brcm9haC5jb20+IHdy
b3RlOgo+Cj4gT24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTA6MTc6NDRBTSAtMDYwMCwgTWF0aGll
dSBQb2lyaWVyIHdyb3RlOgo+ID4gRnJvbTogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNv
bT4KPiA+Cj4gPiBjb21taXQgZTEyODMxMGRkZDM3OWIwZmRkMjFkYzQxZDE3NmMzYjM1MDVhMDgz
MiB1cHN0cmVhbQo+ID4KPiA+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciBnZXRfdGltaW5ncygpIGFu
ZCBjaGVja190aW1pbmdzKCkKPiA+IHRvIGdldCB0aGUgZHJpdmVyIHdvcmtpbmcgYW5kIHByb3Bl
cmx5IGluaXRpYWxpemVzIHRoZQo+ID4gdGltaW5nIGluZm9ybWF0aW9uIGZyb20gRFQuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJv
cmEuY28udWs+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWlu
ZW5AdGkuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBv
aXJpZXJAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9ncHUvZHJtL29tYXBkcm0vZGlzcGxh
eXMvcGFuZWwtZHNpLWNtLmMgICB8IDU2ICsrKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IFRIaXMgbG9va3Mg
bGlrZSBhICJuZXcgZmVhdHVyZSIsIHJpZ2h0PyAgV2h5IGlzIHRoaXMgYSBzdGFibGUgcGF0Y2g/
CgpJIHRob3VnaHQgaXQgd2FzIHBhcnQgb2YgNC4xOS55IGJ1dCBsb29raW5nIGF0IGl0IGFnYWlu
IEkgc2VlIHRoYXQgaXQKaXMgdGhlcmUgYXMgcGFydCBvZiB0aGUgbWFpbmxpbmUgYmFzZSByYXRo
ZXIgdGhhbiBhIGJhY2twb3J0LgoKUGxlYXNlIGRyb3AuCgpUaGFua3MsCk1hdGhpZXUKCj4KPiB0
aGFua3MsCj4KPiBncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
