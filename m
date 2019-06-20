Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905D4DD28
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 00:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC256E7E6;
	Thu, 20 Jun 2019 22:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387A96E7E6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 22:01:32 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE5642089C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 22:01:31 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id b18so3012707qkc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 15:01:31 -0700 (PDT)
X-Gm-Message-State: APjAAAVsRboI+hkY2ibzbJe8cVdQMar5VNG+miNvVtVqnLz3mdCcCTCt
 IPOWxY9uAZmz/wXVKfOZcv0qlzv3H1olXH8rpQ==
X-Google-Smtp-Source: APXvYqxqswdc7BYIsSMkGt5yP29+KcMyoMC1aGIIaXPNTqblUxRNrTBW56OaKRe6HWPw4iAja6Qj6vVGBKu/Kf9NMWc=
X-Received: by 2002:a37:69c5:: with SMTP id
 e188mr108358787qkc.119.1561068091034; 
 Thu, 20 Jun 2019 15:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190619215156.27795-1-robh@kernel.org>
 <20190620090122.GB26689@ulmo>
 <CAL_JsqKC-RDjdMQWM6yk_HiWu-WwuU+vUf946t=TDJAxnqMW7Q@mail.gmail.com>
In-Reply-To: <CAL_JsqKC-RDjdMQWM6yk_HiWu-WwuU+vUf946t=TDJAxnqMW7Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Jun 2019 16:01:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+LME4N4aoUsw946hBGO4y8Q8yBVa2coeSZMr1Ns_XrSg@mail.gmail.com>
Message-ID: <CAL_Jsq+LME4N4aoUsw946hBGO4y8Q8yBVa2coeSZMr1Ns_XrSg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: display: Convert common panel
 bindings to DT schema
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561068091;
 bh=JbuElVbN3Z0lxncKmpOc3j7BcuU4pLJzsm2POWaHbOo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r2ObBBEXMMVIpWzdPcHq+HCuoYoELbl52kWYsuBEcO/MYhbWgIFzfhhIzWmTqg1b7
 u5NNWy2Sd4oq+dXI5MtYmQZ/C+MGQPQebzG9cwK/J3QlPTADjs19n197i/aAu0DUsr
 gnAavpclHADBh73WeYugpvdNKIZXIELjHNx0vldc=
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgODo1MiBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDM6MDEgQU0gVGhpZXJyeSBS
ZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBK
dW4gMTksIDIwMTkgYXQgMDM6NTE6NTNQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+
IENvbnZlcnQgdGhlIGNvbW1vbiBwYW5lbCBiaW5kaW5ncyB0byBEVCBzY2hlbWEgY29uc29saWRh
dGluZyBzY2F0dGVyZWQKPiA+ID4gZGVmaW5pdGlvbnMgdG8gYSBzaW5nbGUgc2NoZW1hIGZpbGUu
Cj4gPiA+Cj4gPiA+IFRoZSAnc2ltcGxlLXBhbmVsJyBiaW5kaW5nIGp1c3QgYSBjb2xsZWN0aW9u
IG9mIHByb3BlcnRpZXMgYW5kIG5vdCBhCj4gPiA+IGNvbXBsZXRlIGJpbmRpbmcgaXRzZWxmLiBB
bGwgb2YgdGhlICdzaW1wbGUtcGFuZWwnIHByb3BlcnRpZXMgYXJlCj4gPiA+IGNvdmVyZWQgYnkg
dGhlIHBhbmVsLWNvbW1vbi50eHQgYmluZGluZyB3aXRoIHRoZSBleGNlcHRpb24gb2YgdGhlCj4g
PiA+ICduby1ocGQnIHByb3BlcnR5LCBzbyBhZGQgdGhhdCB0byB0aGUgc2NoZW1hLgo+ID4gPgo+
ID4gPiBBcyB0aGVyZSBhcmUgbG90cyBvZiByZWZlcmVuY2VzIHRvIHNpbXBsZS1wYW5lbC50eHQs
IGp1c3Qga2VlcCB0aGUgZmlsZQo+ID4gPiB3aXRoIGEgcmVmZXJlbmNlIHRvIHBhbmVsLWNvbW1v
bi55YW1sIGZvciBub3cgdW50aWwgYWxsIHRoZSBiaW5kaW5ncyBhcmUKPiA+ID4gY29udmVydGVk
Lgo+ID4gPgo+ID4gPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNv
bT4KPiA+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gQ2M6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiA+IENjOiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiA+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiBOb3RlIHRoZXJlJ3Mgc3Rp
bGwgc29tZSByZWZlcmVuY2VzIHRvIHBhbmVsLWNvbW1vbi50eHQgdGhhdCBJIG5lZWQgdG8KPiA+
ID4gdXBkYXRlIG9yIGp1c3QgZ28gYWhlYWQgYW5kIGNvbnZlcnQgdG8gc2NoZW1hLgo+ID4gPgo+
ID4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnR4dCAgIHwgMTAx
IC0tLS0tLS0tLS0tLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNv
bW1vbi55YW1sICB8IDE0MyArKysrKysrKysrKysrKysrKysKPiA+ID4gIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BhbmVsLnR4dCAgICAgICAgICB8ICAgNCAtCj4gPiA+ICAuLi4vYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9zaW1wbGUtcGFuZWwudHh0ICAgfCAgMjkgKy0tLQo+ID4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCAxNDQgaW5zZXJ0aW9ucygrKSwgMTMzIGRlbGV0aW9ucygtKQo+ID4gPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3BhbmVsLWNvbW1vbi50eHQKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21tb24u
eWFtbAo+ID4KPiA+IEkga25vdyBpdCB3YXMgdGhpcyB3YXkgYmVmb3JlLCBidXQgcGVyaGFwcyBy
ZW1vdmUgdGhlIHJlZHVuZGFudCBwYW5lbC0KPiA+IHByZWZpeCB3aGlsZSBhdCBpdD8KPgo+IFN1
cmUuCgpPbiAybmQgdGhvdWdodCwgSSBwcmVmZXIgaXQgYXMtaXMuIFRoZSByZWFzb24gYmVpbmcg
dGhlIHNjaGVtYQppbmNsdWRpbmcgdGhpcyBmaWxlIGFyZSBtb3JlIHJlYWRhYmxlIHdpdGg6Cgph
bGxPZjoKICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwoKQ29tcGFyZWQgdG8gb25lIG9mOgoK
JHJlZjogY29tbW9uLnlhbWwjCiRyZWY6IC9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvY29tbW9uLnlh
bWwjCgpJIHN1cHBvc2Ugd2UgY291bGQgYXV0b21hZ2ljYWxseSBpbmNsdWRlIGEgJ2NvbW1vbi55
YW1sJyBmaWxlIGlmCmV4aXN0aW5nIGluIHRoZSBzYW1lIGRpcmVjdG9yeS4gVGhhdCdzIGEgYmln
Z2VyIGNoYW5nZSB0aG91Z2guLi4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
