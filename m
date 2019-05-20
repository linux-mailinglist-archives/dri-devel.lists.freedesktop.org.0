Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C971223E0D
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 19:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B5A8925F;
	Mon, 20 May 2019 17:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4128923C;
 Mon, 20 May 2019 17:08:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 640F720087;
 Mon, 20 May 2019 19:08:22 +0200 (CEST)
Date: Mon, 20 May 2019 19:08:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/33] fbcon: call fbcon_fb_(un)registered directly
Message-ID: <20190520170820.GA27230@ravnborg.org>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520082216.26273-11-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=QyXUC8HyAAAA:8
 a=hD80L64hAAAA:8 a=20KFwNOVAAAA:8 a=ag1SF4gXAAAA:8 a=SJz97ENfAAAA:8
 a=bDN84i_9AAAA:8 a=VwQbUJbxAAAA:8 a=AUPil0-6CJQSJ-L3P-oA:9
 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=vFet0B0WnEQeilDPIY6i:22
 a=J2PsDwZO0S0EpbpLmD-j:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKV2hpbGUgYnJvd3NpbmcgdGhpcyBuaWNlIHBhdGNoIHNlcmllcyBJIHN0dW1i
bGVkIHVwb24gYSBkZXRhaWwuCgpPbiBNb24sIE1heSAyMCwgMjAxOSBhdCAxMDoyMTo1M0FNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFdpdGgKPiAKPiBjb21taXQgNjEwNGMzNzA5NGU3
MjlmM2Q0Y2U2NTc5NzAwMjExMjczNWQ0OWNkMQo+IEF1dGhvcjogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KPiBEYXRlOiAgIFR1ZSBBdWcgMSAxNzozMjowNyAyMDE3ICsw
MjAwCj4gCj4gICAgIGZiY29uOiBNYWtlIGZiY29uIGEgYnVpbHQtdGltZSBkZXBlbmN5IGZvciBm
YmRldgo+IAo+IHdlIGhhdmUgYSBzdGF0aWMgZGVwZW5kZW5jeSBiZXR3ZWVuIGZiY29uIGFuZCBm
YmRldiwgYW5kIHdlIGNhbgo+IHJlcGxhY2UgdGhlIGluZGlyZWN0aW9uIHRocm91Z2ggdGhlIG5v
dGlmaWVyIGNoYWluIHdpdGggYSBmdW5jdGlvbgo+IGNhbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KPiBDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
PiBDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1haWwuY29tPgo+IENjOiBQZXRlciBSb3NpbiA8
cGVkYUBheGVudGlhLnNlPgo+IENjOiAiTWljaGHFgiBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJl
cmUucW1xbS5wbD4KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4gQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNvbT4KPiBDYzogbGludXgt
ZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
ZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaAo+IGluZGV4IGY1MmVmMGFkNjc4MS4uNzAxYWJhZjc5
Yzg3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvZmIuaAo+IEBAIC0xMzYsMTAgKzEzNiw2IEBAIHN0cnVjdCBmYl9jdXJzb3JfdXNlciB7Cj4g
ICNkZWZpbmUgRkJfRVZFTlRfUkVTVU1FCQkJMHgwMwo+ICAvKiAgICAgIEFuIGVudHJ5IGZyb20g
dGhlIG1vZGVsaXN0IHdhcyByZW1vdmVkICovCj4gICNkZWZpbmUgRkJfRVZFTlRfTU9ERV9ERUxF
VEUgICAgICAgICAgICAweDA0Cj4gLS8qICAgICAgQSBkcml2ZXIgcmVnaXN0ZXJlZCBpdHNlbGYg
Ki8KPiAtI2RlZmluZSBGQl9FVkVOVF9GQl9SRUdJU1RFUkVEICAgICAgICAgIDB4MDUKPiAtLyog
ICAgICBBIGRyaXZlciB1bnJlZ2lzdGVyZWQgaXRzZWxmICovCj4gLSNkZWZpbmUgRkJfRVZFTlRf
RkJfVU5SRUdJU1RFUkVEICAgICAgICAweDA2Cj4gIC8qICAgICAgQ09OU09MRS1TUEVDSUZJQzog
Z2V0IGNvbnNvbGUgdG8gZnJhbWVidWZmZXIgbWFwcGluZyAqLwo+ICAjZGVmaW5lIEZCX0VWRU5U
X0dFVF9DT05TT0xFX01BUCAgICAgICAgMHgwNwo+ICAvKiAgICAgIENPTlNPTEUtU1BFQ0lGSUM6
IHNldCBjb25zb2xlIHRvIGZyYW1lYnVmZmVyIG1hcHBpbmcgKi8KClRoaXMgYnJlYWtzIGJ1aWxk
IG9mIGFyY2gvYXJtL21hY2gtcHhhL2FtMjAwZXBkLmMgdGhhdHMgdXNlcwpGQl9FVkVOVF9GQl8q
UkVHSVNURVJFRDoKCgogICAgICAgaWYgKGV2ZW50ID09IEZCX0VWRU5UX0ZCX1JFR0lTVEVSRUQp
CiAgICAgICAgICAgICAgICByZXR1cm4gYW0yMDBfc2hhcmVfdmlkZW9fbWVtKGluZm8pOwogICAg
ICAgIGVsc2UgaWYgKGV2ZW50ID09IEZCX0VWRU5UX0ZCX1VOUkVHSVNURVJFRCkKICAgICAgICAg
ICAgICAgIHJldHVybiBhbTIwMF91bnNoYXJlX3ZpZGVvX21lbShpbmZvKTsKCgpGb3VuZCB3aGls
ZSBncmVwcGluZyBmb3IgIkZCX0VWRU5UIiBzbyB0aGlzIGlzIG5vdCBhIGJ1aWxkCmVycm9yIEkg
dHJpZ2dlcmVkLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
