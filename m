Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6FB4D12
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 13:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893AC6EBDE;
	Tue, 17 Sep 2019 11:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348016EBDE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:40:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 62364369AC;
 Tue, 17 Sep 2019 11:40:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 037C76012E;
 Tue, 17 Sep 2019 11:40:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7883E16E05; Tue, 17 Sep 2019 13:40:41 +0200 (CEST)
Date: Tue, 17 Sep 2019 13:40:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v2 07/11] drm/ttm: drop VM_DONTDUMP
Message-ID: <20190917114041.6oaukfnsai5rmf54@sirius.home.kraxel.org>
References: <20190917092404.9982-1-kraxel@redhat.com>
 <20190917092404.9982-8-kraxel@redhat.com>
 <c29222f7-2737-2416-62c9-eafd4d608ded@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c29222f7-2737-2416-62c9-eafd4d608ded@amd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 17 Sep 2019 11:40:46 +0000 (UTC)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTE6MjI6MzVBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMTcuMDkuMTkgdW0gMTE6MjQgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+
ID4gTm90IG9idmlvdXMgd2h5IHRoaXMgaXMgbmVlZGVkLiAgQWNjb3JkaW5nIHRvIERlbmllbCBW
ZXR0ZXIgdGhpcyBpcyBtb3N0Cj4gPiBsaWtlbHkgYSBoaXN0b3JpYyBhcnRlZmFjdCBkYXRpbmcg
YmFjayB0byB0aGUgZGF5cyB3aGVyZSBkcm0gZHJpdmVycwo+ID4gZXhwb3NlZCBoYXJkd2FyZSBy
ZWdpc3RlcnMgYXMgbW1hcCdhYmxlIGdlbSBvYmplY3RzLCB0byBhdm9pZCBkdW1waW5nCj4gPiB0
b3VjaGluZyB0aG9zZSByZWdpc3RlcnMuCj4gCj4gQ2xlYXJseSBhIE5BSy4KPiAKPiBXZSBzdGls
bCBoYXZlIHRoYXQgYW5kIHJlYWxseSBkb24ndCB3YW50IHRvIHRyeSBkdW1waW5nIGFueSBDUFUg
Cj4gaW5hY2Nlc3NpYmxlIFZSQU0gY29udGVudCBldmVuIGlmIGl0IGlzIG1hcHBlZCBpbnRvIHRo
ZSBhZGRyZXNzIHNwYWNlIAo+IHNvbWV3aGVyZS4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24sIEknbGwgZHJvcCB0aGUgcGF0Y2guCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
