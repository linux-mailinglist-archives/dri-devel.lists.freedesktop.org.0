Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7E4A78B4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 20:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC9610E23A;
	Wed,  2 Feb 2022 19:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CF110E23A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 19:27:15 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id v186so1839963ybg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVFg7PnzCZUjUxdz0W83GsH6V6lHk0PTdYLQqbtG0AI=;
 b=VUwYV4hfYIJDeVqAbdSVlM+Ob6/tQmaK18WXFHl50OmP56SqFl78RfzWXIZAhDIEyA
 FBxi54PA6BaxdknZcdX6mGVwGAs5r4L/o1yfQC6tIb41idAtlSuLxodwGODXpdQYAoou
 gBYie3P3VedP1Q6B4Vq2tVEMo6OFvTZeK3j/8lCY2iRXtpCT1496pzBfM88SpAwUnR0v
 UejxgXYvo3gN1ViXSbsqRVrvbwtcYBPz5h9Qvvh/PT5PICdBHwABLDDpHlb87s9G/l6Q
 ExTcmFgmDUt5xNa5ZXPbgdrJftgwB8u6PIPXqmWn+Veh7T2F047aQbSZ1SEBqoDhU1wI
 bB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVFg7PnzCZUjUxdz0W83GsH6V6lHk0PTdYLQqbtG0AI=;
 b=MI4wdcy3qfapDPiY1r+z+y0tGUCBze3A0UAwlRARVaxh57GPOKptaQ2KYrygZnZ+uR
 qHvdrEG5Ryzgajy5zAhR3uyO09iO9h8yB15jnWCnA2ZBtO8wLQcHIq4CZjr9zBP4y73m
 T7AqrOMa3AXa5m9tjQBkNkopaGH2AN1pv6odltZI7lr4vlikb4/OIxhgwd7QI8NZdp00
 8+zz3Szl/5Figix4ozZL7g1fCBVutYhnrJpgTLCMPcJ+sBkJ26qGuxstVXiFPaR3Fiog
 gAZuTQPbo65DucZV9qPf+GYF82eYtzZLbTnzfqOcsE1EED1dcIK99QDeg064r31HyvpX
 rnag==
X-Gm-Message-State: AOAM532soM/gguTeViBkixoFSYJ2VRRTRBxp8nUHBkfEgq9xuHBhwh9c
 /HO8rwHOp3NzGiRsMNBaf7ZL05E0E5rEDNuw+K8vYA==
X-Google-Smtp-Source: ABdhPJxjEkuDFLTtBXShgD0F0o0g/RNgC7ua+FWLePsV5R9uG8DZdnnVQ8u6OGlpCZe3rRIYPAUwctTIuW7JqlAHdlI=
X-Received: by 2002:a81:23d4:: with SMTP id j203mr2147372ywj.95.1643830034776; 
 Wed, 02 Feb 2022 11:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201161618.778455-1-robdclark@gmail.com>
 <20220201161618.778455-2-robdclark@gmail.com>
In-Reply-To: <20220201161618.778455-2-robdclark@gmail.com>
From: Emma Anholt <emma@anholt.net>
Date: Wed, 2 Feb 2022 11:27:03 -0800
Message-ID: <CADaigPUcA5+o2Cd+1YYTGbpnsj3Di=m2Q25OUeumz0HAQVFc9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/gpu: Add ctx to get_param()
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yiwei Zhang <zzyiwei@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 8:16 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Prep work for next patch.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 7e4d6460719e..dd3605b46264 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -197,13 +197,15 @@ static int rd_open(struct inode *inode, struct file *file)
>
>         /* the parsing tools need to know gpu-id to know which
>          * register database to load.
> +        *
> +        * Note: These particular param does not require a context
>          */

Minor typo fix, "param does not" -> "params do not"

Other than that, series
`Reviewed-by: Emma Anholt <emma@anholt.net>`

and I love that we're catching non-address-space associated faults now, too!
