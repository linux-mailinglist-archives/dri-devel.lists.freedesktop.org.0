Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B646F37155
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A173E8928D;
	Thu,  6 Jun 2019 10:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186CA89295
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 10:11:32 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id YpMehyF6B3qlsYpMihlo7j; Thu, 06 Jun 2019 12:11:31 +0200
Subject: Re: [PATCH 4/8] drivers: media: i2c: fix warning same module names
To: Anders Roxell <anders.roxell@linaro.org>, airlied@linux.ie,
 daniel@ffwll.ch, a.hajda@samsung.com, mchehab@kernel.org
References: <20190606094717.23766-1-anders.roxell@linaro.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <70810da0-817a-0863-d9d4-6410c7f4e9b9@xs4all.nl>
Date: Thu, 6 Jun 2019 12:11:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606094717.23766-1-anders.roxell@linaro.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfAZS+cd+pLaijzjhBz+L7H/aWoGI2ifiKUOPcY/4i27o0giIMr3P3cOG4Z5ABNIakccyPQPCTGlPttM2yk7ggTF/romUsjuwljGIBX2+ZhDG20ND7r/8
 gknRZ4LBNPThxTQVzqQr1Yrt55RLfx0sTK2sFGx59wp6mIKwHxN8NwNPU44tDw5rN/u9TlqRftHQruCiYSDGyo4pMCZIQWVdLHjEt58b1mj4TYhr27JTsKio
 X5JHx2ulb/iQOmE2otX1p9rQyw8lQtZiuPv2K//3jutLbuar/Cyshhg7TJ/mPjj0ULLDTzsO8wV8ANeHylJf45mtLkzlJlRPUHl1nzn77T5CjW2xbK+VBhUB
 ZJudCQ3gclEI1ar2GUzyapbeBi1lE7ek8F6o8Xmb5L+9yhTs3j+l0SGElJfeIvXxmX/udS2v1b+k3pY5cXfPNOC62xgQFFOPJiXoj3R+frLgGhcgeKa/TJwP
 5XONSsEnk8MmJ3QCjJeW2ijvAOqbJY2QRbf2xR87BeuC8/iUNeFTpq4RHLgnQ5Hwz7gypkVeixXlO6gA8BofxEk4Qswzjh/NqFFNKMDI2DjqF/v18ab6mLfi
 XZZa2Tk6J59h/uj/D52k3qdy9QIOSMTempANKnpX2RWEag/Mfa3ao6IFkYKa9cYyCILqpFfdEGDnr2PDpeycr0/Ksd3tLMTYcu+OAewH6no03/+fEUEayBsP
 vmXkDw0HhUqW4EzmZyJjkBLkkpoi1C16YhEZ63tL6ub41pmMUwgd5QVStJPOh0frAaYLngVtSYmyvkPdPcQf89acuwYrvdmzcOmrJk9QIG686MP7Pqyf4YF/
 DjF8AudR+HHTg27UgtTtot0MZsaGF7cDuKoSg8BGIvExF+bSEIuRUJBDZgjglQGMIZzAtTbRCDILv4oFyZKCtZmrBW7DGgfrXbY0Mtbrn/lfsJdIcdpYZfGs
 zkC7fsS3iB+oYw0fy1qVrhvQ6Z8=
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
Cc: marex@denx.de, andrew@lunn.ch, linux-fbdev@vger.kernel.org,
 f.fainelli@gmail.com, linux-arm-kernel@lists.infradead.org,
 b.zolnierkie@samsung.com, lee.jones@linaro.org, lgirdwood@gmail.com,
 davem@davemloft.net, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org, shawnguo@kernel.org,
 vivien.didelot@gmail.com, linux-kernel@vger.kernel.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ3IEFNLCBBbmRlcnMgUm94ZWxsIHdyb3RlOgo+IFdoZW4gYnVpbGRpbmcg
d2l0aCBDT05GSUdfVklERU9fQURWNzUxMSBhbmQgQ09ORklHX0RSTV9JMkNfQURWNzUxMQo+IGVu
YWJsZWQgYXMgbG9hZGFibGUgbW9kdWxlcywgd2Ugc2VlIHRoZSBmb2xsb3dpbmcgd2FybmluZzoK
PiAKPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoKPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmtvCj4gICBkcml2ZXJzL21lZGlhL2kyYy9hZHY3NTEx
LmtvCj4gCj4gUmV3b3JrIHNvIHRoZSBuYW1lcyBtYXRjaGVzIHRoZSBjb25maWcgZnJhZ21lbnQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8u
b3JnPgoKQ2hhbmdlIGl0IGluIG1lZGlhLCBub3QgaW4gZHJtLiBUaGUgdjRsMiBhZHY3NTExIGlz
IHJhcmVseSB1c2VkLCBzbyBpdAptYWtlcyBzZW5zZSB0byByZW5hbWUgdGhhdCwgYW5kIG5vdCB0
aGlzIGRybSBkcml2ZXIuCgo+IC0tLQo+IFRoaXMgaXMgb25seSBvbmUgaXNzdWUgdGhhdCBoYXZl
IGJlZW4gYWRkcmVzc2VkLgo+IFRoZSBvdGhlciBpc3N1ZSBpcyB0aGF0IGl0c2VlbXMgdG8gcmVm
ZXIgdG8gdGhlIHNhbWUgZGV2aWNlIG5hbWUgaW4KPiBpMmNfZGV2aWNlX2lkLCBhbnkgZ3VpZGFu
Y2UgaG93IHRoYXQgc2hvdWxkIGJlIHNvbHZlZD8KCllvdSBzaG91bGQgbmV2ZXIgaGF2ZSBib3Ro
IG1vZHVsZXMgbG9hZGVkLiBJbiBmYWN0LCBJIHRoaW5rIGl0IGlzIGEgZ29vZAppZGVhIHRvIGRp
c2FibGUgVklERU9fQURWNzUxMSBpZiBEUk1fSTJDX0FEVjc1MTEgaXMgc2V0IGluIHRoZSBLY29u
ZmlnLAp1bmxlc3MgVEVTVF9DT01QSUxFIGlzIGFsc28gc2V0LgoKUmVnYXJkcywKCglIYW5zCgo+
IAo+IAo+IENoZWVycywKPiBBbmRlcnMKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL01ha2VmaWxlIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmls
ZSAgICAgICAgICAgICAgfCAgMyArKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYWR2NzUxMS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9NYWtl
ZmlsZQo+IGluZGV4IGI0NmViZWIzNWZkNC4uZTM2NzQyNmJkNzNlIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYWR2NzUxMS9NYWtlZmlsZQo+IEBAIC0xLDYgKzEsNiBAQAo+ICAjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiAtYWR2NzUxMS15IDo9IGFkdjc1MTFf
ZHJ2Lm8KPiAtYWR2NzUxMS0kKENPTkZJR19EUk1fSTJDX0FEVjc1MTFfQVVESU8pICs9IGFkdjc1
MTFfYXVkaW8ubwo+IC1hZHY3NTExLSQoQ09ORklHX0RSTV9JMkNfQURWNzUxMV9DRUMpICs9IGFk
djc1MTFfY2VjLm8KPiAtYWR2NzUxMS0kKENPTkZJR19EUk1fSTJDX0FEVjc1MzMpICs9IGFkdjc1
MzMubwo+IC1vYmotJChDT05GSUdfRFJNX0kyQ19BRFY3NTExKSArPSBhZHY3NTExLm8KPiArZHJt
LWkyYy1hZHY3NTExLXkgOj0gYWR2NzUxMV9kcnYubwo+ICtkcm0taTJjLWFkdjc1MTEtJChDT05G
SUdfRFJNX0kyQ19BRFY3NTExX0FVRElPKSArPSBhZHY3NTExX2F1ZGlvLm8KPiArZHJtLWkyYy1h
ZHY3NTExLSQoQ09ORklHX0RSTV9JMkNfQURWNzUxMV9DRUMpICs9IGFkdjc1MTFfY2VjLm8KPiAr
ZHJtLWkyYy1hZHY3NTExLSQoQ09ORklHX0RSTV9JMkNfQURWNzUzMykgKz0gYWR2NzUzMy5vCj4g
K29iai0kKENPTkZJR19EUk1fSTJDX0FEVjc1MTEpICs9IGRybS1pMmMtYWR2NzUxMS5vCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlIGIvZHJpdmVycy9tZWRpYS9pMmMv
TWFrZWZpbGUKPiBpbmRleCBkOGFkOWRhZDQ5NWQuLmI3MWE0MjdhODlmZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL01h
a2VmaWxlCj4gQEAgLTM1LDcgKzM1LDggQEAgb2JqLSQoQ09ORklHX1ZJREVPX0FEVjc0OFgpICs9
IGFkdjc0OHgvCj4gIG9iai0kKENPTkZJR19WSURFT19BRFY3NjA0KSArPSBhZHY3NjA0Lm8KPiAg
b2JqLSQoQ09ORklHX1ZJREVPX0FEVjc4NDIpICs9IGFkdjc4NDIubwo+ICBvYmotJChDT05GSUdf
VklERU9fQUQ5Mzg5QikgKz0gYWQ5Mzg5Yi5vCj4gLW9iai0kKENPTkZJR19WSURFT19BRFY3NTEx
KSArPSBhZHY3NTExLm8KPiArb2JqLSQoQ09ORklHX1ZJREVPX0FEVjc1MTEpICs9IHZpZGVvLWFk
djc1MTEubwo+ICt2aWRlby1hZHY3NTExLW9ianMgICAgICAgICAgOj0gYWR2NzUxMS5vCj4gIG9i
ai0kKENPTkZJR19WSURFT19WUFgzMjIwKSArPSB2cHgzMjIwLm8KPiAgb2JqLSQoQ09ORklHX1ZJ
REVPX1ZTNjYyNCkgICs9IHZzNjYyNC5vCj4gIG9iai0kKENPTkZJR19WSURFT19CVDgxOSkgKz0g
YnQ4MTkubwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
