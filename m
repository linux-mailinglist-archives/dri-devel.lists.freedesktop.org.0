Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B31CEDBF
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E196E86E;
	Tue, 12 May 2020 07:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D136E478
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:44:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so11050148wrt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hpFE9CUsmF5QuTw9fCnRsO/HIcrfLKfZVWo5gx0AO38=;
 b=m0ElpsF0pRp5TglEUDXatsddqa+Pb36Mj0Ppynh2iPIzzZz0EgUlzEtzkWyZeAg3vB
 uBs8o5cgAfl1IJaebtKgziRr73o57iHO5kRqVLTfaRC9X/zbKfqE0X7WUY3tyIHVtzsE
 vFx9MY8AD+wURjQHSKOL4msglFChmdK1OF0GOTXEyOPCB+/qCeUlNUl3WRSD8mjpJY46
 hSQALRhOTEhqYS5oyb8QdeT0A4PD7fA1adHgJP7v3DqW9SxYfGkzAgGWjuOFXLrwzjzb
 N6qFsfSm3T/OSIzW2mqIAKD2F9YJwb6IdZnQgigtlyOUiCH7V2syhUCmrF3QsgphlAHW
 IDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hpFE9CUsmF5QuTw9fCnRsO/HIcrfLKfZVWo5gx0AO38=;
 b=bPFao5fSW90wcgJaMuHNpiP0rcrkQxOObN9wKhW53YzKEbDxFIR3Uc6/MBnDiMGlsB
 spsOMmJqOCV80UAgrk8Xwf4qQc8V+0ZMPetFEbHAGa/24/+WL3hw2di3jIyC4zgPEIJs
 J4vyKk10vRX5ngcqeBRoRPsZeRjRtc9x9S7q+yQU4Qiy85oqTpFT5QFjGsfN5yrcoHSG
 aryolfTkrBfeOMg8G/8YlZKeLeCwTuecD9jjgK8qSGrzC3DoMWTpiP7qDSNEO8F4jTUC
 yvnKIqrnah3bcmgPOHfzNFGMBJmJeFEiDaG0xgarS1nE0qEAboa6cLWCdatyqe2qcEUm
 NbWg==
X-Gm-Message-State: AGi0Pub4erowGMB3ubWrioDuuCY8nrxN1KzpA9d8NJYGaX9ng1cmsF2h
 DxrDwigpoXAUefjS8erSxLSJQw==
X-Google-Smtp-Source: APiQypLqeWUYDX3crs5ryt2QKIDbqRz/76rh57q7pYtJbxnpgj5n76IycVeDM/ojI700iAgxeVhE4Q==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr21053389wri.157.1589204686152; 
 Mon, 11 May 2020 06:44:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id a15sm18111170wrw.56.2020.05.11.06.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:44:45 -0700 (PDT)
Date: Mon, 11 May 2020 14:44:41 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 05/15] PM / EM: remove em_register_perf_domain
Message-ID: <20200511134441.GB29112@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-6-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-6-lukasz.luba@arm.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 11 May 2020 at 12:19:02 (+0100), Lukasz Luba wrote:
> Remove old function em_register_perf_domain which is no longer needed.
> There is em_dev_register_perf_domain that covers old use cases and new as
> well.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

So, as mentioned in patch 03, I think this one could be squashed. But in
any case:

Acked-by: Quentin Perret <qperret@google.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
