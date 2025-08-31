Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFCB3D2B0
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 14:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CC910E083;
	Sun, 31 Aug 2025 12:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Qu292NPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB0EC10E083
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=F7GUQd1kZpglV52vKxF3lBrT7DCXnSp1/ypCqZo5gQ8=; b=Q
 u292NPNlFPfN6v1LxIbA2gwTGGgaZaP4jauzeh6HOuhjnk9Whh4LOvnXb6iLQzh2
 e60d4ati97F1a7kHzHBCbMMyVCQNKXqq1MEe6jGhigj4A0SoMh/b2HbGyNGnPfGL
 456ChX2S+uJVQvUvuVAJE0ly9Wy+k6mt+OlC5c7Scw=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Sun, 31 Aug 2025 20:12:36 +0800
 (CST)
X-Originating-IP: [103.29.142.67]
Date: Sun, 31 Aug 2025 20:12:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maud Spierings" <maud_spierings@hotmail.com>
Cc: Laurent.pinchart@ideasonboard.com, andy.yan@rock-chips.com,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mripard@kernel.org,
 naoki@radxa.com, neil.armstrong@linaro.org, robh@kernel.org,
 sebastian.reichel@collabora.com, stephen@radxa.com,
 yubing.zhang@rock-chips.com
Subject: Re:Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <AM7P189MB1009B9BCECE97040CFD3DBA0E33AA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
References: <20250822063959.692098-1-andyshrk@163.com>
 <AM7P189MB1009B9BCECE97040CFD3DBA0E33AA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-NTES-SC: AL_Qu2eBPqfvUsu4CSZZukfmUgWjuw/WsG1v/Ul1YBSP556jA/pwQIqT3RSBmf2ye60Fj2tmgmGcjZp09VaeKdkXp4Q15ojZ1N9shTuO1xVkiOUJg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3e2e87f3.21ca.199000b2cc1.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: fygvCgCnl740PLRoEGAlAA--.1025W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhy6Xmi0NLeDDAABs7
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

CkhlbGxvIE1hdWTvvIwKCkF0IDIwMjUtMDgtMzAgMDg6NDY6MTQsICJNYXVkIFNwaWVyaW5ncyIg
PG1hdWRfc3BpZXJpbmdzQGhvdG1haWwuY29tPiB3cm90ZToKPkhlbGxvIEFuZHksCj4KPj4gVGhl
cmUgYXJlIHR3byBEVyBEUFRYIGJhc2VkIERpc3BsYXlQb3J0IENvbnRyb2xsZXIgb24gcmszNTg4
IHdoaWNoCj4+IGFyZSBjb21wbGlhbnQgd2l0aCB0aGUgRGlzcGxheVBvcnQgU3BlY2lmaWNhdGlv
biBWZXJzaW9uIDEuNCB3aXRoCj4+IHRoZSBmb2xsb3dpbmcgZmVhdHVyZXM6Cj4+IAo+PiAqIERp
c3BsYXlQb3J0IDEuNGEKPj4gKiBNYWluIExpbms6IDEvMi80IGxhbmVzCj4+ICogTWFpbiBMaW5r
IFN1cHBvcnQgMS42MkdicHMsIDIuN0dicHMsIDUuNEdicHMgYW5kIDguMUdicHMKPj4gKiBBVVgg
Y2hhbm5lbCAxTWJwcwo+PiAqIFNpbmdsZSBTdHJlYW0gVHJhbnNwb3J0KFNTVCkKPj4gKiBNdWx0
aXN0cmVhbSBUcmFuc3BvcnQgKE1TVCkKPj4gKiBUeXBlLUMgc3VwcG9ydCAoYWx0ZXJuYXRlIG1v
ZGUpCj4+ICogSERDUCAyLjIsIEhEQ1AgMS4zCj4+ICogU3VwcG9ydHMgdXAgdG8gOC8xMCBiaXRz
IHBlciBjb2xvciBjb21wb25lbnQKPj4gKiBTdXBwb3J0cyBSQkcsIFlDYkNyNDo0OjQsIFlDYkNy
NDoyOjIsIFlDYkNyNDoyOjAKPj4gKiBQaXhlbCBjbG9jayB1cCB0byA1OTRNSHoKPj4gKiBJMlMs
IFNQRElGIGF1ZGlvIGludGVyZmFjZQo+PiAKPj4gVGhlIGN1cnJlbnQgdmVyc2lvbiBvZiB0aGlz
IHBhdGNoIHNlcmllcyBvbmx5IHN1cHBvcnRzIGJhc2ljIGRpc3BsYXkgb3V0cHV0cy4KPj4gSSBj
b25kdWN0ZWQgdGVzdHMgd2l0aCBEUDAgaW4gMTA4MHAgYW5kIDRLQDYwIFlDYkNyNDoyOjAgbW9k
ZXM7IHRoZSBBTFQvVHlwZS1DCj4+IG1vZGUgd2FzIHRlc3RlZCBvbiBSb2NrIDVCCj4KPklzIHRo
ZXJlIGFuIGV4YW1wbGUgb2YgdGhpcz8gSSB3YW50IHRvIGltcGxlbWVudCBpdCBmb3IgdGhlIHVz
Yi1jIHBvcnQgCj5vbiB0aGUgb3JhbmdlcGkgNSBwbHVzLCBidXQgSSBjYW4ndCBxdWl0ZSBmaWd1
cmUgb3V0IHdoZXJlIEkgd291bGQgaGF2ZSAKPnRvIGxpbmsgdGhlIERQIG91dHB1dCBlbmRwb2lu
dCB0bz8KPgo+VGhlIHVzYi1jIGVuZHBvaW50cyBhcmUgYWxsIGRvbmUuIElzIGl0IHRvIGFub3Ro
ZXIgZW5kcG9pbnQgaW4gdGhlIAo+dXNiZHBfcGh5PyBUaGUgb25seSBlbmRwb2ludHMgdGhlcmUg
c2VlbSB0byBiZSBvdXRwdXRzLiBPciBpcyBpdCAKPnN1cHBvc2VkIHRvIGJlIGxlZnQgdW5jb25u
ZWN0ZWQgZm9yIHRoZSBBTFQvdHlwZS1DIG1vZGU/Cj4KPkkndmUgdHJpZWQgcmVhZGluZyB0aHJv
dWdoIGFsbCB0aGUgcmVsZXZhbnQgZHQtYmluZGluZ3MgYnV0IGNhbid0IGZpbmQgaXQuCgoKSSBo
YXZlIGEgIHRlc3QgYnJhbmNoIGZvciBBTFQvVHlwZS1DIG1vZGUgb24gUm9jayA1QiBoZXJlWzFd
CgpbMV1odHRwczovL2dpdGh1Yi5jb20vYW5keXNocmsvbGludXgvY29tbWl0cy9yazM1ODgtZHAt
dXBzdHJlYW0tdjYvCgo+Cj5LaW5kIHJlZ2FyZHMsCj5NYXVkCg==
