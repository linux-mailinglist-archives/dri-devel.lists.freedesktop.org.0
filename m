Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7634D814
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 21:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA416E4FB;
	Mon, 29 Mar 2021 19:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88626E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:27:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id gb6so6524399pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=KLlTAo4el/DFnNk+LNHJMO2kyu5BygdFuXHahiqxgP8=;
 b=VG9vKllJLEVGDoxMzgj9Ca/pHGciCQYIlbDtMvtq/UxPIoZJ7ECu6spWARntl5zsf/
 A8CFT16NL16g6h6qu6ZLx46tgg/KuMMZjqPKuBS6XcMnfxNXsZM1MfytkYVabIG6ZKDm
 PR3r01+kpuLeiEDca5bMktPktb/vRqeV0WdlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=KLlTAo4el/DFnNk+LNHJMO2kyu5BygdFuXHahiqxgP8=;
 b=oars1BxO3hwg1UXYPs/7tUbBNqZ8r4dsuy4sWCzd7CZ1DLqbdW2h3MajTvehBQicLW
 7PVFJdzaLYAQKbOLnEqjz6bmZDJcgnR8kyI/fAAtjGS8dBsCndgWNzqNHKxWn44PqmsA
 DWYAO+UZyQU386TzJLxObEBEACfFOVowR1ugpApUB2euss/fwFj1tSIWrMzqtwxfvwp5
 XGFIggV7x//v5qpP8afBjJDrumV06AYoxY16n61+d6EUEHT/hle7SzPMPU9IzSXNAC59
 0JRl7I9+3FA80qhJWrrQjoEnt6lp51ebNm7OJfh8xIEm74011MH850H+J8u4knMR0wFE
 4ghA==
X-Gm-Message-State: AOAM533IrmyVUrGeI5pnCawJkl0K+JFuNMXz1Sjd+BZhqq2LHluB1hUu
 qOijwxoWtoTmaXnY1/kddX7+eg==
X-Google-Smtp-Source: ABdhPJw1DhTcHAq11BdM7UZT1sQLUgR3VEzIOVIqTPbRMpjGdU3juswhlMA73YA6oU55nTpMohAISA==
X-Received: by 2002:a17:90b:4b08:: with SMTP id
 lx8mr616674pjb.135.1617046060512; 
 Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id j3sm305291pjf.36.2021.03.29.12.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 3/4] drm/msm: add compatibles for sm8150/sm8250 display
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 12:27:38 -0700
Message-ID: <161704605849.3012082.9945764472677336582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-29 05:00:50)
> From: Jonathan Marek <jonathan@marek.ca>
> 
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
