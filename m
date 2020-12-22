Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9E2E080B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822D66E871;
	Tue, 22 Dec 2020 09:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EBF6E141
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 06:41:45 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2so7887620pfq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mdb8ubeZUDajJW+FcHgYac1dD8MByc7AxGNoAnUULbI=;
 b=npm8TWA8O2hsE4I05GLXYUgOLq1zgQjekB/Y4euzum/q0sfwISRV8ojNFw9xBetHYG
 evQHh7Im53EF1KPazTUM6tG5aazhT/xA3W29tAzWofCmWnBLUvHwm07XeX/ejN4ZKNp+
 GG1EIaznfaIPh04fh8Vuf5DnthO72+88HGixBcUWvlVGWbNtuglnZU0e7Z08HgxGdv8S
 NU/vtGF3TDtC2JLVLs4AZIpRX70hZbTJkcb96VBSFOPBpkbXmP1YGrK7ObL+Aiz9SArD
 8vn+yrLPGr5ZiIMK5ZKv0qTkSfbBMVYVUkMsjTy7Z0aDg9Kb2OysaSGaZdGGmigLzN/I
 S2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mdb8ubeZUDajJW+FcHgYac1dD8MByc7AxGNoAnUULbI=;
 b=WinqpGHqN4V/3f79G2qm4ZtzYEFtsTrRwyauALok9MBVJZly34JnfF8sRAIgtW8vAH
 MX6y4MmgyBLc/6Xzlo60rNgAjOp+BSdgC3/+rOuH/Z/eEYISjeD1tEnVRuvWhaRxPc8Z
 ANeMc/m6/rzpgUSi2LmQToQ/imxiW4IOEiYLRDeVmFdoHrc8FbbCj2Vq4QhyOhg5AwfD
 lMZxRvz5YQGFWL9u1eCaOmd2FCLd4PiO43uLB5SNakyhl3I6yykajPNyZqHTZtXgMc4U
 cFBiWcTezVQeqaV1MFthE0MBPRBTbPeeyjKZDoryR6FpBDT0WlxtUW+Xy0j8CMhASmXE
 lhrg==
X-Gm-Message-State: AOAM531oPdrYbNaHv590K+CZE7EFgi7nUUAARuj9i9WiJZ3WGbxvjrfm
 tUIsOiS3/GJUz4K7LQitTXsb/Q==
X-Google-Smtp-Source: ABdhPJw7BD4Js7XMjl68MHqDPRxBWn/XxIVoOlLeKMWzpyH+qOtOrTPdNalPZDEVDwvJf8LazuKUiw==
X-Received: by 2002:a63:2265:: with SMTP id t37mr18196221pgm.336.1608619304758; 
 Mon, 21 Dec 2020 22:41:44 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id x1sm18440611pfc.112.2020.12.21.22.41.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 22:41:44 -0800 (PST)
Date: Tue, 22 Dec 2020 12:11:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 10/48] opp: Add dev_pm_opp_set_voltage()
Message-ID: <20201222064142.pidafbhcbrecz57z@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-11-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add dev_pm_opp_set_voltage() which allows OPP table users to set voltage
> in accordance to a given OPP. In particular this is needed for driving
> voltage of a generic power domain which uses OPPs and doesn't have a
> clock.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

We shouldn't be doing this, details in patch 28.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
