Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBB9DCEF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 07:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82E889A1A;
	Tue, 27 Aug 2019 05:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C7E89A1A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 05:02:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3F124D2E6;
 Tue, 27 Aug 2019 05:02:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 765066CE58;
 Tue, 27 Aug 2019 05:02:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ACE4B1747D; Tue, 27 Aug 2019 07:02:35 +0200 (CEST)
Date: Tue, 27 Aug 2019 07:02:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
Message-ID: <20190827050235.5zf5fza5am52u3w6@sirius.home.kraxel.org>
References: <20190808134417.10610-1-kraxel@redhat.com>
 <510b8714-2b9a-ee1d-3b03-f2704c69637e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <510b8714-2b9a-ee1d-3b03-f2704c69637e@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 27 Aug 2019 05:02:36 +0000 (UTC)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTA6NDc6MDdBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGksCj4gCj4gSSB3b3VsZCBoYXZlIGxpa2VkIHRvIGdldCBzb21lIGNvbnRl
eHQgb24gdGhlIHB1cnBvc2Ugb2YgR0VNIFRUTQo+IGhlbHBlcnMuIElzIGlzIGp1c3Qgc2hhcmUt
YWJsZSBjb2RlPwoKWWVzLiAgU2hhcmVhYmxlIGNvZGUgZm9yIGRyaXZlcnMgd2hpY2ggdXNlIGJv
dGggdHRtIGFuZCBnZW0gKGFsbCBleGNlcHQKdm1nZngpLgoKPiBGcm9tIG15IHVuZGVyc3RhbmRp
bmcgVlJBTSBoZWxwZXJzIF9hcmVfIEdFTSBUVE0gaGVscGVycy4gQW5kIHRoZXkgd2hlcmUKPiBy
ZS1uYW1lZCB0byBWUkFNIGhlbHBlcnMsIHNvIHRoYXQgdGhlIG5hbWluZyBpcyBpbmRlcGVuZGVu
dCBmcm9tIHRoZQo+IGltcGxlbWVudGF0aW9uIChhbmQgdmljZSB2ZXJzYSkuCgpJIHRoaW5rIHZy
YW0gaGVscGVycyBhcmUgZm9yIG9sZC9zaW1wbGUgZGV2aWNlcyB3aGljaCBiYXNpY2FsbHkgc3Vw
cG9ydApkdW1iIGdlbSBvYmplY3RzIHN0b3JlZCBpbiB2cmFtIChkZXZpY2UgbWVtb3J5IHR5cGlj
YWxseSBleHBvc2VkIGFzIHBjaQpiYXIpLiAgVXNpbmcgdHRtIHVuZGVybmVhdGggaXMgbGFyZ2Vs
eSBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgZm9yIHRoZQp1c2VycyBvZiB0aGUgdnJhbSBoZWxw
ZXJzLCB0aGV5IGRvbid0IG5lZWQgdG8ga25vdy4KCj4gV3J0IHF4bCwgd291bGQgaXQgYmUgcG9z
c2libGUgdG8gY29udmVydCB0aGUgZHJpdmVyIG92ZXIgdG8gVlJBTSBoZWxwZXJzCj4gZW50aXJl
bHk/IEkgbm90aWNlZCBhIG1lbW9yeSByZWdpb24gbmFtZWQgUFJJVi4gQ291bGQgd2UgYWRkIHRo
aXMgdG8KPiBWUkFNIGhlbHBlcnM/CgpQUklWIGlzIHZyYW0gdG9vLCBxeGwgaGFzIHR3byBwY2kg
YmFycyB3aXRoIG1lbW9yeS4gIEhpc3RvcmljYWwgcmVhc29ucy4KVGhlcmUgYXJlIHJ1bGVzIHdo
aWNoIHBjaSBiYXIgY2FuIHN0b3JlIHdoaWNoIGtpbmQgb2Ygb2JqZWN0cy4gIEkgZG9uJ3QKdGhp
bmsgaXQgbWFrZXMgc2Vuc2UgdG8gbW92ZSBzdWNoIGRldmljZS1zcGVjaWZpYyB0aGluZ3MgaW50
byB2cmFtCmhlbHBlcnMuICBBbHNvIHF4bCBpcyBjb21wbGV4IGVub3VnaCB0aGF0IHlvdSBjYW4g
aGFyZGx5IGhpZGUgdHRtIGJlaGluZAp2cmFtIGhlbHBlcnMuCgpjaGVlcnMsCiAgR2VyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
