Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D0A18ED7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C6F10E1A9;
	Wed, 22 Jan 2025 09:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="T1R5vCYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8385010E1A9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=PqQdaUqkdHlGiWWk3ENJJX61puJuMPc09OfIxsrMZEs=; b=T
 1R5vCYt57r1hKOy3PId1QVHcS8cS+SzuQWsYZr3M3wYG5nvSSrH4PJ3A0O7YUa8s
 ec3im7UzT3Yej69OE7rofptTY4lS6cc5Okd9LA8E+SCujnpa+PZVNI2wh9fUthX5
 2BvrXZpYKH96vyZqByoAXhRnLi+7dnX0pX99MDKUTg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Wed, 22 Jan 2025 17:52:48 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 22 Jan 2025 17:52:48 +0800 (CST)
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
In-Reply-To: <c6ee51bf-e264-44d6-8e22-f50a30848237@kernel.org>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103446.2528212-1-andyshrk@163.com>
 <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
 <6ccc6e2.6afc.1948d580c9c.Coremail.andyshrk@163.com>
 <c6ee51bf-e264-44d6-8e22-f50a30848237@kernel.org>
X-NTES-SC: AL_Qu2YBfmYtk0t7iWdZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5Mb/2NnfBECzszXPSE30hsDtA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7869aa80.6ec2.1948d6dc3ae.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDH7_Pwv5Bng8pcAA--.18456W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQPcXmeQtfaqlwAFsk
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

CkhpCgpBdCAyMDI1LTAxLTIyIDE3OjQzOjM0LCAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj5PbiAyMi8wMS8yMDI1IDEwOjI5LCBBbmR5IFlhbiB3cm90ZToK
Pj4gCj4+IEhpCj4+IEF0IDIwMjUtMDEtMjIgMTY6MDM6MDAsICJLcnp5c3p0b2YgS296bG93c2tp
IiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj4+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDA2
OjM0OjQ0UE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+Pj4+IEZyb206IEFuZHkgWWFuIDxhbmR5
LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4+Pgo+Pj4+IFByb3BlcnRpZSAicm9ja2NoaXAsZ3JmIiBp
cyByZXF1aXJlZCBmb3IgcmszNTY2LzguCj4+Pgo+Pj4gRml4IHR5cG9zLgo+Pj4KPj4+IFdoeT8g
V2hhdCB3ZSBzZWUgZnJvbSB0aGUgZGlmZi4uLgo+PiAKPj4gVGhpcyBwcm9wZXJ0eSBpcyB1c2Vk
IGluIGR0cywgc2VlIHZvcCBkdCBub2RlIGluIHJrMzU2eC1iYXNlLmR0c2ksCj4KPgo+VGhpcyBp
cyBub3QgdGhlIHJlYXNvbiB0byBtYWtlIGl0IGEgcmVxdWlyZWQgcHJvcGVydHkuCgpUaGUgQ2xv
Y2sgUG9sYXJpdHkgb2YgUkdCIHNpZ25hbCBvdXRwdXQgaXMgY29udHJvbGxlZCBieSBHUkYuCiAK
Pgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCg==
