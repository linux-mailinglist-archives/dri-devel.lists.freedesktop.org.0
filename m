Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A7F8A42
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4734A6EA6C;
	Tue, 12 Nov 2019 08:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B496EA4A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:49:06 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 3so11999340pfb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 16:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SHfnAOauvxH+QL+M+wn9JpGV7bZ6YLTyV5/QqLFO508=;
 b=QQXzHH3t8pSpX9whimXfjGSXmChncCzAV5y7V6UX1m5XuaX+/k9UeDfpYbwgsgQnUw
 4+o2rrFsnK2Oty+EZkT5WUJ178YGLcmvkF+7/0Tpl+hjlGbdHJRHxELnw82JcrenpVME
 KZqhDNVBlZnbNKRXY6NaLqEWeC1q7kNFGLthOzoY/8XzjAcE7NXNmLRSwPwzBEKr3dlW
 d/ZvXuTXst10fs81nSxfI+hFy2MhastXFTNZE9DiXprG1yU+nPJpdtrln8R2q4hnzbvX
 WRwWGeJuSYqvmTqdOjA8OMyfAh8LpVd2PkJpVV7iM3lkTPBR7J/Q5HBGRL+hnkXQINiN
 zM/A==
X-Gm-Message-State: APjAAAUXjc5xhSSXaohGdPGvPXbgniBIZ247t1Fe7ZpIs6KTD2s6y033
 g7FaSFD0GK+LRB6fZ3Kxu7F/4Q==
X-Google-Smtp-Source: APXvYqz5TX5mwtEo3ZJSHgMs9ccFOENBQqOOu8UqyWeIhtwLLZ/ZiqWEfYRhTOQY8AW5U9Fi7nROJA==
X-Received: by 2002:a62:1c91:: with SMTP id
 c139mr23723641pfc.175.1573519746088; 
 Mon, 11 Nov 2019 16:49:06 -0800 (PST)
Received: from localhost ([2401:fa00:d:2:4dd6:fffa:d6aa:9572])
 by smtp.gmail.com with ESMTPSA id q41sm596688pja.20.2019.11.11.16.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 16:49:05 -0800 (PST)
Date: Tue, 12 Nov 2019 09:49:02 +0900
From: Sandeep Patil <sspatil@android.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
Message-ID: <20191111062807.GA17144@google.com>
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191104095823.GD10326@phenom.ffwll.local>
 <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
 <20191105094259.GX10326@phenom.ffwll.local>
 <CALAqxLWvNOL=Exybb25GgYQujyJcPNTsFuaBnjLQPKTkVAi6Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLWvNOL=Exybb25GgYQujyJcPNTsFuaBnjLQPKTkVAi6Xw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SHfnAOauvxH+QL+M+wn9JpGV7bZ6YLTyV5/QqLFO508=;
 b=VQdtk6+sVfprM7qZTXqIDkWhg0OjK2FDZJUwAwjlfjciFxsVW+EzV+nHkeNI5IboAn
 +7tK8kfxQrDg62LsReAYo1ywxA9lg8h7VJ2i9mQhAIqVBYC+0oaWQSpAyrOGdgs3kHVh
 d9EyKMqI8wbgrgWR33rBI3gRvJLFYBOAwbkVyHVEBZaT0hn5i8RMxAdujwy9ZcvG/btj
 DEMS11YGsJpX0kbqGW7XXU97zYz6mSATFbrKqVYK0mzeLnuKhygSLZVwurS7uUjHl2p/
 BwFp7y1o70WNvp8LlfOb7K2yuD05pKgpvpRXjsA5RdGnUyhaX+PEFMjQup4tfkeAgGlK
 +nsA==
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
Cc: Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Yue Hu <huyue2@yulong.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDk6NDE6NDRBTSAtMDgwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxOjQzIEFNIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTA6NTc6
NDRBTSAtMDgwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTm92IDQsIDIwMTkg
YXQgMTo1OCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPiA+
IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDExOjQ4OjMyUE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdy
b3RlOgo+ID4gPiBTbyBldmVuIGlmIHRoZSBoZWFwcyBhcmUgY29uZmlndXJlZCB2aWEgRFQgKHdo
aWNoIGF0IHRoZSBtb21lbnQgdGhlcmUKPiA+ID4gaXMgbm8gc3VjaCBiaW5kaW5nLCBzbyB0aGF0
J3Mgbm90IHJlYWxseSBhIHZhbGlkIG1ldGhvZCB5ZXQpLCB0aGVyZSdzCj4gPiA+IHN0aWxsIHRo
ZSBxdWVzdGlvbiBvZiBpZiB0aGUgaGVhcCBpcyBuZWNlc3NhcnkvbWFrZXMgc2Vuc2Ugb24gdGhl
Cj4gPiA+IGRldmljZS4gQW5kIHRoZSBEVCB3b3VsZCBvbmx5IGNvbnRyb2wgdGhlIGF2YWlsYWJp
bGl0eSBvZiB0aGUgaGVhcAo+ID4gPiBpbnRlcmZhY2UsIG5vdCBpZiB0aGUgaGVhcCBkcml2ZXIg
aXMgbG9hZGVkIG9yIG5vdC4KPiA+Cj4gPiBIbSBJIHRob3VnaHQgdGhlIGNtYSByZWdpb25zIGFy
ZSBjb25maWd1cmVkIGluIERUPyBIb3cgZG9lcyB0aGF0IHdvcmsgaWYKPiA+IGl0J3Mgbm90IHVz
aW5nIERUPwo+IAo+IFNvIHllYSwgQ01BIHJlZ2lvbnMgYXJlIGVpdGhlciBjb25maWd1cmVkIGJ5
IERUIG9yIHNldHVwIGF0IGJ1aWxkIHRpbWUKPiAoSSB0aGluayB0aGVyZSdzIGEgY21kbGluZSBv
cHRpb24gdG8gc2V0IGl0IHVwIGFzIHdlbGwpLgo+IAo+IEJ1dCB0aGUgQ01BIHJlZ2lvbnMgYW5k
IHRoZSBkbWFidWYgY21hIGhlYXAgZHJpdmVyIGFyZSBzZXBhcmF0ZQo+IHRoaW5ncy4gVGhlIGxh
dHRlciB1c2VzIHRoZSBmb3JtZXIuCj4gCj4gPiA+IE9uIHRoZSBIaUtleS9IaUtleTk2MCBib2Fy
ZHMsIHdlIGhhdmUgdG8gYWxsb2NhdGUgY29udGlndW91cyBidWZmZXJzCj4gPiA+IGZvciB0aGUg
ZGlzcGxheSBmcmFtZWJ1ZmZlci4gU28gZ3JhbGxvYyB1c2VzIElPTiB0byBhbGxvY2F0ZSBmcm9t
IHRoZQo+ID4gPiBDTUEgaGVhcC4gSG93ZXZlciBvbiB0aGUgZGI4NDVjLCBpdCBoYXMgbm8gc3Vj
aCByZXN0cmljdGlvbnMsIHNvIHRoZQo+ID4gPiBDTUEgaGVhcCBpc24ndCBuZWNlc3NhcnkuCj4g
Pgo+ID4gV2h5IGRvIHlvdSBoYXZlIGEgQ01BIHJlZ2lvbiBmb3IgdGhlIDJuZCBib2FyZCBpZiB5
b3UgZG9uJ3QgbmVlZCBpdD8KPiA+IF9UaGF0XyBzb3VuZHMgbGlrZSBzb21lIHNlcmlvdXMgbWVt
b3J5IHdhc3Rlciwgbm90IGEgZmV3IGxpbmVzIG9mIGNvZGUKPiA+IGxvYWRlZCBmb3Igbm90aGlu
ZyA6LSkKPiAKPiA/Pz8gVGhhdCdzIG5vdCB3aGF0IEkgc2FpZCBhYm92ZS4gIElmIHRoZSBkYjg0
NWMgZG9lc24ndCBuZWVkIENNQSBpdAo+IHdvbid0IGhhdmUgYSBDTUEgcmVnaW9uLgo+IAo+IFRo
ZSBpc3N1ZSBhdCBoYW5kIGlzIHRoYXQgd2UgbWF5IHdhbnQgdG8gYXZvaWQgbG9hZGluZyB0aGUg
ZG1hYnVmIENNQQo+IGhlYXAgZHJpdmVyIG9uIGEgYm9hcmQgdGhhdCBkb2Vzbid0IHVzZSBDTUEu
Cj4gCj4gCj4gPiA+IFdpdGggQW5kcm9pZCdzIEdLSSBlZmZvcnQsIHRoZXJlIG5lZWRzIHRvIGJl
IG9uZSBrZXJuZWwgdGhhdCB3b3JrcyBvbgo+ID4gPiBhbGwgdGhlIGRldmljZXMsIGFuZCB0aGV5
IGFyZSB1c2luZyBtb2R1bGVzIHRvIHRyeSB0byBtaW5pbWl6ZSB0aGUKPiA+ID4gYW1vdW50IG9m
IG1lbW9yeSBzcGVudCBvbiBmdW5jdGlvbmFsaXR5IHRoYXQgaXNuJ3QgdW5pdmVyc2FsbHkgbmVl
ZGVkLgo+ID4gPiBTbyBvbiBkZXZpY2VzIHRoYXQgZG9uJ3QgbmVlZCB0aGUgQ01BIGhlYXAsIHRo
ZXknZCBwcm9iYWJseSBwcmVmZXIgbm90Cj4gPiA+IHRvIGxvYWQgdGhlIENNQSBkbWFidWYgaGVh
cCBkcml2ZXIsIHNvIGl0IHdvdWxkIGJlIGJlc3QgaWYgaXQgY291bGQgYmUKPiA+ID4gYnVpbHQg
YXMgYSBtb2R1bGUuICBJZiB3ZSB3YW50IHRvIGJ1aWxkIHRoZSBDTUEgaGVhcCBhcyBhIG1vZHVs
ZSwgdGhlCj4gPiA+IHN5bWJvbHMgaXQgdXNlcyBuZWVkIHRvIGJlIGV4cG9ydGVkLgo+ID4KPiA+
IFllYWgsIEkgZ3Vlc3MgSSdtIGRpc2FncmVlaW5nIG9uIHdoZXRoZXIgZG1hLWJ1ZiBoZWFwcyBh
cmUgY29yZSBvciBub3QuCj4gCj4gVGhhdCdzIGZpbmUgdG8gZGlzcHV0ZS4gSSdtIG5vdCByZWFs
bHkgaW4gYSBwbGFjZSB0byBhc3NlcnQgb25lIHdheSBvcgo+IG5vdCwgYnV0IHRoZSBBbmRyb2lk
IGZvbGtzIGhhdmUgbWFkZSB0aGVpciBJT04gc3lzdGVtIGFuZCBDTUEgaGVhcHMKPiBsb2FkYWJs
ZSB2aWEgYSBtb2R1bGUsIHNvIGl0IHdvdWxkIHNlZW0gbGlrZSBoYXZpbmcgdGhlIGRtYWJ1ZiBz
eXN0ZW0KPiBhbmQgQ01BIGhlYXBzIGJlIG1vZHVsYXIgd291bGQgYmUgdXNlZnVsIHRvIHByb3Bl
cmx5IHJlcGxhY2UgdGhhdAo+IHVzYWdlLgo+IAo+IEZvciBpbnN0YW5jZSwgdGhlIHN5c3RlbSBo
ZWFwIGFzIGEgbW9kdWxlIHByb2JhYmx5IGRvZXNuJ3QgbWFrZSBtdWNoCj4gc2Vuc2UsIGFzIG1v
c3QgYm9hcmRzIHRoYXQgd2FudCB0byB1c2UgdGhlIGRtYWJ1ZiBoZWFwcyBpbnRlcmZhY2UgYXJl
Cj4gbGlrZWx5IHRvIHVzZSB0aGF0IGFzIHdlbGwuICBDTUEgaXMgbW9yZSBvcHRpb25hbCBhcyBu
b3QgYWxsIGJvYXJkcwo+IHdpbGwgdXNlIHRoYXQgb25lLCBzbyBpdCBtaWdodCBtYWtlIHNlbnNl
IHRvIGF2b2lkIGxvYWRpbmcgaXQuCj4gCj4gU2FuZGVlcDogQ2FuIHlvdSBjaGltZSBpbiBoZXJl
IGFzIHRvIGhvdyBjcml0aWNhbCBoYXZpbmcgdGhlIHN5c3RlbQo+IGFuZCBjbWEgaGVhcHMgYmUg
bW9kdWxlcyBhcmU/CgpXaXRoIGlvbiwgd2UgYXJlIG1ha2luZyBzdXJlIHRoZXJlIGFyZSAqc3Rh
bmRhcmQqIGhlYXBzIHRoYXQgQW5kcm9pZCBzaG91bGQKYmUgYWJsZSB0byByZWx5IG9uIHRvIGV4
aXN0IGluIGFsbCBrZXJuZWxzIFsxXS4gVGhhdCBsaXN0IGlzIGJhc2VkIG9uIHdoYXQKZGVmYXVs
dCBoZWFwcyBpb24gaGFkIG91dC1vZi10cmVlLgoKQXMgb2YgdG9kYXksIGV2ZW4gZnJvbSB0aG9z
ZSB0aGF0IGlvbiBoYWQsIEFuZHJvaWQgdmVuZG9yIGluZGVwZW5kZW50IGNvZGUgb25seQpyZWxp
ZXMgb24gJ3N5c3RlbSBoZWFwJyBhbmQgJ2NtYS9kbWEgaGVhcHMnIHNvLCBjYW4gc2FmZWx5IGln
bm9yZSB0aGUgY2FydmVvdXQKYW5kIG90aGVyIGlvbiBoZWFwcy4KCnN5c3RlbSBoZWFwIGlzIHJl
YWxseSB0aGUgb25lIHRoYXQgaXMgcmVhbGlzdGljYWxseSAnaGFyZHdhcmUgaW5kZXBlbmRlbnQn
LApzbyB0aGF0IGNhbiBiZSBpbiBrZXJuZWwuIFRoZSBjbWEgaGVhcHMgYW5kIHRoZWlyIGV4aXN0
ZW5jZSBpcyBvcHRpb25hbCwgc28KaXQgd2lsbCBiZSBuaWNlIHRvIGJlIGFibGUgdG8gbG9hZCB0
aGVtIGFzIG1vZHVsZXMuCgoKPHNuaXA+CgotIHNzcAoKMS4gaHR0cHM6Ly9hbmRyb2lkLmdvb2ds
ZXNvdXJjZS5jb20vcGxhdGZvcm0vc3lzdGVtL2NvcmUvKy9yZWZzL2hlYWRzL21hc3Rlci9saWJp
b24va2VybmVsLWhlYWRlcnMvbGludXgvaW9uXzQuMTkuaCMyOApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
