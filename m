Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5358E179
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 23:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429EFC83B1;
	Tue,  9 Aug 2022 21:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCD3C83DC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 21:05:49 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so15509784fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 14:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=46DbGyQMRqNHGkxsacJCotXRTrnXUBQPUgKwQCTQR8k=;
 b=hKJ9CRNm64FZ36uHItRlkf0idiXTuCMHIGEr6dAZWogMfifrszy0oFCa8H7K6Cah9D
 55TjcK/iPn+BvOBQtb3mTI/51rUKzCQKkeAftF7q4oAP41j2EtShrtivvHKSpR5bfZer
 kKomkfpi78zEBQWdUTGBQsWZoO1hLcqLrubVg3hbnYziSqG7Np8t99DOzJt15uvfu4DH
 lIl3P/v4VaAuXaU2DVxn1GSS9n3BdSp8H0AaoYSW06MbcdfjeAjzYF6jJv0KLF0567nM
 IvcbioXxyho8pz1HTFTb4zgU+MfEOO3JI1a95UB3T4VXsLIsG9LxbQS1K6baKYW1BMBZ
 sV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=46DbGyQMRqNHGkxsacJCotXRTrnXUBQPUgKwQCTQR8k=;
 b=2dZA5Hy01PmupJaEp6borLoh/pMbHi8xdcvymD6nlwTO9+crhTFvxjKv8OGpvnXXrs
 1y4284KueoFvD7z/9NxiJH4enj45u51gjyQViHcOhysOgOP0hTEqRtMwMuPBDY8D0jAs
 7EFb6sSI9n0/gn6D/uyBsdK+F30idDsgWKzfHGpJ7+7ld34i2itQw4+aVX1OSgu/ZWn+
 b420iMxlVNT8tb9cchh66CM3SGCp3FcYJqgXKNMDmdW6u1fUvD1MnAiqKGr5y6EmMo+n
 CQCQPAJuWqDITmjsKDbIHgetxC7OSQmBBuYO2oBbYqP1RWOZoAEVy4RXFBPGtOccCS8C
 Wurw==
X-Gm-Message-State: ACgBeo0U9liD1pIXrRHsVUQxGFXuu/dBlhCYM9kpSzPmIBy9B9AFdtz5
 +PTU/o1Kx1yeMWoURrafFZfBrg==
X-Google-Smtp-Source: AA6agR7/jfhQKdcyS9t/lnwAnJxheoLryGMKECjJwkUJ1IJiQ9e3xVupz1MV7wbT5OutnB3H7N+IWA==
X-Received: by 2002:a05:6870:5818:b0:116:a478:7f6a with SMTP id
 r24-20020a056870581800b00116a4787f6amr170549oap.204.1660079148210; 
 Tue, 09 Aug 2022 14:05:48 -0700 (PDT)
Received: from baldur ([2600:380:785a:7aa8:200:ff:fe00:0])
 by smtp.gmail.com with ESMTPSA id
 s70-20020acaa949000000b0032e3cca8561sm214842oie.21.2022.08.09.14.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 14:05:47 -0700 (PDT)
Date: Tue, 9 Aug 2022 16:05:43 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using
 'reset' inteface
Message-ID: <YvLMJ2yQRhBFp2y9@baldur>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat 30 Jul 04:17 CDT 2022, Akhil P Oommen wrote:

> 
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal. To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.
> 
> This series is rebased on top of linus's master branch.
> 
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
> 

Forgive me if I'm assuming too much, but isn't this an extension of:

85a3d920d30a ("clk: qcom: Add a dummy enable function for GX gdsc")

With the additional requirement that disable should really ensure that
the GDSC is turned off?

Regards,
Bjorn

> 
> Akhil P Oommen (5):
>   dt-bindings: clk: qcom: Support gpu cx gdsc reset
>   clk: qcom: Allow custom reset ops
>   clk: qcom: gpucc-sc7280: Add cx collapse reset support
>   clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>   arm64: dts: qcom: sc7280: Add Reset support for gpu
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>  drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>  drivers/clk/qcom/gdsc.h                       |  7 +++++++
>  drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>  drivers/clk/qcom/reset.c                      |  6 ++++++
>  drivers/clk/qcom/reset.h                      |  2 ++
>  include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>  7 files changed, 46 insertions(+), 4 deletions(-)
> 
> -- 
> 2.7.4
> 
