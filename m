Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7770AA5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0789E8C;
	Mon, 22 Jul 2019 20:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33A189E8C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:25:40 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52478 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpesM-007VRB-P2; Mon, 22 Jul 2019 16:25:38 -0400
Subject: Re: [PATCH v2 4/9] drm/tinydrm: Split struct mipi_dbi in two
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-5-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <21db2100-3541-463b-0bf3-7b7f1233549b@lechnology.com>
Date: Mon, 22 Jul 2019 15:25:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-5-noralf@tronnes.org>
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
 bh=nFimk7SdImY3tpk9Oc39lV6pwW56WIELaQHwVKQZRLU=; b=H/1vsq4aA6v1ImGExIMVOuWMVO
 DZx9nB0Av5HStKtniPJudb0IQE1i6wwbQQxjHRZ12MuNw3SHD0x5BP+B/yHrVgOrBjjSCLVwUU8Kt
 pYkchr87KRxRvPH2apyGrGS3fUjnSbj8pbZNZxWkJGhUQW70566bHWRYTE0IIDrO2Zkqeb9SS0bCD
 i6mY3zz9RrSslQSOpkWUXHZsRcGPXg8aPMW8Fo7+2k5o3lHX0+aSCOTKJpVI8agm5pw/m2aqszbvb
 G60OzFI1JNTVauJdtpaqa/XO7yAxsVztiswBjyx8rNCfmOsRmQ06V13jXoJL/jMYx2sAzZN7Y2oO2
 WTz4Ij3g==;
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

T24gNy8yMi8xOSA1OjQzIEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gU3BsaXQgc3RydWN0
IG1pcGlfZGJpIGludG8gYW4gaW50ZXJmYWNlIHBhcnQgYW5kIGEgZGlzcGxheSBwaXBlbGluZSBw
YXJ0Lgo+IFRoZSBpbnRlcmZhY2UgcGFydCBjYW4gYmUgdXNlZCBieSBkcml2ZXJzIHRoYXQgbmVl
ZCB0byBpbml0aWFsaXplIHRoZQo+IGNvbnRyb2xsZXIsIGJ1dCB0aGF0IHdvbid0IHVwbG9hZCB0
aGUgZnJhbWVidWZmZXIgb3ZlciB0aGlzIGludGVyZmFjZS4KPiAKPiBNSVBJIERCSSBzdXBwb3J0
cyAzIGludGVyZmFjZSB0eXBlczoKPiAtIEEuIE1vdG9yb2xhIDY4MDAgdHlwZSBwYXJhbGxlbCBi
dXMKPiAtIEIuIEludGVsIDgwODAgdHlwZSBwYXJhbGxlbCBidXMKPiAtIEMuIFNQSSB0eXBlIHdp
dGggMyBvcHRpb25zOgo+IAo+IEkndmUgZW1iZWRkZWQgdGhlIFNQSSB0eXBlIHNwZWNpZmljcyBp
biB0aGUgbWlwaV9kYmkgc3RydWN0IHRvIGF2b2lkCj4gYWRkaW5nIHVubmVjZXNzYXJ5IGNvbXBs
ZXhpdHkuIElmIG1vcmUgaW50ZXJmYWNlIHR5cGVzIHdpbGwgYmUgc3VwcG9ydGVkCj4gaW4gdGhl
IGZ1dHVyZSwgdGhlIHR5cGUgc3BlY2lmaWNzIG1pZ2h0IGhhdmUgdG8gYmUgc3BsaXQgb3V0Lgo+
IAo+IFJlbmFtZSBmdW5jdGlvbnMgdG8gbWF0Y2ggdGhlIG5ldyBzdHJ1Y3QgbWlwaV9kYmlfZGV2
Ogo+IC0gZHJtX3RvX21pcGlfZGJpKCkgLT4gZHJtX3RvX21pcGlfZGJpX2RldigpLgo+IC0gbWlw
aV9kYmlfaW5pdCooKSAtPiBtaXBpX2RiaV9kZXZfaW5pdCooKS4KPiAKPiBDYzogRXJpYyBBbmhv
bHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiBDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9n
eS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0K
CkFja2VkLWJ5OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
