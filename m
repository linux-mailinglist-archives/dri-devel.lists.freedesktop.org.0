Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC891A11E65
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1E10E4EE;
	Wed, 15 Jan 2025 09:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CJyn/8Dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1288410E4EE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=j45rGLkLgoUeyM5Fm4pWiCglSnPWpfDAJDIcLJ2jHEQ=; b=C
 Jyn/8Dtu/YW60tDnXlRN/2SCo54Pv7N+Ixz+37Nqdu8cF8KZujBvdgdiUSAOCm8z
 vFBRLR7DCDZAODZFk6Y4ZUpOJrKKPk6UfyfLlAlND3GsjxhXGMlrw6EqI+FKdeGC
 D8YmZBgIAgQhh8eauExj9gA+jHw76tpi186LUE6AUM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Wed, 15 Jan 2025 17:45:37 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 15 Jan 2025 17:45:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:Re: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
 <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
X-NTES-SC: AL_Qu2YBPWYu0so4SiaY+lS/DNQ2YpmHKvs4olgqcQkZd0qqTHPyz4QZ0BuLUbI3d4CGI0eR17X31t020v2V4xA
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1302120.8c5b.194695aad26.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgD3P2bBg4dnrOBXAA--.35323W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRnVXmeHeqbdXAABsH
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERvdWcsCgrlnKggMjAyNS0wMS0xNSAwMDo0NDo0Me+8jCJEb3VnIEFuZGVyc29uIiA8ZGlh
bmRlcnNAY2hyb21pdW0ub3JnPiDlhpnpgZPvvJoKPkhpLAo+Cj5PbiBUdWUsIEphbiAxNCwgMjAy
NSBhdCAxOjA14oCvQU0gQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+Pgo+Pgo+
PiBIaSBBbGwsCj4+Cj4+IEF0IDIwMjUtMDEtMTMgMTg6MTc6MzgsICJBbmR5IFlhbiIgPGFuZHlz
aHJrQDE2My5jb20+IHdyb3RlOgo+PiA+Cj4+ID5Tb3JyeSwgcGxlYXNlIGRvbid0IG1lcmdlIHRo
aXMgcGF0Y2guIGFmdGVyIGZ1cnRoZXIgdGVzdGluZywKPj4gPkkgZm91bmQgdGhhdCB0aGVyZSBh
cmUgc3RpbGwgc29tZSBjaGFuZ2NlLCBpdCBjYW4ndCByZWFkIGVkaWQuCj4+Cj4+IEl0IHR1cm5z
IG91dCB0aGF0IHdlIG5lZWQgc2V0IGhwZC1yZWxpYWJsZS1kZWxheS1tcyA9IDEyMCBpbiBkdHMg
dG8gZW5zdXJlCj4+IHRoZSByaWdodCB0aW1lIHRvIGFjY2VzcyBlZGlkLgo+Cj5UaGF0IHNlZW1z
IGF3ZnVsbHkgaGlnaCBhbmQgZmVlbHMgbGlrZWx5IHRvIGJlIGEgcHJvYmxlbSB3aXRoIHlvdXIK
PmJvYXJkIGRlc2lnbiBhbmQgbm90IHRoZSBwYW5lbC4gQXJlIHlvdSBzdXJlIEhQRCBpcyBldmVu
IGhvb2tlZCB1cAo+cHJvcGVybHkgb24geW91ciBib2FyZD8gTWF5YmUgeW91J3JlIG1pc3Npbmcg
YSBwdWxsdXAvcHVsbGRvd24gY29uZmlnCj5zb21ld2hlcmU/IFdvdWxkIGl0IGJlIGJldHRlciB0
byBqdXN0IHNwZWNpZnkgIm5vLWhwZCIgYW5kIGdldCB0aGUKPmZ1bGwgIkhQRCBhYnNlbnQiIGRl
bGF5Pwo+CgpZZXMsIHlvdSBhcmUgcmlnaHQsIGFmdGVyIGNoZWNraW5nIHRoZSBzY2hlbWF0aWMs
IEkgZm91bmQgdGhhdCB0aGUgSERQIGluZGVlZCBkb2VzIG5vdApob29rZWQgdXAgb24gdGhlIGJv
YXJkLiAKCkkgZG8gbW9yZSB0ZXN0cyB3aXRoIGhwZC1yZWxpYWJsZS1kZWxheS1tcyB0byBhIHNo
b3J0IHZhbHVlLCBGcm9tIHRoZSBjdXJyZW50IHRlc3RzLCB0aGlzCnZhbHVlIGNhbiBiZSBzZXQg
YmVsb3cgMTAsIGV2ZW4gbG93ZXIsIGJ1dCBJIG5lZWQgdG8gZG8gbW9yZSB0ZXN0cyB0byBjb25m
aXJtIGhvdyBsb3cKaXQgY2FuIGFjdHVhbGx5IGJlIHNldOOAggoKVGhhbmsgeW91LgoKPgo+PiBT
byB0aGUgcGF0Y2ggaXMgb2ssIGl0IGlzIHJlYWR5IGZvciByZXZpZXcuCj4+Cj4+ID4KPj4gPkF0
IDIwMjUtMDEtMTMgMTY6NTk6NTQsICJBbmR5IFlhbiIgPGFuZHlzaHJrQDE2My5jb20+IHdyb3Rl
Ogo+PiA+PkFkZCBhbiBlRFAgcGFuZWwgZW50cnkgZm9yIEJPRSBOVjE0MEZITS1ONFouCj4+ID4+
Cj4+ID4+Tm8gZGF0YXNoZWV0IGZvdW5kIGZvciB0aGlzIHBhbmVsLgo+Cj5JIHNlZW0gdG8gYmUg
YWJsZSB0byBmaW5kIGEgZGF0YXNoZWV0IGZvciBzb21ldGhpbmcgdGhhdCBjYWxscyBpdHNlbGYK
Pk5WMTQwRkhNLU40WiwgYnV0IGl0IG1pZ2h0IGJlIGEgZGlmZmVyZW50IEhXIHZlcnNpb24gc2lu
Y2UgaXQgaGFzIGEKPmRpZmZlcmVudCBJRC4gSW4gbXkgZGF0YXNoZWV0LCB0aG91Z2gsICJwcmVw
YXJlX3RvX2VuYWJsZSIgc2hvdWxkIGJlCj44MCBmb3IgdGhpcyBwYW5lbCwgbm90IDIwMC4gVGhh
dCBtYXRjaGVzIGFub3RoZXIgbmVhcmJ5IHBhbmVsCj4iTlYxNDBXVU0tTjQxIi4gQXJlIHlvdSBz
dXJlIHlvdSBuZWVkIDIwMD8KPgo+Cj4+ID4+ZWRpZDoKPj4gPj4wMCBmZiBmZiBmZiBmZiBmZiBm
ZiAwMCAwOSBlNSAwOSAwYiAwMCAwMCAwMCAwMAo+PiA+PjAxIDIwIDAxIDA0IGE1IDFmIDExIDc4
IDAzIDliIDc1IDk5IDViIDVkIDhmIDJhCj4+ID4+MjMgNTAgNTQgMDAgMDAgMDAgMDEgMDEgMDEg
MDEgMDEgMDEgMDEgMDEgMDEgMDEKPj4gPj4wMSAwMSAwMSAwMSAwMSAwMSBjOCAzNyA4MCBjYyA3
MCAzOCAyOCA0MCA2YyAzMAo+PiA+PmFhIDAwIDM1IGFlIDEwIDAwIDAwIDFhIDAwIDAwIDAwIGZk
IDAwIDMwIDNjIDQzCj4+ID4+NDMgOGYgMDEgMGEgMjAgMjAgMjAgMjAgMjAgMjAgMDAgMDAgMDAg
ZmUgMDAgNDIKPj4gPj40ZiA0NSAyMCA0OCA0NiAwYSAyMCAyMCAyMCAyMCAyMCAyMCAwMCAwMCAw
MCBmZQo+PiA+PjAwIDRlIDU2IDMxIDM0IDMwIDQ2IDQ4IDRkIDJkIDRlIDM0IDVhIDBhIDAwIDM1
Cj4+ID4+Cj4+ID4+U2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+Cj4+
ID4+LS0tCj4+ID4+Cj4+ID4+IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYyB8IDEg
Kwo+PiA+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+RldJVyBpdCdzIGdvb2Qg
dGhhdCBUaG9tYXMgcmVwbGllZCB0byB5b3VyIHBhdGNoLCBzaW5jZSB0aGF0IHdhcyB0aGUKPm9u
bHkgdGhpbmcgdGhhdCBzaG93ZWQgdXAgaW4gbXkgaW5ib3guIFlvdXIgaW5pdGlhbCBwYXRjaCBz
aG93ZWQgdXAgYXMKPnNwYW0gZm9yIG1lLiA6KCBOb3Qgc3VyZSB3aHksIHRob3VnaC4uLgo+Cj4K
Pj4gPj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jCj4+ID4+aW5kZXggOTRhNDYyNDFkZWNlLi5h
MzQwMmI3NmFhM2UgMTAwNjQ0Cj4+ID4+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWVkcC5jCj4+ID4+KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jCj4+ID4+
QEAgLTE5MDksNiArMTkwOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZWRwX3BhbmVsX2VudHJ5
IGVkcF9wYW5lbHNbXSA9IHsKPj4gPj4gICAgICBFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdF
JywgMHgwYWM1LCAmZGVsYXlfMjAwXzUwMF9lNTAsICJOVjExNldITS1ONEMiKSwKPj4gPj4gICAg
ICBFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYWU4LCAmZGVsYXlfMjAwXzUwMF9l
NTBfcDJlODAsICJOVjE0MFdVTS1ONDEiKSwKPj4gPj4gICAgICBFRFBfUEFORUxfRU5UUlkoJ0In
LCAnTycsICdFJywgMHgwYjM0LCAmZGVsYXlfMjAwXzUwMF9lODAsICJOVjEyMldVTS1ONDEiKSwK
Pj4gPj4rICAgICBFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYjA5LCAmZGVsYXlf
MjAwXzUwMF9lNTBfcDJlMjAwLCAiTlYxNDBGSE0tTloiKSwKPj4gPj4gICAgICBFRFBfUEFORUxf
RU5UUlkoJ0InLCAnTycsICdFJywgMHgwYjQzLCAmZGVsYXlfMjAwXzUwMF9lMjAwLCAiTlYxNDBG
SE0tVDA5IiksCj4KPlRoaXMgaXMgbWlzLXNvcnRlZC4gMHhiMDkgc2hvdWxkIGJlIF9iZWZvcmVf
IDB4MGIzNC4gSSdsbCBvZnRlbiBmaXgKPnRoaXMgdXAgd2hlbiBhcHBseWluZyAodGhvdWdoIGl0
J3MgbW9yZSB3b3JrIGZvciBtZSksIGJ1dCBzaW5jZSBJIGhhZAo+YSBxdWVzdGlvbiBhYm92ZSBh
Ym91dCBkZWxheV8yMDBfNTAwX2U1MF9wMmUyMDAgdnMuCj5kZWxheV8yMDBfNTAwX2U1MF9wMmU4
MCBtYXliZSB5b3UgY2FuIGFuc3dlciBhbmQgYWxzbyBzZW5kIGEgdjIgd2l0aAo+dGhlIHNvcnQg
b3JkZXIgZml4ZWQuCj4KPi1Eb3VnCg==
