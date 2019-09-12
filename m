Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF809B0EF2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 14:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0A46ED1D;
	Thu, 12 Sep 2019 12:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82ECD6ED1D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 12:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D4BD710C092C;
 Thu, 12 Sep 2019 12:38:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE9360872;
 Thu, 12 Sep 2019 12:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B502E16E05; Thu, 12 Sep 2019 14:38:21 +0200 (CEST)
Date: Thu, 12 Sep 2019 14:38:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
Message-ID: <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
References: <20190912094121.228435-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912094121.228435-1-tfiga@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 12 Sep 2019 12:38:23 +0000 (UTC)
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
Cc: zachr@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keiichiw@chromium.org,
 stevensd@chromium.org, marcheu@chromium.org, posciak@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gVG8gc2VhbWxlc3NseSBlbmFibGUgYnVmZmVyIHNoYXJpbmcgd2l0aCBkcml2ZXJz
IHVzaW5nIHN1Y2ggZnJhbWV3b3JrcywKPiBtYWtlIHRoZSB2aXJ0aW8tZ3B1IGRyaXZlciBleHBv
c2UgdGhlIHJlc291cmNlIGhhbmRsZSBhcyB0aGUgRE1BIGFkZHJlc3MKPiBvZiB0aGUgYnVmZmVy
IHJldHVybmVkIGZyb20gdGhlIERNQS1idWYgbWFwcGluZyBvcGVyYXRpb24uICBBcmd1YWJseSwg
dGhlCj4gcmVzb3VyY2UgaGFuZGxlIGlzIGEga2luZCBvZiBETUEgYWRkcmVzcyBhbHJlYWR5LCBh
cyBpdCBpcyB0aGUgYnVmZmVyCj4gaWRlbnRpZmllciB0aGF0IHRoZSBkZXZpY2UgbmVlZHMgdG8g
YWNjZXNzIHRoZSBiYWNraW5nIG1lbW9yeSwgd2hpY2ggaXMKPiBleGFjdGx5IHRoZSBzYW1lIHJv
bGUgYSBETUEgYWRkcmVzcyBwcm92aWRlcyBmb3IgbmF0aXZlIGRldmljZXMuCgpOby4gIEEgc2Nh
dHRlciBsaXN0IGhhcyBndWVzdCBkbWEgYWRkcmVzc2VzLCBwZXJpb2QuICBTdHVmZmluZyBzb21l
dGhpbmcKZWxzZSBpbnRvIGEgc2NhdHRlcmxpc3QgaXMgYXNraW5nIGZvciB0cm91YmxlLCB0aGlu
Z3Mgd2lsbCBnbyBzZXJpb3VzbHkKd3Jvbmcgd2hlbiBzb21lb25lIHRyaWVzIHRvIHVzZSBzdWNo
IGEgZmFrZSBzY2F0dGVybGlzdCBhcyByZWFsIHNjYXR0ZXJsaXN0LgoKQWxzbyBub3RlIHRoYXQg
InRoZSBETUEgYWRkcmVzcyBvZiB0aGUgYnVmZmVyIiBpcyBib25rZXJzIGluIHZpcnRpby1ncHUK
Y29udGV4dC4gIHZpcnRpby1ncHUgcmVzb3VyY2VzIGFyZSBub3QgcmVxdWlyZWQgdG8gYmUgcGh5
c2ljYWxseQpjb250aWdvdXMgaW4gbWVtb3J5LCBzbyB0eXBpY2FsbHkgeW91IGFjdHVhbGx5IG5l
ZWQgYSBzY2F0dGVyIGxpc3QgdG8KZGVzY3JpYmUgdGhlbS4KCmNoZWVycywKICBHZXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
