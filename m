Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6286ACA7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F9F10E5EF;
	Wed, 28 Feb 2024 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L+FsVwrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAF310E5EF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:08:17 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so5720199276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709118496; x=1709723296; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJmCHtzXEM7iHGUAof2e0JKiHgjZvY6I5vD12R0EcB0=;
 b=L+FsVwrjHKyv7qSJ13HsV2VDUbR74ajyIXwlVD9QhD3vfq9ZZiJI0r9fH+dA7mu91d
 SOoLdx3XjKDFkQ1Rr6USVAtEohxc7R76n5bF4c25Rrbh1Rx5H5oFH/c/SNVCk6S+xpQ3
 z8kUzT04pk3HUbamHHBNIGnxYjNFY9eMQgfn9Ak1tqA0G70lvdntgHsegafviXNPXeuk
 gZ6vDdLGvAea88eq45RLH1FKFj8OZ2uBhxJJP/ucV8sdOx+YYx2sQDy6X38SVzKXhy6p
 lU2ERSVhX1apnyVDuYDRdgfPNopWV7aWjg9gezmjI8kCWJbYcC8PU7kO95S30VzOgF5t
 lO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709118496; x=1709723296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJmCHtzXEM7iHGUAof2e0JKiHgjZvY6I5vD12R0EcB0=;
 b=DODyrdsEM1DEisEUobrhe5SagMrgHBIJtT6Pc5P7avNZaxE+hy/sfOWwFh6JPtXS03
 kKbDIhAFtUjqqcDgptYabz4pn550TPXftzdULS6MLtwIVNnX+sZ75Z/+RfjVJpT1jISt
 iXH/AFtFkBVrbQilNCKCTop9fKp+my8Yq6p2o5FaMZFt4+hgetjCT507xaA2tq3/H9ke
 OOCXh3RP1mt8t2OR731YN3i7cE4f8Nn28lPp5WEKeO7OAlvU1XLefU3f5G3hKJzXp099
 4acwscohFabZheB7dG11jvYM4ZgvptM8ThwGuA2vxUEpY+GV2FqWUzkTW6jpphcKnI+d
 TnoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrJ7dyAdrNeps+Hpaptl5z2ZlAl6nUd/5hZPIbztmZVAneyMOeautKACnnQIOH2B7poyjVwJ/x5tYWcCqerC4sPPsBB3xd6o6yhf/G1jjB
X-Gm-Message-State: AOJu0Ywee5jK9Pr7qHqyxScjtPjSsF2RHAzNuJVvxHuACBEhJri/31qx
 i8WeWfFF7ymQuzbAO7MsZinop/ZMhqBFCZPwwxJTScMxL4L6N2o//103iyCwsxYoayPMph6tXLQ
 Jpf2mIO4JEVOQkXycIIr6UXTramkkAw3T6DRlmA==
X-Google-Smtp-Source: AGHT+IE7FGesh2EjL5jyHeDznjzn/ZbnUFCAT6CsdLQR0L++/z1KEBV5qW9/rZM2L2bRBaXEmeKKtOqYWbh1cGbCgjg=
X-Received: by 2002:a05:6902:2192:b0:dcc:5aa1:7ac3 with SMTP id
 dl18-20020a056902219200b00dcc5aa17ac3mr2290311ybb.2.1709118496390; Wed, 28
 Feb 2024 03:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
 <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
In-Reply-To: <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Feb 2024 13:08:04 +0200
Message-ID: <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Feb 2024 at 11:50, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Feb 27, 2024 at 02:11:56PM -0800, Abhinav Kumar wrote:
> > On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
> > > This reverts commit e467e0bde881 ("drm/msm/dp: use
> > > drm_bridge_hpd_notify() to report HPD status changes").
> > >
> > > The commit changed the way how the MSM DP driver communicates
> > > HPD-related events to the userspace. The mentioned commit made some of
> > > the HPD events being reported earlier. This way userspace starts poking
> > > around. It interacts in a bad way with the dp_bridge_detect and the
> > > driver's state machine, ending up either with the very long delays
> > > during hotplug detection or even inability of the DP driver to report
> > > the display as connected.
> > >
> > > A proper fix will involve redesigning of the HPD handling in the MSM DP
> > > driver. It is underway, but it will be intrusive and can not be thought
> > > about as a simple fix for the issue. Thus, revert the offending commit.
> >
> > Yes, for fixing this on 6.9 I am fine with this.
>
> Since this is a regression in 6.8-rc1, I hope you meant to say 6.8 here?

In the worst case it will land to 6.8.x via the stable tree process.

>
> > I hope there were not other changes which were built on top of this. So
> > it will be better if we retest internal HPD case as well with this.
> >
> > We will do that in a day or two and give Tested-by.
>
> Johan



-- 
With best wishes
Dmitry
