Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E900470ABA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD2189E7C;
	Mon, 22 Jul 2019 20:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061489E7C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:32:45 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52594 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpezD-007WWA-HP; Mon, 22 Jul 2019 16:32:43 -0400
Subject: Re: [PATCH v2 8/9] drm/tinydrm: Move mipi-dbi
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-9-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <365f6774-a073-0620-9073-0946f8f39a33@lechnology.com>
Date: Mon, 22 Jul 2019 15:32:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-9-noralf@tronnes.org>
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
 bh=MmP4U9TjpwYljQwYQQd4rkv9isDKIlIcGsXuBuzro98=; b=W5bif/2oIFv6TAAlbmFYjLqZbD
 ZR740OHydz3FWG7JZGZPsHo6lcYdwK1HV1CIm0htOqCRofAwxviB8gzdsXPX3yNfzveQy7l6S6AQ2
 K/uWmOAlbkYCmKiX53yVC54/GtacWQFi8twyWVPQNpFuSUdaYNomtx3ANMS4juA6ZKQxkpL2Xk85e
 MOQi0n5rUXTLA7a2xUZp0kNSaOWX17wKULFMnw21Y12ZTPyvOKezT7x0ALOw7koQEgJccA1e8TRTP
 oyh4XkC4crxkkqYVT22XCWuRn0xmEhmUM7hQ7abCHxLfA/6hKO3CEgOz2KoYYClsgOtXaVEXRVaw5
 4XSYVgcA==;
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

T24gNy8yMi8xOSA1OjQzIEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhpcyBtb3ZlcyBt
aXBpLWRiaSB0byBiZSBhIGNvcmUgaGVscGVyIHdpdGggdGhlIG5hbWUgZHJtX21pcGlfZGJpLgo+
IAo+IEZpeHVwIGluY2x1ZGUncyBpbiBkcml2ZXJzLgo+IE1vdmUgdGhlIGRvY3MgZW50cnkgYW5k
IGRlbGV0ZSB0aW55ZHJtLnJzdC4KPiBEZWxldGUgdGhlIGxhc3QgdGlueWRybSB0b2RvIGVudHJ5
Lgo+IAo+IHYyOiBNYWtlIERSTV9NSVBJX0RCSSB0cmlzdGF0ZSB0byBlbmFibGUgaXQgYmVpbmcg
YnVpbHQgYXMgYSBtb2R1bGUuCj4gCj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+
Cj4gQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+IFJldmlld2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTm9yYWxm
IFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gLS0tCgpBY2tlZC1ieTogRGF2aWQgTGVj
aG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
