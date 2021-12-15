Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278F4761C1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 20:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E569F10F879;
	Wed, 15 Dec 2021 19:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A3910F875
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 19:32:27 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so26201387otl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KCcCNfuto1fwE5eENpKC+nkF/sRCm+bkNjr97zeXP5k=;
 b=AhonrVu+8ZlLbXNMR2eSNrdEE4oll8p9p2eAk4XvDMUN6TOEl7ESsoWlqAajD2BUlo
 Q3SP30lGjRDjFsRSbz+fLXShWL6Xw2O0DsLTwzZ/RtslkBzbKd+kRGEOy2Vq/gc+2J6O
 sMM13+zGYZSPKKUoikyktK9mtBV/VariK2nPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KCcCNfuto1fwE5eENpKC+nkF/sRCm+bkNjr97zeXP5k=;
 b=cVVZv/fVUtUZYyZVZlPUc8IeOhTlq5ESvZaeAPvswHwEU/bonIml7ZB6sZfhXCk2O4
 fSVlbdoIkh0vMumyf67pr2etTldSBut0ilcilo0wBA/EgOxyC1XiR8fP0CMmrz1ritBW
 LmBbWFCEVaMosAJw9TbAgROHNgePBC6OOpuKIs8DCBMBhhs5Gte1QeykIDTeAmGipaEk
 dzuKC4VEzeMz11FbpNLupDBz46Hd2ROli3WjL0+EDSCdfc0TJZPT4X1e6PZc6pVcl6qP
 BzmshwN9kHP+Ps8YxbQzw+WvJ1y8UYiF/zTbQELcWeWWVePHxtG85YpLOQKIX1b8jOJv
 vilw==
X-Gm-Message-State: AOAM531rdf02qwdoBvcewaDZqxZHowe/3lgx9Wr1KL4CJtCVihBMwMlP
 yVjYiUjpGHWperveQA4fORvtHNH/t38Uu67AibcSlA==
X-Google-Smtp-Source: ABdhPJyexg/795HehcLl8cNNfOqwAGaPZ/BtHR5KlkmgOJqRlq5kPbvEb0Ra/YXyAgX2GsXKtwH2fkUpUy+sB92eL9w=
X-Received: by 2002:a05:6830:30b7:: with SMTP id
 g23mr9739312ots.159.1639596747244; 
 Wed, 15 Dec 2021 11:32:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:32:26 -0800
MIME-Version: 1.0
In-Reply-To: <20211215085554.444351-1-deng.changcheng@zte.com.cn>
References: <20211215085554.444351-1-deng.changcheng@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:32:26 -0800
Message-ID: <CAE-0n52Uf=rcGVxz1U3p6H+icOz1OoacdOFsQtDHCdcdKYTsJw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove unneeded variable
To: cgel.zte@gmail.com, robdclark@gmail.com
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 dmitry.baryshkov@linaro.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 bjorn.andersson@linaro.org, sean@poorly.run, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2021-12-15 00:55:54)
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> Remove unneeded variable used to store return value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
