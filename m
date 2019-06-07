Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7138557
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8908F89AB3;
	Fri,  7 Jun 2019 07:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17CB897F6;
 Fri,  7 Jun 2019 03:19:38 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9d7bb0000>; Thu, 06 Jun 2019 20:19:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 20:19:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 20:19:38 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:19:34 +0000
Subject: Re: [PATCH v2 hmm 07/11] mm/hmm: Use lockdep instead of comments
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-8-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <c1916bf0-1cec-9742-da9a-cfb0620be1f6@nvidia.com>
Date: Thu, 6 Jun 2019 20:19:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-8-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559877563; bh=9gF3uYn8obWB5VlUA+vgwaf2NDgSDG+GUN4zo8V/T7s=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Y2/wSIlTDTvSRdYSF0JE+b/OJ9Z37KAvZnjLdpqLblVoJpA9RpMEc1+t+7lodIvC+
 K+XHIKj+M0kiuZZIjR4KCP8V9ptM6hqYnxC2cmwq9/5357Hxxim2CabkXCAfwxfrHp
 9Wh+0tBCkMV3T7aTLJd2fnNgLpEF1E8MIZhoMqANxrZ1BOkL2sC/fAZ7g1TogRo44I
 f3D/LwtPMs0lhTGycNl7sIhQr0vmnOvaXB9iQrOFpj6N03P5RGYLZluNdASeuRNZUt
 CUq/h0Q3gYsBA60V6778+IW8VendGjD8aGz4nQuNAJjYGZUfIAaZiQeH5yD1+Xhn8R
 gdpnlOI2/wIHg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFNvIHdlIGNhbiBjaGVjayBsb2NraW5n
IGF0IHJ1bnRpbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPgo+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KPiAtLS0KPiB2Mgo+IC0gRml4IG1pc3NpbmcgJiBpbiBsb2NrZGVwcyAoSmFzb24pCj4g
LS0tCj4gIG1tL2htbS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMK
PiBpbmRleCBmNjdiYTMyOTgzZDlmMS4uYzcwMmNkNzI2NTFiNTMgMTAwNjQ0Cj4gLS0tIGEvbW0v
aG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC0yNTQsMTEgKzI1NCwxMSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG1tdV9ub3RpZmllcl9vcHMgaG1tX21tdV9ub3RpZmllcl9vcHMgPSB7Cj4gICAq
Cj4gICAqIFRvIHN0YXJ0IG1pcnJvcmluZyBhIHByb2Nlc3MgYWRkcmVzcyBzcGFjZSwgdGhlIGRl
dmljZSBkcml2ZXIgbXVzdCByZWdpc3Rlcgo+ICAgKiBhbiBITU0gbWlycm9yIHN0cnVjdC4KPiAt
ICoKPiAtICogVEhFIG1tLT5tbWFwX3NlbSBNVVNUIEJFIEhFTEQgSU4gV1JJVEUgTU9ERSAhCj4g
ICAqLwo+ICBpbnQgaG1tX21pcnJvcl9yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9y
LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgewo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZF9leGNs
dXNpdmUoJm1tLT5tbWFwX3NlbSk7Cj4gKwo+ICAJLyogU2FuaXR5IGNoZWNrICovCj4gIAlpZiAo
IW1tIHx8ICFtaXJyb3IgfHwgIW1pcnJvci0+b3BzKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+IAoK
ICAgIFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CgoKdGhh
bmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
