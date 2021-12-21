Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B047B673
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 01:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6295C10E38A;
	Tue, 21 Dec 2021 00:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFC110E41B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 00:28:53 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id kc16so10965077qvb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 16:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HyMTClXKcOmtIsZExXjZqaWJL6q3mx1fJZYSYSwBgL0=;
 b=ZeNjH18h1W0khX97cOeS74ickSGmTFUNJoGkIfAtYtOCji5wS0uGZRkb5pgVwhazkC
 WJvBLdM3rMZSjQ92bmgdShE9LJagkNF2epAKOU3AxDgs0eokcmgfX5gsn2gqHP5L61NB
 F3GjvO9C0IYi6+c/28XKp1kOo5paipS6iVD1jMMhqyJIp4NlXJlyU0v4rOCHga/bbW7/
 fVSYoKmHQdM1EfKSwx31H5CgBE+gmab9mPaEMC6InBrS5/gHtB+JdLzW/UXsSdRnx+fQ
 dasyEgndUlz/xiCOfgWBC8TH1cGp4AEQsiQTphc2SBg8JX0LJiJxbwOO4R8VHICEMuwf
 H6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyMTClXKcOmtIsZExXjZqaWJL6q3mx1fJZYSYSwBgL0=;
 b=2npr5YmZJqQ9qBHh0pYhdns21aAKTtEqE99sR/BR+WvfFgyrCInPuGOUaFYtHA1y5K
 TKYhaaC9StvA2nYa9uLsT7HCGly6V/TKymjXCSgr6QrOhPoCcQAFZtljFg58qcExOW13
 a/rlYGSD2yMo7vurVI//cu26cSdAXFZW7OrkcMS5OVGZBqUm1nRNIK3TBae1Tyrnb39o
 eDuKp+CQNTFSU7T9f9H8AACxSjsb/EdaghIbkalMgTcPBW2Dwn9JReOKH+5Oa2CdWQRZ
 Qf4ywD/6J8sWfYe8RYCdtPww105To8Ucp3jQXFjPj+EExi7SLHHdDP8a7zkGH8manAx5
 Sa2A==
X-Gm-Message-State: AOAM530itqDEDLS6e+2tbm7iicjNlTgAdSCh1RWRfr8aPYCTCyLgvrzg
 lf/Q8/RiDOnqdv7F4dTYpXq83KLdOMTd7s+tPyUSHQ==
X-Google-Smtp-Source: ABdhPJwd9DGlMNrAW6gI7tM4340jxQj9pjQVaDEX2Q4hWtzzx8HXNZ7pxFXsx6Wo1HozXJdq0KKkggPoNqN1xeVn2lo=
X-Received: by 2002:a05:6214:260b:: with SMTP id
 gu11mr610476qvb.55.1640046532043; 
 Mon, 20 Dec 2021 16:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 03:28:41 +0300
Message-ID: <CAA8EJprTe2sN_vTBXMsxbM6rzuDsUXTe9FjQUAjRcOgqWPxRQg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: Add sc8180x DP controllers
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 at 03:25, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
> Changes since v5:
> - Dropped DPU hw catalog change from the patch
> - Rebased the patch
>
-- 
With best wishes
Dmitry
