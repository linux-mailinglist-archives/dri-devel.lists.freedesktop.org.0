Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6872C012A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 09:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2735089C61;
	Mon, 23 Nov 2020 08:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A601B89B49
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:17:37 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b63so13913081pfg.12
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 22:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GKa7W0DjsQScUMdM+fh7P8EBsnhIK0qKVT7JJFmlduM=;
 b=rGEfXEwlr66TrbSIzeEJ5FDjg42pe+KTbVMCt3orA1E7AS+8bNxLN7hgHnv9wZ4zRW
 7tpleeyHmO/Mk8recctOvWkoXB3ku7K//lc6CBgJCg0vWvIt2AJaVorT8KgtJz/s6UB0
 cpghzzT0Whp/cpSh8xdsm+7U0PDuVKeQZYtYxg7x7LSYM7de4ahGiiU9M/u1Byu8drem
 otVZOkwRy7/W7UYjnbAxFwhn3Sd2uxThXBJZ4CVJgiBId/k4K2AClDUHlRFQFeBgjwHm
 rOckwkbQUfwnqqyNo7jur3VrxoBOcrEAz7n+xImPhIOplX5ie4p+LdjYQX3X+I048R3F
 +i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GKa7W0DjsQScUMdM+fh7P8EBsnhIK0qKVT7JJFmlduM=;
 b=ifvWEZz0o1KHaL2iwqp2TPU+SmQlW+KXzz8+ywxt0XO1SFR0c1A10hPCHCo4lCGhE0
 g8F9tLD70dagC5nyxF4bXeIJ+JrcW17vIORrwO2hEjkSugW0rt3p7iVeYs7flSryoHzp
 r4rJuqHOqTmPuh+2GkGQV4hrOPAdY6Wbmzm1DBmL6bIEQb+z2pa5LjyWfnShaMuhip/u
 7uI8qoQcoBIHld17j9oIjCe+rItM1dqPHHrh5dbOMxNXDOrBVUbXUD2j+Pdbj6fB11XK
 LrWut8yNexf7R3BAFA1HLrxDl7t9EVQ85QIR8FILjSJReEUvVN2ISDD7duE6JJXohP/k
 Mxpw==
X-Gm-Message-State: AOAM531J3/up/XoKwToeCtFI2TToAUaiBA7/pykdvXCFNN6xho07cIuX
 WlqHV+uV8VOI8UoGvxEe0P0TkA==
X-Google-Smtp-Source: ABdhPJzlkLlCQ2x4GcvUyoOExAar0nVc9jrP+KcgO26RrmOh/VDHjgc+ePCKgyNUoHpOWBv65Xzzwg==
X-Received: by 2002:a62:52d7:0:b029:18b:7093:fb88 with SMTP id
 g206-20020a6252d70000b029018b7093fb88mr24458173pfb.76.1606112257122; 
 Sun, 22 Nov 2020 22:17:37 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id u197sm10953224pfc.127.2020.11.22.22.17.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Nov 2020 22:17:36 -0800 (PST)
Date: Mon, 23 Nov 2020 11:47:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v10 00/19] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Message-ID: <20201123061734.mpmkdxzullrh52o7@vireshk-i7>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 23 Nov 2020 08:12:51 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-11-20, 03:27, Dmitry Osipenko wrote:
> This series brings initial support for memory interconnect to Tegra20,
> Tegra30 and Tegra124 SoCs.
> 
> For the starter only display controllers and devfreq devices are getting
> interconnect API support, others could be supported later on. The display
> controllers have the biggest demand for interconnect API right now because
> dynamic memory frequency scaling can't be done safely without taking into
> account bandwidth requirement from the displays. In particular this series
> fixes distorted display output on T30 Ouya and T124 TK1 devices.
> 
> Changelog:
> 
> v10 - In a longer run it will be much nicer if we could support EMC
>       hardware versioning on Tegra20 and it's not late to support it now.
>       Hence I added these new patches:
> 
>         dt-bindings: memory: tegra20: emc: Document opp-supported-hw property
>         memory: tegra20: Support hardware versioning and clean up OPP table initialization
> 
>     - Removed error message from tegra30-devfreq driver about missing OPP
>       properties in a device-tree because EMC driver already prints that
>       message and it uses OPP API error code instead of checking DT directly,
>       which is a more correct way of doing that.

Looks good to me (from OPP APIs usage perspective). Thanks for
continuing with this and fixing all the issues Dmitry.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
