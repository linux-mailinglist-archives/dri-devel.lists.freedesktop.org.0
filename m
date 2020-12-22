Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8682E0806
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7166E84E;
	Tue, 22 Dec 2020 09:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7756E270
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:55:59 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id g18so7975753pgk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vFzkf9KGKvhutZbig0u7i/t+IYvhk4nnFQKLcFcxsq4=;
 b=vAsAJop5QL87eRDzT5DTHMtwoNPt0CQSIkdTqkJeziTI1AZMtMAcIEm3Kl9fhnTk5V
 vB/lYkBRouI/12yFv6A1dCSOIC7zvTsWExhCNxYa4+Oefx74oga8DDnN983sE8WuR0Lw
 A/n6+TWPt+hiOGv4RVjVlrk029VE+mVsDRs23XZwxscocW8GlofyFgohPX99nF5S7Xwf
 uRZL+JFGs5YKyoIHowFMNinq/TGTNXJtfDFp0L89tHOseHc6j2SMhTv475d9VkLlcOL+
 Iu/sAsOo0E5YMGvGAyoXhWoXv1Ygp7453JTCPAWJO9u4w7D6CKSImKmQS5VN3jjIJN38
 c4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vFzkf9KGKvhutZbig0u7i/t+IYvhk4nnFQKLcFcxsq4=;
 b=Rzia2DHmtOU1TYI6GKse3PSmeUCupJka0WXmtr194pvRjhg9+f/6VMY1wbqXYINqUb
 DSHPzLfWnP50GHRPxzj1yifH0E9BFDv/vRmx0ryrPwEhSuxPc6iD5PL2tFGYjHZzOObh
 EaV7rjcsO8Q+zKl3oOF0ylgRkofRJgXDy+iA5qZ3R0cYxZ7VgSGA9Hlhj2t7eK/tXRx8
 qIJixsSLKNSvw9uyvMbKMcSO/eObHJGnOOD8HKOIUOQktF0UQV+3hQ0rHe/NvKwbiFoQ
 PiLu7vpTXYEPBW+XyKuUQdUb1IpfmO6YrzmjNGmbhFMDsDkCZV8GTl+hkUtA2ILk9GFZ
 IwEA==
X-Gm-Message-State: AOAM530+9t+sP28wqWTVyu6RcLfmtUzenjjceOYOa5QDayqxuOIKaYXv
 2k/zDpbpC0ljT8D+Dt3D25x8sw==
X-Google-Smtp-Source: ABdhPJywc6LY9gPB8aIXdU8FTmnJRcbIf3Irdo/T2lGMg7jN2SK9J2SNLPjpJEYbiKAaBbTsluyTwA==
X-Received: by 2002:a63:6806:: with SMTP id d6mr18604366pgc.205.1608627358914; 
 Tue, 22 Dec 2020 00:55:58 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id t7sm19377680pfe.179.2020.12.22.00.55.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 00:55:58 -0800 (PST)
Date: Tue, 22 Dec 2020 14:25:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 13/48] opp: Add resource-managed versions of OPP API
 functions
Message-ID: <20201222085556.kce4dcwumk4u6ttm@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-14-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add resource-managed versions of OPP API functions. This removes a need
> from drivers to store and manage OPP table pointers.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 173 +++++++++++++++++++++++++++++++++++++++++
>  drivers/opp/of.c       |  25 ++++++
>  include/linux/pm_opp.h |  51 ++++++++++++
>  3 files changed, 249 insertions(+)

Please send a patchset of its own for this patch, along with updates to all the
existing code that can make use of these.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
