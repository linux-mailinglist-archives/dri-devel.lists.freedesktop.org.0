Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9835AB2C3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AC06E156;
	Fri,  6 Sep 2019 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659E6E0BA;
 Thu,  5 Sep 2019 14:54:31 +0000 (UTC)
Received: from [2601:1c0:6200:6e8::e2a8]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5t9a-0001B5-D4; Thu, 05 Sep 2019 14:54:30 +0000
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To: Harry Wentland <hwentlan@amd.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190904233443.3f73c46b@canb.auug.org.au>
 <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
 <752f74d6-f6ff-6013-25ad-a8fdce934d17@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d29463cd-0497-41f2-a502-110b02c7abc8@infradead.org>
Date: Thu, 5 Sep 2019 07:54:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <752f74d6-f6ff-6013-25ad-a8fdce934d17@amd.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s6tAAQYhXVNkbT0qRFk7hwIqccKZKc+HllFbPMAhXzQ=; b=L0jomP63rgBFMv/c20KdK1HHI
 na/AFiiTkpvGZuPuT6Gypw9honlxILA27VWorgleWFoB/8nMjgSKel7vSdDzdLVpNOfptyQdop144
 wLK0UjdZXIb4HkM1tOBTi0XvjXCitR7WI6YiFycciC9jDjRsIMAggvjUbQcLHiG9cCUqmmnnH9KVY
 6su+2m9aQoaZAsc2+vMB/qQXgmZOFEeCiWRT+sAeNNFGd9uiZ4l66D5vMgrjH5PShjQJQ3MIbzyWv
 aHzbbkFtlvVo7Vo9L+P+z+Z6mbb6qPScQCzbAKeREG0DWBQ0tE36Ce29Eo51LIVUfjo4Robd1OKq/
 mfkyuGXQQ==;
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS81LzE5IDY6MTcgQU0sIEhhcnJ5IFdlbnRsYW5kIHdyb3RlOgo+IAo+IAo+IE9uIDIwMTkt
MDktMDQgNDo1OCBwLm0uLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDkvNC8xOSA2OjM0IEFN
LCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IE5ld3M6IHRoaXMg
d2lsbCBiZSB0aGUgbGFzdCBsaW51eC1uZXh0IEkgd2lsbCByZWxlYXNlIHVudGlsIFNlcHQgMzAu
Cj4+Pgo+Pj4gQ2hhbmdlcyBzaW5jZSAyMDE5MDkwMzoKPj4+Cj4+Cj4+IG9uIHg4Nl82NDoKPj4K
Pj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfcnFfZGxnX2NhbGNfMjB2Mi5jOjc3OjA6Cj4+
IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2RjbjIwLy4u
L2RtbF9pbmxpbmVfZGVmcy5oOiBJbiBmdW5jdGlvbiDigJhkbWxfbWlu4oCZOgo+PiAuLi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9kY24yMC8uLi9kbWxfaW5s
aW5lX2RlZnMuaDozNDoxOiBlcnJvcjogU1NFIHJlZ2lzdGVyIHJldHVybiB3aXRoIFNTRSBkaXNh
YmxlZAo+Pgo+IAo+IElzIHRoYXQgZml4ZWQgYnkgU3RlcGhlbidzIGZpeHVwIGhlcmU/Cj4gCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktU2Vw
dGVtYmVyLzIzNDI5Mi5odG1sCgpUaGF0IHBhdGNoIGlzIGFscmVhZHkgaW4gbGludXgtbmV4dCwg
c28gTm8sIGl0J3Mgbm90LgoKSSBhbSB1c2luZzoKPiBnY2MgLS12ZXJzaW9uCmdjYyAoU1VTRSBM
aW51eCkgNy40LjEgMjAxOTA0MjQgW2djYy03LWJyYW5jaCByZXZpc2lvbiAyNzA1MzhdCgoKLS0g
Cn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
