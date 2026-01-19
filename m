Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE85D39C85
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 03:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8488310E033;
	Mon, 19 Jan 2026 02:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="f24c+GSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84C10E033
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 02:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=TyAXUBD7uOyPYlui3WNLL/25FSRmrDEhXyuUgnSCwxw=; b=f
 24c+GSjt6QNdZT/pv1Iv1y/eT9J3aOEl7FpCqNWRhdhr6sEZDZ5TN2jICXMxpYFX
 ocwdm0nMv7dSbkFRWtmIRmUF3MqQeN1IiEZ/NZPK6/2i6jBITewmt0qNbjlzOzcd
 th94hf2EV2O06FNPQRhpuDOZDrJGJFNCX6akz+d/cU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Mon, 19 Jan 2026 10:42:41 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 19 Jan 2026 10:42:41 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v2] drm/rockchip: vop2: Add mode valid callback for crtc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aW1uWZD6u4e2o6jF@venus>
References: <20260117020738.294825-1-andyshrk@163.com> <aW1uWZD6u4e2o6jF@venus>
X-CM-CTRLMSGS: 3aJFg3BsdXM9MTc2ODc5MDU2MDE3N19jOGE5NTM2MjQ0ZDM5YzliZDkzMTVkZ
 DNkODc4MTZlNQ==
X-NTES-SC: AL_Qu2dCvuSv00t5yacY+kfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbK5GKdGuSvG2Z4ObiVbFiCw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5cc9f5c4.27fa.19bd4221378.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgDHzwcimm1pknhZAA--.4457W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QJkwmltmiJPpwAA3d
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

CkhlbGxvIFNlYmFzdGlhbiwKCkF0IDIwMjYtMDEtMTkgMDc6NDM6MzUsICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+SGksCj4KPk9u
IFNhdCwgSmFuIDE3LCAyMDI2IGF0IDEwOjA3OjMwQU0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+
PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IAo+PiBUaGUgZGlm
ZmVyZW50IFZpZGVvIFBvcnRzIHN1cHBvcnQgZGlmZmVyZW50IG1heGltdW0gcmVzb2x1dGlvbnMu
Cj4+IFJlamVjdCByZXNvbHV0aW9ucyB0aGF0IGFyZSBub3Qgc3VwcG9ydGVkIGJ5IGEgc3BlY2lm
aWMgVlAuCj4+IAo+PiBPbmx5IHRoZSBvdXRwdXQgd2lkdGggaXMgY2hlY2tlZCBiZWNhdXNlIHRo
ZSBoYXJkd2FyZSBpdHNlbGYgZG9lcwo+PiBub3QgaGF2ZSBhIGhhcmQgb3V0cHV0IGhlaWdodCBs
aW1pdC4KPj4gCj4+IEZpbHRlciB0aGUgbW9kZSB0aGF0IGNhbid0IG91dHB1dCBieSB0aGUgVlAv
Y3J0Yy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBz
LmNvbT4KPj4gCj4+IC0tLQo+Cj5BIGNvbW1vbiBSSzM1NzYgc2V0dXAgaXMgVlAwIG1hcHBlZCB0
byBIRE1JIGFuZCBWUDEgbWFwcGVkIHRvIFVTQi1DCj5EUCBBbHRNb2RlLiBTaW5jZSBSSzM1NzYg
VlAxIG9ubHkgc3VwcG9ydHMgMi41SywgdGhpcyBjYW4gZWFzaWx5Cj5iZWNvbWUgcmVsZXZhbnQg
d2hlbiBjb25uZWN0aW5nIGEgNEsgc2NyZWVuIHZpYSBVU0ItQyBEUCBBbHRNb2RlLgo+SSd2ZSB0
ZXN0ZWQgdGhhdCB0aGlzIHBhdGNoIHByb3Blcmx5IGRyb3BzIGFsbCB1bnN1cHBvcnRlZCBtb2Rl
cwo+YmFzZWQgb24gdGhlIHJlc29sdXRpb24uCj4KPkZ1cnRoZXIgY2hlY2tzIHdpbGwgYmUgbmVl
ZGVkIHRvIGVuc3VyZSB0aGUgYmFuZHdpZHRoIHJlcXVpcmVtZW50cwo+YXJlIGFsc28gbWV0IChl
LmcuIFJLMzU3NiBWUDEgb25seSBzdXBwb3J0cyAyLjVLQDYwSHosIHNvIDIuNUtAMTIwSHoKPnNo
b3VsZCBiZSBtYXJrZWQgYXMgQkFEKS4gSSB0aGluayB0aGUgYmFuZHdpZHRoIGNoZWNrIHNob3Vs
ZCBiZSBhCj5zZXBhcmF0ZSBwYXRjaCwgYnV0IHRob3VnaHQgaXQgbWlnaHQgYmUgd29ydGggbWVu
dGlvbmluZyBoZXJlIGluCj5jYXNlIHNvbWVib2R5IHN0dW1ibGVzIG92ZXIgaXQuCgpZZXMsIEkg
YWxzbyB0aGluayBpdCdzIGJldHRlciB0byBkbyBieSBhIHNlcGFyYXRlIHBhdGNoLCAgYmVjYXVz
ZSB3ZSBzaG91bGQgYWRkCm1vcmUgZGV0YWlsIGRjbGsgZGVzY3JpcHRpb24gZm9yIGV2ZXJ5IFZQ
LiAgSSB3aWxsIGRvIGl0IGFmdGVyIHRoaXMgcGF0Y2ggZ2V0IG1lcmdlZC4KCj4KPkFueXdheXM6
Cj4KPlJldmlld2VkLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29s
bGFib3JhLmNvbT4KPlRlc3RlZC1ieTogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWlj
aGVsQGNvbGxhYm9yYS5jb20+ICMgU2lnZTUKPgo+R3JlZXRpbmdzLAo+Cj4tLSBTZWJhc3RpYW4K
Pgo+PiAKPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBBZGQgbW9yZSBkZXRhaWxlZCBjb21taXQgbWVz
c2FnZQo+PiAKPj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
IHwgMTIgKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+
PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPj4g
aW5kZXggNDk4ZGYwY2U0NjgwLi43NGZiYTI5YmZmZjMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+IEBAIC0xNDM5LDYgKzE0MzksMTcg
QEAgc3RhdGljIHZvaWQgdm9wMl9jcnRjX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykKPj4gIAl2b3AyX2NydGNfZGlzYWJsZV9pcnEodnAsIFZQX0lOVF9GU19GSUVMRCk7Cj4+
ICB9Cj4+ICAKPj4gK3N0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyB2b3AyX2NydGNfbW9kZV92
YWxpZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+ICsJCQkJCQkgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUpCj4+ICt7Cj4+ICsJc3RydWN0IHZvcDJfdmlkZW9fcG9ydCAqdnAg
PSB0b192b3AyX3ZpZGVvX3BvcnQoY3J0Yyk7Cj4+ICsKPj4gKwlpZiAobW9kZS0+aGRpc3BsYXkg
PiB2cC0+ZGF0YS0+bWF4X291dHB1dC53aWR0aCkKPj4gKwkJcmV0dXJuIE1PREVfQkFEX0hWQUxV
RTsKPj4gKwo+PiArCXJldHVybiBNT0RFX09LOwo+PiArfQo+PiArCj4+ICBzdGF0aWMgYm9vbCB2
b3AyX2NydGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+ICAJCQkJIGNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAo+PiAgCQkJCSBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSAqYWRqX21vZGUpCj4+IEBAIC0xODg0LDYgKzE4OTUsNyBAQCBzdGF0aWMgdm9pZCB2
b3AyX2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPj4gIAo+PiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3Mgdm9wMl9jcnRjX2hlbHBlcl9m
dW5jcyA9IHsKPj4gIAkubW9kZV9maXh1cCA9IHZvcDJfY3J0Y19tb2RlX2ZpeHVwLAo+PiArCS5t
b2RlX3ZhbGlkID0gdm9wMl9jcnRjX21vZGVfdmFsaWQsCj4+ICAJLmF0b21pY19jaGVjayA9IHZv
cDJfY3J0Y19hdG9taWNfY2hlY2ssCj4+ICAJLmF0b21pY19iZWdpbiA9IHZvcDJfY3J0Y19hdG9t
aWNfYmVnaW4sCj4+ICAJLmF0b21pY19mbHVzaCA9IHZvcDJfY3J0Y19hdG9taWNfZmx1c2gsCj4+
IC0tIAo+PiAyLjQzLjAKPj4gCj4+IGJhc2UtY29tbWl0OiAxNjEzYTY3YjUzNjBkNmZmNzhmNjIx
NDNhMWNmMTIzNDE0YTFiNGQ5Cj4+IGJyYW5jaDogcmszNTc2LWRwLXVwc3RyZWFtCj4+IAo=
