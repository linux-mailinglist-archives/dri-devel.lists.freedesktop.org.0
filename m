Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BCB1003DF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 12:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AB888B2B;
	Mon, 18 Nov 2019 11:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C5388B2B;
 Mon, 18 Nov 2019 11:26:26 +0000 (UTC)
Received: from localhost (unknown [89.205.134.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93AFF2068D;
 Mon, 18 Nov 2019 11:26:25 +0000 (UTC)
Date: Mon, 18 Nov 2019 12:26:23 +0100
From: Greg KH <greg@kroah.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/15] staging/android/ion: delete dma_buf->kmap/unmap
 implemenation
Message-ID: <20191118112623.GD156486@kroah.com>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: devel@driverdev.osuosl.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzU6MjVBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGVyZSdzIG5vIGNhbGxlcnMgaW4tdHJlZSBhbnltb3JlLgo+IAo+IEZvciBtZXJn
aW5nIHByb2JhYmx5IGJlc3QgdG8gc3R1ZmYgdGhpcyBpbnRvIGRybS1taXNjLCBzaW5jZSB0aGF0
J3MKPiB3aGVyZSB0aGUgZG1hLWJ1ZiBoZWFwcyB3aWxsIGxhbmQgdG9vLiBBbmQgdGhlIHJlc3Vs
dGluZyBjb25mbGljdAo+IGhvcGVmdWxseSBlbnN1cmVzIHRoYXQgZG1hLWJ1ZiBoZWFwcyB3b250
IGhhdmUgYSBuZXcgLT5rbWFwL3VubWFwCj4gaW1wbGVtZW5hdGlvbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGF1cmEg
QWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vt
d2FsQGxpbmFyby5vcmc+Cj4gQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnCj4gQ2M6IGxp
bmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvYW5k
cm9pZC9pb24vaW9uLmMgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQg
ZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
