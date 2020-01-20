Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03F1430A2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CAC6EA3A;
	Mon, 20 Jan 2020 17:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158B26E9B0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 15:09:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a5so14858159wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 07:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ByBSacKRJKuzSIYiOQyT8J9CJv5HzmRfCVnRBxTEqEo=;
 b=qg1ZLvviVZfjbWUxveYlY31YKSPtpCoqGvUCxFFFmuSNhzrZG+8/JTUBew4MqF1QwT
 ZkjTqLHsvs275UZGLdOmP854e8vkiW0i8IheAE92enwVx5dgNXUWibw7xuJsq5IzFhhk
 pKzY/RUwbanMSqGLmJ0vUxWmHzbBOZqzoxp9yT0uRtho17C6I5oH1xMf+pTIjzSN3MZY
 H8HxiblWXheI6D/R+4rBvbQG0cc5g6adqj0TwfF4L2cC1eWieAELuSXvre7Nin13453w
 MgPO0mLx6I2rhlnxlc70+w5Qw7/m8lq2IEay5qYyHSQ30y8iTLRUAkWggiNl+AA9LLR9
 CgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ByBSacKRJKuzSIYiOQyT8J9CJv5HzmRfCVnRBxTEqEo=;
 b=GDq+XHuTYBvllx46a7oVg/PSg6BuaOSTsXA9JgP9lbUh1qfgEhH7dPQXg2z9v1ntAj
 JZ4pd8H4LUjWfdo8a+k4ZHYnMDk1DZ9AlxWjUAV50/KNOa424MpPwq7BN5Vvo559zvlH
 1BzaRruJHtVsUO7TgXxBKZVQRHFk9YbeaGHP6klUqMtX2HIyF8Owj9pwgGjHs9YQP1XV
 IcFXFNBZkM1aHJGWmfJJihsG2AXIzPFyQJLIOPlKiEJglMej0xGgWZjfsqnIq/PuQQHE
 oeajKSc0SDN3/of3n4c6SjkcBWYlb84ikepSSxthZvm81hP2g+Fr5fDEknYBUQ7H8hRO
 WLgw==
X-Gm-Message-State: APjAAAV9KzmTI0Gk33o7VIeHUtNIoORRF6sTSPnGhclV+n+IptGseK01
 rGh09eqfI2dGEp8WXIx1HYospA==
X-Google-Smtp-Source: APXvYqyH6QMzJgz4YZQ39CG1D478e9/BsTiziBKmrfafEV/iedUuTR3YTBW7pk8iuudU9KBXYjMY8g==
X-Received: by 2002:a05:600c:21da:: with SMTP id
 x26mr19321181wmj.4.1579532962450; 
 Mon, 20 Jan 2020 07:09:22 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id a5sm23285242wmb.37.2020.01.20.07.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 07:09:21 -0800 (PST)
Date: Mon, 20 Jan 2020 15:09:18 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200120150918.GA164543@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, kernel-team@android.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lukasz,

On Monday 20 Jan 2020 at 14:52:07 (+0000), Lukasz Luba wrote:
> On 1/17/20 10:54 AM, Quentin Perret wrote:
> > Suggested alternative: have two registration functions like so:
> > 
> > 	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
> > 			       struct em_data_callback *cb);
> > 	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
> > 			       struct em_data_callback *cb);
> 
> Interesting, in the internal review Dietmar asked me to remove these two
> functions. I had the same idea, which would simplify a bit the
> registration and it does not need to check the dev->bus if it is CPU.
> 
> Unfortunately, we would need also two function in drivers/opp/of.c:
> dev_pm_opp_of_register_cpu_em(policy->cpus);
> and
> dev_pm_opp_of_register_dev_em(dev);
> 
> Thus, I have created only one registration function, which you can see
> in this patch set.

Right, I can see how having a unified API would be appealing, but the
OPP dependency is a nono, so we'll need to work around one way or
another.

FWIW, I don't think having separate APIs for CPUs and other devices is
that bad given that we already have entirely different frameworks to
drive their respective frequencies. And the _cpu variants are basically
just wrappers around the _dev ones, so not too bad either IMO :).

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
