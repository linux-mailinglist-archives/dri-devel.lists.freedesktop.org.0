Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9862B3AFC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0814889DB9;
	Mon, 16 Nov 2020 01:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929FA6E51C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 16:01:05 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f11so14552205lfs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 08:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hoBSr1hUr4Yp5kI+akqrOIxu0KqM4JsPnQSdm0rncXc=;
 b=Iqp7Q1Dqs7vv9QGINYyhZh6TR5wRoaUPd3RhKQWt0ku9yoFH50o9ftnXu8wZQLQjBN
 MupgjrQGeT789VP/M8QE1sy/ylWbvDZw1mirTsfOtgX9YCxwPLfZgeXNtkbfSicj3mjc
 lYhS7NJIWNgah5tKE+4q1Lc+J820S2ov1Vc3fzrgEtmx/YUNRnT8msOz5Id3R/AqGPXm
 ALQOgA0+xXEcZ8b1ExsRmkNEI2LBybyGzkH45EMmQ5Xw3OATNYPWjByAhArGQ8x53eXj
 qh2pqZYGCT33Ofuz8gQztaUtn1VBKB4rqScC1JLZCISwSwTHqgo8wHhMc9SL7g4O5vKv
 Kpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hoBSr1hUr4Yp5kI+akqrOIxu0KqM4JsPnQSdm0rncXc=;
 b=ruLSp9lVU4AURUalvUBf6Xd76WWon9+FJDGfmsT0A2wwlxVJ09rOi2qkaOcoqjAuZI
 weHqyGXRMQPVmsR7aONxZHdHzeXIIhlRWhkvC2Iw5UUtQQv6vYSy87GuVI1smBMmnLSO
 NBfBmuZ46IOCDXYUK+bgblR0kLtwt0zuUh2ZbqMWfCt19VXrmiD9YCssbvOeddqHqTwk
 7nCbxvzajDqMXlXxSC8BZCcF8Hdgu+eFmQkne2OrFawmEvd1hTvEoqPydf53h+Y05ZM9
 BMCLcQgYw/lhMoBua07DLpOSrcdY9YfZS9HbvCFdaB08SrmuX1kAKV0JKPl4lzOLn0w/
 AEUw==
X-Gm-Message-State: AOAM532ztDXDUDfhE3UJ+z3LEVCYupw8KShOQgXUfb+vmEY7U4vUFxjs
 oK/pA22sWVhd5Au63R08hfI=
X-Google-Smtp-Source: ABdhPJxFVXaegDtK2tbA+H+UL7oS/td2SYsq+RSjYI0ie8ZOQU72DsoUiPJfNs83bgfYy1Sdm28Jlw==
X-Received: by 2002:a19:6b07:: with SMTP id d7mr1163717lfa.509.1605283259019; 
 Fri, 13 Nov 2020 08:00:59 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id o17sm1503541lfg.136.2020.11.13.08.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 08:00:58 -0800 (PST)
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <CAPDyKFqUMsH9dCZ=OYqfdLt==+-8NjK9n=S5jGGNXZu6Y9q=2w@mail.gmail.com>
 <1f7e90c4-6134-2e2b-4869-5afbda18ead3@gmail.com>
 <20201112204358.GA1027187@ulmo>
 <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
 <CAPDyKFomk7mw7-wpZFPOfT27CEXuCbzRiBoicH5-k7QF_pphVw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1f644c22-991c-7d27-b147-f12489e7ed7d@gmail.com>
Date: Fri, 13 Nov 2020 19:00:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAPDyKFomk7mw7-wpZFPOfT27CEXuCbzRiBoicH5-k7QF_pphVw@mail.gmail.com>
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
Cc: Peter Chen <Peter.Chen@nxp.com>, DTML <devicetree@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMTEuMjAyMCAxNzo0NSwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiBPbiBUaHUsIDEyIE5v
diAyMDIwIGF0IDIzOjE0LCBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pgo+PiAxMi4xMS4yMDIwIDIzOjQzLCBUaGllcnJ5IFJlZGluZyDQv9C40YjQtdGCOgo+Pj4+
IFRoZSBkaWZmZXJlbmNlIGluIGNvbXBhcmlzb24gdG8gdXNpbmcgdm9sdGFnZSByZWd1bGF0b3Ig
ZGlyZWN0bHkgaXMKPj4+PiBtaW5pbWFsLCBiYXNpY2FsbHkgdGhlIGNvcmUtc3VwcGx5IHBoYW5k
bGUgaXMgcmVwbGFjZWQgaXMgcmVwbGFjZWQgd2l0aAo+Pj4+IGEgcG93ZXItZG9tYWluIHBoYW5k
bGUgaW4gYSBkZXZpY2UgdHJlZS4KPj4+IFRoZXNlIG5ldyBwb3dlci1kb21haW4gaGFuZGxlcyB3
b3VsZCBoYXZlIHRvIGJlIGFkZGVkIHRvIGRldmljZXMgdGhhdAo+Pj4gcG90ZW50aWFsbHkgYWxy
ZWFkeSBoYXZlIGEgcG93ZXItZG9tYWluIGhhbmRsZSwgcmlnaHQ/IElzbid0IHRoYXQgZ29pbmcK
Pj4+IHRvIGNhdXNlIGlzc3Vlcz8gSSB2YWd1ZWx5IHJlY2FsbCB0aGF0IHdlIGFscmVhZHkgaGF2
ZSBtdWx0aXBsZSBwb3dlcgo+Pj4gZG9tYWlucyBmb3IgdGhlIFhVU0IgY29udHJvbGxlciBhbmQg
d2UgaGF2ZSB0byBqdW1wIHRocm91Z2ggZXh0cmEgaG9vcHMKPj4+IHRvIG1ha2UgdGhhdCB3b3Jr
Lgo+Pgo+PiBJIG1vZGVsZWQgdGhlIGNvcmUgUEQgYXMgYSBwYXJlbnQgb2YgdGhlIFBNQyBzdWIt
ZG9tYWlucywgd2hpY2gKPj4gcHJlc3VtYWJseSBpcyBhIGNvcnJlY3Qgd2F5IHRvIHJlcHJlc2Vu
dCB0aGUgZG9tYWlucyB0b3BvbG9neS4KPj4KPj4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZGln
ZXR4L2RmZDkyYzdmN2UwYWE2Y2VmMjA0MDNjNDI5ODA4OGQ3Cj4gCj4gVGhhdCBjb3VsZCBtYWtl
IHNlbnNlLCBpdCBzZWVtcy4KPiAKPiBBbnl3YXksIHRoaXMgbWFkZSBtZSByZWFsaXplIHRoYXQK
PiBkZXZfcG1fZ2VucGRfc2V0X3BlcmZvcm1hbmNlX3N0YXRlKGRldikgcmV0dXJucyAtRUlOVkFM
LCBpbiBjYXNlIHRoZQo+IGRldmljZSdzIGdlbnBkIGRvZXNuJ3QgaGF2ZSB0aGUgLT5zZXRfcGVy
Zm9ybWFuY2Vfc3RhdGUoKSBhc3NpZ25lZC4KPiBUaGlzIG1heSBub3QgYmUgY29ycmVjdC4gSW5z
dGVhZCB3ZSBzaG91bGQgbGlrZWx5IGNvbnNpZGVyIGFuIGVtcHR5Cj4gY2FsbGJhY2sgYXMgb2th
eSBhbmQgY29udGludWUgdG8gd2FsayB0aGUgdG9wb2xvZ3kgdXB3YXJkcyB0byB0aGUKPiBwYXJl
bnQgZG9tYWluLCBldGMuCj4gCj4gSnVzdCB3YW50ZWQgdG8gcG9pbnQgdGhpcyBvdXQuIEkgaW50
ZW5kIHRvIHBvc3QgYSBwYXRjaCBhcyBzb29uIGFzIEkKPiBjYW4gZm9yIHRoaXMuCgpUaGFuayB5
b3UsIEkgd2FzIGFsc28gZ29pbmcgdG8gbWFrZSB0aGUgc2FtZSBjaGFuZ2UsIGJ1dCBoYXZlbid0
CmJvdGhlcmVkIHRvIGRvIGl0IHNvIGZhci4gUGxlYXNlIGZlZWwgZnJlZSB0byBDQyBtZSBvbiB0
aGUgcGF0Y2guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
