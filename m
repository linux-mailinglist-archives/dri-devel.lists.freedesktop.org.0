Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA59B1B3C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BC06EEFD;
	Fri, 13 Sep 2019 09:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605AF6EEFD;
 Fri, 13 Sep 2019 09:55:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w6so21682706lfl.2;
 Fri, 13 Sep 2019 02:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aZG3tL44EH2BmsBL4f7Xtfu5jcVOkrunqjTTg6yD9wM=;
 b=b0yRKKCCWVG89FlqstfskuTvaK5oSLoTiKBAM4uwOeZCDgeOz1lY5oeC07VwlAxVxW
 hGGa8MoLR6Io43QQqf2NpBDHXf7Js0kIxeYCkq2zcyMT3HVhxk/cI4M5R/c5rvoTvtUy
 kvVbniIWWHe3xieB8FZVPOedpVhAKYF4yi0sumWjcFviaqK7ZyACD2094n9lJMLFS4pP
 mNzbAP4sdK2aAnF819z7lNbK9Xpizp1cYGQ1hTFw5pWFDO6g+ub1BVt76x8crazL2Xu2
 ycwAmh+R51sdkB4sUugbhEyPwAI3MsyApqaRyStqmnO9GskvQkTXcaQWBWBT3cTu9mzO
 +12w==
X-Gm-Message-State: APjAAAWd03B1y4Cjv+l3hnYrdXU3pG2LKXf5KaA05BdphZg7qFBEIY7E
 7pi2a+I/8BeHGsp1QEUx2iyl/ehfOrtHZUUe6v1IC5aU
X-Google-Smtp-Source: APXvYqwYDzsQwgKkKVY6/RYgqN70VepLYdqhdASCBclQZsMCyv7Lz3bg+b0xR1UspuiDm3SPNEClF9YR2wg3vi2gPJ4=
X-Received: by 2002:a19:f247:: with SMTP id d7mr23315425lfk.191.1568368554545; 
 Fri, 13 Sep 2019 02:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <CAPM=9tzCOmRNGKjJ1K+VUWLNK5kvJFRSqLABnGxafxgPWfTM5w@mail.gmail.com>
 <156829519246.7396.15397531126017115428@jlahtine-desk.ger.corp.intel.com>
In-Reply-To: <156829519246.7396.15397531126017115428@jlahtine-desk.ger.corp.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Sep 2019 19:55:40 +1000
Message-ID: <CAPM=9tzL_m2iiST6BiH5GotwCepNJ9VRpmnWPJCevJAXCAGnHQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 00/37] Introduce memory region concept
 (including device local memory)
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aZG3tL44EH2BmsBL4f7Xtfu5jcVOkrunqjTTg6yD9wM=;
 b=Ku9/s6BKkwKzGjacMlhP8EVUbv6meKTZxml6jwpIA4elxASXnk+jQVUsyW5MDFrVWv
 6LohAq5P7wcNX0+YskJbGhUisif0yCYYONZw9RTRIc1Et8w7FzFTV5cBSWwEFAvh1c/P
 M7d8An8V+UNwlBWMSRACrfFKGs99Ev/J9NHVlapNSegX+ssyA/m/ovYGVFpeOK2ok1yB
 aoMvpuu2eTcKLXh+xY6wNSnCAyonLcIBKlo/4SAgH6cYwt2D5Hhh1CCquMPaJmht44vS
 6WvZ7OHCKh+mbA+EZDM4W6izWP2w5ZpoEjnjDTtl2fye7Ebyn7MuIAhD3+XZE/5/b+qW
 FhjQ==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBTZXAgMjAxOSBhdCAyMzozMywgSm9vbmFzIExhaHRpbmVuCjxqb29uYXMubGFo
dGluZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IFF1b3RpbmcgRGF2ZSBBaXJsaWUgKDIw
MTktMDgtMTMgMjI6MjA6NTIpCj4gPiBPbiBTYXQsIDEwIEF1ZyAyMDE5IGF0IDA4OjI2LCBNYXR0
aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBJbiBw
cmVwYXJhdGlvbiBmb3IgdXBjb21pbmcgZGV2aWNlcyB3aXRoIGRldmljZSBsb2NhbCBtZW1vcnks
IGludHJvZHVjZSB0aGUKPiA+ID4gY29uY2VwdCBvZiBkaWZmZXJlbnQgbWVtb3J5IHJlZ2lvbnMs
IGFuZCBhIHNpbXBsZSBidWRkeSBhbGxvY2F0b3IgdG8gbWFuYWdlCj4gPiA+IHRoZW0gaW4gaTkx
NS4KPiA+ID4KPiA+ID4gT25lIG9mIHRoZSBjb25jZXJucyByYWlzZWQgZnJvbSB2MSB3YXMgYXJv
dW5kIG5vdCB1c2luZyBlbm91Z2ggb2YgVFRNLCB3aGljaCBpcwo+ID4gPiBhIGZhaXIgY3JpdGlj
aXNtLCBzbyB0cnlpbmcgdG8gZ2V0IGJldHRlciBhbGlnbm1lbnQgaGVyZSBpcyBzb21ldGhpbmcg
d2UgYXJlCj4gPiA+IGludmVzdGlnYXRpbmcsIHRob3VnaCBjdXJyZW50bHkgdGhhdCBpcyBzdGls
bCBXSVAgc28gaW4gdGhlIG1lYW50aW1lIHYzIHN0aWxsCj4gPiA+IGNvbnRpbnVlcyB0byBwdXNo
IG1vcmUgb2YgdGhlIGxvdy1sZXZlbCBkZXRhaWxzIGZvcndhcmQsIGJ1dCBub3QgeWV0IHRoZSBU
VE0KPiA+ID4gaW50ZXJhY3Rpb25zLgo+ID4KPiA+IENhbiB3ZSBidW1wIHRoZSBUVE0gd29yayB1
cCB0aGUgbGFkZGVyIGhlcmUsIGFzIGlzIEknbSBub3Qgd2lsbGluZyB0bwo+ID4gYWNjZXB0IGFu
eSBvZiB0aGlzIGNvZGUgdXBzdHJlYW0gd2l0aG91dCBzb21lIHNlcmlvdXMgYW5hbHlzaXMsIHRo
aXMKPiA+IGlzbid0IGEgY2FzZSBvZiBtZSBtYWtpbmcgYSBuaWNlIHN1Z2dlc3Rpb24gYW5kIHlv
dSBoYXZpbmcgdGhlIG9wdGlvbgo+ID4gdG8gaWdub3JlIGl0LiBEb24ndCBtYWtlIG1lIHNob3V0
Lgo+Cj4gVGhhbmtzIGZvciBhIHJlbWluZGVyLiBUVE0gYW5hbHlzaXMgd2FzIG9uZ29pbmcgb24g
dGhlIGJhY2tncm91bmQKPiBhbmQgd2Ugbm93IHJlc2VydmVkIGVub3VnaCB0aW1lIHRvIGNvbmNs
dWRlIG9uIGhvdyB0byBiZXN0IGFsaWduCj4gd2l0aCBUVE0gaW4gc2hvcnQtdGVybSBhbmQgbG9u
Zy10ZXJtLgo+Cj4gV2UgZGVjaWRlZCB0byBiaXRlIHRoZSBidWxsZXQgYW5kIGFwcGx5IGRtYV9y
ZXN2IGFzIHRoZSBvdXRlci1tb3N0Cj4gbG9ja2luZyBpbiBpOTE1IGNvZGVwYXRocyB0byBhbGln
biB3aXRoIHRoZSBUVE0gbG9ja2luZy4gQXMgYQo+IGNvbmNsdXNpb24gdG8gdGhvc2UgZGlzY3Vz
c2lvbnMgd2UgZG9jdW1lbnRlZCBndWlkZWxpbmVzIGhvdyB0bwo+IGFsaWduIHdpdGggVFRNIGxv
Y2tpbmc6Cj4KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzI4MjY2
Lwo+Cj4gQXMgcmVmYWN0b3Jpbmcgb2YgbG9ja2luZyBmdW5kYW1lbnRhbHMgb2YgdGhlIGRyaXZl
ciBpcyBhIG1hc3NpdmUKPiB1bmRlcmdvaW5nIHdpdGggbWFueSBvcGVucyBhbG9uZyB0aGUgcGF0
aCwgd2UnZCBsaWtlIHRvIHByb3Bvc2UgYQo+IHN0YWdlZCBhcHByb2FjaCB0byBhdm9pZCBzdGFs
bGluZyB0aGUgdXBzdHJlYW0gd29yayB3aGlsZSBpdCdzCj4gYmVpbmcgZG9uZS4KPgo+IE91ciBm
aXJzdCBzdWdnZXN0ZWQgc3RlcCB3b3VsZCBiZSBtZXJnaW5nIHRoZSBpOTE1IGxvY2FsIG1lbW9y
eQo+IHJlbGF0ZWQgaW50ZXJuYWwgY29kZSByZXdvcmtzIHRvIHVuYmxvY2sgdGhlIGRpc3BsYXkg
d29yay4gVGhpcwo+IHN0ZXAgc2hvdWxkIG5vdCBjYXVzZSBhbnkgY29uZmxpY3RzIHdpdGggVFRN
Lgo+Cj4gRm9sbG93aW5nIHN0ZXAgd291bGQgYmUgdG8gbWVyZ2UgcHJvcG9zZWQgbWVtb3J5IGFs
bG9jYXRpb24vCj4gbWFuYWdlbWVudCB1QVBJcyB3aXRoIFRUTSByZWxhdGVkIGZ1bmN0aW9uYWxp
dHkgYmVoaW5kIHRoZW0gZm9yCj4gZWFybHkgZGVidWcuIFRoZXkgd291bGQgYmUgcHJvdGVjdGVk
IGJ5IERSTV9JOTE1X0RFQlVHX0VBUkxZX0FQSQo+IGtlcm5lbCBjb25maWcgZmxhZyAoZGVwZW5k
aW5nIG9uIEVYUEVSVCAmIFNUQUdJTkcgJiBCUk9LRU4pLgo+Cj4gVGhpcyB3b3VsZCBhbGxvdyB1
cyB0byBrZWVwIGRlYnVnZ2luZyB0aGVzZSBuZXcgSU9DVExzIHdpdGggTWVzYQo+IGV0Yy4gd2hp
bGUgd2UgcmV3b3JrIHRoZSBsb2NraW5nLiBUaGUgcHJvdGVjdGlvbiBzdGlsbCBsZWF2aW5nIHVz
Cj4gYSBwb3NzaWJpbGl0eSB0byBjb3JyZWN0aW5nIHRoZSB1QVBJcyBpZi93aGVuIHRoZXJlIGlz
IG5lZWQgYWZ0ZXIKPiByZXdvcmtpbmcgdGhlIGxvY2tpbmcgYXJvdW5kIGRtYV9yZXN2IHByb2dy
ZXNzZXMuIERyYWZ0IG9mIHN1Y2gKPiBwcm9wb3NhbCBoZXJlOgo+Cj4gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyNzkwOC8KPgo+IFRoZSBmaW5hbCBzdGVwIChhIHJh
dGhlciBsb25nIG9uZSkgd291bGQgYmUgdGhlbiB0byBjb21wbGV0ZSB0aGUKPiBsb2NraW5nIHJl
d29yayBpbiB0aGUgZHJpdmVyIGFuZCBsaWZ0IHRoZSBERUJVR19FQVJMWV9BUEkKPiBwcm90ZWN0
aW9uIG9uY2UgdGhlIGxvY2tpbmcgaGFzIGJlZW4gc29ydGVkLgo+Cj4gSWYgeW91IGNvdWxkIGNv
bmZpcm0gdGhlIGFib3ZlIHBsYW4gc291bmRzIHJlYXNvbmFibGUgdG8geW91LCB3ZQo+IG1heSB0
aGVuIHByb2NlZWQgd2l0aCBpdC4KCkp1c3QgdHJhdmVsbGluZywgYnV0IHRoaXMgc291bmRzIGxp
a2UgYSBnb29kIHdheSBmb3dhcmQgdG8gbWUuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
