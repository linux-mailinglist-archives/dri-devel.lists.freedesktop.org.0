Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA58B27E6
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54BF6F474;
	Fri, 13 Sep 2019 22:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CF96F474;
 Fri, 13 Sep 2019 22:05:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9AB7A3B464;
 Fri, 13 Sep 2019 22:05:16 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7566600C6;
 Fri, 13 Sep 2019 22:05:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/4] drm/nouveau: dispnv50: Remove nv50_mstc_best_encoder()
Date: Fri, 13 Sep 2019 18:03:51 -0400
Message-Id: <20190913220355.6883-2-lyude@redhat.com>
In-Reply-To: <20190913220355.6883-1-lyude@redhat.com>
References: <20190913220355.6883-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 13 Sep 2019 22:05:16 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2Jlc3RfZW5jb2RlciBpcyBk
ZWZpbmVkLAotPmJlc3RfZW5jb2RlciBpcyBpZ25vcmVkIGJvdGggYnkgdGhlIGF0b21pYyBtb2Rl
c2V0dGluZyBoZWxwZXJzLiBUaGF0CmJlaW5nIHNhaWQsIHRoaXMgaG9vayBpcyBjb21wbGV0ZWx5
IGJyb2tlbiBhbnl3YXkgLSBpdCBhbHdheXMgcmV0dXJucwp0aGUgZmlyc3QgbXN0byBmb3IgYSBn
aXZlbiBtc3RjLCBkZXNwaXRlIHRoZSBmYWN0IGl0IG1pZ2h0IGFscmVhZHkgYmUgaW4KdXNlLgoK
U28sIGp1c3QgZ2V0IHJpZCBvZiBpdC4gV2UnbGwgbmVlZCB0aGlzIGluIGEgbW9tZW50IGFueXdh
eSwgd2hlbiB3ZSBtYWtlCm1zdG9zIHBlci1oZWFkIGFzIG9wcG9zZWQgdG8gcGVyLWNvbm5lY3Rv
ci4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgOSAtLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYwppbmRleCBiNDZiZThhMDkxZTkuLmEzZjM1MGZkZmE4YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtOTIwLDE0ICs5MjAsNiBAQCBudjUwX21zdGNf
YXRvbWljX2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCXJl
dHVybiAmbXN0Yy0+bXN0bS0+bXN0b1toZWFkLT5iYXNlLmluZGV4XS0+ZW5jb2RlcjsKIH0KIAot
c3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqCi1udjUwX21zdGNfYmVzdF9lbmNvZGVyKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi17Ci0Jc3RydWN0IG52NTBfbXN0YyAqbXN0YyA9
IG52NTBfbXN0Yyhjb25uZWN0b3IpOwotCi0JcmV0dXJuICZtc3RjLT5tc3RtLT5tc3RvWzBdLT5l
bmNvZGVyOwotfQotCiBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMKIG52NTBfbXN0Y19tb2Rl
X3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCSAgICAgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCkBAIC05OTAsNyArOTgyLDYgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcwogbnY1MF9tc3RjX2hlbHAgPSB7CiAJLmdl
dF9tb2RlcyA9IG52NTBfbXN0Y19nZXRfbW9kZXMsCiAJLm1vZGVfdmFsaWQgPSBudjUwX21zdGNf
bW9kZV92YWxpZCwKLQkuYmVzdF9lbmNvZGVyID0gbnY1MF9tc3RjX2Jlc3RfZW5jb2RlciwKIAku
YXRvbWljX2Jlc3RfZW5jb2RlciA9IG52NTBfbXN0Y19hdG9taWNfYmVzdF9lbmNvZGVyLAogCS5h
dG9taWNfY2hlY2sgPSBudjUwX21zdGNfYXRvbWljX2NoZWNrLAogfTsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
