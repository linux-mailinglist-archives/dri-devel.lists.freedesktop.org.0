Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18D2402D2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262A46E33F;
	Mon, 10 Aug 2020 07:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2470F6EA15
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:30:17 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q75so2504263iod.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y1VmShTbODQxi97p5yhWcFP1i7Rrvf4UqZFjwZm1PaY=;
 b=ePnola2To6a9y/LKrs8HFSLLRCb/floBdKctMto7uvpYO8RdrkLg/FSl5Vfu4LHEdu
 I3ExqMXZYF62qXvIE0+uZYBUhlZO0wpItQ2O8agf32U9MAzg+ZMO0zDeZ+qZvDb4/G9t
 cQZsdnCsGc0G4H1HRkCVAKUQQnfb7EtDeUX7AWevdK7F8k4frzZdZjQRSNEIPV/Bew2/
 O4UIknznTWXhvKWD5+OR9kMFveG9B93bw6c8qwE2I/jkWDJm+vS+s9a6uNfjFiVFwReM
 1SffnIIpPGPz72lkaVxl4R25+aFoMZrarEUB8zAIKWZsrfJb0+jdoq/t9PQG2qOkz0LN
 trMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y1VmShTbODQxi97p5yhWcFP1i7Rrvf4UqZFjwZm1PaY=;
 b=OErh1Llwq/snux5DAZVC52JkzWyFcV5t8oVyZD+7A8Bt9vEvZYXcrUf4nZVfPhqc2m
 916yzEpDxutCgNNZBo2FEUR9Ffg04JFGyi5afT1wMmJvkh2mPmco5OZDVOA7NF5K+cqd
 d+lftIy2xNKX8ytpLFsLZoW8k+vDNoYfW4OnADDazVpH02KMgZnlJD0wytx4tTUdxjBs
 GnER94Z7rbERIAp/BtjdUT6exHGM+CQj2ZLiZLoDUeCZ0mLc34hDk/YPJ4hVxMNgJvP2
 TYZ0opa4K1RUpACkw06EaeurLMKHsf5xKdwPtLDSwe+727oHAkfhnFLxN80Zz5OLirMc
 OoNg==
X-Gm-Message-State: AOAM53091LUEPatQ9mjXL651N9wz+A/HhVpUa9mut+vq18pwR3DfJFFs
 YbdyOnajVxpsQujPreBx9DE2bR1f3GG1aal0bTY=
X-Google-Smtp-Source: ABdhPJzTbhIXdP3RRjHAE9h7pNMqIoCGqK3uc6aBT7K665Vm4u5cTcQqKvNP77DzylHIruEzzmN8w1q5osXjE7cQpSc=
X-Received: by 2002:a05:6638:2109:: with SMTP id
 n9mr5880105jaj.16.1596817816475; 
 Fri, 07 Aug 2020 09:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200710095409.407087-1-peron.clem@gmail.com>
 <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
 <CAJiuCcfezzr7w9=-G6WK0p6YS=6SBAKF8jv=yAOyNFJ59X80qw@mail.gmail.com>
In-Reply-To: <CAJiuCcfezzr7w9=-G6WK0p6YS=6SBAKF8jv=yAOyNFJ59X80qw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 7 Aug 2020 18:30:05 +0200
Message-ID: <CAJiuCceufQko1KWmU0rHSaJiKMKST0L3OADE0O4_7myLtV4Zjg@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] Add regulator devfreq support to Panfrost
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA3IEF1ZyAyMDIwIGF0IDE4OjI4LCBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1A
Z21haWwuY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIEZyaSwgNyBBdWcgMjAyMCBhdCAx
ODoxMywgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJp
LCBKdWwgMTAsIDIwMjAgYXQgMzo1NCBBTSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21h
aWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWUgY2xl
YW5zIGFuZCBhZGRzIHJlZ3VsYXRvciBzdXBwb3J0IHRvIFBhbmZyb3N0IGRldmZyZXEuCj4gPiA+
IFRoaXMgaXMgbW9zdGx5IGJhc2VkIG9uIGNvbW1lbnQgZm9yIHRoZSBmcmVzaGx5IGludHJvZHVj
ZWQgbGltYQo+ID4gPiBkZXZmcmVxLgo+ID4gPgo+ID4gPiBXZSBuZWVkIHRvIGFkZCByZWd1bGF0
b3Igc3VwcG9ydCBiZWNhdXNlIG9uIEFsbHdpbm5lciB0aGUgR1BVIE9QUAo+ID4gPiB0YWJsZSBk
ZWZpbmVzIGJvdGggZnJlcXVlbmNpZXMgYW5kIHZvbHRhZ2VzLgo+ID4gPgo+ID4gPiBGaXJzdCBw
YXRjaGVzIFswMS0wN10gc2hvdWxkIG5vdCBjaGFuZ2UgdGhlIGFjdHVhbCBiZWhhdmlvcgo+ID4g
PiBhbmQgaW50cm9kdWNlIGEgcHJvcGVyIHBhbmZyb3N0X2RldmZyZXEgc3RydWN0Lgo+ID4gPgo+
ID4gPiBSZWdhcmRzLAo+ID4gPiBDbMOpbWVudAo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNlIHY0
Ogo+ID4gPiAgLSBGaXggbWlzc2VkIGEgcGZkZXYgdG8gJnBmZGV2LT5kZXZmcmVxIGR1cmluZyBy
ZWJhc2UKPiA+ID4KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MzoKPiA+ID4gIC0gQ29sbGVjdCBTdGV2
ZW4gUHJpY2UgcmV2aWV3ZWQtYnkgdGFncwo+ID4gPiAgLSBSZWJhc2Ugb24gbmV4dC9tYXN0ZXIg
KG5leHQtMjAyMDA3MDkpCj4gPiA+Cj4gPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiA+ICAtIENv
bGxlY3QgQWx5c3NhIFJvc2VuendlaWcgcmV2aWV3ZWQtYnkgdGFncwo+ID4gPiAgLSBGaXggb3Bw
X3NldF9yZWd1bGF0b3IgYmVmb3JlIGFkZGluZyBvcHBfdGFibGUgKGludHJvZHVjZSBpbiB2MikK
PiA+ID4gIC0gQ2FsbCBlcnJfZmluaSBpbiBjYXNlIG9wcF9hZGRfdGFibGUgZmFpbGVkCj4gPiA+
Cj4gPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiA+ICAtIENvbGxlY3QgU3RldmVuIFByaWNlIHJl
dmlld2VkLWJ5IHRhZ3MKPiA+ID4gIC0gRml4IHNwaW5sb2NrIGNvbW1lbnQKPiA+ID4gIC0gRHJv
cCBPUFAgY2xvY2stbmFtZSBwYXRjaAo+ID4gPiAgLSBEcm9wIGRldmljZV9wcm9wZXJ0eV90ZXN0
IHBhdGNoCj4gPiA+ICAtIEFkZCByZW5hbWUgZXJyb3IgbGFiZWxzIHBhdGNoCj4gPiA+Cj4gPiA+
IENsw6ltZW50IFDDqXJvbiAoMTQpOgo+ID4gPiAgIGRybS9wYW5mcm9zdDogYXZvaWQgc3RhdGlj
IGRlY2xhcmF0aW9uCj4gPiA+ICAgZHJtL3BhbmZyb3N0OiBjbGVhbiBoZWFkZXJzIGluIGRldmZy
ZXEKPiA+ID4gICBkcm0vcGFuZnJvc3Q6IGRvbid0IHVzZSBwZmRldmZyZXEuYnVzeV9jb3VudCB0
byBrbm93IGlmIGh3IGlzIGlkbGUKPiA+ID4gICBkcm0vcGFuZnJvc3Q6IGludHJvZHVjZSBwYW5m
cm9zdF9kZXZmcmVxIHN0cnVjdAo+ID4gPiAgIGRybS9wYW5mcm9zdDogdXNlIHNwaW5sb2NrIGlu
c3RlYWQgb2YgYXRvbWljCj4gPiA+ICAgZHJtL3BhbmZyb3N0OiBwcm9wZXJseSBoYW5kbGUgZXJy
b3IgaW4gcHJvYmUKPiA+ID4gICBkcm0vcGFuZnJvc3Q6IHJlbmFtZSBlcnJvciBsYWJlbHMgaW4g
ZGV2aWNlX2luaXQKPiA+ID4gICBkcm0vcGFuZnJvc3Q6IG1vdmUgZGV2ZnJlcV9pbml0KCkvZmlu
aSgpIGluIGRldmljZQo+ID4gPiAgIGRybS9wYW5mcm9zdDogZHluYW1pY2FsbHkgYWxsb2MgcmVn
dWxhdG9ycwo+ID4gPiAgIGRybS9wYW5mcm9zdDogYWRkIHJlZ3VsYXRvcnMgdG8gZGV2ZnJlcQo+
ID4gPiAgIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBkZXZmcmVxIGNvb2xpbmcgZGV2aWNlCj4g
PiA+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBoNjogQWRkIGNvb2xpbmcgbWFwIGZvciBHUFUK
PiA+ID4gICBbRE8gTk9UIE1FUkdFXSBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGg2OiBBZGQgR1BV
IE9QUCB0YWJsZQo+ID4gPiAgIFtETyBOT1QgTUVSR0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjog
Zm9yY2UgR1BVIHJlZ3VsYXRvciB0byBiZSBhbHdheXMKPiA+Cj4gPiBQYXRjaGVzIDEtMTAgYXBw
bGllZCB0byBkcm0tbWlzYy4KPgo+IFRoaXMgc2VyaWUgaGFzIGJlZW4gc3VwZXJzZWRlZCBieSB2
NS4KPgo+IENvdWxkIHlvdSBhcHBseSB0aGUgdjUgaW5zdGVhZC4KCk91cHMgZm9yZ2V0IG15IGVt
YWlsCgpJIGdvdCBhbiBpc3N1ZSB3aXRoIG15IGdtYWlsLi4uCgpUaGFua3MKCj4KPiBUaGFua3MK
PiBDbMOpbWVudAo+Cj4gPgo+ID4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
