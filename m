Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891595FEA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8EC89B66;
	Tue, 20 Aug 2019 13:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A1789B66
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:22:55 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB6B022DD6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:22:54 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id b11so5926524qtp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:22:54 -0700 (PDT)
X-Gm-Message-State: APjAAAVOelLGKZuwq0/ND48y7K4YXz0QSTFXDNtIOrhxLKjxcfwQ7H3O
 6MbBTIqdiU4+Gs/0KfEtYzO+9qJ6b1g8XjRNoQ==
X-Google-Smtp-Source: APXvYqwoF+4NBHbc+mh4/cjAOzetDrnx/H6ki3UR8XHIUfmV3E4baxFQHmkTVztJFcWEl8hMkWIGS/6m5JfOpGYIGhc=
X-Received: by 2002:ad4:4050:: with SMTP id r16mr14444599qvp.200.1566307373963; 
 Tue, 20 Aug 2019 06:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190819234840.37786-1-john.stultz@linaro.org>
In-Reply-To: <20190819234840.37786-1-john.stultz@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Aug 2019 08:22:41 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+oxy0z283FO8D9FV7xsEX+AsonUx2Feqk8AiDAOmy9=w@mail.gmail.com>
Message-ID: <CAL_Jsq+oxy0z283FO8D9FV7xsEX+AsonUx2Feqk8AiDAOmy9=w@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings for lima support on HiKey
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566307374;
 bh=1rIuBeM0IKRvdxc6b3vVTRd4MHIEw3Zx6tXCfzXBOSg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QXM0kFthGloCUwKOn6dugqf5hkxzFjGs8/hVqkmCPXzPSWHg4rqs24kTAZvq0N/iM
 qQ5FfkfHuZ6f8jKZRFce1YCkYOgf/AYFA9AMIxneISXaVEc58bqH6zYfbhTN1SYRZW
 VbjXYYrnTjz/pCEmjFpTzACDhwifbFP6FDDfUYFU=
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgNjo0OCBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBQZXRlciBzZW50IGEgcGF0Y2hzZXQgb3V0IGJhY2sgaW4g
QXByaWwgdG8gZW5hYmxlIExpbWEgc3VwcG9ydAo+IG9uIEhpS2V5LCBidXQgdGhlcmUncyBub3Qg
YmVlbiBtdWNoIGFjdGlvbiBvbiBpdCBzaW5jZSBzaW5jZS4KPgo+IEkndmUgYmVlbiBjYXJyeWlu
ZyB0aGUgcGF0Y2hzZXQgaW4gbXkgdHJlZSwgYW5kIGZpZ3VyZWQgSSdkIHNlbmQKPiBvdXQganVz
dCB0aGVzZSB0aHJlZSBkdC1iaW5kaW5ncyBjaGFuZ2VzIGp1c3Qgc28gaG9wZWZ1bGx5IHRoZXkK
PiBjYW4gZ28gaW4gYW5kIHRoZSBkZXBlbmRlbnQgZHJpdmVyIGNoYW5nZXMgY2FuIGJlIG1vcmUg
ZWFzaWx5Cj4gcHVzaGVkIGxhdGVyIG9uLgoKQXMgaXQncyBhbGwgYmluZGluZyBjaGFuZ2VzLCBJ
J3ZlIGFwcGxpZWQgdGhlbSB0byB0aGUgRFQgdHJlZS4KClJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
