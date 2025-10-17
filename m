Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72EBE7508
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CEC10E027;
	Fri, 17 Oct 2025 08:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="BCNdO21o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030AC10E027
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=0I00pQnbY1u48SLSbfkjT/kC6CPcVg5dby2NqOBL3+k=; b=B
 CNdO21oTuVDDYpNEGDxqBTpsymKzpM4FzG/XkmpdVAk9FZEHsrHwtoFzZBBsj6si
 w7FLyqTo7h1hEPjRZqZUHKJqUkReB0k5FyxNNWSTls0p+d/8FjzRUdF3/twcUef8
 JkMF4RsTTxEu8yC4QwDVohHV862zRxhK0WwwmR9LcA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Fri, 17 Oct 2025 16:56:38 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 17 Oct 2025 16:56:38 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maud Spierings" <maud_spierings@murena.io>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 knaerzche@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re:Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi
 bridge library
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
References: <20251016083843.76675-3-andyshrk@163.com>
 <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
X-NTES-SC: AL_Qu2dAvqSvksi7iKcZekfmUgWjuw/WsG1v/Ul1YBSP556jC/r8zkjQUF9DEnN7/uOLACpsBq9WjdwxuR2UoVeWLsLcVeD6Y6TtCYHViqiBA2GRw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgAnDpjGBPJodsENAA--.5725W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gTpXmjyAwEUgwACss
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

CgpIZWxsbyBNYXVk77yMCgpBdCAyMDI1LTEwLTE3IDE1OjU4OjIyLCAiTWF1ZCBTcGllcmluZ3Mi
IDxtYXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+IHdyb3RlOgo+SGkgQW5keSwKPgo+PiBGcm9tOiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IAo+PiBBZGQgZW50cnkgZm9yIElu
bm9zaWxpY29uIGhkbWkgYnJpZGdlIGxpYnJhcnkKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkg
WWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+IAo+PiAobm8gY2hhbmdlcyBz
aW5jZSB2MSkKPj4gCj4+ICBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKPj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCj4+IGluZGV4IGY5Zjk4NWM3ZDc0NzkuLjBhZGNmYjFjMjY0YTEgMTAwNjQ0Cj4+
IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5UQUlORVJTCj4+IEBAIC0xMjI5OSw2ICsx
MjI5OSwxNCBAQCBNOglTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPj4gIFM6
CU1haW50YWluZWQKPj4gIEY6CWRyaXZlcnMvcG93ZXIvc3VwcGx5L2lwNXh4eF9wb3dlci5jCj4+
ICAKPj4gK0lOTk9TSUxJQ09OIEhETUkgQlJJREdFIERSSVZFUgo+PiArTToJQW5keSBZYW4gPGFu
ZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiArTDoJZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+PiArUzoJTWFpbnRhaW5lZAo+PiArVDoJZ2l0IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwuZ2l0Cj4+ICtGOglkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2lubm8taGRtaS5jCj4+ICtGOglpbmNsdWRlL2RybS9icmlkZ2UvaW5ub19oZG1pLmgKPj4gKwo+
PiAgSU5PVElGWQo+PiAgTToJSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPj4gIFI6CUFtaXIgR29s
ZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Cj4+IC0tIAo+PiAyLjQzLjAKPgo+SSBiZWxpZXZl
IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIHNxdWFzaGVkIGludG8gdGhlIHBhdGNoIHRoYXQgYWN0dWFs
bHkgCj5jcmVhdGVzIHRoZSBmaWxlcyBsaXN0ZWQgaW4gdGhlIE1BSU5UQUlORVJTIGVudHJ5LCBs
aWtlIEkgZG8gaGVyZSBbMV0uIAo+Q2hlY2twYXRjaCBzaG91bGQgYmUgY29tcGxhaW5pbmcgYWJv
dXQgcGF0Y2ggWzEvMl0gaWYgSSdtIG5vdCBtaXN0YWtlbiwgCj53aGVuIHlvdSBydW4gYGI0IHBy
ZXAgLS1jaGVja2AuCgpXZSB0YWxrZWQgYWJvdXQgc29tZXRoaW5nIHNpbWlsYXIgaGVyZVsyXe+8
mgpNYXhpbWUgYmVsaWV2ZXMgdGhleSBzaG91bGQgYmUgc2VwYXJhdGUgcGF0Y2hlcywgCkFuZCBJ
J3ZlIHNlZW4gbWFueSBtZXJnZWQgY29tbWl0cyBpbiB0aGUga2VybmVsIGFyZSBhbHNvIGhhbmRs
ZSBNQUlOVEFJTkVSUyBlbnRyeSBhcyBzZXBhcmF0ZSBwYXRjaGVzCgoKWzJdaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcm9ja2NoaXAvM3lncW5qNGlkZXk3dTRtN2x0bHY3cG5maGtrdmNl
cG1wZmRpamRzemN0YWVvcHEza3lAcXRlZzMzY29tamwzLwoKPgo+TGluazogCj5odHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMDktbWF4MjUwMTQtdjQtMS02YWRiMmEwYWEzNWZAZ29j
b250cm9sbC5jb20vIAo+WzFdCj4KPktpbmQgcmVnYXJkcywKPk1hdWQK
