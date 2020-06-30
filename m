Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17C20F76A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 16:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7D56E291;
	Tue, 30 Jun 2020 14:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9433A6E291
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:41:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FBF829F;
 Tue, 30 Jun 2020 16:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593528095;
 bh=7tz9evcicVHZgpDCFlQE+n/+K5boh9ygwqdc31IQL2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VYQSwoISOdicRvcB36nvnjJyOsga0L/dk90TztcREaHRvCX7HyI7LICtcVfwIrNEO
 hacr/jUOo4qBlojx2nTeYtmw2ghvwlW81U6TRm1uR6xfBihU6r388n1Pt4uHCN0qEs
 svNQDCfuiHG4H9OTnCD/y56kNed/5ilwvtblyDAk=
Date: Tue, 30 Jun 2020 17:41:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: warning in omap_connector
Message-ID: <20200630144132.GH5850@pendragon.ideasonboard.com>
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
 <20200630141505.GE6112@intel.com>
 <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
 <20200630143902.GG6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630143902.GG6112@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiBUdWUsIEp1biAzMCwgMjAyMCBhdCAwNTozOTowMlBNICswMzAwLCBWaWxs
ZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMTA6MTk6MjNBTSAt
MDQwMCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMTA6
MTUgQU0gVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIEp1biAzMCwg
MjAyMCBhdCAwNDozMzozN1BNICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+ID4gPiBIZXkg
TGF1cmVudCwKPiA+ID4gPgo+ID4gPiA+IEkgbWVyZ2VkIGRybS1taXNjLW5leHQgYW5kIG5vdGlj
ZWQgdGhpcywgSSdtIG5vdCBzdXJlIGlmIGl0J3MKPiA+ID4gPiBjb2xsYXRlcmFsIGRhbWFnZSBm
cm9tIHNvbWV0aGluZyBlbHNlIGNoYW5naW5nIG9yIEkndmUganVzdCBtaXNzZWQgaXQKPiA+ID4g
PiBwcmV2aW91c2x5LiAzMi1iaXQgYXJtIGJ1aWxkLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAv
aG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfY29ubmVjdG9yLmM6Cj4gPiA+ID4gSW4gZnVuY3Rpb24g4oCYb21hcF9jb25uZWN0b3Jf
bW9kZV92YWxpZOKAmToKPiA+ID4gPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3Jj
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmM6OTI6OToKPiA+ID4gPiB3
YXJuaW5nOiBicmFjZXMgYXJvdW5kIHNjYWxhciBpbml0aWFsaXplcgo+ID4gPiA+ICAgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgbmV3X21vZGUgPSB7IHsgMCB9IH07Cj4gPiA+Cj4gPiA+IFByb2Jh
Ymx5IGZhbGxvdXQgZnJvbSBteSBkcm1fZGlzcGxheV9tb2RlIHNocmlua2FnZS4KPiA+ID4KPiA+
ID4gR29pbmcgdG8gcmVwZWF0IG15IHVzdWFsICJqdXN0IHVzZSB7fSB3aGVuIHplcm8gaW5pdGlh
bGl6aW5nCj4gPiA+IHN0cnVjdHMiIHJlY29tbWVuZGF0aW9uLiBBdm9pZHMgdGhlc2Ugc3R1cGlk
IHdhcm5pbmdzLCBhbmQgSU1PCj4gPiA+IGFsc28gY29udmV5cyB0aGUgbWVhbmluZyBiZXR0ZXIg
c2luY2UgdGhlcmUncyBubyBhbWJpZ3VpdHkKPiA+ID4gYmV0d2VlbiB6ZXJvIGluaXRpYWxpemlu
ZyB0aGUgd2hvbGUgc3RydWN0IHZzLiB6ZXJvIGluaXRpYWxpemluZwo+ID4gPiBqdXN0IHRoZSBm
aXJzdCBtZW1iZXIuCj4gPiAKPiA+IElJUkMsIExMVk0gYW5kIEdDQyB0cmVhdCB0aGVzZSBzbGln
aHRseSBkaWZmZXJlbnRseS4gIFdlJ3ZlIGdlbmVyYWxseQo+ID4ganVzdCBtb3ZlZCB0byB1c2lu
ZyBtZW1zZXQgdG8gYXZvaWQgZGlmZmVyZW50IGNvbXBpbGVyIGNvbXBsYWludHMgd2hlbgo+ID4g
dXNpbmcgdGhlc2UuCj4gCj4gSSBkb24ndCBwYXJ0aWN1bGFybHkgbGlrZSBtZW1zZXQoKSBzaW5j
ZSB0aGUgcmVxdWlyZW1lbnQgdG8KPiBwYXNzIHRoZSBzaXplIGp1c3QgYWRkcyBhbm90aGVyIHdh
eSB0byBzY3JldyB0aGluZ3MgdXAuIFRoZQo+IHVzdWFsICdzaXplb2YoKnRoaW5nKScgbWFrZXMg
dGhhdCBzbGlnaHRseSBsZXNzIG9mIGFuIGlzc3VlLAo+IGJ1dCBJJ3ZlIG5vdGljZWQgdGhhdCBw
ZW9wbGUgb2Z0ZW4gZG9uJ3QgdXNlIHRoYXQuCj4gCj4gQW5vdGhlciBpc3N1ZSB3aXRoIG1lbXNl
dCgpIGlzIHRoYXQgeW91IHRoZW4gY2FuIGVuZCB1cCB3aXRoCj4gYSBibG9jayBvZiBzZWVtaW5n
bHkgcmFuZG9tIGNvbGxlY3Rpb24gb2YgbWVtc2V0cygpcyBiZXR3ZWVuCj4gdGhlIHZhcmlhYmxl
IGRlY2xhcmF0aW9ucyBhbmQgdGhlIHJlc3Qgb2YgdGhlIGNvZGUuIEkgc3VwcG9zZQo+IGlmIHdl
IGNvdWxkIGRlY2xhcmUgdmFyaWFibGVzIGFueXdoZXJlIHdlIGNvdWxkIGFsd2F5cyBrZWVwCj4g
dGhlIHR3byB0b2dldGhlciBzbyBpdCB3b3VsZG4ndCBsb29rIHNvIHdlaXJkLCBidXQgY2FuJ3Qg
ZG8KPiB0aGF0IGZvciB0aGUgdGltZSBiZWluZy4gQW5kIGV2ZW4gd2l0aCB0aGF0IGl0IHdvdWxk
IHN0aWxsCj4gbGVhZCB0byBsZXNzIHN1Y2NpbmN0IGNvZGUsIHdoaWNoIEkgZ2VuZXJhbGx5IGRp
c2xpa2UuCgpJJ2QgcHJlZmVyIHsgfSBvdmVyIG1lbXNldCwgYXNzdW1pbmcgY2xhbmcgYW5kIGdj
YyB3b3VsZCB0cmVhdCBpdApjb3JyZWN0bHkuIFZpbGxlLCBJIGNhbiBzdWJtaXQgYSBwYXRjaCwg
dW5sZXNzIHlvdSB3YW50IHRvIGRvIGl0CnlvdXJzZWxmIGFzIGl0J3MgYSBmYWxsb3V0IGZyb20g
ZHJtX2Rpc3BsYXlfbW9kZSBzaHJpbmthZ2UgOy0pCihzZXJpb3VzbHkgc3BlYWtpbmcsIG5vdCBw
dXNoaW5nIHlvdSwgSSBqdXN0IHdhbnQgdG8gYXZvaWQgZHVwbGljYXRpbmcKd29yaykuCgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
