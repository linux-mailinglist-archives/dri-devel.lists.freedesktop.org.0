Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBD70A0E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969458919A;
	Mon, 22 Jul 2019 19:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD6B8919A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:48:06 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51574 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpeI0-007PvY-3X; Mon, 22 Jul 2019 15:48:04 -0400
Subject: Re: [PATCH v2 10/11] drm/tinydrm/mipi-dbi: Add
 mipi_dbi_init_with_formats()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-11-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <11b908e0-799f-9621-35e3-0c317a5f48a6@lechnology.com>
Date: Mon, 22 Jul 2019 14:48:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190719155916.62465-11-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wKWGlmHtXCbW/S1rwVLsNv4Ja04mrR76KrFuxNlcms=; b=BEUQ8IKdtfcrS/Qg55UfqS+Vy1
 hMAd6b2MmJhu7Vf47e5PYzNU8c4bmMYkT0VL46coubUob0iKGrVVi4XbzHVifdz3NKsUE8HI7f5Vf
 9G6Zd3mYC5VnOPtLimsKrd4DagHUNUM57VCOkBnLvII/ZhfFpB01Aieq0qr3nFArrV8WEr6jXlxN6
 AEc4zo41Co48uefrLGbIU4pr/F1OrM45C0gmCOj6COagIyhRY8k0PUW44m8Y7j1HMYTHBpNIQvehz
 izL1aK0kZOxLp/JYzjZD5+i+c7ONIUqXGfQLxEPqcdE7gYgcwhZ2CL7MCCp6Eyj2W6qoAUOY0iwC3
 HzTO4DWQ==;
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
Cc: sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xOS8xOSAxMDo1OSBBTSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IFRoZSBNSVBJIERC
SSBzdGFuZGFyZCBzdXBwb3J0IG1vcmUgcGl4ZWwgZm9ybWF0cyB0aGFuIHdoYXQgdGhpcyBoZWxw
ZXIKPiBzdXBwb3J0cy4gQWRkIGFuIGluaXQgZnVuY3Rpb24gdGhhdCBsZXRzIHRoZSBkcml2ZXIg
dXNlIGRpZmZlcmVudAo+IGZvcm1hdChzKS4gVGhpcyBhdm9pZHMgb3BlbiBjb2RpbmcgbWlwaV9k
YmlfaW5pdCgpIGluIHN0NzU4Ni4KPiAKPiBzdDc1ODYgc2V0cyBwcmVmZXJyZWRfZGVwdGggYnV0
IHRoaXMgaXMgbm90IG5lY2Vzc2FyeSBzaW5jZSBpdCBvbmx5Cj4gc3VwcG9ydHMgb25lIGZvcm1h
dC4KPiAKPiB2MjogRm9yZ290IHRvIHJlbW92ZSB0aGUgbWlwaS0+cm90YXRpb24gYXNzaWdubWVu
dCBpbiBzdDc1ODYsCj4gICAgICBtaXBpX2RiaV9pbml0X3dpdGhfZm9ybWF0cygpIGhhbmRsZXMg
aXQuCj4gCj4gQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+IEFja2Vk
LWJ5OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMgfCA5MSArKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL3N0NzU4Ni5jICAgfCAzMyArKy0tLS0t
LS0tLQo+ICAgaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oICAgICB8ICA1ICsrCj4gICAz
IGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQo+IAoKVGVz
dGVkIHdob2xlIHNlcmllcyBvbiBzdDc1ODYuIFNlZW1zIHRvIGJlIHN0aWxsIHdvcmtpbmcuCgpK
dXN0IHB1dHRpbmcgVGVzdGVkLWJ5IGhlcmUgc2luY2UgdGhpcyBwYXRjaCBpcyB0aGUgb25seQpv
bmUgdGhhdCBjaGFuZ2VkIHN0NzU4NiBzaWduaWZpY2FudGx5LgoKVGVzdGVkLWJ5OiBEYXZpZCBM
ZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
