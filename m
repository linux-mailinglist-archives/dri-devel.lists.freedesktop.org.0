Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129016478E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD9589F41;
	Wed, 10 Jul 2019 13:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9D89F41
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 13:51:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7D4A9803C3;
 Wed, 10 Jul 2019 15:51:08 +0200 (CEST)
Date: Wed, 10 Jul 2019 15:51:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Josef Lusticky <josef@lusticky.cz>
Subject: Re: [PATCH v2 0/2] Add DRM ILI9341 parallel RGB panel driver
Message-ID: <20190710135107.GD11791@ravnborg.org>
References: <20190304125033.28841-1-josef@lusticky.cz>
 <20190708145618.26031-1-josef@lusticky.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708145618.26031-1-josef@lusticky.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=-lLDmteVhdPe8IppZgUA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9zZWYuCgpPbiBNb24sIEp1bCAwOCwgMjAxOSBhdCAwNDo1NjoxNlBNICswMjAwLCBKb3Nl
ZiBMdXN0aWNreSB3cm90ZToKPiBIaSwKPiBUaGlzIGlzIHRoZSB2MiBvZiB0aGUgcGF0Y2gtc2V0
IHdoaWNoIGFkZHMgc3VwcG9ydCBmb3IKPiBJbGl0ZWsgSUxJOTM0MSBwYXJhbGxlbCBSR0IgcGFu
ZWxzLgo+IAo+IFRoZSBJTEk5MzQxIGNoaXAgc3VwcG9ydHMgYm90aCBwYXJhbGxlbCBSR0IgaW5w
dXQgbW9kZSBhbmQgU1BJIGlucHV0IG1vZGUuCj4gVGhpcyBkcml2ZXIgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgcGFyYWxsZWwgUkdCIGlucHV0IG1vZGUuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAq
IERldmljZS10cmVlIGJpbmRpbmdzIGluIG9uZSBmaWxlCj4gKiBEL0MgR1BJTyBwaW4gaXMgb3B0
aW9uYWwKPiAqIG1pcGlfZGJpXyogZnVuY3Rpb25zIHVzZWQgdG8gaW5pdGlhbGl6ZSB0aGUgZGlz
cGxheQo+ICogZW50cnkgaW4gTUFJTlRBSU5FUlMgc29ydGVkIGFscGhhYmV0aWNhbGx5Cj4gKiBN
YWtlZmlsZSwgS2NvbmZpZzogRFJNX1BBTkVMX0lMSVRFS19JTDkzNDEgcmVuYW1lZCB0byBEUk1f
UEFORUxfSUxJVEVLX0lMSTkzNDEKPiAqIEtjb25maWc6IGRlcGVuZCBvbiBCQUNLTElHSFRfQ0xB
U1NfREVWSUNFCj4gKiBLY29uZmlnOiBzZWxlY3QgVElOWURSTV9NSVBJX0RCSQo+ICogb3JkZXIg
b2YgaW5jbHVkZSBmaWxlcyBjaGFuZ2VkCj4gKiBkcm1fbW9kZV9kdXBsaWNhdGUgY2hlY2tlZCBm
b3IgZmFpbHVyZQoKVGhhbmtzIGZvciBkb2luZyBhbGwgdGhpcy4KClNvbWUgbWlub3IgZGV0YWls
cy4gUGxlYXNlIGZpeCBhbmQgcmVzZW5kIHNvIHdlIGNhbiB0aGVzZSBwYXRjaGVzCmFwcGxpZWQu
ClBsZWFzZSBhbHNvIHJlLWNoZWNrIGlmIHlvdSBmb3Jnb3QgYW4gYWNrIGZyb20gUm9iIG9uIHRo
ZSBiaW5kaW5ncyBmaWxlLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
