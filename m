Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C258AA43
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 00:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE686E02A;
	Mon, 12 Aug 2019 22:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D72B6E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:15:14 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id o101so12097760ota.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 15:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5Hl8Ot2aSHBMEKcD9YMEz708iweSmdqsv8l8Mi9vl6U=;
 b=Cuxp7DCTctv13Ly8Nh/my2ScEdw8zux8wk4tUaCiColU4pPjawstn9zMAyuwGWUCH2
 EPVF0IovOiC8Ho0wSyI9dY9qALosLQEdC6hQdHxsuvtH33LASw0wNiQJ+2xiYsIdsM1y
 jenzc0UYSbj9kk/4hOSCi4lm1vnYND3wSdyc4Qc1rAT3xK8wxLVIth7AwT2xqYBFmYYx
 olU42Y9pKprDrA+IvR2Ytsnk0wQnMWkxlOwpbKjOoa7bBZAFoys1XvQFsfItslxKZhQj
 pE3r5YoyfUFPuTKlzoCwtg/zeN999t/XgiH5tthlxuzGgTJKc14bG4gNYW5XW/fn9B5W
 xShA==
X-Gm-Message-State: APjAAAX/kyPDgIVtImVquUIy+QQwg98ElLWFOegRDZhnGpTlFqBg6Q+a
 wNEDwx6Ruom4OcL7/S54WA==
X-Google-Smtp-Source: APXvYqxITl4/8wD2qF1OX3crvab5FCfVn+l0zPlE0D/ekVjf18e2o5f8bw/6PsZEPiWUQhTL3E0zOg==
X-Received: by 2002:a02:c996:: with SMTP id b22mr16399239jap.39.1565648113681; 
 Mon, 12 Aug 2019 15:15:13 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id w23sm90581004ioa.51.2019.08.12.15.15.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 15:15:13 -0700 (PDT)
Date: Mon, 12 Aug 2019 16:15:12 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH wn 3/4] dt-bindings: display: panel: add auo
 kd101n80-45na panel bindings
Message-ID: <20190812221512.GA24378@bogus>
References: <20190811091001.49555-1-jitao.shi@mediatek.com>
 <20190811091001.49555-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811091001.49555-4-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Sam Ravnborg <sam@ravnborg.org>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMSBBdWcgMjAxOSAxNzoxMDowMCArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+IEFk
ZCBkb2N1bWVudGF0aW9uIGZvciBhdW8ga2QxMDFuODAtNDVuYSBwYW5lbC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFu
ZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAx
bjgwLTQ1bmEudHh0Cj4gCgpQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRhZ3Mgd2hl
biBwb3N0aW5nIG5ldyB2ZXJzaW9ucy4gSG93ZXZlciwKdGhlcmUncyBubyBuZWVkIHRvIHJlcG9z
dCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQptYWludGFpbmVy
IHdpbGwgZG8gdGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5
LgoKSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFu
ZCB3aGF0IGNoYW5nZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
