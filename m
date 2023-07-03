Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567F74648E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 22:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D2A10E0BF;
	Mon,  3 Jul 2023 20:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3C10E0BF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 20:58:27 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-c4dd264359cso1777618276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688417907; x=1691009907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=61fmpik8Z7YpXgrDkPK5kpEXwSV1Qu5SSqMtqctrBCE=;
 b=gMurl/iB2fr/RoZYalDTgJLgpXie/a0X4x8szaBEdgzKSfrh4pEKJn23lnBEmUQDfi
 woc22T4tVyqd7FVnqvi8zWWMk6+3nVoVVCB/pT8dVJWbEa/AEf2J4UuCu6PcW8Sbd1Br
 8qOFetLuBMugyqKVMT7v9Uytor5XpV3NCxV3HaMDTVKAxO5vX1SfQidKr0gXSW+Atzbz
 qGAS0yIG7OxOGqA145AR6ObDC6cEB6yY7UTHU9DkxNALIP26GO/A7IwzU1JjMnm+yPyd
 AYa9BBFCj2DvwS0lm5u+lxbX1RgpC5qHjLu0frauY/vmlpMCY+jV53zb0sYYP0W7hepT
 bbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688417907; x=1691009907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61fmpik8Z7YpXgrDkPK5kpEXwSV1Qu5SSqMtqctrBCE=;
 b=LbvPF33Ufwecfs2ZOotMahMZOTxvdwTVnxr+juL9o0Q3g7yy8Ds2mRomJSAviV4ToE
 t4zc2hAuyNQuhsgmnoRtLRRz4hPPuvR+QIRT7f5Zn7Xz5rsiBiCVpxCcBWCXc/1i9IZD
 qMCJs+xDHG8bO28C1yD1JxOm8oFIsROdyOLwedW3pK3DaEWUGwte9/wpyUAT6oe1a5ua
 tMn4zjX5LQqNWsstpfNto+EHWjnpLkSQw1S1FOLP8eKaS+YnrlvLAR5FlCA2QMVD9uRs
 Q/Ve+i1uLD7Tg0zWY/YCoZJzjfp8hslgUHPAfu+3Km3ZAFAv5ciWYgiXpOYQomlkKc9x
 D92A==
X-Gm-Message-State: ABy/qLZYY/brzHmkNadzk3c17a3d729OWldDYjkA/nNqgXPl8JjLJu5g
 Xf3fDfhlQxugghzM2lDed3YeBEP9WlaLNJnBjory9w==
X-Google-Smtp-Source: APBJJlGCiOAwtwNc2ltkHxBFijycW7XEhOaZd/YQAt6du97DF0RFEHd8Oat44g+uZZ7DR2U8bLHQMcxI8lWY/h24HCs=
X-Received: by 2002:a25:744b:0:b0:c19:61fc:db04 with SMTP id
 p72-20020a25744b000000b00c1961fcdb04mr11076515ybc.58.1688417906853; Mon, 03
 Jul 2023 13:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-15-dmitry.baryshkov@linaro.org>
 <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
In-Reply-To: <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 3 Jul 2023 23:58:16 +0300
Message-ID: <CAA8EJprXC531DaTJR1XoCC0ZeHn4q3L2vt6zLMKmYPXyLrab6Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Jul 2023 at 23:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
> > To simplify making changes to the hardware block definitions, expand
> > corresponding macros. This way making all the changes are more obvious
> > and visible in the source files.
> >
> > Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> the value of MERGE_3D_SM8150_MASK is 0, so to be uniform with what has
> been done with some of the prev patches to drop 0 feature fields
> assignment, do you want to do the same here?

These patches do macro expansion (+ obvious 0-field removal). So
removal of MERGE_3D_SM8150_MASK had to wait until patch 18.



-- 
With best wishes
Dmitry
