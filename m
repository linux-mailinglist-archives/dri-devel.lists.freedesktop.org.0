Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE0313328
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 14:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F20F882AF;
	Mon,  8 Feb 2021 13:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69816E8D1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 13:21:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3504664EA1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612790508;
 bh=JCowdY9/swgNvLGKCtYILHUDvwFwe3wlliPaauwJtqo=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=Z0OnUMf1XF6wkRce7+KX5yJEIK6rZnwX/0/uGbV2554m5cIGXXf99QGkLMeuM2fo4
 nd+PvQhfz2KCYi5XqodKdoD0PYFGrupII7JGvkT/qoRyvGD26bNaz93mXnYoJMZnRb
 XFnWTvefmgX+P1z2gr+Jco4NiaPfHaMatAsoGDDYRSF/B/F66UcGVCq1MZPngEkxbb
 ATc163bd6VzzSwq/mqlS9wAs+dmMbqPMJWRaRKdulx3KF8yOrzO6fioAv76GkwLhaW
 8mgSRn8dSSdEkZ2xBqvLCaL7F8AFVEHODzDZVS1VsCgjQUrHuQJxbi9NsMQLAW+NEw
 PupCXLjtMynFg==
Received: by mail-il1-f177.google.com with SMTP id y17so12627273ili.12
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 05:21:48 -0800 (PST)
X-Gm-Message-State: AOAM533LE6JaI7ScKf79sRHEDM19uRCHin8w65OeqrNIjqY/TL9NaZRp
 wzdw/qQ+ULomAStVaa4jb5K7N9ILIIXuWA839a4=
X-Google-Smtp-Source: ABdhPJxZjp+8gF8o8padJL0+IzzLbtZUb75SL2CM/u1HRiY8+G7HYRwykHjohne3jzUWkH/+/7nK2pb8nWzP/J4obWU=
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id
 i11mr15393249ila.206.1612790507545; 
 Mon, 08 Feb 2021 05:21:47 -0800 (PST)
MIME-Version: 1.0
References: <b6580306-fbfb-e7ac-aa4e-2476a5ee39da@linaro.org>
In-Reply-To: <b6580306-fbfb-e7ac-aa4e-2476a5ee39da@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Feb 2021 08:21:36 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7OC5JeW7rug-JXiGRZRtiirGcBf9jj0geJ2ZuQDBGU-Q@mail.gmail.com>
Message-ID: <CA+5PVA7OC5JeW7rug-JXiGRZRtiirGcBf9jj0geJ2ZuQDBGU-Q@mail.gmail.com>
Subject: Re: linux-firmware for Qualcomm SM8250 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pulled and pushed out.

josh

On Fri, Jan 22, 2021 at 5:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hello linux-firmware maintainers,
>
> We'd like to submit firmware for Qualcomm SM8250-based platforms.
> Firmware successfully tested on Qualcomm Robotics RB5 platform.
>
> The following changes since commit d5288624259300c558480c21a860fcf94187d29d:
>
>    brcm: Add NVRAM for Vamrs 96boards Rock960 (2021-01-09 07:31:33 -0500)
>
> are available in the Git repository at:
>
>    https://github.com/lumag/linux-firmware qcom-rb5
>
> for you to fetch changes up to df822a848cceb185d2d50a39140ba0c9cd9f33e9::
>
>    qcom: Add venus firmware files for VPU-1.0 (2021-01-23 01:10:05 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>        qcom: add firmware files for Adreno a650
>        qcom: Add SM8250 Audio DSP firmware
>        qcom: Add SM8250 Compute DSP firmware
>        qcom: Add venus firmware files for VPU-1.0
>
>   WHENCE                   |  26 ++++++++++++++++++++++++++
>   qcom/a650_gmu.bin        | Bin 0 -> 41548 bytes
>   qcom/a650_sqe.fw         | Bin 0 -> 31488 bytes
>   qcom/sm8250/a650_zap.mbn | Bin 0 -> 13964 bytes
>   qcom/sm8250/adsp.mbn     | Bin 0 -> 15515796 bytes
>   qcom/sm8250/adspr.jsn    |  21 +++++++++++++++++++++
>   qcom/sm8250/adspua.jsn   |  27 +++++++++++++++++++++++++++
>   qcom/sm8250/cdsp.mbn     | Bin 0 -> 5822228 bytes
>   qcom/sm8250/cdspr.jsn    |  21 +++++++++++++++++++++
>   qcom/vpu-1.0/venus.b00   | Bin 0 -> 692 bytes
>   qcom/vpu-1.0/venus.b01   | Bin 0 -> 7528 bytes
>   qcom/vpu-1.0/venus.b02   | Bin 0 -> 300 bytes
>   qcom/vpu-1.0/venus.b03   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b04   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b05   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b06   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b07   | Bin 0 -> 24 bytes
>   qcom/vpu-1.0/venus.b08   | Bin 0 -> 16 bytes
>   qcom/vpu-1.0/venus.b09   | Bin 0 -> 883152 bytes
>   qcom/vpu-1.0/venus.b10   | Bin 0 -> 41360 bytes
>   qcom/vpu-1.0/venus.b19   |   1 +
>   qcom/vpu-1.0/venus.mbn   | Bin 0 -> 1973540 bytes
>   qcom/vpu-1.0/venus.mdt   | Bin 0 -> 8220 bytes
>   23 files changed, 96 insertions(+)
>   create mode 100644 qcom/a650_gmu.bin
>   create mode 100644 qcom/a650_sqe.fw
>   create mode 100644 qcom/sm8250/a650_zap.mbn
>   create mode 100644 qcom/sm8250/adsp.mbn
>   create mode 100644 qcom/sm8250/adspr.jsn
>   create mode 100644 qcom/sm8250/adspua.jsn
>   create mode 100644 qcom/sm8250/cdsp.mbn
>   create mode 100644 qcom/sm8250/cdspr.jsn
>   create mode 100644 qcom/vpu-1.0/venus.b00
>   create mode 100644 qcom/vpu-1.0/venus.b01
>   create mode 100644 qcom/vpu-1.0/venus.b02
>   create mode 100644 qcom/vpu-1.0/venus.b03
>   create mode 100644 qcom/vpu-1.0/venus.b04
>   create mode 100644 qcom/vpu-1.0/venus.b05
>   create mode 100644 qcom/vpu-1.0/venus.b06
>   create mode 100644 qcom/vpu-1.0/venus.b07
>   create mode 100644 qcom/vpu-1.0/venus.b08
>   create mode 100644 qcom/vpu-1.0/venus.b09
>   create mode 100644 qcom/vpu-1.0/venus.b10
>   create mode 100644 qcom/vpu-1.0/venus.b19
>   create mode 100644 qcom/vpu-1.0/venus.mbn
>   create mode 100644 qcom/vpu-1.0/venus.mdt
>
>
>
> --
> With best wishes
> Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
