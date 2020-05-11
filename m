Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68081CEDC3
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875EC6E864;
	Tue, 12 May 2020 07:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238D89D7D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:46:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g14so6656342wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8HihaMjBho7yHhoZ4dXDWrBXozE3xr0NvWok/3IgXso=;
 b=KTJtUy+xvCilgtfASvMVkrHFxJGWQd6oQfRtMj53UFUDKm0GLZdcKmysVquVdcGnNQ
 GnLnowb53q2mnDekrftfm5idSn2La4Hwi3EQlRIr2/x9kLZEGljvyDzDJ/tH/iPMhCm1
 Br1Mj0mQ+w2yON0HQ2T8K1qFr/JqndsQWJkbeeocTf/p+tdDaBtBm97H2lzKg+T6eaZa
 e1c0Mmv7ay3WSrdGzzxq+HftjVHi1YFqLO/rTY4o27q48B7uXHJnRU8plAj3pMPpDMjc
 48oZp2j9ep2hx9TCcvQ4njLDs5w+TaPPZM4SJGoDmaM0Jh1BZ2wDTD7I2hrixnS3uVeE
 pxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8HihaMjBho7yHhoZ4dXDWrBXozE3xr0NvWok/3IgXso=;
 b=VFRwtjIIBdnD2fHfef7sIzTrfqQuvqMiWU8z8XQl8f1g0whZVMcsW/Dm8dFnxAbvF/
 GGJOCxFHZKrInmj/1R3/KYiS1eTbFTS2POULwhMA6gZtZlGVZc9CA29/uy9okzCkA/R+
 fpgiLNiDvAVbHnW1ECdLk/KHWMI2ouaBpRFCTKuHwsAKNu/fS5t53Bhg9y3SPGhAfBZH
 hn7/TqVMYrdPqUqFFX1sk+vtislOFYKQUdbCArB1gyexVVavbcEdhmakrvJU79FHjiaF
 MqNwH9ZluqC9QdhfpWfCX/Nhdszb+/2ShfSQaFcws/pYZrkiJesKG+mxjIWjv8AK5SWl
 TWFg==
X-Gm-Message-State: AGi0PuZVHnZWkkRKPwCcQJ9/G35JTu/2JNyu7fF5UIqIh3iSgag2XcEE
 2qKsS9mSNvCRcqItjxbBnmx8WQ==
X-Google-Smtp-Source: APiQypK+52M5jh5tMkIap1YctDwL5nM0Q2YdPkE9mtpXjfSY9F6Whlp3f9IAQU+9uwYyfn1ELFgsiA==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr33216701wmj.185.1589197588860; 
 Mon, 11 May 2020 04:46:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id w18sm17682226wro.33.2020.05.11.04.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:46:28 -0700 (PDT)
Date: Mon, 11 May 2020 12:46:24 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 01/15] PM / EM: change naming convention from
 'capacity' to 'performance'
Message-ID: <20200511114624.GA11091@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-2-lukasz.luba@arm.com>
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

On Monday 11 May 2020 at 12:18:58 (+0100), Lukasz Luba wrote:
> The Energy Model uses concept of performance domain and capacity states in
> order to calculate power used by CPUs. Change naming convention from
> capacity to performance state would enable wider usage in future, e.g.
> upcoming support for other devices other than CPUs.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
