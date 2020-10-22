Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC8295918
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83176F3DA;
	Thu, 22 Oct 2020 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCC86F3A2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 05:12:46 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c20so400219pfr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 22:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2Zb63bH1NbEum/OLuzSIrhnLWeKUO8Zod+ndrWM7EmA=;
 b=Ju9bd5gphU99uj/yh0ufc8gQO+ePImeOwBqeesvMqPmC3AyeC0tO/3AyY71FcT8+UJ
 lhZWTwfk556SigBHRAMOs+x8SrDWcBTfqbt/rKeOSeiEtgT6Omg8FDoJz9Y8tVjy/mhy
 W2gpzNN+/VLnHnzOpW4uuZITN/dre75uqO3aoFILFRAcb3Fyub7jadMs9KCSgq8W0A+W
 XvDueW/cbwwS/N78UYnh07M9h5ohJTKWRx8DJqlXS5WfrN/BMHxA/wyRdGF3bMBvo3G7
 Azv+j0mVpLtSIkuEjWr8jdSb/cEP4Ve+suem9ZNycndWhPZeLNj0QwF5kLLQh69akiXK
 Z4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2Zb63bH1NbEum/OLuzSIrhnLWeKUO8Zod+ndrWM7EmA=;
 b=roouJoKPdxPOnlkxzSOt1KzISFyFzhJMtYXkkVcmyEMorEgvbVnDK6Z1yjDJ7Iuo7T
 iKR4+5OERuT0y4MCSr8Jpgo+RcEtD7Iabn5hp3O3ZWCByr8HMO6RqpSVXeN1mbTZXgWs
 XRlFzCQ6Q/mNMdL62cCeRg1/vUvl3CIxf4jnveLC28NROAXGjzeFlNYdt7CWF6NwtODS
 Ec66ZWRboxa63EBPC+7+fbD9DoZLPHeYh4rhgvfj6WclBARGOoXMCgC/75OKZSHBQhb3
 MhrG0mwjPBcbQaWxcrp59RulurGLAco2Bhsr0osgzwuizQKU1Ok+9/RedLLeegVuLTI+
 Mp4Q==
X-Gm-Message-State: AOAM530dUIJwxEpmmWG9d4+/k9XoTG7qof6yOAuBjC9oVC8FNw1YFo9G
 ffgKPWZLGwFwaFRbiJ/nL8s4/A==
X-Google-Smtp-Source: ABdhPJyeB2dOc+PbV3anGzAlbLWOVkX8Lfo6+NfKbVZ5BbJKHOgDEoPAhSmOXTX5LGmjkYXRJZQ01A==
X-Received: by 2002:a63:24c2:: with SMTP id k185mr870579pgk.421.1603343565998; 
 Wed, 21 Oct 2020 22:12:45 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id q66sm505225pfc.109.2020.10.21.22.12.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 22:12:45 -0700 (PDT)
Date: Thu, 22 Oct 2020 10:42:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20201022051243.gsjx2ksoilec4wo2@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
 <20201021072404.y43tjzd2ehclrejp@vireshk-i7>
 <CAF6AEGvAK_mAxJB32vvPOD3jumpYprRtUBPT8GRBV8gty7fxFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvAK_mAxJB32vvPOD3jumpYprRtUBPT8GRBV8gty7fxFQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: Nishanth Menon <nm@ti.com>, freedreno <freedreno@lists.freedesktop.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-10-20, 09:58, Rob Clark wrote:
> On Wed, Oct 21, 2020 at 12:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 05-10-20, 11:56, Viresh Kumar wrote:
> > > On 28-08-20, 11:37, Viresh Kumar wrote:
> > > > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > > > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > > > the device). And we can call dev_pm_opp_of_remove_table()
> > > > unconditionally here.
> > > >
> > > > While at it, also create a label to put clkname.
> > > >
> > > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >
> > > Can someone please apply this and the other drm patch (2/8) ?
> >
> > Rob/Rajendra, can someone please have a look at these patches ?
> 
> Oh, sorry I missed that, could someone re-send it and CC
> freedreno@lists.freedesktop.org so it shows up in patchworks.. that is
> more reliable counting on me to not overlook something in my mail

I have just bounced it back to you and freedreno was already cc'd,
though I have bounced it there again.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
