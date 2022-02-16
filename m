Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3704B7D18
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B83510E605;
	Wed, 16 Feb 2022 02:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13CD10E605
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:17:42 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so861939oor.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=LaRMq8ZhRCaHC8armaDs2spovSgD/IU1miVPMO3NaCs=;
 b=ZDc5CxFeekOyijQZ4h5KQniJAMH2o9I8ZvmGzmDO2zfxpGeolNEDVpyCqlaJ6Jw/EQ
 QuU7c7QyhcC4G7d6LTLkWesxBvXqAasTUO0w3txbmOToQ1In7mmICQr/j74fGbfcbcgn
 3d1VpCLWuT6leZVSTFVtv6qbZmN8YgfHr4/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=LaRMq8ZhRCaHC8armaDs2spovSgD/IU1miVPMO3NaCs=;
 b=IabV8g29wHX36CoseOTrdqgtuP52gEMWRxkK3ZQbG8Sncl/d4YVQovUfj8L8G8giwu
 DqubsmYhmfHVll0fKEOeKGpozKmgX7eoobNcHfb/XSQd0bs/smpUv2Ha3Zbpk0RozN7e
 ZzPTXOOmaIDcC12lOGe40aihsuPN6TXlz+yjvmC7MODQQSR9uoJQJA1xQUQbhQ3cpTT8
 YA5mohxszgrRrk+pIbtUeM1y1UJZFMTBY1pQ9bWMHEeJFLiw/7cbOJOB0IF0tHVPyhVP
 B2P+Y4MhYgJofTBkSTMDXK+b96L5nm6+P0pRpgDl7hBGOV1jQkrPJ/oDbJo4BnwEBvxK
 L67Q==
X-Gm-Message-State: AOAM5334d8n6UseEZHocJOfFx7pJwzdbxEVZkH4tzU4IAlc0nwQUEtSz
 G1yI6qdx1xOpMIFFBTa+VavNa2uA7CoRn97m1T3XWA==
X-Google-Smtp-Source: ABdhPJyw8QdTeLdPkaSbn9MW+CqLKQfUvO/jujNN3XsSr4MZgwU3uIvJJqRAk/vug505l/EEco7tmML/hPNkhCH+j40=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr223719oos.1.1644977862132; Tue, 15 Feb
 2022 18:17:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:17:41 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-2-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:17:41 -0800
Message-ID: <CAE-0n52hXz0tptXxip4vJdPPfXa+Vk738+F49j66swAhTgSBXA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/dpu: remove extra wrappers around dpu_core_irq
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:51)
> Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly into
> dpu_core_irq_* functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
