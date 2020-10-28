Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A588B29E5F2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30F86E868;
	Thu, 29 Oct 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2E6E550
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 14:46:32 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y14so3034875pfp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ywjXoX2kkK2KmqL6ZyGoB6Pybvnry+Rvqj9uaI5d5iE=;
 b=X5W234U1YTYXSeJeyK2Vk+eLiUVBUfulNxLgtgDTC7Y2iq0ShIDFDyJL/pdwnwYUa+
 OEYlEzLQjjCTHnrkgNNR7g00BW8ESFAEEQT1XcoJj6ZFN54o+wKgCxjD+O60PhuDQ7vD
 84AXSoKF6QrULCiwA8LXd2DmMUV2GG7NtSjIJ6BviQWr4LdyVlTkrWrzwGw1XwH04BXw
 wUann1odVUWJfSTWmw+2UN7YWM3rbwimRI5KzkuOeG5fKlaBIz9oc3Vs4E2lZJFK3gLq
 v5fMgJHzOEzcx8IjzPNRfwrnMS/3QWCVvcyZ6Acqu806VBeEArIYp+nxMc7wfmvp6hZI
 ASUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ywjXoX2kkK2KmqL6ZyGoB6Pybvnry+Rvqj9uaI5d5iE=;
 b=AIiAaVdSjwLYl0HKcPfM8mXrIkvCpN4L0j5kyk8eNKFu+EncuyFsBc6Nk97u8dZaFE
 NJXKJ1uFrmP9ntJl6riFjiJ1MLvhb9zs+jkRbx9B3/3R8NjrXKNFS8LC4A5xOD2G2Zq8
 wMYhnBgiqydKqWN0jSTkwe5EBNrQdjJ1gGEVdiVCIfb6TS5c+uangm/xbfyCOAPr4WnV
 qxtHKIqDT4JXxewTaxo7aWQ/PfsRHX+niS42U6qd2yH8e+uA6/f7C6qddh4Ki76Whf/2
 fXVph4dWM+HTI8fHkhKxm8z+cuOy2oP2hA2FkpFiTvoFA8DBa2LWf0DkRh6rE/rogTr3
 V81A==
X-Gm-Message-State: AOAM530PIuZ0dsQoLIlCWjaRMdzBrBSv8h5jnliMWci9wZLMIwgJr5vT
 c3JlmbS87MGepCfN78mtZSWv3g==
X-Google-Smtp-Source: ABdhPJxGfGHUfZR5/hgoqBA9Cp4UZZF2zoq2xSX/vVSEcnm+GlrQO4gwem8tQVD3yMYhu0Zz27HGPQ==
X-Received: by 2002:a63:e444:: with SMTP id i4mr6715119pgk.304.1603896392305; 
 Wed, 28 Oct 2020 07:46:32 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id y5sm3087840pfq.79.2020.10.28.07.46.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 07:46:31 -0700 (PDT)
Date: Wed, 28 Oct 2020 20:16:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
Message-ID: <20201028144628.qm2t2hbzmouqkciy@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
 <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
 <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Frank Lee <frank@allwinnertech.com>, airlied@linux.ie,
 Viresh Kumar <vireshk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, kholk11@gmail.com, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-10-20, 19:02, Frank Lee wrote:
> On Wed, Oct 28, 2020 at 6:29 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 12-10-20, 21:55, Frank Lee wrote:
> > > From: Yangtao Li <tiny.windzz@gmail.com>
> > >
> > > Add devres wrapper for dev_pm_opp_set_prop_name() to simplify driver
> > > code.
> > >
> > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > > Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> > > ---
> > >  drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
> > >  include/linux/pm_opp.h |  6 ++++++
> > >  2 files changed, 45 insertions(+)
> >
> > On a second thought I am looking at dropping this one as you haven't
> > added any users yet and I am afraid it will stay unused.
> 
> Now it looks like that dev_pm_opp_set_prop_name() is used relatively less.
> Maybe we can wait until a caller, and then pick up the patch.

I am even wondering if we should be adding any of the devm_* helpers
for now to be honest. Even for the other one we have only one user.
Them major user of the OPP core is the CPU subsystem and it is never
going to use these devm_* helpers as the CPU device doesn't get bound
to a driver, it is rather a fake platform device which gets the
cpufreq drivers probed. So the only users of these devm_* helpers is
going to be non-CPU devices. Considering that we have only one user
right now, it may be better to just fix it instead of adding any of
the devm_* helpers.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
