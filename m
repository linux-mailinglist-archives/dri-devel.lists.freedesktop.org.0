Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522352E91F1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863A389D73;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4445789622;
 Sun,  3 Jan 2021 12:52:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h205so58263785lfd.5;
 Sun, 03 Jan 2021 04:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fk3XVwTVefOkLbjfXssBtwAHpD8Tcrjmd5/AelczwWk=;
 b=OEwi935j2c7KzefgNI021QgzicjnnEwbFY0PXx/zRGw9iI/W1MDCJ33nGdFVdpmgK6
 RIgzZmniThNKQQabZIGWFU35FpubtXtN1R5LazrU8yKIIFEOMvqtTZZ5S+ZI5PwASUDh
 TxHNixDO7dAndqM40/SeY3e6JavgLO8CB6IJk5nojllWAWb2ldsg7Qly/g8+ynFW8oPL
 cgNdsvF1E/S8ZWp6UVfr4ESinENcARg/2ifmbIPl9lUD5TbUttr2X8f7TQ9nNIigPWTg
 IihawwezkYm0eV/L9yiGEhYwV/JPSY1nrPQG12uGVCCkWe86XrpZBpVdlnOYyDyypc5T
 yDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fk3XVwTVefOkLbjfXssBtwAHpD8Tcrjmd5/AelczwWk=;
 b=HI+soGlJGFauKCN+MDH+0pbdXKXLaH1GTzUULEfADNRdLfWAcO8mB2VeW3gEs6ZU41
 HOVs9YeUbGTV77UdcVHRs8vqedF8GRmfGCzUh0mNHWwSXTxB6VtqrIqpBKkxeEFj52N7
 e/DwCc44MsdLi+f3ZqrpHvSL8nvS/em1rjovsOqwPaTtM2tmh9KJq2c8IUN12k7HVpzY
 wjr8Wt2FXY0qXwXDy5vHR8pCPSV7UgfOWIb7v1MPAqcpaopwJ3WJ7e9zDTLTWzZB4c9d
 37APgcIJxWPclWknac7rEXh252zbu+8bE8ty05DtH20f6zj4m/GXkTEuCfo8qYHFEGPI
 11AQ==
X-Gm-Message-State: AOAM530c0s0uuDGB5NurVoOHTA16Q6eUlgEauraU7fn/uT//rtE+LmBx
 YjSRzwoXaisWxAJR4CVKCZs=
X-Google-Smtp-Source: ABdhPJyPgqSAU0iBjgqgqRPmpr/i7kF7QwsvsLVJIEREfmn2IS2TU8rSoup8JfPW09bcJNWdHG7m2A==
X-Received: by 2002:a05:6512:612:: with SMTP id
 b18mr32820924lfe.598.1609678355624; 
 Sun, 03 Jan 2021 04:52:35 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id b26sm8429011ljk.132.2021.01.03.04.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 04:52:34 -0800 (PST)
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
To: Yangtao Li <tiny.windzz@gmail.com>, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, krzk@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
 lukasz.luba@arm.com, adrian.hunter@intel.com, ulf.hansson@linaro.org,
 vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, ddavenport@chromium.org,
 jsanka@codeaurora.org, rnayak@codeaurora.org, tongtiangen@huawei.com,
 miaoqinglang@huawei.com, khsieh@codeaurora.org, abhinavk@codeaurora.org,
 chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
 mka@chromium.org, harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
 natechancellor@gmail.com, georgi.djakov@linaro.org, akashast@codeaurora.org,
 parashar@codeaurora.org, dianders@chromium.org
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <819f4eaf-18e4-678d-84dd-e4ac9d88c414@gmail.com>
Date: Sun, 3 Jan 2021 15:52:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDEuMjAyMSAxOTo1NCwgWWFuZ3RhbyBMaSDQv9C40YjQtdGCOgo+IEhpLAo+IAo+IFRoaXMg
cGF0Y2hzZXQgYWRkIGRldm1fcG1fb3BwX3NldF9jbGtuYW1lLCBkZXZtX3BtX29wcF9wdXRfY2xr
bmFtZSwKPiBkZXZtX3BtX29wcF9zZXRfcmVndWxhdG9ycywgZGV2bV9wbV9vcHBfcHV0X3JlZ3Vs
YXRvcnMsCj4gZGV2bV9wbV9vcHBfc2V0X3N1cHBvcnRlZF9odywgZGV2bV9wbV9vcHBfb2ZfYWRk
X3RhYmxlIGFuZAo+IGRldm1fcG1fb3BwX3JlZ2lzdGVyX25vdGlmaWVyLgo+IAo+IFlhbmd0YW8g
TGkgKDMxKToKPiAgIG9wcDogQWRkIGRldnJlcyB3cmFwcGVyIGZvciBkZXZfcG1fb3BwX3NldF9j
bGtuYW1lIGFuZAo+ICAgICBkZXZfcG1fb3BwX3B1dF9jbGtuYW1lCj4gICBvcHA6IEFkZCBkZXZy
ZXMgd3JhcHBlciBmb3IgZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycyBhbmQKPiAgICAgZGV2X3Bt
X29wcF9wdXRfcmVndWxhdG9ycwo+ICAgb3BwOiBBZGQgZGV2cmVzIHdyYXBwZXIgZm9yIGRldl9w
bV9vcHBfc2V0X3N1cHBvcnRlZF9odwo+ICAgb3BwOiBBZGQgZGV2cmVzIHdyYXBwZXIgZm9yIGRl
dl9wbV9vcHBfb2ZfYWRkX3RhYmxlCj4gICBvcHA6IEFkZCBkZXZyZXMgd3JhcHBlciBmb3IgZGV2
X3BtX29wcF9yZWdpc3Rlcl9ub3RpZmllcgo+ICAgc2VyaWFsOiBxY29tX2dlbmlfc2VyaWFsOiBm
aXggcG90ZW50aWFsIG1lbSBsZWFrIGluCj4gICAgIHFjb21fZ2VuaV9zZXJpYWxfcHJvYmUoKQo+
ICAgc2VyaWFsOiBxY29tX2dlbmlfc2VyaWFsOiBjb252ZXJ0IHRvIHVzZSBkZXZtX3BtX29wcF8q
IEFQSQo+ICAgc3BpOiBzcGktcWNvbS1xc3BpOiBmaXggcG90ZW50aWFsIG1lbSBsZWFrIGluIHNw
aV9nZW5pX3Byb2JlKCkKPiAgIHNwaTogc3BpLXFjb20tcXNwaTogZml4IHBvdGVudGlhbCBtZW0g
bGVhayBpbiBzcGlfZ2VuaV9wcm9iZSgpCj4gICBxY29tLWdlbmktc2U6IHJlbW92ZSBvcHBfdGFi
bGUKPiAgIG1tYzogc2RoY2ktbXNtOiBmaXggcG90ZW50aWFsIG1lbSBsZWFrIGluIHNkaGNpX21z
bV9wcm9iZSgpCj4gICBtbWM6IHNkaGNpLW1zbTogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBf
KiBBUEkKPiAgIHNwaTogc3BpLXFjb20tcXNwaTogZml4IHBvdGVudGlhbCBtZW0gbGVhayBpbiBx
Y29tX3FzcGlfcHJvYmUoKQo+ICAgc3BpOiBzcGktcWNvbS1xc3BpOiBjb252ZXJ0IHRvIHVzZSBk
ZXZtX3BtX29wcF8qIEFQSQo+ICAgZHJtL21zbTogZml4IHBvdGVudGlhbCBtZW0gbGVhawo+ICAg
ZHJtL21zbTogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkgYW5kIHJlbW92ZSBkcF9j
dHJsX3B1dAo+ICAgZHJtL2xpbWE6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4g
ICBkcm0vbGltYTogcmVtb3ZlIHVubmVlZGVkIGRldm1fZGV2ZnJlcV9yZW1vdmVfZGV2aWNlKCkK
PiAgIGRybS9wYW5mcm9zdDogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkKPiAgIG1l
ZGlhOiB2ZW51czogZml4IGVycm9yIGNoZWNrIGluIGNvcmVfZ2V0X3Y0KCkKPiAgIG1lZGlhOiB2
ZW51czogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkKPiAgIG1lbW9yeTogc2Ftc3Vu
ZzogZXh5bm9zNTQyMi1kbWM6IGZpeCByZXR1cm4gZXJyb3IgaW4KPiAgICAgZXh5bm9zNV9pbml0
X2ZyZXFfdGFibGUKPiAgIG1lbW9yeTogc2Ftc3VuZzogZXh5bm9zNTQyMi1kbWM6IGNvbnZlcnQg
dG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4gICBtZW1vcnk6IHRlZ3JhMjA6IGNvbnZlcnQgdG8g
dXNlIGRldm1fcG1fb3BwXyogQVBJCj4gICBtZW1vcnk6IHRlZ3JhMzA6IGNvbnZlcnQgdG8gdXNl
IGRldm1fcG1fb3BwXyogQVBJCj4gICBQTSAvIGRldmZyZXE6IHRlZ3JhMzA6IGNvbnZlcnQgdG8g
dXNlIGRldm1fcG1fb3BwXyogQVBJCj4gICBQTSAvIGRldmZyZXE6IHJrMzM5OV9kbWM6IGNvbnZl
cnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4gICBQTSAvIGRldmZyZXE6IGlteDhtLWRkcmM6
IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4gICBQTSAvIGRldmZyZXE6IGlteC1i
dXM6IGNvbnZlcnQgdG8gdXNlIGRldm1fcG1fb3BwXyogQVBJCj4gICBQTSAvIGRldmZyZXE6IGV4
eW5vczogY29udmVydCB0byB1c2UgZGV2bV9wbV9vcHBfKiBBUEkKPiAgIFBNIC8gZGV2ZnJlcTog
Y29udmVydCB0byBkZXZtX3BtX29wcF9yZWdpc3Rlcl9ub3RpZmllciBhbmQgcmVtb3ZlCj4gICAg
IHVudXNlZCBBUEkKPiAKPiAgZHJpdmVycy9kZXZmcmVxL2RldmZyZXEuYyAgICAgICAgICAgICAg
ICAgICAgIHwgIDY2ICstLS0tLS0KPiAgZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYyAgICAg
ICAgICAgICAgICAgIHwgIDQyICstLS0tCj4gIGRyaXZlcnMvZGV2ZnJlcS9pbXgtYnVzLmMgICAg
ICAgICAgICAgICAgICAgICB8ICAxNCArLQo+ICBkcml2ZXJzL2RldmZyZXEvaW14OG0tZGRyYy5j
ICAgICAgICAgICAgICAgICAgfCAgMTUgKy0KPiAgZHJpdmVycy9kZXZmcmVxL3JrMzM5OV9kbWMu
YyAgICAgICAgICAgICAgICAgIHwgIDIyICstLQo+ICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1k
ZXZmcmVxLmMgICAgICAgICAgICAgfCAgMjEgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xp
bWFfZGV2ZnJlcS5jICAgICAgICAgICB8ICA0NSArLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX2RldmZyZXEuaCAgICAgICAgICAgfCAgIDIgLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNXh4X2dwdS5jICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9nbXUuYyAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2FkcmVub19ncHUuYyAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgICAgICAgfCAgMzEgKystLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmggICAgICAgfCAgIDIgLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2RwL2RwX2N0cmwuYyAgICAgICAgICAgICAgfCAgMjkgKy0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tc20vZHAvZHBfY3RybC5oICAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1
L2RybS9tc20vZHAvZHBfZGlzcGxheS5jICAgICAgICAgICB8ICAgNSArLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jICAgICAgICAgICAgfCAgMjMgKystCj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgICB8ICAzNCArLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggICB8ICAgMSAtCj4gIC4uLi9t
ZWRpYS9wbGF0Zm9ybS9xY29tL3ZlbnVzL3BtX2hlbHBlcnMuYyAgICB8ICAyMiArLS0KPiAgZHJp
dmVycy9tZW1vcnkvc2Ftc3VuZy9leHlub3M1NDIyLWRtYy5jICAgICAgIHwgIDEzICstCj4gIGRy
aXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMjAtZW1jLmMgICAgICAgICAgICB8ICAyOSArLS0KPiAg
ZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC1lbWMuYyAgICAgICAgICAgIHwgIDI5ICstLQo+
ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jICAgICAgICAgICAgICAgICAgfCAgMjcgKyst
Cj4gIGRyaXZlcnMvb3BwL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE3MyAr
KysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9vcHAvb2YuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDM2ICsrKysKPiAgZHJpdmVycy9zcGkvc3BpLWdlbmktcWNvbS5jICAgICAg
ICAgICAgICAgICAgIHwgIDIzICsrLQo+ICBkcml2ZXJzL3NwaS9zcGktcWNvbS1xc3BpLmMgICAg
ICAgICAgICAgICAgICAgfCAgMjUgKystCj4gIGRyaXZlcnMvdHR5L3NlcmlhbC9xY29tX2dlbmlf
c2VyaWFsLmMgICAgICAgICB8ICAzMSArKy0tCj4gIGluY2x1ZGUvbGludXgvZGV2ZnJlcS5oICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyMyAtLS0KPiAgaW5jbHVkZS9saW51eC9wbV9vcHAuaCAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDM4ICsrKysKPiAgaW5jbHVkZS9saW51eC9xY29tLWdl
bmktc2UuaCAgICAgICAgICAgICAgICAgIHwgICAyIC0KPiAgMzIgZmlsZXMgY2hhbmdlZCwgNDAy
IGluc2VydGlvbnMoKyksIDQyOCBkZWxldGlvbnMoLSkKPiAKCkhlbGxvLAoKQ291bGQgeW91IHBs
ZWFzZSBhZGQgaGVscGVyIGZvciBkZXZfcG1fb3BwX2F0dGFjaF9nZW5wZCgpIGFuZCBtYWtlCmNw
dWZyZXEgZHJpdmVycyB0byB1c2UgdGhlIGhlbHBlcnM/CgpJJ2QgYWxzbyBsaWtlIHRvIHNlZSBh
IGRldm0gaGVscGVyIGZvcgpkZXZfcG1fb3BwX3JlZ2lzdGVyX3NldF9vcHBfaGVscGVyKCksIHdo
aWNoIHNob3VsZCBiZWNvbWUgdXNlZnVsIGZvcgpUZWdyYSBkcml2ZXJzIHNvbWV0aW1lIHNvb24u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
