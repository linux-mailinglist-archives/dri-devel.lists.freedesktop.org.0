Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B835C343FF1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ACF6E439;
	Mon, 22 Mar 2021 11:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795516E439
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 11:35:25 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lOIqB-0007g8-PO; Mon, 22 Mar 2021 12:35:23 +0100
Message-ID: <6aa0de38c610ff12a1507ef8e5487b04af2b5d75.camel@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
From: Lucas Stach <l.stach@pengutronix.de>
To: Simon Ser <contact@emersion.fr>
Date: Mon, 22 Mar 2021 12:35:21 +0100
In-Reply-To: <4LQSSN-fXyGvlGD3wSNEi7_TXX1VwnyINrJ6ta9jlLsd8TE3hDf7nZHFbe1GMLu2PYHS9ju726GfQWvd_wmUmAnbojBsKeythWYAWz_k4ak=@emersion.fr>
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <4LQSSN-fXyGvlGD3wSNEi7_TXX1VwnyINrJ6ta9jlLsd8TE3hDf7nZHFbe1GMLu2PYHS9ju726GfQWvd_wmUmAnbojBsKeythWYAWz_k4ak=@emersion.fr>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ltb24sCgpBbSBGcmVpdGFnLCBkZW0gMTkuMDMuMjAyMSB1bSAxOTo1MiArMDAwMCBzY2hy
aWViIFNpbW9uIFNlcjoKPiBPbiBGcmlkYXksIE1hcmNoIDE5dGgsIDIwMjEgYXQgODowNiBQTSwg
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+IAo+ID4gKy8qCj4g
PiArICogVml2YW50ZSBUUyAodGlsZS1zdGF0dXMpIGJ1ZmZlciBtb2RpZmllcnMuIFRoZXkgY2Fu
IGJlIGNvbWJpbmVkIHdpdGggYWxsIG9mCj4gPiArICogdGhlIGNvbG9yIGJ1ZmZlciB0aWxpbmcg
bW9kaWZpZXJzIGRlZmluZWQgYWJvdmUuIFdoZW4gVFMgaXMgcHJlc2VudCBpdCdzIGEKPiA+ICsg
KiBzZXBhcmF0ZSBidWZmZXIgY29udGFpbmluZyB0aGUgY2xlYXIvY29tcHJlc3Npb24gc3RhdHVz
IG9mIGVhY2ggdGlsZS4gVGhlCj4gPiArICogbW9kaWZpZXJzIGFyZSBkZWZpbmVkIGFzIFZJVkFO
VEVfTU9EX1RTX2Nfcywgd2hlcmUgYyBpcyB0aGUgY29sb3IgYnVmZmVyIHRpbGUKPiA+ICsgKiBz
aXplIGluIGJ5dGVzIGNvdmVyZWQgYnkgb25lIGVudHJ5IGluIHRoZSBzdGF0dXMgYnVmZmVyIGFu
ZCBzIGlzIHRoZSBudW1iZXIKPiA+ICsgKiBvZiBzdGF0dXMgYml0cyBwZXIgZW50cnkuCj4gPiAr
ICogV2UgcmVzZXJ2ZSB0aGUgdG9wIDhiaXRzIG9mIHRoZSBWaXZhbnRlIG1vZGlmaWVyIHNwYWNl
IGZvciBUUyBtb2RpZmllcnMsIGFzCj4gPiArICogZnV0dXJlIGNvcmVzIG1pZ2h0IGFkZCBzb21l
IG1vcmUgVFMgbGF5b3V0IHZhcmlhdGlvbnMuCj4gPiArICovCj4gPiArI2RlZmluZSBWSVZBTlRF
X01PRF9UU182NF80ICAgICAgICAgICAgICAgKDFVTEwgPDwgNDgpCj4gPiArI2RlZmluZSBWSVZB
TlRFX01PRF9UU182NF8yICAgICAgICAgICAgICAgKDJVTEwgPDwgNDgpCj4gPiArI2RlZmluZSBW
SVZBTlRFX01PRF9UU18xMjhfNCAgICAgICAgICAgICAgKDNVTEwgPDwgNDgpCj4gPiArI2RlZmlu
ZSBWSVZBTlRFX01PRF9UU18yNTZfNCAgICAgICAgICAgICAgKDRVTEwgPDwgNDgpCj4gPiArI2Rl
ZmluZSBWSVZBTlRFX01PRF9UU19NQVNLICAgICAgICAgICAgICAgKDB4ZmZVTEwgIDw8IDQ4KQo+
IAo+IEhtLCBJIHRoaW5rIGl0J3MgdGhlIGZpcnN0IHRpbWUgd2UgaGF2ZSB2YWx1ZXMgeW91IGNh
biBPUiB3aXRoIG1vZGlmaWVycyB0bwo+IGdldCBhIG5ldyBtb2RpZmllcnMuIFRoaXMgc291bmRz
IGEgbGl0dGxlIGJpdCBkYW5nZXJvdXMsIGJlY2F1c2UgYWxsIG9mIHRoZQo+IGZpZWxkcyBkb24n
dCBnZXQgdGhyb3VnaCB0aGUgZm91cmNjX21vZF9jb2RlIG1hc2suCj4gCj4gTWF5YmUgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGRlZmluZSBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IMKgwqDCoMKg
I2RlZmluZSBEUk1fRk9STUFUX01PRF9WSVZBTlRFX1RTKGNvbG9yX3RpbGluZywgdHMpIFwKPiDC
oMKgwqDCoMKgwqDCoMKgZm91cmNjX21vZF9jb2RlKFZJVkFOVEUsIChjb2xvcl90aWxpbmcgJiAw
eEZGKSB8ICh0cyAmIDB4RkYgPDwgNDgpKQo+IAo+IEFuZCB0aGVuIGhhdmUgZGVmaW5lcyBmb3Ig
YWxsIG9mIHRoZSBwb3NzaWJsZSB2YWx1ZXMgZm9yIGNvbG9yIHRpbGluZyBhbmQgdHM/CgpXaGls
ZSBJIGFncmVlIHRoYXQgdGhpcyByZXF1aXJlcyBzb21lIGF0dGVudGlvbiB3aGVuIHdvcmtpbmcg
d2l0aCB0aG9zZQp2YWx1ZXMsIEkgc3BlY2lmaWNhbGx5IGRlc2lnbmVkIHRoZW0gaW4gc3VjaCBh
IHdheSB0aGF0IG9uZSBjYW4gY29tYmluZQp0aGVtIHdpdGggdGhlIHJlZ3VsYXIgY29sb3IgYnVm
ZmVyIG1vZGlmaWVycyBieSBPUidpbmcgdGhlbSB0b2dldGhlciwKYXMgdGhhdCBtYWtlcyB0aGUg
Y29kZSB1c2luZyB0aGVtIG11Y2ggc2ltcGxlci4KClJlZ2FyZHMsCkx1Y2FzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
