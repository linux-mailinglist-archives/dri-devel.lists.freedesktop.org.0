Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22B79220E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DB510E4B7;
	Tue,  5 Sep 2023 11:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121510E4B9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 11:10:56 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-57359e85e9bso1238907eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693912255; x=1694517055; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lFHibJcCTrHc7UsLYmrMGzSLKGIb6u3hELCj6ZH9vKM=;
 b=VyGndxaqADR6eFCmSh3YOz1/Ac+b/vRJz5s/a63gD7+8xKrtMINPwmomkBkkD+kYJO
 JeKlHmT2Yqc5GCNiyzVrFQHChdlD/2QhbK7neq1UlwUe34oi/NBvP2W3SuM0knyO3s+T
 /a0JWLOfx4AQLlrNRndlIpaG80BC26z7OYq88d7Sawi+mRsHXgpgXzyP3nrFHjLxQyKx
 pdEklTZjLlo07s0GLaqRyIVdJlI+zvlfKLNJwCUMl6v034FpDC7W12SDRFPEIer60QnY
 YvXDYE65uhD+Zdi/VxfI33RD1gmWrRodLxWywOjfeXy1qw5bnUbUoFDcnaHe0tao5bOu
 razg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693912255; x=1694517055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lFHibJcCTrHc7UsLYmrMGzSLKGIb6u3hELCj6ZH9vKM=;
 b=OpBL/L17/PTfKsTkKyJWu4YOLX3AVfweACBxVZdAZD+/5xCVhtgkORnN6lc+9Y/1cN
 DsMcy3GypnQgT3iIRpvP4ClMAxDLGHtPtOIhUhRHm42icoNfAmMjSv8s+ObZkwOHnYrK
 maFsU1laZko3ivpyyMEWjDs+yr2PUavRqZBIIbvA4EbG79aCBIYciCQQRCNvvrK1e5R0
 0db1aTL8t9betqgG+ezTX9cU1UYjrMzdnTQSWkO53YHoV5zoycPCW6+i06dUqeGDC+QH
 Fl/RtE73bUB7WHmtqQVkk9Wrf8quHV5jNGRXakr1VnkvG8nmCjSuCXVG5I6Gz1WDzOQl
 xnTA==
X-Gm-Message-State: AOJu0YxOWPtExECScvgirCyqMqU1K9X3lL5UHrHeV6Qj1FF7X8/3tCWz
 Irw3yfoM+FWkTANm5n7KbAwXd+i1/i9g4VDqFsW9ug==
X-Google-Smtp-Source: AGHT+IFo9xBi2/mp2LlaAKkJ92fJy9V9XtRAZ9XtjSlMoeM6e+JjrV7rskbJMCadKMIvoAvsNXEXvZjxBF6IQTrAKW0=
X-Received: by 2002:a05:6358:63a4:b0:135:24ed:5106 with SMTP id
 k36-20020a05635863a400b0013524ed5106mr8346763rwh.9.1693912255339; Tue, 05 Sep
 2023 04:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
In-Reply-To: <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Sep 2023 14:10:44 +0300
Message-ID: <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
To: Maxime Ripard <mripard@kernel.org>
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, Vignesh Raman <vignesh.raman@collabora.com>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Sept 2023 at 14:00, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Sep 05, 2023 at 03:39:33PM +0530, Vignesh Raman wrote:
> > Hi Dmitry, Maxime,
> >
> > On 05/09/23 14:13, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > > > >
> > > > > Force db410c to host mode to fix network issue which results in failure
> > > > > to mount root fs via NFS.
> > > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
> > > > >
> > > > > Use fdtoverlay command to merge base device tree with an overlay
> > > > > which contains the fix for USB controllers to work in host mode.
> > > > >
> > > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > > ---
> > > > >
> > > > > v2:
> > > > >    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
> > > > >
> > > > > ---
> > > > >   drivers/gpu/drm/ci/build.sh                         |  5 +++++
> > > > >   .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
> > > > >   2 files changed, 18 insertions(+)
> > > > >   create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > >
> > > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > > > > index 7b014287a041..92ffd98cd09e 100644
> > > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > > @@ -92,6 +92,11 @@ done
> > > > >
> > > > >   if [[ -n ${DEVICE_TREES} ]]; then
> > > > >       make dtbs
> > > > > +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> > > > > +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > > +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
> > > > > +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
> > > > > +    fi
> > > > >       cp ${DEVICE_TREES} /lava-files/.
> > > > >   fi
> > > > >
> > > > > diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > > new file mode 100644
> > > > > index 000000000000..57b7604f1c23
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > > @@ -0,0 +1,13 @@
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +/ {
> > > > > +    fragment@0 {
> > > > > +        target-path = "/soc@0";
> > > > > +        __overlay__ {
> > > > > +            usb@78d9000 {
> > > > > +                dr_mode = "host";
> > > > > +            };
> > > > > +        };
> > > > > +    };
> > > > > +};
> > > > > --
> > > > > 2.40.1
> > > >
> > > > Can we use normal dtso syntax here instead of defining fragments manually?
> > >
> > > What Dmitry is hinting about is to use the "Sugar Syntax". There a good documentation here:
> > > https://source.android.com/docs/core/architecture/dto/syntax
> >
> >
> > With the below DTO syntax,
> > /dts-v1/;
> > /plugin/;
> >
> > &usb {
> >   usb@78d9000 {
> >     dr_mode = "host";
> >   };
> > };
> >
> > Decoded dtbo file is,
> > /dts-v1/;
> >
> > / {
> >
> >       fragment@0 {
> >               target = <0xffffffff>;
> >
> >               __overlay__ {
> >
> >                       usb@78d9000 {
> >                               dr_mode = "host";
> >                       };
> >               };
> >       };
> >
> >       __fixups__ {
> >               usb = "/fragment@0:target:0";
> >       };
> > };
> >
> > With the previous fix using fragment we get,
> > / {
> >
> >       fragment@0 {
> >               target-path      = "/soc@0";
> >
> >               __overlay__ {
> >
> >                       usb@78d9000 {
> >                               dr_mode = "host";
> >                       };
> >               };
> >       };
> > };
> >
> > Decoded apq8016-sbc.dtb file with the fix (setting dr_mode to host) is,
> > /dts-v1/;
> > / {
> >       soc@0 {
> >               usb@78d9000 {
> >                       dr_mode = "host";
> >               };
> >       };
> > };
> >
> > How can set the target to "soc@0" using the DTO syntax?
>
> To strictly answer your question, that would be something like
>
> &{/soc@0} {
>         usb@78d9000 {
>                 dr_mode = "host";
>         };
> };
>
> You can simplify this further however by doing:
>
>
> &{/soc@0/usb@78d9000} {
>         dr_mode = "host";
> };
>
> Also, that node actually has a label ("usb"), defined here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
>
> So you can end up with
>
> &usb {
>         dr_mode = "host";
> };

... which is the simplest and thus more robust one.

> All of them should be equivalent to the one you had in your patch.
>
> Maxime

-- 
With best wishes
Dmitry
