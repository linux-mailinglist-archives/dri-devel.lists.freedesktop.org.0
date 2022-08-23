Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B959CED9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEFD11A529;
	Tue, 23 Aug 2022 02:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C269210E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 02:56:52 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so8988867otq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=pRP+8U5uk2FhrsR7FeF6rksjBRXFOZLP1bxG00VCGkM=;
 b=S1yE7/nR/xhnTOsCb6R09FAIiBcW9VLJt8RZ3aON13tDzQniu8n+fXwuYs7JvwdPYt
 RLoojZsaGPVMrtHXNQmeGkX2R+UnGtBkJDbttvGB5aj9/3xd3xShrXMrYipQ0UOLndl4
 HmiO/B+HQvfqvr4XJc7pVg13G5rpyAjBCdJGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=pRP+8U5uk2FhrsR7FeF6rksjBRXFOZLP1bxG00VCGkM=;
 b=VL+NtOZD45dY2h5syXqY45svkbsdPpGjGzl99y7+A765NRc9cr93U0cvERPkdB5L6s
 fBEew1+DKAR/3dSLyFBgKasYEuy6A4k4GSp3vrmNxE5uFGDEDQ+ijQ6BWRs9toy1wzew
 8nOmbbrqStK/ZptpArE/duLKTsoZ31sHqBTBDdGqZ/UbPRQULiMz3wkDPNiw23q77Ad+
 /HscF/sZ9axei1vZi5k02jICCoO89Wk/ypCW+MIZ19Yojkc+y78w3i08NzGYYStWRN7j
 mw3rfmF3irA+9peNtKrF0k5K5x5McjCqWZnsIYXeZNE5EqXhkDTAalX+aTJ133vatfbX
 PgRQ==
X-Gm-Message-State: ACgBeo1x3Ow5daLe0tR4brWm8TKMCiDdni2B161zOcqoCpvBRJIJgH15
 edhHF5JScq6vxSPXGwnxEC/2nK+ZjMnWSvl4oyg9BQ==
X-Google-Smtp-Source: AA6agR750VjH+sLACBIdPvl7p7EMj4bzSIHj6n6+A+g0qZB4hZGSar3BcfSf3XzBZAYBm5qPDenRMmSBgr862x3rDUw=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr9123790oth.3.1661223411932; Mon, 22 Aug
 2022 19:56:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:56:51 -0500
MIME-Version: 1.0
In-Reply-To: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
References: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:56:51 -0500
Message-ID: <CAE-0n51ajuJAsTXUmgcve-3TA37sOq1j_2WawweZYxo3L0R-9A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused memory allocation
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 10:24:55)
> Drop the dpu_cfg variable and corresponding kzalloc, which became unused
> after changing hw catalog to static configuration.
>
> Fixes: de7d480f5e8c ("drm/msm/dpu: make dpu hardware catalog static const")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
