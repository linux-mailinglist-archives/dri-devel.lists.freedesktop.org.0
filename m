Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22160225883
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F90F89FC5;
	Mon, 20 Jul 2020 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9321B6E1F3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 17:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1595094136; bh=f00AuFPGY+rLOuWwPL06wPWVJed68+DRaP3u0RP0c2c=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=hs7atBAxH/fITeB5hr2J/7wADtYv0weGQOMSo1ZnF3NVUAKmOmunM8QK5MR9jMoGO
 JcEMp/KQ5yrlMBhwIHLESCsASDcQV5Tb/MBgItbA7OJsuaITf/A7tRHP5oIc2e53rm
 aMDpaHxwrn2KQqcLMIZfGAij8zXP/E/8l3nX7u8Q=
Date: Sat, 18 Jul 2020 19:42:15 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 0/2] Fix st7703 panel initialization failures
Message-ID: <20200718174215.mgjl3klytfa3nf3t@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Fabio Estevam <festevam@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200716123753.3552425-1-megous@megous.com>
 <20200716140843.GA359122@bogon.m.sigxcpu.org>
 <20200716143209.ud6ote4q545bo2c7@core.my.home>
 <20200718173124.GA88021@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718173124.GA88021@bogon.m.sigxcpu.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBTYXQsIEp1bCAxOCwgMjAyMCBhdCAwNzozMToyNFBNICswMjAwLCBHdWlkbyBH
w7xudGhlciB3cm90ZToKPiBIaSwKPiBPbiBUaHUsIEp1bCAxNiwgMjAyMCBhdCAwNDozMjowOVBN
ICswMjAwLCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiA+IEhpIEd1aWRvLAo+ID4gCj4gPiBPbiBU
aHUsIEp1bCAxNiwgMjAyMCBhdCAwNDowODo0M1BNICswMjAwLCBHdWlkbyBHw7xudGhlciB3cm90
ZToKPiA+ID4gSGkgT25kcmVqLAo+ID4gPiBPbiBUaHUsIEp1bCAxNiwgMjAyMCBhdCAwMjozNzo1
MVBNICswMjAwLCBPbmRyZWogSmlybWFuIHdyb3RlOgo+ID4gPiA+IFdoZW4gZXh0ZW5kaW5nIHRo
ZSBkcml2ZXIgZm9yIHhiZDU5OSBwYW5lbCBzdXBwb3J0IEkgdHJpZWQgdG8gZG8gbWluaW1hbAo+
ID4gPiA+IGNoYW5nZXMgYW5kIGtlZXAgdGhlIGV4aXN0aW5nIGluaXRpYWxpemF0aW9uIHRpbWlu
Zy4KPiA+ID4gPiAKPiA+ID4gPiBJdCB0dXJuZWQgb3V0IHRoYXQgaXQncyBub3QgZ29vZCBlbm91
Z2ggYW5kIHRoZSBleGlzdGluZyBpbml0IHNlcXVlbmNlCj4gPiA+ID4gaXMgdG9vIGFnZ3Jlc3Np
dmUgYW5kIGRvZXNuJ3QgZm9sbG93IHRoZSBzcGVjaWZpY2F0aW9uLiBPbiBQaW5lUGhvbmUKPiA+
ID4gPiBwYW5lbCBpcyBiZWluZyBwb3dlcmVkIGRvd24vdXAgZHVyaW5nIHN1c3BlbmQvcmVzdW1l
IGFuZCB3aXRoIGN1cnJlbnQKPiA+ID4gPiB0aW1pbmdzIHRoaXMgZnJlcXVlbnRseSBsZWFkcyB0
byBjb3JydXB0ZWQgZGlzcGxheS4KPiA+ID4gCj4gPiA+IEdpdmVuIHRoZSBhbW91bnQgb2YgU1Q3
NzAzIGxvb2sgYWxpa2VzIGkgZG9uJ3QgdGhpbmsgeW91IGNhbiBnbyBieSB0aGUKPiA+ID4gZGF0
YXNoZWV0IGFuZCBob3BlIG5vdCB0byBicmVhayBvdGhlciBwYW5lbHMuIFRoZSBjdXJyZW50IHNs
ZWVwcyBjYXRlcgo+ID4gPiBmb3IgdGhlIHJvY2t0ZWNoIHBhbmVsICh3aGljaCBzdWZmZXJlZCBm
cm9tIHNpbWlsYXIgaXNzdWVzIHlvdSBkZXNjcmliZQo+ID4gPiB3aGVuIHdlIHRvb2sgb3RoZXIg
cGFyYW1ldGVycykgc28geW91IG5lZWQgdG8gbWFrZSB0aG9zZSBwYW5lbCBzcGVjaWZpYy4KPiA+
IAo+ID4gSXQgc2hvdWxkIHdvcmsgb24gcm9ja3RlY2ggdG9vLiBUaGUgcGF0Y2ggbW9zdGx5IGlu
Y3JlYXNlcy9yZW9yZGVycyB0aGUgZGVsYXlzCj4gPiBzbGlnaHRseSwgdG8gbWF0Y2ggdGhlIGNv
bnRyb2xsZXIgZG9jdW1lbnRhdGlvbi4gSSBkb24ndCBzZWUgYSByZWFzb24gdG8KPiA+IGNvbXBs
aWNhdGUgdGhlIGRyaXZlciB3aXRoIHBlciBwYW5lbCBzcGVjaWFsIGRlbGF5cywgdW5sZXNzIHRo
ZXNlIHBhdGNoZXMgZG9uJ3QKPiA+IHdvcmsgb24geW91ciBwYW5lbC4KPiAKPiBUaGF0J3Mgd2h5
IGkgYnJvdWdodCBpdCB1cC4gSXQgYnJlYWtzIHRoZSByb2NrdGVjaCBwYW5lbCBvbgo+IGJsYW5r
L3VuYmxhbmsgbG9vcHMgd2hlcmUgaXQganVzdCBzdGF5cyBibGFuayBhbmQgdGhlbiBzdGFydHMg
aGl0dGluZwo+IERTSSBjb21tYW5kIHRpbWVvdXRzLgoKR29vZCB0byBrbm93LiBEb2VzIGtlZXBp
bmcgdGhlIG1zbGVlcCgyMCk7IGFmdGVyIGluaXQgc2VxdWVuY2UgYW5kIGJlZm9yZSBzbGVlcApl
eGl0IG1ha2UgaXQgd29yaz8KCnRoYW5rIHlvdSBhbmQgcmVnYXJkcywKCW8uCgo+IENoZWVycywK
PiAgLS0gR3VpZG8KPiAKPiA+IAo+ID4gVGhlIGluaXQgc2VxdWVuY2UgaXMgc3RpbGwgc3Vib3B0
aW1hbCwgYW5kIGRvZXNuJ3QgZm9sbG93IHRoZSBrZXJuZWwgZG9jcwo+ID4gY29tcGxldGVseSwg
ZXZlbiBhZnRlciB0aGVzZSBwYXRjaGVzLiBDb250cm9sbGVyIHNwZWMgYWxzbyB0YWxrcyBhYm91
dCBhZGRpbmcKPiA+IHNvbWUgZGVsYXkgYmVmb3JlIGVuYWJsaW5nIHRoZSBiYWNrbGlnaHQgdG8g
YXZvaWQgdmlzdWFsIGdsaXRjaGVzLgo+ID4gCj4gPiBXaGljaCBpcyB3aGF0IGVuYWJsZSBjYWxs
YmFjayBpcyBkb2N1bWVudGVkIHRvIGJlIGZvci4gQ3VycmVudGx5IHBhcnQgb2YgdGhlCj4gPiBp
bml0aWFsaXphdGlvbiB0aGF0IGJlbG9uZ3MgdG8gcHJlcGFyZSBjYWxsYmFjayBpcyBhbHNvIGRv
bmUgaW4gZW5hYmxlIGNhbGxiYWNrLgo+ID4gCj4gPiBJIHNlZSB0aGUgZ2xpdGNoIChzbWFsbCB2
ZXJ0aWNhbCBzaGlmdCBvZiB0aGUgaW1hZ2Ugb24gcG93ZXJ1cCksIGJ1dCBwZXJzb25hbGx5Cj4g
PiBkb24ndCBjYXJlIG11Y2ggdG8gaW50cm9kdWNlIGV2ZW4gbW9yZSBkZWxheXMgdG8gdGhlIGRy
aXZlciwganVzdCBmb3IgdGhlCj4gPiBjb3NtZXRpYyBpc3N1ZS4KPiA+IAo+ID4gcmVnYXJkcywK
PiA+IAlvLgo+ID4gCj4gPiA+IENoZWVycywKPiA+ID4gIC0tIEd1aWRvCj4gPiA+IAo+ID4gPiA+
IAo+ID4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIHRoZSBwcm9ibGVtcy4KPiA+ID4gPiAK
PiA+ID4gPiBUaGUgaXNzdWUgd2FzIHJlcG9ydGVkIGJ5IFNhbXVlbCBIb2xsYW5kLgo+ID4gPiA+
IAo+ID4gPiA+IFJlbGV2YW50IHNjcmVlbnNob3RzIGZyb20gdGhlIGRhdGFzaGVldDoKPiA+ID4g
PiAKPiA+ID4gPiAgIFBvd2VyIG9uIHRpbWluZzogaHR0cHM6Ly9tZWdvdXMuY29tL2RsL3RtcC8z
NWI3MmU2NzRjZTBjYTI3LnBuZwo+ID4gPiA+ICAgUG93ZXIgb2ZmIHRpbWluZzogaHR0cHM6Ly9t
ZWdvdXMuY29tL2RsL3RtcC9kZWExOTU1MTcxMDZmZjE3LnBuZwo+ID4gPiA+ICAgTW9yZSBvcHRp
bWFsIHJlc2V0IG9uIHBvd2Vyb246IGh0dHBzOi8vbWVnb3VzLmNvbS9kbC90bXAvYTllNWNhZjE0
ZTFiMGRjNi5wbmcKPiA+ID4gPiAgIExlc3Mgb3B0aW1hbCByZXNldCBvbiBwb3dlcm9uOiBodHRw
czovL21lZ291cy5jb20vZGwvdG1wLzI0Njc2MTAzOTI4M2M0Y2YucG5nCj4gPiA+ID4gICBEYXRh
c2hlZXQ6IGh0dHBzOi8vbWVnb3VzLmNvbS9kbC90bXAvU1Q3NzAzX0RTX3YwMV8yMDE2MDEyOC5w
ZGYKPiA+ID4gPiAKPiA+ID4gPiBQbGVhc2UgdGFrZSBhIGxvb2suCj4gPiA+ID4gCj4gPiA+ID4g
dGhhbmsgeW91IGFuZCByZWdhcmRzLAo+ID4gPiA+ICAgT25kcmVqIEppcm1hbgo+ID4gPiA+IAo+
ID4gPiA+IE9uZHJlaiBKaXJtYW4gKDIpOgo+ID4gPiA+ICAgZHJtL3BhbmVsOiBzdDc3MDM6IE1h
a2UgdGhlIHNsZWVwIGV4aXQgdGltaW5nIG1hdGNoIHRoZSBzcGVjCj4gPiA+ID4gICBkcm0vcGFu
ZWw6IHN0NzcwMzogRml4IHRoZSBwb3dlciB1cCBzZXF1ZW5jZSBvZiB0aGUgcGFuZWwKPiA+ID4g
PiAKPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMy5j
IHwgMjkgKysrKysrKysrKy0tLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gLS0gCj4gPiA+ID4g
Mi4yNy4wCj4gPiA+ID4gCj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
