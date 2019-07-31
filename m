Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3946F7BB76
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 10:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33A488FE2;
	Wed, 31 Jul 2019 08:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03D988FE2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:23:53 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so64875659eds.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 01:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ebtR9Fi+xHsrP/ptkLaOzSsiB7mpi/KoOrsK47P2aSA=;
 b=hBDdKVKt90VaBlREjh79FMWgq6sLOPZisumisP4yflGDyWT0v0B1FrCznG+QlBSrsI
 9jZ1ulecWkzTGzuAcGQkpM5YaKM7aigtbiUk6/HCD69dYOSdhNQy7pXi3c7fjW1sHYNT
 af40g2so3ag/pLzco7NowJBFfv+s1RQ53NliEiXAdDKr9rOP1dTmpA2NCm93RqBrpxyn
 Au0fdE5DRBQ+Xco1YRsMMddopvWNIpEg7Zhv+Wp9B/d/2FSy9zFwEBAaxTNEcYOahKQz
 0VACWRrzFw9TlLORvgksEy7qBOUvKnw5HFQ7pCMpdy/3vToWXUFp3ggR1eDpPnCmVsTF
 Ea9w==
X-Gm-Message-State: APjAAAXUIHM11vxU8hS5L7zcIyylatm3RVqk6hn2uwqokzFgIFx6g1lA
 NvY0RzEh14dQL01YRgl5xiQ=
X-Google-Smtp-Source: APXvYqxBeYmeqcpeUg3Ktjj2NHjpBaC/i/NDDwh5aDcMXPavi1tTw41n6eu8a4Jyi5e/PnDPCuuexg==
X-Received: by 2002:a50:92cd:: with SMTP id
 l13mr103297659eda.136.1564561432367; 
 Wed, 31 Jul 2019 01:23:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m4sm9714240ejo.50.2019.07.31.01.23.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:23:51 -0700 (PDT)
Date: Wed, 31 Jul 2019 10:23:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
Message-ID: <20190731082349.GE7444@phenom.ffwll.local>
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
 <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
 <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
 <20190730171245.GE14551@arch-x1c3>
 <86b74e21-8a86-3c7b-9d32-2e6613004715@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86b74e21-8a86-3c7b-9d32-2e6613004715@tronnes.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ebtR9Fi+xHsrP/ptkLaOzSsiB7mpi/KoOrsK47P2aSA=;
 b=TrjJCNkA4ozzkbckvMmOMpDZPKOzr6tjqzICwOwoHNYOYThWgMmD+vHgKmQjrMklW/
 jpB3dnntR5iTXPRuVVErc1JdbIjwsbZ00esVKQOMjHr3jWQ+X/ynoGWWWuL9NamX5pI4
 WvlC1S6yGwRtzHCjOKBoC62S8al2SBlaH0gvk=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDc6MzM6MjhQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IAo+IAo+IERlbiAzMC4wNy4yMDE5IDE5LjEyLCBza3JldiBFbWlsIFZlbGlrb3Y6
Cj4gPiBPbiAyMDE5LzA3LzMwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+IE9uIFR1ZSwgSnVs
IDMwLCAyMDE5IGF0IDQ6MzAgUE0gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+
IHdyb3RlOgo+ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4+PiBEZW4gMjkuMDcuMjAxOSAyMS41NSwgc2ty
ZXYgTm9yYWxmIFRyw7hubmVzOgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVz
IDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPj4+PiAtLS0KPiA+Pj4+ICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYyB8IDE3OSArKysrKysrKysrKysrKysrKystCj4g
Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE3MCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
ID4+Pj4KPiA+Pj4KPiA+Pj4gSSBoYXZlIHJlYWxpc2VkIHRoYXQgdGhpcyB3aWxsIGNoYW5nZSB0
aGUgRFJNIGRyaXZlciBuYW1lIGZyb20gbWkwMjgzcXQKPiA+Pj4gdG8gZHJtX21pcGlfZGJpLiBU
aGlzIG1lYW5zIHRoYXQgdGhpcyBwYW5lbCB3aWxsIGxvb3NlIGl0cyBNRVNBIGttc3JvWzFdCj4g
Pj4+IHN1cHBvcnQuIEkgaGF2ZW4ndCB0cmllZCBpdCwgYnV0IHRoaXMgaXMgdGhlIGZpcnN0IHRo
aW5nIHRoYXQgZ2l2ZXMgdGhpcwo+ID4+PiBkcml2ZXIgYW55IHJlYWwgYWR2YW50YWdlIG92ZXIg
aXRzIGZiZGV2IGNvdW50ZXJwYXJ0IGluCj4gPj4+IGRyaXZlcnMvc3RhZ2luZy9mYnRmdCwgc28g
SSBkb24ndCB3YW50IHRvIGxvb3NlIHRoYXQuCj4gPj4+IFNvIGV2ZW4gaWYgTUlQSSBEQkkgcGFu
ZWwgc3VwcG9ydCBpcyBpbXBsZW1lbnRlZCBpbiBzb21lIGZvcm0sIEkgd2lsbAo+ID4+PiB3YWl0
IHdpdGggY29udmVydGluZyBtaTAyODNxdCB1bnRpbCBzb21lb25lIGhhcyB1cGRhdGVkIHRoZSBr
bXNybyBkcml2ZXIuCj4gPj4KPiA+PiBXaHkgZG9lcyBpdCBjaGFuZ2U/IFlvdSBzaG91bGQgYmUg
YWJsZSB0byBzdHVmZiB3aGF0ZXZlciB5b3UgZmVlbCBsaWtlCj4gPj4gaW50byB0aGUgZHJtIGRy
aXZlciBuYW1lLCB0aGlzIGRvZXNuJ3QgaGF2ZSB0byBtYXRjaCBlaXRoZXIgeW91cgo+ID4+IHBs
YXRmb3JtL3NwaS93aGF0ZXZlciBkcml2ZXIgbmFtZSBub3IgdGhlIG1vZHVsZSBvcHRpb24uCj4g
PiAKPiA+IExhc3QgdGltZSBpJ3ZlIGxvb2tlZCBEUk0gZHJpdmVycyB1c2luZyB0aGUgbWlwaSBk
c2kgaGVscGVycyBkbyBfbm90Xwo+ID4gaGF2ZSAiZHJtX21pcGlfZHNpIiBhcyB0aGVpciBkcml2
ZXIgbmFtZS4gSGVuY2UgZHJpdmVycyB1c2luZyB0aGUgbWlwaQo+ID4gZGJpIHNob3VsZCBub3Qg
aGF2ZSAiZHJtX21pcGlfZGJpIi4KPiA+IAo+IAo+IFdoYXQgcHVycG9zZSBkb2VzIHRoZSBEUk0g
ZHJpdmVyIG5hbWUgc2VydmUgZm9yIHVzZXJzcGFjZT8KPiBXaHkgY2FuJ3QgaXQgYmUgY2FsbGVk
IGRybV9taXBpX2RiaT8gQmVjYXVzZSBtdWx0aXBsZSBwYW5lbCBkcml2ZXJzIHdpbGwKPiB1c2Ug
dGhlIHNhbWUgbmFtZT8gWW91J3JlIHN0YXRlbWVudCBpbXBsaWVzIHRoYXQgdGhlcmUgYXJlIHNv
bWUgcnVsZXMKPiByZWdhcmRpbmcgRFJNIGRyaXZlciBuYW1pbmcuCgpXb3JzdCBjYXNlIGttYWxs
b2MgYSBkcm1fZHJpdmVyIGF0IHJ1bnRpbWUgYW5kIHNldCB0aGUgZHJpdmVyIG5hbWUgdG8KbWF0
Y2ggdGhlIHBhbmVsIG5hbWU/IEltbyB0aGF0IG1ha2VzIHNlbnNlIGZvciB0aGVzZQpwYW5lbC1h
cy1mdWxsLWRybV9kcml2ZXIgZHJpdmVycyAuLi4KCj4gPiBUaGF0IHNhaWQsIHdlIHNob3VsZCBw
cm9iYWJseSBoaWdobGlnaHQgZXZlbiBtb3JlIHRoYXQgdGhlIGRyaXZlciBuYW1lCj4gPiBpcyBh
biBBQkkuCj4gPiAKPiAKPiBUaGlzIEkgZGlkbid0IGtub3cuCgprbXNybyBhbmQgbWVzYSBpbiBn
ZW5lcmFsIHVzZXMgaXQgdG8gZmlndXJlIG91dCB3aGljaCB1c2Vyc3BhY2UgZHJpdmVyCm5lZWRz
IHRvIGJlIGxvYWRlZCBmb3Igd2hpY2gga2VybmVsIGRyaXZlci4gVGhhdCBtYWtlcyBpdCB1YXBp
LCBhbmQgeWVhaCBJCmd1ZXNzIHdlIHNob3VsZCBkb2N1bWVudCBpdC4gSSB0aGluayBhc2lkZSBm
cm9tIGttc3JvIGl0J3Mgbm90IHJlbGV2YW50CmZvciBkaXNwbGF5LW9ubHkgZHJpdmVycywgYnV0
IGZvciBhbnl0aGluZyB0aGF0IGRvZXMgcmVuZGVyaW5nIGFuZCBoYXMKY3VzdG9tIGlvY3RscyBp
dCB2ZXJ5IG11Y2ggaXMgdGhlIG9ubHkgcmVhbCB3YXkgdG8gZmlndXJlIG91dCB3aGF0IGtpbmQg
b2YKZHJpdmVyIHlvdSBoYXZlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
