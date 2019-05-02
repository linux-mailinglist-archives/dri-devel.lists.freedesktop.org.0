Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0F117EA
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 13:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F68689402;
	Thu,  2 May 2019 11:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD30489402
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 11:05:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4391720656;
 Thu,  2 May 2019 11:05:15 +0000 (UTC)
Date: Thu, 2 May 2019 13:05:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190502110513.GF12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502105053.GA12416@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556795115;
 bh=g52VJv58ny9inOghbRxttm2JEOFg/YzNJiIi1xgevz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=srcuUUfJlFr42/9IsMaL5I/QT1gc7U4FMTE1sI3n6k8wik0XOQdtZ3s/SmQvEj2j3
 nem5uAwCIgmlBdJqoOCKPYyD7+0J7m4Es/11yPHJKGUPXjz6aLsDABY2+K1HZTiH2j
 NwAGsAXg2Nr8uriB/0jqHcN2lzmFJtLPXJT3z5pc=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, richard@nod.at,
 sboyd@kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTI6NTA6NTNQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAwNDowMTowOVBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dp
bnMgd3JvdGU6Cj4gPiAjIyBUTERSCj4gPiAKPiA+IEkgcmViYXNlZCB0aGUgbGFzdCBwYXRjaHNl
dCBvbiA1LjEtcmM3IGluIGhvcGVzIHRoYXQgd2UgY2FuIGdldCB0aGlzIGluCj4gPiA1LjIuCj4g
Cj4gVGhhdCBtaWdodCBiZSBydXNoaW5nIGl0LCBub3JtYWxseSB0cmVlcyBhcmUgYWxyZWFkeSBj
bG9zZWQgbm93IGZvcgo+IDUuMi1yYzEgaWYgNS4xLWZpbmFsIGNvbWVzIG91dCB0aGlzIFN1bmRh
eS4KPiAKPiA+IFNodWFoLCBJIHRoaW5rIHlvdSwgR3JlZyBLSCwgYW5kIG15c2VsZiB0YWxrZWQg
b2ZmIHRocmVhZCwgYW5kIHdlIGFncmVlZAo+ID4gd2Ugd291bGQgbWVyZ2UgdGhyb3VnaCB5b3Vy
IHRyZWUgd2hlbiB0aGUgdGltZSBjYW1lPyBBbSBJIHJlbWVtYmVyaW5nCj4gPiBjb3JyZWN0bHk/
Cj4gCj4gTm8gb2JqZWN0aW9uIGZyb20gbWUuCj4gCj4gTGV0IG1lIGdvIHJldmlldyB0aGUgbGF0
ZXN0IHJvdW5kIG9mIHBhdGNoZXMgbm93LgoKT3ZlcmFsbCwgbG9va3MgZ29vZCB0byBtZSwgYW5k
IHByb3ZpZGVzIGEgZnJhbWV3b3JrIHdlIGNhbiBidWlsZCBvbi4KSSdtIGEgYml0IGFubm95ZWQg
YXQgdGhlIHJlbGlhbmNlIG9uIHVtbCBhdCB0aGUgbW9tZW50LCBidXQgd2UgY2FuIHdvcmsKb24g
dGhhdCBpbiB0aGUgZnV0dXJlIDopCgpUaGFua3MgZm9yIHN0aWNraW5nIHdpdGggdGhpcywgbm93
IHRoZSByZWFsIHdvcmsgYmVnaW5zLi4uCgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
