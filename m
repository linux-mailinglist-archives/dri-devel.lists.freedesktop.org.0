Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B181C48AA72
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9B6113F8D;
	Tue, 11 Jan 2022 09:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A75113D44
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:25:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h2so53996169lfv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y8mwq/91wKR30uOg3+FsI/MTSBZvRcJrn+c6MHJw1YI=;
 b=EnShUE9NSE50KzW659GLBONwodhP7P5Rdwsc/b+JyCl7eScuxmTRJ4kLmLvHV3xdEU
 zVbDDA61j/Hr0RaoTAc0vAcAcZ38+U1dfibNxdk4rGG3yEd5X0dnwJ2JkVOjQQhicB9h
 iIBhG8k5Lq8hQtT81rymDsMRKLH6TkUtIsevClsUR1Lmrnk1akv4C9PNL0p38Ko7JnNJ
 VPtt8jkhCNHTucJXwM6/Iawr/oKP/dQiVbHq319wj82XGoRd7xlO90HDdaoLLUk0wLxa
 rs/4fpXTJruzSvmIvxIhs5tibBTbKzY4WkFgx3MZfhDK65w3T/kvM3syCGZzoGiTYqgV
 xutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y8mwq/91wKR30uOg3+FsI/MTSBZvRcJrn+c6MHJw1YI=;
 b=O1Gx55EaCdk6gVqnTxbaLNmavGF0RDaYcyc7JKSVeskc7Lvw5f+hPtJnSeJO+TqR0i
 8rGnM1O5sEzuW4HSf3iEgAgwLGcVgz2U41f5zD0IL72bfjV8ftTeA0TR2oehIy/4CZqA
 CjubEw2V40LODcJbFSl76+YMpNTfwBvGBNKSDemFlDQEME46NsghnhDdtZDtcX4Bh4Oe
 wRZ2rozTYeMaPzs05IIgsoGVHU35Jh18OAkKpuYs53xEvGmLrXp2SiQBZgH9vuZ+IVrs
 VPGStSmQwnElsp1OXBgl/4hMOgALGcvdH3j5HhxSsP8bUKMyyM5U8U4z8MF5nQShVHRA
 Tk+g==
X-Gm-Message-State: AOAM531pMPiBR0Uqazjtu/eHTPoPMmkMutFgq348WLxMEaubcDjXfthi
 GaiG+ijN0TWau5FEiAoFAOT3ew==
X-Google-Smtp-Source: ABdhPJzbbt03hC5JHFQCN3xoXCSkCExpSRmhV0MK/iIxT3xmLrp0hbKOc3el+1npZ+njNmYfug6eJQ==
X-Received: by 2002:a05:6512:448:: with SMTP id
 y8mr137177lfk.652.1641893118929; 
 Tue, 11 Jan 2022 01:25:18 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u11sm1277914lfs.21.2022.01.11.01.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 01:25:18 -0800 (PST)
Message-ID: <b889b926-425b-dfe7-3a0d-edf2ef947ebb@linaro.org>
Date: Tue, 11 Jan 2022 12:25:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v10 0/5] group dp driver related patches into one series
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2022 23:55, Kuogee Hsieh wrote:
> Group below 5 dp driver related patches into one series.

Could you please rebase this on top of msm-next?

> 
> Kuogee Hsieh (5):
>    drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read
>      failed

This patch is already a part of the tree.

>    drm/msm/dp: do not initialize phy until plugin interrupt received
>    drm/msm/dp:  populate connector of struct  dp_panel

This one does not apply because of your dp-bridge patch. The conflict is 
more or less obvious to fix, but it would be nice to have the proper 
version from you.

>    drm/msm/dp: add support of tps4 (training pattern 4) for HBR3
>    drm/msm/dp: stop link training after link training 2 failed
> 
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  12 ++---
>   drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 100 ++++++++++++++++--------------------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   8 +--
>   drivers/gpu/drm/msm/dp/dp_display.c |  98 ++++++++++++++++++++++++-----------
>   drivers/gpu/drm/msm/dp/dp_link.c    |  19 +++++--
>   6 files changed, 140 insertions(+), 99 deletions(-)
> 


-- 
With best wishes
Dmitry
