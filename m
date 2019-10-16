Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D86D9D82
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 23:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA0C6E1F9;
	Wed, 16 Oct 2019 21:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B156E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 21:31:04 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:31020
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iKqsm-0007Mz-Ap; Wed, 16 Oct 2019 23:31:00 +0200
Subject: Re: [PATCH] spi: pxa2xx: Set controller->max_transfer_size in dma mode
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <36610873-fa30-a286-d05c-5eceb3cbcb57@tronnes.org>
Date: Wed, 16 Oct 2019 23:30:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YO4bstpSIjecSQN93QBK9/zVvOiMiUN5oIW04KmN4/A=; b=IcIeHDSRQuul79ivzJ+JabGJGu
 SsMJEgs7u1FZUKzHkg/s9uaBGl0b/wdJufUVoCFZxQ9OOYURsLGsfQ0bgP2XpQbdqC7DEUWBUAVhs
 2WxjuESz1+HAkLF7XJ9LA36DR6i41tqP2I2YaTTjinMD0NvCyVD5db6ZJunVzNrU/Wcszi4TiNs9k
 0CN5XRp5QGj5NacTZBzRCviic39kJuL03dOa7XY1kbfbotAqoWFm2yhmfS5QfuSuXeg2rLzXD8668
 M4UjgZgx0jFgIGu9qF4G9h4UIs+/ZnkrCFcPfzamzh2FCwtS9MteSX/MqzyJQhmMvHKuRtEIeA1A8
 vGdsHv7g==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTYuMTAuMjAxOSAyMS41Nywgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBJbiBETUEgbW9k
ZSB3ZSBoYXZlIGEgbWF4aW11bSB0cmFuc2ZlciBzaXplLCBwYXN0IHRoYXQgdGhlIGRyaXZlcgo+
IGZhbGxzIGJhY2sgdG8gUElPIChzZWUgdGhlIGNoZWNrIGF0IHRoZSB0b3Agb2YgcHhhMnh4X3Nw
aV90cmFuc2Zlcl9vbmUpLgo+IEZhbGxpbmcgYmFjayB0byBQSU8gZm9yIGJpZyB0cmFuc2ZlcnMg
ZGVmZWF0cyB0aGUgcG9pbnQgb2YgYSBkbWEgZW5naW5lLAo+IGhlbmNlIHNldCB0aGUgbWF4IHRy
YW5zZmVyIHNpemUgdG8gaW5mb3JtIHNwaSBjbGllbnRzIHRoYXQgdGhleSBuZWVkCj4gdG8gZG8g
c29tZXRoaW5nIHNtYXJ0ZXIuCj4gCj4gVGhpcyB3YXMgdW5jb3ZlcmVkIGJ5IHRoZSBkcm1fbWlw
aV9kYmkgc3BpIHBhbmVsIGNvZGUsIHdoaWNoIGRvZXMKPiBsYXJnZSBzcGkgdHJhbnNmZXJzLCBi
dXQgc3RvcHBlZCBzcGxpdHRpbmcgdGhlbSBhZnRlcjoKPiAKPiBjb21taXQgZTE0MzM2NGI0YzE3
NzRmNjhlOTIzYTVhMGJiMGZjYTI4YWMyNTg4OAo+IEF1dGhvcjogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+Cj4gRGF0ZTogICBGcmkgSnVsIDE5IDE3OjU5OjEwIDIwMTkgKzAy
MDAKPiAKPiAgICAgZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJtX3NwaV9tYXhfdHJhbnNmZXJf
c2l6ZSgpCj4gCj4gQWZ0ZXIgdGhpcyBjb21taXQgdGhlIGNvZGUgcmVsaWVkIG9uIHRoZSBzcGkg
Y29yZSB0byBzcGxpdCB0cmFuc2ZlcnMKPiBpbnRvIG1heCBkbWEtYWJsZSBibG9ja3MsIHdoaWNo
IGFsc28gcGFwZXJlZCBvdmVyIHRoZSBQSU8gZmFsbGJhY2sgaXNzdWUuCj4gCj4gRml4IHRoaXMg
Ynkgc2V0dGluZyB0aGUgb3ZlcmFsbCBtYXggdHJhbnNmZXIgc2l6ZSB0byB0aGUgRE1BIGxpbWl0
LAo+IGJ1dCBvbmx5IHdoZW4gdGhlIGNvbnRyb2xsZXIgcnVucyBpbiBETUEgbW9kZS4KPiAKPiBG
aXhlczogZTE0MzM2NGI0YzE3ICgiZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJtX3NwaV9tYXhf
dHJhbnNmZXJfc2l6ZSgpIikKPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBDYzogQW5keSBTaGV2
Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYW5kLXRlc3Rl
ZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+Cj4gQ2M6
IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KPiBDYzogSGFvamlhbiBaaHVhbmcgPGhh
b2ppYW4uemh1YW5nQGdtYWlsLmNvbT4KPiBDYzogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6
bWlrQGZyZWUuZnI+Cj4gQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBDYzog
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNwaUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+IC0tLQo+ICBkcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Bp
L3NwaS1weGEyeHguYyBiL2RyaXZlcnMvc3BpL3NwaS1weGEyeHguYwo+IGluZGV4IGJiNmExNGQx
YWIwZi4uZjc3MjAxOTE1MDMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1weGEyeHgu
Ywo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1weGEyeHguYwo+IEBAIC0xNzA3LDYgKzE3MDcsNyBA
QCBzdGF0aWMgaW50IHB4YTJ4eF9zcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgCQl9IGVsc2Ugewo+ICAJCQljb250cm9sbGVyLT5jYW5fZG1hID0gcHhhMnh4X3NwaV9j
YW5fZG1hOwo+ICAJCQljb250cm9sbGVyLT5tYXhfZG1hX2xlbiA9IE1BWF9ETUFfTEVOOwo+ICsJ
CQljb250cm9sbGVyLT5tYXhfdHJhbnNmZXJfc2l6ZSA9IE1BWF9ETUFfTEVOOwoKQXMgQW5keSBt
ZW50aW9uZWQsIC0+bWF4X3RyYW5zZmVyX3NpemUgaXMgYSBjYWxsYmFjazoKCnN0cnVjdCBzcGlf
Y29udHJvbGxlciB7CgkvKgoJICogb24gc29tZSBoYXJkd2FyZSB0cmFuc2ZlciAvIG1lc3NhZ2Ug
c2l6ZSBtYXkgYmUgY29uc3RyYWluZWQKCSAqIHRoZSBsaW1pdCBtYXkgZGVwZW5kIG9uIGRldmlj
ZSB0cmFuc2ZlciBzZXR0aW5ncwoJICovCglzaXplX3QgKCptYXhfdHJhbnNmZXJfc2l6ZSkoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSk7CgooSSBsb29rZWQgYXQgaXRzIHVzZXJzIGFuZCB0aGV5IGFs
bCByZXR1cm4gYSBzdGF0aWMgb3IgcHJvYmUgdGltZSB2YWx1ZQpzbyBub3Qgc3VyZSB3aHkgaXQn
cyBhIGNhbGxiYWNrLikKCk5vcmFsZi4KCj4gIAkJfQo+ICAJfQo+ICAKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
