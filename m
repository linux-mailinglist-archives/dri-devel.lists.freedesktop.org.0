Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6314C80E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 10:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532DC6F4BB;
	Wed, 29 Jan 2020 09:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80C1B6F4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 09:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B57F42A6046;
 Wed, 29 Jan 2020 10:27:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HE9flYZDI3m3; Wed, 29 Jan 2020 10:27:58 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0CE6B2A6045;
 Wed, 29 Jan 2020 10:27:57 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1iwjdd-000h85-Bi; Wed, 29 Jan 2020 10:27:57 +0100
Subject: Re: [PATCH] radeon: completely remove lut leftovers
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200129080904.1637634-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <cd92a954-2c2b-3621-333f-fd6136c8cec7@daenzer.net>
Date: Wed, 29 Jan 2020 10:27:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129080904.1637634-1-daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMS0yOSA5OjA5IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gVGhpcyBpcyBh
biBvdmVyc2lnaHQgZnJvbQo+IAo+IGNvbW1pdCA0MjU4NTM5NWViYzEwMzRhOTg5Mzc3MDI4NDk2
NjlmMTdlYWRiMzVmCj4gQXV0aG9yOiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgo+IERh
dGU6ICAgVGh1IEp1bCAxMyAxODoyNTozNiAyMDE3ICswMjAwCj4gCj4gICAgIGRybTogcmFkZW9u
OiByZW1vdmUgZGVhZCBjb2RlIGFuZCBwb2ludGxlc3MgbG9jYWwgbHV0IHN0b3JhZ2UKPiAKPiB2
MjogQWxzbyByZW1vdmUgbGVmdG92ZXIgbG9jYWwgdmFyaWFibGUuCj4gCj4gQ2M6IFBldGVyIFJv
c2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+
CgpJIGRvbid0IHRoaW5rIHRoaXMgZS1tYWlsIGFkZHJlc3Mgd29ya3MgYW55bW9yZS4KCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpSZXZp
ZXdlZC1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgoKLS0gCkVhcnRo
bGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczov
L3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAg
ICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
