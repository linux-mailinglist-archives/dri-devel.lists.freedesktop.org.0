Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBDE4B7D06
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A28A10E5F8;
	Wed, 16 Feb 2022 02:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1410E5FC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:03:18 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 13so956849oiz.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fyU/OTkUyEuUQG4MRg7zhhXJejHomtDIZYMm7FS8VaQ=;
 b=SdpEypARxFwWHtRMsHtdq0Eh50pLyZ/m1DbxP1ydnXK5nbGGgQv6yWoDNeAtpo1R+6
 f7iIqoFs8ZfQesNEFnwNAq2WjSV9cX7L4Hz8KqUZ4vqqtXwYDh/M0dIaTILiymxjILzw
 /0DVa6p4+LvWkiE2IeHH4Du1IHnlfrqLL31RiS3t1hk7VFgzPxFzUpawof3GJC7CA2Jj
 LEkVHrDkmB2zt5eeHJ7QfQ1wp7RRp7e4Epa0lIYAHWqJq39lmqdgLoXGq3D9irtMR7YG
 +PL9f/jVwtVFul+w3ZOONOqWccFB8aRCjtCbpA1fUOkOoPELkL4C52tRbqnwGNNU9d9a
 at7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fyU/OTkUyEuUQG4MRg7zhhXJejHomtDIZYMm7FS8VaQ=;
 b=zJRqGKyPOYZfXeHa7qPVkhBG2YXvUx15SG8brzfDhxR+KexKh9sa5WKzYnaGY45ht/
 u2WkBjvJBR0ef1l6eoJoRDWs5fbHuJttqfzXA64WtoFiSCwQqEPqofP4lCaIW0Fktxv7
 25a8GC84ImHboBk/8D+vltPBjpyITm9AdFYmWg1anilSuQZZgyinOVNzG0YdLZra699m
 Ii0yqHUaz+5rg80SEmcX7nOiC85Tb2oPjzlorb3gAnwa2y0AYx/Aj9iQsRHPMD4CrxOP
 KT91jm+m2Jc5lMjwoqrHEvx9BpAs2j4lV6LOrZZ078CW2NyhIJDX5INBqYyE8X7wtFNr
 pzAw==
X-Gm-Message-State: AOAM530EcLwfy24uRpm0y4Q9cNQ4qjQCTFTNx07/hmZuKe7pwIpjNsFv
 pI/83bANxSjhIjbqMOWRcrCr8A==
X-Google-Smtp-Source: ABdhPJyGYGO4TFM0B7TvlVq7wHeMoHy+oVnJNhmBVb5bhehWE0Jkky7ehV5ykiS70CxF0BYMOvqaFQ==
X-Received: by 2002:aca:2112:0:b0:2d3:ffce:90c4 with SMTP id
 18-20020aca2112000000b002d3ffce90c4mr296649oiz.62.1644976997189; 
 Tue, 15 Feb 2022 18:03:17 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id q28sm702657ots.76.2022.02.15.18.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 18:03:16 -0800 (PST)
Date: Tue, 15 Feb 2022 20:03:14 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Message-ID: <YgxbYnpbBeOIkGWi@builder.lan>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
 <CAA8EJprCaiPW=Kk0B69RNNwAk0xcqaxQA031sfR0ky+BfzcWKQ@mail.gmail.com>
 <ceb861e5-b1c8-d33e-c0b0-bea0b4cc0b66@quicinc.com>
 <CAA8EJppj+OBPVUgvefO38zp1RHpJw5pL0-4DCkgn3iAcPH-ptA@mail.gmail.com>
 <d0cac12e-7c03-2ba3-fb8d-aee09b72a1b1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0cac12e-7c03-2ba3-fb8d-aee09b72a1b1@quicinc.com>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 15 Feb 19:34 CST 2022, Abhinav Kumar wrote:

> 
> 
> On 2/15/2022 4:20 PM, Dmitry Baryshkov wrote:
> > On Tue, 15 Feb 2022 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > On 2/15/2022 10:42 AM, Dmitry Baryshkov wrote:
> > > > On Tue, 15 Feb 2022 at 20:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
> > > > > > On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
> > > > > > > On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
[..]
> > > > (thus leading us to cases when someone would forget to add INTF_EDP
> > > > next to INTF_DP)
> > > > 
> > > > Also, if we are switching from INTF_DP to INTF_EDP, should we stop
> > > > using end-to-end numbering (like MSM_DP_CONTROLLER_2 for INTF_5) and
> > > > add a separate numbering scheme for INTF_EDP?
> > > > 
> > > We should change the controller ID to match what it actually is.
> > > 
> > > Now that you pointed this out, this looks even more confusing to me to
> > > say that  MSM_DP_CONTROLLER_2 is actually a EDP controller because
> > > fundamentally and even hardware block wise they are different.
> > 
> > So, do we split msm_priv->dp too? It's indexed using
> > MSM_DP_CONTROLLER_n entries.
> > Do we want to teach drm/msm/dp code that there are priv->dp[] and
> > priv->edp arrays?
> 
> ok so now priv->dp and priv->edp arrays are also in the picture here :)
> 
> Actually all these questions should have probably come when we were figuring
> out how best to re-use eDP and DP driver.
> 
> Either way atleast, its good we are documenting all these questions on this
> thread so that anyone can refer this to know what all was missed out :)
> 
> priv->dp is of type msm_dp. When re-using DP driver for eDP and since
> struct msm_dp is the shared struct between dpu and the msm/dp, I get your
> point of re-using MSM_DP_CONTROLLER_* as thats being use to index.
> 
> So MSM_DP_CONTROLLER_* is more of an index into the DP driver and not really
> a hardware indexing scheme.
> 
> If we split into two arrays, we need more changes to dpu_encoder too.
> 
> Too instrusive a change at this point, even though probably correct.
> 

I'm sorry, but performing such a split would create a whole bunch of
duplication and I don't see the reasons yet. Can you please give me an
example of when the DPU _code_ would benefit from being specifically
written for EDP vs DP?

Things where it doesn't make sense to enable certain features in
runtime - but really have different implementation for the two interface
types.

> But are you seeing more changes required even if we just change INTF_DP to
> INTF_eDP for the eDP entries? What are the challenges there?
> 

What are the benefits?

Regards,
Bjorn
