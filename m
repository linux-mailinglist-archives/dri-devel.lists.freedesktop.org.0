Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE8F2B3B1A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF4E6E9ED;
	Mon, 16 Nov 2020 01:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32486E536
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:55:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so14529045lfc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4/bF4c42U9QIMTb1QGxEpNjGgqxOXHed/9Sju++TrnQ=;
 b=EmXWyr9gx7KS0zwcEBEAYUaxurDUV3ESqpMaCg9JaE9hKPHdsMyptRiU0PhucAJg57
 sWNit+5QfNq8tNVIqx46BqCocNtjeJXbt4jKtikifYsjkdUQbLjXrnxr9qkxjgZRyZHq
 TXlCW0/ciAaZVvMnyVhuZxC2ijNcNkBjiAcv9bDzbBMXnusu37wDsDL7NY0jYqQtA3vp
 PIgR17yr3IOJzvWiye1+iRzAfcIGWQeDEi+egnXgCSnrSt/IzJcPeOgFOq4e5cJTdOLu
 hhiAHxxwDWXN0pyDhoMxZJHVC4zrdnmiTI5ssYzWwy6ojWuvzKDNpVu8jf2LV7apAlp+
 bE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4/bF4c42U9QIMTb1QGxEpNjGgqxOXHed/9Sju++TrnQ=;
 b=nNguPPLR2akslQjythvCjJTSMuzzPLfqhehGe8xpIHW96eh+nUKayqGAlMpFBmU2+J
 4/BG4sxHezKXmsiOXpB19t9TkxHcTFW5jseSaSYTy6C42ScsgXUPUs8ELSbpOMEFH9Sv
 ch/2Dv//c/vY4J23PSxC6SpLrYqnPG+ht3a97/Dv60/P98vCm5qIbyJ5gww9z/fcxVt0
 BvxKvFwuKTLCdniGnyo0+W47PWCN5wZmqPY9W7QLBpDM48ZMEXDor9SBQEdx4BaQoLWW
 xfuGOoIXJ7AUgrEmbRIk/GVHktQw8tA2t6CsW299B/UD4hKWwsDPb+EGrd+nhKI7ndfJ
 +Qwg==
X-Gm-Message-State: AOAM531fFqT21wUg2Lr7TJvjhrey0pVkXEGWrxrLOqFW+iFks/PlCvyO
 NyfKQAb1Iky0PgHv7E+RiTQ=
X-Google-Smtp-Source: ABdhPJw1/12loswbdkPkD8Zhl2Yvb+Tjd/1tqW0mRR71ohF0rznxZ7TNEV0H6NcysfGbIqHPuGQf6Q==
X-Received: by 2002:ac2:5503:: with SMTP id j3mr1281724lfk.94.1605282930190;
 Fri, 13 Nov 2020 07:55:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id v12sm1474128lji.3.2020.11.13.07.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:55:29 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>
References: <20201104234427.26477-12-digetx@gmail.com>
 <20201110202945.GF2375022@ulmo> <20201110203257.GC5957@sirena.org.uk>
 <72ae6462-13df-9fcb-510e-8e57eee0f035@gmail.com>
 <20201111115534.GA4847@sirena.org.uk>
 <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
 <20201112171600.GD4742@sirena.org.uk>
 <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
 <20201112200123.GF4742@sirena.org.uk>
 <ce9e2d9f-917e-fb8a-7323-f3bf1a367e9d@gmail.com>
 <20201113142937.GB4828@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7f066805-97d9-088f-e89d-a554fe478574@gmail.com>
Date: Fri, 13 Nov 2020 18:55:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113142937.GB4828@sirena.org.uk>
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

MTMuMTEuMjAyMCAxNzoyOSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIEZyaSwgTm92IDEz
LCAyMDIwIGF0IDAxOjM3OjAxQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTIu
MTEuMjAyMCAyMzowMSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+Pj4+IEJ1dCBpdCdzIG5vdCBh
bGxvd2VkIHRvIGNoYW5nZSB2b2x0YWdlIG9mIGEgZHVtbXkgcmVndWxhdG9yLCBpcyBpdAo+Pj4+
IGludGVudGlvbmFsPwo+IAo+Pj4gT2YgY291cnNlIG5vdCwgd2UgY2FuJ3Qga25vdyBpZiB0aGUg
cmVxdWVzdGVkIG5ldyB2b2x0YWdlIGlzIHZhbGlkIC0gdGhlCj4+PiBkcml2ZXIgd291bGQgaGF2
ZSB0byBoYXZlIGV4cGxpY3Qgc3VwcG9ydCBmb3IgaGFuZGxpbmcgc2l0dWF0aW9ucyB3aGVyZQo+
Pj4gaXQncyBub3QgcG9zc2libGUgdG8gY2hhbmdlIHRoZSB2b2x0YWdlICh3aGljaCBpdCBjYW4g
ZGV0ZWN0IHRocm91Z2gKPj4+IGVudW1lcmF0aW5nIHRoZSB2YWx1ZXMgaXQgd2FudHMgdG8gc2V0
IGF0IHN0YXJ0dXApLgo+IAo+Pj4gW1JlcXVlc3RpbmcgdGhlIHNhbWUgc3VwcGx5IG11bHRpcGxl
IHRpbWVzXQo+IAo+PiBCdXQgaG93IGRyaXZlciBpcyBzdXBwb3NlZCB0byByZWNvZ25pemUgdGhh
dCBpdCdzIGEgZHVtbXkgb3IgYnVnZ3kKPj4gcmVndWxhdG9yIGlmIGl0IHJlamVjdHMgYWxsIHZv
bHRhZ2VzPwo+IAo+IEl0J3Mgbm90IGNsZWFyIGlmIGl0IG1hdHRlcnMgLSBpdCdzIG1vcmUgYSBw
b2xpY3kgZGVjaXNpb24gb24gdGhlIHBhcnQKPiBvZiB0aGUgZHJpdmVyIGFib3V0IHdoYXQgaXQg
dGhpbmtzIHNhZmUgZXJyb3IgaGFuZGxpbmcgaXMuICBJZiBpdCdzIG5vdAo+IHBvc3NpYmxlIHRv
IHJlYWQgdm9sdGFnZXMgZnJvbSB0aGUgcmVndWxhdG9yIHRoZSBjb25zdW1lciBkcml2ZXIgaGFz
IHRvCj4gZGVjaWRlIHdoYXQgaXQgdGhpbmtzIGl0J3Mgc2FmZSBmb3IgaXQgdG8gZG8sIGVpdGhl
ciB3YXkgaXQgaGFzIG5vIGlkZWEKPiB3aGF0IHRoZSBhY3R1YWwgY3VycmVudCB2b2x0YWdlIGlz
LiAgSXQgY291bGQgYXNzdW1lIHRoYXQgaXQncyBzb21ldGhpbmcKPiB0aGF0IHN1cHBvcnRzIGFs
bCB0aGUgdXNlIGNhc2VzIGl0IHdhbnRzIHRvIHVzZSBhbmQganVzdCBjYXJyeSBvbiB3aXRoCj4g
bm8gY29uZmlndXJhdGlvbiBvZiB2b2x0YWdlcywgaXQgY291bGQgZGVjaWRlIHRoYXQgaXQgbWln
aHQgbm90IHN1cHBvcnQKPiBldmVyeXRoaW5nIGFuZCBub3QgbWFrZSBhbnkgY2hhbmdlcyB0byBi
ZSBzYWZlLCBvciBkbyBzb21ldGhpbmcgbGlrZQo+IHRyeSB0byBmaWd1cmUgb3V0IHRoYXQgaWYg
d2UncmUgY3VycmVudGx5IGF0IGEgZ2l2ZW4gT1BQIHRoYXQncyB0aGUgdG9wCj4gT1BQIHBvc3Np
YmxlLiAgSGlzdG9yaWNhbGx5IHdoZW4gd2UndmUgbm90IGhhZCByZWd1bGF0b3IgY29udHJvbCBp
bgo+IHRoZXNlIGRyaXZlcnMgc28gdGhleSBoYXZlIGVmZmVjdGl2ZWx5IGdvbmUgd2l0aCB0aGUg
Zmlyc3Qgb3B0aW9uIG9mCj4ganVzdCBhc3N1bWluZyBpdCdzIGEgZ2VuZXJhbGx5IHNhZmUgdmFs
dWUsIHRoaXMgb2Z0ZW4gYWxpZ25zIHdpdGggd2hhdAo+IHRoZSBwb3dlciBvbiByZXF1aXJlbWVu
dHMgZm9yIFNvQ3MgYXJlIHNvIGl0J3Mgbm90IHVucmVhc29uYWJsZS4KCkkgZG9uJ3QgdGhpbmsg
dGhhdCBpbiBhIGNhc2Ugb2YgdGhpcyBwYXJ0aWN1bGFyIGRyaXZlciB0aGVyZSBpcyBhIHdheSB0
bwptYWtlIGFueSBkZWNpc2lvbnMgb3RoZXIgdGhhbiB0byBhc3N1bWUgdGhhdCBhbGwgY2hhbmdl
cyBhcmUgc2FmZSB0byBiZQpkb25lIGlmIHJlZ3VsYXRvciBpc24ndCBzcGVjaWZpZWQgaW4gYSBk
ZXZpY2UtdHJlZS4KCklmIHJlZ3VsYXRvcl9nZXQoKSByZXR1cm5zIGEgZHVtbXkgcmVndWxhdG9y
LCB0aGVuIHRoaXMgbWVhbnMgdGhhdApyZWd1bGF0b3IgaXNuJ3Qgc3BlY2lmaWVkIGluIGEgZGV2
aWNlLXRyZWUuIEJ1dCB0aGVuIHRoZSBvbmx5IHdheSBmb3IgYQpjb25zdW1lciBkcml2ZXIgdG8g
Y2hlY2sgd2hldGhlciByZWd1bGF0b3IgaXMgZHVtbXksIGlzIHRvIGNoZWNrCnByZXNlbmNlIG9m
IHRoZSBzdXBwbHkgcHJvcGVydHkgaW4gYSBkZXZpY2UtdHJlZS4KCldlIHdhbnQgdG8gZW1pdCBl
cnJvciBtZXNzYWdlcyB3aGVuIHNvbWV0aGluZyBnb2VzIHdyb25nLCBmb3IgZXhhbXBsZQp3aGVu
IHJlZ3VsYXRvciB2b2x0YWdlIGZhaWxzIHRvIGNoYW5nZS4gSXQncyBmaW5lIHRoYXQgdm9sdGFn
ZSBjaGFuZ2VzCmFyZSBmYWlsaW5nIGZvciBhIGR1bW15IHJlZ3VsYXRvciwgYnV0IHRoZW4gY29u
c3VtZXIgZHJpdmVyIHNob3VsZG4ndApyZWNvZ25pemUgaXQgYXMgYSBlcnJvciBjb25kaXRpb24u
CgpUaGUgcmVndWxhdG9yX2dldF9vcHRpb25hbCgpIHByb3ZpZGVzIGEgbW9yZSBjb25zaXN0ZW50
IGFuZApzdHJhaWdodGZvcndhcmQgd2F5IGZvciBjb25zdW1lciBkcml2ZXJzIHRvIGNoZWNrIHBy
ZXNlbmNlIG9mIGEgcGh5c2ljYWwKdm9sdGFnZSByZWd1bGF0b3IgaW4gY29tcGFyaXNvbiB0byBk
ZWFsaW5nIHdpdGggYSByZWd1bGF0b3JfZ2V0KCkuIFRoZQpkdW1teSByZWd1bGF0b3IgaXMgbmlj
ZSB0byB1c2Ugd2hlbiB0aGVyZSBpcyBubyBuZWVkIHRvIGNoYW5nZQpyZWd1bGF0b3IncyB2b2x0
YWdlLCB3aGljaCBkb2Vzbid0IHdvcmsgZm9yIGEgZHVtbXkgcmVndWxhdG9yLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
