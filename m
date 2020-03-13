Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A471018606F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431E6E267;
	Sun, 15 Mar 2020 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7966EC3D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 17:16:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r7so8295968wmg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Eqg2D57NGypJeQM7MhiMjBD9eTQ+XWnQ6tOgh9VYzPg=;
 b=GfpGJJf8jdD5hvEZ9qPjhmJSoxo3e4jgo5CXvygHAM+2QJPUnQGxgH3uES2Kynkpd4
 T6ATW927TaBZFCRVrNO170pUUV2oW1VQbb+Pexs0ZoOzJkDFAd5UyC6AZMYRUVFm095y
 IkcVD4f+FvTY8CtYEgV2DY2o1mbRUANwOHxkBIP37vtgNzFrkkQDbvXS+mWOsrsn5DGP
 gEO8LlEKRjsHdzu32a8Zv2sKCjnNA9JMK1m96aENNsalwtpPCqB7Vq/otY1b4E8n+Q21
 glAgkPcq3G2Hd8vv/mEHOpfMtESQYAYkl9W6BYLtnfQ1hAid0M6CcWidFLKlq36v9zAc
 LL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Eqg2D57NGypJeQM7MhiMjBD9eTQ+XWnQ6tOgh9VYzPg=;
 b=DR3rp6uHmKAGLONSZCVvnIXZKENdPavchUW7T1deeTwQHmUpmJb6Tbxi3y5FAPjKFA
 LQFlmULiY4CQ/2Qu6KDpLYZHQPTKaou0WiXNPYNwdRgDteckmBNSsiTdK1lpLMyUZMZo
 pxg1pLxw30OXsXOw5ylfAnHlv5fZJcBwnKIfSm6/nXx4teXe1Z2pQLHWwKbb+hv3CEF2
 nbLW3mScqNhLNCZP1zjPwqkpl2bO008JZ09iDU3wSvOxVb65OVTmaZOv9ja5QEH7z3s/
 laaecch3foDFVuRrTlZEW+G9eF9HZQAK9E1Ya6/qWe7Yz6yfRLImmGEU1+twHmLiUJEe
 7jBQ==
X-Gm-Message-State: ANhLgQ1N9bIcjgIadFiG+9S+qcSAGhCii0aP/ktDsl89uxFp29o+eanx
 EtMsdiZ6Kly2Vzr/1AP4O6t8PA==
X-Google-Smtp-Source: ADFU+vumzHSTSx0NnmOYLAmGcl4NJn5zSn0aH51pn2PnfTIecwwRlYBGAj9fxcb0ea7+lXVvBBbhJA==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr11581854wmc.84.1584119802734; 
 Fri, 13 Mar 2020 10:16:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id b187sm14223421wmb.42.2020.03.13.10.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 10:16:42 -0700 (PDT)
Date: Fri, 13 Mar 2020 17:16:38 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v4 2/4] OPP: change parameter to device pointer in
 dev_pm_opp_of_register_em()
Message-ID: <20200313171638.GB236432@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-3-lukasz.luba@arm.com>
 <20200313101524.GA150397@google.com>
 <3ac8ebf8-9db0-d168-8b80-f7f5ba345f86@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ac8ebf8-9db0-d168-8b80-f7f5ba345f86@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday 13 Mar 2020 at 17:11:45 (+0000), Lukasz Luba wrote:
> --------------------------------->8----------------
> dev_pm_opp_of_register_em
> ...
> 	nr_opp = dev_pm_opp_get_opp_count(dev);
> 	if (nr_opp <= 0) {
> 		ret = -EINVAL;
> 		goto fail;
> 	}
> 
> ...
> 	ret = em_register_perf_domain()
> 	if (ret)
> 		goto fail;
> 
> 	return 0;
> 
> fail:
> 	dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
> 	return ret
> ------------------------8<-----------------

That works for me.

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
