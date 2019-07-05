Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89360258
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62126E42A;
	Fri,  5 Jul 2019 08:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E96E3FB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 03:27:59 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-04.nifty.com
 with ESMTP id x653705F000428
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Jul 2019 12:07:00 +0900
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x6536Q4j010160
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Jul 2019 12:06:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6536Q4j010160
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id o19so929558vkb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 20:06:26 -0700 (PDT)
X-Gm-Message-State: APjAAAUUZLK8nGkFOGfdFtfoIYgnv7uzCQoKFMYdCYDmAKGOBUm8fVGy
 OzYexungs7gaF6SjhdsJmaqDCoLyGZl1IehJOoM=
X-Google-Smtp-Source: APXvYqx1fdfrytc0sWZZM6lY9Xdz+SAPqK6SCnajdY9dWkz6Qp9Uyw0DqKq3G8QmllDHQmgVXa6JS9tx5ersEEn+inM=
X-Received: by 2002:a1f:728b:: with SMTP id n133mr313496vkc.84.1562295985842; 
 Thu, 04 Jul 2019 20:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
In-Reply-To: <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 5 Jul 2019 12:05:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
Message-ID: <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1562295987;
 bh=PUF8lDa4vdReIoKmN9yFODRcREJp8yLKeKn0eH+L6bE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hc5L71DyP571OH1ILbrgsHHQpZxhkuz18yBJhiWyhTAww3ze+ztOro/wGz1TDYFUE
 /Si8hBWyn/V+Wg7PcYBWYxq1n2b2lpdpZvozLTunEj/uzkQ6RFOunckU0TuUzz9m2O
 RXMPcf27hMNI6zqtIhJMXDYJTJ3SOPQKOXPt5xrHNYe/6sLud/g+w7+4NbpxrT/Grd
 8MDTyD1iqfPBs9CuK/ynHGls1pUT/6NeGMZXtHG9zbpUfsfYbzST09seR6N/R3uVix
 7kKWqrwbGRnDtZYlfOtqiGntTGk7sXKjNMyFI00Ibkod/cTVCg9158ANjrjUuw9/GO
 cblKP9Jp4wGZg==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMDowOSBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiA3LzQvMTkgMzowMSBQTSwgYWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZyB3cm90ZToKPiA+IFRoZSBtbS1vZi10aGUtbW9tZW50IHNuYXBzaG90IDIwMTkt
MDctMDQtMTUtMDEgaGFzIGJlZW4gdXBsb2FkZWQgdG8KPiA+Cj4gPiAgICBodHRwOi8vd3d3Lm96
bGFicy5vcmcvfmFrcG0vbW1vdG0vCj4gPgo+ID4gbW1vdG0tcmVhZG1lLnR4dCBzYXlzCj4gPgo+
ID4gUkVBRE1FIGZvciBtbS1vZi10aGUtbW9tZW50Ogo+ID4KPiA+IGh0dHA6Ly93d3cub3psYWJz
Lm9yZy9+YWtwbS9tbW90bS8KPgo+IEkgZ2V0IGEgbG90IG9mIHRoZXNlIGJ1dCBkb24ndCBzZWUv
a25vdyB3aGF0IGNhdXNlcyB0aGVtOgo+Cj4gLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0Mjog
Li4vZHJpdmVycy9ncHUvZHJtL2k5MTUvb2EvTWFrZWZpbGU6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKPiBtYWtlWzZdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnLi4vZHJpdmVycy9n
cHUvZHJtL2k5MTUvb2EvTWFrZWZpbGUnLiAgU3RvcC4KPiAuLi9zY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjQ5ODogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9pOTE1L29hJyBmYWls
ZWQKPiBtYWtlWzVdOiAqKiogW2RyaXZlcnMvZ3B1L2RybS9pOTE1L29hXSBFcnJvciAyCj4gLi4v
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dw
dS9kcm0vaTkxNScgZmFpbGVkCj4KCkkgY2hlY2tlZCBuZXh0LTIwMTkwNzA0IHRhZy4KCkkgc2Vl
IHRoZSBlbXB0eSBmaWxlCmRyaXZlcnMvZ3B1L2RybS9pOTE1L29hL01ha2VmaWxlCgpEaWQgc29t
ZW9uZSBkZWxldGUgaXQ/CgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
