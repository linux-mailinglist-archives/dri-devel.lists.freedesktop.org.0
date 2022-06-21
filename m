Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2A552B11
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 08:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F8D10F7B2;
	Tue, 21 Jun 2022 06:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543B10F7B2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 06:37:58 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id 89so19059645qvc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P/ZHdlDT/z0JI9+6gk/VhCpD+I3j8EEmsNtdy7Bk49Y=;
 b=no69+S00OHtDn40C4P/ra6GtR2wAm+qZUvTHZI8jEsM7uozh3LIqJgHR6kVRnWoKij
 HhYRSmz/G5z1mA+Kjt9FNiJcqYNTEvbTEkRDTJE7JtvW4lkAMDyGjTfVJuM2UgNeMXJl
 gePm1zHlxL/iFGGe8Os0UpF4giF7MlwaoSf8cr3KSA1Qcx0CN0fYl+bvVQz47ZOu/tK2
 R6jd11qjpSMC90G8aXCxN26qHzzJE5S7JTra7sG7a/1N+FfGbn9O8a0Awa9p9QzPDFTE
 lyouT7/Kl2thQ9ZUkf/mIQ1DbMNmYlJfg0HXEP2wEPfy+uekoBE3ry59aIvICACUGrBc
 aStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P/ZHdlDT/z0JI9+6gk/VhCpD+I3j8EEmsNtdy7Bk49Y=;
 b=geHu6shtouu5yQ4/HSOrb3uIzqNuJ4wK5eN+Xz/KNFhYWuaEwqtNb5WsztRG9TTsMM
 3LFuPVoaRU7zZxI2fHpGjakAUQ+iDtqTjGR0xGA1xHd2Te+NCgTU+bZqT7SIXHaNCYJd
 iFGlZJ4YX6ZpRk8fd8f2EwgVRt4yO52QIuvA8x0F8LxiL8Hayq8ZprsO+9bqrc8C9cIz
 dgj+hIX0sh4VOB8aTCmHYaBtQC4OV/5kLyQSX1/KcFNayq9PaVZzInKvBX18xkgO+gyL
 hGDRHxHnEG8QZaGk4SjzykgOjslymmjg1+HakatkdkNQCd/UpEDf+Gw+ceAxBpUJL46C
 v+7Q==
X-Gm-Message-State: AJIora8K6IhTjhbXs2MYn9DtrNMDuWyR/fpx/idInmt5qNOKQ2vVLTyQ
 7kuoHGqgMarahqX+nUmrLTRlx+CE/4UUbrWmfO9J5Q==
X-Google-Smtp-Source: AGRyM1urfcxXJusoqWuxDZVZribTjRxKDV1QpCSj5lZ2mCOm7wDgdqhAecge8mYsCHku6y64EqEoRchNmz8hELQtKMI=
X-Received: by 2002:a05:6214:d8d:b0:464:51cc:a552 with SMTP id
 e13-20020a0562140d8d00b0046451cca552mr21693032qve.122.1655793477402; Mon, 20
 Jun 2022 23:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220621005033.274-1-quic_jesszhan@quicinc.com>
 <20220621005033.274-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220621005033.274-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 09:37:46 +0300
Message-ID: <CAA8EJpowsVp5nOqbo2thDp9ojaTJhh8OHnL6Ot-C6ovzckGJrQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: Move MISR methods to dpu_hw_util
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 at 03:50, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Move layer mixer specific MISR methods to generalized helper methods.
> This will make it easier to add CRC support for other blocks in the
> future.
>
> Changes since V2:
> - Reordered parameters so that offsets are after hw_blk_reg_map
> - Fixed mismatched whitespace in bitmask definitions
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
