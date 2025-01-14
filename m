Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588DDA102AB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554C10E88E;
	Tue, 14 Jan 2025 09:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="MFwsXRCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id D220910E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=4Pn5gx7nWdiDfnPsKzLVKH35+lotwvOPRDO99HdjXKQ=; b=M
 FwsXRCnxdmd03GPFnhst8xG1HkhjkuMY+N6mXZL4c0p8acDpUJbibaJsLMmZGHQt
 82oOor0D1HzPUT+oL1gNS/TKPxQ4XSl7lpzRIOsXG4FsVsxslS3LTzQ90xg8ld/s
 QhwrzhohgxxNFx7upCCLplw66te9a+lnJlfreSPb1A=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Tue, 14 Jan 2025 17:04:56 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 14 Jan 2025 17:04:56 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: dianders@chromium.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
X-NTES-SC: AL_Qu2YBPSfukwi4CGZZ+lS/DNQ2YpmHKvs4olgqcQkZd0qqTHPyz4QZ0BuLUbI3d7hqbYf6SPoTIqdoCMnTc01
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgD3_wu4KIZnq99WAA--.31660W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hDUXmeGH33ONAACsz
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

CkhpIEFsbCwKCkF0IDIwMjUtMDEtMTMgMTg6MTc6MzgsICJBbmR5IFlhbiIgPGFuZHlzaHJrQDE2
My5jb20+IHdyb3RlOgo+Cj5Tb3JyeSwgcGxlYXNlIGRvbid0IG1lcmdlIHRoaXMgcGF0Y2guIGFm
dGVyIGZ1cnRoZXIgdGVzdGluZywgCj5JIGZvdW5kIHRoYXQgdGhlcmUgYXJlIHN0aWxsIHNvbWUg
Y2hhbmdjZSwgaXQgY2FuJ3QgcmVhZCBlZGlkLgoKSXQgdHVybnMgb3V0IHRoYXQgd2UgbmVlZCBz
ZXQgaHBkLXJlbGlhYmxlLWRlbGF5LW1zID0gMTIwIGluIGR0cyB0byBlbnN1cmUKdGhlIHJpZ2h0
IHRpbWUgdG8gYWNjZXNzIGVkaWQuClNvIHRoZSBwYXRjaCBpcyBvaywgaXQgaXMgcmVhZHkgZm9y
IHJldmlldy4KCj4KPkF0IDIwMjUtMDEtMTMgMTY6NTk6NTQsICJBbmR5IFlhbiIgPGFuZHlzaHJr
QDE2My5jb20+IHdyb3RlOgo+PkFkZCBhbiBlRFAgcGFuZWwgZW50cnkgZm9yIEJPRSBOVjE0MEZI
TS1ONFouCj4+Cj4+Tm8gZGF0YXNoZWV0IGZvdW5kIGZvciB0aGlzIHBhbmVsLgo+Pgo+PmVkaWQ6
Cj4+MDAgZmYgZmYgZmYgZmYgZmYgZmYgMDAgMDkgZTUgMDkgMGIgMDAgMDAgMDAgMDAKPj4wMSAy
MCAwMSAwNCBhNSAxZiAxMSA3OCAwMyA5YiA3NSA5OSA1YiA1ZCA4ZiAyYQo+PjIzIDUwIDU0IDAw
IDAwIDAwIDAxIDAxIDAxIDAxIDAxIDAxIDAxIDAxIDAxIDAxCj4+MDEgMDEgMDEgMDEgMDEgMDEg
YzggMzcgODAgY2MgNzAgMzggMjggNDAgNmMgMzAKPj5hYSAwMCAzNSBhZSAxMCAwMCAwMCAxYSAw
MCAwMCAwMCBmZCAwMCAzMCAzYyA0Mwo+PjQzIDhmIDAxIDBhIDIwIDIwIDIwIDIwIDIwIDIwIDAw
IDAwIDAwIGZlIDAwIDQyCj4+NGYgNDUgMjAgNDggNDYgMGEgMjAgMjAgMjAgMjAgMjAgMjAgMDAg
MDAgMDAgZmUKPj4wMCA0ZSA1NiAzMSAzNCAzMCA0NiA0OCA0ZCAyZCA0ZSAzNCA1YSAwYSAwMCAz
NQo+Pgo+PlNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgo+Pi0tLQo+
Pgo+PiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZWRwLmMgfCAxICsKPj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1lZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYwo+Pmlu
ZGV4IDk0YTQ2MjQxZGVjZS4uYTM0MDJiNzZhYTNlIDEwMDY0NAo+Pi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1lZHAuYwo+PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1lZHAuYwo+PkBAIC0xOTA5LDYgKzE5MDksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVkcF9w
YW5lbF9lbnRyeSBlZHBfcGFuZWxzW10gPSB7Cj4+IAlFRFBfUEFORUxfRU5UUlkoJ0InLCAnTycs
ICdFJywgMHgwYWM1LCAmZGVsYXlfMjAwXzUwMF9lNTAsICJOVjExNldITS1ONEMiKSwKPj4gCUVE
UF9QQU5FTF9FTlRSWSgnQicsICdPJywgJ0UnLCAweDBhZTgsICZkZWxheV8yMDBfNTAwX2U1MF9w
MmU4MCwgIk5WMTQwV1VNLU40MSIpLAo+PiAJRURQX1BBTkVMX0VOVFJZKCdCJywgJ08nLCAnRScs
IDB4MGIzNCwgJmRlbGF5XzIwMF81MDBfZTgwLCAiTlYxMjJXVU0tTjQxIiksCj4+KwlFRFBfUEFO
RUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYjA5LCAmZGVsYXlfMjAwXzUwMF9lNTBfcDJlMjAw
LCAiTlYxNDBGSE0tTloiKSwKPj4gCUVEUF9QQU5FTF9FTlRSWSgnQicsICdPJywgJ0UnLCAweDBi
NDMsICZkZWxheV8yMDBfNTAwX2UyMDAsICJOVjE0MEZITS1UMDkiKSwKPj4gCUVEUF9QQU5FTF9F
TlRSWSgnQicsICdPJywgJ0UnLCAweDBiNTYsICZkZWxheV8yMDBfNTAwX2U4MCwgIk5UMTQwRkhN
LU40NyIpLAo+PiAJRURQX1BBTkVMX0VOVFJZKCdCJywgJ08nLCAnRScsIDB4MGI2NiwgJmRlbGF5
XzIwMF81MDBfZTgwLCAiTkUxNDBXVU0tTjZHIiksCj4+LS0gCj4+Mi40My4wCg==
