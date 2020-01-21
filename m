Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D71439CC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4066EC20;
	Tue, 21 Jan 2020 09:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B786EC20
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3EB4B3FA41;
 Tue, 21 Jan 2020 10:49:19 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iuKCPMwf; 
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
 with ESMTP id b3XU8BOaO6WM; Tue, 21 Jan 2020 10:49:18 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3985F3FA22;
 Tue, 21 Jan 2020 10:49:15 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6FCDB360318;
 Tue, 21 Jan 2020 10:49:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579600155; bh=g0SZU5dMfapYFIcFHTjFoqeQ/9fMdof0GtTRDjDHVfQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iuKCPMwfroLxJHYxsuAKiWzXRglPYzQpKE8ROKPPuMMRpvv66q1BGSp8sYBE0lbPN
 uJSdHr7Gw38fu1iiw3/kpW79m99GGWyi/cM5uaLkFRtxcODm/MvfxKA8VI4COi6gBY
 Kbu7xblKkcdQN8bfsW9DCow4yYd+xFX9kM0Y1Sjk=
Subject: Re: [git pull] vmwgfx-next
To: Dave Airlie <airlied@gmail.com>
References: <20200116092934.5276-1-thomas_os@shipmail.org>
 <CAPM=9tzVFe=O-0A-5PKdjBV-95aLvTaprzFuxxeai4y9PJKk9Q@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <1e3116f3-8277-9369-37a8-bbf0693ead87@shipmail.org>
Date: Tue, 21 Jan 2020 10:49:15 +0100
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
Cj4KPiBEYXZlLgoKSGksIERhdmUsCgpNZXNhIHBhdGNoIHBvc3RlZDoKCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtZGV2LzIwMjAtSmFudWFyeS8yMjQwMTguaHRt
bAoKVGhhbmtzLApUaG9tYXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
