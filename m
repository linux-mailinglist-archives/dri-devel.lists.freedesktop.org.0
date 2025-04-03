Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3EA799CE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 03:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DAF10E185;
	Thu,  3 Apr 2025 01:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="a5+8K1b8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id F089610E185
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 01:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=vXp/4TYR9/zzfCV+PTqmdxbyCOY2QQST3egC5LaB1TE=; b=a
 5+8K1b8XeCGZSR1RJ0SeJrDZlIfW8c1ZENEc8U225eTvwk9d0DPYxUghUFhW6qaI
 Mrpo1e8WUrJt4HRyRI6en92vFMf4YnGmKMYH9SgP1ByRPXxsIovK+IT56LIxe4Lx
 M9hr9+4fMTvynx3fSqQGK6kt6UflDwI3I7Iefom9/M=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Thu, 3 Apr 2025 09:49:35 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 3 Apr 2025 09:49:35 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de,
 "Andy Yan" <andy.yan@rock-chips.com>, dmitry.baryshkov@oss.qualcomm.com
Subject: Re:[PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250314075754.539221-1-andyshrk@163.com>
References: <20250314075754.539221-1-andyshrk@163.com>
X-NTES-SC: AL_Qu2fAfqfu0Es4yaYZukfmkcVgOw9UcO5v/Qk3oZXOJF8jDvp6CEgd21jJ0DK6eeEOiqAjTi3YBx39upQfaBdUrMAyVPhYVx7fETPIuJHQPI3Ag==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4d4460.1cc4.195f956e1f7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cigvCgD3_zwv6e1nC6yNAA--.9840W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAskXmft4vBCUwABsR
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

CgogR2VudGxlIHBpbmcuLi4uLi4KCkF0IDIwMjUtMDMtMTQgMTU6NTc6NDcsICJBbmR5IFlhbiIg
PGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+RnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2st
Y2hpcHMuY29tPgo+Cj5JdCBpcyBub3QgcmVjb21tZW5kZWQgZm9yIGRyaXZlcnMgdG8gaW5jbHVk
ZSBVQVBJIGhlYWRlcgo+ZGlyZWN0bHkuCj4KPlNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5
LnlhbkByb2NrLWNoaXBzLmNvbT4KPi0tLQo+Cj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMgfCA0ICsrLS0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYwo+aW5kZXggMDg5MGFkZDVmNzA3Li4zMDZlMDlhMjRhMWMgMTAwNjQ0Cj4tLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+KysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPkBAIC0yMiw4ICsyMiw4IEBACj4gCj4gI2lu
Y2x1ZGUgPG1lZGlhL2NlYy1ub3RpZmllci5oPgo+IAo+LSNpbmNsdWRlIDx1YXBpL2xpbnV4L21l
ZGlhLWJ1cy1mb3JtYXQuaD4KPi0jaW5jbHVkZSA8dWFwaS9saW51eC92aWRlb2RldjIuaD4KPisj
aW5jbHVkZSA8bGludXgvbWVkaWEtYnVzLWZvcm1hdC5oPgo+KyNpbmNsdWRlIDxsaW51eC92aWRl
b2RldjIuaD4KPiAKPiAjaW5jbHVkZSA8ZHJtL2JyaWRnZS9kd19oZG1pLmg+Cj4gI2luY2x1ZGUg
PGRybS9kaXNwbGF5L2RybV9oZG1pX2hlbHBlci5oPgo+LS0gCj4yLjM0LjEK
