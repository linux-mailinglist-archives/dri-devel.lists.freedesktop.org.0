Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD22C5B2D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 18:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32EF6E9C7;
	Thu, 26 Nov 2020 17:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3696E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 17:55:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g14so2999593wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 09:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BPRszRD8WTfKhM146jvwE7ROJeb/YEp7F6Y/2g9JDi4=;
 b=fbrps8EkD/3MR9uIJ0J1EC6MM9Tkv9RlPk2G5NBCs1ARhYwnMgLjsoRlZfYxiLwc5U
 K89YxFBROltPivjF2ZPlzEId6BWqEGIT2CaueuAJevfLAOh4zkMgTUlhMfqla4YOuQ9s
 wun+7CABDpLBEvn4ia7avA2kthvx1g2eFxrcjYVUwIpIoG/Cf/4Np3H1ZuHP5i7Wdky5
 A3hbzs3W1cxkRd1NFY22iShEpVBhvbo3Jw83v3Q/ZUJTem/MNZEj0SCNWCORVdDD0B5l
 Ia9YzaqZDlJwHHpSG8pFXOBqzg0XtVR/eWez5L3zq0bel1hEEnntAYmbVwIxkop2gcl1
 8lnA==
X-Gm-Message-State: AOAM5303xxXsPjGpkkHQ+Kwk+dikUxdLw6VANyLkKtPHzuJ4saz/iDaG
 juuhRxd6IlAqHpStxeH4ADw=
X-Google-Smtp-Source: ABdhPJxsxYEkexSA/U6bdyPrIywe4NRgTwpSBxzuJu8phtScvujbHSVPGbFkYB7FIJgapImAMRqbow==
X-Received: by 2002:a5d:44c1:: with SMTP id z1mr5157850wrr.375.1606413343777; 
 Thu, 26 Nov 2020 09:55:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id a21sm8938734wmb.38.2020.11.26.09.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:55:42 -0800 (PST)
Date: Thu, 26 Nov 2020 18:55:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 18/47] dt-bindings: memory: tegra30: Add memory client
 IDs
Message-ID: <20201126175541.GB17141@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-19-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-19-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:54PM +0300, Dmitry Osipenko wrote:
> Each memory client has unique hardware ID, add these IDs.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra30-mc.h | 67 +++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
