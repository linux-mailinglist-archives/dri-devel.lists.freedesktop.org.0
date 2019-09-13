Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE71B1DC7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 14:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A806F6F39E;
	Fri, 13 Sep 2019 12:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEE16F39E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 12:37:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B7A05301A893;
 Fri, 13 Sep 2019 12:37:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72ECE8D6A;
 Fri, 13 Sep 2019 12:37:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 79FF031F38; Fri, 13 Sep 2019 14:37:49 +0200 (CEST)
Date: Fri, 13 Sep 2019 14:37:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm: rework mmap() workflow
Message-ID: <20190913123749.yigksjobz3vhi4y3@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913122908.784-1-kraxel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 13 Sep 2019 12:37:50 +0000 (UTC)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDI6Mjk6MDBQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBBZGQgbW1hcCBjYWxsYmFjayB0byBkcm1fb2JqZWN0CgpPb3BzLCBoaXQgc2VudCB0
byBlYXJseS4gIFRoaXMgc2hvdWxkIGhhdmUgYmVlbiB0aGlzOgoKQWRkIG1tYXAgY2FsbGJhY2sg
dG8gc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzLCB3aGljaCBpcyBzdXBwb3NlZCB0bwpoYW5k
bGUgdGhlIHZtYSBzZXR1cC4gIEl0IHdpbGwgYmUgdXNlZCBieSBib3RoIG5vcm1hbCBmb3BzLT5t
bWFwICh2aWEKZHJtX2dlbV9tbWFwX29iaigpKSBhbmQgcHJpbWUgbW1hcCAodmlhIGRybV9nZW1f
cHJpbWVfbW1hcCgpKS4KCkZvciBzdGFydGVycyB0aGUgc2htZW0gYW5kIHZyYW0gaGVscGVycyBh
cmUgc3dpdGNoZWQgb3ZlciB0byB0aGUgbmV3CndvcmtmbG93LCB0byBzaG93IHRoaW5ncyBpbiBh
Y3Rpb24gZm9yIHJldmlldy4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
