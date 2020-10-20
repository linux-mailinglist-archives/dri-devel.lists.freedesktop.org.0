Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4696293A24
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 13:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F306E091;
	Tue, 20 Oct 2020 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067B86EC4A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 11:40:34 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id u17so1818266oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xMX7MNCWZjl9PP8Rm7CjZAvBjAWz5zpwC20q/M6z71s=;
 b=kUxMXXT+EDFVWag4WZq9cgBI5uuAebK9+BipbDBIWez14jK1A9PCMBlSQ27pa1+Ptq
 sfKHA4/b9d9C7SYhMMU4uJedsH5bI70Rjl2w0n2XEIv/b+lftqDOsoOT65iZ/S8WBjVi
 Ir7EThjY7xGbxidsrp8/ODzIyQTMH2mxKlkv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xMX7MNCWZjl9PP8Rm7CjZAvBjAWz5zpwC20q/M6z71s=;
 b=S0OOkthHZJHxrDr4wdkAvpzZPF+E6iTJolKEt2bBHiciIyLeHbMDQbkc/dWXEeCl6c
 Y+JrYskuxCvGI/3ovSXmFx3Ujnf6Tu4FSK623mxtu3KY/TlmmV9tAI4FTSQt8VG10dxy
 6gj56QpYi0Oh7CkNY4AY78kj+z8PmTupXWJvi3tl+rh2YS5pCdUxvwpDqHs8p4aW9zHV
 C/KmRLSbfi1E20vRRraDiINWyspXxn8feVcHBMyBsH7jWw03Y88EQmPZhKbRPY3kAwCU
 0DqSVA29Mh5yJOLOYhdPHGX9PY7TIbmhVIfIBxnws7g1T413NI4neEBojFYGYom00wb8
 H+6Q==
X-Gm-Message-State: AOAM5329Skla16BrUT3b7C1EBGAr8izA7DGSLRD23zFR0ZX9KJJ0uYkC
 po/wP5aR3+Xk3fMDsZZJ5Q/oqOTGBh4sjBbCy3Xj8g==
X-Google-Smtp-Source: ABdhPJzVzUVjFbHV43pokPGDC+2R9dXIhmSjLmp8+cMpFSCiTmcFymsX6Re44FboW91u/vpEnxEF2HXWp/DwiUlAt4g=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr1520167oia.14.1603194033341; 
 Tue, 20 Oct 2020 04:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
In-Reply-To: <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Oct 2020 13:40:21 +0200
Message-ID: <CAKMK7uFWyMZQauakjzSWa9r494R4JKDkAk6ABZOLLsCXb6_yHg@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTksIDIwMjAgYXQgNzoyNyBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMTkuMTAuMjAyMCAxMToxMywgTWlra28gUGVydHR1bmVuINC/
0LjRiNC10YI6Cj4gPiBPbiAxMC8xOS8yMCA1OjIxIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4gPj4gMDcuMTAuMjAyMCAyMDoxMiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gPj4+
ICtpbnQgdGVncmFfZHJtX2lvY3RsX2NoYW5uZWxfbWFwKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0s
IHZvaWQgKmRhdGEsCj4gPj4+ICsgICAgICAgICAgICAgICAgc3RydWN0IGRybV9maWxlICpmaWxl
KQo+ID4+PiArewo+ID4+Cj4gPj4gSGVsbG8sIE1pa2tvIQo+ID4+Cj4gPj4gQ291bGQgeW91IHBs
ZWFzZSB0ZWxsIHdoYXQgYXJlIHRoZSBob3N0MXggY2xpZW50cyB0aGF0IGFyZSBnb2luZyB0byBi
ZQo+ID4+IHVwc3RyZWFtZWQgYW5kIHdpbGwgbmVlZCB0aGlzIElPQ1RMPwo+ID4+Cj4gPgo+ID4g
SGkgRG1pdHJ5IQo+ID4KPiA+IEl0IGlzIG5lZWRlZCBmb3IgYW55IGVuZ2luZS9qb2IgdGhhdCB3
YW50cyB0byBhY2Nlc3MgbWVtb3J5LCBhcyB0aGlzCj4gPiBJT0NUTCBtdXN0IGJlIHVzZWQgdG8g
bWFwIG1lbW9yeSBmb3IgdGhlIGVuZ2luZS4gU28gYWxsIG9mIHRoZW0uCj4gPgo+ID4gRG93bnN0
cmVhbSBkb2Vzbid0IGhhdmUgYW4gZXF1aXZhbGVudCBJT0NUTCBiZWNhdXNlIGl0IChjdXJyZW50
bHkpIGRvZXMKPiA+IG1hcHBpbmcgYXQgc3VibWl0IHRpbWUsIGJ1dCB0aGF0IGlzIHN1Ym9wdGlt
YWwgYmVjYXVzZQo+ID4KPiA+IC0gaXQgcmVxdWlyZXMgZG9pbmcgcmVsb2NhdGlvbnMgaW4gdGhl
IGtlcm5lbCB3aGljaCBpc24ndCByZXF1aXJlZCBmb3IKPiA+IFQxODYrCj4gPiAtIGl0J3MgYSBi
aWcgcGVyZm9ybWFuY2UgcGVuYWx0eSwgZHVlIHRvIHdoaWNoIHRoZSBkb3duc3RyZWFtIGtlcm5l
bCBoYXMKPiA+IHRoZSAiZGVmZXJyZWQgZG1hLWJ1ZiB1bm1hcHBpbmciIGZlYXR1cmUsIHdoZXJl
IHVubWFwcGluZyBhIGRtYV9idWYgbWF5Cj4gPiBub3QgaW1tZWRpYXRlbHkgdW5tYXAgaXQgaW4g
Y2FzZSBpdCdzIHVzZWQgbGF0ZXIsIHNvIHRoYXQgdGhlICJtYXBwaW5nIgo+ID4gbGF0ZXIgaXMg
ZmFzdGVyLiBBIGZlYXR1cmUgd2hpY2ggd2UnZCBwcmVmZXJhYmx5IGdldCByaWQgb2YuCj4gPiAt
IGJlY2F1c2Ugb2YgdGhlIGFib3ZlIGZlYXR1cmUgbm90IGJlaW5nIGNvbnRyb2xsZWQgYnkgdGhl
IHVzZXIsIGl0IGNhbgo+ID4gY2F1c2UgdmFyaWFuY2UgaW4gc3VibWl0IHRpbWVzLgo+ID4KPiA+
IE9uIHRoZSBvdGhlciBoYW5kLCB3ZSBjYW5ub3QgKGF0IGxlYXN0IGFsd2F5cykgZG8gdGhlIG1h
cHBpbmcgYXQKPiA+IGFsbG9jYXRpb24vaW1wb3J0IHRpbWUsIGJlY2F1c2UKPiA+Cj4gPiAtIEEg
c2luZ2xlIEZEIG1heSBoYXZlIG11bHRpcGxlIGNoYW5uZWxfY3R4J3MsIGFuZCBhbiBhbGxvY2F0
aW9uL2ltcG9ydAo+ID4gbWF5IG5lZWQgdG8gYmUgdXNlZCBpbiBhbnkgc3Vic2V0IG9mIHRoZW0K
PiA+IC0gVGhlIGltcG9ydCBJT0NUTCBpcyBmaXhlZCBhbmQgZG9lc24ndCBoYXZlIHRoZSBwYXJh
bWV0ZXJzIHdlJ2QgbmVlZCB0bwo+ID4gZG8gdGhpcyBhdCBpbXBvcnQgdGltZQo+ID4gLSBPdmVy
YWxsIGl0J3MgbW9yZSBvcnRob2dvbmFsIHRvIGhhdmUgR0VNIG9iamVjdCBhY3F1aXJlbWVudCBp
biBvbmUKPiA+IHN0ZXAgYW5kIG1hcHBpbmcgaW4gYW5vdGhlci4KPiA+Cj4gPiBNYXliZSB0aGF0
J3Mgbm90IHF1aXRlIHdoYXQgeW91IGFza2VkLCBidXQgaXQncyBzb21lIGJhY2tncm91bmQgYW55
d2F5IDopCj4KPiBJJ20gYXNraW5nIHRoaXMgcXVlc3Rpb24gYmVjYXVzZSByaWdodCBub3cgdGhl
cmUgaXMgb25seSBvbmUgcG90ZW50aWFsCj4gY2xpZW50IGZvciB0aGlzIElPQ1RMLCB0aGUgVklD
LiBJZiBvdGhlciBjbGllbnRzIGFyZW4ndCBzdXBwb3NlZCB0byBiZSBhCj4gcGFydCBvZiB0aGUg
RFJNIGRyaXZlciwgbGlrZSBmb3IgZXhhbXBsZSBOVkRFQyB3aGljaCBwcm9iYWJseSBzaG91bGQg
YmUKPiBhIFY0TCBkcml2ZXIsIHRoZW4gRFJNIGRyaXZlciB3aWxsIGhhdmUgb25seSBhIHNpbmds
ZSBWSUMgYW5kIGluIHRoaXMKPiBjYXNlIHdlIHNob3VsZG4ndCBuZWVkIHRoaXMgSU9DVEwgYmVj
YXVzZSBEUk0gYW5kIFY0TCBzaG91bGQgdXNlIGdlbmVyaWMKPiBkbWFidWYgQVBJIGZvciBpbXBv
cnRpbmcgYW5kIGV4cG9ydGluZyBidWZmZXJzLgoKUmFuZG9tbHkganVtcGluZyBpbiBoZXJlIC4u
LgoKU28gaWYgeW91IGhhdmUgYSBkcm0gZHJpdmVyIHdpdGggdXNlcnNwYWNlIGluIG1lc2EzZCBh
bHJlYWR5LCB0aGUKdXN1YWwgYXBwcm9hY2ggaXMgdG8gaGF2ZSBhIGxpYnZhIGltcGxlbWVudGF0
aW9uIChpZGVhbGx5IGluIG1lc2EzZAp0b28sIHVzaW5nIHRoZSBnYWxsaXVtIGZyYW1ld29yayBz
byB0aGF0IGEgbG90IG9mIHRoZSBib3JpbmcKaW50ZWdyYXRpb24gZ2x1ZSBpcyB0YWtlbiBjYXJl
IG9mIGFscmVhZHkpIGRpcmVjdGx5IG9uIHRvcCBvZiBkcm0uIE5vCnY0bCBkcml2ZXIgbmVlZGVk
IGF0IGFsbCBoZXJlLgoKQW5kIGl0IHNvdW5kcyBsaWtlIHRoaXMgbnZkZWMgdGhpbmcgd291bGQg
Zml0IHRoYXQgYmlsbCBwcmV0dHkgbmVhdGx5LgoKPiBJJ20gYWxzbyBub3QgcXVpdGUgc3VyZSBh
Ym91dCB3aGV0aGVyIHRoZSBjdXJyZW50IG1vZGVsIG9mIHRoZSB1bmlmaWVkCj4gVGVncmEgRFJN
IGRyaXZlciBpcyBzdWl0YWJsZSBmb3IgaGF2aW5nIHRoZSBzZXBhcmF0ZWQgZW5naW5lcy4gUGVy
aGFwcwo+IGVhY2ggc2VwYXJhdGVkIGVuZ2luZSBzaG91bGQganVzdCBoYXZlIGl0cyBvd24gcmVu
ZGVyaW5nIG5vZGU/CgpBYm92ZSBtb2RlbCB1c2luZyBsaWJ2YSBkcml2ZXIgaW4gdXNlcnNwYWNl
IGZvciBudmRlYyB3b3VsZCBhdm9pZCB0aGlzCmlzc3VlIHRvby4KLURhbmllbAotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
