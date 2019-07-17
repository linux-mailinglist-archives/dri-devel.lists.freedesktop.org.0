Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D96C1B2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 21:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09EA89FD9;
	Wed, 17 Jul 2019 19:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24089FD9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 19:48:13 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51164 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hnpuO-007s9o-0b; Wed, 17 Jul 2019 15:48:12 -0400
Subject: Re: [PATCH 06/10] drm/tinydrm: Move tinydrm_spi_transfer()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-7-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <d5e99eeb-1670-75ec-5e01-a5964bbfe0f8@lechnology.com>
Date: Wed, 17 Jul 2019 14:48:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717115817.30110-7-noralf@tronnes.org>
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
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PA+LnbGCMamqHROB4ThNGEvSWvbpzDiP/a8Tqgmz1vo=; b=inQyfeI7hXeO1+XJLMykM0pJVo
 /xbtxRLVUxSsv5xWBgxDfKpOIatCApH3l0XfWbGqTjddgLF+5SJwtAPTNbRd3MEkYEAMcb+XaAL8y
 gBTIkfPxRFtok3UxnoyaEw4gz7iz/HScoNbXUIUXCkTvJt/KdGF8GJ9wdg8eaw6vatBxgrnz+xbW3
 QdbGz5vdgqM9Rss7NVdPuHBB3GfdlhbOoT0nIrcMGBUCb/9yiHXekNxHmtecy0Sh2UBXIXsafTZio
 xYJGXAHEATW0/dF1KbrEpSdxg3t9KzdzNno3E7JF074oLuD4WOVQzXGjrw+TZFGFB2r9omZ+I3fEr
 O370CQgw==;
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

T24gNy8xNy8xOSA2OjU4IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhpcyBpcyBvbmx5
IHVzZWQgYnkgbWlwaS1kYmkgZHJpdmVycyBzbyBtb3ZlIGl0IHRoZXJlLgo+IAo+IFRoZSByZWFz
b24gdGhpcyBpc24ndCBtb3ZlZCB0byB0aGUgU1BJIHN1YnN5c3RlbSBpcyB0aGF0IGl0IHdpbGwg
aW4gYQo+IGxhdGVyIHBhdGNoIHBhc3MgYSBkdW1teSByeCBidWZmZXIgZm9yIFNQSSBjb250cm9s
bGVycyB0aGF0IG5lZWQgdGhpcy4KPiBMb3cgbWVtb3J5IGJvYXJkcyAoNjRNQikgY2FuIHJ1biBp
bnRvIGEgcHJvYmxlbSBhbGxvY2F0aW5nIHN1Y2ggYSAibGFyZ2UiCj4gY29udGlndW91cyBidWZm
ZXIgb24gZXZlcnkgdHJhbnNmZXIgYWZ0ZXIgYSBsb25nIHVwIHRpbWUuCj4gVGhpcyBsZWF2ZXMg
YSB2ZXJ5IHNwZWNpZmljIHVzZSBjYXNlLCBzbyB3ZSdsbCBrZWVwIHRoZSBmdW5jdGlvbiBoZXJl
Lgo+IG1pcGktZGJpIHdpbGwgZmlyc3QgZ28gdGhyb3VnaCBhIHJlZmFjdG9yaW5nIHRob3VnaCwg
YmVmb3JlIHRoaXMgd2lsbAo+IGJlIGRvbmUuCj4gCj4gUmVtb3ZlIFNQSSB0b2RvIGVudHJ5IG5v
dyB0aGF0IHdlJ3JlIGRvbmUgd2l0aCB0aGUgdGlueWRybS5rbyBTUEkgY29kZS4KPiAKPiBBZGRp
dGlvbmFsbHkgbW92ZSB0aGUgbWlwaV9kYmlfc3BpX2luaXQoKSBkZWNsYXJhdGlvbiB0byB0aGUg
b3RoZXIgU1BJCj4gZnVuY3Rpb25zLgo+IAo+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNo
bm9sb2d5LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9u
bmVzLm9yZz4KPiAtLS0KCkFja2VkLWJ5OiA6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xv
Z3kuY29tPgoKSSBhc3N1bWUgdGhhdCB0aGUgY29tbWVudHMgaGVyZSBtaWdodCBoYXZlIHNvbWV0
aGluZyB0byBkbyB3aXRoIHRoZQppc3N1ZVsxXSBJIHJhaXNlZCBhIHdoaWxlIGJhY2s/IFNob3Vs
ZCBJIGR1c3QgdGhhdCBwYXRjaCBvZmYgYW5kIHJlc2VuZAppdCBhZnRlciB0aGlzIHNlcmllcyBs
YW5kcz8KClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTE5MDgyNDYxLTMyNDA1
LTEtZ2l0LXNlbmQtZW1haWwtZGF2aWRAbGVjaG5vbG9neS5jb20vCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
