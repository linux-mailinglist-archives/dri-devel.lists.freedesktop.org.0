Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5BB5115
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 17:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836DD6ECDA;
	Tue, 17 Sep 2019 15:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453ED6ECDA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 15:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 6B78F40F61;
 Tue, 17 Sep 2019 17:10:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOoBZjKMR3Db; Tue, 17 Sep 2019 17:10:26 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 60B2040F6C;
 Tue, 17 Sep 2019 17:10:25 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F0EDB3601AA;
 Tue, 17 Sep 2019 17:10:24 +0200 (CEST)
Subject: Re: [PATCH] drm/ioctl: Add a ioctl to label GEM objects
To: Rohan Garg <rohan.garg@collabora.com>, dri-devel@lists.freedesktop.org
References: <20190916103541.29015-1-rohan.garg@collabora.com>
 <0ac8c7d3-e8b0-3ead-f05b-80944b92e1af@shipmail.org>
 <7822046.gLmiR1X9Zk@solembum>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <d55b6fd3-fabf-1759-1474-498cef3df1b3@shipmail.org>
Date: Tue, 17 Sep 2019 17:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7822046.gLmiR1X9Zk@solembum>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568733025; bh=AFnqpinaxN9PhOMljLHp2o5MW6DDA4tIq6n39nGE8jY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=bvJO9tcn3yb8/Cu0FkJPz4UZzwfuBaRON1zTda6ALnRXVnbm5hp+ckLFsuchjeLBu
 Q/4kwUXLvh3Mrniit10zf5/R4unO2tNRMFbE3lUjGrSwgg3yoJz8K+eJ9N2Ah3C/GN
 WmOdxyhrOGm0Ro9auju5pyWKavD6ddV2cVCoUSVA=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=bvJO9tcn; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xNy8xOSA1OjA1IFBNLCBSb2hhbiBHYXJnIHdyb3RlOgo+IEhpCj4KPj4gV2UncmUgbm90
IGNsb3NpbmcgYSBkZXZpY2UsIGFyZSB3ZT8KPj4KPiBBaCwgeWVzLCBJJ2xsIGZpeCB0aGlzIGlu
IHYyLgo+ICAgCj4+IERvIHdlIGhhdmUgYSBtZWNoYW5pc20gaW4gcGxhY2UgdG8gc3RvcCBhIG1h
bGljaW91cyB1bnByaXZpbGVnZWQgYXBwCj4+IGZyb20gYWxsb2NhdGluZyBhbGwga2VybmVsIG1l
bW9yeSB0byBnZW0gbGFiZWxzPwo+Pgo+IEknbSB1bnN1cmUgd2h5IHRoaXMgaXMgYSBjb25jZXJu
IHNpbmNlIGEgbWFsaWNpb3VzIGFwcCBjb3VsZCBhbHNvIHBvdGVudGlhbGx5Cj4gYWxsb2NhdGUg
bG90cyBvZiBHRU0gYnVmZmVycyBhbmQgY2F1c2UgdGhlIHNhbWUgc2l0dWF0aW9uLgoKSG1tLCB5
ZXMgaW4gc29tZSBkcml2ZXJzLiBJbiBvdGhlcnMgbm90LiBCdXQgaWYgd2UgaGF2ZSBhIGRybV9k
cml2ZXIgCmhvb2sgZm9yIHRoaXMsIEkgZ3Vlc3MgZHJpdmVycyB0aGF0IGNhcmUgY2FuIGRvIHBy
b3BlciBjaGVja2luZy4KCi9UaG9tYXMKCgo+IENoZWVycwo+IFJvaGFuIEdhcmcKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
