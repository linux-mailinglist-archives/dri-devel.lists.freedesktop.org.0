Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E0485C5F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530910E48A;
	Wed,  5 Jan 2022 23:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347FA10E43C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:41:56 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso1254935otf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hstj2R8ZmDxCXTF3eKwARX+HoUFN/nENk0GAyIL5MUk=;
 b=R1bNiB2DVLPtk0pC+nYr0JETj8iD7Na0JRRE7r3kga+8WkotyJaQPtwWSLJVQxO1f7
 8Uyo38opmG91aKbTd2xzMWir+ZtyLgYiSutKosW7rWM80bgdKx1sjxsIyoCmSBjha1kX
 mB3g6wq5D75vojqUUajcNA/TtGt++GHEsD/qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hstj2R8ZmDxCXTF3eKwARX+HoUFN/nENk0GAyIL5MUk=;
 b=Fn0fcLIuPUqUmCR+CEI0agrZEFbGO/8j3332+fjQR6CdcR7/RzRn2fTf7wjgbv0q+N
 bF9W7AUtCn5rSZQHYrVddT0qBt583vcN49hPBuMDySHAyONASzSIz/xrzIO580v3v/IF
 OkUvK4lB6XJ945HSEpFm87uOISZJJQ420IuxwxZuach9eKaOXlIxpwO6ISk+PSdzZAZm
 oJbvmhYw3Dcd1J12+yKhDP5pgdUZOHbVuDiYco+28Wmf6IUSbyfHtNo8u8mVxq1eiB2h
 FB9/PQsaw26hZaQzQUnj7K5bsGP1oI7iuNiF08E/BC5J0sE0pztimGEXANdtljxU9WkV
 oKSQ==
X-Gm-Message-State: AOAM531rM9LG+405VQ+SCRiRy8PyS7u5rHahhToU9BX8uIwlyT9n6+Ci
 Ulr6Pbb23X4UVoP5t+9c7dxBOa+Y7oeASvkX6MothQ==
X-Google-Smtp-Source: ABdhPJyOYuLpjO8gx43wP3pSJEOgxI2mVBjPwuzV0elz1fKfcWpdtbXdmFtiv+OxpNlVj7M6KhNt8ts3ZTRl21NiPQE=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr482422ote.77.1641426115544;
 Wed, 05 Jan 2022 15:41:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:41:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:41:55 -0800
Message-ID: <CAE-0n52df=QXPkiQG5W1E51sOHb5kX0+J0qLpPN9NKV36TmN6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm: drop register logging support
To: Abhinav Kumar <abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:26:58)
> Register logging was used during early stages of msm driver development
> to compare upstream and downstream register traces. However the tool was
> never updated to work with mdp5 hardware. Later it was dropped
> completely when Rob imported freedreno tools into mesa. All this makes
> DRM_MSM_REGISTER_LOGGING irrelevant now, so it can be dropped.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
