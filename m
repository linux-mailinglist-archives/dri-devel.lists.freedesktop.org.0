Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC677E372
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 21:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33116E798;
	Thu,  1 Aug 2019 19:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BA76E798
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 19:43:36 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:45858 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1htGz7-002DyA-95; Thu, 01 Aug 2019 15:43:33 -0400
Subject: Re: [PATCH 2/4] drm/tiny/ili9341: Move driver to drm/panel
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-3-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <5df3aeec-3793-33e1-df4f-73c470c28db3@lechnology.com>
Date: Thu, 1 Aug 2019 14:43:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190801135249.28803-3-noralf@tronnes.org>
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
 bh=8A0dCC15DAWLQ+QLDdG0YPnvRms5wpRwZ1P2f/LKPKU=; b=oml5o2BvM7BjoRZIKLyRWejaFh
 uicOpQU7SzoiMiCiklZKbpNAXSLf9525UQLZgpu9K0tYSJgj2bX3ZAB9/LtI0SGVkbdgAmHBoXYbM
 1blunFnIRdy9ESa/CqjCXbhhrWIdHCIE0x9Hx9P4M0RRmU4tFVSgN6aZQ27qf3+gCV1HipeoN24GB
 YGaeT7GVWtuB/9JKG94cn141cMZbsfEartil0yPhTcGKcjlaD8biyPSm6uiOMEiMuib1D4xq3CVE5
 g13qIB0O4afju1saTc1zIImKqUweV2iDKtJgH1cUeR6vVJKzkpI55+qfsyDhv2bfKGCdG/xAsI1MN
 XdNF2sHQ==;
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xLzE5IDg6NTIgQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiBNb3ZlIHRoZSBkcml2
ZXIgdG8gZHJtL3BhbmVsIGFuZCB0YWtlIGFkdmFudGFnZSBvZiB0aGUgbmV3IHBhbmVsIHN1cHBv
cnQKPiBpbiBkcm1fbWlwaV9kYmkuIENoYW5nZSB0aGUgZmlsZSBuYW1lIHRvIG1hdGNoIHRoZSBu
YW1pbmcgc3RhbmRhcmQgaW4KPiBkcm0vcGFuZWwuIFRoZSBEUk0gZHJpdmVyIG5hbWUgaXMga2Vw
dCBzaW5jZSBpdCBpcyBBQkkuCj4gCj4gQWRkIG1pc3NpbmcgTUFJTlRBSU5FUlMgZW50cnkuCj4g
Cj4gQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQoKUmV2aWV3ZWQt
Ynk6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgoKQWx0aG91Z2gsIEkgd2ls
bCBzYXkgdGhhdCB0aGUgd2F5IHRoZSBkaWZmIGNhbWUgb3V0LCBpdCBtYWtlcyBpdCBhIGJpdApo
YXJkIHRvIGZvbGxvdyB0aGUgcGF0Y2gsIHNvIG1vcmUgbW9yZSBkZXRhaWxzIGluIHRoZSBjb21t
aXQgbWVzc2FnZSBhYm91dAp0aGUgc3BlY2lmaWMgY2hhbmdlcyBjb3VsZCBiZSBoZWxwZnVsLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
