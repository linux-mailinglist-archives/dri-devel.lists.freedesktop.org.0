Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6572AF5B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39F898C8;
	Mon, 27 May 2019 07:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAEE898CC;
 Mon, 27 May 2019 07:23:02 +0000 (UTC)
Received: from localhost (unknown [84.241.203.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02B2D21734;
 Mon, 27 May 2019 07:23:01 +0000 (UTC)
Date: Mon, 27 May 2019 09:22:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jens Frederich <jfrederich@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Jon Nettleton <jon.nettleton@gmail.com>
Subject: Re: [PATCH 32/33] staging/olpc_dcon: Add drm conversion to TODO
Message-ID: <20190527072258.GD7997@kroah.com>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-33-daniel.vetter@ffwll.ch>
 <20190527071126.GL21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527071126.GL21222@phenom.ffwll.local>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558941782;
 bh=DkUuoc02LMNVzqW31q31YJk6Lkll7SmCa0g24wRTrw0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=HWyzED+XsXUB4UT+il2PmmV5ynBrIMCFuGKRXEr9/InHesUoAkR2w1L0gwxNH7lIR
 a3cRoz/XuiUxk5qjuaAinh+IbkadXNEn6LA31A977Pda8e6csn7ApYXAhUnC1CJbqN
 3mDC/07jYD70RYAm+ltyYc64shQHrnufhaXOthZw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDk6MTE6MjZBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAxMDo1Mzo1M0FNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gdGhpcyBkcml2ZXIgaXMgcHJldHR5IGhvcnJpYmxlIGZyb20gYSBk
ZXNpZ24gcG92LCBhbmQgbmVlZHMgYSBjb21wbGV0ZQo+ID4gb3ZlcmhhdWwuIENvbmNyZXRlIHRo
aW5nIHRoYXQgYW5ub3lzIG1lIGlzIHRoYXQgaXQgbG9va3MgYXQKPiA+IHJlZ2lzdGVyZWRfZmIs
IHdoaWNoIGlzIGFuIGludGVybmFsIHRoaW5nIHRvIGZibWVtLmMgYW5kIGZiY29uLmMuIEFuZAo+
ID4gb2ZjIGl0IGdldHMgdGhlIGxpZmV0aW1lIHJ1bGVzIGFsbCB3cm9uZyAoaXQgc2hvdWxkIGF0
IGxlYXN0IHVzZQo+ID4gZ2V0L3B1dF9mYl9pbmZvKS4KPiA+IAo+ID4gTG9va2luZyBhdCB0aGUg
aGlzdG9yeSwgdGhlcmUncyBiZWVuIGFuIGF0dGVtcHQgYXQgZHJvcHBpbmcgdGhpcyBmcm9tCj4g
PiBzdGFnaW5nIGluIDIwMTYsIGJ1dCB0aGF0IGhhZCB0byBiZSByZXZlcnRlZC4gU2luY2UgdGhl
biBub3QgcmVhbAo+ID4gZWZmb3J0IGV4Y2VwdCB0aGUgdXN1YWwgc3RyZWFtIG9mIHRyaXZpYWwg
cGF0Y2hlcywgYW5kIGZiZGV2IGhhcyBiZWVuCj4gPiBmb3JtYWxseSBjbG9zZWQgZm9yIGFueSBu
ZXcgaHcgc3VwcG9ydC4gVGltZSB0byB0cnkgYWdhaW4gYW5kIGRyb3AKPiA+IHRoaXM/Cj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
Pgo+ID4gQ2M6IEplbnMgRnJlZGVyaWNoIDxqZnJlZGVyaWNoQGdtYWlsLmNvbT4KPiA+IENjOiBE
YW5pZWwgRHJha2UgPGRzZEBsYXB0b3Aub3JnPgo+ID4gQ2M6IEpvbiBOZXR0bGV0b24gPGpvbi5u
ZXR0bGV0b25AZ21haWwuY29tPgo+IAo+IEhpIEdyZWcKPiAKPiBBZ2FpbiBnZXRfbWFpbmF0aW5l
cnMgZGlkbid0IHBpY2sgeW91IHVwIG9uIHRoaXMgc29tZWhvdyAoSSBtYW51YWxseSBhZGRlZAo+
IHlvdSBub3cgZm9yIHRoZSBuZXh0IHJvdW5kKS4gRG8geW91IHdhbnQgdG8gcGljayB0aGlzIHVw
IHRvIHN0YWdpbmcsIG9yCj4gYWNrIGZvciBtZXJnaW5nIHRocm91Z2ggZHJtL2ZiZGV2IGFzIHBh
cnQgb2YgdGhlIGxhcmdlciBmYmRldi9mYmNvbgo+IHJld29yaz8KPiAKPiBBbHNvLCBJIHRoaW5r
IHRpbWUgdG8gcmV0cnkgYW5kIGF0dGVtcHQgYXQgZHJvcHBpbmcgdGhpcyBpbW8gLi4uCgpBY2tl
ZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
