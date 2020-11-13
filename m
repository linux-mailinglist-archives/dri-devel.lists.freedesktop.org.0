Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3882F2B3AEA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6889CE2;
	Mon, 16 Nov 2020 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF366E573
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 17:13:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y16so11597949ljk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 09:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uHdzUd8NUNc0lpDwmppHgQMHGeLwwBEPsQiuUdFVMn0=;
 b=Vf9aLrdMygr+pSOB4syQyMMFa9s3Y8gg9aPfdkjSqO0uUp6X42pZjw6A0oiO8Qo79g
 VMYB6KWyUWYTFP9RCfvpj6vzwpPwW2W6oCelyU8g7orM2z47YMOnDHg3C2g50zzfEusG
 nqvrEWPVjXN4vLqhpx0/KIK4pqj8V71LUjcbnFJPdOHtrUJArcFLXTfdV2HqqJ/fhuLd
 vr4HQXG4TCfqEDnWPBvTd1hixQrQx+II8BCVSHa4t4TrMZyTNIez047wBg702EUCXj6X
 1iA+hxDZ1SNCWmtV7FjSRYfemkBuFRiPD2NRufuDZeWZswgy5d+Dy8jmCiBsIO+6SJAx
 soQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uHdzUd8NUNc0lpDwmppHgQMHGeLwwBEPsQiuUdFVMn0=;
 b=V2hBWVyJEX2EvrKjGqITTjy+4FjHOnMENLP7ASX/o6iWwBJHVhU9Yw/BNeXj0q2Kqu
 74jOaRrcLLCsx14upFSgsO9lXLW/OPA8+WsEnZn3QXgHzLdUrMyz5o99+OUTpCZhvUvf
 f5x0aS6QUKwNr+8Rhhh9CFRsVN3yJx6v2IKckryA4lEJ169x+gvjC9pDT+wgOJ+m9XWE
 6A8Uqu6cIMhRRTutRpQV6pjjvJxN0NkidCPNTVurDfowh/etXhcLAKe2YzNrirjXEdUh
 ZM7447laeUb3cQRyAefQUC7W2hLWhKgr4f/SZx7VR6ahW3nibCCcBfA3eypa9fqXrpOG
 PS8g==
X-Gm-Message-State: AOAM533cpGKzYGETZspDoqxpIFzwtKrgcZoo54/+FzRP+uY6XdPQbZwe
 dUXa5aACyaKlzvTx0wyzHX0=
X-Google-Smtp-Source: ABdhPJyHpSg50GBIXMPXL7aP9qtANQ43u803+eBAONtCmTaJb6C6zR3PWcQF6qlWhad3UtWFiD81wQ==
X-Received: by 2002:a2e:3503:: with SMTP id z3mr1395526ljz.70.1605287631533;
 Fri, 13 Nov 2020 09:13:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id e10sm1617281lfn.115.2020.11.13.09.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 09:13:50 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>
References: <20201110203257.GC5957@sirena.org.uk>
 <72ae6462-13df-9fcb-510e-8e57eee0f035@gmail.com>
 <20201111115534.GA4847@sirena.org.uk>
 <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
 <20201112171600.GD4742@sirena.org.uk>
 <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
 <20201112200123.GF4742@sirena.org.uk>
 <ce9e2d9f-917e-fb8a-7323-f3bf1a367e9d@gmail.com>
 <20201113142937.GB4828@sirena.org.uk>
 <7f066805-97d9-088f-e89d-a554fe478574@gmail.com>
 <20201113161550.GC4828@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3beaa12b-4a50-a3b6-fc43-ebb5ce7a8db7@gmail.com>
Date: Fri, 13 Nov 2020 20:13:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113161550.GC4828@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMTEuMjAyMCAxOToxNSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIEZyaSwgTm92IDEz
LCAyMDIwIGF0IDA2OjU1OjI3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTMu
MTEuMjAyMCAxNzoyOSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IAo+Pj4gSXQncyBub3QgY2xl
YXIgaWYgaXQgbWF0dGVycyAtIGl0J3MgbW9yZSBhIHBvbGljeSBkZWNpc2lvbiBvbiB0aGUgcGFy
dAo+Pj4gb2YgdGhlIGRyaXZlciBhYm91dCB3aGF0IGl0IHRoaW5rcyBzYWZlIGVycm9yIGhhbmRs
aW5nIGlzLiAgSWYgaXQncyBub3QKPiAKPj4gSWYgcmVndWxhdG9yX2dldCgpIHJldHVybnMgYSBk
dW1teSByZWd1bGF0b3IsIHRoZW4gdGhpcyBtZWFucyB0aGF0Cj4+IHJlZ3VsYXRvciBpc24ndCBz
cGVjaWZpZWQgaW4gYSBkZXZpY2UtdHJlZS4gQnV0IHRoZW4gdGhlIG9ubHkgd2F5IGZvciBhCj4+
IGNvbnN1bWVyIGRyaXZlciB0byBjaGVjayB3aGV0aGVyIHJlZ3VsYXRvciBpcyBkdW1teSwgaXMg
dG8gY2hlY2sKPj4gcHJlc2VuY2Ugb2YgdGhlIHN1cHBseSBwcm9wZXJ0eSBpbiBhIGRldmljZS10
cmVlLgo+IAo+IE15IHBvaW50IGhlcmUgaXMgdGhhdCB0aGUgZHJpdmVyIHNob3VsZG4ndCBiZSBj
aGVja2luZyBmb3IgYSBkdW1teQo+IHJlZ3VsYXRvciwgdGhlIGRyaXZlciBzaG91bGQgYmUgY2hl
Y2tpbmcgdGhlIGZlYXR1cmVzIHRoYXQgYXJlIHByb3ZpZGVkCj4gdG8gaXQgYnkgdGhlIHJlZ3Vs
YXRvciBhbmQgaGFuZGxpbmcgdGhvc2UuCgpJIHVuZGVyc3RhbmQgeW91cnMgcG9pbnQsIGJ1dCB0
aGVuIHdlIG5lZWQgZHVtbXkgcmVndWxhdG9yIHRvIHByb3ZpZGUKYWxsIHRoZSBmZWF0dXJlcywg
YW5kIGN1cnJlbnRseSBpdCBkb2VzIHRoZSBvcHBvc2l0ZS4KCj4gSXQgZG9lc24ndCBtYXR0ZXIg
aWYgdGhpcyBpcwo+IGEgZHVtbXkgcmVndWxhdG9yIG9yIGFuIGFjdHVhbCByZWd1bGF0b3Igd2l0
aCBsaW1pdGVkIGZlYXR1cmVzLCB0aGUKPiBlZmZlY3QgaXMgdGhlIHNhbWUgYW5kIHRoZSBoYW5k
bGluZyBzaG91bGQgYmUgdGhlIHNhbWUuICBJZiB0aGUgZHJpdmVyCj4gaXMgZG9pbmcgYW55dGhp
bmcgdG8gaGFuZGxlIGR1bW15IHJlZ3VsYXRvcnMgZXhwbGljaXRseSBhcyBkdW1teQo+IHJlZ3Vs
YXRvcnMgaXQgaXMgZG9pbmcgaXQgd3JvbmcuCgpJdCBtYXR0ZXJzIGJlY2F1c2UgZHVtbXkgcmVn
dWxhdG9yIGVycm9ycyBvdXQgYWxsIGNoZWNrcyBhbmQgY2hhbmdlcwpvdGhlciB0aGFuIGVuYWJs
ZS9kaXNhYmxlLCBpbnN0ZWFkIG9mIGFjY2VwdGluZyB0aGVtLiBJZiB3ZSBjb3VsZCBhZGQgYW4K
b3B0aW9uIGZvciBkdW1teSByZWd1bGF0b3IgdG8gc3VjY2VlZCBhbGwgdGhlIGNoZWNrcyBhbmQg
YWNjZXB0IGFsbCB0aGUKdmFsdWVzLCB0aGVuIGl0IGNvdWxkIGJlY29tZSBtb3JlIHVzYWJsZS4K
Cj4+IFdlIHdhbnQgdG8gZW1pdCBlcnJvciBtZXNzYWdlcyB3aGVuIHNvbWV0aGluZyBnb2VzIHdy
b25nLCBmb3IgZXhhbXBsZQo+PiB3aGVuIHJlZ3VsYXRvciB2b2x0YWdlIGZhaWxzIHRvIGNoYW5n
ZS4gSXQncyBmaW5lIHRoYXQgdm9sdGFnZSBjaGFuZ2VzCj4+IGFyZSBmYWlsaW5nIGZvciBhIGR1
bW15IHJlZ3VsYXRvciwgYnV0IHRoZW4gY29uc3VtZXIgZHJpdmVyIHNob3VsZG4ndAo+PiByZWNv
Z25pemUgaXQgYXMgYSBlcnJvciBjb25kaXRpb24uCj4gCj4gSWYgeW91J3JlIGZpbmUgd2l0aCB0
aGF0IHlvdSBzaG91bGQgYWxzbyBiZSBmaW5lIHdpdGggYW55IG90aGVyCj4gcmVndWxhdG9yIGZv
ciB3aGljaCB5b3UgZmFpbGVkIHRvIGVudW1lcmF0ZSBhbnkgdm9sdGFnZXMgd2hpY2ggeW91IGNh
bgo+IHNldC4KCkl0J3Mgbm90IGZpbmUuCgpJbiB0aGUgY2FzZSBvZiB0aGlzIGRyaXZlciB0aGUg
ZHVtbXkgcmVndWxhdG9yIHNob3VsZCBzdWNjZWVkIGluc3RlYWQgb2YKZmFpbGluZy4KCj4+IFRo
ZSByZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgcHJvdmlkZXMgYSBtb3JlIGNvbnNpc3RlbnQgYW5k
Cj4+IHN0cmFpZ2h0Zm9yd2FyZCB3YXkgZm9yIGNvbnN1bWVyIGRyaXZlcnMgdG8gY2hlY2sgcHJl
c2VuY2Ugb2YgYSBwaHlzaWNhbAo+PiB2b2x0YWdlIHJlZ3VsYXRvciBpbiBjb21wYXJpc29uIHRv
IGRlYWxpbmcgd2l0aCBhIHJlZ3VsYXRvcl9nZXQoKS4gVGhlCj4+IGR1bW15IHJlZ3VsYXRvciBp
cyBuaWNlIHRvIHVzZSB3aGVuIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2hhbmdlCj4+IHJlZ3VsYXRv
cidzIHZvbHRhZ2UsIHdoaWNoIGRvZXNuJ3Qgd29yayBmb3IgYSBkdW1teSByZWd1bGF0b3IuCj4g
Cj4gVG8gcmVwZWF0IHlvdSBzaG91bGQgKm9ubHkqIGJlIHVzaW5nIHJlZ3VsYXRvcl9nZXRfb3B0
aW9uYWwoKSBpbiB0aGUKPiBjYXNlIHdoZXJlIHRoZSBzdXBwbHkgbWF5IGJlIHBoeXNpY2FsbHkg
YWJzZW50IHdoaWNoIGlzIG5vdCB0aGUgY2FzZQo+IGhlcmUuCj4gCgpBbHJpZ2h0LCBidXQgdGhl
biB3ZSBlaXRoZXIgbmVlZCB0byBpbXByb3ZlIHJlZ3VsYXRvciBjb3JlIHRvIG1ha2UgZHVtbXkK
cmVndWxhdG9yIGEgYml0IG1vcmUgdXNhYmxlLCBvciBjb250aW51ZSB0byB3b3JrIGFyb3VuZCBp
dCBpbiBkcml2ZXJzLgpXaGF0IHNob3VsZCB3ZSBkbz8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
