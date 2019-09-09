Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE80AD5EF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 11:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF5489AC9;
	Mon,  9 Sep 2019 09:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C93289AC9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 09:43:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7085191C68A;
 Mon,  9 Sep 2019 09:43:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-59.ams2.redhat.com
 [10.36.117.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 448AC6012A;
 Mon,  9 Sep 2019 09:43:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5AF6716E19; Mon,  9 Sep 2019 11:43:34 +0200 (CEST)
Date: Mon, 9 Sep 2019 11:43:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 8/8] drm/ttm: remove embedded vma_offset_manager
Message-ID: <20190909094334.w6jlsxs7w4kto4u4@sirius.home.kraxel.org>
References: <20190905070509.22407-1-kraxel@redhat.com>
 <20190905070509.22407-9-kraxel@redhat.com>
 <d276f21e-fa03-aa68-4bf7-b154a7dc3e2e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d276f21e-fa03-aa68-4bf7-b154a7dc3e2e@amd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 09 Sep 2019 09:43:35 +0000 (UTC)
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDc6MDI6MzNBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDUuMDkuMTkgdW0gMDk6MDUgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+
ID4gTm8gdXNlcnMgbGVmdC4gIERyaXZlcnMgZWl0aGVyIHNldHVwIHZtYV9vZmZzZXRfbWFuYWdl
ciB0aGVtc2VsZgo+ID4gKHZtd2dmeCkgb3IgcGFzcyB0aGUgZ2VtIHZtYV9vZmZzZXRfbWFuYWdl
ciB0byB0dG1fYm9fZGV2aWNlX2luaXQKPiA+IChhbGwgb3RoZXIgZHJpdmVycykuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gCj4gUGF0
Y2hlcyAjNCwgIzUgYW5kICM4IGluIHRoaXMgc2VyaWVzIGFyZSBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyAKPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IAo+IEkgY2FuJ3Qgc2Vl
IHRoZSByZXN0IGluIG15IGluYm94IGFueXdoZXJlLiBIYXZlIHlvdSBzZW5kIGFsbCBvZiB0aGVt
IHRvIAo+IGRyaS1kZXZlbD8KClllcywgdGhleSBhcmUgYWxsIG9uIGRyaS1kZXZlbCwgYnV0IG9u
bHkgYSBzdWJzZXQgaXMgQ2MnZWQgdG8geW91LgpQYXRjaGVzIDItNyBzd2l0Y2ggZHJpdmVycyBv
bmUtYnktb25lLCBhbmQgSSBndWVzcyB5b3Ugb25seSBnb3QgdGhlCm9uZXMgd2hlcmUgeW91IGFy
ZSBsaXN0ZWQgYXMgZHJpdmVyIG1haW50YWluZXIvcmV2aWV3ZXIgaW4gTUFJTlRBSU5FUlMuCgpj
aGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
