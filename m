Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B243DB34
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 08:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58686E060;
	Thu, 28 Oct 2021 06:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09B46E060
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 06:34:32 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so7160634ote.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PRgWCRCX7AtwJtD++BtDcASmdtlLCky0vNsp17MLlCo=;
 b=em7rMEP++cDD6gn1cQ27hJKr0PZKndl+gMTj5cIe4wcUsLq1UdZ258NJ827zstWX79
 EmDvUqjsQQT7BlzCpY13u6u29OM3jwkeYBAvmvdv1rvMxknpaUWbppiNXIueAmOAvjPz
 LhbvwuU3B7empW598hrp22LTfyfUFg6buyuU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PRgWCRCX7AtwJtD++BtDcASmdtlLCky0vNsp17MLlCo=;
 b=YBDtxhXE3vG4fHEmqdr8yWzfA7HGAmBDaGIB4IFcriojUUyE7rtNXiPlMPWerWK7o3
 sj3oKXsI4Z+GjFp4CWUZzLwg3zw22nPSWHRTAmb9yV6KEs8kJbhPcBEoZ9pBMYo1rGeF
 H5gvX5xb3SbI3EigRqfogY10Se+gZUTbpCPbU0Km/cG2+bnoYHODQRUNHFJnfgmkHDTa
 SY5lWaf95s9yXKland9pfit9E9yzL21oUCJCoXqOcLXxSiSwvq9GcLPPb29E+iCyqCpk
 yhbvT6Ibvkf61YSljM7Tngk9zrjXk1Gi6d07uNv/Dxv3nmQZy5ohC3fwZC6SDhnF5eDE
 QPSw==
X-Gm-Message-State: AOAM531asYSVFUy+o5wB+njwPehIzJB5gLBEGvdnd8s7hdWM0CaL8Fsv
 PuUH9ggSHNvCO77GOt/PnxDG5zqw8YaH6WBy3i0hMg==
X-Google-Smtp-Source: ABdhPJxWcOa3Xkk6Hw5Lr0txJqbDDMJPmnfEf8oGlsnZUqb3TVVAZTrS+4RFqV0jimxB4yUnK+VWxsK2/WZ+xbzr3qU=
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr1863400otr.77.1635402872221; 
 Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:34:31 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:34:31 -0700
Message-ID: <CAE-0n53U0JARXjzt=Hr5kfEdEHJR5AFKYx796V7LGbn6CVnVig@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm/dp: Enable ASSR for supported DP sinks
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:47)
> The eDP sink on sc7280 supports ASSR and dp driver will
> enable ASSR in the source hardware. The driver needs to
> enable the ASSR field in the DPCD configuration register
> to avoid screen corruption. This change will enable ASSR
> if supported in the sink device.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
