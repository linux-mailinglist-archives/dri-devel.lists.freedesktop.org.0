Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A8A4F4B6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 03:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CCD10E047;
	Wed,  5 Mar 2025 02:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="oTDXhF0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78FFA10E047
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 02:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=UOhnFF01l7HOjYg5x6uMcW+B9fbrcWjnbUnMIBSb6g4=; b=o
 TDXhF0ao8rGr8j8jqZSvZyPwCn4bRtMbMUqolB3b0d33NLVtg8Do+zE4hoqyKSPc
 zOJuUqn0UDL/56pNMjEk7XWHy1TvHLbfex2UCxGVCdwMmtrpxuop+RhsFVrPw0Fo
 ipgMP4wcY2oyQyyBZFmm/QVjGPIMLLCZxeuxv5CPHg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Wed, 5 Mar 2025 10:30:55 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 5 Mar 2025 10:30:55 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 "Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2fA/2fvkAu4yiaZukfmkcVgOw9UcO5v/Qk3oZXOJF8jDDp2ycwUUJSDXLaweO0FQ+OmgmGXTtC9/R7f4VTVaQNuZe6Rui3nVzOCdmFQHxStA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgD3Xw5ft8dn2jd2AA--.4215W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAMHXmfHsp5IAwACsP
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

CkhpIFBpb3RyLAoK5ZyoIDIwMjUtMDMtMDQgMjE6MTI6NTDvvIwiUGlvdHIgT25pc3pjenVrIiA8
cGlvdHIub25pc3pjenVrQGdtYWlsLmNvbT4g5YaZ6YGT77yaCj4KPgo+PiBXaWFkb21vxZvEhyBu
YXBpc2FuYSBwcnpleiBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4gdyBkbml1IDEgbWFyIDIw
MjUsIG8gZ29kei4gMTM6MjQ6Cj4+IAo+PiAKPj4gSGkgUGlvdHIsCj4+IAo+Pj4gCj4+PiBpcyBp
dCB3b3J0aCB0byBwbGF5IHdpdGggdGhpcyBvciBpdCBpcyB0b28gZWFybHk/Cj4+IAo+PiBJIHRo
aW5rIHlvdSBjb3VsZCBnaXZlIGl0IGEgdHJ5IGlmIGl0IHVzaW5nIHRoZSBTdGFuZGFyZCBEUO+8
iG5vbi1BTFQgbW9kZe+8iSBwb3J0IGZvciBvdXRwdXQuIAo+PiBTaW5jZSBJIGRvbid0IGN1cnJl
bnRseSBoYXZlIGEgZGV2ZWxvcG1lbnQgYm9hcmQgd2l0aCBEUDEgb3V0cHV0IGF2YWlsYWJsZSwg
SSBoYXZlbid0IGJlZW4KPj4gYWJsZSB0byB0ZXN0IGl0IHlldC4gQXMgZm9yIHRoZSBUeXBlLUMg
QWx0ZXJuYXRlIE1vZGUgb3V0cHV0LCBzb21lIHBhdGNoZXMgYXJlIHN0aWxsIHJlcXVpcmVkIAo+
PiBJJ2xsICBzZW5kIGl0IHdpdGggVjIgdG9tb3Jyb3cgb3IgbmV4dCB3ZWVrLgo+PiBGZWVsIGZy
ZWUgdG8gbGV0IG1lIGtub3cgaWYgSWYgeW91IGVuY291bnRlciBhbnkgaXNzdWVz44CCCj4+IAo+
Cj5BbmR5LAo+SSBhZGRlZCBkcDEgZW5hYmxlbWVudCBpbiByb2NrNSBpdHggbGlrZSB0aGlzOiBo
dHRwczovL2dpc3QuZ2l0aHViLmNvbS93YXJwbWUvYmRkZjc1OTEyMTkzZjU3NzI0YzQ5MjE2ZDVk
ODVkNGEKPlVuZm9ydHVuYXRlbHkgaXQgbm90IHdvcmtzLgo+Rm9yIC9zeXMva2VybmVsL2RlYnVn
L2RyaS8wL3N0YXRlIC0gcGxzIHNlZSBhYm92ZSBsaW5r4oCmCj5J4oCZbSBub3Qgc3VyZTogZG8g
aSBtaXNzZWQgc29tZXRoaW5nIGluIGR0IG9yIHJhdGhlciBpc3N1ZSBpc3N1ZSAgaXMgaW4gZHAg
Y29kZS4uLgoKSSBvbmx5IHNlZSB0aGUgSERNSSBjb25uZWN0b3IgZnJvbSB5b3VyIGRyaS9zdGF0
ZSA7IHNvIGl0IGFwcGVhcnMgdGhlIERQIGRyaXZlciBoYXNuJ3QgYmVlbiBzdWNjZXNzZnVsbHkK
aW5pdGlhbGl6ZWTvvIhJIHRoaW5rIGtlcm5lbCBkbWVzZyBjYW4gdGVsbCB0aGF077yJLiAKSGF2
ZSB5b3UgZW5hYmxlZCBDT05GSUdfUk9DS0NISVBfRFdfRFAgPyBUaGlzIGlzIG5lZWRlZC4KCgo+
Cj5GWUk6IHNjaGVtYXRpYzogaHR0cHM6Ly9kbC5yYWR4YS5jb20vcm9jazUvNWl0eC92MTExMC9y
YWR4YV9yb2NrXzVpdHhfdjExMTBfc2NoZW1hdGljLnBkZgo+Cj4KPgo=
