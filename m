Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF3FC1DD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85B06E4F4;
	Thu, 14 Nov 2019 08:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frontdoor.pr.hu (frontdoor.pr.hu
 [IPv6:2a02:808:1:101:250:56ff:fe8e:136b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17BB6E4C5;
 Thu, 14 Nov 2019 08:50:29 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
 by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iVApe-0007VV-2p; Thu, 14 Nov 2019 09:50:26 +0100
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
 helo=[192.168.1.2])
 by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iVApZ-0003tz-Tj; Thu, 14 Nov 2019 09:50:24 +0100
Subject: Re: UDL device cannot get its own screen
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
 <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
 <CAKb7Uvh2L0oHMwNss-h1BFXGYeEXOUDLHB9TnaNEm4-oNhjMRw@mail.gmail.com>
 <6af6c1c5-0b99-e034-8a9c-83d4e1171115@pr.hu>
 <d2788b17-3179-ef9d-419a-635e784c6297@pr.hu>
 <CAKb7UvikHeUOj06oqBYnq2==KJ-CGDyZjHsbtbZtA+3r9jK68A@mail.gmail.com>
 <dc03de55-d6df-5804-675f-48f93dc2dfd9@pr.hu>
 <CAKb7UvjGD7Az_jAh5Qn8LaesjVrxpZk67d79aTZHb3_uZ0BEnA@mail.gmail.com>
 <a03f854f-dd70-cab5-81c1-50b32061dd1f@pr.hu>
Message-ID: <58698b29-cad7-188a-e9d7-1c2b4e2934bb@pr.hu>
Date: Thu, 14 Nov 2019 09:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <a03f854f-dd70-cab5-81c1-50b32061dd1f@pr.hu>
Content-Language: en-US
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 9ed658fa786e460656befe7c94609525
X-Spam-Tracer: backend.mail.pr.hu -1.9 20191114085024Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=pr.hu; 
 s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WrSbJE7jiQ20aEB+s3wd3x2FlYl8kN5V/p5nyjsD3Mk=; b=mb/miM+feIvObcygJUObZaEpnd
 yf8mg5JnVtWsw+8Mv254+Kvj/q8DG1md1eYteLnSXBgcoDZPbORqo25cS0FOg8eXSTU35a3VPn65Q
 jaeVZ6Z35iCRETbL/PKjvclqVGuKC5aTTmgp+Io5StgW8VVn2c43dazT/qg2q3TonmasEhuI/4rQB
 nhFbuwQ4ooyQ8PUHLSahsvPYiKLSm/50zx+xKWvG5yMdznUuYMJwyFnOZVg1uMGAtzJUTPXsBGcpl
 BU1hW4uoA9q1t+jgBRYHAs0mI8s42isknwQHEf87FqwRlMHYgalmoSL9NsYTRts7Y47m6lJwhLoMl
 2M5yQOAw==;
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOS4gMTEuIDEzLiAxOTowOCBrZWx0ZXrDqXNzZWwsIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4g
w61ydGE6Cj4gMjAxOS4gMTEuIDEzLiAxODoyNSBrZWx0ZXrDqXNzZWwsIElsaWEgTWlya2luIMOt
cnRhOgo+Pgo+PiBIYXZlIHlvdSBsb29rZWQgYXQgc2V0dGluZyBBdXRvQWRkR1BVIHRvIGZhbHNl
PyBBdXRvQmluZEdQVSBpcyB0b28KPj4gbGF0ZSAtLSB0aGF0J3Mgd2hlbiB5b3UgYWxyZWFkeSBo
YXZlIGEgR1BVLCB3aGV0aGVyIHRvIGJpbmQgaXQgdG8gdGhlCj4+IHByaW1hcnkgZGV2aWNlICgv
c2NyZWVuL3doYXRldmVyKS4gWW91IG5lZWQgdG8gbm90IGhhdmUgYSBHUFUgaW4gdGhlCj4+IGZp
cnN0IHBsYWNlLgo+IAo+IFllcywgSSB0cmllZCBBdXRvQWRkR1BVPWZhbHNlLiBUaGVuIHRoZSBV
REwgZGV2aWNlIHdhcyBub3Qgc2V0IHVwIGF0IGFsbC4KPiAKPiBXaGF0IEkgbm90aWNlZCBpbiBk
ZWJ1Z2dpbmcgWG9yZyB2aWEgR0RCIGlzIHRoYXQgdGhlIFVETCBkZXZpY2Ugd2FzCj4gbWF0Y2hl
ZCB0byB0aGUgd3JvbmcgcGxhdGZvcm0gZGV2aWNlIGluIHhmODZwbGF0Zm9ybVByb2JlRGV2Lgo+
IFtsb25nIGRldGFpbHMgZGVsZXRlZF0KCk5vdyB0aGUgeHNlcnZlciBNUiBpcyBhdCBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdlX3JlcXVlc3RzLzMzNQp3
aXRoIGV4cGxhaW5pbmcgdGhlIHNhbWUgYXMgSSB3cm90ZSBpbiB0aGUgcHJldmlvdXMgbWFpbCBp
biB0aGUgY29tbWl0IG1lc3NhZ2UuCgpJIGhhdmUgYWxzbyBjcmVhdGVkIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvbWVyZ2VfcmVxdWVzdHMvMzM2CnRvIGZpeCB0
aGUgc2FtZSBpc3N1ZSB3aGVuIHVzaW5nIEJ1c0lEIGZvciB0aGUgVURMIGRldmljZS4KCkJlc3Qg
cmVnYXJkcywKWm9sdMOhbiBCw7ZzesO2cm3DqW55aQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
