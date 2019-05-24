Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB1297D1
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18091899F0;
	Fri, 24 May 2019 12:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C768986D;
 Fri, 24 May 2019 12:10:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 411AD3086202;
 Fri, 24 May 2019 12:10:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
 [10.36.116.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B113C1001E6C;
 Fri, 24 May 2019 12:10:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F3FA11AB5; Fri, 24 May 2019 14:10:28 +0200 (CEST)
Date: Fri, 24 May 2019 14:10:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 0/8] drm/fb-helper: Move modesetting code to drm_client
Message-ID: <20190524121028.qmsaotel5ipt35xw@sirius.home.kraxel.org>
References: <20190523134413.4210-1-noralf@tronnes.org>
 <20190523165320.GA7770@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523165320.GA7770@ravnborg.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 24 May 2019 12:10:30 +0000 (UTC)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDY6NTM6MjBQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIExpbnVzLCBHZXJkLgo+IAo+ID4gVGhpcyBtb3ZlcyB0aGUgbW9kZXNldHRpbmcg
Y29kZSBmcm9tIGRybV9mYl9oZWxwZXIgdG8gZHJtX2NsaWVudCBzbyBpdAo+ID4gY2FuIGJlIHNo
YXJlZCBieSBhbGwgaW50ZXJuYWwgY2xpZW50cy4KPiAKPiBDb3VsZCBvbmUgb2YgeW91IHRha2Ug
YSBsb29rIGF0IHRoaXMgc2VyaWVzLgo+IERhbmllbCBhbHJlYWR5IGFjaydlZCB0aGUgc2VyaWVz
IG9uIGlyYywgYnV0IGFuIGV4dHJhIHBhaXIgb2YgZXllcwo+IGlzIG5ldmVyIGJhZC4KPiAKPiBG
b3IgbXkgcGFydCBJIGhhdmUgYmVlbiB0aHJvdWdoIHRoZW0gYWxsLCBidXQgSSBzdGlsbCBkbyBu
b3QgaGF2ZQo+IHRoZSBmdWxsIHBpY3R1cmUgb2YgdGhlIERSTSBzdWJzeXN0ZW0gc28gbXkgcmV2
aWV3IG1heSBub3QKPiBzdWZmaWNlLgoKTG9va3Mgc2FuZSB0byBtZSBvdmVyYWxsLiAgVHJpZWQg
dG8gZ2l2ZSB0aGUgc2VyaWVzIGEgc3BpbiBpbiBxZW11LCBidXQ6CgpFUlJPUjogImRybV9jbGll
bnRfcGFuZWxfcm90YXRpb24iIFtkcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXIua29dCnVu
ZGVmaW5lZCEKCkVYUE9SVF9TWU1CT0woKSBtaXNzaW5nPwoKY2hlZXJzLAogIEdlcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
