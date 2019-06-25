Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D552010
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 02:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82889E39;
	Tue, 25 Jun 2019 00:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D6189E39
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 00:43:09 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l128so11260388qke.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 17:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2ogumH57Dk+mOO0y5/CmcdAve3k/tPr0Lofkj3W1yQ=;
 b=cu40gr7ZKyEXUTZL46Try2gBP6odg2caK6l8eoCsqj0XG9N2ckRVVE5Z3YqOP+gnub
 5ctOpdhOB8N/UQw7uqCdXeS3iyhBJqIjpOUxXXwupReuvsjsjLOQB15LSLLr+Se3eoMf
 D/xWzAfd2N/KwQjhiQqpivNgf7LI9S/hFXcSzzKblyi0Nia22EDvA9Q+0WrobsQNAzGR
 Nls/M2Re7vy2dkKencoLk1Fvssfzw0o10qMjMocPGKr9bFbwCpFgukq0x4j6RphAtrfZ
 TzSke2uo//ZCwEKLQ8F0odgRgdRVaoAOEWC9qdXe4+WcaRJrlCMHvnWoUJkspnKjVRld
 wsiQ==
X-Gm-Message-State: APjAAAWV11a3Pr9afz8rNB52WM8cslY/HYKgLHV4cBb8vG7h8BPIbrhn
 Q5e4iRaJp4UN+Fh42Qy4jnqTz9gKHs3ecDPYFAwbcA==
X-Google-Smtp-Source: APXvYqwwA4s9JiBdyoHXEJ7/imxeIhWDD7nr1Z+Ib6NtNVV+u9MWlCR9lGtMIebURg5vdee28cPPsppvaqexL5f8k3E=
X-Received: by 2002:a37:9c88:: with SMTP id
 f130mr19471044qke.457.1561423388940; 
 Mon, 24 Jun 2019 17:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190624080001.67222-1-jitao.shi@mediatek.com>
 <20190624080001.67222-3-jitao.shi@mediatek.com>
In-Reply-To: <20190624080001.67222-3-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 25 Jun 2019 08:42:57 +0800
Message-ID: <CANMq1KDixwQN13o84Jp6E6tyfTQSZjiZSMzaNFZ02LEVPx0Z8g@mail.gmail.com>
Subject: Re: [v2 2/2] drm/panel: support for auo, kd101n80-45na wuxga dsi
 video mode panel
To: Jitao Shi <jitao.shi@mediatek.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=e2ogumH57Dk+mOO0y5/CmcdAve3k/tPr0Lofkj3W1yQ=;
 b=gn85bRpxX7rX0vPi2OF9kz6nsjSpDytW5uaW02EslXpNifmNJJW+bfXA/vNHvtnfyd
 LEbGvEe0UTmhomOdUgl3WLDYKeBbP9GS8Ul3o4lm0omA18ix5UVvi5y53tJ9mWlSYZ+O
 2tGmkRpE9D4p4h3dyylbbuMMhbJXozsVkMUW4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNDowMCBQTSBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRp
YXRlay5jb20+IHdyb3RlOgo+Cj4gQXVvLGtkMTAxbjgwLTQ1bmEncyBjb25uZWN0b3IgaXMgc2Ft
ZSBhcyBib2UsdHYxMDF3dW0tbmw2Lgo+IFRoZSBtb3N0IGNvZGVzIGNhbiBiZSByZXVzZS4KPiBT
byBhdW8sa2QxMDFuODAtNDVuYSBhbmQgYm9lLHR2MTAxd3VtLW5sNiB1c2Ugb25lIGRyaXZlciBm
aWxlLgo+IEFkZCB0aGUgZGlmZmVyZW50IHBhcnRzIGluIGRyaXZlciBkYXRhLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4v
Z3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMgICAgfCA0MCArKysrKysrKysr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKPiBpbmRleCA2ZTA2
Yzg1MDY2MjMuLmQxZWU0M2NmY2JlMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwo+IEBAIC0zNzIsNiArMzcyLDE1IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGFuZWxfaW5pdF9jbWQgYm9lX2luaXRfY21kW10gPSB7Cj4gICAgICAgICB7
fSwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2luaXRfY21kIGF1b19pbml0
X2NtZFtdID0gewo+ICsgICAgICAgX0lOSVRfREVMQVlfQ01EKDI0KSwKPiArICAgICAgIF9JTklU
X0RDU19DTUQoMHgxMSksCj4gKyAgICAgICBfSU5JVF9ERUxBWV9DTUQoMTIwKSwKPiArICAgICAg
IF9JTklUX0RDU19DTUQoMHgyOSksCj4gKyAgICAgICBfSU5JVF9ERUxBWV9DTUQoMTIwKSwKPiAr
ICAgICAgIHt9LAo+ICt9Owo+ICsKPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgYm9lX3BhbmVsICp0
b19ib2VfcGFuZWwoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCj4gIHsKPiAgICAgICAgIHJldHVy
biBjb250YWluZXJfb2YocGFuZWwsIHN0cnVjdCBib2VfcGFuZWwsIGJhc2UpOwo+IEBAIC01NzIs
NiArNTgxLDM0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBib2VfdHYxMDF3dW1f
bmw2X2Rlc2MgPSB7Cj4gICAgICAgICAuaW5pdF9jbWRzID0gYm9lX2luaXRfY21kLAo+ICB9Owo+
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fZGVmYXVsdF9tb2Rl
ID0gewo+ICsgICAgICAgLmNsb2NrID0gMTU3MDAwLAo+ICsgICAgICAgLmhkaXNwbGF5ID0gMTIw
MCwKPiArICAgICAgIC5oc3luY19zdGFydCA9IDEyMDAgKyA4MCwKPiArICAgICAgIC5oc3luY19l
bmQgPSAxMjAwICsgODAgKyAyNCwKPiArICAgICAgIC5odG90YWwgPSAxMjAwICsgODAgKyAyNCAr
IDM2LAo+ICsgICAgICAgLnZkaXNwbGF5ID0gMTkyMCwKPiArICAgICAgIC52c3luY19zdGFydCA9
IDE5MjAgKyAxNiwKPiArICAgICAgIC52c3luY19lbmQgPSAxOTIwICsgMTYgKyA0LAo+ICsgICAg
ICAgLnZ0b3RhbCA9IDE5MjAgKyAxNiArIDQgKyAxNiwKPiArICAgICAgIC52cmVmcmVzaCA9IDYw
LAo+ICsgICAgICAgLnR5cGUgPSBEUk1fTU9ERV9UWVBFX0RSSVZFUiB8IERSTV9NT0RFX1RZUEVf
UFJFRkVSUkVELAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1
b19rZDEwMW44MF80NW5hX2Rlc2MgPSB7Cj4gKyAgICAgICAubW9kZXMgPSAmYXVvX2RlZmF1bHRf
bW9kZSwKPiArICAgICAgIC5icGMgPSA4LAo+ICsgICAgICAgLnNpemUgPSB7Cj4gKyAgICAgICAg
ICAgICAgIC53aWR0aCA9IDIxNiwKPiArICAgICAgICAgICAgICAgLmhlaWdodCA9IDEzNSwKClNh
bWUgaXNzdWUgYXMgdGhlIEJPRSBwYW5lbDoKVGhpcyBpcyB3cm9uZywgYXMgdGhpcyBpcyBhIHBv
cnRyYWl0IHBhbmVsLCBzaG91bGQgYmU6IHdpZHRoPTEzNSwgaGVpZ2h0PTIxNi4KCj4gKyAgICAg
ICB9LAo+ICsgICAgICAgLmxhbmVzID0gNCwKPiArICAgICAgIC5mb3JtYXQgPSBNSVBJX0RTSV9G
TVRfUkdCODg4LAo+ICsgICAgICAgLm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9NT0RFX1ZJREVPIHwg
TUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFIHwKPiArICAgICAgICAgICAgICAgICAgICAg
TUlQSV9EU0lfTU9ERV9MUE0sCj4gKyAgICAgICAuaW5pdF9jbWRzID0gYXVvX2luaXRfY21kLAo+
ICt9Owo+ICsKPiAgc3RhdGljIGludCBib2VfcGFuZWxfZ2V0X21vZGVzKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgYm9lX3BhbmVsICpib2UgPSB0b19ib2Vf
cGFuZWwocGFuZWwpOwo+IEBAIC02OTUsNiArNzMyLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgYm9lX29mX21hdGNoW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0g
ImJvZSx0djEwMXd1bS1ubDYiLAo+ICAgICAgICAgICAuZGF0YSA9ICZib2VfdHYxMDF3dW1fbmw2
X2Rlc2MKPiAgICAgICAgIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImF1byxrZDEwMW44
MC00NW5hIiwKPiArICAgICAgICAgLmRhdGEgPSAmYXVvX2tkMTAxbjgwXzQ1bmFfZGVzYwo+ICsg
ICAgICAgfSwKPiAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfQo+ICB9Owo+ICBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBib2Vfb2ZfbWF0Y2gpOwo+IC0tCj4gMi4yMS4wCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
