Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD144DD1BC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44B210E8EF;
	Fri, 18 Mar 2022 00:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A610E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:12:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bi12so14040910ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0JxEaW4VXWR40cLYJjku9wMK0TYnJdxwPBMKsUQN5x4=;
 b=WmrOuRLIO0Ac2yhoWChAS3mMdEymf9q2gT1itHWGIVZGaH+oPlHGJc4Ee3mLhpjJyz
 /KOPyenA4596wt5yxVjvtdxfN8GH4bugNcacafDRuP5vH1xVx88HWnxUWlfstXDyW9iQ
 j77Pr/D/gx7SNRYOy03j2fM7u66ODTiwxMI7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0JxEaW4VXWR40cLYJjku9wMK0TYnJdxwPBMKsUQN5x4=;
 b=TqRF9nAfxrXb9HSnad64O1YBInWLWJEwqhL+/feoZV9Oz8P1y2zANwGnUgF+KQloLa
 eIFakG+JfNpVobtaXT/pwzUbdcLLNS4WAmLU4AWY3ynBjOFMK8Gz3xqjDeEeW5WgRs9X
 6wMJE4MQS7XgMz2X12Tl6na0BmzGppkxrQ2d/B5nWPFTWj/1fzsjA+7cdCgjxZAeYxbl
 FGAS8Ck0fUuKWvm46kLTPkGsbF5I429nZTE6fImMh+WOSdd2KjEbhLR8l619hWpU574K
 McHH+GwEvENwfEsck6xcjhRQCSdhiwt6Gyaao5ZJ8fudyNcB/qcTyS4HT+Pn3AVYsmBK
 Y7Dg==
X-Gm-Message-State: AOAM530CMYcy1wPyvRWM9P1a3srhnUcxUUAEuEczXL2zimcKdHKQq7u6
 9qEAMVr851lPV3FhMivL4wgOpCwU+LO+NzlexFs=
X-Google-Smtp-Source: ABdhPJxKVXOtk3SxiGqQyFSSAhF2PkNI/FYnPjOP4jt1WohtDS6PDdrLZUfTj7jqZnXikUqmpnExtA==
X-Received: by 2002:a17:906:3cb1:b0:6ce:2a97:5ade with SMTP id
 b17-20020a1709063cb100b006ce2a975ademr6584382ejh.728.1647562374049; 
 Thu, 17 Mar 2022 17:12:54 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 s15-20020a170906778f00b006df84c19995sm2485278ejm.224.2022.03.17.17.12.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:12:53 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so5926805wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:53 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr13488223wmc.29.1647562372833; Thu, 17
 Mar 2022 17:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-4-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXJJYUhDYau1HEG4M7aKA4vVzN7xh_LAJXf_r=Tj0XZA@mail.gmail.com>
Message-ID: <CAD=FV=VXJJYUhDYau1HEG4M7aKA4vVzN7xh_LAJXf_r=Tj0XZA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sm7180: remove
 assigned-clock-rate property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
