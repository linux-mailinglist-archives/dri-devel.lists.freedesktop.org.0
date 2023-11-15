Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A67EBDCD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 08:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE1F10E4FA;
	Wed, 15 Nov 2023 07:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0210E4FA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:21:11 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-da041ffef81so7069889276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700032871; x=1700637671; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0vD1Bck5HDYUM72yjoV0Q8qgtg6QFL0VXndDmXOf70I=;
 b=bLi0eIS4EjWZP1hOxjRdVsWad9XlIQUBDIaIKGdJDfzYyfSCHGwNspEdEeyDBOd7cK
 EoncKvqCf4ei7lZFnJtnv21zlWeyU0kTrDh6xpqdswx0Ww+90dT1sYpQM8vPzJiDjM2y
 nhVGyg1BRFNApYrqwaQfdjsSsboUzbqguBaq0VP02+Iir2bUCk/WpoYRXacQdM3FKT44
 C/VFgWAVAFGcvvyls9M1cClBBYtZr6kHiaEqEwFcfp2r6fuNSvEZJhCaxWw32QhyjxMh
 XzvKVrodTqDDvJBkHugeJHp60b386bZA1DeYMjT3PqPRG/zknzRoV6VSqhwSwln6qJsS
 M4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700032871; x=1700637671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vD1Bck5HDYUM72yjoV0Q8qgtg6QFL0VXndDmXOf70I=;
 b=of81Db2DutlhaxA0/E1BtubDvzBP6/72/9obxwT7/M56fc1bKqzNiGUlJHs/DSZrkf
 dUpNg1SB1E58m4bF+3LaauB7rtH2+Bnv/GgnwR3788/KAYK7+SH3qC2oOd8tNE7bN6N9
 CPG7ri/Ms54KVMz2s5SDKbza+p1f3VOOc/+m3ho8lNB6XcKc8DDvQ9Ux7s6asDpnrNkp
 AW03/Vhk4gpFTMU+TZxmIB7baPdrXFlDCRO6kOxwB4eaeg2FKWy0iZDobmi9UlIn57a8
 tYafALC63PbEKgXrpkM7rJktX+XS6Bw0nQJHtlNams/HgNzyk4bhEZU17gAEbr+N6xzH
 AJDA==
X-Gm-Message-State: AOJu0Yz9pYw0tBA24OgtEeXcW7/ZtjlzcI4e4cqptf3eZnsXR/mupvjV
 uaoCuymQ5Ug4dSC5jE6dR4nyQOdsC+kOinUlVftIog==
X-Google-Smtp-Source: AGHT+IEULgD391byZsXPtXNbPcw0yCylBtdnLApeQVAUxwBDpohA/yg4/aHXgsob+pZ1sRHJYNKdu3NZUuCiQiUASW8=
X-Received: by 2002:a25:107:0:b0:d81:89e9:9f48 with SMTP id
 7-20020a250107000000b00d8189e99f48mr10803617ybb.63.1700032871066; Tue, 14 Nov
 2023 23:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-3-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:20:59 +0200
Message-ID: <CAA8EJprADPYpJBUkq_TA381xntkfHbBVMm5h4qwwg+vM7GzzRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
