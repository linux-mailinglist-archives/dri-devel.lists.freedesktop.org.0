Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1829D0A7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8C6E578;
	Wed, 28 Oct 2020 15:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624876E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:23:32 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m26so4376137otk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T8MLPXzg2SZx9c5xJhUu8LnS9OjmrbIOKKCNscuh58o=;
 b=p85Xg1pQ/lnpJz1ToB0lwVxUEcZK/Kk1aEWY8+u1GBneoBept26CS7GBLlGewkIl7k
 knRLeEHELkQqy31A2U1+X46YpSh98RVuV2NRxcHY0D1mHvY5q3y3uk/JBHIgKHRnAF0k
 EIfzQyX/96qEghReAcUzV7lJPADo04DWceBUQHi2O31T9Hkz0oKQzxKf1ZXtKsdyMTWD
 cVjcjZNGjhsDnO9+8y0sgA1w18ttTMFIm6k3cYRPs8f/Uq0EJQPexGsgrPunnuFZkcGY
 jwgCaarLJKhjadKdtwwI9tF3g1urBagHwEzOyIoUX0XE5lFIDGd1oDO6ZNjXTJA3Hvdl
 fRRQ==
X-Gm-Message-State: AOAM532Qn4z/jr18HZgAr3Lv/ZuG/YqGTGoBEYhbjadGeuyhXUIzuleN
 n8sFKv3cZQflxNzEdz5kAg==
X-Google-Smtp-Source: ABdhPJz7reJgOyNPbR/RoD8e8RtXXbZyuobF3ZC3HQeIbo0bO8WjCWxfxCDoSnL/csJ+nowSt3xcZA==
X-Received: by 2002:a9d:6307:: with SMTP id q7mr5698617otk.218.1603898611758; 
 Wed, 28 Oct 2020 08:23:31 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f18sm2703272oos.19.2020.10.28.08.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:23:31 -0700 (PDT)
Received: (nullmailer pid 4050728 invoked by uid 1000);
 Wed, 28 Oct 2020 15:23:29 -0000
Date: Wed, 28 Oct 2020 10:23:29 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia, memory-controller property
Message-ID: <20201028152329.GA4050679@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-5-digetx@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Mikko Perttunen <cyndis@kapsi.fi>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:47 +0300, Dmitry Osipenko wrote:
> Tegra20 External Memory Controller talks to DRAM chips and it needs to be
> reprogrammed when memory frequency changes. Tegra Memory Controller sits
> behind EMC and these controllers are tightly coupled. This patch adds the
> new phandle property which allows to properly express connection of EMC
> and MC hardware in a device-tree, it also put the Tegra20 EMC binding on
> par with Tegra30+ EMC bindings, which is handy to have.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
