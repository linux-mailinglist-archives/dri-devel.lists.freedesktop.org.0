Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24426C985B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 00:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B5910E2F6;
	Sun, 26 Mar 2023 22:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A627010E2E2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 22:01:12 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id p204so8176161ybc.12
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nW5Zc8I9D3NwW9JUY8UwDM40P3d6d2p4PO1EwU3IDaI=;
 b=lttfX1kJ6ZctCFBJbQWMDHXaxHbnu4g/vIZsHhvCzMCsHG8wsta1JHfgSA8+nTGo9i
 GTjVry/Ilt1WouW13iOy1ER+vxb6jQmGK6Re+SfNiJswO5v80Ltj+934ZOu22GNA4Dky
 SlSN6yLPHTxe/Vt0qV2hB7UWrIBWTgs2KtXyUPR2T8KPK7FMoIfazqBl/GZGxLme3i6X
 1ld59Ac0M/+x47RyMuMXz19MssYL1s8Dd0wu381+1B2AF6CF3R63lZpUpz/UPGrFi9SO
 Nmy8KbH4p8InCxAtR1RSvwKaEA76UEURU43lmjRRwPfKtsFmgtE+Uo0bUf8qcPMUlPar
 wzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nW5Zc8I9D3NwW9JUY8UwDM40P3d6d2p4PO1EwU3IDaI=;
 b=q/ZnNgVro4u6V7IxlSPbHDXcMCtpOwdcoj17YruI6MOyPRQinilG52ahmPkPA7SuiJ
 8wTh6kitycl7eiBQb8gP5GnKhlxSMuH/FnV1uuvMYue3oCzkx/J6UcStFZaoNn4YklAH
 vwcW4oFm6PsGB4XG9VcCqr5UckaRMNevSg1o253Ffdhms2O32lRD/gBDzdD/85uDpvaU
 BDLLEG0XfJYDIEpN9gyEHTrzsKf6/aoDi8AupyJJ+bI8FJjTBSlk1ceq/GPCfvyVVpwI
 /pP37xSC1RJ/3ItSq3vlG+1TP4czXNX+QmJgP5Dp7JEwY1L7JKCqgHdYPhh3nwKtyMfi
 pUfA==
X-Gm-Message-State: AAQBX9epLborvuP0nYp33aeWVC1+8o2NyfD2fiI/KiUNRV7/Xca3MyDf
 M3TkvKt/AA1KT8KgOaiGaK0lJdpPrFGB3b8xnAoovA==
X-Google-Smtp-Source: AKy350YT/xl8gofmmkVhwL2aCMeTVFx6UYQ8WocHxT1/FSBcMYEXjfM1wbj2q4875vnX5Bile5Tlmms3fT3yVFoFri8=
X-Received: by 2002:a25:234c:0:b0:b35:91cc:9e29 with SMTP id
 j73-20020a25234c000000b00b3591cc9e29mr6997010ybj.5.1679868071581; Sun, 26 Mar
 2023 15:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230326163813.535762-1-robdclark@gmail.com>
In-Reply-To: <20230326163813.535762-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Mar 2023 01:01:00 +0300
Message-ID: <CAA8EJpp2vhiq5WWaU=shG-tqDjt3pzw-NGTZbMMkx2cyp+ETCg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Mar 2023 at 19:38, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Danylo Piliaiev <dpiliaiev@igalia.com>
>
> Clashes with C++ `or` keyword
>
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
