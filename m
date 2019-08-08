Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3786350
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC46E836;
	Thu,  8 Aug 2019 13:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7497A6E836
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:40:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5BB5315C005;
 Thu,  8 Aug 2019 13:40:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D0B55C219;
 Thu,  8 Aug 2019 13:40:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A029816E08; Thu,  8 Aug 2019 15:40:00 +0200 (CEST)
Date: Thu, 8 Aug 2019 15:40:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@linux.ie>, "Huang, Ray" <Ray.Huang@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/8] ttm: turn ttm_bo_device.vma_manager into a pointer
Message-ID: <20190808134000.oz5ztbjyyux5ufvo@sirius.home.kraxel.org>
References: <20190808093702.29512-1-kraxel@redhat.com>
 <20190808093702.29512-3-kraxel@redhat.com>
 <2a90c899-19eb-5be2-3eda-f20efd31aa29@amd.com>
 <20190808103521.u6ggltj4ftns77je@sirius.home.kraxel.org>
 <20190808120252.GO7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808120252.GO7444@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 08 Aug 2019 13:40:03 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiA+IFRoYXQgd291bGQgYWxzbyBtYWtlIHRoZSB2ZXJpZnlfYWNjZXNzIGNhbGxi
YWNrIGNvbXBsZXRlbHkgc3VwZXJmbHVvdXMgCj4gPiA+IGFuZCBsb29rcyBsaWtlIGEgZ29vZCBz
dGVwIGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbiBvZiBkZS1taWRsYXllcmluZy4KPiA+IAo+ID4g
SG1tLCByaWdodCwgbm90aWNlZCB0aGF0IHRvbyB3aGlsZSB3b3JraW5nIG9uIGFub3RoZXIgcGF0
Y2ggc2VyaWVzLgo+ID4gR3Vlc3MgSSdsbCB0cnkgdG8gbWVyZ2UgdGhvc2UgdHdvIGFuZCBzZWUg
d2hlcmUgSSBlbmQgdXAgLi4uCj4gCj4gLi4uIGJ1dCBpZiBpdCBnZXRzIHRvbyBpbnZhc2l2ZSBJ
J2Qgdm90ZSBmb3IgaW5jcmVtZW50YWwgY2hhbmdlcy4KClllcCwgdGhpcyBpcyB3aGF0IEknbSB1
cCB0by4gIFNrZXRjaGluZyB0aGluZ3MgdXAgd2l0aCB2cmFtIGhlbHBlcnMgYW5kCnF4bCwgaW4g
YSB3YXkgdGhhdCB3ZSBjYW4gc3dpdGNoIG92ZXIgZHJpdmVycyBvbmUgYnkgb25lLgoKT25jZSBh
bGwgZHJpdmVycyBhcmUgc3dpdGNoZWQgcmVtb3ZpbmcgdHRtX2JvX2RldmljZS52bWFfbWFuYWdl
cgphbHRvZ2V0aGVyIHNob3VsZCBiZSBlYXN5LgoKPiBFdmVuIGlmCj4gd2UgY29tcGxldGVseSBy
aXAgb3V0IHRoZSB2bWEvbW1hcCBsb29rdXAgc3R1ZmYgZnJvbSB0dG0sIHdlIHN0aWxsIG5lZWQg
dG8KPiBrZWVwIGEgY29weSBzb21ld2hlcmUgZm9yIHZtd2dmeC4KCklmIHZtd2dmeCBpcyB0aGUg
b25seSB1c2VyIHdlIGNhbiBwcm9iYWJseSBqdXN0IG1vdmUgdGhpbmdzIGZyb20gdHRtIHRvCnZt
d2dmeC4KCj4gT3Igd291bGQgdGhlIGV2aWwgcGxhbiBiZSB0aGUgdm13Z2Z4Cj4gd291bGQgdXNl
IHRoZSBnZW0gbW1hcCBoZWxwZXJzIHRvbz8KClRoYXQgd291bGQgd29yayBhcyB3ZWxsIDspCgpj
aGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
