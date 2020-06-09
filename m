Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BFE1F47AB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E826E338;
	Tue,  9 Jun 2020 20:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B516E338
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:02:02 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id l6so21647798ilo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ELH9Be8+gsKdPlrt+pdF1SGavvBGmA9LnuUEzWNi+6g=;
 b=rrPQqRrV8aIO7ndznLb79Zqxq6XgEiPAt3Evgwb5awqFnpMWiAcZk4RyJ3EQ44SrV8
 74mhlGfhAI/oMeKJVsczYNZrN55Dc7ZoSnWjSQZk9PcgtnV131iapIu1I+xLhBq+B0QR
 onGNXIfEAqPRPjf90hx/uV2ZqdxRJgnIrwSS072fRHSSr4Q5/eUahxzD7W8aAcNqMHEe
 URxKg/V8xPf6Q+e0yvlDRdT0xg2RfyAMT0j5mP3vpkxAgtaHENEPtUmMPpVBUQQ0LhpI
 cYLxDxhc4f46Aw9GLpKvKohy9SjTC2eN1p3wewzLeporGzut4OZvR392ztXw+fpn9LTL
 ufPA==
X-Gm-Message-State: AOAM5334g0Q0uvsJ+S0Rlpf/Z1/hsvsbXn7qG+89zEx8LIq4998u/Ze0
 MjW0ppD4axPobBA7zNz/bQ==
X-Google-Smtp-Source: ABdhPJzzN9h/0yFH/jDM7Lc0O27CSSrGvQPkicYGBRLDyugbScvihBoQuG1yDC/Qmm+eVczJTsZiSQ==
X-Received: by 2002:a92:854a:: with SMTP id f71mr28102764ilh.28.1591732921382; 
 Tue, 09 Jun 2020 13:02:01 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id g64sm7823853iof.5.2020.06.09.13.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 13:02:00 -0700 (PDT)
Received: (nullmailer pid 1358678 invoked by uid 1000);
 Tue, 09 Jun 2020 20:01:59 -0000
Date: Tue, 9 Jun 2020 14:01:59 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 23/39] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <20200609200159.GA1358512@bogus>
References: <20200607185530.18113-1-digetx@gmail.com>
 <20200607185530.18113-24-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607185530.18113-24-digetx@gmail.com>
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
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 07 Jun 2020 21:55:14 +0300, Dmitry Osipenko wrote:
> Each memory client have a unique hardware ID, this patch adds these IDs.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
