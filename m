Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B88357428
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 20:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42B6E96E;
	Wed,  7 Apr 2021 18:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C1F6E96E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 18:22:39 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 11so11803112pfn.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:to:date:message-id:user-agent;
 bh=hi29bvNz3b0h+J1/8SmX9GkZQUb/KXU3bHzILeV7OBI=;
 b=dvwti10imC/5yBGONbIa6fAg6KAoYu+GkfwHaTpGSX9gtutrz8k4U53XVH8MoVEITd
 GR1KVJhoHM+wT5W+Uty0KbK0AEAIn/HWFUqDi6WdOdTZG6uPlMzd0Kfk0j0iLBoDSVsQ
 vIg31AGvFCG4zA4TvRIsdonHJiZecQ2nzu9vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:to:date:message-id:user-agent;
 bh=hi29bvNz3b0h+J1/8SmX9GkZQUb/KXU3bHzILeV7OBI=;
 b=RI5yQ10V1HrtmCmsiCuY2JjUon/5Gtzmn3THQiy6HI8F9Q4PBsZj8vvThazWRS8KVY
 +Ak1D7uBaxfaR+kRm5otsoMArkZFodpT+qLHBA/626couuSmSvSKxeCthub499MAbTNi
 0UbpR6iQH16NSRYk550BXri2/+uhj3vEektSaU4mqOvw0NacWLALPb0DmtiOTIgVo86e
 Ef2AtVXk2kud2ouGbNavgse4JPU+T8MgztOn36ZGJgePlj9jF5i2YzqFKeav7Y4vkKaG
 RFX8WAYE/YfbuBt62CVjqKoUt+0uYzgUenc+epOly6Z0I4i78Yr5iZgfT8vK38U1u7zV
 B0Yw==
X-Gm-Message-State: AOAM5307A8vi0BbhrjP9maQsDAm2OdQrhFrzK4yPEAgWrSwKwVov3Pp+
 UQpJsiKr4/1QK/kHRds83wouOA==
X-Google-Smtp-Source: ABdhPJwxFL0jF4wdaX8clJ5o9U99uJkosPvE3LRxErpWbXVIzWrheMp2PxRLqEGQV20+b4QUq6lrJA==
X-Received: by 2002:a63:6ec3:: with SMTP id j186mr4485221pgc.249.1617819759424; 
 Wed, 07 Apr 2021 11:22:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
 by smtp.gmail.com with ESMTPSA id js16sm5777559pjb.21.2021.04.07.11.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 11:22:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210407130654.3387-1-bernard@vivo.com>
References: <20210407130654.3387-1-bernard@vivo.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable ret
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Tanmay Shah <tanmay@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Apr 2021 11:22:37 -0700
Message-ID: <161781975744.1883259.13405764054457057600@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bernard Zhao (2021-04-07 06:06:21)
> This patch fix coccicheck warning:
> drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret". Return "0" on line 880
> Also remove unneeded function return value check.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
