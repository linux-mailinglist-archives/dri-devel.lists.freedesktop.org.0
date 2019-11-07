Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED1F41CC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341396F886;
	Fri,  8 Nov 2019 08:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC3F6F781
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 18:22:49 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c13so3096215pfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 10:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=L27L6nvKvaj+gPXc0hUn4bbWpeFZdtO6lr7Y2U0Ty4M=;
 b=ZCa6srPcYtoAjA+9N2pGCpcQ9rmJw9fzIJs0a+3pOE5upP5/Jn1jRm0gklHYwF9Nph
 rbsdCkqpdKomb+h7jwiVdUQxc5BiWhC/XBFkHT1bij/fMyUVjVEXmW5DGPAbfLdksMDI
 ZdAZkWb+CuTy8k5KxnV5KRz3zqLrRycCex3J8oR6S9wgdfmC/CwbE+9MSijeMVo4HA+u
 IY3J3oj7HBk/ZfY7hhaoH23nIEVwCnNcQaURZOYqZqa2KVbL2l5le+qIoHW2LyHLCl8e
 JDrs8WtJOEsZ47m2t53EC2+DCFixyvVdhHYc4pXUbiuDYxDPsdcDkQLkHR+6Lmi323gf
 zYLw==
X-Gm-Message-State: APjAAAVbDK/8q2h9Aub9AL8NogBuTDtmCs9MrYjuBCsZLhIN7OXwofSX
 J1+lr90GbmIbjNIrAlB+1o8=
X-Google-Smtp-Source: APXvYqz5WQrxb5VyPVMHdWgZQ8z97ty0BNqyApspbxG5LjM7qj9BgZ/z2h7xzjcYRVuJ/De/poKAug==
X-Received: by 2002:aa7:82cd:: with SMTP id f13mr5896715pfn.69.1573150968760; 
 Thu, 07 Nov 2019 10:22:48 -0800 (PST)
Received: from wambui ([197.237.61.225])
 by smtp.gmail.com with ESMTPSA id e17sm3711816pgg.5.2019.11.07.10.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 10:22:48 -0800 (PST)
Date: Thu, 7 Nov 2019 21:22:35 +0300
From: Wambui Karuga <wambui.karugax@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
Message-ID: <20191107182235.GA3585@wambui>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
 <4c74db2614cefe23f888d0643c2d7c356086745a.camel@perches.com>
 <20191107133851.GF63329@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107133851.GF63329@art_vandelay>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=L27L6nvKvaj+gPXc0hUn4bbWpeFZdtO6lr7Y2U0Ty4M=;
 b=rbUomZKewSy4DXhw/7Z7m3aDjtDHGfsAELPyU27m6jCHbYjFFdiyfTC6mZjX4XjgwO
 secNzkkFwPso2HohuanZpJAlrW2mbDRRAaoXFhhzp5KYENc9r910tqazGZS7+hrBtB7H
 GFS55JgTj2VCW45MbVTWwrTNTVdZq0gcK9dWG45jOVju9al4s+pZc1UTM1jyxj6fn0/k
 PodVmbSh5UnsfSL1g25h3ax/kVBD/BGBoj80X6tkfE6MOrom/b6/FSlpPwUGeD1kyG1h
 pfkkFRvPJSJ/HB6oKRfWpudMsKLPrtBEVaVM3K4k89YH49IJfBD4252Ombv87DBtHJdO
 cNAA==
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
Reply-To: 20191107133851.GF63329@art_vandelay
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 joe@perches.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6Mzg6NTFBTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDAxOjU0OjIyQU0gLTA4MDAsIEpvZSBQZXJjaGVz
IHdyb3RlOgo+ID4gT24gVGh1LCAyMDE5LTExLTA3IGF0IDEyOjI5ICswMzAwLCBXYW1idWkgS2Fy
dWdhIHdyb3RlOgo+ID4gPiBSZXBsYWNlIHRoZSB1c2Ugb2YgdGhlIGRldl9lcnIgbWFjcm8gd2l0
aCB0aGUgRFJNX0RFVl9FUlJPUgo+ID4gPiBEUk0gaGVscGVyIG1hY3JvLgo+ID4gCj4gPiBUaGUg
Y29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNob3cgdGhlIHJlYXNvbiBfd2h5XyB5b3UgYXJlIGRvaW5n
Cj4gPiB0aGlzIGluc3RlYWQgb2YganVzdCBzdGF0aW5nIHRoYXQgeW91IGFyZSBkb2luZyB0aGlz
Lgo+ID4gCj4gPiBJdCdzIG5vdCB0aGF0IGRldl9lcnIgaXMgdW5jb21tb24gaW4gZHJpdmVycy9n
cHUvZHJtLgo+ID4gCj4gCj4gSXQgaXMgdW5jb21tb24gKHRoaXMgaXMgdGhlIHNvbGUgaW5zdGFu
Y2UpIGluIHJvY2tjaGlwLCBob3dldmVyLiBTbyBpdCBtYWtlcwo+IHNlbnNlIHRvIGNvbnZlcnQg
dGhlIGRldl8qIHByaW50cyBpbiByb2NrY2hpcCB0byBEUk1fREVWIGZvciBjb25zaXN0ZW5jeS4K
PiAKPiBXYW1idWksIGNvdWxkIHlvdSBhbHNvIHBsZWFzZSBjb252ZXJ0IHRoZSBkZXZfd2FybiBp
bnN0YW5jZSBhcyB3ZWxsPwo+IApTdXJlLCBJIGNhbiBzZW5kIGEgcGF0Y2ggZm9yIHRoYXQuCj4g
SSdsbCBhcHBseSB0aGlzIHRvIGRybS1taXNjLW5leHQgYW5kIGV4cGFuZCBvbiB0aGUgY29tbWl0
IG1lc3NhZ2UgYSBiaXQuCj4gClRoYW5rcywKd2FtYnVpCgo+IFRoYW5rcywKPiAKPiBTZWFuCj4g
Cj4gPiAkIGdpdCBncmVwIC13IGRldl9lcnIgZHJpdmVycy9ncHUvZHJtIHwgd2MgLWwKPiA+IDE5
NTAKPiA+ICQgZ2l0IGdyZXAgLXcgRFJNX0RFVl9FUlJPUiBkcml2ZXJzL2dwdS9kcm0gfCB3YyAt
bAo+ID4gNzU2Cj4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1p
cGktZHNpLXJvY2tjaGlwLmMKPiA+IFtdCj4gPiA+IEBAIC05MTYsNyArOTE2LDcgQEAgc3RhdGlj
IGludCBkd19taXBpX2RzaV9yb2NrY2hpcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiAgCWlmICghZHNpLT5jZGF0YSkgewo+ID4gPiAt
CQlkZXZfZXJyKGRldiwgIm5vIGRzaS1jb25maWcgZm9yICVzIG5vZGVcbiIsIG5wLT5uYW1lKTsK
PiA+ID4gKwkJRFJNX0RFVl9FUlJPUihkZXYsICJubyBkc2ktY29uZmlnIGZvciAlcyBub2RlXG4i
LCBucC0+bmFtZSk7Cj4gPiA+ICAJCXJldHVybiAtRUlOVkFMOwo+ID4gPiAgCX0KPiA+IAo+ID4g
Cj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo+IAo+IC0tIAo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2ds
ZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
