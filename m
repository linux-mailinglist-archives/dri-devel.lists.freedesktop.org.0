Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DF7D5A3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 08:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9156E377;
	Thu,  1 Aug 2019 06:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E490A6E377
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 06:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D9B13082E10;
 Thu,  1 Aug 2019 06:42:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-54.ams2.redhat.com
 [10.36.116.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 830B310013D9;
 Thu,  1 Aug 2019 06:42:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7FE4A11AAA; Thu,  1 Aug 2019 08:42:48 +0200 (CEST)
Date: Thu, 1 Aug 2019 08:42:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC 4/6] udmabuf: add a pointer to the miscdevice in dma-buf
 private data
Message-ID: <20190801064248.ditndh4vxr5373yw@sirius.home.kraxel.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
 <20190801022517.1903-5-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801022517.1903-5-gurchetansingh@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 01 Aug 2019 06:42:50 +0000 (UTC)
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

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDc6MjU6MTVQTSAtMDcwMCwgR3VyY2hldGFuIFNpbmdo
IHdyb3RlOgo+IFdpbGwgYmUgdXNlZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXJjaGV0
YW4gU2luZ2ggPGd1cmNoZXRhbnNpbmdoQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9k
bWEtYnVmL3VkbWFidWYuYyB8IDkgKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCj4gaW5kZXggMTM0ZTUzZDI0
YzJiLi40NzAwM2FiYmY0YzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYu
Ywo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKPiBAQCAtMTksNiArMTksNyBAQCBz
dHJ1Y3QgdWRtYWJ1ZiB7Cj4gIAl1MzIgZmxhZ3M7Cj4gIAlwZ29mZl90IHBhZ2Vjb3VudDsKPiAg
CXN0cnVjdCBwYWdlICoqcGFnZXM7Cj4gKwlzdHJ1Y3QgbWlzY2RldmljZSAqdWRtYWJ1Zl9taXNj
OwoKSSdkIG5hbWUgdGhpcyAiZGV2IiBvciAiZGV2aWNlIi4KCmNoZWVycywKICBHZXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
