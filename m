Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714530B25C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 22:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0923489FD7;
	Mon,  1 Feb 2021 21:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272E89FD7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612216522;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1y8GmyBWVCl6Pbg+0+AjclhMsvzhPPIsTiKTMZg/W8=;
 b=dhVGJI1ExHsvt223Pbmwl95wndSYloQTQIbZKITnbkI16BvmY4cZ4F694iT+oHXYF66Jvd
 T63xil1aqgd9YDjXeRSKJCEEJTTYIJ+eBZE+p511Z3XY9MrW7uBx1zief0MZX2TqDS1724
 PdFk/rIjYlMGxNvg80Nvkf+yS2LoANk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-CxDwqVYiNLyk_bEVeiEs5Q-1; Mon, 01 Feb 2021 16:54:12 -0500
X-MC-Unique: CxDwqVYiNLyk_bEVeiEs5Q-1
Received: by mail-qt1-f198.google.com with SMTP id v65so9262792qtd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 13:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=k1y8GmyBWVCl6Pbg+0+AjclhMsvzhPPIsTiKTMZg/W8=;
 b=HfFkB1YwynSdc/qUHf6pG/uhc8G6ROn1hLVe3s56B1lK1Xc+yFsthh9CwstVYqZEYN
 N8q+BR+e1wvbcR4mwMx6pcN8NL9NPwUTHPYv93lWhiHInWt3F38YiPKAnjRRWx5jk4er
 7LfbAignqatmwqH3aBaI5O5UYpfltZ/cPkN+4Y/FtvqvtYSNmqlurFRAmwtbM55+Ikce
 U0CZrWwPDtuRmfI5SSXmv283oTN9ZhuxzvWnQEp6x32pkRyXiWrIa+ikxI5iT9OnaWSR
 R0Kk81eDDFkbSY83e73RqURBjTCGVn8hfTf5qdH0eOazfkkcewpxGzp89Dtcw1uX+6hH
 DCRw==
X-Gm-Message-State: AOAM532FcJ3ToAwjOHDdX/Av/3AQV2XsZWlmMXkNy61Yf23zh7NEosX4
 OyXdiZm//IAuB+NLiMpiPKnJEfEaX13BvCxVHdnkgRH7scOVYJvq/15A0RXUKDEgRTTwPvTHVsI
 FVlsvgzDgb+izaMfaKnsxTIm77iQY
X-Received: by 2002:ac8:7c82:: with SMTP id y2mr17011500qtv.67.1612216452074; 
 Mon, 01 Feb 2021 13:54:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5ooeTglnEBcbFwXF8LDaJXBhwXBklXKKqPeeM2J3NXPjrz+y63QFGy+CKyScLNX3h+7tlpQ==
X-Received: by 2002:ac8:7c82:: with SMTP id y2mr17011488qtv.67.1612216451917; 
 Mon, 01 Feb 2021 13:54:11 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id b13sm12085730qtj.97.2021.02.01.13.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 13:54:11 -0800 (PST)
Message-ID: <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
From: Lyude Paul <lyude@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Joe
 Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>
Date: Mon, 01 Feb 2021 16:54:10 -0500
In-Reply-To: <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
 <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBlbnRpcmVseSB1bnJlbGF0ZWQgdG8gdGhpcyB0aHJlYWQsIGJ1dCBJIG5vdGljZWQg
d2hlbiBnb2luZyB0aHJvdWdoIGRyaS0KZGV2ZWwgdGhhdCB0aGlzIGVtYWlsIGlzIHNvbWVob3cg
ZGF0ZWQgdHdvIGRheXMgaW4gdGhlIGZ1dHVyZSBmcm9tIG5vdy4KCk9uIFdlZCwgMjAyMS0wMi0w
MyBhdCAxNDoyNiArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAzMC4wMS4yMSB1
bSAxOTo0NyBzY2hyaWViIEpvZSBQZXJjaGVzOgo+ID4gT24gTW9uLCAyMDIwLTA4LTI0IGF0IDIx
OjU2IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiA+ID4gVXNlIHNlbWljb2xvbnMgYW5kIGJy
YWNlcy4KPiA+IFBpbmc/Cj4gPiDCoCAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMg
PGpvZUBwZXJjaGVzLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IAo+IERvIHlvdSBoYXZlIGNvbW1pdCByaWdodHMgdG8g
ZHJtLW1pc2MtbmV4dD8KPiAKPiA+ID4gLS0tCj4gPiA+IMKgwqBkcml2ZXJzL2RtYS1idWYvc3Qt
ZG1hLWZlbmNlLmMgfCA3ICsrKysrLS0KPiA+ID4gwqDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS0KPiA+ID4g
ZmVuY2UuYwo+ID4gPiBpbmRleCBlNTkzMDY0MzQxYzguLmM4YTEyZDdhZDcxYSAxMDA2NDQKPiA+
ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYwo+ID4gPiBAQCAtNDcxLDggKzQ3MSwxMSBAQCBzdGF0
aWMgaW50IHRocmVhZF9zaWduYWxfY2FsbGJhY2sodm9pZCAqYXJnKQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVuY2Vfc2lnbmFsKGYx
KTsKPiA+ID4gwqAgCj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHNtcF9zdG9yZV9tYihjYi5zZWVuLCBmYWxzZSk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoIWYyIHx8IGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soZjIsICZjYi5jYiwK
PiA+ID4gc2ltcGxlX2NhbGxiYWNrKSkKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBtaXNzKyssIGNiLnNlZW4gPSB0cnVlOwo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFmMiB8fAo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soZjIsICZjYi5jYiwg
c2ltcGxlX2NhbGxiYWNrKSkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoG1pc3MrKzsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjYi5zZWVuID0gdHJ1ZTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gwqAgCj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmICghdC0+YmVmb3JlKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVuY2Vfc2lnbmFsKGYxKTsKPiA+IAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
LS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5l
ZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBo
YXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0
aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQg
SQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQg
bWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
