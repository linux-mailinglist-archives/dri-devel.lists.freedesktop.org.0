Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C761F47AE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B3C6E339;
	Tue,  9 Jun 2020 20:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118026E339
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:02:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so18014534iol.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k8Vtkuk+eVaXGU/8rfVJdWcttoiSK9i9poLLXc4pfnw=;
 b=mM+ldt6+LdBW/Nwnf/CHtR1awNua0w9TVxGj+WRiezNI16zLzTMT2Z0QcyNaghdSg8
 dhU8Q3oR/stIGir6b2m8/DACoQq4NMrQIpGTWbqf2umBTquDr7GDqnAyNztKnV3hwutL
 YZxq5ZlJsOxuLL6lREjEjppJViZFzQo7z5iHkPLNGXL5ohObXTn58TFbbeh7dD2brwxQ
 fDp9k1lcEOQsPgeNpIRv7jF5EDzJ9XP39rL+MADKH06liLHyDqiRTxrnAn2DNqPtNT/w
 aOx+n0PwcJXhFRds8vsO1/WcE0bO7cpGktDzCkzHxGs5LSIL6/XNSx5yvPQ1giI/8dng
 mNiw==
X-Gm-Message-State: AOAM530XMZ5M0rpgH39Hsz6h2SUElEOpKFY9K6MimPZABo0BnPWlOLgf
 0MP6ULyLd71hriDQSdbXKg==
X-Google-Smtp-Source: ABdhPJwwjhFBa9o+ou5vR9zbKMqsajdWUO/uk2RF8iJ7Mxb3+utXKh5+R6GmAI2gbaTUyNT6I1quhg==
X-Received: by 2002:a05:6602:2e96:: with SMTP id
 m22mr28955927iow.165.1591732947458; 
 Tue, 09 Jun 2020 13:02:27 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id e184sm7664983iof.44.2020.06.09.13.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 13:02:27 -0700 (PDT)
Received: (nullmailer pid 1359505 invoked by uid 1000);
 Tue, 09 Jun 2020 20:02:25 -0000
Date: Tue, 9 Jun 2020 14:02:25 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 24/39] dt-bindings: memory: tegra30: Add memory client
 IDs
Message-ID: <20200609200225.GA1359394@bogus>
References: <20200607185530.18113-1-digetx@gmail.com>
 <20200607185530.18113-25-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607185530.18113-25-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 07 Jun 2020 21:55:15 +0300, Dmitry Osipenko wrote:
> Each memory client have a unique hardware ID, this patch adds these IDs.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra30-mc.h | 67 +++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
