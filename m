Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6029CEA6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53556E233;
	Wed, 28 Oct 2020 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311266E029
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:38:59 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l28so3825596lfp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oSKJ52KX02pbIoZHYzF+rH9Iv+ZGut7jSb61YOY1u8k=;
 b=A5QlT5Ajrg5hX3qeNVkBillmBH/crjEuzDP8STRVYmqQ2x6onxY/hq07gpy6OFWjmN
 EjC/+CsbBUDSJRkmevpFr2r4akZGf9cbfA29AChzMkcEv/NGuqrNMJDULX2CgS0Voll+
 brSwpHEXhEbTAkLXle27QRaoh4+k/W17Mskq51bJ7t2xgAFkzw05yzRFyZxRC0xJVY2O
 40vSf6srqo6klIAYhkecoEgA9RjFHqTNYyHWJyEEqo2uD5snp2WESzI0WbGcXYEpXSd/
 QWieY/p8Ox6t1VPdLTNWuMzD7PMCfQhKIdukSW1XIOayP6i5W/42RESI3Ou8b3QH9Y4b
 bvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oSKJ52KX02pbIoZHYzF+rH9Iv+ZGut7jSb61YOY1u8k=;
 b=ODBWakTCgbqNdopdSkCkSMXOIma60wULWxmw9B/93IekhJV2+s+N/C+vEos3zyQgrE
 fVzu9qr7iDw4IhAd9nbRgNizdno9FIkUZat1KQxMtSpPulSw5GXIOe+YGU3ul/NHfQQr
 dwMTgflBSl6cfugFoqW2wvsfOa95Zj9K6j6Pd3P2NBHQsZSTZ/sxzcHkee0k9Hkg09pj
 megdzStBLHcJY2tjXIGJl0S1SrohBwinkvyrd5JpLsYBtW0K9oNUyQ0hjNgG8H2w2CoL
 bfcxRuBSwRXJXP+TESYDYxWcvtq63zYfPGNe7Q/UsMf5qfZx/gWZhSeiMOdMXcuv+XSI
 5vAw==
X-Gm-Message-State: AOAM532W3h88UHy9azXKE5hh1oDA/cwttnOcUCrgrp1v/5CHdUGlXKHC
 3qC/82BzsP0eb6OFHK2p3PI=
X-Google-Smtp-Source: ABdhPJxB1pU1rokYucpbd4/MZx1uZgD8u6sMCmHa6qc331GV6WUYPZB/6urRjr6Bn7o0SbCnnlBUNQ==
X-Received: by 2002:a19:834e:: with SMTP id f75mr1362840lfd.111.1603827537672; 
 Tue, 27 Oct 2020 12:38:57 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id c4sm272462lfm.294.2020.10.27.12.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:38:57 -0700 (PDT)
Subject: Re: [PATCH v6 32/52] memory: tegra20-emc: Continue probing if timings
 are missing in device-tree
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-33-digetx@gmail.com> <20201027135244.GM1822510@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c306309-6f49-cbac-99ce-6d956d5e910c@gmail.com>
Date: Tue, 27 Oct 2020 22:38:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027135244.GM1822510@ulmo>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxNjo1MiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE9j
dCAyNiwgMjAyMCBhdCAwMToxNzoxNUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IEVNQyBkcml2ZXIgd2lsbCBiZWNvbWUgbWFuZGF0b3J5IGFmdGVyIHR1cm5pbmcgaXQgaW50byBp
bnRlcmNvbm5lY3QKPj4gcHJvdmlkZXIgYmVjYXVzZSBpbnRlcmNvbm5lY3QgdXNlcnMsIGxpa2Ug
ZGlzcGxheSBjb250cm9sbGVyIGRyaXZlciwgd2lsbAo+PiBmYWlsIHRvIHByb2JlIHVzaW5nIG5l
d2VyIGRldmljZS10cmVlcyB0aGF0IGhhdmUgaW50ZXJjb25uZWN0IHByb3BlcnRpZXMuCj4+IFRo
dXMgbWFrZSBFTUMgZHJpdmVyIHRvIHByb2JlIGV2ZW4gaWYgdGltaW5ncyBhcmUgbWlzc2luZyBp
biBkZXZpY2UtdHJlZS4KPiAKPiBEb2VzIGl0IHJlYWxseSBoYXZlIHRvIGJlIG1hbmRhdG9yeT8g
U291bmRzIGxpa2UgdGhhdCdzIGdvaW5nIHRvIG1ha2UgaXQKPiB1bm5lY2Vzc2FyaWx5IGNvbXBs
aWNhdGVkIHRvIG1lcmdlIGFsbCBvZiB0aGlzLiBJcyBpdCBjb21wbGljYXRlZCB0bwo+IG1ha2Ug
aW50ZXJjb25uZWN0IHN1cHBvcnQgb3B0aW9uYWwgaW4gY29uc3VtZXIgZHJpdmVycz8KCkludGVy
Y29ubmVjdCBwcm92aWRlciBjYW4ndCBiZSBvcHRpb25hbCBpZiBpbnRlcmNvbm5lY3QgcHJvcGVy
dGllcwpwcmVzZW50IGluIGEgZGV2aWNlLXRyZWUgYmVjYXVzZSBkcml2ZXJzIHRoYXQgdXNlIElD
QyBwYXRoIHdpbGwgZ2V0Ci1FUFJPQkVfREVGRVIgdW50aWwgSUNDIHByb3ZpZGVyIGlzIHJlZ2lz
dGVyZWQuCgpPbGRlciBkZXZpY2UtdHJlZXMgZG9uJ3QgaGF2ZSBJQ0MgcHJvcGVydGllcywgYW5k
IHRodXMsIHRoZSBJQ0MKdXNlcnMvY29uc3VtZXJzIHdpbGwgZ2V0IGEgZHVtbXkgTlVMTCBJQ0Mg
cGF0aCBpbiB0aGlzIGNhc2UuIEkuZS4gSUNDCmNvcmUgaGFuZGxlcyB0aGlzIGZvciB1cy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
