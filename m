Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB870A80
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53C989E59;
	Mon, 22 Jul 2019 20:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130C589E59
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:19:07 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52356 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpem1-007UPl-M8; Mon, 22 Jul 2019 16:19:05 -0400
Subject: Re: [PATCH v2 2/9] drm/tinydrm: Rename variable mipi -> dbi
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-3-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <c75ab610-c907-e02d-c014-e2c81cead319@lechnology.com>
Date: Mon, 22 Jul 2019 15:19:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-3-noralf@tronnes.org>
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
 bh=A9EhqDzo/S6X0a0Ru61+Z1wvUrdgKn287gwtW2ZIutg=; b=ibPOSwtOMcWjx2TvNTF/+PiwYh
 nvMyQk6iV9GwAylnnCzL3xDweMGKecj3xZHLkOWK2lYxgSRzfE/6WXvwMYz6d+a5tbAJ9yDJiXI1L
 61fvC9jKIeruGm3MfKkjvOWsqBtBffJvTe9ZRlyuBDnCmsCRt2BMw95mYgUANONPLFV2iLYtEY1g1
 G16FywiNeOWZgkg+NkKBDvdou+Y8JgKwJAHOy0Zjjwwg+yv8XyeR6DGipXQCN/DxnSaKljbGB+hNI
 kTDBCjBy4NH0tvCYspLCgW5EwPKPLhyz4mGk+NjR00N+N0i0+qlzxwj0Nxx/1CHqsUCRa3chPyfWe
 MipkFOrA==;
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

T24gNy8yMi8xOSA1OjQzIEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gc3RydWN0IG1pcGlf
ZGJpIGlzIGdvaW5nIHRvIGJlIHNwbGl0IGludG8gYW4gaW50ZXJmYWNlIHBhcnQgYW5kIGEgZGlz
cGxheQo+IHBpcGVsaW5lIHBhcnQuIFRoZSBpbnRlcmZhY2UgcGFydCBjYW4gYmUgdXNlZCBieSBk
cml2ZXJzIHRoYXQgbmVlZCB0bwo+IGluaXRpYWxpemUgdGhlIGNvbnRyb2xsZXIsIGJ1dCB0aGF0
IHdvbid0IHVwbG9hZCB0aGUgZnJhbWVidWZmZXIgb3Zlcgo+IHRoaXMgaW50ZXJmYWNlLgo+IAo+
IHRpbnlkcm0gdXNlcyB0aGUgdmFyaWFibGUgbmFtZSAnbWlwaScgYnV0IHRoaXMgaXMgbm90IGEg
Z29vZCBuYW1lIHNpbmNlCj4gTUlQSSByZWZlcnMgdG8gYSBsb3Qgb2Ygc3RhbmRhcmRzLiBUaGlz
IHBhdGNoIGNoYW5nZXMgdGhlIHZhcmlhYmxlIG5hbWUKPiB0byAnZGJpJyB3aGVyZSBpdCByZWZl
cnMgdG8gdGhlIGludGVyZmFjZSBwYXJ0IG9mIHN0cnVjdCBtaXBpX2RiaS4KPiAKPiBGdW5jdGlv
bnMgdGhhdCB1c2UgYm90aCBmdXR1cmUgcGFydHMgd2lsbCBoYXZlIGJvdGggdmFyaWFibGVzIHRl
bXBvcmFyaWx5Cj4gcG9pbnRpbmcgdG8gdGhlIHNhbWUgc3RydWN0dXJlLgo+IAo+IENjOiBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNo
bm9sb2d5LmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+
IC0tLQoKQWNrZWQtYnk6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
