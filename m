Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992BB1A1C23
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9346E6E963;
	Wed,  8 Apr 2020 06:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-19.consmr.mail.gq1.yahoo.com
 (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F556E10F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1586273807; bh=DRcjw4RWlx/WffnvzoKrFTQcWvavqs2gXoWOXywXOCk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=LuiZA/a8J4tRv8OVyXpyrJG3TSZ8cWvWlv0C8Hb7y2zk+OODgV2AEqCDG7eze/O7WeQ+PFtabVgv4k0/GjnJxWiEvPxQ9DwLmvlerAkqcBzQBU1u70H2oDTPovXKlqpU3lGGtlmRqOxurDoFu3pN95CSJpeodeHwHRy7bESmwphTdYTqvgfT+z2BLQPluu5lM4ML+3XBLr3O6U+TE2ibBz4/wbOO9OkMls+TohZU1H/rHEn85kLlX/Nt45+bttpCfWOuVLT0skXbPABJ3gaGmpgEJe78Czd3dJDuhGYIob05zGAR+ohb62P6S5scKbOYKyJbMQP2u8xvUU6gYjFYqA==
X-YMail-OSG: ZZge5_4VM1kR52e0GUo2fNzjRFaCBHWfxv3eFEqMjiW_9RaNaQc0GXkvJCJiqIE
 blLtaswVknj.HLQ0tq50cqppuya9hxO4FMYBbwvzGBP.G.1PPbNwr9QGozst0N7RxnXEQztLPS4U
 OZECCg.DlMptgSP8YIx5uHu9nxLOW2fGdvHSj8bVLOL7aeyYHkAlShHyGkLFrKf_rh1PhsjSPWeh
 Z9B01Xeh3TcsGQyGNw1Twjb8bVbjwJ7kwCfUm7Rk7LunS8r0stFudDfsKWj1epUigHejRKjnivrq
 iZErCkyY8ofZxWYSszvlmCdg40JharWeEPQe.LNAuLETD8JRdg2DRCbf125WKyQFGtqSN9oUwv9r
 dehtJYhYwg8PU1pV91yrfp8bQRPBgeIV6Plyrtj6IIYLox0EdKZlyG9e5EuVy5PLJRaWAZs0dbKB
 ENHl4qzBtTgpRuIAbBRtEHKb8MOWW58uKYJVp681a7UBW4zIdThVI8ZhzIc.MMLT2AC42HZaGRU1
 fCFgslw0pIF3ENIj2aUveZgqe_0hFT7EPyT2VSHbAc7NnaU8Lh7fHUV5ee6bUsMN06aIyoiEAWCS
 MUMD9UsHbd351IsRXRaXVzJOGvh9MsdaLtGgIQRxYYetjboypwjlG9CrqJzOncoLKrOVtFR_G70H
 3yhvEJ3OUGXkGeMek4LUUfoyK_.IC0vbBUe.bn_A2yGIx4lhX1fsUc87l_VOrAm0sU3WQpM1945Q
 CjmkIBFjePN2atP1kIvJYfdJEnR0EnkVtwNOLy88bz_bLM1vSG8MACf2gYwygY6aaA3wQm4reNGx
 K01we4heQm1bV1hj6WfOdhGjglVO0SDKc_hEn44tuQQ3ahSMx5km_iFfVt2zy4V5VC.itVHKvUuQ
 wYnlCGxj6BDNTbpOzarAkWhJhvN1zgeiWvKXmyAH42yQ6PcFjZZc6NcKtf7QiDRw8FNziHcPV343
 bmF.oZlF7zbDfEjicxH9BUHmJLoqFZ63G9q3bLk5Wn46t8wegXSMGlIDa.pXUe6DMsXb_oBOsGvW
 Gen_7eZ4vVRHgMgXzS02.VvbmROcQzVuXEp0Dh7igqbqvCWMXfm5MQq4X2D2anGxK9tpL_3LNBDQ
 UmlAIXTVRIMPX0VIIDW17OsaNxC4LIy2FQnpVpswgy8XThGlQgNvHpRfTIrN8spsim4LvK5enMN.
 4YfvUu1s6bsY18FYwTXkyckVX1kZ8Omar5erlWhLXn25WrNROGO7wbkIBUUu8aXeHv2eF2BuDrG8
 eDF.AppJEZsPCbWwrYRrznjUJK_O_RDbdPIB.8sqcFzstQhEpMWcFni4j.LY_O1YTlHvkWMBTLN6
 A.WCHw50Nhut4OOKQhIfNc1mR2TxklNTq4DO1TbKgu0qoDLYd_0kjMujgMEbbNSrvuaE9DWZd2.C
 lKXXUpniCGnMLktTt43mSyiRV4A--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 7 Apr 2020 15:36:47 +0000
Received: by smtp427.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 8d3a3a4d22c2dc4e05ca5abcebba6325; 
 Tue, 07 Apr 2020 15:36:42 +0000 (UTC)
Date: Tue, 07 Apr 2020 11:36:39 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Thomas =?iso-8859-1?q?Hellstr=F6m?= "(VMware)"
 <thomas_os@shipmail.org>
References: <1586138158.v5u7myprlp.none.ref@localhost>
 <1586138158.v5u7myprlp.none@localhost>
 <0b12b28c-5f42-b56b-ea79-6e3d1052b332@shipmail.org>
 <1586219716.1a3fyi6lh5.none@localhost>
 <37624a1f-8e6b-fe9c-8e0e-a9139e1bbe18@shipmail.org>
In-Reply-To: <37624a1f-8e6b-fe9c-8e0e-a9139e1bbe18@shipmail.org>
MIME-Version: 1.0
Message-Id: <1586273767.0q72rozj3x.none@localhost>
X-Mailer: WebService/1.1.15620 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Mailman-Approved-At: Wed, 08 Apr 2020 06:59:23 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 =?iso-8859-1?b?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhjZXJwdHMgZnJvbSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSdzIG1lc3NhZ2Ugb2YgQXBy
aWwgNywgMjAyMCA3OjI2IGFtOgo+IE9uIDQvNy8yMCAyOjM4IEFNLCBBbGV4IFh1IChIZWxsbzcx
KSB3cm90ZToKPj4gRXhjZXJwdHMgZnJvbSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSdzIG1l
c3NhZ2Ugb2YgQXByaWwgNiwgMjAyMCA1OjA0IHBtOgo+Pj4gSGksCj4+Pgo+Pj4gT24gNC82LzIw
IDk6NTEgUE0sIEFsZXggWHUgKEhlbGxvNzEpIHdyb3RlOgo+Pj4+IFVzaW5nIDMxNGI2NTggd2l0
aCBhbWRncHUsIHN0YXJ0aW5nIHN3YXkgYW5kIGZpcmVmb3ggY2F1c2VzICJCVUc6IEJhZAo+Pj4+
IHJzcy1jb3VudGVyIHN0YXRlIiBhbmQgIkJVRzogbm9uLXplcm8gcGd0YWJsZXNfYnl0ZXMgb24g
ZnJlZWluZyBtbSIgdG8KPj4+PiBzdGFydCBmaWxsaW5nIGRtZXNnLCBhbmQgdGhlbiBjbG9zaW5n
IHByb2dyYW1zIGNhdXNlcyBtb3JlIEJVR3MgYW5kCj4+Pj4gaGFuZ3MsIGFuZCB0aGVuIGV2ZXJ5
dGhpbmcgZ3JpbmRzIHRvIGEgaGFsdCAoY2FuJ3Qgc3RhcnQgbW9yZSBwcm9ncmFtcywKPj4+PiBj
YW4ndCBldmVuIHJlYm9vdCB0aHJvdWdoIHN5c3RlbWQpLgo+Pj4+Cj4+Pj4gVXNpbmcgbWFzdGVy
IGFuZCByZXZlcnRpbmcgdGhhdCBicmFuY2ggdXAgdG8gdGhhdCBwb2ludCBmaXhlcyB0aGUKPj4+
PiBwcm9ibGVtLgo+Pj4+Cj4+Pj4gSSdtIHVzaW5nIGEgUnl6ZW4gMTYwMCBhbmQgQU1EIFJhZGVv
biBSWCA0ODAgb24gYW4gQVNSb2NrIEI0NTAgUHJvNAo+Pj4+IGJvYXJkIHdpdGggSU9NTVUgZW5h
YmxlZC4KPj4+IElmIHlvdSBjb3VsZCB0cnkgdGhlIGF0dGFjaGVkIHBhdGNoLCB0aGF0J2QgYmUg
Z3JlYXQhCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+IFRob21hcwo+Pj4KPj4gWWVhaCwgdGhhdCB3
b3JrcyB0b28uIEtlcm5lbCBjb25maWcgc2VudCBvZmYtbGlzdC4KPj4KPj4gUmVnYXJkcywKPj4g
QWxleC4KPiAKPiBUaGFua3MuIERvIHlvdSB3YW50IG1lIHRvIGFkZCB5b3VyCj4gCj4gUmVwb3J0
ZWQtYnk6IGFuZCBUZXN0ZWQtYnk6IFRvIHRoaXMgcGF0Y2g/Cj4gCj4gL1Rob21hcwo+IAo+IAoK
U3VyZS4gU2hvdWxkbid0IHdlIGZpeCBpdCBwcm9wZXJseSB0aG91Z2g/Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
