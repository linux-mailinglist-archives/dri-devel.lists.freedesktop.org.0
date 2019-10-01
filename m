Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD60C3A6F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E0589AA2;
	Tue,  1 Oct 2019 16:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4AF6E842
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 16:27:13 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 023D120679;
 Tue,  1 Oct 2019 16:27:12 +0000 (UTC)
Date: Tue, 1 Oct 2019 18:27:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mat King <mathewk@google.com>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191001162710.GB3526634@kroah.com>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569947233;
 bh=S16vIqGBsU7UMmMX2dbzcwOC4YMTdDCTctJpEhsGpxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aggB0WjoiizzEjPBqSKoPUdTtKPsBilJaY2qDULia5dRlw/JyI+8oeYYB8QY+j1TP
 Yf5o2nisxp1fcjGslufNvpIfIzPg8zQ/ByAR/VL0FgUHVABC8ehwZ41xcbYAtNza1O
 Cn52fXqXCeq8Gk9hTZ9rO65lg4fSO9cvZDJrTRJE=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, rafael@kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rajat Jain <rajatja@google.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTA6MDk6NDZBTSAtMDYwMCwgTWF0IEtpbmcgd3JvdGU6
Cj4gUmVzZW5kaW5nIGluIHBsYWluIHRleHQgbW9kZQo+IAo+IEkgaGF2ZSBiZWVuIGxvb2tpbmcg
aW50byBhZGRpbmcgTGludXggc3VwcG9ydCBmb3IgZWxlY3Ryb25pYyBwcml2YWN5Cj4gc2NyZWVu
cyB3aGljaCBpcyBhIGZlYXR1cmUgb24gc29tZSBuZXcgbGFwdG9wcyB3aGljaCBpcyBidWlsdCBp
bnRvIHRoZQo+IGRpc3BsYXkgYW5kIGFsbG93cyB1c2VycyB0byB0dXJuIGl0IG9uIGluc3RlYWQg
b2YgbmVlZGluZyB0byB1c2UgYQo+IHBoeXNpY2FsIHByaXZhY3kgZmlsdGVyLiBJbiBkaXNjdXNz
aW9ucyB3aXRoIG15IGNvbGxlYWd1ZXMgdGhlIGlkZWEgb2YKPiB1c2luZyBlaXRoZXIgL3N5cy9j
bGFzcy9iYWNrbGlnaHQgb3IgL3N5cy9jbGFzcy9sZWRzIGJ1dCB0aGlzIG5ldwo+IGZlYXR1cmUg
ZG9lcyBub3Qgc2VlbSB0byBxdWl0ZSBmaXQgaW50byBlaXRoZXIgb2YgdGhvc2UgY2xhc3Nlcy4K
PiAKPiBJIGFtIHByb3Bvc2luZyBhZGRpbmcgYSBjbGFzcyBjYWxsZWQgInByaXZhY3lfc2NyZWVu
IiB0byBpbnRlcmZhY2UKPiB3aXRoIHRoZXNlIGRldmljZXMuIFRoZSBpbml0aWFsIEFQSSB3b3Vs
ZCBiZSBzaW1wbGUganVzdCBhIHNpbmdsZQo+IHByb3BlcnR5IGNhbGxlZCAicHJpdmFjeV9zdGF0
ZSIgd2hpY2ggd2hlbiBzZXQgdG8gMSB3b3VsZCBtZWFuIHRoYXQKPiBwcml2YWN5IGlzIGVuYWJs
ZWQgYW5kIDAgd2hlbiBwcml2YWN5IGlzIGRpc2FibGVkLgo+IAo+IEN1cnJlbnQga25vd24gdXNl
IGNhc2VzIHdpbGwgdXNlIEFDUEkgX0RTTSBpbiBvcmRlciB0byBpbnRlcmZhY2Ugd2l0aAo+IHRo
ZSBwcml2YWN5IHNjcmVlbnMsIGJ1dCB0aGlzIGNsYXNzIHdvdWxkIGFsbG93IGRldmljZSBkcml2
ZXIgYXV0aG9ycwo+IHRvIHVzZSBvdGhlciBpbnRlcmZhY2VzIGFzIHdlbGwuCj4gCj4gRXhhbXBs
ZToKPiAKPiAjIGdldCBwcml2YWN5IHNjcmVlbiBzdGF0ZQo+IGNhdCAvc3lzL2NsYXNzL3ByaXZh
Y3lfc2NyZWVuL2Nyb3NfcHJpdmFjeS9wcml2YWN5X3N0YXRlICMgMTogcHJpdmFjeQo+IGVuYWJs
ZWQgMDogcHJpdmFjeSBkaXNhYmxlZAo+IAo+ICMgc2V0IHByaXZhY3kgZW5hYmxlZAo+IGVjaG8g
MSA+IC9zeXMvY2xhc3MvcHJpdmFjeV9zY3JlZW4vY3Jvc19wcml2YWN5L3ByaXZhY3lfc3RhdGUK
CldoYXQgaXMgImNyb3NfcHJpdmFjeSIgaGVyZT8KCj4gIERvZXMgdGhpcyBhcHByb2FjaCBzZWVt
IHRvIGJlIHJlYXNvbmFibGU/CgpTZWVtcyBzYW5lIHRvIG1lLCBkbyB5b3UgaGF2ZSBhbnkgY29k
ZSB0aGF0IGltcGxlbWVudHMgdGhpcyBzbyB3ZSBjYW4Kc2VlIGl0PwoKdGhhbmtzLAoKZ3JlZyBr
LWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
