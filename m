Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A985FD7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 12:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4C86E81F;
	Thu,  8 Aug 2019 10:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5516E81F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 10:35:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 81CBBEE563;
 Thu,  8 Aug 2019 10:35:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 143C2600C8;
 Thu,  8 Aug 2019 10:35:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F40F16E08; Thu,  8 Aug 2019 12:35:21 +0200 (CEST)
Date: Thu, 8 Aug 2019 12:35:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v3 2/8] ttm: turn ttm_bo_device.vma_manager into a pointer
Message-ID: <20190808103521.u6ggltj4ftns77je@sirius.home.kraxel.org>
References: <20190808093702.29512-1-kraxel@redhat.com>
 <20190808093702.29512-3-kraxel@redhat.com>
 <2a90c899-19eb-5be2-3eda-f20efd31aa29@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a90c899-19eb-5be2-3eda-f20efd31aa29@amd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 08 Aug 2019 10:35:22 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, "Huang, Ray" <Ray.Huang@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDk6NDg6NDlBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDguMDguMTkgdW0gMTE6MzYgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+
ID4gUmVuYW1lIHRoZSBlbWJlZGRlZCBzdHJ1Y3Qgdm1hX29mZnNldF9tYW5hZ2VyLCBpdCBpcyBu
YW1lZCBfdm1hX21hbmFnZXIKPiA+IG5vdy4gIHR0bV9ib19kZXZpY2Uudm1hX21hbmFnZXIgaXMg
YSBwb2ludGVyIG5vdywgcG9pbnRpbmcgdG8gdGhlCj4gPiBlbWJlZGRlZCB0dG1fYm9fZGV2aWNl
Ll92bWFfbWFuYWdlciBieSBkZWZhdWx0Lgo+ID4KPiA+IEFkZCB0dG1fYm9fZGV2aWNlX2luaXRf
d2l0aF92bWFfbWFuYWdlcigpIGZ1bmN0aW9uIHdoaWNoIGFsbG93cyB0bwo+ID4gaW5pdGlhbGl6
ZSB0dG0gd2l0aCBhIGRpZmZlcmVudCB2bWEgbWFuYWdlci4KPiAKPiBDYW4ndCB3ZSBnbyBkb3du
IHRoZSByb3V0ZSBvZiBjb21wbGV0ZWx5IHJlbW92aW5nIHRoZSB2bWFfbWFuYWdlciBmcm9tIAo+
IFRUTT8gdHRtX2JvX21tYXAoKSB3b3VsZCBnZXQgdGhlIEJPIGFzIHBhcmFtZXRlciBpbnN0ZWFk
LgoKSXQgc3VyZWx5IG1ha2VzIHNlbnNlIHRvIHRhcmdldCB0aGF0LiAgVGhpcyBwYXRjaCBjYW4g
YmUgYSBmaXJzdCBzdGVwCmludG8gdGhhdCBkaXJlY3Rpb24uICBJdCBhbGxvd3MgZ2VtIGFuZCB0
dG0gdG8gdXNlIHRoZSBzYW1lCnZtYV9vZmZzZXRfbWFuYWdlciAoc2VlIHBhdGNoICMzKSwgd2hp
Y2ggaW4gdHVybiBtYWtlcyB2YXJpb3VzIGdlbQpmdW5jdGlvbnMgd29yayBvbiB0dG0gb2JqZWN0
cyAoc2VlIHBhdGNoICM0IGZvciB2cmFtIGhlbHBlcnMpLgoKPiBUaGF0IHdvdWxkIGFsc28gbWFr
ZSB0aGUgdmVyaWZ5X2FjY2VzcyBjYWxsYmFjayBjb21wbGV0ZWx5IHN1cGVyZmx1b3VzIAo+IGFu
ZCBsb29rcyBsaWtlIGEgZ29vZCBzdGVwIGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbiBvZiBkZS1t
aWRsYXllcmluZy4KCkhtbSwgcmlnaHQsIG5vdGljZWQgdGhhdCB0b28gd2hpbGUgd29ya2luZyBv
biBhbm90aGVyIHBhdGNoIHNlcmllcy4KR3Vlc3MgSSdsbCB0cnkgdG8gbWVyZ2UgdGhvc2UgdHdv
IGFuZCBzZWUgd2hlcmUgSSBlbmQgdXAgLi4uCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
