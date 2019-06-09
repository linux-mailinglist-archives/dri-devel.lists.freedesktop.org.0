Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487B3A5A8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E099989304;
	Sun,  9 Jun 2019 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0A89219
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 12:49:01 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 16so5481013ljv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2019 05:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HTkijLgHpahbU8iPdZoCkCjwTACeSfhcFyc/UqmC25A=;
 b=DqdZBCyyG6IOi5NGkl2FDrn525m5TSRXafvH0rh2sbDElX5MWj6aXLQz5UH5h0r5pK
 +pSNnTDF8d/gVNLms9Pd0j7hQfhF5ViNLr+STOvec4DMqXEIabAVWN4hbOjrnQOCzsuD
 NUP119WMawmlIzNNddtNXac0KY/LZzF9rLmlLd7Lne2uzOvpsXc9ThBpf1ta5d4UaFaN
 tv4isks5KbTWu7GuJ4vucbA7MZNkIp2/Aat9fq/zq5/NwQTo+jwHuGAvvfI1IkHFnt5g
 /3ybzc+Ap4V9yifocIXawDkf4cn+m/hUrMbb/BI3g7SRk7bU8ApBrd/6l+Tm2Yu7LqBO
 obaQ==
X-Gm-Message-State: APjAAAUuTrxEhsdqe1waZ2dU9eVeRisV0x2r4Q9i3QgJmEO86QSNG+Qc
 oGEr4z2nL7kLCzg74IusYXOXtv3D
X-Google-Smtp-Source: APXvYqzp5SzfrKd+porFnoOVyQH/+AhmpmjU35QDywWYnFsIU3oCoTHdsxV6HbGtXwJDQPo2m2f28Q==
X-Received: by 2002:a2e:8716:: with SMTP id m22mr33471188lji.128.1560084539423; 
 Sun, 09 Jun 2019 05:48:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.googlemail.com with ESMTPSA id f4sm1367381ljm.13.2019.06.09.05.48.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 05:48:58 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Increase maximum DMA segment size
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190605084605.12225-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db06ce74-6051-8bb4-555d-505f8d3baa85@gmail.com>
Date: Sun, 9 Jun 2019 15:48:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605084605.12225-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HTkijLgHpahbU8iPdZoCkCjwTACeSfhcFyc/UqmC25A=;
 b=KxJshuGvHEVpki2MbV+pkHZOdg2TWxsmTSYjfZtsluih4PmS3MDoQB1dvyK2g7GrrI
 AKeNl0WVOF8GF7wMOuRS9UwzFVt8or4KO9kRW30XCreXf5NmXRuEZx/G5mGb/YzXxIXR
 JomFEIAckOmu0lYL5UYpynZqgZGJxm+3c/nOjo09FnStWYfCiiKZLQoG3+/Yiv5TzzHR
 kaVmTMSHzJxEMoQu28lgk4Y9BBR0++deSiXH0cHljXCeCd0ljmfhRo7ZE59M83Pt5g2B
 0tvlvTXWFO42rTm1m+30ajkITwqPyUHYw4I9VlDK12X1rjeHqE5aZew+aImIyOHyQ7nb
 yxbA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDYuMjAxOSAxMTo0NiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFJlY2VudCB2ZXJzaW9ucyBvZiB0
aGUgRE1BIEFQSSBkZWJ1ZyBjb2RlIGhhdmUgc3RhcnRlZCB0byB3YXJuIGFib3V0Cj4gdmlvbGF0
aW9ucyBvZiB0aGUgbWF4aW11bSBETUEgc2VnbWVudCBzaXplLiBUaGlzIGlzIGJlY2F1c2UgdGhl
IHNlZ21lbnQKPiBzaXplIGRlZmF1bHRzIHRvIDY0IEtpQiwgd2hpY2ggY2FuIGVhc2lseSBiZSBl
eGNlZWRlZCBpbiBsYXJnZSBidWZmZXIKPiBhbGxvY2F0aW9ucyBzdWNoIGFzIHVzZWQgaW4gRFJN
L0tNUyBmb3IgZnJhbWVidWZmZXJzLgo+IAo+IFRlY2huaWNhbGx5IHRoZSBUZWdyYSBTTU1VIGFu
ZCBBUk0gU01NVSBkb24ndCBoYXZlIGEgbWF4aW11bSBzZWdtZW50Cj4gc2l6ZSAodGhleSBtYXAg
aW5kaXZpZHVhbCBwYWdlcyBpcnJlc3BlY3RpdmUgb2Ygd2hldGhlciB0aGV5IGFyZQo+IGNvbnRp
Z3VvdXMgb3Igbm90KSwgc28gdGhlIGNob2ljZSBvZiA0IE1pQiBpcyBhIGJpdCBhcmJpdHJhcnkg
aGVyZS4gVGhlCj4gbWF4aW11bSBzZWdtZW50IHNpemUgaXMgYSAzMi1iaXQgdW5zaWduZWQgaW50
ZWdlciwgdGhvdWdoLCBzbyB3ZSBjYW4ndAo+IHNldCBpdCB0byB0aGUgY29ycmVjdCBtYXhpbXVt
IHNpemUsIHdoaWNoIHdvdWxkIGJlIHRoZSBzaXplIG9mIHRoZQo+IGFwZXJ0dXJlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYyB8IDMgKysrCj4gIGluY2x1ZGUvbGludXgvaG9zdDF4
LmggICB8IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1
cy5jCj4gaW5kZXggOTc5N2NjYjBhMDczLi42Mzg3MzAyYzEyNDUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvaG9zdDF4L2J1cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCj4g
QEAgLTQxNCw2ICs0MTQsOSBAQCBzdGF0aWMgaW50IGhvc3QxeF9kZXZpY2VfYWRkKHN0cnVjdCBo
b3N0MXggKmhvc3QxeCwKPiAgCj4gIAlvZl9kbWFfY29uZmlndXJlKCZkZXZpY2UtPmRldiwgaG9z
dDF4LT5kZXYtPm9mX25vZGUsIHRydWUpOwo+ICAKPiArCWRldmljZS0+ZGV2LmRtYV9wYXJtcyA9
ICZkZXZpY2UtPmRtYV9wYXJtczsKPiArCWRtYV9zZXRfbWF4X3NlZ19zaXplKCZkZXZpY2UtPmRl
diwgU1pfNE0pOwo+ICsKPiAgCWVyciA9IGhvc3QxeF9kZXZpY2VfcGFyc2VfZHQoZGV2aWNlLCBk
cml2ZXIpOwo+ICAJaWYgKGVyciA8IDApIHsKPiAgCQlrZnJlZShkZXZpY2UpOwo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oIGIvaW5jbHVkZS9saW51eC9ob3N0MXguaAo+IGlu
ZGV4IGNmZmYzMGI5YTYyZS4uZTZlZWE0NWUxMTU0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvaG9zdDF4LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oCj4gQEAgLTI5Nyw2ICsy
OTcsOCBAQCBzdHJ1Y3QgaG9zdDF4X2RldmljZSB7Cj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIGNsaWVu
dHM7Cj4gIAo+ICAJYm9vbCByZWdpc3RlcmVkOwo+ICsKPiArCXN0cnVjdCBkZXZpY2VfZG1hX3Bh
cmFtZXRlcnMgZG1hX3Bhcm1zOwo+ICB9Owo+ICAKPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgaG9z
dDF4X2RldmljZSAqdG9faG9zdDF4X2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gCgpKdXN0
IGEgdmVyeSBtaW5vciBuaXQ6CgpJdCBtYXkgYmUgd29ydGh3aGlsZSB0byBpbmNsdWRlICJkbWEt
bWFwcGluZy5oIiBkaXJlY3RseSBmb3IgY29uc2lzdGVuY3kKaGVyZSBhcyB3ZWxsIHNpbmNlIG5v
dGhpbmcgaW5jbHVkZXMgaXQgZGlyZWN0bHkuIEkgbm90aWNlZCBhIGJ1aWxkCmJyZWFrYWdlIG9m
IHRoZSBncmF0ZS1kcml2ZXIncyBrZXJuZWwgb24gYSByZWJhc2Ugd2l0aCAiZ2l0IC0tZXhlYwon
bWFrZS4uJyIgY2F1c2Ugd2UgaGF2ZSBzb21lIG9mICJpb21tdS9pb3ZhIiBoZWFkZXJzIHRoYXQg
YXJlIG1vdmVkCmFyb3VuZCBpbiB0aGUgaW50ZXJtZWRpYXRlIHBhdGNoZXMuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
