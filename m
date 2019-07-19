Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1716EC0B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 23:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB856E867;
	Fri, 19 Jul 2019 21:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0476E878;
 Fri, 19 Jul 2019 21:26:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D2F5E20085;
 Fri, 19 Jul 2019 23:26:52 +0200 (CEST)
Date: Fri, 19 Jul 2019 23:26:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 0/11] drm: header maintenance
Message-ID: <20190719212651.GA25918@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=MfMJ2rOYQePwhqdKWdMA:9 a=wPNLvfGTeEIA:10
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTQ6NTZQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEZpcnN0IHBhdGNoIGZyb20gSmFuaSBmaXhlcyBzbyBkcm1fcHJpbnQuaCBpcyBzZWxm
LWNvbnRhaW5lZC4KPiBOZXh0IHR3byBwYXRjaGVzIGFyZSB0cml2aWFsIHJlbW92YWwgb2YgdWFw
aSBkZXBlbmRlbmNpZXMuCj4gCj4gYXRpX3BjaWdhcnQgaXMgZml4ZWQgdG8gZHJvcCB1c2Ugb2Yg
ZHJtX29zX2xpbnV4LmgKPiAKPiBkcm1fdmJsYW5rIGlzIGxpa2V3aXNlIGZpeGVkIHRvIGRyb3Ag
dXNlIG9mIGRybV9vc19saW51eC5oCj4gVGhpcyB3YXMgYSBub24tdHJpdmlhbCBjb252ZXJzaW9u
LCAqcmV2aWV3IHJlcXVlc3RlZCEqCj4gCj4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIGFyZSBwcmVw
YXJhdGlvbiBmb3IgYW5kIHJlbW92YWwgb2YKPiB1YXBpL2RybS9kcm1oIGZyb20gZHJtX2ZpbGUu
aC4KPiBUaGVyZSB3ZXJlIGEgZmV3IGZpbGVzIHdoZXJlIHdlIGhhZCB0byBwdXNoIGluY2x1ZGUK
PiBvZiBkcm0vZHJtLmggb3V0IHRvIHRvIGhhdmUgYSBjbGVhbiBidWlsZC4KPiAKPiBDSyBIdSAt
IHBsZWFzZSBsZXQgbWUgYXBwbHkgdGhlIG1lZGlhdGVrIHBhdGNoIHRvCj4gZHJtLW1pc2MtbmV4
dCwgYXMgaXQgaXMgcmVxdWlyZWQgZm9yIHRoZSBmaW5hbCBwYXRjaC4KPiBPciBwdXNoIGl0IHRv
IGRybS1taXNjLW5leHQgeW91cnNlbGYuCj4gCj4gCVNhbQo+IAo+IEphbmkgTmlrdWxhICgxKToK
PiAgICAgICBkcm0vcGFuZWw6IG1ha2UgZHJtX3BhbmVsLmggc2VsZi1jb250YWluZWQKPiAKPiBT
YW0gUmF2bmJvcmcgKDEwKToKPiAgICAgICBkcm06IGRyb3AgdWFwaSBkZXBlbmRlbmN5IGZyb20g
ZHJtX3ByaW50LmgKPiAgICAgICBkcm06IGRyb3AgdWFwaSBkZXBlbmRlbmN5IGZyb20gZHJtX3Zi
bGFuay5oCj4gICAgICAgZHJtL2F0aV9wY2lnYXJ0OiBkcm9wIGRlcGVuZGVuY3kgb24gZHJtX29z
X2xpbnV4LmgKPiAgICAgICBkcm0vdmJsYW5rOiBkcm9wIHVzZSBvZiBEUk1fV0FJVF9PTigpCj4g
ICAgICAgZHJtOiBkaXJlY3QgaW5jbHVkZSBvZiBkcm0uaCBpbiBkcm1fZ2VtLmMKPiAgICAgICBk
cm06IGRpcmVjdCBpbmNsdWRlIG9mIGRybS5oIGluIGRybV9nZW1fc2htZW1faGVscGVyLmMKPiAg
ICAgICBkcm06IGRpcmVjdCBpbmNsdWRlIG9mIGRybS5oIGluIGRybV9wcmltZS5jCj4gICAgICAg
ZHJtOiBkaXJlY3QgaW5jbHVkZSBvZiBkcm0uaCBpbiBkcm1fc3luY29iai5jCj4gICAgICAgZHJt
L21lZGlhdGVrOiBkaXJlY3QgaW5jbHVkZSBvZiBkcm0uaCBpbiBtdGtfZHJtX2dlbS5jCj4gICAg
ICAgZHJtOiBkcm9wIHVhcGkgZGVwZW5kZW5jeSBmcm9tIGRybV9maWxlLmgKCkFkZGVkIHJlbGV2
YW50IGFja3MgYW5kIHB1c2hlZCBmb2xsb3dpbmcgcGF0Y2hlcyB0byBkcm0tbWlzYy1uZXh0Ogog
ICAgICAgZHJtL3BhbmVsOiBtYWtlIGRybV9wYW5lbC5oIHNlbGYtY29udGFpbmVkCiAgICAgICBk
cm06IGRyb3AgdWFwaSBkZXBlbmRlbmN5IGZyb20gZHJtX3ZibGFuay5oCiAgICAgICBkcm0vYXRp
X3BjaWdhcnQ6IGRyb3AgZGVwZW5kZW5jeSBvbiBkcm1fb3NfbGludXguaAogICAgICAgZHJtOiBk
aXJlY3QgaW5jbHVkZSBvZiBkcm0uaCBpbiBkcm1fZ2VtLmMKICAgICAgIGRybTogZGlyZWN0IGlu
Y2x1ZGUgb2YgZHJtLmggaW4gZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwogICAgICAgZHJtOiBkaXJl
Y3QgaW5jbHVkZSBvZiBkcm0uaCBpbiBkcm1fcHJpbWUuYwogICAgICAgZHJtOiBkaXJlY3QgaW5j
bHVkZSBvZiBkcm0uaCBpbiBkcm1fc3luY29iai5jCiAgICAgICBkcm0vbWVkaWF0ZWs6IGRpcmVj
dCBpbmNsdWRlIG9mIGRybS5oIGluIG10a19kcm1fZ2VtLmMKCkZvbGxvd2luZyBwYXRjaGVzIHdh
cyBkcm9wcGVkOgogICAgICAgZHJtOiBkcm9wIHVhcGkgZGVwZW5kZW5jeSBmcm9tIGRybV9wcmlu
dC5oCiAgICAgICAtIFRoZXJlIHdhcyBub3QgYSBjbGVhciBjb25zZW5zdXMgd2hhdCB0byBkbyBo
ZXJlLCBhbmQgdGhlIHBhdGNoCgkgYnJva2Ugb25lIHdheSB0byB1c2UgdGhlIERSTV8oUFJJTlQp
IG1hY3Jvcy4KICAgICAgIC0gSSBkaWQgbm90IGhhdmUgdGhlIHRpbWUvZW5lZ3kgdG8gc3RhcnQg
YSBsb2dnaW5nIGRlYmF0ZS4KICAgICAgICAgVGhlcmUgaXMgdG9vIG11Y2ggdGhhdCBjb3VsZCBi
ZSBkb25lIGFuZCBpdCBpcyBub3QgdGhlIHJpZ2h0CgkgdGltZSBmb3IgbWUgdG8gbG9vayBpbnRv
IHRoZSBwb3NzaWJpbGl0aWVzLgoKICAgICAgIGRybTogZHJvcCB1YXBpIGRlcGVuZGVuY3kgZnJv
bSBkcm1fZmlsZS5oCiAgICAgICAtIFRoZXJlIHdlcmUgcmVsZXZhbnQgcHVzaCBiYWNrIGZyb20g
bG9vc2luZyB0aGUgaW5mb3JtYXRpb24KICAgICAgICAgdGhhdCBhIHVhcGkgdHlwZSB3YXMgdXNl
ZCB0byByZXByZXNlbnQgJ21hZ2ljJwoKRm9sbG93aW5nIHBhdGNoIGlzIHdvcmtlZCBvbjoKICAg
ICAgIGRybS92Ymxhbms6IGRyb3AgdXNlIG9mIERSTV9XQUlUX09OKCkKICAgICAgIC0gR290IGV4
Y2VsbGVudCBmZWVkYmFjayBmcm9tIE1pY2hlbCBEw6RuemVyIGFuZCBEYW5pZWwgVmV0dGVyLgog
ICAgICAgLSBBbiB1cGRhdGVkIHZlcnNpb24gd2lsbCBiZSBwb3N0ZWQgd2hlbiBJIGhhdmUgdGVz
dGVkIGl0CgkgYXQgbXkgbG9jYWwgc2V0dXAKCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
