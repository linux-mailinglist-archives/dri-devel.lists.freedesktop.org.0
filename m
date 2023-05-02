Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74876F4D80
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A33010E11A;
	Tue,  2 May 2023 23:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5138C10E11D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 23:16:09 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-55a5e0f5b1aso26250307b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 16:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683069368; x=1685661368;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SXO6retkz2cq9N6Jojgiaaj/1/92QkbNhQxs4uHhF3I=;
 b=TUnCAgtse7NCZmfBiGyU47uHwFzhUCP+slxkJTryq8tRdUaUwWya6Qhsqt1bdELd/I
 1r1FvCJhpa4334JZSrZZZ67zW0z17grxMDnPBsJoz8Nilv17RhLrxSqtEo/Fucnh4dH1
 OmQQvIvWoJwDeUJSWCWWHazCzftGtE0RmJYDqIndUZNzMTIkW8+9jVSdUNRTxcD1L43C
 ARO9Ukpml07DDOHOtkyYYWiRaK98bMzNAyrOUrLARvosFOvm1p5n+FQLIB7aCEBWni2w
 1nni+92gNZzFF++j81kaNvCkf6MBUninDcWFZqaSMgD/k97rl2hjA8GhIBOsFNkDrrLc
 GzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683069368; x=1685661368;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SXO6retkz2cq9N6Jojgiaaj/1/92QkbNhQxs4uHhF3I=;
 b=hbKdShwSwzVFqOemnO8MThFhaRHzKLEm5NrYU6yo3kScFfS3w74PUqMEveGez6IaTU
 ncPkUX+q1Ydj8RPLNGeqwhN4GwRj72Hy25ltuLVp35BSjr+8HMjTlqouiXAdwZOMi4K3
 FrdpZnuaExyxfBf8GhXHQgFMDyAmCyMRq8JQ9xRhdr4yTo6jCEQCF9kBafX59ipcISrM
 h7ma/vv8YYyzg1h6jYjU+LFvCpjmfYsAutSJr+tIRCkPnBBNMDaqmE1l37Q7pXWOkC6N
 PeNI0rTkAS2VOGF1BFd0H5y2u1zAZ5hvEKIz/Pu0KKC/n24jGyGDkw2FWCKDH3s2QS6V
 3DfA==
X-Gm-Message-State: AC+VfDyl7BmcgcrWGY0XCq06JDVGiB9E/OyXwLb9kUv9Zh/0V3hQAzgp
 0oapmHzl4tePPnSgkqVTRZRvrnBePnytq29r966wSA==
X-Google-Smtp-Source: ACHHUZ59UpLKTEsqEYDETaLcDqOxHO1Z3WJOekgCiVwPByWYulavqGuvXnGzGLFj+PIAxsTqWknU+ig50eMk0+Sfl+M=
X-Received: by 2002:a0d:f3c1:0:b0:54e:ffbc:7ac2 with SMTP id
 c184-20020a0df3c1000000b0054effbc7ac2mr19499019ywf.45.1683069368113; Tue, 02
 May 2023 16:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-5-dmitry.baryshkov@linaro.org>
 <dae23075-b907-48c0-7605-f91589630beb@quicinc.com>
In-Reply-To: <dae23075-b907-48c0-7605-f91589630beb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 May 2023 02:15:56 +0300
Message-ID: <CAA8EJppO3GhsRVY-5UjOO-GAw_NZONPaNBigO4P4_axXxNxsaA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dpu: drop duplicated intf/wb indices from
 encoder structs
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

On Wed, 3 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> > Remove intf_idx and wb_idx fields from struct dpu_encoder_phys and
> > struct dpu_enc_phys_init_params. Set the hw_intf and hw_wb directly and
> > use them to get the instance index.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
>  From whatever I can see, this will not affect functionality of intf or
> wb and cleans it up well , so I am fine with this. Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> One minor comment/question.
>
> <snipped other parts>
>
> > @@ -761,7 +761,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> >       struct dpu_encoder_phys_cmd *cmd_enc = NULL;
> >       int ret = 0;
> >
> > -     DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
>
> Was it intentional to drop the index in this log?

We don't have p->intf_idx at this point. I think we can use
p->hw_intf->idx instead, I'll fix that for v2.

>
> > +     DPU_DEBUG("intf\n");
> >
> >       cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);



-- 
With best wishes
Dmitry
