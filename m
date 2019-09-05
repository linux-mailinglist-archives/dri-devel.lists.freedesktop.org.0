Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA13FA9E61
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0E1896E5;
	Thu,  5 Sep 2019 09:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59B189598
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:29:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E9E35300BE7F;
 Thu,  5 Sep 2019 09:29:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B025194B9;
 Thu,  5 Sep 2019 09:29:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 59C9631E8D; Thu,  5 Sep 2019 11:29:40 +0200 (CEST)
Date: Thu, 5 Sep 2019 11:29:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
Message-ID: <20190905092940.pi2u5755rys6tkgz@sirius.home.kraxel.org>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
 <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
 <b3a103fc-dc91-9a4a-4e64-d654b8d0611a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3a103fc-dc91-9a4a-4e64-d654b8d0611a@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 05 Sep 2019 09:29:42 +0000 (UTC)
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
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTA6MTk6NDBBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwNS4wOS4xOSB1bSAwOTo1NiBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gPiBPbiBUaHUsIFNlcCA1LCAyMDE5IGF0IDk6MDEgQU0gR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gICBIaSwKPiA+Pgo+ID4+PiAtIGlt
byB3ZSBzaG91bGQgZml4IHRoaXMgYnkgdXNpbmcgdGhlIGlvX21hcHBpbmcgc3R1ZmYsIHRoYXQg
YXZvaWRzCj4gPj4+IHRoZSBvdmVyaGVhZCBvZiByZXBlYXRlZCBwYXQgY2hlY2tzIGZvciBtYXAv
dW5tYXAuCj4gPj4KPiA+PiBBbm90aGVyIGlkZWE6ICBJSVJDIHR0bSBoYXMgYSBtb3ZlX25vdGlm
eSBjYWxsYmFjay4gIFNvIHdlIGNvdWxkIHNpbXBseQo+ID4+IGtlZXAgbWFwcGluZ3MgYWN0aXZl
IGV2ZW4gd2hlbiB0aGUgcmVmY291bnQgZ29lcyBkb3duIHRvIHplcm8uICBUaGVuIGRvCj4gPj4g
dGhlIGFjdHVhbCB1bm1hcCBlaXRoZXIgaW4gdGhlIG1vdmVfbm90aWZ5IG9yIGluIHRoZSBkZXN0
cm95IGNhbGxiYWNrLgo+ID4gCj4gPiBZZWFoIHRoYXQgc2hvdWxkIGJlIGEgcmVhbGx5IGNsZWFu
IHNvbHV0aW9uLCBhbmQgb25seSBuZWVkcyBjaGFuZ2VzIGluCj4gPiB0aGUgdnJhbSBoZWxwZXJz
LiBXaGljaCBpcyBuaWNlLCBtb3JlIGNvbW1vbiBjb2RlIQo+IAo+IEJ1dCB0aGUgY29uc29sZSdz
IEJPIGlzIHNwZWNpYWwgd3J0IHRvIG1hcHBpbmcuIFB1dHRpbmcgc3BlY2lhbCBjb2RlIGZvcgo+
ICBjb25zb2xlIGhhbmRsaW5nIGludG8gdnJhbSBoZWxwZXJzIGRvZXNuJ3Qgc2VlbSByaWdodC4K
CkkgaGF2ZSBubyBzcGVjaWFsIGhhbmRsaW5nIGluIG1pbmQuICBJIHRoaW5rIHdlIGNhbiBzaW1w
bHkgZG8gdGhhdCBmb3IKYWxsIGdlbSBvYmplY3RzLCBubyBtYXR0ZXIgd2hlbmV2ZXIgdGhleSBh
cmUgY3JlYXRlZCBieSBmYmNvbiBvcgp1c2Vyc3BhY2UgKHdheWxhbmQveG9yZy93aGF0ZXZlciku
ICB2bWFwIHdpbGwgY3JlYXRlIGEgbWFwcGluZyAob3IKaW5jcmVhc2UgdGhlIHJlZmVyZW5jZSBj
b3VudCkuICB2dW5tYXAgZGVjcmVhc2VzIHRoZSByZWZlcmVuY2UgY291bnQsCndoZW4gaXQgZ29l
cyBkb3duIHRvIHplcm8gdW5waW4gaXQgYnV0IGtlZXAgdGhlIG1hcHBpbmcuICBUaGUgYWN0dWFs
CnVubWFwIGhhcHBlbnMgd2hlbiB0dG0gd2FudHMgbW92ZSB0aGUgb2JqZWN0IGZyb20gVlJBTSB0
byBTWVNURU0gZHVlIHRvClZSQU0gYmVpbmcgZnVsbC4gIEluIGNhc2UgdnJhbSBoYXMgcm9vbSBm
b3IgYWxsIG91ciBvYmplY3RzIHdlIHNpbXBseQpuZXZlciB1bm1hcC4KCmhvcGUgdGhpcyBjbGFy
aWZpZXMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
