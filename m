Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97B5AF57
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 10:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6190389A32;
	Sun, 30 Jun 2019 08:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50289A32
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 08:03:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3CCF820063;
 Sun, 30 Jun 2019 10:03:16 +0200 (CEST)
Date: Sun, 30 Jun 2019 10:03:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/4] drm/mga: drop dependency on drm_os_linux.h
Message-ID: <20190630080309.GA2600@ravnborg.org>
References: <20190623103542.30697-1-sam@ravnborg.org>
 <20190623103542.30697-2-sam@ravnborg.org>
 <20190629175958.GA18538@ravnborg.org>
 <eba80da4-8fe4-394e-426d-8085d5ae9442@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eba80da4-8fe4-394e-426d-8085d5ae9442@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Un1zg181cmD56meLzUwA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKPiA+PiB2MjoKPiA+PiAtIGZpeGVkIHRpbWVvdXQgdG8gMzAwMCBtc2VjIChv
cmlnaW5hbCB2YWx1ZSB3YXMgMyAqIEh6KQo+ID4+IC0gZHJvcCB1bnVzZWQgcmV0dXJuIHZhbHVl
IGZyb20gbWdhX2RyaXZlcl9mZW5jZV93YWl0KCkKPiA+IAo+ID4gVGhvbWFzIGdpdmUgaGlzIGFj
ayBvbiB2MSBvZiB0aGlzIHBhdGNoLgo+ID4gQnV0IEkgYW0gcmVsdWN0YW50IHRvIGFwcGx5IGl0
IHVudGlsIHNvbWVvbmUgaGFzIGxvb2tlZCBhdCB0aGlzIHZlcnNpb24uCj4gPiBUaGUgbWFpbiBk
aWZmZXJlbmNlIGlzIGEgcyBkZXNjcmliZWQgYWJvdmUsIHdoZXJlIHRoZSBjaGFuZ2UgdG8gMzAw
MAo+ID4gbXNlYyB3YXMgYSBidWcgaW4gdjEuCj4gPiAKPiA+IEFueSBmZWVkYmFjaz8KPiAKPiBB
Y2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gCj4gYXMg
d2VsbC4gVGhhbmtzIGZvciBzcG90dGluZyB0aGUgYnVnLgpUaGFua3MuCkFsbCBmb3VyIHBhdGNo
ZXMgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgpGaXhlZCB0d28gdHJpdmlhbCBjb25mbGljdHMg
aW4gbWdhZzIwMCB3aGlsZSBhcHBseWluZy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
