Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D64604B6
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 06:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87266E8EE;
	Sun, 28 Nov 2021 05:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAB66E10C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 05:48:13 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1y561xCxzGX;
 Sun, 28 Nov 2021 06:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638078060; bh=euRkxERs/Vo+Ncwnc6oh+QQPM82cBPQuQuUB2BgzLnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LY3ChcHhLpC97uysDR/7nppfcxComB2E48G/CSr/GJWMZpY0nUf2Ozt/QdF3bO27D
 KVVscNOrPrvjDeFDDvD8xGhXTpYyqBgTMYDKLE9wEICL5bDVx6hBtk8ejpU6BrId79
 vbWsoB/iTmCLm+bLT0tuvFrL4/nVF7nyYWv4tALAyWWX2iU7ISeiyJa/5FSEeoDtm6
 egb154gg0fV3kqNymh1/NYzbwJKJ0ezYVFUVXr4cbByKt/7l8pm0u2iIP/DReChzc2
 cj5XNAxcI2vANrMDBXNTTKYQJcaUTS+V2hD4R7+BDKXqWKOMu+D+3chFvhgLVLi9p7
 Ujd618hPUSMCQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 06:40:56 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v15 00/39] NVIDIA Tegra power management patches for 5.17
Message-ID: <YaMWaKqQ+c8G08mJ@qmqm.qmqm.pl>
References: <20211114193435.7705-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Heidelberg <david@ixit.cz>,
 Uwe =?iso-8859-2?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 14, 2021 at 10:33:56PM +0300, Dmitry Osipenko wrote:
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
> 
> All patches in this series are interdependent and should go via Tegra tree
> for simplicity.
[...]

I would suggest pushing all the fixes to the front of the series (those are
at least patches 1, 3, 17, 27-31 and 39).

Best Regards
Micha³ Miros³aw
