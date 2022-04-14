Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A8501C03
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 21:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9DA10E2C0;
	Thu, 14 Apr 2022 19:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E1010E2C0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 19:36:01 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g17-20020a9d6191000000b005e8d8583c36so4077854otk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vrx4+YHpwTNJHX0W7SZLGfsxXelpnrIdbXIV1qMsRYA=;
 b=FNCvhrKZ1koxe+nJvUVWxBru/9GyuOY9b8E8r0hf3n6ON6kfTimDW8le8lByjEtFtf
 +iSMxE37vrLmZovEZthCxMCxydpaBLkCjsaL7Gg9n5h4kHGhvCdV5f90FAXSNkJztpKL
 hY2D9Ka5RScPq6D3NXh9Y6FzeYd3l7H1w8mKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vrx4+YHpwTNJHX0W7SZLGfsxXelpnrIdbXIV1qMsRYA=;
 b=bEXi/Ad1hs73P0ZiYdGay/ZOxNkeUgyNkfzC7geqvGtm0QC1AvKvIFWGx8nBwxr3cn
 oc4zLPVn+FziMeySHOTY5VEyzkyyPWARUrJiXa/XpqYKRxZ0Alzhkc0NAgKWAF51YgVN
 vwIpZfwnogaao/Mh8RGcOpTU1vtpk0USVLRNozlH6bk2onLg/rhbpVfhMhGAdposN3VO
 t4Vdqhk5XmR8XProYWtxbJnEXrpFz3yCR3sUf5+MBPzFNRoNao8HforLABwjNsgUWz7h
 14zXOIMuxRshltLxzQHtSNidyLHHHwd3O8274oQAXuQCCu0i4A37Z7scpepoE9tNCRjT
 c38g==
X-Gm-Message-State: AOAM5312NTAMv/e7JIJgDuBT2qA6RsgWHFXMdv2adbDnCYnQGsSsKHAl
 AgWR7K5OnCdOQBqT+KJdLuQ3n+0xgtpTZGGVEPt4/g==
X-Google-Smtp-Source: ABdhPJzt7HXp3rGjm2KOxE4dqJ4CxfML+6PKKFDBEfBgmm0z0ihv0HjSSno3vFpnFtInHjukfDeWcWRfYkmMAkW928k=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1451061ota.159.1649964961126; Thu, 14
 Apr 2022 12:36:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:36:00 -0700
MIME-Version: 1.0
In-Reply-To: <0d8a0716-c8b8-a4f6-3e9a-924245dd97fc@quicinc.com>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n511nbPrRCMx3E2De-htmR79vZr4ezSj13Gm1PbTGasC4A@mail.gmail.com>
 <0d8a0716-c8b8-a4f6-3e9a-924245dd97fc@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 12:36:00 -0700
Message-ID: <CAE-0n53UZf1sOjegMOSC_m-DiGtDxC-m=w1=9ZbW++J8zK9Omw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-14 09:34:55)
>
> On 4/13/2022 5:02 PM, Stephen Boyd wrote:
> > The subject is still misleading. It is fixing something. It may be
> > enhancing it as well but it is clearly fixing it first.
> >
[...]
> > I'd prefer this part to be a different patch. It can come after the fix
> > to ease backporting.
> >
> > Also, is there any response to Dmitry's question yet? I haven't seen
> > anything.
>
> Sorry, since our internal review does not like this approach.

The internal review shouldn't prevent you from responding to code review
on the mailing list.
