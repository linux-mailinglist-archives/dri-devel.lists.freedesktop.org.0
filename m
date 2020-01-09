Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E26135534
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 10:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC896E3CB;
	Thu,  9 Jan 2020 09:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CBA6E3CB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 09:08:58 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g1so5229791qtr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWKF4KF9Y1CtiEun++0rxUUQMRPGqGyeC6hWhJkdSUc=;
 b=QGT9LAJanjfXKoCERl6lGxDO5mX9gXrEuQ7sDttgSjCnzBSKSYfwnG4X9f+Ngw4O1v
 Jkhrpm+DlIJNPfdLLVhSKTc7QDIodBcyMEhHwaxzV8RY5q+Ffgk+1IFXnbZvNBlyfPV8
 UQwFDYjv97NNGovIbt5sPou5JjNNOYGlmCfeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWKF4KF9Y1CtiEun++0rxUUQMRPGqGyeC6hWhJkdSUc=;
 b=Cm/amY/iUJRfE/6C/81tAPzzuzTnJZAZifc9P29Z3Fsd42oy/ovJrm4Z2FAfCAJJer
 avPWgg1lvSRLQZLqeNnN5QocWHo3bUSN6EATsVvo3ucaRTxuBGxljXm+8phdwS4t/ok8
 cvcYen+S1XEpjY0dqiFQNERdCSg+fT1PKrAt9sN1XtXYCGuWHXGyVFpiPkUB7EObRcS1
 L/Xsjb/+aT8ZXVtp5LPQEkZ53Gx94jlDqHuAxta3eSc4C7Uo7EyqGxBve0CIbjIhROuV
 p15J5sCSnmgZV1lXwdUGEjcyOxTTy49rTV6IBYOSESfgqrofnB/SWr4FkljXcx8ZXL0I
 jcrQ==
X-Gm-Message-State: APjAAAWKh9JT4r/DpFJ78bEkkff3Nq9Hl5XwYrS/zAk/r8t9/aEDRimN
 9ShOov6oHfdEZ0T4CSAjShpTR+S+YWHkHCRN5CpyOA==
X-Google-Smtp-Source: APXvYqzHUEojTodwcrGuQpgaBY41guNbk/ZtFyS1AoJQRt5Iu+x8Niu+YYkIDEdBurliWcTM+tgf2nUl95GTV1rYpXA=
X-Received: by 2002:aed:2f45:: with SMTP id l63mr7382614qtd.221.1578560937298; 
 Thu, 09 Jan 2020 01:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 9 Jan 2020 17:08:46 +0800
Message-ID: <CANMq1KCKuOTvyDxhnL1baEeRSxnaPdgMp9Lj2pcHwj-30n2-5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Rob Herring <robh+dt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 1:23 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Hi!
>
> Sorry for the long delay since https://patchwork.kernel.org/patch/11132381/,
> finally got around to give this a real try.
>
> The main purpose of this series is to upstream the dts change and the binding
> document, but I wanted to see how far I could probe the GPU, to check that the
> binding is indeed correct. The rest of the patches are RFC/work-in-progress, but
> I think some of them could already be picked up.
>
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>
> Probing logs looks like this, currently:
> [  221.867726] panfrost 13040000.gpu: clock rate = 511999970
> [  221.867929] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  221.868600] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  221.870586] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
> [  221.871492] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
> [  221.871866] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
> [  221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [  221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
> [  221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  221.872449] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [  221.873526] panfrost 13040000.gpu: error powering up gpu stack
> [  221.878088] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
> [  221.940817] panfrost 13040000.gpu: error powering up gpu stack
> [  222.018233] panfrost 13040000.gpu: error powering up gpu stack
> (repeated)
>
> So the GPU is probed, but there's an issue when powering up the STACK, not
> quite sure why, I'll try to have a deeper look, at some point.

Just as a follow-up to that one. stack_present=0x00000007 on my GPU.

However, the ARM-provided driver I use on this platform doesn't have
CONFIG_MALI_CORESTACK enabled so the "stack" is never turned on.
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/Kconfig#101
. So possibly this does not need to be done on Bifrost GPUs (and the
error should be harmless).

> Thanks!
>
> Nicolas
>
> v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
>  - Add dt-bindings changes
>  - Stacking patches after the device tree change that allow basic
>    probing (still incomplete and broken).
>
> Nicolas Boichat (7):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   drm/panfrost: Improve error reporting in panfrost_gpu_power_on
>   drm/panfrost: Add support for a second regulator for the GPU
>   drm/panfrost: Add support for multiple power domain support
>   RFC: drm/panfrost: Add bifrost compatible string
>   RFC: drm/panfrost: devfreq: Add support for 2 regulators
>
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  20 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  18 +++
>  drivers/gpu/drm/panfrost/panfrost_device.c    | 108 ++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   7 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   1 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  15 ++-
>  8 files changed, 267 insertions(+), 13 deletions(-)
>
> --
> 2.24.1.735.g03f4e72817-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
