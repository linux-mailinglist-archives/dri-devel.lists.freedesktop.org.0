Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4218908
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 13:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5F889B70;
	Thu,  9 May 2019 11:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDC489B70
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 11:30:00 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id c13so1990980qtn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 04:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fefsIyQlS+PE1KzrJIi4KuRCpKpBYyPVtYH4pxbYOj8=;
 b=Qvlyxd1wZZ4hnuRjOBKbOsDT3n3EdbKelBFXOHEwxxGBp98Hk0sZbZCjDVrV4ABmW7
 viTkt7eDx1oLpsTMOQuW8xk/hbPTliI78ByeZdjB43QEMDcwjpT7Inb8O8sffIyVqg6C
 /wHPFYlfE2o6OVyTpDzCkHfGXhlsIlSs9seRTL96Hj2i5t60AuHF41b445UdP63mnIc4
 HVUjsvY13g9S+PxPHQZDrhxOYgd5ZnYNxqWh8SumLZsdBy5OHeXmUbxyDEPnavQkNRTy
 +V5Q7C7CMA89Um+sQ9Hzy7ReYp/TyelfPdB6FeHFywW16fz6PWt8lqZfm5ckziq8I9/8
 CYOA==
X-Gm-Message-State: APjAAAWOjz5WBJ5B/08fUyi0/K2XTA8ekqP4gU4DI8c1+Y2r/WAIsNx/
 x8ngJyZs2ISPbB8DQBaIAPgSG83kcF60UP7hon6Rig==
X-Google-Smtp-Source: APXvYqxhavDoDtncVVFpIMi2Xg5cRbGsIlttaMiV4M0Hm30viC0bzcfLCkHLvFoeZx0WTa6gNj44afmdX5+0JioEY9c=
X-Received: by 2002:a0c:b99c:: with SMTP id v28mr3054612qvf.10.1557401399660; 
 Thu, 09 May 2019 04:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190423092810.28359-1-jian-hong@endlessm.com>
 <155613593248.25205.769591454199358982@skylake-alporthouse-com>
 <15be67b19d898ab74c9ae6d9d9080ef339772e00.camel@intel.com>
In-Reply-To: <15be67b19d898ab74c9ae6d9d9080ef339772e00.camel@intel.com>
From: Daniel Drake <drake@endlessm.com>
Date: Thu, 9 May 2019 19:29:48 +0800
Message-ID: <CAD8Lp462rLGnnTLCSOoMWwU37bxCk1cznsw8==Z8AgumeqHXkQ@mail.gmail.com>
Subject: Re: [PATCH] i915: disable framebuffer compression on GeminiLake
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fefsIyQlS+PE1KzrJIi4KuRCpKpBYyPVtYH4pxbYOj8=;
 b=wALPIkKCc39G4Zkl7NKUawBtHAYQtGjWHx1k3+tbvjSXA+91dfV+Kb0+1XFKKIZQg8
 2mAwkEAwNFB9ULY2ivgN16hqSC7KnZGaKNzKqacIJUnIhoORA/DDdAXTfbhVunnqRn5M
 kE1uoGOtMfFzDL567wwUzzZwReiOXGgAiZEisDP/J2TL5h4gTTGAf+EBM9nnYD40zeQB
 RXtkmbg71Wmzw/qR1biIpmb+dqiCeyc67hV+npuKSANz1Js0YRkJu9WMy7/zXKbmNoeD
 nDqX2IL/d+R4aGjbeioBqzoNjvCJxptaEQgjh3+Vviz0B8/ibfncRts1g5+RCABe3r9j
 d9ew==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoKT24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNDoyNyBBTSBQYXVsbyBaYW5vbmkgPHBhdWxv
LnIuemFub25pQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBFbSBxdWEsIDIwMTktMDQtMjQgw6BzIDIw
OjU4ICswMTAwLCBDaHJpcyBXaWxzb24gZXNjcmV2ZXU6Cj4gPiBRdW90aW5nIEppYW4tSG9uZyBQ
YW4gKDIwMTktMDQtMjMgMTA6Mjg6MTApCj4gPiA+IEZyb206IERhbmllbCBEcmFrZSA8ZHJha2VA
ZW5kbGVzc20uY29tPgo+ID4gPgo+ID4gPiBPbiBtYW55IChhbGw/KSB0aGUgR2VtaW5pIExha2Ug
c3lzdGVtcyB3ZSB3b3JrIHdpdGgsIHRoZXJlIGlzIGZyZXF1ZW50Cj4gPiA+IG1vbWVudGFyeSBn
cmFwaGljYWwgY29ycnVwdGlvbiBhdCB0aGUgdG9wIG9mIHRoZSBzY3JlZW4sIGFuZCBpdCBzZWVt
cwo+ID4gPiB0aGF0IGRpc2FibGluZyBmcmFtZWJ1ZmZlciBjb21wcmVzc2lvbiBjYW4gYXZvaWQg
dGhpcy4KPiA+ID4KPiA+ID4gVGhlIHRpY2tldCB3YXMgcmVwb3J0ZWQgNiBtb250aHMgYWdvIGFu
ZCBoYXMgYWxyZWFkeSBhZmZlY3RlZCBhCj4gPiA+IG11bHRpdHVkZSBvZiB1c2Vycywgd2l0aG91
dCBhbnkgcmVhbCBwcm9ncmVzcyBiZWluZyBtYWRlLiBTbywgbGV0cwo+ID4gPiBkaXNhYmxlIGZy
YW1lYnVmZmVyIGNvbXByZXNzaW9uIG9uIEdlbWluaUxha2UgdW50aWwgYSBzb2x1dGlvbiBpcyBm
b3VuZC4KPiA+ID4KPiA+ID4gQnVnbGluazogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTA4MDg1Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBEcmFrZSA8
ZHJha2VAZW5kbGVzc20uY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFuLUhvbmcgUGFuIDxq
aWFuLWhvbmdAZW5kbGVzc20uY29tPgo+ID4KPiA+IEZpeGVzOiBmZDdkNmM1YzhmM2UgKCJkcm0v
aTkxNTogZW5hYmxlIEZCQyBvbiBnZW45KyB0b28iKSA/Cj4gPiBDYzogUGF1bG8gWmFub25pIDxw
YXVsby5yLnphbm9uaUBpbnRlbC5jb20+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tPgo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY0LjExKwo+ID4KPiA+
IGdsayBsYW5kZWQgMSBtb250aCBiZWZvcmUsIHNvIHRoYXQgc2VlbXMgdGhlIGVhcmxpZXN0IGJy
b2tlbiBwb2ludC4KPiA+Cj4KPiBUaGUgYnVnIGlzIHdlbGwgcmVwb3J0ZWQsIHRoZSBidWcgYXV0
aG9yIGlzIGhlbHBmdWwgYW5kIGl0IGV2ZW4gaGFzIGEKPiBkZXNjcmlwdGlvbiBvZiAic3RlcHMg
dG8gcmVwcm9kdWNlIiB0aGF0IGxvb2tzIHZlcnkgZWFzeSAoYWx0aG91Z2ggSQo+IGRpZG4ndCB0
cnkgaXQpLiBFdmVyeXRoaW5nIHN1Z2dlc3RzIHRoaXMgaXMgYSBidWcgdGhlIGRpc3BsYXkgdGVh
bQo+IGNvdWxkIGFjdHVhbGx5IHNvbHZlIHdpdGggbm90LXNvLW1hbnkgaG91cnMgb2YgZGVidWdn
aW5nLgo+Cj4gSW4gdGhlIG1lYW50aW1lLCB1bmJyZWFrIHRoZSBzeXN0ZW1zOgo+IFJldmlld2Vk
LWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4KClF1aWNrIHBpbmcg
aGVyZS4gQW55IGZ1cnRoZXIgY29tbWVudHMgb24gdGhpcyBwYXRjaD8gQ2FuIGl0IGJlIGFwcGxp
ZWQ/CgpUaGFua3MKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
