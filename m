Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC3AA019
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 12:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB656E044;
	Thu,  5 Sep 2019 10:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3136E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 10:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 7ACD83FBBA;
 Thu,  5 Sep 2019 12:43:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVxj9E_Kx0k8; Thu,  5 Sep 2019 12:43:43 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 2998A3F4F6;
 Thu,  5 Sep 2019 12:43:43 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id CDF6C360100;
 Thu,  5 Sep 2019 12:43:42 +0200 (CEST)
Subject: Re: [PATCH v2 0/4] Have TTM support SEV encryption with coherent
 memory
To: dri-devel@lists.freedesktop.org, pv-drivers@vmware.com,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org
References: <20190903131504.18935-1-thomas_os@shipmail.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <5a41afa1-a1f9-128c-222a-542f102024b9@shipmail.org>
Date: Thu, 5 Sep 2019 12:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903131504.18935-1-thomas_os@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567680222; bh=3aSlQOqBEa26RhExNsoDCnh6gCRDnU08CAzt/peygzw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=SDoKa9varg3r/9yg9AsqqUn8xx8qN+fIsHsXWka13aKVAj7BWg4ruG5dshDT63itt
 VJkYaiK99i/ad1IdebWB4BEfHO5HbWd9ej9R63nt9nCNoPP1OoSc5H5/OCtQJRWoaV
 yyEpRTlCxhRMdWgg5L4kZzBW4YQHOEFzMA0EqbaM=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=SDoKa9va; 
 dkim-atps=neutral
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

T24gOS8zLzE5IDM6MTUgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+IFdp
dGggU0VWIG1lbW9yeSBlbmNyeXB0aW9uIGFuZCBpbiBzb21lIGNhc2VzIGFsc28gd2l0aCBTTUUg
bWVtb3J5Cj4gZW5jcnlwdGlvbiwgY29oZXJlbnQgbWVtb3J5IGlzIHVuZW5jcnlwdGVkLiBJbiB0
aG9zZSBjYXNlcywgVFRNIGRvZXNuJ3QKPiBzZXQgdXAgdGhlIGNvcnJlY3QgcGFnZSBwcm90ZWN0
aW9uLiBGaXggdGhpcyBieSBoYXZpbmcgdGhlIFRUTQo+IGNvaGVyZW50IHBhZ2UgYWxsb2NhdG9y
IGNhbGwgaW50byB0aGUgcGxhdGZvcm0gY29kZSB0byBkZXRlcm1pbmUgd2hldGhlcgo+IGNvaGVy
ZW50IG1lbW9yeSBpcyBlbmNyeXB0ZWQgb3Igbm90LCBhbmQgbW9kaWZ5IHRoZSBwYWdlIHByb3Rl
Y3Rpb24gaWYKPiBpdCBpcyBub3QuCj4KPiB2MjoKPiAtIFVzZSBmb3JjZV9kbWFfdW5lbmNyeXB0
ZWQoKSByYXRoZXIgdGhhbiBzZXZfYWN0aXZlKCkgdG8gY2F0Y2ggYWxzbyB0aGUKPiAgICBzcGVj
aWFsIFNNRSBlbmNyeXB0aW9uIGNhc2VzLgoKU28sIHRoaXMgcGF0Y2hzZXQgaXMgb2J2aW91c2x5
IHdpdGhkcmF3biBzaW5jZQoKYSkgV2Ugc2hvdWxkbid0IGhhdmUgVFRNIHNob3J0Y3V0IHRoZSBk
bWEgQVBJIGluIHRoaXMgd2F5LgpiKSBUbyByZXZpZXdlcnMgaXQgd2FzIHByZXR0eSB1bmNsZWFy
IHdoeSB0aGlzIHdhcyBuZWVkZWQgaW4gdGhlIGZpcnN0IApwbGFjZSwgYW5kIGJlY2FtZQpldmVu
IG1vcmUgdW5jbGVhciBpbiB0aGUgY29udGV4dCBvZiB0aGUgVFRNIGZhdWx0IGhhbmRsZXIuCgpJ
J3ZlIGp1c3Qgc2VuZCBvdXQgYW4gUkZDIHBhdGNoc2V0IHRoYXQgYmFzaWNhbGx5IGRvZXMgdGhl
IHNhbWUgYnV0IGluIAp0aGUgY29udGV4dCBvZiBkbWFfbW1hcF9jb2hlcmVudCgpIEkgaG9wZSB0
aGlzIGNsZWFycyB0aGluZ3MgdXAgYW5kIHdlIApzaG91bGQgaG9wZWZ1bGx5IGJlIGFibGUgdG8g
dXNlIGEgbmV3CmRtYSBBUEkgZnVuY3Rpb24gZnJvbSB3aXRoaW4gdGhlIFRUTSBmYXVsdCBoYW5k
bGVyLgoKVGhhbmtzLAoKVGhvbWFzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
