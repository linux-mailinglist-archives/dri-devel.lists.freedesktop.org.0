Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62B531EDA
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 00:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700E10F31B;
	Mon, 23 May 2022 22:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BCA10F31B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 22:51:49 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id dm17so13153796qvb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3vcI1skfMKoqTzgW6PwoPYdHQpeyuuPuHAsg8j4YyY0=;
 b=SK9Ai50QmK6g6drZEH6TCZVx1ybdkR30gnwYdm8OX2MZCjPFMpadH8tfGN3bx+9Td/
 JV4EOdx30Sjs+Wg+3M4XzuL+MmICDQvxsjNn2upQIy/Cr3xj68l6ozh5NDZaEZ1s1MhM
 TP2EZ2UeFyTtIUDrq0OkG13phXlQ3YEFq2qdYhlMDss/hhT0i37Q23MzydGmfgrwxVVD
 1Ynl64Hw5+VjP6MxxOe8LC+afzQGyF94jDraJmba/Q9zz0VC4aa7Y7boG0hwCN5gTW2x
 eABDT1He8d4kgRdJTTSaINbiF16ijulZOPa6HhTqFr7VSpwqjfwhDTQs328T9QCkXIj2
 8nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3vcI1skfMKoqTzgW6PwoPYdHQpeyuuPuHAsg8j4YyY0=;
 b=0V/yfRBR33kMsYNiO6b7ZN01Mu815n6dorqHn+HN2tjHgJib0oipWgK+9bQAu7kreV
 uv2gbglz2buf1yn3yh0/Ac68zohOdTRQaFzLVuD6XH6CYglU24nOKAQx2CwRoSLPMj6M
 lOM8yW4e0R2zNrJGewxGD/uvhHwkVAwuYRYSvGQ/C0J6g4QXYmzyOM215sgkIsofRdpm
 LkCDSq4pUfyzxVXXu5rE2Rd3eH5y2T8Je65BJ1uWaoelYZoHgLzTcaoN+Tzg3Iuv2U5y
 K9oOrHn574dk79/hu8W0GYasafmMlzSkvsr0GdoCycSs7XEDh4jOzv7IZdvlLQvSWqtS
 V9eA==
X-Gm-Message-State: AOAM530964quIZ45p3/kvvuSQUgftEriJfphJVZUo5OkiPGH8EoYhhZg
 02gzExyPmkIQp1AtkFHootiQ2Oo9zmXjc8K/E96IHQ==
X-Google-Smtp-Source: ABdhPJwMUeQdsntLd2uLatzH66lXWsSEabtV+kiZYKsXgWX2xbdL3qvvkkPq6NF2azOSQPNRYAvN0l9Dt1B7OzOioVM=
X-Received: by 2002:ad4:5f4e:0:b0:462:3d31:6faf with SMTP id
 p14-20020ad45f4e000000b004623d316fafmr5677472qvg.119.1653346308200; Mon, 23
 May 2022 15:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-9-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-9-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:51:37 +0300
Message-ID: <CAA8EJpoPv_J=hpc9ETjngyAxxqJYvSFtJUgu3U3r6n8JNMuJWQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/msm/dsi_phy_10nm: Replace parent names with
 clk_hw pointers
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 92 ++++++++++------------
>  1 file changed, 40 insertions(+), 52 deletions(-)
>

-- 
With best wishes
Dmitry
