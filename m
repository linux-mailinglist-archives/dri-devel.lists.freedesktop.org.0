Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F305143379
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 22:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289E56FAC6;
	Mon, 20 Jan 2020 21:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9526EB49
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8E9C53F808;
 Mon, 20 Jan 2020 22:42:25 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=faf1ae0m; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuPgZHCd6QZb; Mon, 20 Jan 2020 22:42:24 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8CD683F5AE;
 Mon, 20 Jan 2020 22:42:22 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C972E36015F;
 Mon, 20 Jan 2020 22:42:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579556541; bh=1hfpruWmmcr84Q2I1i+/EsY2BuIp2Xw0myCoXR468Xk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=faf1ae0mZ4Y8rumCHOqrAJ23AUNKNOvJfg597Mp7TG+tHhb7xyvxBUMQjsoPM4w5r
 rgciU+jaSHK0Ce9aGXP9lj/DkNBpUY8pvQ8p4M9Wrn8llAHMt5QA/F5xFwB1JuPwkC
 eqCc03iQI4ccDggyiQ7hDO5zJivL08QJtkHRC+G0=
Subject: Re: [git pull] vmwgfx-next
To: Dave Airlie <airlied@gmail.com>
References: <20200116092934.5276-1-thomas_os@shipmail.org>
 <CAPM=9tzVFe=O-0A-5PKdjBV-95aLvTaprzFuxxeai4y9PJKk9Q@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <a1a620ac-da80-d134-afde-3d6324cc8e0c@shipmail.org>
Date: Mon, 20 Jan 2020 22:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPM=9tzVFe=O-0A-5PKdjBV-95aLvTaprzFuxxeai4y9PJKk9Q@mail.gmail.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: pv-drivers@vmware.com, Dave Airlie <airlied@redhat.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yMC8yMCAxMDowOSBQTSwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gT24gVGh1LCAxNiBKYW4g
MjAyMCBhdCAxOTozMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkKPiA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz4gd3JvdGU6Cj4+IERhdmUsIERhbmllbAo+Pgo+PiBUaGUgbWFpbiA1LjYgLW5l
eHQgcHVsbCBmcm9tIHZtd2dmeC4gTWlub3IgdGhpbmdzIGhlcmUgYW5kIHRoZXJlLCBhcyB3ZWxs
Cj4+IGFzIGFuIGFkZGVkIGlvY3RsIGZvciBob3N0IG1lc3NhZ2luZyBhbmQgYSBjb3JyZXNwb25k
aW5nIGFwaSB2ZXJzaW9uIGJ1bXAuCj4gSXMgdGhlcmUgdXNlcnNwYWNlIGZvciB0aGlzIGlvY3Rs
IHNvbWV3aGVyZT8gSSBuZWVkIGEgcG9pbnRlciB0byBzb21lCj4gcmV2aWV3ZWQgdXNlcnNwYWNl
IE1SIGZvciBNZXNhIG9yIG90aGVyIHRoaW5nIHRvIGFkZCBuZXcgdUFQSSB0bwo+IGRyaXZlcnMu
Cj4KPiBEYXZlLgoKSXQncyBzdGlsbCBpbiBvdXIgaW50ZXJuYWwgcmVwby4gSSdsbCBwb3N0IGEg
bWVzYSBwYXRjaCB0b21vcnJvdyBhbmQgCnNlbmQgeW91IGEgcG9pbnRlci4KClRoYW5rcywKVGhv
bWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
