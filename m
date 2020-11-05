Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1A2A878D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494976EDE5;
	Thu,  5 Nov 2020 19:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727586EDE5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:49:08 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w145so2917629oie.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 11:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tuYnC0Mxw2GdN/5/fc/SmXazs0VaaXHxAARa6Xjy2i4=;
 b=bEpOpb8YAo2Kw4xkZBtHCYwkV+m87Nx4xjmTRUrJ2LRDhhtY7nNL2RPgbc6pP2ugdv
 f6VXYz0VAtmv1zaCAAWcQ3EFKDmy7V9CLFKUWHa4vvp3BpZP0wF7G5NWO8aPdj1GLHOy
 sz4kvoBuiR4sTxl/eIryoqZZ9k9sBVm9EnT7uan0IeXtu/qWTiQK4q2UYcaTclYRpomQ
 AwtGM0v58RqDaQ7JzdpgcVutSyWDQaN2FMFmtZpkqlTAVsvlsrBKwMpMA8TH7vWEW5Ev
 PxM2wB4DxhA7kbu+gDOp9RnnqvFeXC4TdYd6w+aainxtJfhThf5qWaLocd8faHqU3rqN
 TW0w==
X-Gm-Message-State: AOAM530DITrxsj1xB3bksFMEaoGWvrTfTX/vTvzUynqFo63+dDA9mk/6
 PKSwcERhiRmvoLZLpomqOg==
X-Google-Smtp-Source: ABdhPJw9mjGnbmwktu6jycYe4A4nLF1h99xyWADN6/gYWECKdz4nU/5g+w8IKI9+KbNGXxZinSDljQ==
X-Received: by 2002:aca:bad4:: with SMTP id k203mr713838oif.16.1604605747683; 
 Thu, 05 Nov 2020 11:49:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 132sm592345oid.54.2020.11.05.11.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:49:07 -0800 (PST)
Received: (nullmailer pid 1701587 invoked by uid 1000);
 Thu, 05 Nov 2020 19:49:05 -0000
Date: Thu, 5 Nov 2020 13:49:05 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 12/47] dt-bindings: memory: tegra124: mc: Document new
 interconnect property
Message-ID: <20201105194905.GA1701518@bogus>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-13-digetx@gmail.com>
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
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 Nov 2020 19:48:48 +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> External Memory Controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-emc.yaml     | 1 +
>  .../bindings/memory-controllers/nvidia,tegra124-mc.yaml      | 5 +++++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
