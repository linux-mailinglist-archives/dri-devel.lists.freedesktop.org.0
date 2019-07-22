Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73270785
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20B088DA9;
	Mon, 22 Jul 2019 17:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CC489D58
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:39:18 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so75677985iob.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wjVlpYQpZUbO09orLG9AZ6U1/SPFAZfxcKpbcS0Hb5E=;
 b=TftM/C+wfNE9mwweFF6BfC1yyVu7gbJzjiPfJnFahE/QAV+Tl1WzRl6B60vxESFNIJ
 Wa0f3k82EmtV2GtFKoOSZPSFB2DTgHwaqP/+0vwQUaEVU/9tXuL+PJplVs3XPYsWWN02
 b2EsUlZ2DUqIHnvTnP+Y1ltJVq1CA6uFizWWRLo38dnJEZgwem14HboLVg78dfodKCc2
 eBAO654XMHwgqZLYvgpG1TF+qP5ZxI3Tut06vETXBApadYUrqnYTfLzt95/jl3l9o2cr
 1Jfwd/yHRu8KygEcn9D8V5oA/VXRYJtuW8a9GF33DlktdTDwTwgZKHsFlm8Fy0hhtRMt
 5f/g==
X-Gm-Message-State: APjAAAV1DH2uiq7rC8etnZuwX0kIx85Cd711c6cbrGwf+chJp8oK28kG
 Tt64k//RpEt7l2ARZU2ZZg==
X-Google-Smtp-Source: APXvYqxApqbNIx0zyoWtwrvfuA/FYi/DJQeGo5LXD2cSKwEdYujoOCwjHXvKo/HVr55kQ3JiI42Arg==
X-Received: by 2002:a6b:7606:: with SMTP id g6mr11597267iom.288.1563817157557; 
 Mon, 22 Jul 2019 10:39:17 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id z19sm52082738ioh.12.2019.07.22.10.39.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:39:16 -0700 (PDT)
Date: Mon, 22 Jul 2019 11:39:16 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 1/4] dt-bindngs: display: panel: Add BOE tv101wum-n16 panel
 bindings
Message-ID: <20190722173916.GA26308@bogus>
References: <20190626025400.109567-1-jitao.shi@mediatek.com>
 <20190626025400.109567-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626025400.109567-2-jitao.shi@mediatek.com>
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
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
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

T24gV2VkLCAyNiBKdW4gMjAxOSAxMDo1Mzo1NyArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+IEFk
ZCBkb2N1bWVudGF0aW9uIGZvciBib2UgdHYxMDF3dW0tbjE2IHBhbmVsLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2Rp
c3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQgICAgICAgIHwgMzQgKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
Ym9lLHR2MTAxd3VtLW5sNi50eHQKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
