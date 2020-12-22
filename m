Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7D2E032C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 01:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463B6E828;
	Tue, 22 Dec 2020 00:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F736E828
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:09:40 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id n42so4510983ota.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 16:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zG6sef2nkyQSD9FdWc29n10NLZhBWeYXF5IDEZb5IhM=;
 b=cEf/5MWd4YAva2It3+QJdYZLKrCYDuFj6QG53RK9eZqFff4JxGdPxvNEb+B/k8IYpl
 kwSdgZ5/rV1jemw2cOc4+9K+z+l/Fj0WjLf6XjywAtwYPvVvGI7m+rIfS4fggBgriW8N
 Sy2sTipUkE4LoSkx8Rjo4VP3+VS0Ig7AcW0pZfGGhKBEVNDfAtnDXEO8a8cxjOXzus0a
 8ZKf2LzmMtGSngi6kYZnfrRq5rn4tLslz9TIUUGpl3sMRqeclA5Kbl4OXDx4PmC/nQ/U
 3kig/uYt3bPbSY1AtUsE/iv2hwxPWCDqjRqdJ/S+4XPK1Gn0BFSu2Be/6aTzpW+61Tne
 Ee0Q==
X-Gm-Message-State: AOAM532jPfSUgAGiheHrUoGlcd0NJXVN9auRvIMOVEn9M6FLisWyXncj
 /xYoaYuQH/UgrKCdaPlCGT5wb/Ebow==
X-Google-Smtp-Source: ABdhPJwa/MJznhmRcGcjWOgAZbEZa6yOwQv7k06wvfAOPLk4hqYxA5oYyJHesaXDPyJ+9+6d0SNL5Q==
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr13953591otd.208.1608595778499; 
 Mon, 21 Dec 2020 16:09:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r15sm3884964oie.33.2020.12.21.16.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 16:09:37 -0800 (PST)
Received: (nullmailer pid 891719 invoked by uid 1000);
 Tue, 22 Dec 2020 00:09:34 -0000
Date: Mon, 21 Dec 2020 17:09:34 -0700
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 05/48] media: dt: bindings: tegra-vde: Document OPP
 and power domain properties
Message-ID: <20201222000934.GA891659@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-6-digetx@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Dec 2020 21:05:55 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and power domain properties of the video
> decoder engine.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.txt   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
