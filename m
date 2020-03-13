Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EEF186061
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6793D6E223;
	Sun, 15 Mar 2020 23:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB06EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 17:15:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t13so4769705wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EiAZ8r1RK4eYPjDEt/gPiQ4hc4RczwbEBzIiaGohL7A=;
 b=Y6MMbku01pHaOoSgGbj4gF3V6x7FB1fkNAjJ6ru6WyqJeOLaM9BYbK0Ix5GiRzvNyK
 JIioY1ozgF3HVo4Auv/aymm6AZFpDclDUVmdfoDPF+KPKip5Yk4kG7Hly9cTf+rNIbjt
 7MLho2yP/uxhsxbFwElwAMRIDoxKMELy3GerALcpDAGTG2KnGEZ+GqcbM0IjWFUDhr7q
 rowpPLYZoUSujhlAEl+M2aZSrzgSsZCi5RH5aISnBCWJvXcUUYCU1KjnPZLcSm+y37Rq
 sstjUD42VHXtFuUYk1V6LrY/wCYZhaFm3tgsnEUbTCcAXDxIK+sON7MnL+fUwV5dhLoH
 PtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EiAZ8r1RK4eYPjDEt/gPiQ4hc4RczwbEBzIiaGohL7A=;
 b=DWryXXu8Wp0cv1MzdpI7YCh2UdeskSLfKhqaKX+V0uwBSgRlYs1YjvaXNwYCgZ3pbA
 sYf/ZiiIhPOj4WLw5P2tfMjAcY4cFy4wD9MH7ZS2TqmDbxAGlQIX023a5rLxd+JOjBwd
 ChDc675DeavDez2nXJbeAnXHpLNt1Hx8QARfT3pN5DFKkksw4tj+o82RFXeUjoZQhWGX
 RtvbebzKjGpY6QQPFsGhZqAdRHhxU8qf8CNP+xZx8U1WOIfOBXHcAmAPUjlHZ34Ji7SD
 s6kT/xBtSWGOS+gEOAkw787/2CKZSrupa8eR2C1iw0Y3e4HtiIYkvJf6A5raYDMEcctB
 L+fw==
X-Gm-Message-State: ANhLgQ1XmNvXg5+42EnOQRwUezU9LIIp2SOUkGcpkn2K272qTMqjiRHP
 beF6GrTqaRmt0XQ1qJQjK6GgezGrj9t/Tg==
X-Google-Smtp-Source: ADFU+vuhetFMtP2EoDOpiocI9rZpw5aJIjO8D6ESXO0czFCY0ade8WAwSU18BkQ9bFFVg+JYF0INNg==
X-Received: by 2002:a7b:c414:: with SMTP id k20mr11747450wmi.119.1584119725823; 
 Fri, 13 Mar 2020 10:15:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id s22sm16474638wmc.16.2020.03.13.10.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 10:15:25 -0700 (PDT)
Date: Fri, 13 Mar 2020 17:15:21 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v4 1/4] PM / EM: add devices to Energy Model
Message-ID: <20200313171521.GA236432@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-2-lukasz.luba@arm.com>
 <20200313100407.GA144499@google.com>
 <bd1233f4-6e8b-23d1-e5aa-7c904fbd1bb3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd1233f4-6e8b-23d1-e5aa-7c904fbd1bb3@arm.com>
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

On Friday 13 Mar 2020 at 16:49:24 (+0000), Lukasz Luba wrote:
<snip>
> Well if someone would add EM to its platform and call this in
> hotplug, which is used as cooling method, will see a lot of warnings.

Right, but I guess I was arguing that calling this for CPUs, even on
hotplug, is kinda wrong.

> I would rather avoid stressing people with this kind of warnings.
> This is under control and nothing really happens even when they
> do hotplug very often, like LTP stress tests.
> 
> I agree to add a print there but warning for me is when something
> is not OK and should be investigated.
> I would prefer dev_dbg_once() to print thet the EM is not going to be
> removed. This will also not pollute dmesg in many logs.

Fair enough, a WARN is maybe a bit over the top. A debug message
should work.


<snip>
> So these small changes will be present in v5. I have to wait a few
> days because there is one change to devfreq_cooling.c queuing and I will
> send v5 with updated patch 3/4 rebased on top.

Sounds good, thanks.
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
