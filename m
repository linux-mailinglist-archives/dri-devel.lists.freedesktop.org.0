Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BDD45CB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A7D6EC68;
	Fri, 11 Oct 2019 16:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 118DB6EC61
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 16:10:12 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 1EE8D80EA;
 Fri, 11 Oct 2019 16:10:45 +0000 (UTC)
Date: Fri, 11 Oct 2019 09:10:08 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191011161008.GY5610@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
 <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
 <20191010132407.GS5610@atomide.com>
 <d7cb0f2a-1645-29ff-aaf2-2ec5188dbc24@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7cb0f2a-1645-29ff-aaf2-2ec5188dbc24@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 11 Oct 2019 16:52:25 +0000
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkxMDExIDEwOjI1XToK
PiBPbiAxMC8xMC8yMDE5IDE2OjI0LCBUb255IExpbmRncmVuIHdyb3RlOgo+IAo+ID4gSG1tIHNv
IHdoYXQgcmVnaXN0ZXIgZG9lcyB0aGlzIGNsb2NrIGFjdHVhbGx5IGNoYW5nZT8KPiA+IAo+ID4g
SSdtIHNlZWluZyBhbiBpbmNyZWFzZSBvZiBmZXcgdGVucyBvZiBleHRyYSBtVywgd2hpY2ggbWVh
bnMgYXQKPiA+IGxlYXN0IG9uZSBkYXkgb2Ygc3RhbmRieSB0aW1lIGxlc3MgZm9yIG1lIDopIEl0
IGRvZXMgbm90IGhhcHBlbgo+ID4gYWx3YXlzLCBtYXliZSBoYWxmIG9mIHRoZSB0aW1lLgo+IAo+
IEkgaGF2ZSBubyBpZGVhIHdoeSB0aGlzIHdvdWxkIGFmZmVjdCBwb3dlciBjb25zdW1wdGlvbi4g
QXMgZmFyIGFzIEkgY2FuCj4gdW5kZXJzdGFuZCwgdGhlIGJpdHMgd3JpdHRlbiBoZXJlIGFyZSBh
IGNsayBkaXZpZGVyIE1DTEsuIEkgZG9uJ3Qgc2VlIHdoeQo+IHRoYXQgd291bGQgYWZmZWN0LgoK
WWVhaCB5b3UncmUgcmlnaHQsIGFuZCBJIGp1c3QgZ290IGx1Y2t5IGluaXRpYWxseS4KCkkgaGF2
ZSBzZWVuIHRoZSBwb3dlciBjb25zdW1wdGlvbiBzdGF5IGhpZ2hlciBhbHJlYWR5IHdpdGgKdGhl
IHBhdGNoIGFwcGxpZWQuIFRoZSBjbG9ja3Mgc2VlbSBqdXN0IGZpbmUuCgo+IE1heWJlIEp5cmkg
b3IgUGV0ZXIgaGFzIGFuIGlkZWEsIEkgaGF2ZSBuZXZlciBsb29rZWQgYXQgdGhlIEhETUkgYXVk
aW8gc2lkZS4KCkknbGwgdHJ5IGR1bXBpbmcgb3V0IHRoZSBoZG1pIHJlZ2lzdGVycyBiZWZvcmUg
YW5kIGFmdGVyCndoZW4gSSBnZXQgYSBjaGFuY2UuCgpSZWdhcmRzLAoKVG9ueQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
