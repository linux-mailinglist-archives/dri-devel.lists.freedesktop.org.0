Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBEB1FE25
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 05:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0198920E;
	Thu, 16 May 2019 03:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC15A8920E;
 Thu, 16 May 2019 03:29:52 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id e2so1325164vsc.13;
 Wed, 15 May 2019 20:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FOufUPjf1lrJOhjjOINcSE96Kq+NQvULEGai/cBENk0=;
 b=bi2P4UyV6HZdUyOClPp6C0OYkutNMile2Pulc1SZqK6CWU2oBupvlG6qQaQZN2Zjds
 dkdnJZ1htvPCMAM3/V6lYS0j8KOXXlTmrnxQEzF246Kh5ypTXmxci0e7VweSP5ITE4ky
 7aAONXWOigD4z3+xV7A5u+5BnKbt/lQgMqkLrrT3UbVB5xxpWWRAsd2UGu7q/vbpm5wU
 4ceaY8DtvNZI7Vqcu0k56ZG5ADrxp+5MBM3ojcRfsZD7RqG50PXUbm4MRMV3QLpnGr1m
 GG8JlQal5/jY81kMN+f5h2ObtZx2S3dyVAqKDvH8F8TpXkad1DSXjAGxL6huCc2ncNpx
 Kaqg==
X-Gm-Message-State: APjAAAUPKVVJztsBSw5ybHQTR6ZS6qYeVuMmFvCWfBXatgEML9DwtiXc
 e1txNtrcFN0u8aT1YW/vFrdLZSKyjEqoB0o+a+c=
X-Google-Smtp-Source: APXvYqwlfl8LK1AJAwK5DIXOwf/87AGpuvja/orK71fGT4OHBNXBGIdOT15KR211OulLWSJSVANd2jjlQ90rRfWyn8w=
X-Received: by 2002:a67:f245:: with SMTP id y5mr17513860vsm.210.1557977392093; 
 Wed, 15 May 2019 20:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190511170831.25645-1-peteris.rudzusiks@gmail.com>
 <CACAvsv5Ux7Av45JGQ7Rqe+ZX2zWcbbBNqc+kCZgLT-uGkQAegw@mail.gmail.com>
 <20190514195736.GB5179@y40-linux>
In-Reply-To: <20190514195736.GB5179@y40-linux>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 15 May 2019 23:29:40 -0400
Message-ID: <CAKb7Uvhhre6-k_GJUmLW59z4XEjg5eX6EQiHN5aGts_gcC3+2w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix duplication of nv50_head_atom
 struct
To: Peteris Rudzusiks <peteris.rudzusiks@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMzo1NyBQTSBQZXRlcmlzIFJ1ZHp1c2lrcwo8cGV0ZXJp
cy5ydWR6dXNpa3NAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0
IDA0OjU1OjA1UE0gKzEwMDAsIEJlbiBTa2VnZ3Mgd3JvdGU6Cj4gPiBPbiBTdW4sIDEyIE1heSAy
MDE5IGF0IDA0OjIzLCBQZXRlcmlzIFJ1ZHp1c2lrcwo+ID4gPHBldGVyaXMucnVkenVzaWtzQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IG52NTBfaGVhZF9hdG9taWNfZHVwbGljYXRlX3N0
YXRlKCkgbWFrZXMgYSBjb3B5IG9mIG52NTBfaGVhZF9hdG9tCj4gPiA+IHN0cnVjdC4gVGhpcyBw
YXRjaCBhZGRzIGNvcHlpbmcgb2Ygc3RydWN0IG1lbWJlciBuYW1lZCAib3IiLCB3aGljaAo+ID4g
PiBwcmV2aW91c2x5IHdhcyBsZWZ0IHVuaW5pdGlhbGl6ZWQgaW4gdGhlIGR1cGxpY2F0ZWQgc3Ry
dWN0dXJlLgo+ID4gPgo+ID4gPiBEdWUgdG8gdGhpcyBidWcsIGluY29ycmVjdCBuaHN5bmMgYW5k
IG52c3luYyB2YWx1ZXMgd2VyZSBzb21ldGltZXMgdXNlZC4KPiA+ID4gSW4gbXkgcGFydGljdWxh
ciBjYXNlLCB0aGF0IGxlYWQgdG8gYSBtaXNtYXRjaCBiZXR3ZWVuIHRoZSBvdXRwdXQKPiA+ID4g
cmVzb2x1dGlvbiBvZiB0aGUgZ3JhcGhpY3MgZGV2aWNlIChHZUZvcmNlIEdUIDYzMCBPRU0pIGFu
ZCB0aGUgcmVwb3J0ZWQKPiA+ID4gaW5wdXQgc2lnbmFsIHJlc29sdXRpb24gb24gdGhlIGRpc3Bs
YXkuIHhyYW5kciByZXBvcnRlZCAxNjgweDEwNTAsIGJ1dAo+ID4gPiB0aGUgZGlzcGxheSByZXBv
cnRlZCAxMjgweDEwMjQuIEFzIGEgcmVzdWx0IG9mIHRoaXMgbWlzbWF0Y2gsIHRoZSBvdXRwdXQK
PiA+ID4gb24gdGhlIGRpc3BsYXkgbG9va2VkIGxpa2UgaXQgd2FzIGNyb3BwZWQgKG9ubHkgcGFy
dCBvZiB0aGUgb3V0cHV0IHdhcwo+ID4gPiBhY3R1YWxseSB2aXNpYmxlIG9uIHRoZSBkaXNwbGF5
KS4KPiA+ID4KPiA+ID4gZ2l0IGJpc2VjdCBwb2ludGVkIHRvIGNvbW1pdCAyY2E3ZmI1YzFjYzYg
KCJkcm0vbm91dmVhdS9rbXMvbnY1MDogaGFuZGxlCj4gPiA+IFNldENvbnRyb2xPdXRwdXRSZXNv
dXJjZSBmcm9tIGhlYWQiKSwgd2hpY2ggYWRkZWQgdGhlIG1lbWJlciAib3IiIHRvCj4gPiA+IG52
NTBfaGVhZF9hdG9tIHN0cnVjdHVyZSwgYnV0IGZvcmdvdCB0byBjb3B5IGl0IGluCj4gPiA+IG52
NTBfaGVhZF9hdG9taWNfZHVwbGljYXRlX3N0YXRlKCkuCj4gPiA+Cj4gPiA+IEZpeGVzOiAyY2E3
ZmI1YzFjYzYgKCJkcm0vbm91dmVhdS9rbXMvbnY1MDogaGFuZGxlIFNldENvbnRyb2xPdXRwdXRS
ZXNvdXJjZSBmcm9tIGhlYWQiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlcmlzIFJ1ZHp1c2lr
cyA8cGV0ZXJpcy5ydWR6dXNpa3NAZ21haWwuY29tPgo+ID4gT29wcywgbmljZSBjYXRjaC4gIFRo
YW5rIHlvdSBmb3IgdGhpcywgSSd2ZSBtZXJnZWQgaXQgaW4gbXkgdHJlZSBhbmQKPiA+IHdpbGwg
Z2V0IGl0IHVwc3RyZWFtIEFTQVAuCj4gPgo+ID4gVGhhbmtzLAo+ID4gQmVuLgo+ID4KPiBIaSBC
ZW4sCj4KPiBUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgYW5kIG1lcmdl
IHRoaXMgcGF0Y2guCj4KPiBJJ20gbmV3IHRvIHRoZSBMaW51eCBrZXJuZWwgZGV2ZWxvcG1lbnQg
cHJvY2Vzcywgc28gSSBhbSBub3Qgc3VyZSB3aGF0Cj4gaGFwcGVucyBuZXh0LiBEb2VzIGluY2x1
c2lvbiBpbiB5b3VyIHRyZWUgaW1wbHkgdGhhdCB0aGlzIGZpeCB3aWxsIGVuZAo+IHVwIGluIHNv
bWUgKG1vc3QgbGlrZWx5IC0gbmV4dCkgbWFpbmxpbmUga2VybmVsPyBXaWxsIGl0IGFsc28gYmUK
PiBiYWNrcG9ydGVkIHRvIDQuMTkgTFRTIGJyYW5jaD8KPgo+IFRoaXMgYnVnIGFmZmVjdHMgYWxs
IGtlcm5lbCB2ZXJzaW9ucyBzdGFydGluZyBmcm9tIHY0LjE4LiBQcm9iYWJseSBub3QKPiB0aGF0
IG1hbnkgc3lzdGVtcyB0aG91Z2guCgpCZW4gc3VibWl0cyBhIHB1bGwgcmVxdWVzdCB0byBEYXZl
IEFpcmxpZSAoZHJtIG1haW50YWluZXIpLCBhbmQgRGF2ZQpzdWJtaXRzIG9uZSB0byBMaW51cyBm
b3IgaW5jbHVzaW9uIGluIHRoZSAib2ZmaWNpYWwiIHVwc3RyZWFtCnJlcG9zaXRvcnkuIERhdmUg
anVzdCBzZW50IGEgcHVsbCByZXF1ZXN0IHRvIExpbnVzLCB3aG8gdXN1YWxseSBwaWNrcwp0aGVz
ZSB1cCB3aXRoaW4gYSBmZXcgZGF5cyAoZXhjZXB0aW9ucyBhcHBseSkuCgpPbmNlIGluIHRoZSBt
YWlubGluZSB0cmVlLCB0aGUgIkZpeGVzIiB0YWcgaXMgbGlrZWx5IHRvIGNhdXNlIGl0IHRvCmdl
dCBwaWNrZWQgdXAgZm9yIHN0YWJsZS4gWW91IGNhbiBhbHNvIG5vbWluYXRlIGl0IGZvciBzdGFi
bGUga2VybmVsCmJyYW5jaCBpbmNsdXNpb24gZXhwbGljaXRseSAodGhlcmUgYXJlIGluc3RydWN0
aW9ucyBzb21ld2hlcmUsIGJ1dApiYXNpY2FsbHkgeW91IHNlbmQgYW4gZW1haWwgdG8gc29tZSBs
aXN0IHNheWluZyAicGxlYXNlIGluY2x1ZGUgY29tbWl0CkFCQyBpbiBrZXJuZWxzIFhZWiIpLgoK
V2hhdCBVYnVudHUgc2hpcHMgaXMsIHVsdGltYXRlbHksIHVwIHRvIFVidW50dS4gVGhleSB3aWxs
LCBob3dldmVyLApmcmVxdWVudGx5IGZvbGxvdyB0aGUgc3RhYmxlIGtlcm5lbCBicmFuY2hlcywg
YW5kIGxpc3RlbiB0byB0aGUgbGlzdAphYm92ZSBhcyB3ZWxsLgoKSG9wZSB0aGlzIGhlbHBzLAoK
ICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
