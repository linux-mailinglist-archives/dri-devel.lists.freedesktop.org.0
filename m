Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8387716F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 20:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21246EE23;
	Fri, 26 Jul 2019 18:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604936EE23
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 18:43:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3F74320117;
 Fri, 26 Jul 2019 20:43:08 +0200 (CEST)
Date: Fri, 26 Jul 2019 20:43:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/4] drm/panel: jh057n00900: Move dsi init sequence to
 prepare
Message-ID: <20190726184306.GA14981@ravnborg.org>
References: <cover.1564146727.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1564146727.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8
 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8 a=D0Xkq8Vs1On2DmSM1iMA:9
 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8uCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwMzoxNDozNVBNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiAKPiBJZiB0aGUgcGFuZWwgaXMgd3JhcHBlZCBpbiBhIHBhbmVs
X2JyaWRnZSBpdCBnZXRzIHByZXBhcigpZWQgYmVmb3JlIHRoZQo+IHVwc3RyZWFtIERTSSBicmlk
Z2Ugd2hpY2ggY2FuIGNhdXNlIGhhbmdzIChlLmcuIHdpdGggaW14LW53bCBzaW5jZSBjbG9ja3MK
PiBhcmUgbm90IGVuYWJsZWQgeWV0KS4gVG8gYXZvaWQgdGhpcyBtb3ZlIHRoZSBwYW5lbCdzIGZp
cnN0IERTSSBhY2Nlc3MgdG8KPiBlbmFibGUoKSBzbyB0aGUgdXBzdHJlYW0gYnJpZGdlIGNhbiBw
cmVwYXJlIHRoZSBEU0kgaG9zdCBjb250cm9sbGVyIGluCj4gaXQncyBwcmVfZW5hYmxlKCkuCj4g
Cj4gVGhlIHNlY29uZCBwYXRjaCBtYWtlcyB0aGUgZGlzYWJsZSgpIGNhbGwgc3ltbWV0cmljIHRv
IHRoZSBhYm92ZSBhbmQgdGhlIHRoaXJkCj4gb25lIGp1c3QgZWFzZXMgZGVidWdnaW5nLgo+IAo+
IENoYW5nZXMgZnJvbSB2MToKPiAqIEFzIHBlciByZXZpZXcgY29tbWVudHMgYnkgU2FtIFJhdm5i
b3JnCj4gICAqIElnbm9yZSBmYWlsdXJlcyB0byBkaXNhYmxlIHRoZSBiYWNrbGlnaHQgaW4gamgw
NTduX2Rpc2FibGUoKQo+ICAgKiBBZGQgJ2RybS9wYW5lbDogamgwNTduMDA5MDA6IFVzZSBkcm1f
cGFuZWxfe3VucHJlcGFyZSxkaXNhYmxlfSBjb25zaXN0ZW50bHknCj4gKiBDb2xsZWN0ZWQgUmV2
aWV3ZWQtQnk6IFRoYW5rcyBTYW0hCj4gCj4gVG86ICJHdWlkbyBHw7xudGhlciIgPGFneEBzaWd4
Y3B1Lm9yZz4sUHVyaXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT4sVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4sU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPixEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+LERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4sZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyxsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCj4gCj4gCj4gR3VpZG8gR8O8bnRoZXIgKDQpOgo+ICAgZHJtL3BhbmVs
OiBqaDA1N24wMDkwMDogTW92ZSBwYW5lbCBEU0kgaW5pdCB0byBlbmFibGUoKQo+ICAgZHJtL3Bh
bmVsOiBqaDA1N24wMDkwMDogTW92ZSBtaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmIHRvIGRp
c2FibGUoKQo+ICAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogUHJpbnQgZXJyb3IgY29kZSBvbiBh
bGwgRFJNX0RFVl9FUlJPUigpcwo+ICAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogVXNlIGRybV9w
YW5lbF97dW5wcmVwYXJlLGRpc2FibGV9IGNvbnNpc3RlbnRseQoKTG9va3MgZ29vZC4gU2VyaWVz
IGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCBhbmQgcHVzaGVkIG91dC4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
