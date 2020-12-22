Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DF2E1B2D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652DC6E8FA;
	Wed, 23 Dec 2020 10:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F389ED6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:16:00 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id f9so8092348pfc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 01:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l8QALzA4i8zX7B1di+fsQ9pXz5BTZwpSgw/mRJC9G3I=;
 b=iNpi5UGBLQA73+p7sshoUk2MKXQ6+B7bN+nLc+PLyRS7Qzc6JQHE5LPyrHGQxOzXY1
 uOtxbpfxB2whAININqJ4SNPQdP/iqcNVaDMTfpwi6jlirHg+TpXFAk8EUfaM+f2LThpO
 ITwA/t+QLxo/gtfFoU6Y1t6N7t+IeYiN4NQyBRuiWeJo1VWI5Wqkou8CGRhI3Ddi6WMb
 hnbtCuE/ASxcgiGOFPqWP03O9KQV73qnkGAu5hCruEh7I3wNKYJN03dx+O01l7K/zD/k
 7cuSdAfi+Fx9eHduQ+ALtP2fw1WpzfC4YnQ/pZ7skehvj4ca2ag34R983WJCOmU+lJGf
 g+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l8QALzA4i8zX7B1di+fsQ9pXz5BTZwpSgw/mRJC9G3I=;
 b=sB/XU1srHo+u3fy3I17p+Nq8motyxUVHWQxKDc6x6jhKw1VshHnOUJGOeH1V5jDdqM
 uoWCDIxCbewrktEVSH1S6LMaQuxYB3eXNmqXaPe4GTuo1KrsLl8QuuhbxEGqDPBMmO0J
 K4QymTBHO2RQpCc61pSSAB8k21EUwUMo4k2yJ7lg0yVyEHAhqIZ5Uq+3yGlrlmyQpKfr
 INnllKu9whzp3A78p2MyHIypLbkNYY8ddeMhDN5XsIL100+idFlVfi3zZgIyY/w7tlGY
 2CcQD52Z+SS7NAfgzE1sfIbInAa/X/y0jgR0Rdt6DciOIdJ9F4m6DxEUCNhWJEYveY68
 /5RQ==
X-Gm-Message-State: AOAM5325sUTRZQvje/gBAcSOuYMNsu+rm7MMsk3hMn8PfAYObVy49jZr
 YC6I/QEqbWim1OoQYzHXInjb6Q==
X-Google-Smtp-Source: ABdhPJzoRmGGLI8WVPnxM7oud4VBQbrA5PgTbrGlwdy+hH6OXaJYRZjRb0UVH5lYi+efCVdlFZN7eA==
X-Received: by 2002:a62:1d0a:0:b029:1a9:8b33:a1bf with SMTP id
 d10-20020a621d0a0000b02901a98b33a1bfmr19012878pfd.32.1608628560561; 
 Tue, 22 Dec 2020 01:16:00 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id t9sm13088468pgh.41.2020.12.22.01.15.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 01:15:59 -0800 (PST)
Date: Tue, 22 Dec 2020 14:45:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201222091558.mhqf4oytviwc6b3h@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
 <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18-12-20, 16:51, Dmitry Osipenko wrote:
> Alright, although I haven't pretended that v2 patches should be merged
> right away since they are fundamentally different from v1, and thus, all
> patches need to be reviewed first.

I agree. I have done some basic review for the stuff.

> If the current OPP changes look good to you, then please give yours r-b
> to the patches. Thanks in advance!

r-b-y isn't required as they will go through my tree itself. So if everyone is
happy with the idea, please submit the patches separately (fixes, improvements,
devm_*, etc).

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
