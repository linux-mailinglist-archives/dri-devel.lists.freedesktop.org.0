Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EA970115
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 10:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345FA10E20A;
	Sat,  7 Sep 2024 08:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FLye3heJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id E877210E20A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ta9LbWPktVaFbzSJMRfIFs5G3l89ulAedhc3mStWRsc=; b=F
 Lye3heJZvJ9pF9N5iPY3VQv6ol0Y1pW3FWsAGUoaNG0ktElrRh15ppu8CHH4iaEc
 520wKhG/4Fj934kZnaLLa3DhtaLLU3CC2HyzQQqHotFjQ1DlEaywMCfr8kUraLpO
 ENs+vR2bBKvBWU00+QRstsr5eu6ZgVJRX/zhyB+HWg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Sat, 7 Sep 2024 16:56:08 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 7 Sep 2024 16:56:08 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Diederik de Haas" <didi.debian@cknow.org>
Cc: "Min-Hua Chen" <minhuadotchen@gmail.com>, airlied@gmail.com, 
 andy.yan@rock-chips.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: Re:Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <D3ZX6LZNLOYC.30CT6AX32VI2T@cknow.org>
References: <D3Z5JMTKPQIS.2M5O5DY0S4U9G@cknow.org>
 <20240907030259.1243487-1-minhuadotchen@gmail.com>
 <D3ZX6LZNLOYC.30CT6AX32VI2T@cknow.org>
X-NTES-SC: AL_Qu2ZB/qStkst7iSQbOkZnEobh+Y5UcK2s/ki2YFXN5k0mCTU0SYHcVtZP2PS1cyiLhihlDywfDNM9slef49ob7BbQjG2KYVvHK7P3Hvr9aVJ
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <175266d5.2a89.191cbb2a62e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3_6IoFdxm2CU0AA--.26427W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQhTXmVOCt+zYAACsD
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

CgpIaSDvvIwKQXQgMjAyNC0wOS0wNyAxNjo0NzoxOCwgIkRpZWRlcmlrIGRlIEhhYXMiIDxkaWRp
LmRlYmlhbkBja25vdy5vcmc+IHdyb3RlOgo+T24gU2F0IFNlcCA3LCAyMDI0IGF0IDU6MDIgQU0g
Q0VTVCwgTWluLUh1YSBDaGVuIHdyb3RlOgo+PiA+RldJVzogSSBkaWRuJ3Qgc2VlIGl0IGVpdGhl
ciwgYnV0IEkgYXNzdW1lZCBJIHdhcyBtaXNzaW5nIHRoZSByaWdodAo+PiA+Y29udGV4dCAoaS5l
LiBwYXRjaGVzKSBuZWVkZWQgdG8gdHJpZ2dlciB0aGF0IHdhcm5pbmcuCj4+Cj4+IEkgdHJpZ2dl
cmVkIHRoZSB3YXJuaW5nIGJ5IHRoZSBmb2xsb3dpbmcgc3RlcDoKPj4KPj4gaW5zdGFsbCAnc3Bh
cnNlJyBmaXJzdAo+Pgo+PiBBUkNIPWFybTY0IExMVk09MSBtYWtlIEM9MSBDRj0nLWZkaWFnbm9z
dGljLXByZWZpeCAtRF9fQ0hFQ0tfRU5ESUFOX18nIG1ycHJvcGVyIGRlZmNvbmZpZyBhbGwgLWo4
Cj4KPlRoaXMsIGVzcGVjaWFsbHkgdGhlICdMTFZNJyBwYXJ0LCAgaXMgaW1wb3J0YW50IGNvbnRl
eHQgaW5mb3JtYXRpb24KPmFuZCBzaG91bGQgYmUgcGFydCBvZiB0aGUgY29tbWl0IG1lc3NhZ2Uu
Cj4KPkkgaGFkIG9ubHkganVzdCBzdGFydGVkIHdoZW4gSSBzYXcgYSBudW1iZXIgb2Ygc3BhcnNl
IHdhcm5pbmdzOgo+Cj4gIERUQyAgICAgYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1
ODgtZWRnZWJsZS1uZXU2YS1pby5kdGIKPiAgT1ZMICAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL3Rp
L2szLWo3MjFlLWV2bS5kdGIKPiAgT1ZMICAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL3RpL2szLWo3
MjFzMi1ldm0uZHRiCj4gIE9WTCAgICAgYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1hbTY1NC1p
ZGsuZHRiCj4gIERUQyAgICAgYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzE4MC10cm9nZG9y
LWxhem9yLXIzLWtiLmR0Ygo+ICBEVEMgICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAv
cmszNTg4LWVkZ2VibGUtbmV1NmEtd2lmaS5kdGJvCj4gIERUQyAgICAgYXJjaC9hcm02NC9ib290
L2R0cy9xY29tL3NjNzE4MC10cm9nZG9yLWxhem9yLXIzLWx0ZS5kdGIKPiAgRFRDICAgICBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OC1lZGdlYmxlLW5ldTZiLWlvLmR0Ygo+ICBE
VEMgICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4LWV2YjEtdjEwLmR0Ygo+
ICBEVEMgICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcxODAtdHJvZ2Rvci1sYXpvci1y
OS5kdGIKPi4uL2luaXQvbWFpbi5jOjE5MjoxMjogc3BhcnNlOiB3YXJuaW5nOiBzeW1ib2wgJ2Vu
dnBfaW5pdCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPi4uL2luaXQv
bWFpbi5jOjI5MDoxNjogc3BhcnNlOiB3YXJuaW5nOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19sZTMy
Cj4uLi9pbml0L21haW4uYzoyOTE6MTY6IHNwYXJzZTogd2FybmluZzogY2FzdCB0byByZXN0cmlj
dGVkIF9fbGUzMgo+ICBDSEVDSyAgIC4uL2luaXQvZG9fbW91bnRzLmMKCj4KCgpJIGNhbiBzZWUg
c2FtZSB3YXJuaW5nc++8jCBhIGxvdHMgb2bjgIIKQW5kIGFsc28gc2VlIHRoZSB3YXJuaW5nIGlu
IHZvcDLvvJoKZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcDJfcmVnLmM6NTAy
OjI0OiBzcGFyc2U6IHdhcm5pbmc6IHN5bWJvbCAndm9wMl9wbGF0Zm9ybV9kcml2ZXInIHdhcyBu
b3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgoKTWluIEh1Ye+8jElmIHlvdSBhcmUg
YWdyZWXvvIxJIHdpbGwgc3BsaXQgaXQgZnJvbSBteSBwYXRjaO+8jCBhbmQgYWRkIGEgRml4IHRh
ZyDvvIxhbmQgYWxzbyBhZGQgYSBTb0Igb2YgeW9177yMIFRoZW4gcmVzZW5kIGluIE15IFYzIHNl
cmllc++8jHRoaXMKd2lsbCBtYWtlIG15IHBhdGNoIHNlcmllcyBlYXNpZXLjgIIKID5BbmQgc2V2
ZXJhbCBmb2xsb3dlZCwgaW5jbHVkaW5nIGluIGMtY29kZSBmaWxlcy4gU28gSSBzdG9wcGVkIHRo
ZSBidWlsZAo+YW5kIGFzc3VtZSB5b3UndmUgaWRlbnRpZmllZCBhIG9yIHNldmVyYWwgYWN0dWFs
IGlzc3Vlcy4KPgo+SSd2ZSBzZWVuIHNldmVyYWwgY29tbWl0cyB3aGVyZSBjaGFuZ2VzIHdlcmUg
bWFkZSBiZWNhdXNlIExMVk0gZmxhZ2dlZAo+cG90ZW50aWFsbHkgcHJvYmxlbWF0aWMgY29kZSwg
d2hlcmUgR0NDIGRpZCBub3QsIHNvIGl0J3MgcXVpdGUgcG9zc2libGUKPnlvdSdyZSBvbiB0byBz
b21ldGhpbmcgaGVyZS4KPgo+QnV0IGl0IHdvdWxkIGJlIGhlbHBmdWwgaWYgdGhlIGNvbW1pdCBt
ZXNzYWdlIHNhaWQgd2hhdCBjb2RlIHdhcwo+cG90ZW50aWFsbHkgcHJvYmxlbWF0aWMgYW5kIHdo
eS4gQW5kIHRoZW4gdGhlIHByb3BlciBmaXggZm9yIHRoYXQgY291bGQKPmluZGVlZCBiZSB0byBp
bmNsdWRlIGByb2NrY2hpcF9kcm1fZHJ2LmhgLgo+Cj5DaGVlcnMsCj4gIERpZWRlcmlrCg==
