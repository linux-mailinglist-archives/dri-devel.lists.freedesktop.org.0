Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E178C0A4BE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 09:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E4210E165;
	Sun, 26 Oct 2025 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="IFAl4Bhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8D010E165
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=G0/fPh3/khSdVcZGrkcOAMGTDLBOWAUPFQxA3kxrAMI=; b=I
 FAl4Bhd+lOzRrVp+AxYyDzPYbG+LOe8xAHB5Ad7B6qjY8bUz5HfQo4SzfQmpcLSW
 efNg2NqV531MztOEeYs/FdYTpsTgcAQEn/AehVUsEL1d/nK7w172CjsAI8lOAIqH
 0K1MSjU6NSwdDJVQdzh+pvdydQp5YIG+b4JauYPWIw=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Sun, 26 Oct 2025 16:38:35 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 26 Oct 2025 16:38:35 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quentin.schulz@cherry.de,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 cn.liweihao@gmail.com, "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re:[PATCH v2 2/9] drm/rockchip: hdmi: add RK3368 controller variant
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251021074254.87065-3-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-3-heiko@sntech.de>
X-NTES-SC: AL_Qu2dA/iduEEq4ySZYOkfmUgWjuw/WsG1v/Ul1YBSP556jC/r9AQFYUF9G1/47+GNFiCiuyqKVwhE0uhmb5F8ZYQUZUyGOIUxNEyoJHiUMsrAYw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1a7115bc.1597.19a1fab5ca2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgDn2FYL3v1o4ZoTAA--.1233W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gbyXmj911N+rQABs7
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

CkhlbGxvIEhlaWtvLAoKQXQgMjAyNS0xMC0yMSAxNTo0Mjo0NywgIkhlaWtvIFN0dWVibmVyIiA8
aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPkZyb206IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVl
Ym5lckBjaGVycnkuZGU+Cj4KPlRoZSBSSzMzNjggaGFzIG9ubHkgb25lIFZPUCwgc28gdGhlcmUg
aXMgbm8gc291cmNlIHNlbGVjdGlvbiBoYXBwZW5pbmcKPmFuZCB0aGUgY29udHJvbGxlciB1c2Vz
IGFuIGludGVybmFsIFBIWSBmb3IgdGhlIEhETUkgb3V0cHV0Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAY2hlcnJ5LmRlPgoKUmV2aWV3ZWQtYnk6IEFu
ZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgoKVGhhbmtzCgoKPi0tLQo+IGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHdfaGRtaS1yb2NrY2hpcC5jCj5pbmRleCA3YjYxMzk5N2JiNTAuLjk1ZmYzZmNlOTdhMyAx
MDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMK
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKPkBAIC00
NjcsNiArNDY3LDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgcmsz
MzI4X2hkbWlfZHJ2X2RhdGEgPSB7Cj4gCS51c2VfZHJtX2luZm9mcmFtZSA9IHRydWUsCj4gfTsK
PiAKPitzdGF0aWMgc3RydWN0IHJvY2tjaGlwX2hkbWlfY2hpcF9kYXRhIHJrMzM2OF9jaGlwX2Rh
dGEgPSB7Cj4rCS5sY2RzZWxfZ3JmX3JlZyA9IC0xLAo+K307Cj4rCj4rc3RhdGljIGNvbnN0IHN0
cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzNjhfaGRtaV9kcnZfZGF0YSA9IHsKPisJLm1vZGVf
dmFsaWQgPSBkd19oZG1pX3JvY2tjaGlwX21vZGVfdmFsaWQsCj4rCS5tcGxsX2NmZyAgID0gcm9j
a2NoaXBfbXBsbF9jZmcsCj4rCS5jdXJfY3RyICAgID0gcm9ja2NoaXBfY3VyX2N0ciwKPisJLnBo
eV9jb25maWcgPSByb2NrY2hpcF9waHlfY29uZmlnLAo+KwkucGh5X2RhdGEgPSAmcmszMzY4X2No
aXBfZGF0YSwKPisJLnVzZV9kcm1faW5mb2ZyYW1lID0gdHJ1ZSwKPit9Owo+Kwo+IHN0YXRpYyBz
dHJ1Y3Qgcm9ja2NoaXBfaGRtaV9jaGlwX2RhdGEgcmszMzk5X2NoaXBfZGF0YSA9IHsKPiAJLmxj
ZHNlbF9ncmZfcmVnID0gUkszMzk5X0dSRl9TT0NfQ09OMjAsCj4gCS5sY2RzZWxfYmlnID0gRklF
TERfUFJFUF9XTTE2X0NPTlNUKFJLMzM5OV9IRE1JX0xDRENfU0VMLCAwKSwKPkBAIC01MDcsNiAr
NTIwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfaGRtaV9yb2NrY2hp
cF9kdF9pZHNbXSA9IHsKPiAJeyAuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzMjgtZHctaGRt
aSIsCj4gCSAgLmRhdGEgPSAmcmszMzI4X2hkbWlfZHJ2X2RhdGEKPiAJfSwKPisJeyAuY29tcGF0
aWJsZSA9ICJyb2NrY2hpcCxyazMzNjgtZHctaGRtaSIsCj4rCSAuZGF0YSA9ICZyazMzNjhfaGRt
aV9kcnZfZGF0YQo+Kwl9LAo+IAl7IC5jb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1kdy1o
ZG1pIiwKPiAJICAuZGF0YSA9ICZyazMzOTlfaGRtaV9kcnZfZGF0YQo+IAl9LAo+LS0gCj4yLjQ3
LjIK
