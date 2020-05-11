Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE91CEDC7
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B92B6E853;
	Tue, 12 May 2020 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEDB89F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:51:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e26so17733175wmk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oiiy7yzaDZrfNFpAYBwGY7qa9RdD+rUsUN7jZCiG/Nk=;
 b=IZ1GX1h8kyIJjla0cM+4zc64f4XSRKtANiqnwZRYC6TXvTREkBTOmgF97cWJX4JMN/
 D/hplVMrCmD687Q5l5bjArc0/bJ6CNx5Rcq/W1h6i0myjroW0TzhSMtwawnkpMDfsTHq
 lqQ294S9l97u/OG5FE2Wiy23OxON2aIG+TE1iUsbgrx1gS1LXORQ2ETyZ5FHCdJBoH9+
 1oUqEX2YHtu+WMiP/UojhLfG28tPH0V7OaTzaqSC6sElvY86pIbB1PbMl0FJ4CzfJ0M4
 13iRj1wn0M7XLyqegXuuzYmIzCfr36AWq3H0s+vdE7dKO/T9b+qT2mX+yhE6fUk6dCLp
 DPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oiiy7yzaDZrfNFpAYBwGY7qa9RdD+rUsUN7jZCiG/Nk=;
 b=ho8IVPd4pIBOWPl6qEkO5LtsOc9op/2GyOgrSoBqITgM4ubwCo27wC05JAn2Tgil9y
 wWoGjiF+TZxVNSdKCJCrD+xSsiF8wcRjWa52kg9t4qa5Yn/rpikwKaMkFRYmD9+50vsa
 fZUVHsM9MjE6tVsLtIfwF6mTUEZnYYy7EJbeEzBpSFWhyY1nnFNnQW3i6mUwO9CoodIE
 aJwYlHfM/f5/ZJbRvwzJUZTNOF3TAcbRFtartO7I2eQUe2RcXaNyQWOuOhTP7IJwz3sc
 XkN/DcTNdg6QncKyHZc2lJC0tEBrl38GLTQL1qhZFyZqK3hQl869mKgKWViVJFpZIgEP
 vtWQ==
X-Gm-Message-State: AGi0PuYtF9nVTu1R/DV30/7x1R0ZapIonxuItAOzAv+E4aLkBJFmw3uT
 gsotcdg/ZMZ4Y34CHLkd+0UyvDy3e7DciQ==
X-Google-Smtp-Source: APiQypIvoIlZRhIOKzLOkS565PA6K4LY8QgOBxFSsIjfZbiD6pG33iH6F5Up0icIdMnR0Z6CC5DX/Q==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr7883523wmf.103.1589197913440; 
 Mon, 11 May 2020 04:51:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id f26sm26316916wmj.11.2020.05.11.04.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:51:52 -0700 (PDT)
Date: Mon, 11 May 2020 12:51:49 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 02/15] PM / EM: introduce em_dev_register_perf_domain
 function
Message-ID: <20200511115149.GB11091@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-3-lukasz.luba@arm.com>
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

On Monday 11 May 2020 at 12:18:59 (+0100), Lukasz Luba wrote:
> Add now function in the Energy Model framework which is going to support
> new devices. This function will help in transition and make it smoother.
> For now it still checks if the cpumask is a valid pointer, which will be
> removed later when the new structures and infrastructure will be ready.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
