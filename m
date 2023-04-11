Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D06DE439
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEEA10E352;
	Tue, 11 Apr 2023 18:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BE910E352
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:45:54 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a3so3978585ljr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681238752;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Kt2nTK/L2DMh4Zod0ujL6feEggrKXdzfpI6LEwT2JUk=;
 b=Hs81WUoiVVFIM+ivFPb/jQA3EmIEneKSPEVpUp08IzmbfAww4C0KWAmhuzCDQdWke4
 JyeLR5vVRVO9FjudX6lOApI6Ywfr8cn1X0PHR0kvAemCLBX74PYeyck85YfJnOvReWRP
 tzL8xVJchOm3iJgFtKbDexvKRPhNCqCKZrEaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238752;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kt2nTK/L2DMh4Zod0ujL6feEggrKXdzfpI6LEwT2JUk=;
 b=RChcQ1kpFduZdfsZMH4rsXCAeJy/ZAEGwH+6HBX2OB+Dc8ZuiTHPovn2XUpM+mxAb4
 GLSQ7mNBtfLKoU+8VstpH/g92E0S+ouuCDyvAFCj7mkZyjfbxtgiwi0sPNBIFwWCP9ba
 eYexQLwMdW4h4ulL1dps0CvHzS9x48LBxtd7mVSrTBbzteNN7pNMPLurWMmfBacsKgio
 EykWGhN2bJKpiWRdl3DQZSYeWZr2viinARPqO5FT+dLjlrlGv9d55j9CUD6XTVRPrDxB
 QAWOaC3N4zDDlvYrobB/YHZL7i33e4JS9LUGNr/fZYFJNfYnJ7+2rOKakFhEAZDUHscW
 pDSA==
X-Gm-Message-State: AAQBX9fsDfBXX8CKCdKR6zrERqKzzRGWxq3rCgBG8FbnkFdi563hoL4A
 WNdP+VNLYnKI7/5jvFCmCvHKxpOKYQvvLdj8WINlxQ==
X-Google-Smtp-Source: AKy350YpHKHopzwKahp7ULmovKXZ2doN6DUUuycpVkj4o70reVBikNejCvg9q/0Hmnr3kFqrFu9jis5M6LrN1eYn65U=
X-Received: by 2002:a2e:b0c4:0:b0:298:b320:ee2d with SMTP id
 g4-20020a2eb0c4000000b00298b320ee2dmr71986ljl.0.1681238751946; Tue, 11 Apr
 2023 11:45:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 11:45:51 -0700
MIME-Version: 1.0
In-Reply-To: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 11 Apr 2023 11:45:51 -0700
Message-ID: <CAE-0n5370mhqN7egoTAWaLTHR-qYZu4R99aPJbrXe7snv3rerw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: warn if chip revn is verified
 before being set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-04-11 09:19:02)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
> to prevent such bugs from happening again. A separate helper is
> necessary so that the warning is displayed really just once instead of
> being displayed for each of comparisons.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
