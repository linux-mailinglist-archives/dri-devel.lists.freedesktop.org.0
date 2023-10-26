Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A637D89CC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 22:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE23210E8A8;
	Thu, 26 Oct 2023 20:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A22610E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 20:46:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6ce2fc858feso875516a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698353205; x=1698958005; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I/G02VsxhYJWjx+P8kMFTWWV+s1yYYgHb9RgEPb8krc=;
 b=eYutkuaXl3BBzWj6IjKxL2y4ExNpWeuZ+5EzAi8acrekI+MQrpqP9U6k19rFDpwGRe
 WC6NwhDgp9YcLYOZQyDQsLrU7ErnDKKeAa/Iad1/tosyB2wRGtVRZaJhA5dAeJA9Cf6r
 ZEdUBtbgfbZlgzpZEwoF9X7TY/Es0NLc2ahgGBqv2xcuKpJhha1ZqO3VMYowDNIUvc66
 KgSIuQ8cvKRnxMymhnnd+/rA8nnK9v4xLCaDogpi4FY3SQZ0flaFpWWKzq8QRi8oojkW
 Lncfu2l7+PhcnbZ2sSIguQGjv72772HP0nzoCeD2LRtVbb+3cS5kVUdKbivonAj/0erP
 GTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698353205; x=1698958005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/G02VsxhYJWjx+P8kMFTWWV+s1yYYgHb9RgEPb8krc=;
 b=Q1TYVXEYjzl8+spiNU1r6wHdQlKTgzB+mTCQ00hMW804eN/x6Lat3yaP4VBDpFJj/e
 Sv+jExK1N/cmYZaSM+2iWEgagpvSIRQjDU7fdGAJLew8FgZV3aVtZQLNf2C/RCWyPgCf
 4ZsYOHMECFOXZ3qBZifiucmaKa8Dg91e/x8FjoRcEwv194n6OyRwrmBQWrgp0bO+GL7U
 6wtxoxzvVL92nLuPzEgPmFzF3Tm1C/dOibZKN5TQGPc+XVCJDVqRBTcA7NXUu41iB/U7
 Yx/RQfzAAjiMbMOUSzzekDJeHAPRUDRR/pg9c8K1TXV2zuAuk9V6yHKkNR7logm+DG9V
 LnCA==
X-Gm-Message-State: AOJu0Yx07GXL403i1KS9ss7Hk4MnDIf22dGMdIr4FKcf9aXHOXuGNwKo
 1IcXK87vMf049lUE9FcMivE8UsIy9e6N+Ei4E/8DGg==
X-Google-Smtp-Source: AGHT+IFVa6fJL5TjjQrb46JjIVUSocFW+PYDsLYQl5v/O4exSYbtWF5+eYNBjXmSZw79pzDpYDJn2OV8FuRMoqSfUoo=
X-Received: by 2002:a9d:66ce:0:b0:6c5:233:fc28 with SMTP id
 t14-20020a9d66ce000000b006c50233fc28mr664232otm.33.1698353205417; Thu, 26 Oct
 2023 13:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-14-dmitry.baryshkov@linaro.org>
 <36d6379b-66e6-4781-b08d-ef90f6e47828@linaro.org>
In-Reply-To: <36d6379b-66e6-4781-b08d-ef90f6e47828@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Oct 2023 23:46:34 +0300
Message-ID: <CAA8EJppa8-M8Uah+=GBhG4bHvdGUwqgh0aj8o9rLfEdZq=JUKA@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with
 msm_hdmi_phy_powerdown
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023 at 22:54, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 9/28/23 13:16, Dmitry Baryshkov wrote:
> > In preparation to converting MSM HDMI driver to use PHY framework, which
> > requires phy_power_on() calls to be paired with phy_power_off(), add a
> > conditional call to msm_hdmi_phy_powerdown() before the call to
> > msm_hdmi_phy_powerup().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Is this a conversion artifact that will be undone, or does the
> framework actually expect that refcounting may not be enough and
> phy resetting will have to take place?

I don't remember why I did it this way. Let me check, most likely this
patch can be completely dropped as the enable / disable operations are
paired by the DRM core.

-- 
With best wishes
Dmitry
