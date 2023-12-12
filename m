Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5CC80E447
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 07:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653010E557;
	Tue, 12 Dec 2023 06:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A182210E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 06:31:59 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5d3644ca426so51636017b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 22:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702362719; x=1702967519; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GTyimt7NL0UKlmZiXkz9uafKVfa8o+8ACsFlcy9zsvM=;
 b=tNG0KJPSCO5TmrSLnvBOtX5kXfM4Xh1PJoAEYG4PqW0Pna8N/kBflasdAHbmVPT+eu
 lPpSuxqAWTnf6Z415C9Dvrk29BbB1SNE2y0JQb9xF5OHbrt3UkiXMWD4noj/vBZ5QvB+
 4xzUZpGFSSMAPWToCdivoD7Saz2Bbr/CkFDizdkhXQXJQT7F3jzaITfua1BM0NuBD3fD
 mHQJHsF537pv/LwaZMC1TH32RMhmc5yrTwqGUmpf1FLfknF2c4jaOj8K8nywVa0GuNPR
 3tPn1uGKOdJ7FuGLaFfi508DhVJzq8PtOPow1/K/vnoDx5zlfQzDsu8K1Tb5/A+ufbja
 Is/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702362719; x=1702967519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTyimt7NL0UKlmZiXkz9uafKVfa8o+8ACsFlcy9zsvM=;
 b=XHjg8AaksDjKDnZOfGCAyqi15NwOGTMBZ8EKqYR0yP6ts2/n54kRwOdadLu8V6BeMx
 MzmSl7yTX0+1TycWamBs4FlrDv999a8iIM+4OItTQ8OC2GjMNajMiQIiHz0YzG3SKl4e
 FaHrCQU9EwaoGO00JyhNULRr3zuTWGFOySym8ETNjOsD9yoFSpEUBwI1OZtr5VaR9iyc
 V0AKwT8clX/ubyPTyGvNuwpdCJz8pD2GRAnyEmiFREM22T/e1h8V2hwvdbRYa04Cy3oa
 eAQmYcpwEZvxPiFR4VYBeSUxm/ot1a8MbCLDZji9td7Z4miZTNsV9LWsquvexvM2QATv
 FE7w==
X-Gm-Message-State: AOJu0Ywl3ZuAzw+c8twaHVGUtkT888cH0GD3GYmXuy71nyS9/fewUFrV
 ROr6Wd/slSavgo2X8nXvyGx+BKQkxIrAwFuOUj0qBQ==
X-Google-Smtp-Source: AGHT+IGs3HI6JS3zf1kNU/4zxKRcKFHbTh53Sxa3Dui91Qy2eQXtvbSqGZ/ne5wF8+f6nUF/3SZPXetlFOQSuaig8Ag=
X-Received: by 2002:a0d:d305:0:b0:5d7:2c6b:623 with SMTP id
 v5-20020a0dd305000000b005d72c6b0623mr4258949ywd.39.1702362718756; Mon, 11 Dec
 2023 22:31:58 -0800 (PST)
MIME-Version: 1.0
References: <1702319923-24518-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqAch3Qhq_nfecA06d9fk1jUMD1Dx0ZgNGrom6BrwFo5A@mail.gmail.com>
 <baf2ebe7-7895-9249-8487-a7c7e61a67c6@quicinc.com>
In-Reply-To: <baf2ebe7-7895-9249-8487-a7c7e61a67c6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:31:47 +0200
Message-ID: <CAA8EJpoN8OVhPEyHzAjO7DUK9b+7_iJmc0k-XO8B8PrG12ZTVA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:03, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 12/11/2023 1:30 PM, Dmitry Baryshkov wrote:
> > On Mon, 11 Dec 2023 at 20:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> A DCE (Display Compression Engine) contains two DSC hard slice
> >> encoders. Each DCE start with even DSC encoder index followed by
> > "starts". But it will not be correct. The DCE doesn't start with the
> > DSC encoder. DCE consists of two DSC encoders, one has an odd index
> > and another one has an even index.
> >
> >> an odd DSC encoder index. Each encoder can work independently.
> >> But Only two DSC encoders from same DCE can be paired to work
> > only
> >
> >> together to support merge mode. In addition, the DSC with even
> > There are different merge modes. Here you are talking about the DSC merge mode.
> >
> >> index have to mapping to even pingpong index and DSC with odd
> > PINGPONG (end everywhere else).
> >
> > have to be mapped, should be used, etc.
> >
> >> index have to mapping to odd pingpong index at its data path.
> >> This patch improve DSC allocation mechanism with consideration
> > improves
> >
> >> of above factors.
> > of these factors.
> >
> >> Changes in V3:
> >> -- add dpu_rm_pingpong_dsc_check()
> >> -- for pair allocation use i += 2 at for loop
> >>
> >> Changes in V2:
> >>      -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
> >>         _dpu_rm_reserve_dsc_pair()
> >>
> >> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> > This tag is incorrect. The patch should be split into two pieces. One
> > which fixes DSC allocation for DSC 1.1 encoders, where there were no
> > DCE blocks, another one which adds proper handling for DCE.
> > Unless the paired allocation requirement also applies to pre-DCE DSC
> > encoders. But in that case the commit message doesn't make any sense.
> >
> > I checked 4.x Qualcomm kernels. None of them contained any of these
> > restrictions for DSC blocks. Only the displaypack targeting 4.19
> > kernel got these changes. But it predates DCE pairs support.
>
> as I said earlier the rule of odd/even pp-index map to odd/even
> dsc-index is there since dsc v1.1.
>
> I think current code (including down stream code) works by luck to not
> encounter a configuration with two independence paths, one with single
> dsc and the other one use two dsc to support dsc merge mode.
>
> this patch is the fix to enforce this rule for both dsc v1.1 and v1.2
> and I will rework commit message yo have better description.

Good. Does this apply to paired allocation too? I think so, as the
techpack first got the paired allocation and only afterwards it has
got the DSC/PP idx check.

Regarding the patch itself. May I suggest an alternative approach,
which should work better, I think. At least it will not require
'deleting' the PP indices. First you preprocess the pp_to_enc_id array
and list all PP indices selected for this encoder. Then you work with
this array, matching PP and DSC blocks.




-- 
With best wishes
Dmitry
