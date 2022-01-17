Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2CE49057D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAC610E634;
	Mon, 17 Jan 2022 09:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2264C10E634
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:56:01 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id j27so10404744pgj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m/3+/Ya8A/t0Zs3k5TRLRVMNpXI3nCW4mrC2EC98WGY=;
 b=zX0uwFtFUQyY3zuHCUJdl3bGzMV/ZsT5DZgImYrFQEDB/ZzrBklN/7TDeb4kuOfOo7
 WkU5YOQq4p+B+VI1U5j39XP2nDLBO+5rA1qLTmvxb8cLrCEOFTTvbvqdNDuIx1e0A5Th
 q1ayMqEpzLnOANWpiVNpmCDl5LHU23X18hcqy3e+LFbQSeS7jcIcNlkppYk+QKk+UIqQ
 8/f/xe42iylPkKYjUY8tuBRjfOGGPB4GuZPt02tvjBRagGMSExjhUqyNLpt+H0lQFjSA
 aYBiiRq6mJjg39E7bZn2CWi9ZQv+dubXzr06p9lWiZDAMCj3C9UL5jaZN7d4RlHbO1di
 ataw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m/3+/Ya8A/t0Zs3k5TRLRVMNpXI3nCW4mrC2EC98WGY=;
 b=RRi5zvbDbvChAnTGF06uGb/kxIL65OmYRclreKRo9UayAxccbDucoc02pgh65kMwil
 XYqoRofUz3Z+veUcUR//Q3SBXsZPm7R8+uogz2PUDhWPMJFNMCwK6XSeVnz2dIaFbehf
 hJG2ilFx0+bprLRbO26OKSyfpdw7jgGtI7yzzV4iccteS7zsB+X0H+9NQiiy/4Sj7FVz
 UhaGXaaC2xTP7pPTtguHraTW4GAe/NNbmiGxmv6gGCYmvFUecjvKNaTCbZICcxOVpPXy
 s4c+mqPSblzsURCUcm5KJT6gUuID9n1jcYDZPna2iMDeMi7Ako5lybnMlwwSdzFHYTWR
 3Mpg==
X-Gm-Message-State: AOAM5318cvIb4DNPWJikxlzY0FGiGI3EORiCoRl4WhXU+65BSrEgiLIS
 WpG/8UI9lFSD/3XE0LA+Rf9P5d4l59VLBMCvN3WiBA==
X-Google-Smtp-Source: ABdhPJwtdtf2YXPOoQIUyoQeKwdIjVikJWuSSpRSiZO9oVeCc8Ej8hX1RPlbMBgCfCTeH6sUL8KyfLOstMW8Gc0E/ss=
X-Received: by 2002:a63:2b03:: with SMTP id r3mr18289662pgr.201.1642413360789; 
 Mon, 17 Jan 2022 01:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20220111184347.502471-1-jagan@amarulasolutions.com>
 <CGME20220112100521epcas1p10beeb5ac3a77a212810822266badda3c@epcas1p1.samsung.com>
 <CAG3jFytb_huJfmzPxeOwwBKbRjD0KXq1X49G2ODbif_e5cYp4g@mail.gmail.com>
 <0804d45b-7ca3-1e2a-cff5-038309bea686@samsung.com>
In-Reply-To: <0804d45b-7ca3-1e2a-cff5-038309bea686@samsung.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 10:55:49 +0100
Message-ID: <CAG3jFyshPasynXvWbyoeyAWnYXwMc76TwMnw2v_diHAOEFhHxg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm: exynos: dsi: Convert to bridge driver"
To: Inki Dae <inki.dae@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

On Fri, 14 Jan 2022 at 02:18, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Robert,
>
> 22. 1. 12. =EC=98=A4=ED=9B=84 7:05=EC=97=90 Robert Foss =EC=9D=B4(=EA=B0=
=80) =EC=93=B4 =EA=B8=80:
> > Thank you again for catching this and submitting a revert.
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org
> >
> > Applied to drm-misc-next.
> >
>
> Trivial thing I think but just notice. With this applying - original patc=
h set and revert one, merge conflict may happen on drm-next because drm-mis=
c-next has this patch set exynos-drm-next tree doesn't include.
> Leaving this patch history in drm-misc-next is correct?

Thanks for paying attention to this.

If we end up seeing a conflict, the exynos patches can go in through drm-mi=
sc.
