Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784D29CEBE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407E46EC57;
	Wed, 28 Oct 2020 08:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18676E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:37:31 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l2so4110535lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7rp8OgTEAWtuKJtMNiLhS1/R8myCG5UhnRurxGX0itc=;
 b=pEIfSei7bmZJp5rQNKjGJ1YAY4mj3MLEzP+ie3m0TBYOMLJH4G156rMIn85hVZgEC1
 azFPSR5gMLIbusPBB46uAK6oGubJ+1BkF77NXjCWGLnWAkNoBt02Urav3PHU/+4KC4Eb
 RnFp8H2pMwIzgCZYTHrP7GCG38Zc3IcYNEioxWgveaZAkVvFlJ5FapUc8FwkCMm/CKmK
 DHObifrr0wVW9tWM2qhI31qxKy3JhBeXM4lxJ7uTP6oz2+cQSJojV8p/CJTvl55n2yEA
 VeUheDR5E3sWn9aD/Tg5eEUkYSq/CeJ5tgW4k9h/t74Ag3xpXjjNcHkbray3nX03mPt0
 1umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7rp8OgTEAWtuKJtMNiLhS1/R8myCG5UhnRurxGX0itc=;
 b=LGMWIiV4TFEVnjal7iTXTPX/573+rL2CifcmHFsiNmzu/4A77+YfYNQ4cevyuUyjsO
 htByN0ksH5HURDvzkoDvpvurZR6+vAYjMy3cNBxvlaDQxVnhthNPxTf8fRvYM+yDJhxX
 YGAuKDDIuVZguYPJntcFDHohpZAaFYUprAx0q/qMmWvmKWUUvRVT/hfZdzCLNvWogQJ9
 ltHTJKwX8X1aSCwG1ds51RVjQJiWTzegoMKEGMaczEUibEgeX6fK4jFIS1XwzkG/QEvo
 FrCvOhR6xe7QoVsefHg8Yd3SyvlthwIBvpp4VCMsheb7iO2fJdCKIn0uN0cs50kkrkt6
 w2zA==
X-Gm-Message-State: AOAM530v9ZY8JbNIDIuRYdKeQw/vu6lxRtmo+TzNo1GZOqvs3LrcTJ2F
 XiV5CyV6e3tK+EOaZbsPkpg=
X-Google-Smtp-Source: ABdhPJym33W/chgtCjkXL4iuOZZNtixcgyiRRX4KlkNwIlFRpM3sMfAYENyAfUzTcy1uJQku22By8A==
X-Received: by 2002:ac2:5207:: with SMTP id a7mr1416790lfl.56.1603831050126;
 Tue, 27 Oct 2020 13:37:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id l20sm162128lfc.274.2020.10.27.13.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:37:29 -0700 (PDT)
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com> <20201027085417.GD4244@kozik-lap>
 <54191034-dcb9-7cab-333b-5bb2553f0ed1@gmail.com>
 <20201027193039.GA140636@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <90df8e53-6dec-f75f-5f82-539cb0f72583@gmail.com>
Date: Tue, 27 Oct 2020 23:37:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027193039.GA140636@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAyMjozMCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFR1
ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjE3OjE5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gMjcuMTAuMjAyMCAxMTo1NCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+
Pj4gT24gTW9uLCBPY3QgMjYsIDIwMjAgYXQgMDE6MTY6NDdBTSArMDMwMCwgRG1pdHJ5IE9zaXBl
bmtvIHdyb3RlOgo+Pj4+IFRlZ3JhMjAgRXh0ZXJuYWwgTWVtb3J5IENvbnRyb2xsZXIgdGFsa3Mg
dG8gRFJBTSBjaGlwcyBhbmQgaXQgbmVlZHMgdG8gYmUKPj4+PiByZXByb2dyYW1tZWQgd2hlbiBt
ZW1vcnkgZnJlcXVlbmN5IGNoYW5nZXMuIFRlZ3JhIE1lbW9yeSBDb250cm9sbGVyIHNpdHMKPj4+
PiBiZWhpbmQgRU1DIGFuZCB0aGVzZSBjb250cm9sbGVycyBhcmUgdGlnaHRseSBjb3VwbGVkLiBU
aGlzIHBhdGNoIGFkZHMgdGhlCj4+Pj4gbmV3IHBoYW5kbGUgcHJvcGVydHkgd2hpY2ggYWxsb3dz
IHRvIHByb3Blcmx5IGV4cHJlc3MgY29ubmVjdGlvbiBvZiBFTUMKPj4+PiBhbmQgTUMgaGFyZHdh
cmUgaW4gYSBkZXZpY2UtdHJlZSwgaXQgYWxzbyBwdXQgdGhlIFRlZ3JhMjAgRU1DIGJpbmRpbmcg
b24KPj4+PiBwYXIgd2l0aCBUZWdyYTMwKyBFTUMgYmluZGluZ3MsIHdoaWNoIGlzIGhhbmR5IHRv
IGhhdmUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMv
bnZpZGlhLHRlZ3JhMjAtZW1jLnR4dCAgICAgICAgICB8IDIgKysKPj4+PiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtZW1j
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxl
cnMvbnZpZGlhLHRlZ3JhMjAtZW1jLnR4dAo+Pj4+IGluZGV4IDU2N2NmZmQzN2YzZi4uMWIwZDQ0
MTdhYWQ4IDEwMDY0NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtZW1jLnR4dAo+Pj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlh
LHRlZ3JhMjAtZW1jLnR4dAo+Pj4+IEBAIC0xMiw2ICsxMiw3IEBAIFByb3BlcnRpZXM6Cj4+Pj4g
ICAgaXJyZXNwZWN0aXZlIG9mIHJhbS1jb2RlIGNvbmZpZ3VyYXRpb24uCj4+Pj4gIC0gaW50ZXJy
dXB0cyA6IFNob3VsZCBjb250YWluIEVNQyBHZW5lcmFsIGludGVycnVwdC4KPj4+PiAgLSBjbG9j
a3MgOiBTaG91bGQgY29udGFpbiBFTUMgY2xvY2suCj4+Pj4gKy0gbnZpZGlhLG1lbW9yeS1jb250
cm9sbGVyIDogUGhhbmRsZSBvZiB0aGUgTWVtb3J5IENvbnRyb2xsZXIgbm9kZS4KPj4+Cj4+PiBJ
dCBsb29rcyBsaWtlIHlvdSBhZGRpbmcgYSByZXF1aXJlZCBwcm9wZXJ0eSB3aGljaCBpcyBhbiBB
QkkgYnJlYWsuCj4+IFRoZSBUMjAgRU1DIGRyaXZlciBpcyB1bnVzZWQgc28gZmFyIGluIHVwc3Ry
ZWFtIGFuZCBpdCB3aWxsIGJlY29tZSB1c2VkCj4+IG9ubHkgb25jZSB0aGlzIHNlcmllcyBpcyBh
cHBsaWVkLiBIZW5jZSBpdCdzIGZpbmUgdG8gY2hhbmdlIHRoZSBBQkkuCj4gCj4gVGhlIEFCSSBp
cyBub3QgYWJvdXQgdXBzdHJlYW0sIGJ1dCBkb3duc3RyZWFtLiBUaGVyZSBhcmUgbm8gb3RoZXIK
PiB1cHN0cmVhbXMgdXNpbmcgdGhpcyBBQkkuIFVubGVzcyB5b3UgaGF2ZSBpbiBtaW5kIHRoYXQg
ZXhpc3RpbmcgVDIwIEVNQwo+IGRyaXZlciB3YXMgYSBub29wLCBkb2luZyBhYnNvbHV0ZWx5IG5v
dGhpbmcsIHRoZXJlZm9yZSB0aGVyZSBpcyBubwo+IGJyZWFrYWdlIG9mIGFueSBvdGhlciB1c2Vy
cz8KClRoZSBUMjAgRU1DIGRyaXZlciB3YXMgYSAxMDAlIG5vb3AgZm9yIG5vdy4gSXQncyBzYWZl
IHRvIGNoYW5nZSB0aGUgQUJJLgoKVGhlIFQzMC8xMjQgRU1DIGRyaXZlcnMgaGF2ZSB1c2Vycywg
YnV0IHRoZXNlIGFyZSB1bnNhZmUgZHJpdmVycyAod2l0aAp0aGUga25vd24gaXNzdWVzKSB1bnRp
bCB0aGlzIHNlcmllcyBpcyBhcHBsaWVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
