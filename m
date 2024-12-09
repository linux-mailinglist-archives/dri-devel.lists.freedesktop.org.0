Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B349E9453
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D079910E00D;
	Mon,  9 Dec 2024 12:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="IVrn3OA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 268C210E0FC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=LaOYKVDmrqOKFM0qeCpR4W8+8hRK1FIfAU8Js6TT/Hc=; b=I
 Vrn3OA544FhRcBAUJW68eJRfwgaqKYV99oG+2rBqLw+7IMie74PL1IUNzj++jOXw
 NIhD6nvAetCqghYUqM/rS7mAeVJxeywbwikxF6pAGMHv9rWYaa0fPH0qUTDdHBNG
 4tJ/qUurvq5e9IJwWPnHvnQC5I5q/IKKJQZsau7/9Y=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Mon, 9 Dec 2024 20:36:34 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 9 Dec 2024 20:36:34 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
 detlev.casanova@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:[PATCH] arm64: dts: rockchip: Add vop for rk3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241209122943.2781431-2-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-2-andyshrk@163.com>
X-NTES-SC: AL_Qu2YAfufuE8i4iibZ+kZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY46t/2HedzTsYgGujvXayff0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <34ce9ef5.ba77.193ab6be398.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgAXlJxT5FZn69E6AA--.43103W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw6wXmdW3sfiXQADsH
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

ClNvcnJ5LCBwbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guCgpBdCAyMDI0LTEyLTA5IDIwOjI5OjEx
LCAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPkZyb206IEFuZHkgWWFuIDxh
bmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPgo+U2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHku
eWFuQHJvY2stY2hpcHMuY29tPgo+LS0tCj4gYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9y
azM1NzYuZHRzaSB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrLQo+IDEgZmlsZSBjaGFuZ2Vk
LCA2OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU3Ni5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
b2NrY2hpcC9yazM1NzYuZHRzaQo+aW5kZXggNzBkZGVkYjBjODkwLi40NTgyM2E3NThiNmUgMTAw
NjQ0Cj4tLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU3Ni5kdHNpCj4rKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU3Ni5kdHNpCj5AQCAtMzkzLDYgKzM5
MywxMSBAQCBvcHAtOTUwMDAwMDAwIHsKPiAJCX07Cj4gCX07Cj4gCj4rCWRpc3BsYXlfc3Vic3lz
dGVtOiBkaXNwbGF5LXN1YnN5c3RlbSB7Cj4rCQljb21wYXRpYmxlID0gInJvY2tjaGlwLGRpc3Bs
YXktc3Vic3lzdGVtIjsKPisJCXBvcnRzID0gPCZ2b3Bfb3V0PjsKPisJfTsKPisKPiAJZmlybXdh
cmUgewo+IAkJc2NtaTogc2NtaSB7Cj4gCQkJY29tcGF0aWJsZSA9ICJhcm0sc2NtaS1zbWMiOwo+
QEAgLTgzMiw2ICs4MzcsNzAgQEAgZ3B1OiBncHVAMjc4MDAwMDAgewo+IAkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7Cj4gCQl9Owo+IAo+KwkJdm9wOiB2b3BAMjdkMDAwMDAgewo+KwkJCWNvbXBhdGli
bGUgPSAicm9ja2NoaXAscmszNTc2LXZvcCI7Cj4rCQkJcmVnID0gPDB4MCAweDI3ZDAwMDAwIDB4
MCAweDMwMDA+LCA8MHgwIDB4MjdkMDUwMDAgMHgwIDB4MTAwMD47Cj4rCQkJcmVnLW5hbWVzID0g
InZvcCIsICJnYW1tYS1sdXQiOwo+KwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNDIgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sCj4rCQkJCSAgICAgPEdJQ19TUEkgMzc5IElSUV9UWVBFX0xFVkVMX0hJ
R0g+LAo+KwkJCQkgICAgIDxHSUNfU1BJIDM4MCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPisJCQkJ
ICAgICA8R0lDX1NQSSAzODEgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4rCQkJaW50ZXJydXB0LW5h
bWVzID0gInZvcC1zeXMiLAo+KwkJCQkJICAidm9wLXZwMCIsCj4rCQkJCQkgICJ2b3AtdnAxIiwK
PisJCQkJCSAgInZvcC12cDIiOwo+KwkJCWNsb2NrcyA9IDwmY3J1IEFDTEtfVk9QPiwKPisJCQkJ
IDwmY3J1IEhDTEtfVk9QPiwKPisJCQkJIDwmY3J1IERDTEtfVlAwPiwKPisJCQkJIDwmY3J1IERD
TEtfVlAxPiwKPisJCQkJIDwmY3J1IERDTEtfVlAyPjsKPisJCQljbG9jay1uYW1lcyA9ICJhY2xr
IiwKPisJCQkJICAgICAgImhjbGsiLAo+KwkJCQkgICAgICAiZGNsa192cDAiLAo+KwkJCQkgICAg
ICAiZGNsa192cDEiLAo+KwkJCQkgICAgICAiZGNsa192cDIiOwo+KwkJCWlvbW11cyA9IDwmdm9w
X21tdT47Cj4rCQkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszNTc2X1BEX1ZPUD47Cj4rCQkJ
cm9ja2NoaXAsZ3JmID0gPCZzeXNfZ3JmPjsKPisJCQlyb2NrY2hpcCxwbXUgPSA8JnBtdT47Cj4r
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKPisKPisJCQl2b3Bfb3V0OiBwb3J0cyB7Cj4rCQkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+KwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPisKPisJCQkJdnAw
OiBwb3J0QDAgewo+KwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4rCQkJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKPisJCQkJCXJlZyA9IDwwPjsKPisJCQkJfTsKPisKPisJCQkJdnAxOiBwb3J0QDEg
ewo+KwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4rCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
PisJCQkJCXJlZyA9IDwxPjsKPisJCQkJfTsKPisKPisJCQkJdnAyOiBwb3J0QDIgewo+KwkJCQkJ
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4rCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPisJCQkJCXJl
ZyA9IDwyPjsKPisJCQkJfTsKPisJCQl9Owo+KwkJfTsKPisKPisJCXZvcF9tbXU6IGlvbW11QDI3
ZDA3ZTAwIHsKPisJCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzU3Ni1pb21tdSIsICJyb2Nr
Y2hpcCxyazM1NjgtaW9tbXUiOwo+KwkJCXJlZyA9IDwweDAgMHgyN2QwN2UwMCAweDAgMHgxMDA+
LCA8MHgwIDB4MjdkMDdmMDAgMHgwIDB4MTAwPjsKPisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MzQyIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+KwkJCWludGVycnVwdC1uYW1lcyA9ICJ2b3BfbW11
IjsKPisJCQljbG9ja3MgPSA8JmNydSBBQ0xLX1ZPUD4sIDwmY3J1IEhDTEtfVk9QPjsKPisJCQlj
bG9jay1uYW1lcyA9ICJhY2xrIiwgImlmYWNlIjsKPisJCQkjaW9tbXUtY2VsbHMgPSA8MD47Cj4r
CQkJcG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszNTc2X1BEX1ZPUD47Cj4rCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPisJCX07Cj4rCj4gCQloZG1pOiBoZG1pQDI3ZGEwMDAwIHsKPiAJCQljb21w
YXRpYmxlID0gInJvY2tjaGlwLHJrMzU3Ni1kdy1oZG1pLXFwIjsKPiAJCQlyZWcgPSA8MHgwIDB4
MjdkYTAwMDAgMHgwIDB4MjAwMDA+Owo+QEAgLTg3Myw3ICs5NDIsNiBAQCBoZG1pX291dDogcG9y
dEAxIHsKPiAJCQl9Owo+IAkJfTsKPiAKPi0+Pj4+Pj4+IDJiNjJjNjliM2E0YyAoYXJtNjQ6IGR0
czogcm9ja2NoaXA6IEFkZCBoZG1pIGZvciByazM1NzYpCj4gCQlxb3NfaGRjcDE6IHFvc0AyN2Yw
MjAwMCB7Cj4gCQkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazM1NzYtcW9zIiwgInN5c2NvbiI7
Cj4gCQkJcmVnID0gPDB4MCAweDI3ZjAyMDAwIDB4MCAweDIwPjsKPi0tIAo+Mi4zNC4xCg==
