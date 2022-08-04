Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71E589D59
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 16:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8714A461;
	Thu,  4 Aug 2022 14:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2499DE5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:17:23 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b16so18046203edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=V3jLsfHepCtzmM3jqaIFNUTw4oeeGqLPVBJGqzP2VdM=;
 b=JkX7XwsJCHIlFiF0B5fxtl8ET99tlQYq3RS+0DqL8n+QyFBMY+jCN8PnuswadccSA5
 v0MdTihTLtD8ubvNIhYjEY+sngNIR8YxPzP/ayFfUmaggZkgLAMOBQ4VFkROAMr386p0
 BLiUb6KVyGjjtpbltPlz+BraNZwXSKA3psbVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=V3jLsfHepCtzmM3jqaIFNUTw4oeeGqLPVBJGqzP2VdM=;
 b=MqmT3xDp/JujenhSQb1xpcHhgb9SPcbA54XXnpMrC9sTwJV4Y7vCtoSbHCg+pGUD9S
 twYau8fG/v7wOEbxyYpsLcdvSkpl5VXN6H9nu/ytSdjHK3iuWHGCXuF/EDfKUQBkLHIm
 kLwOwaDT6ZbrsN1RRP1CnZWQN5uQM+qyKMetuh5OaZloIGEB8wn5AK3OUIIJwPtAJ8QM
 7LdhxfQjfth/JCDqkoPs08o6FYSAcI7AaxFzmOzbABsAC5sVuXO+PLJ1qLh7lVgJoOsX
 rKMqRrTFZpzQWUvNw7pD1sLL4S6M6Vp4d+RuuC0VT6Y+o0Z2uFZ1CajU+H0AqkcMjR+P
 yrag==
X-Gm-Message-State: ACgBeo26+WGQrIlUJO8a0uyFPYdRGrbvId1NBuZVsCWnER/9746bRNks
 /mSzJN3kX8g3wnbfZPbPYwCbDkM9BUaI7MgQ
X-Google-Smtp-Source: AA6agR7IK3FTjRjiCJlftsDJXBT5PCZQT3IuIupCBVVCXPtU4G/O6xU2KynAtz6THGtM5Cp3DnfFrg==
X-Received: by 2002:a50:baa1:0:b0:43e:5e95:3eda with SMTP id
 x30-20020a50baa1000000b0043e5e953edamr2262419ede.340.1659622641494; 
 Thu, 04 Aug 2022 07:17:21 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 y89-20020a50bb62000000b0043ba0cf5dbasm762741ede.2.2022.08.04.07.17.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 07:17:13 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id z12so15333858wrs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 07:17:11 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr1554422wrf.659.1659622631172; Thu, 04
 Aug 2022 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Aug 2022 07:16:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vo8GMLi=QfV=HXyVf=PTsOkntrc+OTsnQ5jMWYxSDFuQ@mail.gmail.com>
Message-ID: <CAD=FV=Vo8GMLi=QfV=HXyVf=PTsOkntrc+OTsnQ5jMWYxSDFuQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for
 dspp in sc7280
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 3:29 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> +static void dpu_hw_ctl_set_dspp_hierarchical_flush(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active = 0;

nit: don't init to 0 since you just override below.


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ac15444..8ecab91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -160,6 +160,9 @@ struct dpu_hw_ctl_ops {
>         uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
>                 enum dpu_dspp blk);
>
> +       void (*set_dspp_hierarchical_flush)(struct dpu_hw_ctl *ctx,
> +               enum dpu_dspp blk, enum dpu_dspp_sub_blk dspp_sub_blk);
> +

Given that most of the items in this list have kernel-doc comments
explaining them, probably you should have one for your new one too.

-Doug
