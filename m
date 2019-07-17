Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CE6C23C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 22:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081A489E3B;
	Wed, 17 Jul 2019 20:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EE16E2A8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 20:38:33 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52316 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hnqh6-007z1u-2F; Wed, 17 Jul 2019 16:38:32 -0400
Subject: Re: [PATCH 09/10] drm/tinydrm/mipi-dbi: Add
 mipi_dbi_init_with_formats()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-10-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <87f5977a-cd21-2ded-496a-cc175e68c092@lechnology.com>
Date: Wed, 17 Jul 2019 15:38:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717115817.30110-10-noralf@tronnes.org>
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
 bh=VWPKjnowQBVc+hQsdTIW/Y4Ii+rvrvFyE9SFOReLwe0=; b=LP4o+M/XH+wBAhlV8b+j3e+K4C
 nCBRLR9P5fG8alomkzjcd0JQAtd2mxlBsLn82XEctvdKfJVMbGZUrVDygOz4zHxo6GclIgZ5nRE32
 ONtr43JBpDvm55diQUI8RsvuYOcWtOMbBkI4Ni5Clu5cj8oWI8wdBfjzAVRsYfH3CkGhWkcu0INo4
 aU8j59SHcjY5NE2kM7OdZby7Uj0dDX2PZ5qG9dFOovjsHOgvMLr7l9QHH23ngXr02tv8j/5AW62pz
 RIYPB9zhHmDoA5oRr4ltbF+qcYQRNzDplKwO9xsmK+7Ud0QFW5TwJf0cOQFe8GLbOO3SHD4a0cgap
 USA49oMA==;
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

T24gNy8xNy8xOSA2OjU4IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhlIE1JUEkgREJJ
IHN0YW5kYXJkIHN1cHBvcnQgbW9yZSBwaXhlbCBmb3JtYXRzIHRoYW4gd2hhdCB0aGlzIGhlbHBl
cgo+IHN1cHBvcnRzLiBBZGQgYW4gaW5pdCBmdW5jdGlvbiB0aGF0IGxldHMgdGhlIGRyaXZlciB1
c2UgZGlmZmVyZW50Cj4gZm9ybWF0KHMpLiBUaGlzIGF2b2lkcyBvcGVuIGNvZGluZyBtaXBpX2Ri
aV9pbml0KCkgaW4gc3Q3NTg2Lgo+IAo+IHN0NzU4NiBzZXRzIHByZWZlcnJlZF9kZXB0aCBidXQg
dGhpcyBpcyBub3QgbmVjZXNzYXJ5IHNpbmNlIGl0IG9ubHkKPiBzdXBwb3J0cyBvbmUgZm9ybWF0
LgoKQWx0aG91Z2ggdGhhdCBtaWdodCBub3QgYWx3YXlzIGJlIHRoZSBjYXNlLiBGWUksIHdlIGFy
ZSBmaW5kaW5nIHRoYXQKaGF2aW5nIFhSR0I4ODg4IGZvciBhIDJicHAgZ3JheXNjYWxlIGRpc3Bs
YXkgaXMgbm90IHRoZSBncmVhdGVzdC4gV2hlbgp3ZSB3YW50IHRvIGRvIGRpcmVjdCBkcmF3aW5n
IG9uIHRoZSBzY3JlZW4sIHdlIGhhdmVuJ3QgZm91bmQgdmVyeSBnb29kCnN1cHBvcnQgaW4gZXhp
c3RpbmcgZ3JhcGhpY3MgbGlicmFyaWVzIGZvciBlbWJlZGRlZCBzeXN0ZW1zIGZvciB0aGlzCmZv
cm1hdC4gSWYgSSBoYWQgbW9yZSBmcmVlIHRpbWUsIEkgd291bGQgbGlrZSB0byBsb29rIGF0IGFk
ZGluZwpncmF5c2NhbGUgc3VwcG9ydCB0byBEUk0uCgo+IAo+IENjOiBEYXZpZCBMZWNobmVyIDxk
YXZpZEBsZWNobm9sb2d5LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0KCkFja2VkLWJ5OiBEYXZpZCBMZWNobmVyIDxkYXZpZEBs
ZWNobm9sb2d5LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
