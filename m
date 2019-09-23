Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE6BC246
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE276E9FE;
	Tue, 24 Sep 2019 07:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5BF6E93D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:03:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 08:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; d="scan'208";a="203140575"
Received: from kuha.fi.intel.com ([10.237.72.53])
 by fmsmga001.fm.intel.com with SMTP; 23 Sep 2019 08:03:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 23 Sep 2019 18:03:33 +0300
Date: Mon, 23 Sep 2019 18:03:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20190923150333.GD16243@kuha.fi.intel.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-7-dmitry.torokhov@gmail.com>
 <20190920231228.GH12672@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920231228.GH12672@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-gpio@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgMjEsIDIwMTkgYXQgMDI6MTI6MjhBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBEbWl0cnksCj4gCj4gKENDJ2luZyBIZWlra2kgYXMgdGhlIG9yaWdpbmFs
IGF1dGhvciBvZiBzb2Z0d2FyZSBub2RlcyBzdXBwb3J0KQo+IAo+IFRoYW5rIHlvdSBmb3IgdGhl
IHBhdGNoLgo+IAo+IE9uIFdlZCwgU2VwIDExLCAyMDE5IGF0IDEyOjUyOjEwQU0gLTA3MDAsIERt
aXRyeSBUb3Jva2hvdiB3cm90ZToKPiA+IEluc3RlYWQgb2YgZndub2RlX2dldF9uYW1lZF9ncGlv
ZCgpIHRoYXQgSSBwbGFuIHRvIGhpZGUgYXdheSwgbGV0J3MgdXNlCj4gPiB0aGUgbmV3IGZ3bm9k
ZV9ncGlvZF9nZXRfaW5kZXgoKSB0aGF0IG1pbWljcyBncGlvZF9nZXRfaW5kZXgoKSwgYml0Cj4g
Cj4gcy9iaXQvYnV0Lwo+IAo+ID4gd29ya3Mgd2l0aCBhcmJpdHJhcnkgZmlybXdhcmUgbm9kZS4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZA
Z21haWwuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gCj4gT24gYSBzaWRlIG5vdGUsIGFzIEknbSBub3Qg
dmVyeSBmYW1pbGlhciB3aXRoIHNvZnR3YXJlIG5vZGVzLCBJIHRyaWVkIHRvCj4gc2VlIGhvdyB0
aGV5IGFyZSB0byBiZSB1c2VkLCBhbmQgaXQgc2VlbXMgdGhleSBhcmUgY29tcGxldGVseQo+IHVu
ZG9jdW1lbnRlZCA6LSggSGVpa2tpLCBpcyB0aGlzIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlIGZp
eGVkID8KCk9LLiBJJ2xsIHN0YXJ0IHdyaXRpbmcgQVBJIGRvY3VtZW50YXRpb24gZm9yIGl0LgoK
dGhhbmtzLAoKLS0gCmhlaWtraQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
