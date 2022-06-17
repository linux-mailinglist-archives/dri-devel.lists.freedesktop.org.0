Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0554FE2D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A318D112C9F;
	Fri, 17 Jun 2022 20:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E79112C9F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:15:48 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-fe4ac3b87fso6840005fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=b27oiy6RHsUuT4Jjsfq7MJzNlUIQ2e5S3fHVAYvBtmE=;
 b=MA73/fhxKHTJ8uYDabaVtaMIiRBaepXPKVxGSSWGPGPA2K1mqga8UkOGtOeNIJJqIO
 4OOgQtLefRA+PHn0QrdoZTC2XY0RYPEac/Mb+GH7iF3qNpejDkZY6/2x8aZICMuKDH2S
 z7MCvFPVqJMwu5Xb67PjrtVxFReaJimZerCZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=b27oiy6RHsUuT4Jjsfq7MJzNlUIQ2e5S3fHVAYvBtmE=;
 b=4vErGOhbVKwaHncSg5Ih5zkM5o/bFBm1Kt1fAAvpAyGiWuUVyFsxLz/Z9XDXfjZ0MG
 +uGaOKnKz20eQg6XTU633pU84MgrbqlgF3k9cZKOnUFeCZrKuGwjq2+2al9/6ZLqK1GV
 3b0kD9TeGzyFtqOe7sDFScykyHPSe7cHNvpkVrzLl6ekxYSFCOSg+RNf0/PGsBsLyvti
 aJSHXN02swden1RsM3PDRTgwT6NkGt1y072FD2f7SgSofssNa8SpU3yXERIhAkPKPIh8
 pWXs1p3etiHNqmBcxl8Eoi3n1goSJl6AHZU3ccTF7BrJIUtSnMHld4or20VrARLNrbX1
 m3nw==
X-Gm-Message-State: AJIora9cfMJJt10M/LIRQmQ6KwwZOlW9m5b3d1riTRWDaNwLFFWrHAup
 daN43BO6AdWG8yXnlDQhTlh0MUlhOhZ4QQMlYHNqaw==
X-Google-Smtp-Source: AGRyM1vYWj5adjCr3oqYPXmSERpaa+NbEphqPPLnMroCJl0YCDYzfPeLgt++eJ4q9h+s/lTqKE32SR9fXSpMZc8eeNE=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr6489018oap.63.1655496947391; Fri, 17 Jun
 2022 13:15:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:15:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:15:47 -0700
Message-ID: <CAE-0n52VABr2xTbEtVyat8CLV=vzgRB3JQV+Undw56ECiHR-Ow@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dp: remove unused stubs
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:49:20)
> Refactoring DP code transformed several functions into empty stubs.
> Remove them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
