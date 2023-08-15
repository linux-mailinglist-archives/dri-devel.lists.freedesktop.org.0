Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E526C77CE65
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 16:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28FC10E251;
	Tue, 15 Aug 2023 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD8010E251
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 14:48:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b72161c6e9so75748831fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1692110892; x=1692715692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibbiZiUA+psUXSR5jUh/+IlNRDXZdtdDillHT+rm3pU=;
 b=U6hg5sg6uAKSWxt0HUVBLWSx0P/Va40jtTADSEVuzIH5KWeO3zdr21ZbxzFVKpfBlW
 KB24HHDVpVo7o/EFigR2hlv89p5idw9I8cydSgr34swBjeccniKPaLFWsjj6eBP8fehe
 xUIHKwJdDXkOatWNSUnQLVWbU7I6GIGScGp5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692110892; x=1692715692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibbiZiUA+psUXSR5jUh/+IlNRDXZdtdDillHT+rm3pU=;
 b=YzEhVzNwVkFFeAaRl1jms/9pTXHY0v+d6xGEJoUMrkjHOu7O+FPsyu6oEDhr+qCkKL
 oDJRfoT1kaCKZvWLkCKv0vHBTBihAxhTHaawbE22shaBBnpGlYOO6D9iqYaVF2/MmQwc
 2gRlNaWHNdHLPeXOCcldYWOtd+/dX/Vt5SY0jfPZBbqjHY2Vmp4aP2ea8SROnOo1P0V5
 ZhxXmmvHL86+50lZB+idv0xtGzfC3DTiBgmMYgshc3nCGTtUTTh+uZxxhIBpFic6sTGO
 El/AD6T4fVsWPLMg6KRpgcrEmzk4M0gj8fUY+7XSdZJefUOxXkhZWn1zb+38tqoMidNv
 Igsg==
X-Gm-Message-State: AOJu0Ywd79vM1q9a8MswNnmGM47x6yKVvrOaQ78WqrpZ80o/1Ilh2gJW
 jMcPkvh+c6v1uL1TRv6B6dK/SShbS0SkCnfuzi+/jN3NXiBASq5+
X-Google-Smtp-Source: AGHT+IHTIyZF2a0Lewx1kaEyopouMrrXNjHT3NJi7iQHgr1EAUrSfMtmSq7xI4WQF76YzqD1XX4CAWsZeuHhipxQA3A=
X-Received: by 2002:a2e:9206:0:b0:2b4:6a06:4c26 with SMTP id
 k6-20020a2e9206000000b002b46a064c26mr710210ljg.2.1692110892069; Tue, 15 Aug
 2023 07:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
 <20230620054031.1203960-1-juerg.haefliger@canonical.com>
 <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
 <20230815135214.15aeff63@gollum>
In-Reply-To: <20230815135214.15aeff63@gollum>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 15 Aug 2023 10:48:01 -0400
Message-ID: <CAEXW_YShF2RMnsgTzjB1z6vLU+3oOv1vEPtWnmBT-NsREh88-g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Add missing MODULE_FIRMWARE macros
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: sean@poorly.run, quic_akhilpo@quicinc.com, ribalda@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, konrad.dybcio@linaro.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 7:52=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> On Thu, 22 Jun 2023 21:44:25 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On 20/06/2023 08:40, Juerg Haefliger wrote:
> > > The driver references some firmware files that don't have correspondi=
ng
> > > MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that=
.
> > >
> > > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > >
> > > ---
> > > v2:
> > >    - Drop addition and removal of zap files (needs more discussion)
> > >    - Add new a690_gmu.bin
> > >    - Update commit subject and message accordingly
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel
