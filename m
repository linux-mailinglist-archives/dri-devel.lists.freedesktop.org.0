Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634C487147
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 04:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CE310FA66;
	Fri,  7 Jan 2022 03:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64010FA5D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 03:37:01 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so5332298otg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 19:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=V9mvsC6DGuIKmVWqSZ8Hh/LgnzR2ZGlGS22EsE3aa5c=;
 b=gSpK8J4n7dxUsqwALzCNvN8wJ70GBoGsNjlrkbbYhD6WU2pNysbn/qal1NnPO+NrFM
 dj8t9ARs4nKO0fUdROf18x6bcu2KIZdRw/sU8s2RfNKQ8xpYwtJtmpSEuRvmrD4yTf8x
 O9P2bBGAeDrkzbCwSyidZj3iKWyTSeh2rjVcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=V9mvsC6DGuIKmVWqSZ8Hh/LgnzR2ZGlGS22EsE3aa5c=;
 b=gb1g7NOYd8oAGF1FnUhboilsLwDSbErQAyzmqS35yACMpOxBcQIFnwrjQgKYJfD0jZ
 jrC16Dyd4P+APOkw6GYyBkijqWWVPRX6Dtzk+mVPP9Wo81Hy9+rKPu0dfv52rOwKxvYk
 Eb502lO8wDT+X9kgmCWI/UvcIyEnsuFlFXfsq2vOXgXFHw7AxAddUxLXMl5qC62P/OFY
 0hUPKW0oCR9fplcnkwp2lulpIwifntrrLdb8u8gUx0Z3Go2DDUWdmGAwbL0+T1gl+Bww
 tEwGDk4Ks2mfv/NtP982LQkAsQ1tompPf3Z4IQtGjBnJzo7r0J7GPl3yilIONKOZ5v2E
 ILqg==
X-Gm-Message-State: AOAM533/USV/1fgm84B6Z+eQCIvENOSXkqNRovtIEapPlu+TAEGH6CDW
 2ulCPwDn+Uv/VHQcyjEsZi1Nlay0F0tC6s44TMQClg==
X-Google-Smtp-Source: ABdhPJyU0TGUnomL9oIu+YtgauKLIsxl0/No+gbVlEzQt9cSRx7b2g8hXaUYCjWvRTpSAEFsVO2YQWTDsqh0nBzcZyY=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr1037416otk.159.1641526621309; 
 Thu, 06 Jan 2022 19:37:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 19:37:00 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 19:37:00 -0800
Message-ID: <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
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

Quoting Dmitry Baryshkov (2022-01-06 18:01:26)
> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") the DP driver received a drm_bridge instance, which
> is always attached to the encoder as a root bridge. However it conflicts
> with the panel_bridge support for eDP panels.

Can you elaborate here? How does it conflict? Could be as simple as "it
attaches before the panel bridge can attach to the root" or something
like that.

> Change panel_bridge
> attachment to come after dp_bridge attachment.
>
