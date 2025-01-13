Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7593A0B45A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BBD10E293;
	Mon, 13 Jan 2025 10:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="GhHMB85s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4ECF610E293
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=PJJYbVYGKq+W4tNI2VDg2il/br6PIVNmIjTr4ygH7gw=; b=G
 hHMB85sAa5XsdH5AwPJbmJCQ97gRce7x5qME34U6RJ4XwGYPC34xNlgGxltIc1Jl
 tStvPb/GepC6r2GfF6PnI8Yo4g0JsM/kI2b9iPSGwc5kxFwZZp2gY/IY47jJddHk
 X6J3PBtC+c3pUde4SHz26CKKYF/hpzMWKS9v3MWJlg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Mon, 13 Jan 2025 18:17:38 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 13 Jan 2025 18:17:38 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: dianders@chromium.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250113085956.2150207-1-andyshrk@163.com>
References: <20250113085956.2150207-1-andyshrk@163.com>
X-NTES-SC: AL_Qu2YBPudvEwu7iaRYOlS/DNQ2YpmHKvs4olgqcQkZd0qqTHPyz4QZ0BuLUbI3d7jp8hyGCbtT+6NIW1kO2lY
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgC3HztC6IRnFQdWAA--.29080W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAjTXmeE4JC5iwABsN
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

ClNvcnJ5LCBwbGVhc2UgZG9uJ3QgbWVyZ2UgdGhpcyBwYXRjaC4gYWZ0ZXIgZnVydGhlciB0ZXN0
aW5nLCAKSSBmb3VuZCB0aGF0IHRoZXJlIGFyZSBzdGlsbCBzb21lIGNoYW5nY2UsIGl0IGNhbid0
IHJlYWQgZWRpZC4KCkF0IDIwMjUtMDEtMTMgMTY6NTk6NTQsICJBbmR5IFlhbiIgPGFuZHlzaHJr
QDE2My5jb20+IHdyb3RlOgo+QWRkIGFuIGVEUCBwYW5lbCBlbnRyeSBmb3IgQk9FIE5WMTQwRkhN
LU40Wi4KPgo+Tm8gZGF0YXNoZWV0IGZvdW5kIGZvciB0aGlzIHBhbmVsLgo+Cj5lZGlkOgo+MDAg
ZmYgZmYgZmYgZmYgZmYgZmYgMDAgMDkgZTUgMDkgMGIgMDAgMDAgMDAgMDAKPjAxIDIwIDAxIDA0
IGE1IDFmIDExIDc4IDAzIDliIDc1IDk5IDViIDVkIDhmIDJhCj4yMyA1MCA1NCAwMCAwMCAwMCAw
MSAwMSAwMSAwMSAwMSAwMSAwMSAwMSAwMSAwMQo+MDEgMDEgMDEgMDEgMDEgMDEgYzggMzcgODAg
Y2MgNzAgMzggMjggNDAgNmMgMzAKPmFhIDAwIDM1IGFlIDEwIDAwIDAwIDFhIDAwIDAwIDAwIGZk
IDAwIDMwIDNjIDQzCj40MyA4ZiAwMSAwYSAyMCAyMCAyMCAyMCAyMCAyMCAwMCAwMCAwMCBmZSAw
MCA0Mgo+NGYgNDUgMjAgNDggNDYgMGEgMjAgMjAgMjAgMjAgMjAgMjAgMDAgMDAgMDAgZmUKPjAw
IDRlIDU2IDMxIDM0IDMwIDQ2IDQ4IDRkIDJkIDRlIDM0IDVhIDBhIDAwIDM1Cj4KPlNpZ25lZC1v
ZmYtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgo+LS0tCj4KPiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtZWRwLmMgfCAxICsKPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYwo+aW5kZXggOTRhNDYyNDFkZWNlLi5hMzQw
MmI3NmFhM2UgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZWRwLmMK
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYwo+QEAgLTE5MDksNiArMTkw
OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZWRwX3BhbmVsX2VudHJ5IGVkcF9wYW5lbHNbXSA9
IHsKPiAJRURQX1BBTkVMX0VOVFJZKCdCJywgJ08nLCAnRScsIDB4MGFjNSwgJmRlbGF5XzIwMF81
MDBfZTUwLCAiTlYxMTZXSE0tTjRDIiksCj4gCUVEUF9QQU5FTF9FTlRSWSgnQicsICdPJywgJ0Un
LCAweDBhZTgsICZkZWxheV8yMDBfNTAwX2U1MF9wMmU4MCwgIk5WMTQwV1VNLU40MSIpLAo+IAlF
RFBfUEFORUxfRU5UUlkoJ0InLCAnTycsICdFJywgMHgwYjM0LCAmZGVsYXlfMjAwXzUwMF9lODAs
ICJOVjEyMldVTS1ONDEiKSwKPisJRURQX1BBTkVMX0VOVFJZKCdCJywgJ08nLCAnRScsIDB4MGIw
OSwgJmRlbGF5XzIwMF81MDBfZTUwX3AyZTIwMCwgIk5WMTQwRkhNLU5aIiksCj4gCUVEUF9QQU5F
TF9FTlRSWSgnQicsICdPJywgJ0UnLCAweDBiNDMsICZkZWxheV8yMDBfNTAwX2UyMDAsICJOVjE0
MEZITS1UMDkiKSwKPiAJRURQX1BBTkVMX0VOVFJZKCdCJywgJ08nLCAnRScsIDB4MGI1NiwgJmRl
bGF5XzIwMF81MDBfZTgwLCAiTlQxNDBGSE0tTjQ3IiksCj4gCUVEUF9QQU5FTF9FTlRSWSgnQics
ICdPJywgJ0UnLCAweDBiNjYsICZkZWxheV8yMDBfNTAwX2U4MCwgIk5FMTQwV1VNLU42RyIpLAo+
LS0gCj4yLjQzLjAK
