Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4C2A9C19
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959C6EAC1;
	Fri,  6 Nov 2020 18:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442D86EAC1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:28:58 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v4so2250840edi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZOBcjXzmP3XQp5e/mQVnWSkEumMVDyvqA4wd3UBnBhU=;
 b=lo3LU8ptX3kTRO1BZBhJ5QrE0tjcCt2X9m2dBRd64lGtPybl4xH9/HpotP2nF4BXKk
 96syhYccSLJFKl8H/7Dvq3+n33LiiopRLEvkPI8i5kj/PRAPMy99AV7BpCO8Unqn8YFF
 sgSKFrW2rXz75f/3z3l2cbS3ctQ1a8hI4y337nOElEIFONOKI28gP8EaSDUNq4hXqrhm
 stllmi6HAS79VKYQlGjuw93GBS22GWBK0QC6eTpbbyUe4bIkjF+r2bpPz5VAvt0iwaIc
 n7oeMOKcbs/tva94Hgaj/MGHFvhhFfE0leiaIhcFXz/Drp193CtPGI16jIypCUdtEq1V
 s9lg==
X-Gm-Message-State: AOAM531aCFL4fqXVFiGNbiar7QxaWx19i3yiTuZKIciwUIXtrshL1W+z
 4APojcnhHyEe1+34axCmqZE=
X-Google-Smtp-Source: ABdhPJxlNfW66GlVYjTFKyuC1Y2mc6OtyWllQWEOuFkwV8zbiJZ5x9lNaFBO1NvBXnQf8By8//MM+A==
X-Received: by 2002:a50:930d:: with SMTP id m13mr3346982eda.117.1604687336917; 
 Fri, 06 Nov 2020 10:28:56 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id h2sm1461648ejx.55.2020.11.06.10.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:28:55 -0800 (PST)
Date: Fri, 6 Nov 2020 19:28:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 04/47] dt-bindings: memory: tegra20: emc: Correct
 registers range in example
Message-ID: <20201106182854.GD65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-5-digetx@gmail.com>
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
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 07:48:40PM +0300, Dmitry Osipenko wrote:
> There is superfluous zero in the registers base address and registers
> size should be twice bigger.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 +-

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
