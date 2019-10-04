Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B684CCCB31
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97526E39B;
	Sat,  5 Oct 2019 16:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817956EBC2;
 Fri,  4 Oct 2019 14:54:41 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9ef4]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGOyd-00058J-UY; Fri, 04 Oct 2019 14:54:39 +0000
Subject: Re: linux-next: Tree for Oct 4 (amdgpu)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191004155929.3ac043b5@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <06969836-ac7f-0d18-1866-159e48018d98@infradead.org>
Date: Fri, 4 Oct 2019 07:54:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004155929.3ac043b5@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gTXRQBbhy1ecaEZJAUNNxhjec8+HvQ9vY4ubPHtV8dE=; b=ITH2eGdB8rd5ve8IB36pLbbOA
 CH+AoVH2wSGY542uFnBO99w5AGjDmY9HZrE/M4VrsCNMH6h2K+69Xxfm9l03VVs68BGUm+5GJm1CD
 hpPnKVPZFEdowycUGDvaiHKrZAtR4RSZU/0es8+c9KDXwkdsg5gTggbMvfymrJXNH//0M2lQexOS0
 /G7zF7FnOIkXmKbiPsENe/6zV02l3BfkFlg4Rljhr0rI11MEBOUpxlnUyT4wUVeRqI1mbjhJvShwi
 NfnHXn3mptwNiylcaxiCvDfA86oUdIKI05GywXwzeJKoSOmy3UyUHmhLP6eDP+1YNzWq51ilCSsLe
 BBs/bKEEg==;
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMy8xOSAxMDo1OSBQTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPiBIaSBhbGwsCj4g
Cj4gQ2hhbmdlcyBzaW5jZSAyMDE5MTAwMzoKPiAKCm9uIHg4Nl82NDoKQ09ORklHX0RSTV9BTURH
UFU9eQojIENPTkZJR19EUk1fQU1ER1BVX1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FNREdQ
VV9DSUsgaXMgbm90IHNldApDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSPXkKQ09ORklHX0RSTV9B
TURHUFVfR0FSVF9ERUJVR0ZTPXkKCmxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlLm86KC5yb2RhdGErMHhmNjApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBnZnhfdjdf
a2ZkMmtnZCcKCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
