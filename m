Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C41240627
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DA16E420;
	Mon, 10 Aug 2020 12:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC6516E40D;
 Mon, 10 Aug 2020 12:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id CCC282A6042;
 Mon, 10 Aug 2020 14:49:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EcysNtrY1TyO; Mon, 10 Aug 2020 14:49:01 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 27D9D2A6016;
 Mon, 10 Aug 2020 14:49:01 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k57Ea-000Ve5-JI; Mon, 10 Aug 2020 14:49:00 +0200
Subject: Re: [PATCH 6/8] drm/amd/display: Set DC options from modifiers.
To: Daniel Vetter <daniel@ffwll.ch>, harry.wentland@amd.com,
 daniel@fooishbar.org, maraeo@gmail.com
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-7-bas@basnieuwenhuizen.nl>
 <20200805073210.GU6419@phenom.ffwll.local>
 <20200810122820.GJ2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <49e200cd-3df6-8a11-34f4-d1342a79f75e@daenzer.net>
Date: Mon, 10 Aug 2020 14:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200810122820.GJ2352366@phenom.ffwll.local>
Content-Language: en-CA
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0xMCAyOjI4IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4KPiBPayBqdXN0
IGxlYXJuZWQgdGhhdCBhbWRncHUgaGF0IHNldC9nZXRfdGlsaW5nLCBzbyBJJ20gdXBncmFkaW5n
IG15IGlkZWEKPiBoZXJlIHRvIGEgdmVyeSBzdHJvbmcgcmVjb21tZW5kYXRpb24sIGkuZS4gcGxl
YXNlIGRvIHRoaXMgZXhjZXB0IGlmCj4gdGhlcmUncyBhbmQgYW1kIGRkeCB3aGljaCBzb21laG93
IHdhbnRzIHRvIGNoYW5nZSB0aWxpbmcgbW9kZSB3aGlsZSBhIGZiCj4gZXhpc3RzLCBhbmQgZXhw
ZWN0cyB0aGlzIHRvIHByb3BhZ2F0ZS4KPiAKPiBJbiBpOTE1IHdlIGV2ZW4gZGlzYWxsb3cgdGhl
IHNldF90aWxpbmcgaW9jdGwgd2l0aCBhbiBlcnJvciBpZiBhbiBmYgo+IGV4aXN0cywganVzdCB0
byBtYWtlIHN1cmUgdXNlcnNwYWNlIGJlaGF2ZXMuIEV2ZW4gaWYgdXNlcnNwYWNlIHVzZXMKPiBz
ZXRfdGlsaW5nLCB0aGlzIHdheSB3ZSBjYW4gYXQgbGVhc3QgZW5mb3JjZSB0aGUgc2FtZSBzZW1h
bnRpY3Mgb2YgImNsaWVudAo+IGNhbid0IHB1bGwgY29tcG9zaXRvciBvdmVyIHRoZSB0YWJsZSB3
aXRoIGEgc2V0X3RpbGluZyBhdCB0aGUgd3JvbmcgdGltZSIKPiBvZiBtb2RpZmllcnMuCgpGV0lX
LCB4Zjg2LXZpZGVvLWFtZGdwdSBkb2Vzbid0IGhhdmUgYW55IGNvZGUgdG8gc2V0IHRoZSB0aWxp
bmcKbWV0YWRhdGEsIG9ubHkgTWVzYSBhbmQgcHJlc3VtYWJseSBBTUQncyBWdWxrYW4vT3BlbkdM
IFVNRHMgZG8uCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
