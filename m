Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B559DD1A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5813E89B5F;
	Tue, 27 Aug 2019 05:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38D89B5F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 05:21:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4601D3082E25;
 Tue, 27 Aug 2019 05:21:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C750E1E0;
 Tue, 27 Aug 2019 05:21:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 223D01747D; Tue, 27 Aug 2019 07:21:54 +0200 (CEST)
Date: Tue, 27 Aug 2019 07:21:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v2] drm/virtio: add plane check
Message-ID: <20190827052154.etk4jbx45hsrl7z5@sirius.home.kraxel.org>
References: <20190822094657.27483-1-kraxel@redhat.com>
 <CAPaKu7S_He9RYsxDi0Qco4u=Xnc3FjB5nvFT_Zh+o7pvFzCvRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7S_He9RYsxDi0Qco4u=Xnc3FjB5nvFT_Zh+o7pvFzCvRQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 27 Aug 2019 05:21:56 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDM6MzQ6NTZQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDI6NDcgQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IFVzZSBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19w
bGFuZV9zdGF0ZSgpCj4gPiB0byBzYW5pdHkgY2hlY2sgdGhlIHBsYW5lIHN0YXRlLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgfCAxNyArKysrKysr
KysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKPiA+IGlu
ZGV4IGE0OTJhYzNmNGE3ZS4uZmU1ZWZiMmRlOTBkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9wbGFuZS5jCj4gPiBAQCAtODQsNyArODQsMjIgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgdmlydGlvX2dwdV9wbGFuZV9mdW5jcyA9IHsKPiA+ICBz
dGF0aWMgaW50IHZpcnRpb19ncHVfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkKPiA+ICB7Cj4gPiAtICAgICAgIHJldHVybiAwOwo+
ID4gKyAgICAgICBib29sIGlzX2N1cnNvciA9IHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBF
X0NVUlNPUjsKPiA+ICsgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOwo+
ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgICBpZiAoIXN0YXRlLT5mYiB8fCAh
c3RhdGUtPmNydGMpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiArICAg
ICAgIGNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9jcnRjX3N0YXRlKHN0YXRlLT5zdGF0ZSwg
c3RhdGUtPmNydGMpOwo+ID4gKyAgICAgICBpZiAoSVNfRVJSKGNydGNfc3RhdGUpKQo+ID4gKyAg
ICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKPiBJcyBkcm1fYXRvbWlj
X2dldF9uZXdfY3J0Y19zdGF0ZSBiZXR0ZXIgaGVyZT8KCldlIGRvbid0IGhhdmUgdG8gd29ycnkg
YWJvdXQgb2xkL25ldyBzdGF0ZSBoZXJlLiAgVGhlIGRybV9wbGFuZV9zdGF0ZSB3ZQpnZXQgcGFz
c2VkIGlzIHRoZSBzdGF0ZSB3ZSBzaG91bGQgY2hlY2sgaW4gdGhpcyBjYWxsYmFjayAoYW5kIEkg
dGhpbmsKdGhpcyBhbHdheXMgaXMgdGhlIG5ldyBzdGF0ZSkuCgpjaGVlcnMsCiAgR2VyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
