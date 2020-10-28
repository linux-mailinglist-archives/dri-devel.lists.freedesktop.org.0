Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB3C29D0B8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE2A899A7;
	Wed, 28 Oct 2020 15:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A107899A7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:30:16 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b2so4576953ots.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d2bISq6eLdcKMjNlJcKgIH+JW7IlvZPJABIB1hmk538=;
 b=LKp4hAnJdTAhZZOAOqZAJBaMzau4lfUgeI/l+mDACxJJ0gX/ALUqSiXREBYygQ9Y2P
 LqEeUsaxWr9XS3jLGyR14X0qa1777i6cKIPtsH3+LKHdDvEdpDw5YF3mn9xhon+H0bnH
 F+wNYyhHX0Ui8DRCEsSOPAn86iL/y0k9B+nY06U84B9a5TO9Um5T+YkucSF5PJDLrkFO
 wi7lmfCg/+pryoB0kK9J9pwdpvTEq/mdqQogsDIJ6ASFHDuN7UDXEQmjyt+dcl1MoBuM
 HyTefB27MK6yOYbjipUPI294wWxKfGoqeo0dKj0bFMZF1Mek5nas1lnSqfxGddO7geAL
 HCaQ==
X-Gm-Message-State: AOAM53018gq5Bt+M97cw7MG44/2uTTSG5VUprT55ndiLguYBri0+pQP7
 vrQc8LiGIGvSFxR6nfiO9Q==
X-Google-Smtp-Source: ABdhPJxePufEKBxPy5ldMaGUPclbtmQjjTrYKwN9UnqPeafBvzPio38FSAsVM02kNVp5/lFXZ+YOiw==
X-Received: by 2002:a9d:6aca:: with SMTP id m10mr5654973otq.282.1603899015746; 
 Wed, 28 Oct 2020 08:30:15 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x14sm2656085ooo.43.2020.10.28.08.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:30:14 -0700 (PDT)
Received: (nullmailer pid 4059892 invoked by uid 1000);
 Wed, 28 Oct 2020 15:30:13 -0000
Date: Wed, 28 Oct 2020 10:30:13 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 14/52] dt-bindings: memory: tegra124: emc: Document
 OPP table and voltage regulator
Message-ID: <20201028153013.GA4059862@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-15-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-15-digetx@gmail.com>
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
 Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:57 +0300, Dmitry Osipenko wrote:
> Document new OPP table and voltage regulator properties which are needed
> for supporting dynamic voltage-frequency scaling of the memory controller.
> Some boards may have a fixed core voltage regulator, hence it's optional
> because frequency scaling still may be desired.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra124-emc.yaml       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
