Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DC2E91FF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8521289E32;
	Mon,  4 Jan 2021 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CBD8982A;
 Sun,  3 Jan 2021 14:54:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b26so58703862lff.9;
 Sun, 03 Jan 2021 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ye7D/hnHohKj9GZLla69A+dQLJx70g9063TQU2F31EQ=;
 b=iK7SW3DQ4woGH0r0YdkZYArDkTd7Dgo+fY+pSD1WAxGTb/ctaTuF9N//N06ci7GyrH
 YRW4NNm9t2SdeQwj9PbJtVEcdiHIHAAksx0rDAhQG/MXzC8GkMyfvmUD81hM7hMdf0rs
 q7kqt+pYr0uGdSn8gBuCIiZfKcjSTnnsPYGo9y80zXt3Te0uuR3v/lQ/luD0fDRtNKIH
 YcirTvnhc3ob0WLgwoZYMxL3VUSEaM+KyIft7dmOLvqnHgCzC2UNFMhlj4GyXddgBsle
 hYOR265lHTcKwXSg8oSiqofnJhcQxgPLq0NIQxXBzuU71FTlGSsQwDcKwsHAZ9VibIWU
 HBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ye7D/hnHohKj9GZLla69A+dQLJx70g9063TQU2F31EQ=;
 b=K8R1HkS5YLC5gXEuIY1S7qOuV1dgHPCszi0KWQ6tNLdbyEAeJ4JVYnZZj/bakalNEE
 i8SpvBb91mRAHRmNG9mv7VRiJ2CRpqpYJDsIEUkIl70q5R66/XSdi/JCKxPJ8Vz+1Mv0
 4jH1+yjBB1t23oq70yB1jqrPhhw3cBFstq20QsU7L5dr/VTTkuRZz1LfjtaBXjA/O46o
 tOKO9QKgCH35gQj4m+4IbO0IOiiRw9WxUf8vt19DWo+mVBOo00FiEJM9WxNC7osshEGe
 CnuC4+Q9WydBqFA83FjPcxvUk1V/7Mq2qJRe/D131+xpueMVyz4QQm00bd9CeiTJHmyH
 /ORg==
X-Gm-Message-State: AOAM530TYEUtoB2Cpd/N7unL3IpG8+ChNzGvJ3AzWeld4WLwifgA0ZRI
 9AlQvWRTuP7KmRFYh0k60T0=
X-Google-Smtp-Source: ABdhPJwQC08Q7sWad01WVanKcVv8Jzsz/53jbuQT+p7kkrtY0pBwR5YN3ixi8BkFbzajTP1lOJoq0A==
X-Received: by 2002:a05:651c:1129:: with SMTP id
 e9mr32718777ljo.135.1609685684178; 
 Sun, 03 Jan 2021 06:54:44 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id b11sm7033439lfi.174.2021.01.03.06.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 06:54:43 -0800 (PST)
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
To: Frank Lee <tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <819f4eaf-18e4-678d-84dd-e4ac9d88c414@gmail.com>
 <CAEExFWuLtNkHBHqUXwRiZzoX32VUdPO5=8snyHoFZGYEjvvhmg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0505ed5c-4ee9-9fc6-2358-bf964cc87c4e@gmail.com>
Date: Sun, 3 Jan 2021 17:54:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAEExFWuLtNkHBHqUXwRiZzoX32VUdPO5=8snyHoFZGYEjvvhmg@mail.gmail.com>
Content-Language: en-US
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

MDMuMDEuMjAyMSAxNzozMCwgRnJhbmsgTGVlINC/0LjRiNC10YI6Cj4gSEksCj4gCj4gT24gU3Vu
LCBKYW4gMywgMjAyMSBhdCA4OjUyIFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IDAxLjAxLjIwMjEgMTk6NTQsIFlhbmd0YW8gTGkg0L/QuNGI0LXRgjoK
Pj4+IEhpLAo+Pj4KPj4+IFRoaXMgcGF0Y2hzZXQgYWRkIGRldm1fcG1fb3BwX3NldF9jbGtuYW1l
LCBkZXZtX3BtX29wcF9wdXRfY2xrbmFtZSwKPj4+IGRldm1fcG1fb3BwX3NldF9yZWd1bGF0b3Jz
LCBkZXZtX3BtX29wcF9wdXRfcmVndWxhdG9ycywKPj4+IGRldm1fcG1fb3BwX3NldF9zdXBwb3J0
ZWRfaHcsIGRldm1fcG1fb3BwX29mX2FkZF90YWJsZSBhbmQKPj4+IGRldm1fcG1fb3BwX3JlZ2lz
dGVyX25vdGlmaWVyLgo+Pj4KPj4+IFlhbmd0YW8gTGkgKDMxKToKPj4+ICAgb3BwOiBBZGQgZGV2
cmVzIHdyYXBwZXIgZm9yIGRldl9wbV9vcHBfc2V0X2Nsa25hbWUgYW5kCj4+PiAgICAgZGV2X3Bt
X29wcF9wdXRfY2xrbmFtZQo+Pj4gICBvcHA6IEFkZCBkZXZyZXMgd3JhcHBlciBmb3IgZGV2X3Bt
X29wcF9zZXRfcmVndWxhdG9ycyBhbmQKPj4+ICAgICBkZXZfcG1fb3BwX3B1dF9yZWd1bGF0b3Jz
Cj4+PiAgIG9wcDogQWRkIGRldnJlcyB3cmFwcGVyIGZvciBkZXZfcG1fb3BwX3NldF9zdXBwb3J0
ZWRfaHcKPj4+ICAgb3BwOiBBZGQgZGV2cmVzIHdyYXBwZXIgZm9yIGRldl9wbV9vcHBfb2ZfYWRk
X3RhYmxlCj4+PiAgIG9wcDogQWRkIGRldnJlcyB3cmFwcGVyIGZvciBkZXZfcG1fb3BwX3JlZ2lz
dGVyX25vdGlmaWVyCj4+PiAgIHNlcmlhbDogcWNvbV9nZW5pX3NlcmlhbDogZml4IHBvdGVudGlh
bCBtZW0gbGVhayBpbgo+Pj4gICAgIHFjb21fZ2VuaV9zZXJpYWxfcHJvYmUoKQo+Pj4gICBzZXJp
YWw6IHFjb21fZ2VuaV9zZXJpYWw6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4+
PiAgIHNwaTogc3BpLXFjb20tcXNwaTogZml4IHBvdGVudGlhbCBtZW0gbGVhayBpbiBzcGlfZ2Vu
aV9wcm9iZSgpCj4+PiAgIHNwaTogc3BpLXFjb20tcXNwaTogZml4IHBvdGVudGlhbCBtZW0gbGVh
ayBpbiBzcGlfZ2VuaV9wcm9iZSgpCj4+PiAgIHFjb20tZ2VuaS1zZTogcmVtb3ZlIG9wcF90YWJs
ZQo+Pj4gICBtbWM6IHNkaGNpLW1zbTogZml4IHBvdGVudGlhbCBtZW0gbGVhayBpbiBzZGhjaV9t
c21fcHJvYmUoKQo+Pj4gICBtbWM6IHNkaGNpLW1zbTogY29udmVydCB0byB1c2UgZGV2bV9wbV9v
cHBfKiBBUEkKPj4+ICAgc3BpOiBzcGktcWNvbS1xc3BpOiBmaXggcG90ZW50aWFsIG1lbSBsZWFr
IGluIHFjb21fcXNwaV9wcm9iZSgpCj4+PiAgIHNwaTogc3BpLXFjb20tcXNwaTogY29udmVydCB0
byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkKPj4+ICAgZHJtL21zbTogZml4IHBvdGVudGlhbCBtZW0g
bGVhawo+Pj4gICBkcm0vbXNtOiBjb252ZXJ0IHRvIHVzZSBkZXZtX3BtX29wcF8qIEFQSSBhbmQg
cmVtb3ZlIGRwX2N0cmxfcHV0Cj4+PiAgIGRybS9saW1hOiBjb252ZXJ0IHRvIHVzZSBkZXZtX3Bt
X29wcF8qIEFQSQo+Pj4gICBkcm0vbGltYTogcmVtb3ZlIHVubmVlZGVkIGRldm1fZGV2ZnJlcV9y
ZW1vdmVfZGV2aWNlKCkKPj4+ICAgZHJtL3BhbmZyb3N0OiBjb252ZXJ0IHRvIHVzZSBkZXZtX3Bt
X29wcF8qIEFQSQo+Pj4gICBtZWRpYTogdmVudXM6IGZpeCBlcnJvciBjaGVjayBpbiBjb3JlX2dl
dF92NCgpCj4+PiAgIG1lZGlhOiB2ZW51czogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBB
UEkKPj4+ICAgbWVtb3J5OiBzYW1zdW5nOiBleHlub3M1NDIyLWRtYzogZml4IHJldHVybiBlcnJv
ciBpbgo+Pj4gICAgIGV4eW5vczVfaW5pdF9mcmVxX3RhYmxlCj4+PiAgIG1lbW9yeTogc2Ftc3Vu
ZzogZXh5bm9zNTQyMi1kbWM6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4+PiAg
IG1lbW9yeTogdGVncmEyMDogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkKPj4+ICAg
bWVtb3J5OiB0ZWdyYTMwOiBjb252ZXJ0IHRvIHVzZSBkZXZtX3BtX29wcF8qIEFQSQo+Pj4gICBQ
TSAvIGRldmZyZXE6IHRlZ3JhMzA6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4+
PiAgIFBNIC8gZGV2ZnJlcTogcmszMzk5X2RtYzogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBf
KiBBUEkKPj4+ICAgUE0gLyBkZXZmcmVxOiBpbXg4bS1kZHJjOiBjb252ZXJ0IHRvIHVzZSBkZXZt
X3BtX29wcF8qIEFQSQo+Pj4gICBQTSAvIGRldmZyZXE6IGlteC1idXM6IGNvbnZlcnQgdG8gdXNl
IGRldm1fcG1fb3BwXyogQVBJCj4+PiAgIFBNIC8gZGV2ZnJlcTogZXh5bm9zOiBjb252ZXJ0IHRv
IHVzZSBkZXZtX3BtX29wcF8qIEFQSQo+Pj4gICBQTSAvIGRldmZyZXE6IGNvbnZlcnQgdG8gZGV2
bV9wbV9vcHBfcmVnaXN0ZXJfbm90aWZpZXIgYW5kIHJlbW92ZQo+Pj4gICAgIHVudXNlZCBBUEkK
Pj4+Cj4+PiAgZHJpdmVycy9kZXZmcmVxL2RldmZyZXEuYyAgICAgICAgICAgICAgICAgICAgIHwg
IDY2ICstLS0tLS0KPj4+ICBkcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jICAgICAgICAgICAg
ICAgICAgfCAgNDIgKy0tLS0KPj4+ICBkcml2ZXJzL2RldmZyZXEvaW14LWJ1cy5jICAgICAgICAg
ICAgICAgICAgICAgfCAgMTQgKy0KPj4+ICBkcml2ZXJzL2RldmZyZXEvaW14OG0tZGRyYy5jICAg
ICAgICAgICAgICAgICAgfCAgMTUgKy0KPj4+ICBkcml2ZXJzL2RldmZyZXEvcmszMzk5X2RtYy5j
ICAgICAgICAgICAgICAgICAgfCAgMjIgKy0tCj4+PiAgZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAt
ZGV2ZnJlcS5jICAgICAgICAgICAgIHwgIDIxICstLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfZGV2ZnJlcS5jICAgICAgICAgICB8ICA0NSArLS0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfZGV2ZnJlcS5oICAgICAgICAgICB8ICAgMiAtCj4+PiAgZHJpdmVycy9ncHUv
ZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyAgICAgICAgIHwgICAyICstCj4+PiAgZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyAgICAgICAgIHwgICAyICstCj4+PiAgZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jICAgICAgIHwgICAyICstCj4+PiAgZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jICAgICAgIHwgIDMxICsrLS0KPj4+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmggICAgICAgfCAgIDIgLQo+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5jICAgICAgICAgICAgICB8ICAyOSAr
LS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuaCAgICAgICAgICAgICAgfCAg
IDEgLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jICAgICAgICAgICB8
ICAgNSArLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgICAgICAgICAg
ICB8ICAyMyArKy0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jICAgfCAgMzQgKy0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZmcmVxLmggICB8ICAgMSAtCj4+PiAgLi4uL21lZGlhL3BsYXRmb3JtL3Fjb20vdmVudXMvcG1f
aGVscGVycy5jICAgIHwgIDIyICstLQo+Pj4gIGRyaXZlcnMvbWVtb3J5L3NhbXN1bmcvZXh5bm9z
NTQyMi1kbWMuYyAgICAgICB8ICAxMyArLQo+Pj4gIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3Jh
MjAtZW1jLmMgICAgICAgICAgICB8ICAyOSArLS0KPj4+ICBkcml2ZXJzL21lbW9yeS90ZWdyYS90
ZWdyYTMwLWVtYy5jICAgICAgICAgICAgfCAgMjkgKy0tCj4+PiAgZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1tc20uYyAgICAgICAgICAgICAgICAgIHwgIDI3ICsrLQo+Pj4gIGRyaXZlcnMvb3BwL2Nv
cmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE3MyArKysrKysrKysrKysrKysrKysK
Pj4+ICBkcml2ZXJzL29wcC9vZi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzYg
KysrKwo+Pj4gIGRyaXZlcnMvc3BpL3NwaS1nZW5pLXFjb20uYyAgICAgICAgICAgICAgICAgICB8
ICAyMyArKy0KPj4+ICBkcml2ZXJzL3NwaS9zcGktcWNvbS1xc3BpLmMgICAgICAgICAgICAgICAg
ICAgfCAgMjUgKystCj4+PiAgZHJpdmVycy90dHkvc2VyaWFsL3Fjb21fZ2VuaV9zZXJpYWwuYyAg
ICAgICAgIHwgIDMxICsrLS0KPj4+ICBpbmNsdWRlL2xpbnV4L2RldmZyZXEuaCAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMjMgLS0tCj4+PiAgaW5jbHVkZS9saW51eC9wbV9vcHAuaCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDM4ICsrKysKPj4+ICBpbmNsdWRlL2xpbnV4L3Fjb20tZ2VuaS1z
ZS5oICAgICAgICAgICAgICAgICAgfCAgIDIgLQo+Pj4gIDMyIGZpbGVzIGNoYW5nZWQsIDQwMiBp
bnNlcnRpb25zKCspLCA0MjggZGVsZXRpb25zKC0pCj4+Pgo+Pgo+PiBIZWxsbywKPj4KPj4gQ291
bGQgeW91IHBsZWFzZSBhZGQgaGVscGVyIGZvciBkZXZfcG1fb3BwX2F0dGFjaF9nZW5wZCgpIGFu
ZCBtYWtlCj4+IGNwdWZyZXEgZHJpdmVycyB0byB1c2UgdGhlIGhlbHBlcnM/Cj4gCj4gVGhhbmsg
eW91IGZvciByZW1pbmRpbmcgbWUuIEJ1dCB3ZSBzaG91bGRuJ3QgdXNlIHRoaXMgZm9yIENQVSBk
ZXZpY2VzCj4gYXMgdGhlIENQVSBkZXZpY2UgZG9lc24ndCBnZXQgYm91bmQgdG8gYSBkcml2ZXIs
IGl0IGlzIHJhdGhlciBhIGZha2UgcGxhdGZvcm0KPiBkZXZpY2Ugd2hpY2ggZ2V0cyB0aGUgY3B1
ZnJlcSBkcml2ZXJzIHByb2JlZC4KCkluZGVlZCwgdGhlIENQVSBkZXZpY2UgZXhpc3RzIHNlcHJh
dGVseSBmcm9tIGNwdWZyZXEgZHJpdmVyLgoKPj4gSSdkIGFsc28gbGlrZSB0byBzZWUgYSBkZXZt
IGhlbHBlciBmb3IKPj4gZGV2X3BtX29wcF9yZWdpc3Rlcl9zZXRfb3BwX2hlbHBlcigpLCB3aGlj
aCBzaG91bGQgYmVjb21lIHVzZWZ1bCBmb3IKPj4gVGVncmEgZHJpdmVycyBzb21ldGltZSBzb29u
Lgo+IAo+IEZvciBub24tY3B1IGRldmljZXM/CgpGb3IgRFJNIGRyaXZlciBJJ2Qgd2FudCB0byB1
c2UgZGV2bSBmb3IgYm90aCBzZXRfb3BwX2hlbHBlcigpIGFuZApvcHBfYXR0YWNoX2dlbnBkKCku
CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtdGVncmEvcGF0Y2gv
MjAyMDEyMTcxODA2MzguMjI3NDgtMzktZGlnZXR4QGdtYWlsLmNvbS8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
