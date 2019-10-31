Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E3EBF00
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8D89319;
	Fri,  1 Nov 2019 08:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC106EEC8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 15:22:32 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::4ba1]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQCHP-0004Nz-2N; Thu, 31 Oct 2019 15:22:31 +0000
Subject: Re: linux-next: Tree for Oct 31 (gpu/drm/drm_dp_mst_topology.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191031175224.2e313bef@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <423f4936-d979-5ce9-7c75-ec7973f108d9@infradead.org>
Date: Thu, 31 Oct 2019 08:22:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031175224.2e313bef@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sgrMvBbAcxzy+4KwQdMq66yggcI8NHasGmiIST40A5M=; b=pHzvRaMdEqIFmWP8StXMN7OmI
 zOmpX6T+C1CCeXRvYooEkBsilXT4vwxlGygyrS/7mJ45389gEbcFnuKXNAgAv3bpaDYtVxv9Z7PL6
 MZowD9oZvLIkuH5TjdP4p/UrnhcuPTKYvYULOk2bKYFcQgxridU2jI2DGl0fMbebXFpopHuM0wEVY
 Bv0v693VGGqOpCJs/BKYoQJ3ImKDwTIPJvAl9p80hf64gtcW6DsPoJuS36o6UyzYiZqMhkqi+eFOX
 beJQ9G4dx4/QifUd4szCkNUcUhJTHLwu7/pE1Xeov0mDx3KbRkE5e6Kfm/7C8t2cRS8Z8DOYuh6x/
 HvP1ydz7w==;
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMzAvMTkgMTE6NTIgUE0sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gSGkgYWxsLAo+
IAo+IE5ld3M6IHRoZXJlIHdpbGwgYmUgbm8gbGludXgtbmV4dCByZWxlYXNlcyBvbiBGcmlkYXkg
KE5vdiAxKSBvciBNb25kYXkKPiAoTm92IDQpLgo+IAo+IENoYW5nZXMgc2luY2UgMjAxOTEwMzA6
Cj4gCgoKb24gaTM4NjoKCmxkOiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5v
OiBpbiBmdW5jdGlvbiBgX19kdW1wX3RvcG9sb2d5X3JlZl9oaXN0b3J5JzoKZHJtX2RwX21zdF90
b3BvbG9neS5jOigudGV4dCsweGZlYik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fdWRpdmRp
MycKCgoKLS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
