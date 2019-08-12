Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C68A9B4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 23:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898F6E3F5;
	Mon, 12 Aug 2019 21:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF336E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 21:51:05 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b7so114528619otl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YxUrApdtPFyU9H97SktZgYuAmYUABRE+Th0JrfsEq/M=;
 b=i3fC+1OVFmCMF92LiZmQS8g6NscMlBBqD+oxbulxkcNFAFySBgqpJkmjGNExeYASmc
 gapMnvjAArR2Y+KgZV0BXWlLMXVuBReHHxY+YssdYwyi2/95O7OzjdJKxp5iqJM7LgEY
 Bk0ti6O/QFe69v3x+yb9b4SLNNv2N8X58pDvASnyz/GbT6uIVDae4ig1CE8KyaydJocF
 t0irKnvucYHK/XfN8L8/COPLrS5QUN3nrTIDyyVQsioTk7hS9zShbEHfUazUsDJenER9
 t/e4YOXaoqZ69PMmbgCVz5856O+10lnVHtucLleJUYeaVZ80p1Uf4iICjNmw3YV6b8Hi
 MrEQ==
X-Gm-Message-State: APjAAAXoe8VdObtLiTj/0FQOJE2ljBNkdZaz5uf83/jDYhl4u4DmBic3
 0uCQn61vPXUU2xdMOO8J/Q==
X-Google-Smtp-Source: APXvYqwW5LyJN2JbS/NExdIgszJ6uaD2Tgi4uSs8FsNTdmrSvThlgJLvWGD+LXLQDLkz6CM2zEf6mw==
X-Received: by 2002:a02:528a:: with SMTP id d132mr38640289jab.68.1565646664461; 
 Mon, 12 Aug 2019 14:51:04 -0700 (PDT)
Received: from localhost ([74.118.88.158])
 by smtp.gmail.com with ESMTPSA id a7sm83055927iok.19.2019.08.12.14.51.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 14:51:04 -0700 (PDT)
Date: Mon, 12 Aug 2019 15:51:03 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: update dpi
 supported chips
Message-ID: <20190812215103.GB5954@bogus>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
 <20190807060257.57007-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807060257.57007-2-jitao.shi@mediatek.com>
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
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDI6MDI6NTRQTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IEFkZCBkZWNyaXB0aW9ucyBhYm91dCBzdXBwb3J0ZWQgY2hpcHMsIGluY2x1ZGluZyBNVDI3
MDEgJiBNVDgxNzMgJgo+IG10ODE4Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZHBpLnR4dCAgICAgICAgfCAxMSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKQW5kIHJ1biBhIGN1cnJlbnQgZ2V0X21haW50YWluZXJz
LnBsLiBZb3VyIERUIG1haW50YWluZXIgbGlzdCBpcyBvdXQgb2YgCmRhdGUgYnkgeWVhcnMuCgpS
b2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
