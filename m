Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA1135FB6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBAB6E434;
	Thu,  9 Jan 2020 17:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8AD6E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 12:38:12 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l8so2453045edw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 04:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RotMCjOJKktSIUBCGAb4BBJvwMzxDTEukuKk1C8nR/Y=;
 b=DVTb0EFtmqEPjuV03pnzZK8BsOoSGErBVKLIgk8UCu08OyrkYyp+HrCskvsX5sy5Ff
 7dgC90WFdqalh7qU8HwYisvMIeBkmy+stiyz7LUL0LjF2/5fICa+Z4jUYnRAwAV4kksQ
 7dZZUA2bit+LnZ4BIwweatxdmsnogHTuTJ2y1kqqYR2/oD1hUVcpiVL6nExK6EfOAQIE
 bqcVrcApy0/mju2Mt+SP/RFG4is3ocgdJpHtYhpE74dGn55SZ2FCKUSQmnx5qLeY5PyP
 qt9S8KPXnqjmbCkZ7ZHnvoc+ZArLCNgibMc4uWYw8FFqFFLTlLcbfckZ9XhF/1HEvSog
 eEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RotMCjOJKktSIUBCGAb4BBJvwMzxDTEukuKk1C8nR/Y=;
 b=O73Ftj75HKw+tam/KCbHCU8NBAp0VdoOi0QjRdlyXnTbKqdS5exfNHvEsw+kLFawaH
 5l871IRr0Hn+vEqBW/C1vUcEp3tyO9rE82hwB/1Vow6WPJWR40ORkebioxfN6B6dazD/
 ugO+NEHjTDuzMHanPZOuH3DpetyA/bSeZZxFL+vqOj93XF8NxUSWCzzqMfiZv8zbDaHy
 7O80u9++EqHVEW7wnkuDJFoAqvzHj8E3pXRIysvlEAO0xazdqlUO7JwOGetBB05TOaW8
 woIfXbIkpusN78OTVa3qMqK1wq6mdcV+Ts18rciwB46t3z5qoRriIBy6J8QwVUZDOTld
 zqbA==
X-Gm-Message-State: APjAAAV4dkjW9AdT9w7gc+J8+T7iz4FEObkStMJ6aIwzT0SM/SrO/GKu
 uXMaVExEV+ywMeB9VjzA5otfyqBzzwhkk64mR7w=
X-Google-Smtp-Source: APXvYqzi0WPsidDDmVj1R0p4gUv6jfBMcq5h5l5TD4QO3F5rD/GE1j0AN/0+zT53es3eTRwo2dDerj4WmIdMbbc4SpY=
X-Received: by 2002:a17:906:1a50:: with SMTP id
 j16mr4721042ejf.106.1578487090894; 
 Wed, 08 Jan 2020 04:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-2-martin.blumenstingl@googlemail.com>
 <a85f2063-f412-9762-58d1-47fdffb24af9@arm.com>
In-Reply-To: <a85f2063-f412-9762-58d1-47fdffb24af9@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jan 2020 13:38:00 +0100
Message-ID: <CAFBinCBYrNC+ULV6Y=77qogowkDZwM+H0bxOqPN4sT6q3krGfw@mail.gmail.com>
Subject: Re: [PATCH RFT v1 1/3] drm/panfrost: enable devfreq based the
 "operating-points-v2" property
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 alyssa@rosenzweig.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On Wed, Jan 8, 2020 at 12:18 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 07/01/2020 11:06 pm, Martin Blumenstingl wrote:
> > Decouple the check to see whether we want to enable devfreq for the GPU
> > from dev_pm_opp_set_regulators(). This is preparation work for adding
> > back support for regulator control (which means we need to call
> > dev_pm_opp_set_regulators() before dev_pm_opp_of_add_table(), which
> > means having a check for "is devfreq enabled" that is not tied to
> > dev_pm_opp_of_add_table() makes things easier).
>
> Hmm, what about cases like the SCMI DVFS protocol where the OPPs are
> dynamically discovered rather than statically defined in DT?
where can I find such an example (Amlogic SoCs use SCPI instead of
SCMI, so I don't think that I have any board with SCMI support) or
some documentation?
(I could only find SCPI clock and CPU DVFS implementations, but no
generic "OPPs for any device" implementation)


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
