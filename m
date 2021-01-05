Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE702EB0D2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 18:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53B2895B2;
	Tue,  5 Jan 2021 17:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342E9895B2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 17:02:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id 91so36850741wrj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 09:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tYopY2fL6CXBBPr+Io7iofacq52SjkW+6qo7DnbLuZg=;
 b=QT3kHkkQawIK5q8pxbOna44Gh3bj6kEue+Y8dUiY5BuXSHTU53V5LFg3T/8tnQ+nJ/
 JCsGr36ylVOETmLHFPBkc4RNu5hp3Oj0k/tlvf53skD9cd7TWztfW5BsHyczvVTGJdPN
 35nOUbPNd/pVcnHm937YkoppK84QAuZ5ZxzPKjyAxY++K3v0YDqF09joEnqW9B4LCQtp
 jnqDNFKWjIUOyWWN2qdwBUj4IYAOVskFsx64mKrpczW6fOqswwGoxU84MCboVjoJwWMI
 /aK+W4H45H2WqN2l/cbuxXeCL2J0lqzVthU7C4Jhq79ZQhWY209SM0ai5B1JrP+2AaRF
 TPOA==
X-Gm-Message-State: AOAM5339YKr9g30PKFkYlfMF2140Imy1l4wSiYV+4kgPV4yyLgMW6ZUW
 HAbnqgC3mOGtgSq3xtOMIOE=
X-Google-Smtp-Source: ABdhPJw3khmjPZic1mPiMYLc4bWxpVK1upa/cveVFaPiOk/3t+tr7TLU+XjQIi2pQmR9ANetF6J2vw==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr461023wrr.319.1609866124790; 
 Tue, 05 Jan 2021 09:02:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id h9sm177309wme.11.2021.01.05.09.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:02:03 -0800 (PST)
Date: Tue, 5 Jan 2021 18:02:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v12 2/5] memory: tegra124-emc: Continue probing if
 timings are missing in device-tree
Message-ID: <20210105170202.GB20651@kozik-lap>
References: <20201228154920.18846-1-digetx@gmail.com>
 <20201228154920.18846-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228154920.18846-3-digetx@gmail.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 28, 2020 at 06:49:17PM +0300, Dmitry Osipenko wrote:
> EMC driver will become mandatory after turning it into interconnect
> provider because interconnect users, like display controller driver, will
> fail to probe using newer device-trees that have interconnect properties.
> Thus make EMC driver to probe even if timings are missing in device-tree.
> 
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
