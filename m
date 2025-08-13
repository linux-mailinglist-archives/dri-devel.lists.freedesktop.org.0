Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB03B24359
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 09:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6CD10E4CE;
	Wed, 13 Aug 2025 07:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="oHQT/PaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B17010E4CE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=jECFwx4pIXRDwOe+aduX16A+fUFcM2/6HU7bohWUDGc=; b=o
 HQT/PaAi8pUOtZeKPMoV7Wot/s3ouebC+zCZPU2UR41IMCP3i+L5X75P8LgyASSz
 ZenaPO3rY86qVXiN6hzJEyPGoMC2drGTLvfLGh9HU+7nIhfxMokXV/Xtw46umWmA
 kX3JdYbIpVWHSyUv82eNg23SSkOP+gW4oNvcBEJcv4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Wed, 13 Aug 2025 15:56:12 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 13 Aug 2025 15:56:12 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 "Guochun Huang" <hero.huang@rock-chips.com>
Subject: Re:[PATCH 09/13] drm/rockchip: dsi2: add support rk3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250707164906.1445288-10-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-10-heiko@sntech.de>
X-NTES-SC: AL_Qu2eB/ycvk8s5CedYukfmUkTh+o2Xca5uf0j3YBWOZh+jCzp0xowU31TOHjf/9CDICOtkAiHbAN808N6QrN4UbkoF22nqegBGsuYjTtBtlFcOQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2cef60be.5f55.198a26df85a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3H+AcRZxoWT8ZAA--.1718W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhqoXmicQps+AAABss
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

CkhlbGxvIEhlaWtvLAoKQXQgMjAyNS0wNy0wOCAwMDo0OTowMiwgIkhlaWtvIFN0dWVibmVyIiA8
aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPkZyb206IEd1b2NodW4gSHVhbmcgPGhlcm8uaHVhbmdA
cm9jay1jaGlwcy5jb20+Cj4KPkFkZCB0aGUgbmVjZXNzYXJ5IHNwZWNpZmljIGJpdHMgdG8gc3Vw
cG9ydCB0aGUgcmszNTc2LXZhcmlhbnQgb2YgdGhlCj5EVy1EU0kyIGNvbnRyb2xsZXIuCj4KPlNp
Z25lZC1vZmYtYnk6IEd1b2NodW4gSHVhbmcgPGhlcm8uaHVhbmdAcm9jay1jaGlwcy5jb20+Cj5b
YWRhcHRlZCBmcm9tIHRoZSB2ZW5kb3Ita2VybmVsIGZvciBtYWlubGluZV0KPlNpZ25lZC1vZmYt
Ynk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKUmV2aWV3ZWQtYnk6IEFuZHkg
WWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KCgpUaGFua3MuCgo+LS0tCj4gLi4uL2dwdS9k
cm0vcm9ja2NoaXAvZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMgIHwgMjEgKysrKysrKysrKysrKysr
KysrKwo+IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMKPmluZGV4IGNkZDQ5MDc3
ODc1Ni4uMGFlYTc2NGUyOWIyIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2R3LW1pcGktZHNpMi1yb2NrY2hpcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
ZHctbWlwaS1kc2kyLXJvY2tjaGlwLmMKPkBAIC00MzcsNiArNDM3LDE1IEBAIHN0YXRpYyB2b2lk
IGR3X21pcGlfZHNpMl9yb2NrY2hpcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAJZHdfbWlwaV9kc2kyX3JlbW92ZShkc2kyLT5kbWQpOwo+IH0KPiAKPitzdGF0aWMgY29u
c3Qgc3RydWN0IGRzaWdyZl9yZWcgcmszNTc2X2RzaV9ncmZfcmVnX2ZpZWxkc1tNQVhfRklFTERT
XSA9IHsKPisJW1RYUkVRQ0xLSFNfRU5dCQk9IHsgMHgwMDI4LCAxLCAgMSB9LAo+KwlbR0FUSU5H
X0VOXQkJPSB7IDB4MDAyOCwgMCwgIDAgfSwKPisJW0lQSV9TSFVURE5dCQk9IHsgMHgwMDI4LCAz
LCAgMyB9LAo+KwlbSVBJX0NPTE9STV0JCT0geyAweDAwMjgsIDIsICAyIH0sCj4rCVtJUElfQ09M
T1JfREVQVEhdCT0geyAweDAwMjgsIDgsIDExIH0sCj4rCVtJUElfRk9STUFUXQkJPSB7IDB4MDAy
OCwgNCwgIDcgfSwKPit9Owo+Kwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNpZ3JmX3JlZyByazM1
ODhfZHNpMF9ncmZfcmVnX2ZpZWxkc1tNQVhfRklFTERTXSA9IHsKPiAJW1RYUkVRQ0xLSFNfRU5d
CQk9IHsgMHgwMDAwLCAxMSwgMTEgfSwKPiAJW0dBVElOR19FTl0JCT0geyAweDAwMDAsIDEwLCAx
MCB9LAo+QEAgLTQ1NSw2ICs0NjQsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkc2lncmZfcmVn
IHJrMzU4OF9kc2kxX2dyZl9yZWdfZmllbGRzW01BWF9GSUVMRFNdID0gewo+IAlbSVBJX0ZPUk1B
VF0JCT0geyAweDAwMDQsICAwLCAgMyB9LAo+IH07Cj4gCj4rc3RhdGljIGNvbnN0IHN0cnVjdCBy
b2NrY2hpcF9kd19kc2kyX2NoaXBfZGF0YSByazM1NzZfY2hpcF9kYXRhW10gPSB7Cj4rCXsKPisJ
CS5yZWcgPSAweDI3ZDgwMDAwLAo+KwkJLmdyZl9yZWdzID0gcmszNTc2X2RzaV9ncmZfcmVnX2Zp
ZWxkcywKPisJCS5tYXhfYml0X3JhdGVfcGVyX2xhbmUgPSAyNTAwMDAwVUxMLAo+Kwl9LAo+Kwl7
IC8qIHNlbnRpbmVsICovIH0KPit9Owo+Kwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgcm9ja2NoaXBf
ZHdfZHNpMl9jaGlwX2RhdGEgcmszNTg4X2NoaXBfZGF0YVtdID0gewo+IAl7Cj4gCQkucmVnID0g
MHhmZGUyMDAwMCwKPkBAIC00NzAsNiArNDg4LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByb2Nr
Y2hpcF9kd19kc2kyX2NoaXBfZGF0YSByazM1ODhfY2hpcF9kYXRhW10gPSB7Cj4gCj4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfbWlwaV9kc2kyX3JvY2tjaGlwX2R0X2lkc1td
ID0gewo+IAl7Cj4rCQkuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazM1NzYtbWlwaS1kc2kyIiwK
PisJCS5kYXRhID0gJnJrMzU3Nl9jaGlwX2RhdGEsCj4rCX0sIHsKPiAJCS5jb21wYXRpYmxlID0g
InJvY2tjaGlwLHJrMzU4OC1taXBpLWRzaTIiLAo+IAkJLmRhdGEgPSAmcmszNTg4X2NoaXBfZGF0
YSwKPiAJfSwKPi0tIAo+Mi40Ny4yCg==
