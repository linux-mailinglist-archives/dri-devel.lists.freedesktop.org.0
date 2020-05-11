Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC821CEDB8
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127566E849;
	Tue, 12 May 2020 07:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62E36E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:49:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k12so18078587wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BjHVuVtBWSdENXXYiinZ4uI8mae/pV5Z0nfAWffhAkY=;
 b=k5UvlXD0wz5vs3V4Z1hLq6biCClQbT+SzjjXqeAWFhwqVN+GA6qeV+oLnHhDuhXDcw
 MVX0TgpYBV2DjO6YTj2/kloLSz+106Qm/fu9Fbt1wd7Q9aE3k+RpBPuqoe4B/zYzxdUq
 BWm+yMkxszNTBcpnFcQs0Byn+efwRCTcgItZvKIAw201wqDgUXYW7R4/7Cfdosha29v5
 hG7krpuspf6IGF5pvCDjIZnLghI9pcVt8KAQQzkY5BjrBvfl67q0XBW22UMkTBRK4S4F
 DLCrrH5eHw06BLRl64MM4YyqwuAW3hNxzvNkr+tVHeL/B126T/5EI79diNMMOpSg7Ksv
 7m/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BjHVuVtBWSdENXXYiinZ4uI8mae/pV5Z0nfAWffhAkY=;
 b=OriBfCDL9mIEQk/6u9d25e/aja7t6eUaTMnnz4tPQm2ZQnF4qAU/oqbExZny1Ivzsb
 dW2amVTiny9HuuqsREZc5S9TR46bQhdMjPR4HHPsfjqYMRFEzFyvz79sW2MEa6D8ZtBf
 0Y6Oxcc0krfJtDNlTZvRTu3a+7RUTzD4XpWR9j5Li1qkQMgQ1mX8/auIA85KaMtO20sF
 wJKiC408MH+IraQ/sd1ssU6Pb8vOtIOVSLijYsN5BLzkmeZOX7U04H9MqVPGiCl75nye
 7X22C08grXP5/6EwEYMPll5HwjEvHzL7+hLh/SxsUGxCE3DKgsUjsF24PgZYcE7/cYwD
 elnQ==
X-Gm-Message-State: AGi0PuZXg3wGfol/HjdXAxpLdf3GVv/Q6ZsVE90ISga8Gj2kBUcvcOYM
 LRozQe9ZShQ824QK//aXXi5s8w==
X-Google-Smtp-Source: APiQypLt90h3E4QOKCct7odHvidKqDIEKMSux9lbzqVHNQsX/QafgI6SnH5ciyxpl3mgK+o2GNzOyg==
X-Received: by 2002:a1c:df83:: with SMTP id
 w125mr22393555wmg.140.1589204939170; 
 Mon, 11 May 2020 06:48:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id a24sm26771229wmb.24.2020.05.11.06.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:48:58 -0700 (PDT)
Date: Mon, 11 May 2020 14:48:54 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 07/15] Documentation: power: update Energy Model
 description
Message-ID: <20200511134854.GD29112@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-8-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-8-lukasz.luba@arm.com>
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

On Monday 11 May 2020 at 12:19:04 (+0100), Lukasz Luba wrote:
> The Energy Model framework supports also other devices than CPUs. Update
> related information and add description for the new usage.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
