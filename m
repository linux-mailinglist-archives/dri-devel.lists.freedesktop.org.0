Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239984E2F39
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8DC10E429;
	Mon, 21 Mar 2022 17:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F1F10E318
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 17:40:11 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id v13so12234167qkv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6W2sIVaPd1wN+ZQSZ4o9j1nJ91W2fIHQV8YHK4mslGI=;
 b=othMTu8DE+iag13P8/3A86+7Cc/DHfdnjpWo/byQ5ZUfFCsKml6d/b3+j7enHM3E4T
 p+KQDmhtptyFrPuooWSYmYPJhZWIkHdGt+4vDWYH8iYYuao36WWrhVCMkScMLZUcTZup
 pbxMXwiUoDBFmduoGs8/S8k0tsoBfeYNIRC0GZYKyyNpLf6jW7ygE9Q4oqBC51xdfcFk
 7ttNl5wra931kZmVavvxQVP/9NCHWg77ijwCiHKLw+zmH2XDabD4PX37zubDr18d1FXu
 LkskplWtgjBIz3OnXb1aT9cH4qssg21daGzI4dNto8OQ0PN0SvwCPVBwRyAb6Xlo3qN2
 FbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6W2sIVaPd1wN+ZQSZ4o9j1nJ91W2fIHQV8YHK4mslGI=;
 b=JwZUxM8IHQjde8u1MCCzk9KWazwVDP0ZqK77VolcZbcT3eHe/T1Cxf93mrF56vnFe/
 b6PB29lyVrIOmfLDTFM1lqlyLiu0SbZ+9R8PcxeoNL68w196rp+Lm6u79Cs1mBgeCcXN
 MsyjyrEsHfyaIvim1/vxhv3OkH4x+dEARf9lsk+vWWMKt/oHH8SG7T8AcTYmr/ljrpjG
 uwmuWGy58/nEJc/Us8ewPsgPKWntjFCpEVix2kHJRsZYvXdaCeu3BYu62ccP7Zbg/+44
 nRCq1DLKywtkft77tvd0JsGrWZCXkruJKGVXO6cIJNvTGjLTdGSjTWMcGZeXzB7jMLMF
 R4bQ==
X-Gm-Message-State: AOAM530RihTJgcWW/ABo43IBht/jnxH19xj99O3frrqVuOIQUpTeOIPr
 nRJvXyRMvVYDs/u9YsvaJH4fAEW5jP1cE45C4kmQ8w==
X-Google-Smtp-Source: ABdhPJzAfOtHcF9CqanODzAbHAfQeaYZMAZcZ9hv0xTWt4ZcE9sSN4BkC8am1z8h+EdgxGiCPhpJswcEmaek2cu2UjE=
X-Received: by 2002:a05:620a:2453:b0:67d:9539:495c with SMTP id
 h19-20020a05620a245300b0067d9539495cmr13674139qkn.30.1647884410564; Mon, 21
 Mar 2022 10:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n51vfoOK_6B0yAvws32MtLQ1SvBPoQPHBFE14TLzZFUZaw@mail.gmail.com>
 <BN0PR02MB8173BBD2C02F5DFBEBE94E40E4169@BN0PR02MB8173.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8173BBD2C02F5DFBEBE94E40E4169@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Mar 2022 20:39:59 +0300
Message-ID: <CAA8EJpribc722wN2jR5sQEkX6FiaE_SdBk8B5HPamCXZWhEd7A@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To: Vinod Polimera <vpolimer@qti.qualcomm.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 quic_vpolimer <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Mar 2022 at 19:21, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Stephen Boyd <swboyd@chromium.org>
> > Sent: Friday, March 18, 2022 2:41 AM
> > To: quic_vpolimer <quic_vpolimer@quicinc.com>;
> > devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > freedreno@lists.freedesktop.org; linux-arm-msm@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
> > dmitry.baryshkov@linaro.org; dianders@chromium.org; quic_kalyant
> > <quic_kalyant@quicinc.com>
> > Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the
> > maximum frequency in opp table during probe
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary
> > of any links or attachments, and do not enable macros.
> >
> > Quoting Vinod Polimera (2022-03-14 07:46:53)
> > > use max clock during probe/bind sequence from the opp table.
> > > The clock will be scaled down when framework sends an update.
> >
> > Capitalize 'use'.
> >
> > Why is it important to use max frequency during probe/bind? Does not
> > setting the clk rate during probe mean that we'll never use the max
> > rate? Does it speed things up during probe?
>
> We need to vote mdp clock during probe/bind so that rails are not set at undetermined state as pointed out by Dmitry.
> Since we dont know what will be the rate set in boot loader, it would be ideal to vote at max frequency.
> There could be a firmware display programmed in bootloader and we want to transition it to kernel without underflowing.

This should be expressed in the commit message.


-- 
With best wishes
Dmitry
