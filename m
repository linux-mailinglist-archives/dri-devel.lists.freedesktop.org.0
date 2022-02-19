Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36074BC510
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790F610EB3C;
	Sat, 19 Feb 2022 02:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6DC10EB3C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:48:38 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso5869653oop.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 18:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hPdjDdNadPqSVHbuOnqKmiG3swyOEQcjMi4i43w2HUQ=;
 b=AP5Zj0QHPXzaf68gGt3ocS1GQg9DML587jXkKRiK/42bBTMle2SHr2seh9i+gPvEdB
 9seinr0CYty6KtMIoD4brePKNsuTIcUqYjBaCEVlhvB81XGXtE+uujPwmvAr4zuHwOL9
 KPCJ9jiZ4Oao5Rt2w6zAJbOpdxXxm/K8KMb5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hPdjDdNadPqSVHbuOnqKmiG3swyOEQcjMi4i43w2HUQ=;
 b=VIUSsvDSxB/IEsuV86qUOlu+pkCAwNsBltL386HNLiZMytlKE2lqT9R2cnIVXIpBrK
 Oj2YBboi4C9Egf/0TsHYcpZXE9MRo7EqKX1IpCuo9aa5mzSqOja066laxEqVUGJHKeH9
 dcJXaKT4k3KX4Kg5yI0I6pIn7sW35w8IcvLufvxfYwdNDYXJqrN8vM1jJhvA68Ta/4VL
 PxaCxgwy5p3yKC+CNXnFgleEwAk/5ln9fzJzUKFDnhXlgyfLOXEDxWyLwsUseIEf2Ief
 SLcUqS216ciWLOPieicFuKXkATf39FLK2RJjMyAl22ZOhaHJ3hnC/pLHQq73o8rVb/zx
 dtPQ==
X-Gm-Message-State: AOAM533LFjlALgk7dJgXXBVkqnx+ALAptbzJ6pK28DBS/CHO16VGaZp1
 AYas9tVbc1/T36a/T/Trc83Z/FKefS17rwcg5fCcFQ==
X-Google-Smtp-Source: ABdhPJzv3fD/5F9JZh4S7/yrUsbnHaMdSMc+45/Z1gxOvab80lBmoKayst3vo1YUAP6EKGWHGzS/pWyicSgVLN5HgaI=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4196156oap.54.1645238917762; Fri, 18
 Feb 2022 18:48:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:48:37 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:48:37 -0800
Message-ID: <CAE-0n53oA_1iXq8gt97TOWBBxbLVs7YT338ePaBKaeoQsfX=SQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] drm/msm/dpu: replace BIT(x) with correspond marco
 define string
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 13:36:26)
> To improve code readability, this patch replace BIT(x) with
> correspond register bit define string
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
