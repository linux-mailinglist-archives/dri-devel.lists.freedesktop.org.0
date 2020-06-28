Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B671620CA62
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6024B6E252;
	Sun, 28 Jun 2020 20:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDADE6E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 01:51:38 +0000 (UTC)
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id E9D49B2B;
 Sun, 28 Jun 2020 09:51:31 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P15430T140188661573376S1593309088919980_; 
 Sun, 28 Jun 2020 09:51:30 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <dfb966992b97e608fb76880cf6eb5680>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Huang Jiachai <hjc@rock-chips.com>
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_1/2=5d_drm=3a_drm=5ffourcc=3a_add_NV20_YUV?=
 =?UTF-8?B?IGZvcm1hdOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJvY2tjaGlwLWJv?=
 =?UTF-8?Q?unces+sandy=2ehuang=3drock-chips=2ecom=40lists=2einfradead=2eorg?=
 =?UTF-8?B?5Luj5Y+R44CR?=
To: Jonas Karlman <jonas@kwiboo.se>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
References: <20200607202521.18438-1-jonas@kwiboo.se>
 <20200607202521.18438-2-jonas@kwiboo.se>
 <d503eed1-571f-3e37-858b-b5de04cb79f7@rock-chips.com>
 <f5c46547-3278-2226-e194-929fbfa95864@kwiboo.se>
Message-ID: <bee64956-8ab0-c358-9762-63c5a5b97b6a@rock-chips.com>
Date: Sun, 28 Jun 2020 09:51:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f5c46547-3278-2226-e194-929fbfa95864@kwiboo.se>
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: Tao Huang <huangtao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, =?UTF-8?B?5p2o5Yev?= <kever.yang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 Ben Davis <ben.davis@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9uYXMgS2FybG1hbiwKCuWcqCAyMDIwLzYvMjYgMjI6MTksIEpvbmFzIEthcmxtYW4g5YaZ
6YGTOgo+IE9uIDIwMjAtMDYtMTcgMTQ6MDcsIEh1YW5nIEppYWNoYWkgd3JvdGU6Cj4+IEhpIEpv
bmFzIEthcmxtYW4sCj4+Cj4+ICAgwqDCoMKgIElzIHRoZXJlIGFuIGFub3RoZXIgeXV2IDEwYml0
IGZvcm1hdCB3aXRoIDQ6NDo0IHN1Yi1zaW1wbGluZyBidXQKPj4gaGFzIG5vIHBhZGRpbmc/Cj4+
Cj4+ICAgwqBNYXliZSB3ZSBjYW4gY2FsbCBpdCBEUk1fRk9STUFUX05WMzA6Cj4+Cj4+IHsgLmZv
cm1hdCA9IERSTV9GT1JNQVRfTlYzMCwJCS5kZXB0aCA9IDAsCj4+ICAgICAubnVtX3BsYW5lcyA9
IDIsIC5jaGFyX3Blcl9ibG9jayA9IHsgNSwgNSwgMCB9LAo+PiAgICAgLmJsb2NrX3cgPSB7IDQs
IDIsIDAgfSwgLmJsb2NrX2ggPSB7IDEsIDEsIDAgfSwgLmhzdWIgPSAxLAo+PiAgICAgLnZzdWIg
PSAxLCAuaXNfeXV2ID0gdHJ1ZSB9LAo+Pgo+PiB0aGlzIGZvcm1hdCBjYW4gc3VwcG9ydGVkIGJ5
IHJvY2tjaGlwIHJrMzI4OC9yazMzOTkuLi4gcGxhdGZvcm0sIGNhbiB5b3UKPj4gYWRkIHRoaXMg
Zm9ybWF0IGF0IHRoaXMgc2VyaWVzIHBhdGNoZXM/Cj4gSSB3aWxsIHNlbmQgYSB2MiBpbmNsdWRp
bmcgdGhpcyA0OjQ6NCBmb3JtYXQgbGF0ZXIgdGhpcyB3ZWVrZW5kLgo+Cj4gSXMgdGhlcmUgYW55
IGh3IGJsb2NrIG9uIHJrMzI4OC9yazMzOTkgdGhhdCBjYW4gcHJvZHVjZSBhIGJ1ZmZlciBpbiBz
dWNoIGZvcm1hdD8KPiBJZiBJIGFtIG5vdCBtaXN0YWtlbiBya3ZkZWMgb25seSBzdXBwb3J0IDEw
LWJpdCBoMjY0IGluIDQ6MjowLzQ6MjoyIGFuZAo+IGhldmMgNDoyOjAgMTAtYml0LCB0aG9zZSBh
cmUgdGhlIGZvcm1hdHMgSSBoYXZlIGJlZW4gYWJsZSB0byB0ZXN0IHNvIGZhci4KPgo+IFJlZ2Fy
ZHMsCj4gSm9uYXMKCnllcyxyb2NrY2hpcCBwbGF0Zm9ybSBodyB2aWRlbyBkZWNvZGVyIDEwLWJp
dCB5dXYgZm9ybWF0IG9ubHkgY2FuIApzdXBwb3J0IDQ6MjowLzQ6MjoyIHNvIGZhciwgYnV0IHRo
ZSBzb2Z0d2FyZSBkZWNvZGVyIHBhdGggbWF5YmUgb3V0cHV0IAo0OjQ6NC0xMCBmb3JtYXQgdG8g
Vk9QLgoKPgo+PiDlnKggMjAyMC82LzggNDoyNSwgSm9uYXMgS2FybG1hbiDlhpnpgZM6Cj4+PiBE
Uk1fRk9STUFUX05WMjAgaXMgYSAyIHBsYW5lIGZvcm1hdCBzdWl0YWJsZSBmb3IgbGluZWFyIG1l
bW9yeSBsYXlvdXQuCj4+PiBUaGUgZm9ybWF0IGlzIHNpbWlsYXIgdG8gUDIxMCB3aXRoIDQ6Mjoy
IHN1Yi1zYW1wbGluZyBidXQgaGFzIG5vIHBhZGRpbmcKPj4+IGJldHdlZW4gY29tcG9uZW50cy4g
SW5zdGVhZCwgbHVtaW5hbmNlIGFuZCBjaHJvbWluYW5jZSBzYW1wbGVzIGFyZSBncm91cGVkCj4+
PiBpbnRvIDRzIHNvIHRoYXQgZWFjaCBncm91cCBpcyBwYWNrZWQgaW50byBhbiBpbnRlZ2VyIG51
bWJlciBvZiBieXRlczoKPj4+Cj4+PiBZWVlZID0gVVZVViA9IDQgKiAxMCBiaXRzID0gNDAgYml0
cyA9IDUgYnl0ZXMKPj4+Cj4+PiBUaGUgJzIwJyBzdWZmaXggcmVmZXJzIHRvIHRoZSBvcHRpbXVt
IGVmZmVjdGl2ZSBiaXRzIHBlciBwaXhlbCB3aGljaCBpcwo+Pj4gYWNoaWV2ZWQgd2hlbiB0aGUg
dG90YWwgbnVtYmVyIG9mIGx1bWluYW5jZSBzYW1wbGVzIGlzIGEgbXVsdGlwbGUgb2YgNC4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4+PiAt
LS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgIHwgNCArKysrCj4+PiAgICBp
bmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDEgKwo+Pj4gICAgMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mb3VyY2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPj4+IGluZGV4IDcyMmM3
ZWJlNGU4OC4uMmE5YzhhZTcxOWVkIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mb3VyY2MuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+Pj4gQEAg
LTI3OCw2ICsyNzgsMTAgQEAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqX19kcm1fZm9y
bWF0X2luZm8odTMyIGZvcm1hdCkKPj4+ICAgIAkJICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Bl
cl9ibG9jayA9IHsgNSwgNSwgMCB9LAo+Pj4gICAgCQkgIC5ibG9ja193ID0geyA0LCAyLCAwIH0s
IC5ibG9ja19oID0geyAxLCAxLCAwIH0sIC5oc3ViID0gMiwKPj4+ICAgIAkJICAudnN1YiA9IDIs
IC5pc195dXYgPSB0cnVlIH0sCj4+PiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMjAsCQku
ZGVwdGggPSAwLAo+Pj4gKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9ibG9jayA9IHsg
NSwgNSwgMCB9LAo+Pj4gKwkJICAuYmxvY2tfdyA9IHsgNCwgMiwgMCB9LCAuYmxvY2tfaCA9IHsg
MSwgMSwgMCB9LCAuaHN1YiA9IDIsCj4+PiArCQkgIC52c3ViID0gMSwgLmlzX3l1diA9IHRydWUg
fSwKPj4+ICAgIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9RNDEwLAkJLmRlcHRoID0gMCwKPj4+
ICAgIAkJICAubnVtX3BsYW5lcyA9IDMsIC5jaGFyX3Blcl9ibG9jayA9IHsgMiwgMiwgMiB9LAo+
Pj4gICAgCQkgIC5ibG9ja193ID0geyAxLCAxLCAxIH0sIC5ibG9ja19oID0geyAxLCAxLCAxIH0s
IC5oc3ViID0gMCwKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2Mu
aCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4+PiBpbmRleCBiNWJmMWMwZTYzMGUu
LjI0NGQzMjQzM2E2NyAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJj
Yy5oCj4+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+Pj4gQEAgLTI0Miw2
ICsyNDIsNyBAQCBleHRlcm4gIkMiIHsKPj4+ICAgICAqIGluZGV4IDEgPSBDcjpDYiBwbGFuZSwg
WzM5OjBdIENyMTpDYjE6Q3IwOkNiMCBsaXR0bGUgZW5kaWFuCj4+PiAgICAgKi8KPj4+ICAgICNk
ZWZpbmUgRFJNX0ZPUk1BVF9OVjE1CQlmb3VyY2NfY29kZSgnTicsICdWJywgJzEnLCAnNScpIC8q
IDJ4MiBzdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4+PiArI2RlZmluZSBEUk1fRk9STUFUX05W
MjAJCWZvdXJjY19jb2RlKCdOJywgJ1YnLCAnMicsICcwJykgLyogMngxIHN1YnNhbXBsZWQgQ3I6
Q2IgcGxhbmUgKi8KPj4+ICAgIAo+Pj4gICAgLyoKPj4+ICAgICAqIDIgcGxhbmUgWUNiQ3IgTVNC
IGFsaWduZWQKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+IExpbnV4LXJvY2tjaGlwQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJvY2tjaGlwCgotLSAKQmVzdCBSZWdhcmQKCum7hOWutumSlwpTYW5keSBIdWFuZwpB
ZGRyOiDnpo/lt57luILpvJPmpbzljLrpk5znm5jot6/ova/ku7blpKfpgZM4OeWPt+emj+W3nui9
r+S7tuWbrUHljLoyMeWPt+alvCgzNTAwMDMpCiAgICAgICBOby4gMjEgQnVpbGRpbmcsIEEgRGlz
dHJpY3QsIE5vLjg5LHNvZnR3YXJlIEJvdWxldmFyZCAKRnV6aG91LEZ1amlhbixQUkMKVGVs77ya
Kzg2IDA1OTEtODc4ODQ5MTkgIDg2OTAKRS1tYWls77yaaGpjQHJvY2stY2hpcHMuY29tCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
