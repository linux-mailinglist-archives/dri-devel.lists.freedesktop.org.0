Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1858636C8B5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5689079;
	Tue, 27 Apr 2021 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EB489079
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 15:34:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9360613EA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619537653;
 bh=nRjupLfRtOC1jx4QARvFWp92/DopAWZE+CYvOd1QYs4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xf7xrFh15+85qDBGqvjtGZcA6XAk5idTyN4iVWB48cXzrK1wlXyVc9fouKZpB7AjH
 Jju0aYIUHCE1wy6WooMwCPVUeU0XUTFgWWc2B6rxq66IPYL0EjamfS70sXohNoCjQu
 NnnZvlExEMa0rr0Gn+7tchsamcn0byq8AZWrmucpVvK6eA+nRoQriSQi2F5cDM7ZSD
 WRrLRplQZVpE/CgPnxzjtuGINBoM4Kj4DmyYSlEj2Fphte4bBeR/TcFlnXQ17+WxLD
 LZYSucpWRR0mxfQQWuN/FQm/zphGSBo/NYdKMb7+S+x6RRgGZwtIsbY9qUJpjY3tTI
 1eeJ5KyxyiIFg==
Received: by mail-ej1-f50.google.com with SMTP id r9so90136096ejj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 08:34:13 -0700 (PDT)
X-Gm-Message-State: AOAM533dKyDlCyjbsRDuzbJaWgzN4rXe0fX+4Tb7+JLQtSMZc9UnfpJd
 V2fuzlQ5UAx4JvRd1CoB6w090vJVx4NH/4mUSQ==
X-Google-Smtp-Source: ABdhPJwN/fh94a1wvQ0KAftdjjUovYxqjRpSBzYoykWjVdlI+hza7uurmQ86UUDbKXyp07MoytDPBVCc0xoBWlV1ncY=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr2818134ejb.310.1619537652286; 
 Tue, 27 Apr 2021 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210427044948.12596-1-hsinyi@chromium.org>
 <20210427044948.12596-2-hsinyi@chromium.org>
In-Reply-To: <20210427044948.12596-2-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 27 Apr 2021 23:34:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__6agGjApVEkAyhPdV46qTjWdHODBGD_VQcYf5PRhF-hA@mail.gmail.com>
Message-ID: <CAAOTY__6agGjApVEkAyhPdV46qTjWdHODBGD_VQcYf5PRhF-hA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mediatek: init panel orientation property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0NOaciDI35pelIOmAseS6jCDkuIvljYgxMjo0OeWvq+mBk++8mgo+Cj4gSW5pdCBwYW5lbCBv
cmllbnRhdGlvbiBwcm9wZXJ0eSBhZnRlciBjb25uZWN0b3IgaXMgaW5pdGlhbGl6ZWQuIExldCB0
aGUKPiBwYW5lbCBkcml2ZXIgZGVjaWRlcyB0aGUgb3JpZW50YXRpb24gdmFsdWUgbGF0ZXIuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBp
bmRleCBhZTQwM2M2N2NiZDkuLjBiZDI3ODcyZjJhNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwo+IEBAIC05NjQsNiArOTY0LDcgQEAgc3RhdGljIGludCBtdGtfZHNpX2VuY29k
ZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAg
ICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRzaS0+Y29ubmVjdG9yKTsKPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJfY2xlYW51cF9lbmNvZGVyOwo+ICAgICAgICAgfQo+ICsgICAgICAgZHJt
X2Nvbm5lY3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KGRzaS0+Y29ubmVjdG9y
KTsKClByb2Nlc3MgdGhlIHJldHVybiB2YWx1ZS4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICAg
ICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihkc2ktPmNvbm5lY3RvciwgJmRzaS0+
ZW5jb2Rlcik7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi4zMS4xLjQ5OC5nNmMxZWJh
OGVlM2QtZ29vZwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
