Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FA35713E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 17:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198226E069;
	Wed,  7 Apr 2021 15:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C4E6E069
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 15:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D7046139E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617811187;
 bh=hGXNzVJiH86Iaj7zXKQ35uQKcMAGo1DSHvGN1U3LigI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eo9KXeSeF+qiiMEGBRTSan29w2Je5fOzX3pOmVElTHi7slb0WJjRYTAXzrWkEi5x6
 yTVFc4CvBTJLc4Oujco6Z+AL2tSisD/h6vlGZU9lXUEL07/Wl6JQn2Ltl6/VIKK/Ye
 kE5p1sWa2AOpUz8CiyzLM9P0jaCQHocVmc316We4uxopIxF4FX5SavnDy87kwOQXVe
 y3qrrM/cTCmaPCZPDElsMGRKu91TH7Zad4Nw1Vnl7HZrMlZFT4pmA7H2B08jwBkbay
 JCixRc/O6Upa3OxBNVKdH4K2DBI/HDrK1y4hXX13GRC95O/hZGGO3y2jZyrxQI4e2T
 TNJ52eMFZd0YQ==
Received: by mail-ej1-f54.google.com with SMTP id n2so22283194ejy.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 08:59:47 -0700 (PDT)
X-Gm-Message-State: AOAM532j2EwqV/Ig5R7clrC4YewQFQsVqrp5RpwsWu3E7X4AM2DJueAZ
 V4SLr1jomAIv/R7q0kbXs0mlJDnfuIj/fdubCg==
X-Google-Smtp-Source: ABdhPJwpyfbWTwn3/jlmyA5Hhu8Vwe6NWCunioufvDhHzHzmvZ82ObW9OPDby6jvwPsk5u2uvIzq/RFbEZhCbrFa1jc=
X-Received: by 2002:a17:906:4a52:: with SMTP id
 a18mr4522021ejv.194.1617811185726; 
 Wed, 07 Apr 2021 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210407143656.2574-1-jitao.shi@mediatek.com>
In-Reply-To: <20210407143656.2574-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Apr 2021 23:59:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sxEZ-M8dp1w4ac+DR-9ESOxVGfDfhd4d8MkCMsCj7kg@mail.gmail.com>
Message-ID: <CAAOTY_9sxEZ-M8dp1w4ac+DR-9ESOxVGfDfhd4d8MkCMsCj7kg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: force hsa hsa hfp packets multiple of line
 num to avoid screen shift
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Cawa Cheng <cawa.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDTmnIg35pelIOmAseS4iSDkuIvljYgxMDozN+Wvq+mBk++8mgo+Cj4gVGhlIGJyaWRnZSBjaGlw
IEFOWDc2MjUgcmVxdWlyZSB0aGUgbGluZSBwYWNrZXRzIGVuZGluZyBhdCB0aGUgc2FtZXRpbWUK
PiBvciBBTlg3NjI1IHdpbGwgc2hpZnQgdGhlIHNjcmVlbi4KPgo+IENoYW5nZS1JZDogSWEzMjRh
ZDI4ZmJmZjU0MTQwZmVlZGI5YTFkNmJmYjJiMjQ2ZDA0NDcKPiBTaWduZWQtb2ZmLWJ5OiBKaXRh
byBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGEx
ZmYxNTJlZjQ2OC4uZTgyNWE4MDg2MmRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gQEAgLTE5NCw2ICsxOTQsOCBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1
Y3QgY2xrICpoc19jbGs7Cj4KPiAgICAgICAgIHUzMiBkYXRhX3JhdGU7Cj4gKyAgICAgICAvKiBm
b3JjZSBkc2kgbGluZSBlbmQgd2l0aG91dCBkc2lfbnVsbCBkYXRhICovCj4gKyAgICAgICBib29s
IGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsOwo+Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1v
ZGVfZmxhZ3M7Cj4gICAgICAgICBlbnVtIG1pcGlfZHNpX3BpeGVsX2Zvcm1hdCBmb3JtYXQ7Cj4g
QEAgLTQ5NSw2ICs0OTcsMTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWlu
ZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgICAgICAgICBEUk1fV0FSTigiSEZQICsg
SEJQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwgdW5kZXIgNjBIelxuIik7Cj4gICAgICAgICB9
Cj4KPiArICAgICAgIGlmIChkc2ktPmZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsKSB7Cj4gKyAg
ICAgICAgICAgICAgIGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSA9IHJvdW5kdXAoaG9yaXpv
bnRhbF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAg
IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX2Zyb250cG9y
Y2hfYnl0ZSwgZHNpLT5sYW5lcykgLSAyOwo+ICsgICAgICAgICAgICAgICBob3Jpem9udGFsX2Jh
Y2twb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlLCBkc2ktPmxh
bmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLT0g
KHZtLT5oYWN0aXZlICogZHNpX3RtcF9idWZfYnBwICsgMikgJSBkc2ktPmxhbmVzOwo+ICsgICAg
ICAgfQo+ICsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUsIGRz
aS0+cmVncyArIERTSV9IU0FfV0MpOwo+ICAgICAgICAgd3JpdGVsKGhvcml6b250YWxfYmFja3Bv
cmNoX2J5dGUsIGRzaS0+cmVncyArIERTSV9IQlBfV0MpOwo+ICAgICAgICAgd3JpdGVsKGhvcml6
b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEZQX1dDKTsKPiBAQCAtMTA5
MSw2ICsxMTAwLDkgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gICAgICAgICBkc2ktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2Rl
Owo+ICAgICAgICAgZHNpLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EU0k7Cj4K
PiArICAgICAgIGRzaS0+Zm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwgPSBvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2woZGV2LT5vZl9ub2RlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZm9yY2VfZHNpX2VuZF93aXRob3V0X251
bGwiKTsKCklmIGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsIGlzIGNhdXNlZCBieSBBTlg3NjI1
LCBJIHRoaW5rIHdlIHNob3VsZApnZXQgdGhpcyBpbmZvcm1hdGlvbiBmcm9tIEFOWDc2MjUuCgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArCj4gICAgICAgICBkcm1fYnJpZGdlX2FkZCgmZHNpLT5i
cmlkZ2UpOwo+Cj4gICAgICAgICByZXQgPSBjb21wb25lbnRfYWRkKCZwZGV2LT5kZXYsICZtdGtf
ZHNpX2NvbXBvbmVudF9vcHMpOwo+IC0tCj4gMi4yNS4xCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
