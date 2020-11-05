Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D492A915A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55F6EA84;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EF26E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 10:40:13 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f21so593834plr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 02:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WCCTQKcgxT5BgoXvd55cVkeUPDruRceTke7HPT3Hkyo=;
 b=uI5sjdIZnJfMXmb2BmcneLzfiFbBlet9wY7JQZtjHR0GF8UkHMmcqlXwBrkvsqK1WI
 SeinhDQqNDH8/hEaMPpSpgwvj0qAA2DAOlij96dLz+WulydyVF4o3fYzumZUYFXFoH1h
 ZgXb17DvmcshHNZxztv5zRi/aeOa+ymd+joJrRroDAhLo0nx97avxNo1KBPgxXcO+5qD
 SXvk12UVzaw2/5tEF2FemBinKY4gdRZP1KDwgT69Jbp7nnNi1tx0Yci0mKB/TEHxbTdH
 hUsmGHEaNuInutK+0y4SPLiOBIQ+CzV6c4LqpUQ2rUe9GYtY4Vnxx2LLLnO7akoNoqHJ
 X5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WCCTQKcgxT5BgoXvd55cVkeUPDruRceTke7HPT3Hkyo=;
 b=Aeu4EdRUWHRRaYKfScHo9adQoXseGm/8sgr7pqiNcslW5Mh/gujI+XHqeI2HUb7Ww6
 Idi4RvNw2A+352yoFUVl0IkUHF9Unf2k3VVi+DGT0ffJ41xUzuf79U/EuBbyiyBXqcWX
 3Dgxa9RXYcivb9GWFuQTcBWJJ07RkpcPrT12WNtOMGQyxpaRigFtkzNRrd2JgKyWbTQ1
 BXC9EMH9JCU8YrxV0jgKiBAuK3jMCNm1jPgS0Ndmc1YS/R/M1KWE8i7kW2LF7LmX8SPc
 pL0ApEXVjrNmGdgfa2uYH/O0oy+T1OWYKKdv0zsJ/Qh8Kjrhy8HyHr+L9YNYNhNJ4sLA
 2Drg==
X-Gm-Message-State: AOAM5330E5k8lVLo/IucWXqFdN3kikdIEYOIZvcrS/BoMxwa1CqMfend
 fJgdgi6uRMJT6ZbSdTvbalFMCA==
X-Google-Smtp-Source: ABdhPJxaeig/5BttxMih2SwDkKcSP7+kCvVk+Bpsa5+VJfx+t48gt5Hq0JWRUoD/r4V+wRad0uK0Vw==
X-Received: by 2002:a17:902:b601:b029:d3:e6c5:5112 with SMTP id
 b1-20020a170902b601b02900d3e6c55112mr1328833pls.65.1604572812590; 
 Thu, 05 Nov 2020 02:40:12 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id q11sm1908845pgm.79.2020.11.05.02.40.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 02:40:11 -0800 (PST)
Date: Thu, 5 Nov 2020 16:10:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201105104009.oo4dc6a2gdcwduhk@vireshk-i7>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <20201105100603.skrirm7uke4s2xyl@vireshk-i7>
 <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, DTML <devicetree@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05-11-20, 11:34, Ulf Hansson wrote:
> I am not objecting about scaling the voltage through a regulator,
> that's fine to me. However, encoding a power domain as a regulator
> (even if it may seem like a regulator) isn't. Well, unless Mark Brown
> has changed his mind about this.
>
> In this case, it seems like the regulator supply belongs in the
> description of the power domain provider.

Okay, I wasn't sure if it is a power domain or a regulator here. Btw,
how do we identify if it is a power domain or a regulator ?

> > In case of Qcom earlier (when we added the performance-state stuff),
> > the eventual hardware was out of kernel's control and we didn't wanted
> > (allowed) to model it as a virtual regulator just to pass the votes to
> > the RPM. And so we did what we did.
> >
> > But if the hardware (where the voltage is required to be changed) is
> > indeed a regulator and is modeled as one, then what Dmitry has done
> > looks okay. i.e. add a supply in the device's node and microvolt
> > property in the DT entries.
> 
> I guess I haven't paid enough attention how power domain regulators
> are being described then. I was under the impression that the CPUfreq
> case was a bit specific - and we had legacy bindings to stick with.
> 
> Can you point me to some other existing examples of where power domain
> regulators are specified as a regulator in each device's node?

No, I thought it is a regulator here and not a power domain.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
