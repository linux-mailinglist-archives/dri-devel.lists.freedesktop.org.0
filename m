Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2462DDFCD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2BB89C86;
	Fri, 18 Dec 2020 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74433892AC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 07:14:58 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b8so944330plx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 23:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5uBH5KsWopbV7FffwP9cu3qwTCPbWsa/gpWuvPcUSsg=;
 b=QAa+QgBNWGXQOzLHcEttslyMX7yfVRFnmsie63URsvH5GVYmCfqLASAvZuwYX9MIET
 eDmE1hBXyewXRMKiWj91RDHrjpb/kMVBkEeGid+6WGS4/m50KcVQrRCW8T8QrPc/NQ/n
 xkFA8qANdUY/ZMDZ1U10ACf2taGB60mF9xbpsuylhp3HoF/iXl+pGW94NzxojOGrxEL+
 jbM/5E7N+gPH/W3t8wPwMcbtn6s1VbaU8LAIXwc8wN+nbdu3UYGXyxVvioFI2s3fGdha
 qUWYb/n/DIAy3pLKM/lOTXvtnloCMYB9AUwFndWYRMY4bs1NSawqpvTYjUnjhU9MTH8e
 72jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5uBH5KsWopbV7FffwP9cu3qwTCPbWsa/gpWuvPcUSsg=;
 b=r5rdRmNE20e4rnMBv+x0tkc+KlL+7kd9PZlxhY7aclf7XR2PF0ieb9mXvQxThr3gyV
 IK/2b1w4AFCj9xVUA7OtR5S3FiFMIUhPPpuyXAUVm8flf22Siai2DbJnmShjvxx1W7gt
 E1Elduq6y6mMqnCp0WY3kvuqv28+RewEhT21AdExE0JtZ2Tk6OXUq7Bdqf0NH0n940L+
 3hLpBBstRLOfeOfey2Jpnqn8igJnirfRjLI0RgnZgm1naqgUVongLX8wi/hk5zTzXhBz
 yGb/McFemUFB16OT5wfy2bof1Y/JHqIx7kmPb72nkyRLV2jTT9qPM1kdIXdnG9Qh11yQ
 rv9w==
X-Gm-Message-State: AOAM532wjPpBeOG4HKlGBMu78lfIPzI3t73rPEqbCd2l7VSha192IAu+
 mTp6sMxOE+ZbWHVl51NAV1k7sQ==
X-Google-Smtp-Source: ABdhPJxh6Vc+BoEp2nvhSj4YmNHb7ku5mMkwmUaQUKeZHUbZ9rzCY6oJyHfeJDwsJp2g/i5HDfSMhg==
X-Received: by 2002:a17:902:8f94:b029:da:d168:4443 with SMTP id
 z20-20020a1709028f94b02900dad1684443mr3091172plo.57.1608275697958; 
 Thu, 17 Dec 2020 23:14:57 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id j20sm7721737pfd.106.2020.12.17.23.14.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 23:14:57 -0800 (PST)
Date: Fri, 18 Dec 2020 12:44:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:32:02 +0000
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

On 17-12-20, 21:05, Dmitry Osipenko wrote:
> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
> power consumption and heating of the Tegra chips. Tegra SoC has multiple
> hardware units which belong to a core power domain of the SoC and share
> the core voltage. The voltage must be selected in accordance to a minimum
> requirement of every core hardware unit.

Please submit the OPP changes separately (alone), it will never get
merged this way. Send fixes at the top, any features you want later in
the series. It is fine for you to base your series of patches which
are under review, you just need to mention that in your cover letter
for your platform's patchset.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
