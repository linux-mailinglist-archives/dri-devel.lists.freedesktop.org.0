Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE35A38D3
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 18:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC5210ECE8;
	Sat, 27 Aug 2022 16:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4327610ECE8;
 Sat, 27 Aug 2022 16:42:07 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id j5so5699999oih.6;
 Sat, 27 Aug 2022 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZmxTNJXdfZJJ2Pe5JS3kCmHqPvETpA9u1Q36GaimG9Q=;
 b=WfNr5KGqtldRVuwfZONE+mIxQ0mEB5GJ4odOwhsZUPEPZ1UY84Rr2MF9je/ddUvf7Y
 MV3EtpWzq6UODVlTwUDV/EHVqvmm83oWxxIEJbLPTez587GAA2c0AJEDQUAJmRW/XIhT
 FX4YYJiDYwfId2Vc1++QvsIfsXsjxD0nNnw3fL6i75AukOj0Le9iS+qOwUsaRYlWm1Mg
 JkczjQMz8mV7bQIdIyKE4Bo1nq5fbvDFa9UuqVFjcamJBDhwXMp5RcVhFd4ni1HuV4Gq
 QLj9f4c11qrRbPm9MZN/STcSDtzxpp10D380N13sihUqh2CRXrwdg3l+4Af4OHmxEszP
 rZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZmxTNJXdfZJJ2Pe5JS3kCmHqPvETpA9u1Q36GaimG9Q=;
 b=utC/JAHA2tkpTK+NQJGBLS+r/ZARaiV21gaWePdRP3TsIv824hxBQRUA5XcULCoIU6
 hMOxSMJGFD5BPIFNBpB0oPTf1zpfce8zcNqAILuzUln8yE7X0tkRpCkbqz0/CKP72HVP
 7SJVYyQkGOROOdJd8ifkGpObHYbt79rLmNzeM554WWXfhb83v0YDytMpsI6EigEScwLk
 W5ekdqqEbMSAO/FUA5MglEas53XQH5VIzCzBGiy9YQG0g99iJb/EWd28rBMSBEUAsOwA
 pLBN6FVtTBYJ1o7bZ/ie5ONsiwbq6ZDurrTNlBJ3eiTCbjwIrmWJ1oSFtXTmtIw4Oke1
 lWhQ==
X-Gm-Message-State: ACgBeo2slWaf4/yXG4stITNpVcID1J18I+EbUZnQgyOfcfMoVjcz9kA1
 xguJrxsXIjv7h+LjqMN1+MowLeRIWCs4tZwSdQ8=
X-Google-Smtp-Source: AA6agR6Wqr0YeZSEMWsmFyC16ahJ1c45RKtBIAagiDq5AHfxZbKwsuTkkIACI1f83+S71M3mN6+sVUYEeO+H5K6QcNg=
X-Received: by 2002:a05:6808:238d:b0:344:e5f9:db34 with SMTP id
 bp13-20020a056808238d00b00344e5f9db34mr3739338oib.183.1661618526484; Sat, 27
 Aug 2022 09:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
 <658faa4e-ad16-7b13-87f3-27ea91db4ba3@linaro.org>
In-Reply-To: <658faa4e-ad16-7b13-87f3-27ea91db4ba3@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 27 Aug 2022 09:42:42 -0700
Message-ID: <CAF6AEGvX_J_t04tUUxserXh_rrcdu5eYTt6JOHoD-SJ6944adQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix repeated words in comments
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 2:43 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 23/08/2022 14:54, Jilin Yuan wrote:
> >   Delete the redundant word 'one'.
>
> The whitespace is unnecessary.
>
> >
> > Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
>

jfyi, this comment (and associated list-head) is removed by:

https://patchwork.freedesktop.org/patch/496131/?series=105633&rev=4

BR,
-R

>
> > ---
> >   drivers/gpu/drm/msm/msm_gem.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index c75d3b879a53..e300c70e8904 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -118,7 +118,7 @@ struct msm_gem_object {
> >        * An object is either:
> >        *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
> >        *     (depending on purgeability status)
> > -      *  active   - on one one of the gpu's active_list..  well, at
> > +      *  active   - on one of the gpu's active_list..  well, at
> >        *     least for now we don't have (I don't think) hw sync between
> >        *     2d and 3d one devices which have both, meaning we need to
> >        *     block on submit if a bo is already on other ring
>
> --
> With best wishes
> Dmitry
>
