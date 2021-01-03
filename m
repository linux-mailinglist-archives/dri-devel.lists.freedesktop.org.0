Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A22E91D4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925B889B48;
	Mon,  4 Jan 2021 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9544893A2;
 Sun,  3 Jan 2021 14:30:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cw27so24573927edb.5;
 Sun, 03 Jan 2021 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ln5/xdl46vtSdR4LXWQxmJUctJoaIW0Vq5QIACIBVo8=;
 b=kdoa4Sb7Hz5+hZwblIxwT6C6Pq1vgI3o6uktF5AXHZ26IkY3BU1ImfkqxyQ3ENHKzy
 s1SH3WujeL0fmV+nJU6yXhf1Fh80v9g2dt5YH5rob5yuuB0av0BKDxMmQQbTCglr3doL
 2ZW+Q4L3LPjUDEiK8CtrITPdj471iGK8YyZwGSWXNqdIdd/9e8VvXTJOleT5BDhzYPEV
 4YipYrqA9MtVSS2XE9z2m8rcEO7yZsETlFrAbor5L6xb4U8UBCJLLTzN0LVOkxo+Jt92
 F8hZ8P+AqcQwlTjzerBzqzkj0Q0CbfYEswo6notB5Zp1CspCQlCgxyZSFrkxucLBl+iO
 kgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ln5/xdl46vtSdR4LXWQxmJUctJoaIW0Vq5QIACIBVo8=;
 b=guT4PwGB75PgXcyLAZCGJDjzsmAJe4I6fkDWCu1Q3aJOgPKLRFJ69AEAZnhdnq/Jki
 un8YmXtiA6csIxQ7WkfSrHl+uDuTziCIYqV2T0aX2qkSb0ulyxratlKxua/QptWcVhGo
 eT8CzQlaYKN3ZdbnirvJxlxCF0PByM0P6H7/WizYAykZzh+K157kyl6JZKunOCbecZPN
 DFm80czNATTz6a6Gb9bC3hHc9jUj6LoNQmbwc/AWXPjXb59smQNuNQALHKgDbXtmSX/0
 nMKl+s4UppnBnI54ZISNSrhCHqpbag7XOmxdWwdvP12Jnno3j/dLesaC+1BEFEYPOlDL
 Qe4g==
X-Gm-Message-State: AOAM5303ArPWFL9F7vqOjvtUlT2rIHILfLKtyrkimO2VgVfuqJv/PzrF
 atE/p28T6rCpmTfJavzE4Awo3JeewJw3cvJLS58=
X-Google-Smtp-Source: ABdhPJw6jFAYPdCFrr5nWTUKmXg/nfcOHtKrxXEa8lvDyRpKOkMbA+XxS4VTXL+asLwPwirAOww3tpZFDrLzQcZn+UQ=
X-Received: by 2002:aa7:c3c2:: with SMTP id l2mr65799064edr.15.1609684231486; 
 Sun, 03 Jan 2021 06:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <819f4eaf-18e4-678d-84dd-e4ac9d88c414@gmail.com>
In-Reply-To: <819f4eaf-18e4-678d-84dd-e4ac9d88c414@gmail.com>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Sun, 3 Jan 2021 22:30:08 +0800
Message-ID: <CAEExFWuLtNkHBHqUXwRiZzoX32VUdPO5=8snyHoFZGYEjvvhmg@mail.gmail.com>
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
To: Dmitry Osipenko <digetx@gmail.com>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 gustavoars@kernel.org, jirislaby@kernel.org, airlied@linux.ie,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, Nathan Chancellor <natechancellor@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, tongtiangen@huawei.com,
 groeck@chromium.org, marijn.suijten@somainline.org, steven.price@arm.com,
 mka@chromium.org, chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, harigovi@codeaurora.org,
 Adrian Hunter <adrian.hunter@intel.com>, Viresh Kumar <vireshk@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, dl-linux-imx <linux-imx@nxp.com>,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Douglas Anderson <dianders@chromium.org>, akashast@codeaurora.org,
 rnayak@codeaurora.org, parashar@codeaurora.org, tomeu.vizoso@collabora.com,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, agross@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 miaoqinglang@huawei.com, hoegsberg@google.com, yuq825@gmail.com,
 ddavenport@chromium.org, masneyb@onstation.org, shawnguo@kernel.org,
 georgi.djakov@linaro.org, lukasz.luba@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEksCgpPbiBTdW4sIEphbiAzLCAyMDIxIGF0IDg6NTIgUE0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPiB3cm90ZToKPgo+IDAxLjAxLjIwMjEgMTk6NTQsIFlhbmd0YW8gTGkg0L/Q
uNGI0LXRgjoKPiA+IEhpLAo+ID4KPiA+IFRoaXMgcGF0Y2hzZXQgYWRkIGRldm1fcG1fb3BwX3Nl
dF9jbGtuYW1lLCBkZXZtX3BtX29wcF9wdXRfY2xrbmFtZSwKPiA+IGRldm1fcG1fb3BwX3NldF9y
ZWd1bGF0b3JzLCBkZXZtX3BtX29wcF9wdXRfcmVndWxhdG9ycywKPiA+IGRldm1fcG1fb3BwX3Nl
dF9zdXBwb3J0ZWRfaHcsIGRldm1fcG1fb3BwX29mX2FkZF90YWJsZSBhbmQKPiA+IGRldm1fcG1f
b3BwX3JlZ2lzdGVyX25vdGlmaWVyLgo+ID4KPiA+IFlhbmd0YW8gTGkgKDMxKToKPiA+ICAgb3Bw
OiBBZGQgZGV2cmVzIHdyYXBwZXIgZm9yIGRldl9wbV9vcHBfc2V0X2Nsa25hbWUgYW5kCj4gPiAg
ICAgZGV2X3BtX29wcF9wdXRfY2xrbmFtZQo+ID4gICBvcHA6IEFkZCBkZXZyZXMgd3JhcHBlciBm
b3IgZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycyBhbmQKPiA+ICAgICBkZXZfcG1fb3BwX3B1dF9y
ZWd1bGF0b3JzCj4gPiAgIG9wcDogQWRkIGRldnJlcyB3cmFwcGVyIGZvciBkZXZfcG1fb3BwX3Nl
dF9zdXBwb3J0ZWRfaHcKPiA+ICAgb3BwOiBBZGQgZGV2cmVzIHdyYXBwZXIgZm9yIGRldl9wbV9v
cHBfb2ZfYWRkX3RhYmxlCj4gPiAgIG9wcDogQWRkIGRldnJlcyB3cmFwcGVyIGZvciBkZXZfcG1f
b3BwX3JlZ2lzdGVyX25vdGlmaWVyCj4gPiAgIHNlcmlhbDogcWNvbV9nZW5pX3NlcmlhbDogZml4
IHBvdGVudGlhbCBtZW0gbGVhayBpbgo+ID4gICAgIHFjb21fZ2VuaV9zZXJpYWxfcHJvYmUoKQo+
ID4gICBzZXJpYWw6IHFjb21fZ2VuaV9zZXJpYWw6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3Bw
XyogQVBJCj4gPiAgIHNwaTogc3BpLXFjb20tcXNwaTogZml4IHBvdGVudGlhbCBtZW0gbGVhayBp
biBzcGlfZ2VuaV9wcm9iZSgpCj4gPiAgIHNwaTogc3BpLXFjb20tcXNwaTogZml4IHBvdGVudGlh
bCBtZW0gbGVhayBpbiBzcGlfZ2VuaV9wcm9iZSgpCj4gPiAgIHFjb20tZ2VuaS1zZTogcmVtb3Zl
IG9wcF90YWJsZQo+ID4gICBtbWM6IHNkaGNpLW1zbTogZml4IHBvdGVudGlhbCBtZW0gbGVhayBp
biBzZGhjaV9tc21fcHJvYmUoKQo+ID4gICBtbWM6IHNkaGNpLW1zbTogY29udmVydCB0byB1c2Ug
ZGV2bV9wbV9vcHBfKiBBUEkKPiA+ICAgc3BpOiBzcGktcWNvbS1xc3BpOiBmaXggcG90ZW50aWFs
IG1lbSBsZWFrIGluIHFjb21fcXNwaV9wcm9iZSgpCj4gPiAgIHNwaTogc3BpLXFjb20tcXNwaTog
Y29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkKPiA+ICAgZHJtL21zbTogZml4IHBvdGVu
dGlhbCBtZW0gbGVhawo+ID4gICBkcm0vbXNtOiBjb252ZXJ0IHRvIHVzZSBkZXZtX3BtX29wcF8q
IEFQSSBhbmQgcmVtb3ZlIGRwX2N0cmxfcHV0Cj4gPiAgIGRybS9saW1hOiBjb252ZXJ0IHRvIHVz
ZSBkZXZtX3BtX29wcF8qIEFQSQo+ID4gICBkcm0vbGltYTogcmVtb3ZlIHVubmVlZGVkIGRldm1f
ZGV2ZnJlcV9yZW1vdmVfZGV2aWNlKCkKPiA+ICAgZHJtL3BhbmZyb3N0OiBjb252ZXJ0IHRvIHVz
ZSBkZXZtX3BtX29wcF8qIEFQSQo+ID4gICBtZWRpYTogdmVudXM6IGZpeCBlcnJvciBjaGVjayBp
biBjb3JlX2dldF92NCgpCj4gPiAgIG1lZGlhOiB2ZW51czogY29udmVydCB0byB1c2UgZGV2bV9w
bV9vcHBfKiBBUEkKPiA+ICAgbWVtb3J5OiBzYW1zdW5nOiBleHlub3M1NDIyLWRtYzogZml4IHJl
dHVybiBlcnJvciBpbgo+ID4gICAgIGV4eW5vczVfaW5pdF9mcmVxX3RhYmxlCj4gPiAgIG1lbW9y
eTogc2Ftc3VuZzogZXh5bm9zNTQyMi1kbWM6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyog
QVBJCj4gPiAgIG1lbW9yeTogdGVncmEyMDogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBB
UEkKPiA+ICAgbWVtb3J5OiB0ZWdyYTMwOiBjb252ZXJ0IHRvIHVzZSBkZXZtX3BtX29wcF8qIEFQ
SQo+ID4gICBQTSAvIGRldmZyZXE6IHRlZ3JhMzA6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3Bw
XyogQVBJCj4gPiAgIFBNIC8gZGV2ZnJlcTogcmszMzk5X2RtYzogY29udmVydCB0byB1c2UgZGV2
bV9wbV9vcHBfKiBBUEkKPiA+ICAgUE0gLyBkZXZmcmVxOiBpbXg4bS1kZHJjOiBjb252ZXJ0IHRv
IHVzZSBkZXZtX3BtX29wcF8qIEFQSQo+ID4gICBQTSAvIGRldmZyZXE6IGlteC1idXM6IGNvbnZl
cnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4gPiAgIFBNIC8gZGV2ZnJlcTogZXh5bm9zOiBj
b252ZXJ0IHRvIHVzZSBkZXZtX3BtX29wcF8qIEFQSQo+ID4gICBQTSAvIGRldmZyZXE6IGNvbnZl
cnQgdG8gZGV2bV9wbV9vcHBfcmVnaXN0ZXJfbm90aWZpZXIgYW5kIHJlbW92ZQo+ID4gICAgIHVu
dXNlZCBBUEkKPiA+Cj4gPiAgZHJpdmVycy9kZXZmcmVxL2RldmZyZXEuYyAgICAgICAgICAgICAg
ICAgICAgIHwgIDY2ICstLS0tLS0KPiA+ICBkcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jICAg
ICAgICAgICAgICAgICAgfCAgNDIgKy0tLS0KPiA+ICBkcml2ZXJzL2RldmZyZXEvaW14LWJ1cy5j
ICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKy0KPiA+ICBkcml2ZXJzL2RldmZyZXEvaW14OG0t
ZGRyYy5jICAgICAgICAgICAgICAgICAgfCAgMTUgKy0KPiA+ICBkcml2ZXJzL2RldmZyZXEvcmsz
Mzk5X2RtYy5jICAgICAgICAgICAgICAgICAgfCAgMjIgKy0tCj4gPiAgZHJpdmVycy9kZXZmcmVx
L3RlZ3JhMzAtZGV2ZnJlcS5jICAgICAgICAgICAgIHwgIDIxICstLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9saW1hL2xpbWFfZGV2ZnJlcS5jICAgICAgICAgICB8ICA0NSArLS0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2ZnJlcS5oICAgICAgICAgICB8ICAgMiAtCj4gPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyAgICAgICAgIHwgICAyICstCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyAgICAgICAgIHwgICAyICstCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jICAgICAgIHwgICAyICst
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jICAgICAgIHwgIDMx
ICsrLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmggICAgICAg
fCAgIDIgLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5jICAgICAgICAgICAg
ICB8ICAyOSArLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuaCAgICAgICAg
ICAgICAgfCAgIDEgLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jICAg
ICAgICAgICB8ICAgNSArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMg
ICAgICAgICAgICB8ICAyMyArKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5jICAgfCAgMzQgKy0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZmcmVxLmggICB8ICAgMSAtCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL3Fjb20v
dmVudXMvcG1faGVscGVycy5jICAgIHwgIDIyICstLQo+ID4gIGRyaXZlcnMvbWVtb3J5L3NhbXN1
bmcvZXh5bm9zNTQyMi1kbWMuYyAgICAgICB8ICAxMyArLQo+ID4gIGRyaXZlcnMvbWVtb3J5L3Rl
Z3JhL3RlZ3JhMjAtZW1jLmMgICAgICAgICAgICB8ICAyOSArLS0KPiA+ICBkcml2ZXJzL21lbW9y
eS90ZWdyYS90ZWdyYTMwLWVtYy5jICAgICAgICAgICAgfCAgMjkgKy0tCj4gPiAgZHJpdmVycy9t
bWMvaG9zdC9zZGhjaS1tc20uYyAgICAgICAgICAgICAgICAgIHwgIDI3ICsrLQo+ID4gIGRyaXZl
cnMvb3BwL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE3MyArKysrKysrKysr
KysrKysrKysKPiA+ICBkcml2ZXJzL29wcC9vZi5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMzYgKysrKwo+ID4gIGRyaXZlcnMvc3BpL3NwaS1nZW5pLXFjb20uYyAgICAgICAgICAg
ICAgICAgICB8ICAyMyArKy0KPiA+ICBkcml2ZXJzL3NwaS9zcGktcWNvbS1xc3BpLmMgICAgICAg
ICAgICAgICAgICAgfCAgMjUgKystCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL3Fjb21fZ2VuaV9z
ZXJpYWwuYyAgICAgICAgIHwgIDMxICsrLS0KPiA+ICBpbmNsdWRlL2xpbnV4L2RldmZyZXEuaCAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMjMgLS0tCj4gPiAgaW5jbHVkZS9saW51eC9wbV9vcHAu
aCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDM4ICsrKysKPiA+ICBpbmNsdWRlL2xpbnV4L3Fj
b20tZ2VuaS1zZS5oICAgICAgICAgICAgICAgICAgfCAgIDIgLQo+ID4gIDMyIGZpbGVzIGNoYW5n
ZWQsIDQwMiBpbnNlcnRpb25zKCspLCA0MjggZGVsZXRpb25zKC0pCj4gPgo+Cj4gSGVsbG8sCj4K
PiBDb3VsZCB5b3UgcGxlYXNlIGFkZCBoZWxwZXIgZm9yIGRldl9wbV9vcHBfYXR0YWNoX2dlbnBk
KCkgYW5kIG1ha2UKPiBjcHVmcmVxIGRyaXZlcnMgdG8gdXNlIHRoZSBoZWxwZXJzPwoKVGhhbmsg
eW91IGZvciByZW1pbmRpbmcgbWUuIEJ1dCB3ZSBzaG91bGRuJ3QgdXNlIHRoaXMgZm9yIENQVSBk
ZXZpY2VzCmFzIHRoZSBDUFUgZGV2aWNlIGRvZXNuJ3QgZ2V0IGJvdW5kIHRvIGEgZHJpdmVyLCBp
dCBpcyByYXRoZXIgYSBmYWtlIHBsYXRmb3JtCmRldmljZSB3aGljaCBnZXRzIHRoZSBjcHVmcmVx
IGRyaXZlcnMgcHJvYmVkLgoKPgo+IEknZCBhbHNvIGxpa2UgdG8gc2VlIGEgZGV2bSBoZWxwZXIg
Zm9yCj4gZGV2X3BtX29wcF9yZWdpc3Rlcl9zZXRfb3BwX2hlbHBlcigpLCB3aGljaCBzaG91bGQg
YmVjb21lIHVzZWZ1bCBmb3IKPiBUZWdyYSBkcml2ZXJzIHNvbWV0aW1lIHNvb24uCgpGb3Igbm9u
LWNwdSBkZXZpY2VzPwoKQlIgLyBZYW5ndGFvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
