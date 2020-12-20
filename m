Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE12DFA4D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 10:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA166E483;
	Mon, 21 Dec 2020 09:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E753889138
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:26:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b26so8871860lff.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 10:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dw4JPrP6acwrpZwuGGjt1P7HcEJMDGmCI8V3sWOk5Ic=;
 b=pT37pEqHrqcxmnPSmwxH9RNswp5aGcnhhkvGsin7xICzjgnixZn8OtcU68Lc88mq2F
 QeSH7/ZwBsEUnvTjmYhOv2U7rOCzN/Fwt5knsfkhL1k890q8dzOIpL+9Nub4xIEnFWiC
 I9BU8ipqTFV9wGpnkw3XaXsz9NPpZsKtXRALa5OlSF3SDGThfy0moA2TdgyGl0Q2nICC
 3592J56MExRzHJj3nzxSfQpzZ/eAcS7Tl2sO8BPDjAKnjOdLolp4Zdztugw7fu3gDLg1
 CNXQg+VpYtC8uFh8FVWXpKwvLIWY8ovV2QX09I5bwKez+3EBnhQsJkL28KhPfz9FOJY7
 l5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dw4JPrP6acwrpZwuGGjt1P7HcEJMDGmCI8V3sWOk5Ic=;
 b=OxHZcGE4GIR9tHahq4NMDcxKYuX0DVkpBX2VQm+kvK2kD0Euymt/Unfqhx6oST93C4
 53gL5baUz3jkZhlJVHRMZigyvdpNg/YZ5P0+a0ZoZCHCxsRO/HBIYzd3HqWvVe1pluE9
 10Xk2IKQjbbovy4HjRJcRomf2PwFbUENY1VAr5ymmCBjR/zm+2AZCtKsI4xFHmzGooqv
 DsPDTRCo3kPyip/aFtiWSCSYuO2ujyCcNT/X9UBCtrgujurnjpO3xuF2O0XQxJ8fXweJ
 KXshxKxoic1aQwDaMk/ao8LxyaeB/boBnhSp8KIFDbCvyYdO4BP/APw1DPToB3V5X+8k
 ft4g==
X-Gm-Message-State: AOAM533PuECWaCLjEw+xDbrJ/gu39rbZvhfnrW9OzrpXIz1Xd/BeLrJx
 0s1nUb++0jF6xc3PZFO0KuM=
X-Google-Smtp-Source: ABdhPJwCPdrUxXmxfP01OJOvkTo9IkzknyisoOQ+UqFGkH2TZMJbXVFVbNUMFJk8uto6KAnZIThVbg==
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr5133297lfn.545.1608488792261; 
 Sun, 20 Dec 2020 10:26:32 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id p13sm1877788ljc.112.2020.12.20.10.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 10:26:31 -0800 (PST)
Subject: Re: [PATCH v2 07/48] dt-bindings: arm: tegra: Add binding for core
 power domain
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-8-digetx@gmail.com> <20201219105720.GA5323@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cba644de-97fc-7249-31b5-d23e7e40634d@gmail.com>
Date: Sun, 20 Dec 2020 21:26:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201219105720.GA5323@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 21 Dec 2020 09:36:18 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTIuMjAyMCAxMzo1NywgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFRo
dSwgRGVjIDE3LCAyMDIwIGF0IDA5OjA1OjU3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gQWxsIE5WSURJQSBUZWdyYSBTb0NzIGhhdmUgYSBjb3JlIHBvd2VyIGRvbWFpbiB3aGVy
ZSBtYWpvcml0eSBvZiBoYXJkd2FyZQo+PiBibG9ja3MgcmVzaWRlLiBBZGQgYmluZGluZyBmb3Ig
dGhlIGNvcmUgcG93ZXIgZG9tYWluLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgLi4uL2FybS90ZWdyYS9udmlkaWEsdGVn
cmEyMC1jb3JlLWRvbWFpbi55YW1sIHwgNDggKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxl
IGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3RlZ3JhL252aWRpYSx0ZWdyYTIwLWNvcmUt
ZG9tYWluLnlhbWwKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vdGVncmEvbnZpZGlhLHRlZ3JhMjAtY29yZS1kb21haW4ueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vdGVncmEvbnZpZGlhLHRlZ3JhMjAtY29y
ZS1kb21haW4ueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAw
MDAuLmYzZDhmZDJkODM3MQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vdGVncmEvbnZpZGlhLHRlZ3JhMjAtY29yZS1kb21haW4u
eWFtbAo+PiBAQCAtMCwwICsxLDQ4IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hcm0vdGVncmEvbnZpZGlhLHRlZ3JhMjAt
Y29yZS1kb21haW4ueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogTlZJRElBIFRlZ3JhIENvcmUgUG93
ZXIgRG9tYWluCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIERtaXRyeSBPc2lwZW5rbyA8
ZGlnZXR4QGdtYWlsLmNvbT4KPj4gKyAgLSBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4KPj4gKyAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+PiAr
Cj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGVudW06Cj4+ICsgICAg
ICAtIG52aWRpYSx0ZWdyYTIwLWNvcmUtZG9tYWluCj4+ICsgICAgICAtIG52aWRpYSx0ZWdyYTMw
LWNvcmUtZG9tYWluCj4gCj4gVGhlIGZpbGUgc2hvdWxkIGJlIGluIGJpbmRpbmdzL3Bvd2VyLgo+
IEluY2x1ZGUgYWxzbyB0aGUgcG93ZXItZG9tYWluLnlhbWwgc2NoZW1hLgo+IAo+PiArCj4+ICsg
IG9wZXJhdGluZy1wb2ludHMtdjI6Cj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBTaG91
bGQgY29udGFpbiBsZXZlbCwgdm9sdGFnZXMgYW5kIG9wcC1zdXBwb3J0ZWQtaHcgcHJvcGVydHku
Cj4+ICsgICAgICBUaGUgc3VwcG9ydGVkLWh3IGlzIGEgYml0ZmllbGQgaW5kaWNhdGluZyBTb0Mg
c3BlZWRvIG9yIHByb2Nlc3MKPj4gKyAgICAgIElEIG1hc2suCj4+ICsKPj4gKyAgIiNwb3dlci1k
b21haW4tY2VsbHMiOgo+PiArICAgIGNvbnN0OiAwCj4+ICsKPj4gKyAgcG93ZXItc3VwcGx5Ogo+
PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgUGhhbmRsZSB0byB2b2x0YWdlIHJlZ3VsYXRv
ciBjb25uZWN0ZWQgdG8gdGhlIFNvQyBDb3JlIHBvd2VyIHJhaWwuCj4+ICsKPj4gK3JlcXVpcmVk
Ogo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSBvcGVyYXRpbmctcG9pbnRzLXYyCj4+ICsgIC0g
IiNwb3dlci1kb21haW4tY2VsbHMiCj4+ICsgIC0gcG93ZXItc3VwcGx5Cj4+ICsKPj4gK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiArCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsg
ICAgY29yZS1kb21haW4gewo+IAo+IHBvd2VyLWRvbWFpbiAodG8gZm9sbG93IHNjaGVtYSBhbmQg
ZGV2aWNldHJlZSBzcGVjKQoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgSSdsbCB1cGRhdGUg
aXQgaW4gdjMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
