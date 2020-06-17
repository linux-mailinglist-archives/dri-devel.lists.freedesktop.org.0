Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481591FEC29
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068026EAB8;
	Thu, 18 Jun 2020 07:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 313 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jun 2020 12:13:06 UTC
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D68989A76
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 12:13:06 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id 16B3D125
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:07:49 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.111])
 by regular2.263xmail.com (Postfix) with ESMTP id 69B101A1E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:07:47 +0800 (CST)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id 727BF684;
 Wed, 17 Jun 2020 20:07:42 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P25389T140143172253440S1592395661407272_; 
 Wed, 17 Jun 2020 20:07:42 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <2f2aa222071add7fb750d61c24ed6731>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_1/2=5d_drm=3a_drm=5ffourcc=3a_add_NV20_YUV?=
 =?UTF-8?B?IGZvcm1hdOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJvY2tjaGlwLWJv?=
 =?UTF-8?Q?unces+sandy=2ehuang=3drock-chips=2ecom=40lists=2einfradead=2eorg?=
 =?UTF-8?B?5Luj5Y+R44CR?=
To: Jonas Karlman <jonas@kwiboo.se>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
References: <20200607202521.18438-1-jonas@kwiboo.se>
 <20200607202521.18438-2-jonas@kwiboo.se>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <d503eed1-571f-3e37-858b-b5de04cb79f7@rock-chips.com>
Date: Wed, 17 Jun 2020 20:07:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200607202521.18438-2-jonas@kwiboo.se>
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 Ben Davis <ben.davis@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9uYXMgS2FybG1hbiwKCiDCoMKgwqAgSXMgdGhlcmUgYW4gYW5vdGhlciB5dXYgMTBiaXQg
Zm9ybWF0IHdpdGggNDo0OjQgc3ViLXNpbXBsaW5nIGJ1dCAKaGFzIG5vIHBhZGRpbmc/CgogwqBN
YXliZSB3ZSBjYW4gY2FsbCBpdCBEUk1fRk9STUFUX05WMzA6Cgp7IC5mb3JtYXQgPSBEUk1fRk9S
TUFUX05WMzAsCQkuZGVwdGggPSAwLAogICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9ibG9j
ayA9IHsgNSwgNSwgMCB9LAogICAuYmxvY2tfdyA9IHsgNCwgMiwgMCB9LCAuYmxvY2tfaCA9IHsg
MSwgMSwgMCB9LCAuaHN1YiA9IDEsCiAgIC52c3ViID0gMSwgLmlzX3l1diA9IHRydWUgfSwKCnRo
aXMgZm9ybWF0IGNhbiBzdXBwb3J0ZWQgYnkgcm9ja2NoaXAgcmszMjg4L3JrMzM5OS4uLiBwbGF0
Zm9ybSwgY2FuIHlvdSAKYWRkIHRoaXMgZm9ybWF0IGF0IHRoaXMgc2VyaWVzIHBhdGNoZXM/Cgrl
nKggMjAyMC82LzggNDoyNSwgSm9uYXMgS2FybG1hbiDlhpnpgZM6Cj4gRFJNX0ZPUk1BVF9OVjIw
IGlzIGEgMiBwbGFuZSBmb3JtYXQgc3VpdGFibGUgZm9yIGxpbmVhciBtZW1vcnkgbGF5b3V0Lgo+
IFRoZSBmb3JtYXQgaXMgc2ltaWxhciB0byBQMjEwIHdpdGggNDoyOjIgc3ViLXNhbXBsaW5nIGJ1
dCBoYXMgbm8gcGFkZGluZwo+IGJldHdlZW4gY29tcG9uZW50cy4gSW5zdGVhZCwgbHVtaW5hbmNl
IGFuZCBjaHJvbWluYW5jZSBzYW1wbGVzIGFyZSBncm91cGVkCj4gaW50byA0cyBzbyB0aGF0IGVh
Y2ggZ3JvdXAgaXMgcGFja2VkIGludG8gYW4gaW50ZWdlciBudW1iZXIgb2YgYnl0ZXM6Cj4KPiBZ
WVlZID0gVVZVViA9IDQgKiAxMCBiaXRzID0gNDAgYml0cyA9IDUgYnl0ZXMKPgo+IFRoZSAnMjAn
IHN1ZmZpeCByZWZlcnMgdG8gdGhlIG9wdGltdW0gZWZmZWN0aXZlIGJpdHMgcGVyIHBpeGVsIHdo
aWNoIGlzCj4gYWNoaWV2ZWQgd2hlbiB0aGUgdG90YWwgbnVtYmVyIG9mIGx1bWluYW5jZSBzYW1w
bGVzIGlzIGEgbXVsdGlwbGUgb2YgNC4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4g
PGpvbmFzQGt3aWJvby5zZT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMg
IHwgNCArKysrCj4gICBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDEgKwo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZvdXJjYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+IGluZGV4
IDcyMmM3ZWJlNGU4OC4uMmE5YzhhZTcxOWVkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZm91cmNjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4gQEAg
LTI3OCw2ICsyNzgsMTAgQEAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqX19kcm1fZm9y
bWF0X2luZm8odTMyIGZvcm1hdCkKPiAgIAkJICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9i
bG9jayA9IHsgNSwgNSwgMCB9LAo+ICAgCQkgIC5ibG9ja193ID0geyA0LCAyLCAwIH0sIC5ibG9j
a19oID0geyAxLCAxLCAwIH0sIC5oc3ViID0gMiwKPiAgIAkJICAudnN1YiA9IDIsIC5pc195dXYg
PSB0cnVlIH0sCj4gKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjIwLAkJLmRlcHRoID0gMCwK
PiArCQkgIC5udW1fcGxhbmVzID0gMiwgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCA1LCAwIH0sCj4g
KwkJICAuYmxvY2tfdyA9IHsgNCwgMiwgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMSwgMCB9LCAuaHN1
YiA9IDIsCj4gKwkJICAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlIH0sCj4gICAJCXsgLmZvcm1h
dCA9IERSTV9GT1JNQVRfUTQxMCwJCS5kZXB0aCA9IDAsCj4gICAJCSAgLm51bV9wbGFuZXMgPSAz
LCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDIsIDIgfSwKPiAgIAkJICAuYmxvY2tfdyA9IHsgMSwg
MSwgMSB9LCAuYmxvY2tfaCA9IHsgMSwgMSwgMSB9LCAuaHN1YiA9IDAsCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91
cmNjLmgKPiBpbmRleCBiNWJmMWMwZTYzMGUuLjI0NGQzMjQzM2E2NyAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJt
X2ZvdXJjYy5oCj4gQEAgLTI0Miw2ICsyNDIsNyBAQCBleHRlcm4gIkMiIHsKPiAgICAqIGluZGV4
IDEgPSBDcjpDYiBwbGFuZSwgWzM5OjBdIENyMTpDYjE6Q3IwOkNiMCBsaXR0bGUgZW5kaWFuCj4g
ICAgKi8KPiAgICNkZWZpbmUgRFJNX0ZPUk1BVF9OVjE1CQlmb3VyY2NfY29kZSgnTicsICdWJywg
JzEnLCAnNScpIC8qIDJ4MiBzdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4gKyNkZWZpbmUgRFJN
X0ZPUk1BVF9OVjIwCQlmb3VyY2NfY29kZSgnTicsICdWJywgJzInLCAnMCcpIC8qIDJ4MSBzdWJz
YW1wbGVkIENyOkNiIHBsYW5lICovCj4gICAKPiAgIC8qCj4gICAgKiAyIHBsYW5lIFlDYkNyIE1T
QiBhbGlnbmVkCgotLSAKQmVzdCBSZWdhcmQKCum7hOWutumSlwpTYW5keSBIdWFuZwpBZGRyOiDn
po/lt57luILpvJPmpbzljLrpk5znm5jot6/ova/ku7blpKfpgZM4OeWPt+emj+W3nui9r+S7tuWb
rUHljLoyMeWPt+alvCgzNTAwMDMpCiAgICAgICBOby4gMjEgQnVpbGRpbmcsIEEgRGlzdHJpY3Qs
IE5vLjg5LHNvZnR3YXJlIEJvdWxldmFyZCBGdXpob3UsRnVqaWFuLFBSQwpUZWzvvJorODYgMDU5
MS04Nzg4NDkxOSAgODY5MApFLW1haWzvvJpoamNAcm9jay1jaGlwcy5jb20KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
