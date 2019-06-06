Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C037160
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BAE8928D;
	Thu,  6 Jun 2019 10:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC8D8928D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 10:13:23 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id YpOXhyGU13qlsYpOahlotZ; Thu, 06 Jun 2019 12:13:21 +0200
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To: Anders Roxell <anders.roxell@linaro.org>, mchehab@kernel.org,
 p.zabel@pengutronix.de
References: <20190606094722.23816-1-anders.roxell@linaro.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
Date: Thu, 6 Jun 2019 12:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606094722.23816-1-anders.roxell@linaro.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF4tKlHxT213q5iKkMxyEhwvsl3wRabWeNLK5xiL8WKLAag63A3TOZyGmKvKw2GQ0WfyjxjXTEd9W8wEzukVk+psIlgFMWLll5pj2JsOATa9DeAuydvZ
 ddjJv6cbw+Yx00MItRjqmMci92xnhEnHpv1M2w59zA1NDNGjmRLSq3cAdtQxlM27/Up8XeGggGd09JeaXKionqZ4Ox8OkYGd75CEkMLwS0I9oFo2oaXlp2qm
 zHxHG7t/dsOA8w/WL8cjzmpNJprbOGialY+uHK0qhAd6ngo3E2+LWOtDMpiv8+29lafVg2h2MXmbJqTrD08YPp+dHbGmMooIEajhJOaXAsTO9DMXSW1DnGgb
 Mi+uPtNhxzXZNVHnKkgZylEAS1Gj9Btw1D2qstbFAGFqawel2DS7gaY7PnQwOyvQDUehTrtumQUrh09usYJrS95kgXOPsOuu9vdTrS9bCu3XLxvP83rFa7K4
 iRkei2i0QauBZ+765x4Q0YbU2MzvUEyEC/yU99imriRBIOT799HstalWgtztqFMWEOMUBGV6QT9McaXUQxxn1zJjzrhgJj6CwFejoRwRWeYKwsW9fgpwBWwy
 NgSZjZuEljrA0R8Der2ECk2NLkklIrPaIzz4+7f45/5Rg3AxiqHLmyd3gj/w7qDJjczZSXQntVVEXmhKhlGVziBa2olD9SYqZW5ea+F4y5ryBoJJXKeRqJdT
 tylLYuM7/v98g46LHLxat4QbrH4tbb0OQ6PVAoOzoPM+fU4eOOTZ318lqx8uL7K4w+bXwy6AyagH24lDBaWhhE6Ak0oPkTiWkzj+zIMgcHnUBVj2qyaZ+tGz
 49QGEH34eopVfAjGrY27QDYRwjAXHkE34k/PrX5pFSdpYBaRZmp7Cy7hsJ65WK3Eqac5SwfaayWzyuqV27vo48JIPhsH5LTGMqwPFbq3mOKKvs5I0+GRKlB3
 Xzk7eNEZqr4/hN04KmzKR9jYfWw=
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org, marex@denx.de,
 f.fainelli@gmail.com, vivien.didelot@gmail.com, linux-media@vger.kernel.org,
 b.zolnierkie@samsung.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 lgirdwood@gmail.com, shawnguo@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ3IEFNLCBBbmRlcnMgUm94ZWxsIHdyb3RlOgo+IFdoZW4gYnVpbGRpbmcg
d2l0aCBDT05GSUdfVklERU9fQ09EQSBhbmQgQ09ORklHX0NPREFfRlMgZW5hYmxlZCBhcwo+IGxv
YWRhYmxlIG1vZHVsZXMsIHdlIHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gCj4gd2Fybmlu
Zzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gICBmcy9jb2RhL2NvZGEua28KPiAgIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vY29kYS9jb2RhLmtvCj4gCj4gUmV3b3JrIHNvIG1lZGlhIGNvZGEg
bWF0Y2hlcyB0aGUgY29uZmlnIGZyYWdtZW50LiBMZWF2aW5nIENPREFfRlMgYXMgaXMKPiBzaW5j
ZSB0aGF0cyBhIHdlbGwga25vd24gbW9kdWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZGVycyBS
b3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9jb2RhL01ha2VmaWxlIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vY29kYS9NYWtlZmlsZSBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9NYWtl
ZmlsZQo+IGluZGV4IDU0ZTlhNzNhOTJhYi4uNTg4ZTZiZjdjMTkwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vY29kYS9NYWtlZmlsZQo+IEBAIC0xLDYgKzEsNiBAQAo+ICAjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiAgCj4gLWNvZGEtb2JqcyA6PSBjb2RhLWNvbW1v
bi5vIGNvZGEtYml0Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1wZWcyLm8gY29kYS1t
cGVnNC5vIGNvZGEtanBlZy5vCj4gK3ZpZGVvLWNvZGEtb2JqcyA6PSBjb2RhLWNvbW1vbi5vIGNv
ZGEtYml0Lm8gY29kYS1nZGkubyBjb2RhLWgyNjQubyBjb2RhLW1wZWcyLm8gY29kYS1tcGVnNC5v
IGNvZGEtanBlZy5vCj4gIAo+IC1vYmotJChDT05GSUdfVklERU9fQ09EQSkgKz0gY29kYS5vCj4g
K29iai0kKENPTkZJR19WSURFT19DT0RBKSArPSB2aWRlby1jb2RhLm8KCkhvdyBhYm91dCBpbXgt
Y29kYT8gdmlkZW8tY29kYSBzdWdnZXN0cyBpdCBpcyBwYXJ0IG9mIHRoZSB2aWRlbyBzdWJzeXN0
ZW0sCndoaWNoIGl0IGlzbid0LgoKUmVnYXJkcywKCglIYW5zCgo+ICBvYmotJChDT05GSUdfVklE
RU9fSU1YX1ZET0EpICs9IGlteC12ZG9hLm8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
