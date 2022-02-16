Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA84B7D03
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147A810E5FB;
	Wed, 16 Feb 2022 02:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428A910E5FB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:01:56 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso257772oop.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6Wmbu3EJTHz1mNI3CkkV4P0E8zKS2lBcLvhz8h1rG/s=;
 b=kE+NAUbJwM+UndQVoL3vCSB0zGnXd2EIJtE1hcSIeXu8C+PBIO/aeF1Gm0Td2qWuw4
 XYYdOl/rc+lvtXjcBK1uZNOAaKiJVHEObDo/QCjOJDF7HZOLrkpFeY6at9diZvEDsPTC
 6fMp3v7z7u2FUh6HdKHKhFpNni6FLI06GdY0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6Wmbu3EJTHz1mNI3CkkV4P0E8zKS2lBcLvhz8h1rG/s=;
 b=1TQanevvjB04cg/K3AbB8OsOG68G38gxOgdJBNyMR94dxw5raGRDtWdY2n/ex2PcJh
 h4ylvKmLURlXd6D+P7/dypikapS5wwQWbIBpIpf9eTq+cdCiuu3HtKk1PucKl0mCtX06
 5FrH66JiXvOhSsbad2nASwuOlBv2wFT9rr/SVvKDuknjklwy+k2krFlmm3HvA47vSajl
 RkI6s0iXbzfXUMBJc1GBTgJOjCnCwNki1nqorx0Sg6B3QBRNFXxOxDEtoU2CDsYIyuAe
 08Ygz7KF7NYEq5vDTzgVhOt7LZTqFw1mIN6SsHIIAOXSgHUIqNj/R5O6JOem5joBqcpM
 W70w==
X-Gm-Message-State: AOAM530m+ujxL379pEAUeXFepp2L82CY6qhl4w4T6SePMlogxs910iok
 1obr14vHk76XYr29EAVQvd5ue/IEcoL2U2c1Z3/BVw==
X-Google-Smtp-Source: ABdhPJwyPrbG3vOYY4Y2pjmlb3uTOssMjvoo873FPyIiobvt4UggvDXlixGwmrkAC22KDEsUvZPcsCX7qtF8dAKGDzo=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr208922oos.1.1644976915579; Tue, 15 Feb
 2022 18:01:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:01:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:01:55 -0800
Message-ID: <CAE-0n51aBW9NZWqH4FQsK7_Uif1JtbORdrVXVz1p10c-b+Mb2w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused access macros
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

Quoting Dmitry Baryshkov (2022-02-15 06:53:06)
> The access macros BLK_foo are not used by the code, drop them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
