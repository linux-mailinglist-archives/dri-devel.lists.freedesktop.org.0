Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F0F8A3D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0416EA72;
	Tue, 12 Nov 2019 08:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55916EA4A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:56:11 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p24so12048623pfn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 16:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G+W/WgXFQW+lt7IfFRrFaHlfa6KYsGjbDHKvVT4OS68=;
 b=oBHYtVA2rOztUQMXOhNecc2oT4fuFTW2U9Vz6KP0j2HA9X9osQ5sA0/uEM1HTCaE4o
 FlVTVlojipCvOGppYCdgslprZlXkqHclsreLFPnZVIVcfpDTYRPZGN2FkYyZ+C4WIwa6
 n0WdrLvTSn6MBFckjN2Ssp08y05sRGaCcrmOl+K4XmWNT4wEtV9Ml1tZkgWufyZKjGfL
 5LssfksCbBK1xnMcTO39PCkvmoGbhwCyXMpJ4BW8oLdY9ENVzAigCX3aBooG9JGvlNy6
 EOBPUf0N1nQmQeMC4DGZD4LMl0mpWMERWDX7PrXHwEy+ChOcU2DXZXTs+X2uT0BS1oz6
 ELpA==
X-Gm-Message-State: APjAAAWFCLtRouG1fm9AvrWrExxfWN6u1VJmcBJAFym0UbXwmmB9OH3F
 eNxBaXUdkkpZsYsAJKcPzxraiA==
X-Google-Smtp-Source: APXvYqw9wZ8KS9Kjzz+u+JmppGkycaLQwPal5QAlHhwTBI9UAlrxZzGzLRvP1TWhZaqpf0BzWA2MdQ==
X-Received: by 2002:a63:950c:: with SMTP id p12mr33368602pgd.238.1573520170966; 
 Mon, 11 Nov 2019 16:56:10 -0800 (PST)
Received: from localhost ([2401:fa00:d:2:4dd6:fffa:d6aa:9572])
 by smtp.gmail.com with ESMTPSA id k103sm627402pje.16.2019.11.11.16.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 16:56:10 -0800 (PST)
Date: Tue, 12 Nov 2019 09:56:07 +0900
From: Sandeep Patil <sspatil@android.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
Message-ID: <20191112005607.GB17144@google.com>
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191104095823.GD10326@phenom.ffwll.local>
 <CALAqxLW_CoAn-KXki0dGKK+vo-R4CTnjt1Azrw=mRdL8BUFGWw@mail.gmail.com>
 <20191105094259.GX10326@phenom.ffwll.local>
 <CALAqxLWvNOL=Exybb25GgYQujyJcPNTsFuaBnjLQPKTkVAi6Xw@mail.gmail.com>
 <CAKMK7uFSBNqVWy0N-GH7CzH-R7c9CVb97LgCffdMzGCgvVan4Q@mail.gmail.com>
 <CALAqxLV+MfESanq+PenRUNR_w6KZT1KQ7suPjmiT-bdAFx83EA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLV+MfESanq+PenRUNR_w6KZT1KQ7suPjmiT-bdAFx83EA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G+W/WgXFQW+lt7IfFRrFaHlfa6KYsGjbDHKvVT4OS68=;
 b=g5FCw/IrcyCS1t94m4uHwMuV4Q3V5h7wkcZG9mdWN/i4/r74kHXoFxRopB1hP4HYNT
 Rhoi+JpodhCjU4z0t5yxD8TCE0oGNH9l3mtzZgtTyqlmi/2Ljg9eR8fZ6areT3FHNMlr
 r03QRqPz9c4fvkCM9ISoeNY5EZ01cyxNKr2mLZhYt3uuA1yD6sgpRN5CWro+j6gfUxEO
 KkUygH0E0yiK9/Uyfx76DxUJQCVplN5l8caDT5g5QzoqGNU3jzDytjWqGut9jEKw8bK5
 aYkIhntlaimGrJkGOKh0k6ZKz10+Cq9LjdKyiZs96ik3WI6w++0q+vnhKfAV7KPAhTTk
 y6Jg==
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

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6NDc6NTNBTSAtMDgwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMToxOSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCA2OjQxIFBNIEpv
aG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4gT24gVHVlLCBO
b3YgNSwgMjAxOSBhdCAxOjQzIEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAxMDo1Nzo0NEFNIC0w
ODAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQg
MTo1OCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPiA+ID4g
PiBPbiBGcmksIE9jdCAyNSwgMjAxOSBhdCAxMTo0ODozMlBNICswMDAwLCBKb2huIFN0dWx0eiB3
cm90ZToKPiA+ID4gPiA+IFNvIGV2ZW4gaWYgdGhlIGhlYXBzIGFyZSBjb25maWd1cmVkIHZpYSBE
VCAod2hpY2ggYXQgdGhlIG1vbWVudCB0aGVyZQo+ID4gPiA+ID4gaXMgbm8gc3VjaCBiaW5kaW5n
LCBzbyB0aGF0J3Mgbm90IHJlYWxseSBhIHZhbGlkIG1ldGhvZCB5ZXQpLCB0aGVyZSdzCj4gPiA+
ID4gPiBzdGlsbCB0aGUgcXVlc3Rpb24gb2YgaWYgdGhlIGhlYXAgaXMgbmVjZXNzYXJ5L21ha2Vz
IHNlbnNlIG9uIHRoZQo+ID4gPiA+ID4gZGV2aWNlLiBBbmQgdGhlIERUIHdvdWxkIG9ubHkgY29u
dHJvbCB0aGUgYXZhaWxhYmlsaXR5IG9mIHRoZSBoZWFwCj4gPiA+ID4gPiBpbnRlcmZhY2UsIG5v
dCBpZiB0aGUgaGVhcCBkcml2ZXIgaXMgbG9hZGVkIG9yIG5vdC4KPiA+ID4gPgo+ID4gPiA+IEht
IEkgdGhvdWdodCB0aGUgY21hIHJlZ2lvbnMgYXJlIGNvbmZpZ3VyZWQgaW4gRFQ/IEhvdyBkb2Vz
IHRoYXQgd29yayBpZgo+ID4gPiA+IGl0J3Mgbm90IHVzaW5nIERUPwo+ID4gPgo+ID4gPiBTbyB5
ZWEsIENNQSByZWdpb25zIGFyZSBlaXRoZXIgY29uZmlndXJlZCBieSBEVCBvciBzZXR1cCBhdCBi
dWlsZCB0aW1lCj4gPiA+IChJIHRoaW5rIHRoZXJlJ3MgYSBjbWRsaW5lIG9wdGlvbiB0byBzZXQg
aXQgdXAgYXMgd2VsbCkuCj4gPiA+Cj4gPiA+IEJ1dCB0aGUgQ01BIHJlZ2lvbnMgYW5kIHRoZSBk
bWFidWYgY21hIGhlYXAgZHJpdmVyIGFyZSBzZXBhcmF0ZQo+ID4gPiB0aGluZ3MuIFRoZSBsYXR0
ZXIgdXNlcyB0aGUgZm9ybWVyLgo+ID4KPiA+IEh1aCwgSSBhc3N1bWVkIHRoZSBwbGFuIGlzIHRo
YXQgd2hlbmV2ZXIgdGhlcmUncyBhIGNtYSByZWdpb24sIHdlIHdhbnQKPiA+IHRvIGluc3RhbnRp
YXRlIGEgZG1hLWJ1ZiBoZWFwIGZvciBpdD8gV2h5L3doZW4gd291bGQgd2Ugbm90IHdhbnQgdG8g
ZG8KPiA+IHRoYXQ/Cj4gCj4gTm90IHF1aXRlLiBBbmRyZXcgbm90ZWQgdGhhdCB3ZSBtYXkgbm90
IHdhbnQgdG8gZXhwb3NlIGFsbCBDTUEgcmVnaW9ucwo+IHZpYSBkbWFidWYgaGVhcHMsIHNvIHJp
Z2h0IG5vdyB3ZSBvbmx5IGV4cG9zZSB0aGUgZGVmYXVsdCByZWdpb24uIEkKPiBoYXZlIGZvbGxv
dyBvbiBwYXRjaGVzIHRoYXQgSSBzZW50IG91dCBlYXJsaWVyICh3aGljaCByZXF1aXJlcyBhCj4g
dG8tYmUtZmluYWxpemVkIERUIGJpbmRpbmcpIHdoaWNoIGFsbG93cyB1cyB0byBzcGVjaWZ5IHdo
aWNoIG90aGVyIENNQQo+IHJlZ2lvbnMgdG8gZXhwb3NlLgo+IAo+ID4gPiA+ID4gT24gdGhlIEhp
S2V5L0hpS2V5OTYwIGJvYXJkcywgd2UgaGF2ZSB0byBhbGxvY2F0ZSBjb250aWd1b3VzIGJ1ZmZl
cnMKPiA+ID4gPiA+IGZvciB0aGUgZGlzcGxheSBmcmFtZWJ1ZmZlci4gU28gZ3JhbGxvYyB1c2Vz
IElPTiB0byBhbGxvY2F0ZSBmcm9tIHRoZQo+ID4gPiA+ID4gQ01BIGhlYXAuIEhvd2V2ZXIgb24g
dGhlIGRiODQ1YywgaXQgaGFzIG5vIHN1Y2ggcmVzdHJpY3Rpb25zLCBzbyB0aGUKPiA+ID4gPiA+
IENNQSBoZWFwIGlzbid0IG5lY2Vzc2FyeS4KPiA+ID4gPgo+ID4gPiA+IFdoeSBkbyB5b3UgaGF2
ZSBhIENNQSByZWdpb24gZm9yIHRoZSAybmQgYm9hcmQgaWYgeW91IGRvbid0IG5lZWQgaXQ/Cj4g
PiA+ID4gX1RoYXRfIHNvdW5kcyBsaWtlIHNvbWUgc2VyaW91cyBtZW1vcnkgd2FzdGVyLCBub3Qg
YSBmZXcgbGluZXMgb2YgY29kZQo+ID4gPiA+IGxvYWRlZCBmb3Igbm90aGluZyA6LSkKPiA+ID4K
PiA+ID4gPz8/IFRoYXQncyBub3Qgd2hhdCBJIHNhaWQgYWJvdmUuICBJZiB0aGUgZGI4NDVjIGRv
ZXNuJ3QgbmVlZCBDTUEgaXQKPiA+ID4gd29uJ3QgaGF2ZSBhIENNQSByZWdpb24uCj4gPiA+Cj4g
PiA+IFRoZSBpc3N1ZSBhdCBoYW5kIGlzIHRoYXQgd2UgbWF5IHdhbnQgdG8gYXZvaWQgbG9hZGlu
ZyB0aGUgZG1hYnVmIENNQQo+ID4gPiBoZWFwIGRyaXZlciBvbiBhIGJvYXJkIHRoYXQgZG9lc24n
dCB1c2UgQ01BLgo+ID4KPiA+IFNvIHRoZSBDTUEgY29yZSBjb2RlIGlzIGFsc28gYSBtb2R1bGUs
IG9yIGhvdyBkb2VzIHRoYXQgd29yaz8gTm90Cj4gCj4gTm8uICBDTUEgY29yZSBpc24ndCBhdmFp
bGFibGUgYXMgYSBtb2R1bGUuCj4gCj4gPiBsb2FkaW5nIHRoZSBjbWEgZG1hLWJ1ZiBoZWFwLCBi
dXQga2VlcGluZyBhbGwgdGhlIG90aGVyIGNtYSBjb2RlCj4gPiBhcm91bmQgZmVlbHMgc2xpZ2h0
bHkgc2lsbHkuIERvIHdlIGhhdmUgbnVtYmVycyB0aGF0IGp1c3RpZnkgdGhpcwo+ID4gc2lsbGlu
ZXNzPwo+IAo+IEkgYWdyZWUgdGhhdCBpcyBtYXliZSBub3QgdGhlIG1vc3QgY3JpdGljYWwgaXRl
bSBvbiB0aGUgbGlzdCwgYnV0IGl0cwo+IG9uZSBvZiBtYW55IHRoYXQgZG8gYWRkIHVwIG92ZXIg
dGltZS4KPiAKPiBBZ2FpbiwgSSdsbCBkZWZlciB0byBTYW5kZWVwIG9yIG90aGVyIGZvbGtzIG9u
IHRoZSBHb29nbGUgc2lkZSB0byBoZWxwCj4gd2l0aCB0aGUgaW1wb3J0YW5jZSBoZXJlLiBNb3N0
bHkgSSdtIHRyeWluZyB0byBlbnN1cmUgdGhlcmUgaXMKPiBmdW5jdGlvbmFsIHBhcml0eSB0byBJ
T04gc28gd2UgZG9uJ3QgZ2l2ZSBmb2xrcyBhbnkgcmVhc29uIHRoZXkgY291bGQKPiBvYmplY3Qg
dG8gZGVwcmVjYXRpbmcgaXQuCgpQYXJpdHkgd2l0aCBJT04gd2lsbCBkZWZpbml0ZWx5IGJlIG5p
Y2UuIEZvciBub3csIGhvd2V2ZXIsIGV2ZW4gaWYgd2UgYWNoaWV2ZQp0aGF0IHBhcml0eSB3aXRo
IFVBUEkgYW5kIHRoaW5rIGFib3V0IHRoZSBjbWEtaGVhcC1hcy1tb2R1bGUgYml0IGxhdGVyLCBJ
Cmd1ZXNzIHRoYXQncyBvay4KClRoZSByZWFsIHByb2JsZW0gaXMgdGhlIG5lZWQgZm9yIHRoZXNl
IGhlYXBzIHRvIGJlIGEgbW9kdWxlIGluIHRoZSBmaXJzdApwbGFjZS4gIEknZCBtdWNoIHJhdGhl
ciBoYXZlIGFuIHVwc3RyZWFtIHVzZXIgdG8gc2hvdyB0aGUgbmVlZCBmb3IgY2FjaGUKbWFpbnRl
bmFuY2Ugb3BlcmF0aW9ucyB0aGF0IGhhdmUgYmVlbiB0YWxrZWQgYWJvdXQgc28gbWFueSB0aW1l
cywgc28gd2UgY2FuCm1ha2UgdGhlbSBoYXBwZW4gZm9yIGRtYS1idWYtaGVhcHMgaW4gdXBzdHJl
YW0uIE5vbmUgb2YgdGhpcyBoYXMgdG8gYmUKYSBtb2R1bGUgaWYgdGhhdCBoYXBwZW5zIDooLgoK
VGhlIHJlYXNvbiBmb3IgdGhlICJtb2R1bGFyaXphdGlvbiIgIGZvciBpb24gaGVhcHMgaXMgYWxz
byB0aGUgQ01PcyBmb3IKQW5kcm9pZCB1c2UgY2FzZXMuIFVuZm9ydHVuYXRlbHkgd2UgaGF2ZW4n
dCBoYWQgYW55IGx1Y2sgd2l0aCBwcm92aW5nIHRoZQpuZWVkIGZvci4gSm9obiwgQ01JSVcuCgoK
LSBzc3AKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
