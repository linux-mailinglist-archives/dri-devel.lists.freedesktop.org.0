Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDA2CC96
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79566E267;
	Tue, 28 May 2019 16:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA5C6E267
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:49:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-139-52-nat.elisa-mobile.fi
 [85.76.139.52])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE62ED85;
 Tue, 28 May 2019 18:49:33 +0200 (CEST)
Date: Tue, 28 May 2019 19:49:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190528164916.GA17874@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528163730.GA9610@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559062174;
 bh=lEjKHqijMGwDHdIFV6IpbBri4b6BDlrFy94f6LaA38A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nsxe+QaRjPfxPWCTv0FrcyqunWIXMU9NCc2DwkM9vMbXRQYjMAoRz706YMVXjxA+4
 hi99ceJwx1OhxcxNTArKZkFUI3eUjtLXzNqK+hafc3cJtKpocn8+je55RClVLM5Iqs
 0RPEFiHFiSH808Ia/TXa3pYzX6WXxvV2HO1z76ts=
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDY6Mzc6MzBQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA1OjEyOjI4UE0gKzAzMDAs
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBBZGQgYSBuZXcgb3B0aW9uYWwgcmVuZXNhcyxj
b21wYW5pb24gcHJvcGVydHkgdG8gcG9pbnQgdG8gdGhlIGNvbXBhbmlvbgo+ID4gTFZEUyBlbmNv
ZGVyLiBUaGlzIGlzIHVzZWQgdG8gc3VwcG9ydCBkdWFsLWxpbmsgb3BlcmF0aW9uIHdoZXJlIHRo
ZSBtYWluCj4gPiBMVkRTIGVuY29kZXIgc3BsaXRzIGV2ZW4tbnVtYmVyZWQgYW5kIG9kZC1udW1i
ZXJlZCBwaXhlbHMgYmV0d2VlbiB0aGUKPiA+IHR3byBMVkRTIGVuY29kZXJzLgo+ID4gCj4gPiBU
aGUgbmV3IHByb3BlcnR5IGRvZXNuJ3QgY29udHJvbCB0aGUgbW9kZSBvZiBvcGVyYXRpb24sIGl0
IG9ubHkKPiA+IGRlc2NyaWJlcyB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gdGhlIG1hc3RlciBh
bmQgY29tcGFuaW9uIExWRFMKPiA+IGVuY29kZXJzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3JnPgo+ID4g
VGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiAt
LS0KPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAKPiA+IC0gQ2xhcmlmeSB3aGVuIHRoZSBjb21w
YW5pb24gcHJvcGVydHkgaXMgcmVxdWlyZWQgb3Igbm90IGFsbG93ZWQKPiA+IAo+ID4gQ2hhbmdl
cyBzaW5jZSB2MToKPiA+IAo+ID4gLSBGaXhlZCB0eXBvCj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0ICAgIHwgNyArKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Jl
bmVzYXMsbHZkcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+ID4gaW5kZXggOTAwYTg4NGFkOWY1Li4yZDI0YmQ4
Y2JlYzUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQKPiA+IEBA
IC00NSw2ICs0NSwxMyBAQCBPRiBncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4KPiA+ICAKPiA+ICBFYWNoIHBvcnQg
c2hhbGwgaGF2ZSBhIHNpbmdsZSBlbmRwb2ludC4KPiA+ICAKPiA+ICtPcHRpb25hbCBwcm9wZXJ0
aWVzOgo+ID4gKwo+ID4gKy0gcmVuZXNhcyxjb21wYW5pb24gOiBwaGFuZGxlIHRvIHRoZSBjb21w
YW5pb24gTFZEUyBlbmNvZGVyLiBUaGlzIHByb3BlcnR5IGlzCj4gPiArICBtYW5kYXRvcnkgZm9y
IHRoZSBmaXJzdCBMVkRTIGVuY29kZXIgb24gRDMgYW5kIEUzIFNvQ3MsIGFuZCBzaGFsbCBwb2lu
dCB0bwo+ID4gKyAgdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMgYSBjb21wYW5pb24g
aW4gZHVhbC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdAo+ID4gKyAgYmUgc2V0IGZvciBhbnkgb3Ro
ZXIgTFZEUyBlbmNvZGVyLgo+IAo+IElmIHRoZSBEMyBhbmQgRTMgc29jcyBkbyBub3QgbWFuZGF0
ZSB0aGUgdXNlIG9mIGR1YWwtbGluaywgdGhlbiB3aGF0IHRvCj4gZG8gaW4gdGhlIERUPyBCZWNh
dXNlIGFjY29yZGluZyB0byB0aGUgYWJvdmUgdGhpcyBwcm9wZXJ0eSBtdXN0IGJlCj4gc3BlY2lm
aWVkIGZvciBEMyBhbmQgRTMgU09DJ3MuCgpUaGlzIHByb3BlcnR5IGRvZXNuJ3QgZW5hYmxlIGR1
YWwtbGluayBtb2RlLCBpdCBvbmx5IHNwZWNpZmllcyB0aGUKY29tcGFuaW9uIExWRFMgZW5jb2Rl
ciB1c2VkIGZvciBkdWFsLWxpbmsgbW9kZSwgd2hlbiBlbmFibGVkICh0aHJvdWdoCmNvbW11bmlj
YXRpb24gYmV0d2VlbiB0aGUgTFZEUyBlbmNvZGVyIGFuZCB0aGUgTFZEUyByZWNlaXZlciBhdApy
dW50aW1lKS4KCkphY29wbyBoYWQgYSBzaW1pbGFyIGNvbW1lbnQgc28gSSBzdXBwb3NlIHRoaXMg
aXNuJ3QgY2xlYXIuIEhvdyB3b3VsZAp5b3Ugd29yZCBpdCB0byBtYWtlIGl0IGNsZWFyID8KCj4g
PiArCj4gPiAgCj4gPiAgRXhhbXBsZToKPiAKPiBBbHdheXMgZ29vZCB3aXRoIGV4YW1wbGVzLCBt
YXliZSBpdCBjb21lcyBsYXRlci4KCkdvb2QgcG9pbnQsIEknbGwgZml4IHRoYXQuCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
