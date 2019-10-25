Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5437DE6E19
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCA76E49C;
	Mon, 28 Oct 2019 08:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F86EA74;
 Fri, 25 Oct 2019 14:48:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w18so2672789wrt.3;
 Fri, 25 Oct 2019 07:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bIQBfe8sGIHTcc6sIk8ML0XGqqJRWtOG/huxYjSxgWs=;
 b=ffHPVLqe6JUGeVbpk5yBl1Jq4tSOyieB3MXWvEZv9H9RTqD/DlZKyqWynGC7cc7mgS
 mlssxrIoJlaZmojXM32uDPFtVRPrY1BPBPl+xSKZ3PIOtcEJf8+RwPArwAqd2VOy8Ekl
 g1gjLCCBGivFOI7OGSLqIz+lfz4/Hj79+zD3LhTfI7ZPLLNsC9gp/+gk7J9TPku8Sf24
 CywhslnVXhUqa9u/Ouq9wglJcfJTAFpGvIN4K2CygxkSsKiUAd2lO696Jv2EKvjcCtJw
 HTRmtmvLKQzptkzHSmyxIGL5ZrHy2Uz3wB+Xu6MlJejupmMHMEqfCldl9xmW4RuFZMSD
 IObw==
X-Gm-Message-State: APjAAAUleKropBiNBPMGFOBjY6Yp0b74KXkkTNWxk4MgNmoCsNqJE+5q
 zH94v2n+Sy2hRjrJ+puxUME=
X-Google-Smtp-Source: APXvYqxsX3C8tseMrdTDPvXw+m20Jy/sW7m38w3vpts8ZabQ38lGcQ4VQLB8VI+iJPUaxLQS52CZqA==
X-Received: by 2002:a5d:4847:: with SMTP id n7mr3349140wrs.398.1572014885771; 
 Fri, 25 Oct 2019 07:48:05 -0700 (PDT)
Received: from mail.google.com ([104.238.174.53])
 by smtp.gmail.com with ESMTPSA id 26sm2126489wmf.20.2019.10.25.07.48.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Oct 2019 07:48:05 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:48:03 +0000
From: Changbin Du <changbin.du@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] kernel-doc: rename the kernel-doc directive
 'functions' to 'identifiers'
Message-ID: <20191025144802.uixg2crhw6h7gghq@mail.google.com>
References: <20191020131717.28990-1-changbin.du@gmail.com>
 <20191024121940.1d6a64df@lwn.net> <87woctb9cj.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87woctb9cj.fsf@intel.com>
User-Agent: NeoMutt/20180716-508-7c9a6d
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bIQBfe8sGIHTcc6sIk8ML0XGqqJRWtOG/huxYjSxgWs=;
 b=ReQEnplZs6d9r7FMszuAt1KQpVhgBAK8HrNTFjUqY3S/9APV1+HGvrsZ9waq7e63YU
 qE3MBI4hqWqVJcX+VWmtAW85YKN71otDbfGbheixnIP6tSrWow7JIdFnGpXtiV+mVJW2
 1p2ctbskyMZMfpkAuSXvh/NwSIRIncEVf4MMrb16d505nLujE9HTPHxu4LuAIaDSZ+Jc
 KyD8GrKirgOQpcezDEDjZuvpDgE4yTBKNJS+69u7yUoDohsPtX/u+wyEaGIbvTZHormM
 1LsppGHi80Arm2rQS0fl8o4nF9UjLZIsJPeKNNAtOJQk0Dc1AvH/QKIDvuZYoU6aXOrF
 VoIA==
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
Cc: linux-usb@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-crypto@vger.kernel.org,
 linux-kselftest@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDk6NTc6NDhBTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVGh1LCAyNCBPY3QgMjAxOSwgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5l
dD4gd3JvdGU6Cj4gPiBPbiBTdW4sIDIwIE9jdCAyMDE5IDIxOjE3OjE3ICswODAwCj4gPiBDaGFu
Z2JpbiBEdSA8Y2hhbmdiaW4uZHVAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPj4gVGhlICdmdW5j
dGlvbnMnIGRpcmVjdGl2ZSBpcyBub3Qgb25seSBmb3IgZnVuY3Rpb25zLCBidXQgYWxzbyB3b3Jr
cyBmb3IKPiA+PiBzdHJ1Y3RzL3VuaW9ucy4gU28gdGhlIG5hbWUgaXMgbWlzbGVhZGluZy4gVGhp
cyBwYXRjaCByZW5hbWVzIGl0IHRvCj4gPj4gJ2lkZW50aWZpZXJzJywgd2hpY2ggc3BlY2lmaWMg
dGhlIGZ1bmN0aW9ucy90eXBlcyB0byBiZSBpbmNsdWRlZCBpbgo+ID4+IGRvY3VtZW50YXRpb24u
IFdlIGtlZXAgdGhlIG9sZCBuYW1lIGFzIGFuIGFsaWFzIG9mIHRoZSBuZXcgb25lIGJlZm9yZQo+
ID4+IGFsbCBkb2N1bWVudGF0aW9uIGFyZSB1cGRhdGVkLgo+ID4+IAo+ID4+IFNpZ25lZC1vZmYt
Ynk6IENoYW5nYmluIER1IDxjaGFuZ2Jpbi5kdUBnbWFpbC5jb20+Cj4gPgo+ID4gU28gSSB0aGlu
ayB0aGlzIGlzIGJhc2ljYWxseSBPSywgYnV0IEkgaGF2ZSBvbmUgbW9yZSByZXF1ZXN0Li4uCj4g
Pgo+ID4gWy4uLl0KPiA+Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3BoaW54L2tl
cm5lbGRvYy5weSBiL0RvY3VtZW50YXRpb24vc3BoaW54L2tlcm5lbGRvYy5weQo+ID4+IGluZGV4
IDExNTk0MDVjYjkyMC4uMDY4OWY5YzM3ZjFlIDEwMDY0NAo+ID4+IC0tLSBhL0RvY3VtZW50YXRp
b24vc3BoaW54L2tlcm5lbGRvYy5weQo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vc3BoaW54L2tl
cm5lbGRvYy5weQo+ID4+IEBAIC01OSw5ICs1OSwxMCBAQCBjbGFzcyBLZXJuZWxEb2NEaXJlY3Rp
dmUoRGlyZWN0aXZlKToKPiA+PiAgICAgIG9wdGlvbmFsX2FyZ3VtZW50cyA9IDQKPiA+PiAgICAg
IG9wdGlvbl9zcGVjID0gewo+ID4+ICAgICAgICAgICdkb2MnOiBkaXJlY3RpdmVzLnVuY2hhbmdl
ZF9yZXF1aXJlZCwKPiA+PiAtICAgICAgICAnZnVuY3Rpb25zJzogZGlyZWN0aXZlcy51bmNoYW5n
ZWQsCj4gPj4gICAgICAgICAgJ2V4cG9ydCc6IGRpcmVjdGl2ZXMudW5jaGFuZ2VkLAo+ID4+ICAg
ICAgICAgICdpbnRlcm5hbCc6IGRpcmVjdGl2ZXMudW5jaGFuZ2VkLAo+ID4+ICsgICAgICAgICdp
ZGVudGlmaWVycyc6IGRpcmVjdGl2ZXMudW5jaGFuZ2VkLAo+ID4+ICsgICAgICAgICdmdW5jdGlv
bnMnOiBkaXJlY3RpdmVzLnVuY2hhbmdlZCwgICMgYWxpYXMgb2YgJ2lkZW50aWZpZXJzJwo+ID4+
ICAgICAgfQo+ID4+ICAgICAgaGFzX2NvbnRlbnQgPSBGYWxzZQo+ID4+ICAKPiA+PiBAQCAtNzEs
NiArNzIsNyBAQCBjbGFzcyBLZXJuZWxEb2NEaXJlY3RpdmUoRGlyZWN0aXZlKToKPiA+PiAgCj4g
Pj4gICAgICAgICAgZmlsZW5hbWUgPSBlbnYuY29uZmlnLmtlcm5lbGRvY19zcmN0cmVlICsgJy8n
ICsgc2VsZi5hcmd1bWVudHNbMF0KPiA+PiAgICAgICAgICBleHBvcnRfZmlsZV9wYXR0ZXJucyA9
IFtdCj4gPj4gKyAgICAgICAgaWRlbnRpZmllcnMgPSBOb25lCj4gPj4gIAo+ID4+ICAgICAgICAg
ICMgVGVsbCBzcGhpbnggb2YgdGhlIGRlcGVuZGVuY3kKPiA+PiAgICAgICAgICBlbnYubm90ZV9k
ZXBlbmRlbmN5KG9zLnBhdGguYWJzcGF0aChmaWxlbmFtZSkpCj4gPj4gQEAgLTg2LDE5ICs4OCwy
MiBAQCBjbGFzcyBLZXJuZWxEb2NEaXJlY3RpdmUoRGlyZWN0aXZlKToKPiA+PiAgICAgICAgICAg
ICAgZXhwb3J0X2ZpbGVfcGF0dGVybnMgPSBzdHIoc2VsZi5vcHRpb25zLmdldCgnaW50ZXJuYWwn
KSkuc3BsaXQoKQo+ID4+ICAgICAgICAgIGVsaWYgJ2RvYycgaW4gc2VsZi5vcHRpb25zOgo+ID4+
ICAgICAgICAgICAgICBjbWQgKz0gWyctZnVuY3Rpb24nLCBzdHIoc2VsZi5vcHRpb25zLmdldCgn
ZG9jJykpXQo+ID4+ICsgICAgICAgIGVsaWYgJ2lkZW50aWZpZXJzJyBpbiBzZWxmLm9wdGlvbnM6
Cj4gPj4gKyAgICAgICAgICAgIGlkZW50aWZpZXJzID0gc2VsZi5vcHRpb25zLmdldCgnaWRlbnRp
ZmllcnMnKS5zcGxpdCgpCj4gPj4gICAgICAgICAgZWxpZiAnZnVuY3Rpb25zJyBpbiBzZWxmLm9w
dGlvbnM6Cj4gPj4gLSAgICAgICAgICAgIGZ1bmN0aW9ucyA9IHNlbGYub3B0aW9ucy5nZXQoJ2Z1
bmN0aW9ucycpLnNwbGl0KCkKPiA+PiAtICAgICAgICAgICAgaWYgZnVuY3Rpb25zOgo+ID4+IC0g
ICAgICAgICAgICAgICAgZm9yIGYgaW4gZnVuY3Rpb25zOgo+ID4+IC0gICAgICAgICAgICAgICAg
ICAgIGNtZCArPSBbJy1mdW5jdGlvbicsIGZdCj4gPj4gLSAgICAgICAgICAgIGVsc2U6Cj4gPj4g
LSAgICAgICAgICAgICAgICBjbWQgKz0gWyctbm8tZG9jLXNlY3Rpb25zJ10KPiA+PiArICAgICAg
ICAgICAgaWRlbnRpZmllcnMgPSBzZWxmLm9wdGlvbnMuZ2V0KCdmdW5jdGlvbnMnKS5zcGxpdCgp
Cj4gPgo+ID4gUmF0aGVyIHRoYW4gZG8gdGhpcywgY2FuIHlvdSBqdXN0IGNoYW5nZSB0aGUgZWxp
ZiBsaW5lIHRvIHJlYWQ6Cj4gPgo+ID4gICAgIGVsaWYgKCdpZGVudGlmaWVycycgaW4gc2VsZi5v
cHRpb25zKSBvciAoJ2Z1bmN0aW9ucycgaW4gc2VsZi5vcHRpb25zKToKPiA+Cj4gPiAuLi50aGVu
IGxlYXZlIHRoZSByZXN0IG9mIHRoZSBjb2RlIGludGFjdD8gIEl0IGtlZXBzIHRoZSBsb2dpYyB0
b2dldGhlciwKPiA+IGFuZCBhdm9pZHMgdGhlIGNvbmZ1c2luZyBkaXN0aW5jdGlvbiBiZXR3ZWVu
IGlkZW50aWZpZXJzPT0nJyBhbmQKPiA+IGlkZW50aWZpZXJzPT1Ob25lIC4KPiAKPiBJIHRoaW5r
IHRoZSBwcm9ibGVtIGlzIHlvdSBzdGlsbCBuZWVkIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhl
IHR3byBmb3IKPiB0aGUgZ2V0KCdmdW5jdGlvbnMnKSBwYXJ0Lgo+IAo+IE9uZSBvcHRpb24gaXMg
dG8gcmVuYW1lICdmdW5jdGlvbnMnIHRvICdpZGVudGlmaWVycycgaW4gdGhlIGFib3ZlIGJsb2Nr
LAo+IGFuZCBwdXQgc29tZXRoaW5nIGxpa2UgdGhpcyBhYm92ZSB0aGUgd2hvbGUgaWYgbGFkZGVy
ICh1bnRlc3RlZCk6Cj4gCj4gICAgICAgICAjIGJhY2t3YXJkIGNvbXBhdAo+ICAgICAgICAgaWYg
J2Z1bmN0aW9ucycgaW4gc2VsZi5vcHRpb25zOgo+ICAgICAgICAgICAgIGlmICdpZGVudGlmaWVy
cycgaW4gc2VsZi5vcHRpb25zOgo+ICAgICAgICAgICAgICAgICBrZXJuZWxsb2cud2FybihlbnYu
YXBwLCAiZmFpbCIpClRoaXMgd2lsbCBtaXNzIHRoZSBjb250ZW50IG9mICdmdW5jdGlvbnMnIGRp
cmVjdGl2ZSBpZiBib3RoIGV4aXN0IGluCnNhbWUgZG9jLgoKPiAgICAgICAgICAgICBlbHNlOgo+
ICAgICAgICAgICAgICAgICBzZWxmLm9wdGlvbnMuc2V0KCdpZGVudGlmaWVycycsIHNlbGYub3B0
aW9ucy5nZXQoJ2Z1bmN0aW9ucycpKQo+IAo+IEJSLAo+IEphbmkuCj4KQWZ0ZXIgY29tcGFyaW5n
LCBJIHN0aWxsIHBlcmZlciBteSBvcmlnaW5hbCBjb2RlIHdoaWNoIGlzIHNpbXBsZXIuIDopCgo+
IAo+IC0tIAo+IEphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIK
Ci0tIApDaGVlcnMsCkNoYW5nYmluIER1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
