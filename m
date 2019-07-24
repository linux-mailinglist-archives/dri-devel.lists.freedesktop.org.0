Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC9736FF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB366E623;
	Wed, 24 Jul 2019 18:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AF66E621
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:53:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s15so21184583wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2zNZEJTuzMPjlqBT9RJzY55tpYLVrNhwFI08koZCEQw=;
 b=UCIzSdany3gjmA8bxAZ/t4/rQNPPsbq5CmrwhovYYtamyfXDQwTdddle5uARr/6RmF
 AQhKPik9HoVdIEa/QmZCYDkomExxFH2bPIq6c9NN73DSDQGhTNejadPpi2wW2zhJF+z9
 NkyStL8HFxRQbhakgwUmIU8KWKRMNwAJIcoW1cUyE/rE5LZck6cdj5TCiTsJplUK7EDD
 1Kv2S5hkUaJxhLRmd/cwujs9zcCA/vZ0wCE5gvPi1ZtIjUo7UloSb6ovfGHtD5MMS52g
 uqe+CnMFw6+dAJIvp4Ik0b9h8QbwAJ/QPzmcxoEjjoLc1Y689w66EW+tRkoYU2nHVIcv
 uPCA==
X-Gm-Message-State: APjAAAVVsYASY7YFXwCMlKpNvJzqqYzlAoXMPKVZjT/NdQoqFQYb8I89
 CvfOSolArtAV5EYNMwibTrk=
X-Google-Smtp-Source: APXvYqy0xTyUlF8khzfhL9sfMsBdP0ddDmFskR3W6aToym1NthS5JiFwI9kJq5H93SLqHuER2lIIBg==
X-Received: by 2002:a05:600c:c4:: with SMTP id
 u4mr75602252wmm.96.1563994405214; 
 Wed, 24 Jul 2019 11:53:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id a6sm34609206wmj.15.2019.07.24.11.53.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 11:53:24 -0700 (PDT)
Date: Wed, 24 Jul 2019 20:53:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 00/11] Simple QoS for exynos-bus driver using
 interconnect
Message-ID: <20190724185322.GC14346@kozik-lap>
References: <CGME20190723122022eucas1p2f568f74f981f9de9012eb693c3b446d5@eucas1p2.samsung.com>
 <20190723122016.30279-1-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MDVQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhlIGZvbGxvd2luZyBwYXRjaHNldCBhZGRzIGludGVyY29ubmVjdFsxXVsyXSBm
cmFtZXdvcmsgc3VwcG9ydCB0byB0aGUKPiBleHlub3MtYnVzIGRldmZyZXEgZHJpdmVyLiBFeHRl
bmRpbmcgdGhlIGRldmZyZXEgZHJpdmVyIHdpdGggaW50ZXJjb25uZWN0Cj4gY2FwYWJpbGl0aWVz
IHN0YXJ0ZWQgYXMgYSByZXNwb25zZSB0byB0aGUgaXNzdWUgcmVmZXJlbmNlZCBpbiBbM10uIFRo
ZQo+IHBhdGNoZXMgY2FuIGJlIHN1YmRpdmlkZWQgaW50byBmb3VyIGxvZ2ljYWwgZ3JvdXBzOgoK
TmljZSB3b3JrISBHb29kIHRvIHNlZSBwcm9wZXIgc29sdXRpb24gOikKCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
