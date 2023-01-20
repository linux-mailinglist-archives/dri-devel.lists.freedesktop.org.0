Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E5167594D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 16:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE1F10EA93;
	Fri, 20 Jan 2023 15:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ECC10E012
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:55:00 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id d16so4427457qtw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cIZBov414cRAviPU8wwR8NqtPTpO7JU2x/UOZjpaEK8=;
 b=I+/367Wr7qAl4QZ19Xa8tMaf6OqBl6nT+owiFtMqLB3/Pk1nuu/DhyGmoEK7Lb+cBd
 //6UGaGGTvOGvzJ/mWDIIYHpM5WkOc2aTbH28Z5mpomge2PFcZWk0jPPE8ng1P9KJICw
 kYEMN9hgS7OBMWqEVVXpEj+uPpGaVXdsBHwT1L5aA7FsjQPf0Z3TStJ+iaepVd5A72HF
 wvf5b52cvYfFrjB5l0ouephNq/+wZXsmyY1xI7jEACR3zpiFVnJGl1fUMjGlE8xgQr2+
 9GwZy1WuKMfqeSoyDSpeMrCnVUYV9UONb7Y8Ru7Xa3AMfHs1LyJSouAVHeWITYRdqKw5
 NHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIZBov414cRAviPU8wwR8NqtPTpO7JU2x/UOZjpaEK8=;
 b=WFuYR+pxJ9kd4gHO/2+Kvf0AYIy9MVsoznMJxFolklSAO4Kq75pb8SfCQiJWM2e//f
 wOsxpeFOqLgnv+smpwg0kRLJzvrk4cnbsZ8Q1W7xRKo+W8zHyrkTNGMRHaODqiACI1J6
 KdFxddfFDMp4uOOtFW555Aat1pEQYPoUBHI8IRfTK7wband0qEVv0dzw/+iyOhfTFmrn
 CjDIdhVjXvnfi+05b8nYw6mxRqheaiC4IVUSBWyhdUVwzl3iC1W2Suuy8jaYJaiswvJP
 teCe3EJN1GZSxg3w/6nyvHizJQJ+XrNK50hkVFnBcfAE+9cHDl/JUs0BoEZaCXEgvvjU
 CKmg==
X-Gm-Message-State: AFqh2koMU7+Mo0yYq2rqKTQyUBjZsm0GR12WRauGbr+hJsd440CCOZ6y
 kp0mqwj2YJcHmXzq0v/B5Xc0jg==
X-Google-Smtp-Source: AMrXdXsjEvmwrWcwoIJKQJn80PQaEbBtBLRSxwKE/E0XlC2LInWRVyvOb56cD5VovaJaFNuBUXq/4w==
X-Received: by 2002:ac8:7ed1:0:b0:3ab:5a62:453b with SMTP id
 x17-20020ac87ed1000000b003ab5a62453bmr21415426qtj.53.1674230099206; 
 Fri, 20 Jan 2023 07:54:59 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05620a40d300b006cec8001bf4sm26567015qko.26.2023.01.20.07.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:54:58 -0800 (PST)
Date: Fri, 20 Jan 2023 15:54:57 +0000
From: Sean Paul <sean@poorly.run>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Message-ID: <Y8q5UfpIg0+qnAuG@art_vandelay>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-10-markyacoub@google.com>
 <aee03688-54b6-ed9f-e32c-b46e31d72198@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee03688-54b6-ed9f-e32c-b46e31d72198@linaro.org>
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 arun.r.murthy@intel.com, krzysztof.kozlowski+dt@linaro.org, hbh25y@gmail.com,
 marex@denx.de, ashutosh.dixit@intel.com, abhinavk@codeaurora.org,
 javierm@redhat.com, quic_khsieh@quicinc.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, jose.souza@intel.com, rodrigo.vivi@intel.com,
 bjorn.andersson@linaro.org, sean@poorly.run, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, Mark Yacoub <markyacoub@chromium.org>,
 andersson@kernel.org, linux-kernel@vger.kernel.org, swati2.sharma@intel.com,
 manasi.d.navare@intel.com, bhanuprakash.modem@intel.com,
 dmitry.baryshkov@linaro.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 11:35:32AM +0100, Krzysztof Kozlowski wrote:
> On 18/01/2023 20:30, Mark Yacoub wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch adds the register ranges required for HDCP key injection and
> 
> Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> This applies to all your patches. Fix it everywhere.

My goodness, this is peak bikeshedding. Surely we have better things to do with
our time?

> 
> > HDCP TrustZone interaction as described in the dt-bindings for the
> > sc7180 dp controller. Now that these are supported, change the
> > compatible string to "dp-hdcp".
> 
> What does it mean? Where do you do it?
> 
> > 
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> > Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> > Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
> > Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4
> > Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-10-sean@poorly.run #v5
> 
> Drop the links.

Why? I've always done this, it seems helpful to me?

> 
> > 
> > Changes in v3:
> > -Split off into a new patch containing just the dts change (Stephen)
> > -Add hdcp compatible string (Stephen)
> > Changes in v4:
> > -Rebase on Bjorn's multi-dp patchset
> > Changes in v5:
> > -Put the tz register offsets in trogdor dtsi (Rob C)
> > Changes in v6:
> > -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> > 
> > ---
> 
> Changelog after --- .

It's common practice in drm subsystem to include this in the commit message.

Sean


> 
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> 
> Best regards,
> Krzysztof
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
