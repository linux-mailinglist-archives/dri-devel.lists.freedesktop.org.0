Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C87A18E4F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7040110E2F2;
	Wed, 22 Jan 2025 09:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="T283zZMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id F3AEE10E2F2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=H00FnMznIWJYmbnYuG8IMJ8qP5oUolnuSyMtcLYErrM=; b=T
 283zZMu8grfBe68CmPjz3lAQtMZkby8Pxb/9ZF9ab43KP4qSF9m5IXwerd1UxKHT
 arvQyd/DRnwUR7G0/zKFEbYXqrVRtLyW/KEtURU7c1YNgXH0ISiMCeNHwabx7COX
 yfxbLYchVeoGawqV5PsNU2TjhSxkWXkKXF4J08nY5E=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Wed, 22 Jan 2025 17:29:05 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 22 Jan 2025 17:29:05 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
 sebastian.reichel@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v12 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf propertie for rk3566/8
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103446.2528212-1-andyshrk@163.com>
 <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
X-NTES-SC: AL_Qu2YBfmYt0kv4ySbZekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5MbMYJR3vOT7FDdj3CPoysF1Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6ccc6e2.6afc.1948d580c9c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDnD_RhupBn98RcAA--.18267W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g-cXmeQsrGf6gACsc
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

CkhpCkF0IDIwMjUtMDEtMjIgMTY6MDM6MDAsICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPk9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDA2OjM0OjQ0UE0gKzA4
MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlw
cy5jb20+Cj4+IAo+PiBQcm9wZXJ0aWUgInJvY2tjaGlwLGdyZiIgaXMgcmVxdWlyZWQgZm9yIHJr
MzU2Ni84Lgo+Cj5GaXggdHlwb3MuCj4KPldoeT8gV2hhdCB3ZSBzZWUgZnJvbSB0aGUgZGlmZi4u
LgoKVGhpcyBwcm9wZXJ0eSBpcyB1c2VkIGluIGR0cywgc2VlIHZvcCBkdCBub2RlIGluIHJrMzU2
eC1iYXNlLmR0c2ksCmJ1dCBub3QgcmVxdWlyZWQgaW4gdGhlIGJpbmRpbmcuCgo+Cj5CZXN0IHJl
Z2FyZHMsCj5Lcnp5c3p0b2YK
