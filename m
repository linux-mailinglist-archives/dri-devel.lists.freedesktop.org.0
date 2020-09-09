Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EC263E80
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A016E0FD;
	Thu, 10 Sep 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE5D6EE3A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:08:11 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id o68so1970642pfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hHbPBPqCAjeHpFptYktHnZF2Ot4j4iCHuxaSsZ+eCnQ=;
 b=m4KHcZLZ3vphfXLl8Z6uPW+Z5xRc7prauxsfl0JLhrjWsiglWRJP4MpIyU91H/iLho
 zrypWq/9xIvYPiotVpXou3HNQ/xOAUSdnA0p1Aeb2P6B8wsSa9RZ/k3wQsg8i79uXKFf
 oqrgkMysLIqLInktyZ0qNeCahTkBgCR1FU+Sdh8z08fzYT7FIdiuUuOj/THP1lBYxblb
 crk/ICcFVagGGuLu1MtvSBSpBtzUON7VuahiwpKU9qQILtWVvIRGlEVE5GFGdKpbyIDw
 gFqItvEzQktmZxC+C5bsJupV5InVVkiOeLk+WlFuumCOeBab41igCm17UsYlleFsQ8ke
 LG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hHbPBPqCAjeHpFptYktHnZF2Ot4j4iCHuxaSsZ+eCnQ=;
 b=Jb1WRquooI/5I59wf18fRneApTZGG275MrD102JkxiVPUXED8L7Z1wEZ9MimBYv4KI
 0DMGnRXYZAqW6qyledmxNcrL4aIuCPP0oyiNWSBvraeQcnuWJRh1ihVsAo2WsLxfFsn5
 0KaCk8HDnd4DTByxgtJ1x+EFI305qDJaGt7f0fK98LfoncitBN6G00cOp2Fqk70RbNOd
 qLyLNKRT5LfiR520cRlJcxIYLiSGLmbyrlFc6kpNvmhbujhpIJOzeF0qPdVAhXCYdiz3
 gUl3uaDt8XQ4sVu750IkXkbfgmwMX0dKmBFJahmxmXY5QN7RlRDR1cb+/P4pgq66Q5PK
 UD7A==
X-Gm-Message-State: AOAM530+iGxt4VoS3Bns0AS1BseEiWjb51Ugag/Td8wrrimSRpY3I+7W
 cu8yVJS5uZnefXlFVzadT8aE3A==
X-Google-Smtp-Source: ABdhPJy2EZv/VIxB9RnTfqRMANkRu2WWxpNJfCDbS9BRC+1+0r57LjDxgPFYplFTRs+2i65+o+pECA==
X-Received: by 2002:a65:5849:: with SMTP id s9mr215399pgr.439.1599649690536;
 Wed, 09 Sep 2020 04:08:10 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id w185sm2619035pfc.36.2020.09.09.04.08.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 04:08:09 -0700 (PDT)
Date: Wed, 9 Sep 2020 16:38:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Qiang Yu <yuq825@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Clark <robdclark@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>,
 Shawn Guo <shawnguo@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH V2 0/8] opp: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200909110807.aw3q4bqxis3ya5ci@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <20200831110939.qnyugmhajkg36gzw@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831110939.qnyugmhajkg36gzw@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-mmc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31-08-20, 16:39, Viresh Kumar wrote:
> On 28-08-20, 11:37, Viresh Kumar wrote:
> > Hello,
> > 
> > This cleans up some of the user code around calls to
> > dev_pm_opp_of_remove_table().
> > 
> > All the patches can be picked by respective maintainers directly except
> > for the last patch, which needs the previous two to get merged first.
> > 
> > These are based for 5.9-rc1.
>  
> > Viresh Kumar (8):
> >   cpufreq: imx6q: Unconditionally call dev_pm_opp_of_remove_table()
> >   drm/lima: Unconditionally call dev_pm_opp_of_remove_table()
> >   drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
> >   mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> >   spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
> >   spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
> >   tty: serial: qcom_geni_serial: Unconditionally call
> >     dev_pm_opp_of_remove_table()
> >   qcom-geni-se: remove has_opp_table
> 
> During testing by some of the Linaro folks on linux-next, we found out
> that there was a bug in the OPP core (which makes the kernel crash in
> some corner cases with these patches) for which I have sent a fix
> today which should be part of 5.9-rc4:
> 
> https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/
> 
> Please apply the patches over rc4 only once it comes out (I will
> confirm by that time once the patch gets merged). Else you guys can
> provide your Ack and I can take the patches through OPP tree.

The fix got merged in 5.9-rc4, please apply the patches from this
series in your trees and base them on rc4. Thanks.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
