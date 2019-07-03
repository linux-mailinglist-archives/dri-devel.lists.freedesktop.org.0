Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3C5E844
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 17:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EE789415;
	Wed,  3 Jul 2019 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 829BB89415
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:59:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08E4B344;
 Wed,  3 Jul 2019 08:59:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDE723F718;
 Wed,  3 Jul 2019 08:59:17 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id A5A63682588; Wed,  3 Jul 2019 16:59:16 +0100 (BST)
Date: Wed, 3 Jul 2019 16:59:16 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/drm_debugfs_crc.c: Document that .verify_crc_source
 vfunc is required for enabling CRC support.
Message-ID: <20190703155916.GJ17204@e110455-lin.cambridge.arm.com>
References: <20190703150330.21992-1-Liviu.Dudau@arm.com>
 <20190703152120.GI15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703152120.GI15868@phenom.ffwll.local>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 DRI devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MjE6MjBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAwNDowMzozMFBNICswMTAwLCBMaXZpdSBE
dWRhdSB3cm90ZToKPiA+IGRybV9kZWJ1Z2ZzX2NydGNfY3JjX2FkZCgpIGZ1bmN0aW9uIGNoZWNr
cyB0aGF0IGJvdGggLnNldF9jcmNfc291cmNlIGFuZAo+ID4gLnZlcmlmeV9jcmNfc291cmNlIGhv
b2tzIGFyZSBwcm92aWRlZCBiZWZvcmUgZW5hYmxpbmcgZGVidWdmcyBzdXBwb3J0IGZvcgo+ID4g
cmVhZGluZyBwZXItZnJhbWUgQ1JDIGRhdGEuIE1ha2UgdGhhdCBleHBsaWNpdCBpbiB0aGUgZG9j
dW1lbnRhdGlvbi4KPiA+IAo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiA+IFNpZ25lZC1vZmYtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IAo+
IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAo+
IEkgdGhpbmsgd2UgaGF2ZSBzb21lIHJlZmFjdG9yaW5nIHJvb20gaGVyZSBpZiB3ZSBtYWtlIHZl
cmlmeV9jcmNfc291cmNlCj4gb3B0aW9uYWwgKGFuZCBvbmx5IGFsbG93ICJhdXRvIiBmb3IgdGhh
dCBjYXNlKS4gQnV0IHdvdWxkIG9ubHkgcmVtb3ZlIGxpa2UKPiAzLTQgaW1wbGVtZW50YXRpb25z
LCBzbyBJIGd1ZXNzIHRoYXQncyBmb3Igd2hlbiB0aGUgbmV4dCB0cml2aWFsIG9uZSBzaG93cwo+
IHVwLgoKSSdtIHByZXBhcmluZyBhIHBhdGNoIHRvIGFkZCBDUkMgc3VwcG9ydCBmb3IgS29tZWRh
LCBkb2VzIHRoaXMgbWVhbnMgSSBuZWVkCnRvIGxvb2sgYXQgdGhhdCByZWZhY3RvcmluZz8KCkJl
c3QgcmVnYXJkcywKTGl2aXUKCgo+IC1EYW5pZWwKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDYgKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYwo+ID4gaW5kZXggN2NhNDg2ZDc1MGU5Li42NjA0ZWQyMjMxNjAgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+ID4gQEAgLTY2LDkgKzY2LDkgQEAKPiA+ICAgKiB0
aGUgcmVwb3J0ZWQgQ1JDcyBvZiBmcmFtZXMgdGhhdCBzaG91bGQgaGF2ZSB0aGUgc2FtZSBjb250
ZW50cy4KPiA+ICAgKgo+ID4gICAqIE9uIHRoZSBkcml2ZXIgc2lkZSB0aGUgaW1wbGVtZW50YXRp
b24gZWZmb3J0IGlzIG1pbmltYWwsIGRyaXZlcnMgb25seSBuZWVkIHRvCj4gPiAtICogaW1wbGVt
ZW50ICZkcm1fY3J0Y19mdW5jcy5zZXRfY3JjX3NvdXJjZS4gVGhlIGRlYnVnZnMgZmlsZXMgYXJl
IGF1dG9tYXRpY2FsbHkKPiA+IC0gKiBzZXQgdXAgaWYgdGhhdCB2ZnVuYyBpcyBzZXQuIENSQyBz
YW1wbGVzIG5lZWQgdG8gYmUgY2FwdHVyZWQgaW4gdGhlIGRyaXZlciBieQo+ID4gLSAqIGNhbGxp
bmcgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpLgo+ID4gKyAqIGltcGxlbWVudCAmZHJtX2NydGNf
ZnVuY3Muc2V0X2NyY19zb3VyY2UgYW5kICZkcm1fY3J0Y19mdW5jcy52ZXJpZnlfY3JjX3NvdXJj
ZS4KPiA+ICsgKiBUaGUgZGVidWdmcyBmaWxlcyBhcmUgYXV0b21hdGljYWxseSBzZXQgdXAgaWYg
dGhvc2UgdmZ1bmNzIGFyZSBzZXQuIENSQyBzYW1wbGVzCj4gPiArICogbmVlZCB0byBiZSBjYXB0
dXJlZCBpbiB0aGUgZHJpdmVyIGJ5IGNhbGxpbmcgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpLgo+
ID4gICAqLwo+ID4gIAo+ID4gIHN0YXRpYyBpbnQgY3JjX2NvbnRyb2xfc2hvdyhzdHJ1Y3Qgc2Vx
X2ZpbGUgKm0sIHZvaWQgKmRhdGEpCj4gPiAtLSAKPiA+IDIuMjEuMAo+ID4gCj4gCj4gLS0gCj4g
RGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxp
a2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcg
bWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o
44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
