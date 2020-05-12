Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669751CFEA8
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 21:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500D06E974;
	Tue, 12 May 2020 19:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3B86E974;
 Tue, 12 May 2020 19:47:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s8so17294530wrt.9;
 Tue, 12 May 2020 12:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dd0BoQQcVd3JAqASsVl46XVVHdqwDdYiTKGonzKkGOk=;
 b=CAcM0vt2HFUKLub3JzJtkPMilAkvS9eq4aN+xvgC86MNF3vYcfANxquul1iCLidaZh
 aEypTUzMN3+yYCrotIDPDlcV80LwRn305PBxZPgarwvpXmtEMiREMHK8sKLM+R23MNuQ
 R2msLgtuoGxdJPC1zC6vKHxDgXBvEqq9LN42iwgzDHXk58J2qc2Cr89xXNDwdjJwU4JT
 aUARkIRYcMmzDaQuEeuNSXnJVX+tGvP4H/kdnMiSpdq4ePMVRm45Sj+DltMsJkmWHO9M
 cU/KO/RFwJ7kkI15vox5HaIlDfrcMjchChTegpp/S9LFLLPOsvmSjq/8wDTmM9vYB47Q
 +kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dd0BoQQcVd3JAqASsVl46XVVHdqwDdYiTKGonzKkGOk=;
 b=SJe+6EuPqzK3RjYUgLlmpQnbr1j36QabXoRNJOGB1Pt5TH3pPuXGDLYIr62nxLO8Uk
 NHDCXKfiOfoufEi3qYEdhCvSWAyK7iHv7KQGpZ4VJSMjcswwnpo1ZNQaNNJ9+h6MWG2g
 uWQ0CYvnTz8MrLziyv9sOnDLp9oxTdSoH6itxt7REriAG896DkZ+8PoCnBya9c1Hf//2
 WMYCrfHUpYGn8fWEHVlorJlKV+sPqNk2fdIu5ur8yVhPJMJzgFHn6B3HCAXRjzsNqduC
 HyVUUcsEPk+JM2EyAm0twCDBII1iXpu1lbtoiuX/fBr7zu2H1bH7mwEJuJANn+Bk0RQF
 dDCg==
X-Gm-Message-State: AGi0PuacXRKFlaRRG8vlj3Xz86drisQ9HWZxyxxvFGmmV/KkGUiTmfuV
 6ova43AIPb/UeoPDWpqDZFIzOGbJoG2JKV+TKKg=
X-Google-Smtp-Source: APiQypJnpJ6wxfDNaMTKVmQBb0Cll1FSnt1k5QvFF99QvOcXkCdQOx1oO+m6ND12UPeTHDUBg/EGIi+s/8LafwC0ljo=
X-Received: by 2002:a5d:4389:: with SMTP id i9mr27527291wrq.374.1589312861325; 
 Tue, 12 May 2020 12:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
 <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
In-Reply-To: <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 15:47:30 -0400
Message-ID: <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A@mail.gmail.com>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMzoxMCBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaSBBbGV4Cj4KPiBBbSAxMi4wNS4yMCB1bSAyMDoz
MiBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiA+IE9uIFR1ZSwgTWF5IDEyLCAyMDIwIGF0IDI6Mjkg
UE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4+Cj4g
Pj4gSGkKPiA+Pgo+ID4+IEFtIDExLjA1LjIwIHVtIDE5OjE3IHNjaHJpZWIgQ2hyaXN0aWFuIEvD
tm5pZzoKPiA+Pj4gSGkgZ3V5cywKPiA+Pj4KPiA+Pj4gV2VsbCBsZXQncyBmYWNlIGl0IEFHUCBp
cyBhIHRvdGFsIGhlYWRhY2hlIHRvIG1haW50YWluIGFuZCBkZWFkIGZvciBhdCBsZWFzdCAxMCsg
eWVhcnMuCj4gPj4+Cj4gPj4+IFdlIGhhdmUgYSBsb3Qgb2YgeDg2IHNwZWNpZmljIHN0dWZmIGlu
IHRoZSBhcmNoaXRlY3R1cmUgaW5kZXBlbmRlbnQgZ3JhcGhpY3MgbWVtb3J5IG1hbmFnZW1lbnQg
dG8gZ2V0IHRoZSBjYWNoaW5nIHJpZ2h0LCBhYnVzaW5nIHRoZSBETUEgQVBJIG9uIG11bHRpcGxl
IG9jY2FzaW9ucywgbmVlZCB0byBkaXN0aW5jdCBiZXR3ZWVuIEFHUCBhbmQgZHJpdmVyIHNwZWNp
ZmljIHBhZ2UgdGFibGVzIGV0YyBldGMuLi4KPiA+Pj4KPiA+Pj4gU28gdGhlIGlkZWEgaGVyZSBp
cyB0byBqdXN0IGdvIGFoZWFkIGFuZCByZW1vdmUgdGhlIHN1cHBvcnQgZnJvbSBSYWRlb24gYW5k
IE5vdXZlYXUgYW5kIHRoZW4gZHJvcCB0aGUgbmVjZXNzYXJ5IGNvZGUgZnJvbSBUVE0uCj4gPj4+
Cj4gPj4+IEZvciBSYWRlb24gdGhpcyBtZWFucyB0aGF0IHdlIGp1c3Qgc3dpdGNoIG92ZXIgdG8g
dGhlIGRyaXZlciBzcGVjaWZpYyBwYWdlIHRhYmxlcyBhbmQgZXZlcnl0aGluZyBzaG91bGQgbW9y
ZSBvciBsZXNzIGNvbnRpbnVlIHRvIHdvcmsuCj4gPj4+Cj4gPj4+IEZvciBOb3V2ZWF1IEknbSBu
b3QgMTAwJSBzdXJlLCBidXQgZnJvbSB0aGUgY29kZSBpdCBvZiBoYW5kIGxvb2tzIGxpa2Ugd2Ug
Y2FuIGRvIGl0IHNpbWlsYXIgdG8gUmFkZW9uLgo+ID4+Pgo+ID4+PiBQbGVhc2UgY29tbWVudCB3
aGF0IHlvdSB0aGluayBhYm91dCB0aGlzLgo+ID4+Cj4gPj4gVGhlcmUncyBzb21lIEFHUCBzdXBw
b3J0IGNvZGUgaW4gdGhlIERSTSBjb3JlLiBDYW4gc29tZSBvZiB0aGF0IGRlY2xhcmVkCj4gPj4g
YXMgbGVnYWN5Pwo+ID4+Cj4gPj4gU3BlY2lmaWNhbGx5LCB3aGF0IGFib3V0IHRoZXNlIEFHUC1y
ZWxhdGVkIGlvY3RsIGNhbGxzPyBDYW4gdGhleSBiZQo+ID4+IGRlY2xhcmVkIGFzIGxlZ2FjeT8g
SXQgd291bGQgYXBwZWFyIHRvIG1lIHRoYXQgS01TLWJhc2VkIGRyaXZlcnMgZG9uJ3QKPiA+PiBo
YXZlIHRvIG1hbmFnZSBBR1AgYnkgdGhlbXNlbHZlcy4gKD8pCj4gPgo+ID4gVGhlIG9sZCBkcm0g
Y29yZSBBR1AgY29kZSBpcyBtYWlubHkgKG9ubHk/KSBmb3IgdGhlIG5vbi1LTVMgZHJpdmVycy4K
PiA+IEUuZy4sIG1hY2g2NCwgcjEyOCwgc2lzLCBzYXZhZ2UsIGV0Yy4KPgo+IEV4YWN0bHkgbXkg
cG9pbnQuIFRoZXJlJ3Mgb25lIGRybV9hZ3BfaW5pdCgpIGNhbGwgbGVmdCBpbiByYWRlb24uIFRo
ZQo+IHJlc3Qgb2YgdGhlIEFHUCBjb2RlIGlzIGFwcGFyZW50bHkgZm9yIGxlZ2FjeSBub24tS01T
IGRyaXZlcnMuIFNob3VsZAo+IHRoZSByZWxhdGVkIGlvY3RsIGNhbGxzIGJlIGRlY2xhcmVkIGFz
IGxlZ2FjeSAoaS5lLiwgbGlzdGVkIHdpdGgKPiBEUk1fTEVHQUNZX0lPQ1RMX0RFRiBpbnN0ZWFk
IG9mIERSTV9JT0NUTF9ERUYpPyBJZiBzbywgbXVjaCBvZiB0aGUgQUdQCj4gY29yZSBjb2RlIGNv
dWxkIHByb2JhYmx5IGJlIG1vdmVkIGJlaGluZCBDT05GSUdfRFJNX0xFR0FDWSBhcyB3ZWxsLgoK
QWgsIEkgZm9yZ290IGFib3V0IGRybV9hZ3BfaW5pdCgpLiAgSSB3YXMganVzdCB0aGlua2luZyB0
aGUgb3RoZXIgQUdQCnN0dWZmLiAgWWVhaCwgSSB0aGluayB3ZSBjb3VsZCBtYWtlIGl0IGxlZ2Fj
eS4KCkFsZXgKCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+Cj4gPiBBbGV4Cj4gPgo+
ID4+Cj4gPj4gQmVzdCByZWdhcmRzCj4gPj4gVGhvbWFzCj4gPj4KPiA+Pj4KPiA+Pj4gUmVnYXJk
cywKPiA+Pj4gQ2hyaXN0aWFuLgo+ID4+Pgo+ID4+Pgo+ID4+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+
ID4+PiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKPiA+Pj4KPiA+Pgo+ID4+IC0t
Cj4gPj4gVGhvbWFzIFppbW1lcm1hbm4KPiA+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4g
Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gPj4gTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQo+ID4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPiA+Pgo+ID4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiA+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+Cj4g
LS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4gR2VzY2jDpGZ0
c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
