Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7898B988F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9029F6FDD0;
	Fri, 20 Sep 2019 20:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A3A6E0A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 20:09:52 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r16so7533323edq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 13:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Liy99NbfBPKnCLL5pI97ZdCbqOlNrE+8AE8B3qqiLLk=;
 b=F3RUrFxwFj72D1BJFqurQvhqxinl07MGsyg8rdGYQIvjTdfddENMgkflPEKDRpdAQK
 i2je1KysLOsvcHgvrLDaYr077XRn1bAHl3H8C+Z3an0U64lWlVDO+dy+pIlNKM1YVMCj
 /XjAAG9H4ZMma7d/FeN0SRaCA3tgat2uTe4/FwelZlQfSAK1EkGfsIZTYMdwdxIlDkWX
 aj4wfZLhtejUrMcnm3WhVcsPBFS4TPTvSwGO8IHy/he0z7XGN6sSVa7i4bSeZ5nRuu0H
 vSy6NVihbPIdsiuenMZY/KvMSTxk0TDXCZp+rm25sL220Yc8gf3wnMj3ziBmclQdn+cC
 wUGg==
X-Gm-Message-State: APjAAAWPtRK2POcLaY0YQl9XsrPwdImWMFj0Pzqou0XarOd1+AXgRDIy
 exTsHfEHzJecsw9M4+RtIOBPIhMN5xZ1DNrt2+elRQ==
X-Google-Smtp-Source: APXvYqx9L9yJGIjWkbUpHUhfQrO13iJtlPQ5sEGBpIdtMQYiiHr/3ySgCyO4aVXb9xPojgQmlY/tbDb8c7PfxfUUvpY=
X-Received: by 2002:a17:906:6c98:: with SMTP id
 s24mr11317157ejr.28.1569010190869; 
 Fri, 20 Sep 2019 13:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190919123703.8545-1-roman.stratiienko@globallogic.com>
 <20190919171754.x6lq73cctnqsjr4v@gilmour> <104595190.vWb6g8xIPX@jernej-laptop>
 <CAODwZ7sPG+_YvnLBU11uYaNpDFthLOkcYXsd=ZQtM+88+cPi9A@mail.gmail.com>
 <20190920061800.65sm6jth2afatsvl@gilmour>
In-Reply-To: <20190920061800.65sm6jth2afatsvl@gilmour>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Fri, 20 Sep 2019 23:09:39 +0300
Message-ID: <CAODwZ7vmiBQ87FeGVwxkcZ3DFaGHk8iDCOavNNRw=MO1hFNruA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Use vi plane as primary
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Liy99NbfBPKnCLL5pI97ZdCbqOlNrE+8AE8B3qqiLLk=;
 b=BZyB9leZy0o8BDwc4dpNHtln9sYHsI2MCbOSfmRGUGn35V2zNXwRBAEX+8CTMWS/KO
 JbR0CMvf6eYH71IuCq1KUXVRO6QJMLNr5DDBWlLvcn6KMHAGuQn7oiGF0ofNNZ7gA16f
 GiYGb/OkduiejdPeZtlVNxN3jSG7PD3+CKt77vUbyB//K5bbVqSQQa8dJ5ua0LDE2bN7
 A2gprl4a9Y5zU6Zx0rbf3WB22Mi8RiPG/gZnhKi1/VL2+6gxkTzk46VWeB8x3xs7lAxc
 BFlzANjDARm8aoSD06T25RZc8hkJGDWBFAhEHI68xSyzvycMgpPRqboXkOLW4as7my2t
 NRsQ==
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
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QEplcm5laiDFoGtyYWJlYyBATWF4aW1lIFJpcGFyZAoKVGhhbmtzIGZvciB5b3VyIHRpbWUgYW5k
IHZhbHVhYmxlIHN1Z2dlc3Rpb25zLgoKQ3VycmVudGx5IEkgd291bGQgaGF2ZSB0byBnbyBhd2F5
IGZyb20gbWFpbmxpbmUgS01TIHRvIHNvbHZlIG15CihBbmRyb2lkKSBpc3N1ZXMsIGFuZCBJIGhv
cGUgdG8gZ2V0IGJhY2sgd2hlbiBJCmZpbmQgbWFpbmxpbmUtZnJpZW5kbHkgc29sdXRpb24gZm9y
IGl0LgoKSGF2aW5nIG5vIHByaW1hcnkgbGF5ZXIgb3IgemVyby1idWZmZXIgcHJpbWFyeSBsYXll
ciBhbmQgNCBvdmVybGF5cwpjb3VsZCBiZSBhIHVuaXZlcnNhbCBzb2x1dGlvbiwgYnV0ICBJIGhh
dmUgbm90IHN1ZmZpY2llbnQga25vd2xlZGdlIGluCktNUyB0byBicmluZy11cCB0aGlzIGlkZWEu
CgpPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCA5OjE4IEFNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFRodSwgU2VwIDE5LCAyMDE5IGF0IDEx
OjAzOjI2UE0gKzAzMDAsIFJvbWFuIFN0cmF0aWllbmtvIHdyb3RlOgo+ID4gQWN0dWFsbHksIEkg
YmVsZWl2ZSB0aGlzIGlzIFRydWUgc29sdXRpb24sIGFuZCBjdXJyZW50IG9uZSBpcyB3cm9uZy4g
IExldAo+ID4gbWUgZXhwbGFpbiB3aHkuCj4gPgo+ID4gRGUyLiAwIHdhcyBkZXNpZ25lZCB0byBt
YXRjaCBBbmRyb2lkIGh3Y29tcG9zZXIgaGFsIHJlcXVpcmVtZW50cyBJTU8uCj4gPiBZb3UgY2Fu
IGVhc2lseSBhZ3JlZSB3aXRoIHRoaXMgY29uY2x1c2lvbiBieSBjb21wYXJpbmcgQ29tcG9zZXIg
SEFMIGFuZAo+ID4gRGUyLiAwIGhhcmR3YXJlIG1hbnVhbHMuCj4gPgo+ID4gSSBmYWNlZCBhdCBs
ZWFzdCA0IGlzc3VlcyB3aGVuIHRyeSB0byBydW4gQW5kcm9pZCB1c2luZyB0aGUgbWFpbmxpbmUg
a2VybmVsCj4gPiBzdW44aSBtaXhlciBpbXBsZW1lbnRhdGlvbi4gQ3VycmVudCBvbmUsIG1pc3Np
bmcgcGl4ZWwgZm9ybWF0cyAobXkgcHJldmlvdXMKPiA+IHBhdGNoKSwgbWlzc2luZyBwbGFuZSBh
bHBoYSBhbmQgcm90YXRpb24gcHJvcGVydGllcy4gSSBwbGFuIHRvIGZpeCBpdCBhbmQKPiA+IGFs
c28gc2VuZCBhcHByb3ByaWF0ZSBzb2x1dGlvbiB0byB0aGUgdXBzdHJlYW0uCj4gPgo+ID4gVG8g
YWNoaWV2ZSBvcHRpbWFsIFVJIHBlcmZvcm1hbmNlIEFuZHJvaWQgcmVxdWlyZXMgYXQgbGVhc3Qg
NCB1aSBsYXllcnMgdG8KPiA+IG1ha2Ugc2NyZWVuIGNvbXBvc2l0aW9uLiBDdXJyZW50IHBhdGNo
IGVuYWJsZXMgNHRoIHBsYW5lIHVzYWJsZS4KPgo+IE5vdGUgdGhhdCB5b3UgY2FuIGFsc28gZ2V0
IDQgVUkgcGxhbmVzIGJ5IGVuYWJsaW5nIG1vcmUgdGhhbiBvbmUgVUkKPiBsYXllciBwZXIgY2hh
bm5lbC4gWW91IHdvdWxkbid0IGJlIGFibGUgdG8gdXNlIGFscGhhIGJldHdlZW4gZWFjaAo+IHBs
YW5lIG9mIGEgZ2l2ZW4gY2hhbm5lbCwgYnV0IHdlIGNhbiB1c2UgYSBzaW1pbGFyIHRyaWNrIHRo
YW4gd2hhdCB3ZQo+IGRpZCBmb3IgdGhlIHBpcGVzIGluIHRoZSBzdW40aSBiYWNrZW5kLgo+Cj4g
TWF4aW1lCgoKCi0tIApCZXN0IHJlZ2FyZHMsClJvbWFuIFN0cmF0aWllbmtvCkdsb2JhbCBMb2dp
YyBJbmMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
