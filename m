Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B554A70A81
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4692A89D89;
	Mon, 22 Jul 2019 20:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA3589D89
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:19:32 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52368 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpemQ-007UU3-SV; Mon, 22 Jul 2019 16:19:30 -0400
Subject: Re: [PATCH v2 3/9] drm/tinydrm: Rename remaining variable mipi ->
 dbidev
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-4-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <b117757c-fd0d-7969-54ce-dbe25c600cbf@lechnology.com>
Date: Mon, 22 Jul 2019 15:19:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-4-noralf@tronnes.org>
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
 bh=GCOAmCmx+aUWAqAlsGIGws7rkaDTjF764noHOcQwHRE=; b=gZWieXV2LM/4TYJNQEIviIptAB
 emm2WqsYKIXwrxvKgIVpP7xtd9SHhXZK9/2Z4cvJB8JqMfDvSB7bJ7wxvAzSFqYR/MRiEjJY5dI8C
 U0yRiWMn7puxPcW7cXLBABnWzFt8Rent43S6WHTT4pqg9NCbabXUdovdPko/3gD7SgFjGhxdWe1vr
 wlOUfsH9MpklWcMp3v5ho+dyeuYZlSGxbqt8QSQkG3/SRqByE+wYxYpdKGvWSP+zdAgQ58Ermkgld
 NKaGxJuaSebq37GM88WVzJFW2ohLrVdZxzGVLxCwXJXpTWZT6QKV2WZMPDEA8XhgTWneBgwpFHwOQ
 F2ANgElQ==;
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
IHBhdGNoIGNoYW5nZXMgdGhlIHZhcmlhYmxlIG5hbWUKPiB0byAnZGJpZGV2JyB3aGVyZSBpdCBy
ZWZlcnMgdG8gdGhlIHBpcGVsaW5lIHBhcnQgb2Ygc3RydWN0IG1pcGlfZGJpLgo+IAo+IENjOiBF
cmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBs
ZWNobm9sb2d5LmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
Pgo+IC0tLQoKQWNrZWQtYnk6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
