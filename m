Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7D114368
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 16:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7306E13B;
	Thu,  5 Dec 2019 15:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9086E13B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 15:19:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 946C42E5;
 Thu,  5 Dec 2019 16:19:20 +0100 (CET)
Date: Thu, 5 Dec 2019 17:19:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 4/4] arm64: dts: zynqmp: zcu106-revA: Wire up the
 DisplayPort subsystem
Message-ID: <20191205151912.GP4734@pendragon.ideasonboard.com>
References: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
 <20191108175935.29766-5-laurent.pinchart@ideasonboard.com>
 <11a7c38f-8fe4-09f9-3202-d976edef6843@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11a7c38f-8fe4-09f9-3202-d976edef6843@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575559161;
 bh=YTmsTII5DKzAGvnWYl+/6aH4mqOszFNtXZM8wFQWpeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bs5DJVAmakVLbWya4Si2S5pGcq9R+5RVlqWQKZeMN/LqxyPhbX9CjCaELdHFvq5z0
 ogasslhfg8JNPaEcC6DMvFUytH6YSve2iAkFJc6ZOoqgbLc+7FqfpV9dCXDoNBoxBg
 HqqNX4+RDcUpN1XF9le5WjokPmmdVm9wSehhr0Fc=
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, dri-devel@lists.freedesktop.org,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGFsLAoKT24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDk6MzA6MTBBTSArMDEwMCwgTWlj
aGFsIFNpbWVrIHdyb3RlOgo+IE9uIDA4LiAxMS4gMTkgMTg6NTksIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBFbmFibGUgdGhlIGRwc3ViIGRldmljZSBhbmQgd2lyZSBpdCB1cCB0byB0aGUg
UFMtR1RSIFBIWSBsYW5lcyByb3V0ZWQgdG8KPiA+IHRoZSBEaXNwbGF5UG9ydCBjb25uZWN0b3Iu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9hcm02NC9ib290L2R0cy94aWxp
bngvenlucW1wLXpjdTEwNi1yZXZBLmR0cyB8IDE2ICsrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMDYtcmV2QS5kdHMKPiA+IGluZGV4IDkzY2U3ZWI4
MTQ5OC4uNDY1NmYyNWI2YjA0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy94
aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0cwo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0cwo+ID4gQEAgLTEzLDYgKzEzLDcgQEAKPiA+
ICAjaW5jbHVkZSAienlucW1wLWNsay5kdHNpIgo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9p
bnB1dC9pbnB1dC5oPgo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPiA+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3BoeS5oPgo+ID4gIAo+ID4gIC8gewo+ID4gIAlt
b2RlbCA9ICJaeW5xTVAgWkNVMTA2IFJldkEiOwo+ID4gQEAgLTY5LDYgKzcwLDE3IEBACj4gPiAg
CXN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4gIAo+ID4gKyZkcGRtYSB7Cj4gPiArCXN0YXR1
cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gKwo+ID4gKyZkcHN1YiB7Cj4gPiArCXN0YXR1cyA9ICJv
a2F5IjsKPiA+ICsJcGh5LW5hbWVzID0gImRwLXBoeTAiLCAiZHAtcGh5MSI7Cj4gPiArCXBoeXMg
PSA8JmxhbmUxIFBIWV9UWVBFX0RQIDAgMyAyNzAwMDAwMD4sCj4gPiArCSAgICAgICA8JmxhbmUw
IFBIWV9UWVBFX0RQIDEgMyAyNzAwMDAwMD47Cj4gCj4gSXQgaXMgYWxpZ25lZCB3aXRoIHN0dWZm
IGluIFhpbGlueCB0cmVlLgo+IEkgdGhpbmsgdGhhdCBwdXR0aW5nIGFueSBjbG9jayB2YWx1ZSBo
ZXJlIGlzIHdyb25nLgo+IEl0IHNob3VsZCByZWFsbHkgYmUgcG9pbnRpbmcgdG8gJmNsayB3aGF0
ZXZlciBpdCBpcy4KPiBUaGVuIHlvdSBjYW4gc3VwcG9ydCBtb3JlIGNhc2VzIHdoZXJlIGNsb2Nr
IGRvZXNuJ3QgbmVlZCB0byBiZSBmaXhlZCBhbmQKPiBpdCBpcyBhbHNvIGFsaWduZWQgd2l0aCBj
bG9jayBiaW5kaW5nLgoKT0ssIEknbGwgY2hlY2sgdGhhdCB3aGVuIHdvcmtpbmcgb24gdGhlIFBI
WSBkcml2ZXIuCgo+ID4gK307Cj4gPiArCj4gPiAgLyogZnBkX2RtYSBjbGsgNjY3TUh6LCBscGRf
ZG1hIDUwME1IeiAqLwo+ID4gICZmcGRfZG1hX2NoYW4xIHsKPiA+ICAJc3RhdHVzID0gIm9rYXki
Owo+ID4gQEAgLTUwMyw2ICs1MTUsMTAgQEAKPiA+ICAJbm8tMS04LXY7Cj4gPiAgfTsKPiA+ICAK
PiA+ICsmc2VyZGVzIHsKPiA+ICsJc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiArCj4gPiAg
JnVhcnQwIHsKPiA+ICAJc3RhdHVzID0gIm9rYXkiOwo+ID4gIH07CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
