Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70E1C377
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 08:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2039E88FA8;
	Tue, 14 May 2019 06:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951688FA8;
 Tue, 14 May 2019 06:55:17 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id h72so3970803vkh.10;
 Mon, 13 May 2019 23:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ih2oGrtYXXu0lh/kGIeqImpyGiDOUBOAQIASbrXi/0=;
 b=rhKll5oAm2FzTcJvtvmoEYkxy8e3xjv2GnhhQzHXGABJNEfoqRptxDna9FaVcFdhAF
 k41fl0MGzAjn1Xwlmu5F4c1+eIEO05pINgRGJqK+SKfLIVDbmj3x9la/hr/TGOxgJVS8
 ImGYzAAp8H1SS4TSv/5bF1ortYObG+FL+5vDueSgYHiuc5kQHjycra7FJmd/i/fvl8bu
 d/GFfXWC2MLPMymPQLDQ22KHPXnNoMf7aIzubbpty1MsFMLaoSburE5HxKk7DSniFDZy
 roPrsck7EiR5ZODGybMGn0B6G+nJlI/JG+IwEyjm2GOzQsyN+KoteS83M3SJqBAAU3/8
 OTIA==
X-Gm-Message-State: APjAAAXt2cz+SZuTA4XoiBDCkFWbQVROKH4SrBXIK08470MB1/Jf19nZ
 AyHOOqtjkOxtkxntWHVs1Gi1zUzvk2EFDhKsDIPxxg==
X-Google-Smtp-Source: APXvYqxVQ9iSxhMMDWocu6I3/XylgI7pV4jAsjv7xmVN5xg9Ze2BO5HC2JkKxGBzFbKO9bBFLxEWBWXNcevDHTTyfHA=
X-Received: by 2002:a1f:bf95:: with SMTP id p143mr7171358vkf.88.1557816916657; 
 Mon, 13 May 2019 23:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190511170831.25645-1-peteris.rudzusiks@gmail.com>
In-Reply-To: <20190511170831.25645-1-peteris.rudzusiks@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 14 May 2019 16:55:05 +1000
Message-ID: <CACAvsv5Ux7Av45JGQ7Rqe+ZX2zWcbbBNqc+kCZgLT-uGkQAegw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix duplication of nv50_head_atom struct
To: Peteris Rudzusiks <peteris.rudzusiks@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1Ih2oGrtYXXu0lh/kGIeqImpyGiDOUBOAQIASbrXi/0=;
 b=pxeE7OMm2QY35cpZMq/WbbPqYzJtHbKo0opWYLWQDDbWDOSB6FJ0cGuY0Ha+tKnDpf
 mX7o1d6530TTEzb/43EpMPsfvk9vuGDd3PRyiRoMIHzBU5BhHtcxphvHzajMzZjGIR+f
 a9H5TCvbSrodRbRQaYipnEkGdUO1Q3mkKeWEgUXkG6Antlzb82SyOhg50Ijicx6eeFzf
 ixJYNNK3LxbsrJLqOI0LGHOhH945WRR/ZVCgq2x1RD9EKNaz8SdtunT9qBHu8xfj7875
 tJUipjiK0RexW+OcbKLCnhMAMP7aJWimcG3qpIpar2gxJc+Aay0fbGfRG1Qc/+U8tTye
 2BGg==
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMiBNYXkgMjAxOSBhdCAwNDoyMywgUGV0ZXJpcyBSdWR6dXNpa3MKPHBldGVyaXMu
cnVkenVzaWtzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBudjUwX2hlYWRfYXRvbWljX2R1cGxpY2F0
ZV9zdGF0ZSgpIG1ha2VzIGEgY29weSBvZiBudjUwX2hlYWRfYXRvbQo+IHN0cnVjdC4gVGhpcyBw
YXRjaCBhZGRzIGNvcHlpbmcgb2Ygc3RydWN0IG1lbWJlciBuYW1lZCAib3IiLCB3aGljaAo+IHBy
ZXZpb3VzbHkgd2FzIGxlZnQgdW5pbml0aWFsaXplZCBpbiB0aGUgZHVwbGljYXRlZCBzdHJ1Y3R1
cmUuCj4KPiBEdWUgdG8gdGhpcyBidWcsIGluY29ycmVjdCBuaHN5bmMgYW5kIG52c3luYyB2YWx1
ZXMgd2VyZSBzb21ldGltZXMgdXNlZC4KPiBJbiBteSBwYXJ0aWN1bGFyIGNhc2UsIHRoYXQgbGVh
ZCB0byBhIG1pc21hdGNoIGJldHdlZW4gdGhlIG91dHB1dAo+IHJlc29sdXRpb24gb2YgdGhlIGdy
YXBoaWNzIGRldmljZSAoR2VGb3JjZSBHVCA2MzAgT0VNKSBhbmQgdGhlIHJlcG9ydGVkCj4gaW5w
dXQgc2lnbmFsIHJlc29sdXRpb24gb24gdGhlIGRpc3BsYXkuIHhyYW5kciByZXBvcnRlZCAxNjgw
eDEwNTAsIGJ1dAo+IHRoZSBkaXNwbGF5IHJlcG9ydGVkIDEyODB4MTAyNC4gQXMgYSByZXN1bHQg
b2YgdGhpcyBtaXNtYXRjaCwgdGhlIG91dHB1dAo+IG9uIHRoZSBkaXNwbGF5IGxvb2tlZCBsaWtl
IGl0IHdhcyBjcm9wcGVkIChvbmx5IHBhcnQgb2YgdGhlIG91dHB1dCB3YXMKPiBhY3R1YWxseSB2
aXNpYmxlIG9uIHRoZSBkaXNwbGF5KS4KPgo+IGdpdCBiaXNlY3QgcG9pbnRlZCB0byBjb21taXQg
MmNhN2ZiNWMxY2M2ICgiZHJtL25vdXZlYXUva21zL252NTA6IGhhbmRsZQo+IFNldENvbnRyb2xP
dXRwdXRSZXNvdXJjZSBmcm9tIGhlYWQiKSwgd2hpY2ggYWRkZWQgdGhlIG1lbWJlciAib3IiIHRv
Cj4gbnY1MF9oZWFkX2F0b20gc3RydWN0dXJlLCBidXQgZm9yZ290IHRvIGNvcHkgaXQgaW4KPiBu
djUwX2hlYWRfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSgpLgo+Cj4gRml4ZXM6IDJjYTdmYjVjMWNj
NiAoImRybS9ub3V2ZWF1L2ttcy9udjUwOiBoYW5kbGUgU2V0Q29udHJvbE91dHB1dFJlc291cmNl
IGZyb20gaGVhZCIpCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXJpcyBSdWR6dXNpa3MgPHBldGVyaXMu
cnVkenVzaWtzQGdtYWlsLmNvbT4KT29wcywgbmljZSBjYXRjaC4gIFRoYW5rIHlvdSBmb3IgdGhp
cywgSSd2ZSBtZXJnZWQgaXQgaW4gbXkgdHJlZSBhbmQKd2lsbCBnZXQgaXQgdXBzdHJlYW0gQVNB
UC4KClRoYW5rcywKQmVuLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvaGVhZC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYwo+IGluZGV4IDJlN2EwYzM0N2RkYi4u
YWRjZTYyZjRlMThmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2hlYWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQu
Ywo+IEBAIC00MTMsNiArNDEzLDcgQEAgbnY1MF9oZWFkX2F0b21pY19kdXBsaWNhdGVfc3RhdGUo
c3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICAgICAgICAgYXN5aC0+b3ZseSA9IGFybWgtPm92bHk7
Cj4gICAgICAgICBhc3loLT5kaXRoZXIgPSBhcm1oLT5kaXRoZXI7Cj4gICAgICAgICBhc3loLT5w
cm9jYW1wID0gYXJtaC0+cHJvY2FtcDsKPiArICAgICAgIGFzeWgtPm9yID0gYXJtaC0+b3I7Cj4g
ICAgICAgICBhc3loLT5kcCA9IGFybWgtPmRwOwo+ICAgICAgICAgYXN5aC0+Y2xyLm1hc2sgPSAw
Owo+ICAgICAgICAgYXN5aC0+c2V0Lm1hc2sgPSAwOwo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
