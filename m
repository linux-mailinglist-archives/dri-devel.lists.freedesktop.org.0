Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C17BC2EC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 01:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C3310E578;
	Fri,  6 Oct 2023 23:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8C110E579
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 23:28:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-505a62d24b9so3173836e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696634934; x=1697239734;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=dPje1vcHjwIpo51r2lCV1V3PJPkC5dj3H0BmMKBs+B8=;
 b=nsIFhkIPR9ZLDiIpwMFzdMtYBuzXP+qVeHKGYxdJREEXj95n1YD/FDcpPAgRg0bWPt
 GyUwKY2yXetx4gMhh8h+T+qWcqswShIF/avK9Rntq1NatSmIlVVxqGb2LXa2aJLM8lon
 dBon6jQ2jxOQahMJXkQhWj1lnELe0yuhMHhBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696634934; x=1697239734;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPje1vcHjwIpo51r2lCV1V3PJPkC5dj3H0BmMKBs+B8=;
 b=rVisCXq1zbZ3DamYkEh8YgYwCgk0qBh6q84hgajNytFDLmmcsQGWTec5pju5O62/QW
 ZzzK2XYOV0uCnwIdR+1eaBGVd9RdCnw40rETVknBOwOZOpwv6HgPRTkO7VNfY07YnsVS
 CtxbImKfqFq3ggzjX72mdlv13kHLX5LUzdRmRsZ+z+bKPsZBW2N0jGIqxJ1Xj5wnbuzw
 d73c5WO1oBryHvQG9Byh9POAYPTp5QSghRVJvQ4c5MkwEbAZTE6hIiF6v7ieZ6Z0dwL+
 4nu6hBL8Q0AsORdnnUABbp4n3kR6UibB+YcAsIP5hLWGcVdAoOX6gxrlMPwMwRN5qre/
 /ssQ==
X-Gm-Message-State: AOJu0YzHIENpx2XExAbFfelqYKiSR8sS+CYx9SZ+ifTn7mpKL7xQCR2W
 Fj/sc0Llcr1FziDiHCfSbCcmWq3FAAKIEbJjbpf75g==
X-Google-Smtp-Source: AGHT+IFlu3AoscCuX5mmu2dgMoFvoKMHgZth8cXyCHPtypScwGpaNG9cgu2tQKhK5xO5BoEwsJpp2QIly6mZQq0bu0Q=
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id
 cf43-20020a056512282b00b005057371ec83mr9877611lfb.48.1696634934093; Fri, 06
 Oct 2023 16:28:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Oct 2023 23:28:53 +0000
MIME-Version: 1.0
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 6 Oct 2023 23:28:53 +0000
Message-ID: <CAE-0n50VFdySRJ2ErAzL6UW2Rn9cbpPbd4sAJoJ2fPmVv-8-4A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> Read the downstream port info and set the subconnector type accordingly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
