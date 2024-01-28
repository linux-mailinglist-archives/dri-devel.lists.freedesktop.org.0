Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4C83F41D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D003510ED2E;
	Sun, 28 Jan 2024 05:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B438010E859
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 05:37:04 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-602ab446cd8so16987377b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 21:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706420164; x=1707024964; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eb27nl58LSSIP3Iqh05TC9E1Wsp3/3yzR9D7Ha5jIfc=;
 b=t8pX+/nIKDMmSNomDc3d6A4ovGW+zKZ63zHECVebxOFyO0StCOHb0ZR2jwCt2hm7Wa
 oUAWJ1p6IrR4h4ZQ8VB684qDdoQvpN/nNDoFRDV5H/Ugip4yqwT4ax5Vxmkhdx7mau1S
 44iT3ymj0pLd7p188pmXjb3bSlcw8jL/3Owzw1klestC9dLwzUDqrdInOmp65PQBs13j
 IZ5Mqmr5+EV75uFOyNok7pLsFh1Z2EyD8taqJMETHD2d/2S1UrbkUpZhgEf7zRk//Ajv
 E4f0HyJVUyGlv6IVTN17rismm/dwImURNoszE3v7jtDpg8O2yiNhEGccUbWjupCpdLrT
 S5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706420164; x=1707024964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eb27nl58LSSIP3Iqh05TC9E1Wsp3/3yzR9D7Ha5jIfc=;
 b=Z5w1rOf5kvihjm8xmXgeSq5S8L53WlJLv7BGqof4DtDzoow93XbT+LVxXEPnTfIVAG
 PmG5VXnBlYEuDibmn3/IYcExY1KNNjgxcagPLGGd9GsJGl2GmkaF8Ir4TPO62GZnkLz8
 2TWeQFvK+6uytlOL/C7GqEWW2K0SfS8ShCkJbwc+zXGIut19nsK/P46AdNldhpa21xKH
 /p5xDa2ihvz8nlJPh1OwY+uAE22RD34EWM25cUhbpp8nG/fQkUu1AfSuHWWQVUoYO+Of
 r4WqBRrSs4JZq09F7W2TQDvfqAyZoCkUr7n58ysZrWkwqtYDJmJrb7wU72SEpPTvYByB
 PZDw==
X-Gm-Message-State: AOJu0YyyozG3lsWHbDKJrBxSMm7BZrsHXfyyvGh5IZrVFSXjYT4uEzf0
 YjxwsLT08RGpliBLzwwN6gUl5zsmySscMlgXa2WnVuNYExd2gLL16xachCQ3/VcslywNRfW/Nrq
 HUXDeU/U9kyYrfLKWesAKXSXRljI+Wg5swiWCDw==
X-Google-Smtp-Source: AGHT+IEwo0pJM9DyAjs8fHbCytd1W+kElT7MH4NUs7dfhb8bLi8TYhWxVVt1bZC7M4yIlCkYReWK8xPOAsD+4cGtiYE=
X-Received: by 2002:a05:690c:3603:b0:602:ab47:5a00 with SMTP id
 ft3-20020a05690c360300b00602ab475a00mr2413202ywb.60.1706420163884; Sat, 27
 Jan 2024 21:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-11-quic_parellan@quicinc.com>
 <c06c4a5d-6042-4d0a-a0ca-6321792f1061@linaro.org>
 <c1133eaa-703b-21fb-8715-602e7932586e@quicinc.com>
In-Reply-To: <c1133eaa-703b-21fb-8715-602e7932586e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:35:53 +0200
Message-ID: <CAA8EJpoT2cLvSyuqnwYRVPETnsmV2B-KeWFU86QcDbe3zAnoWw@mail.gmail.com>
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 07:31, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 2:07 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Modify dp_catalog_hw_revision to make the major and minor version values
> >> known instead of outputting the entire hex value of the hardware version
> >> register in preparation of using it for VSC SDP programming.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 12 +++++++++---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>   2 files changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index 5d84c089e520a..c025786170ba5 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -24,6 +24,9 @@
> >>   #define DP_INTERRUPT_STATUS_ACK_SHIFT    1
> >>   #define DP_INTERRUPT_STATUS_MASK_SHIFT    2
> >>   +#define DP_HW_VERSION_MAJOR(reg)    FIELD_GET(GENMASK(31, 28), reg)
> >> +#define DP_HW_VERSION_MINOR(reg)    FIELD_GET(GENMASK(27, 16), reg)
> >> +
> >>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
> >>     #define DP_INTERRUPT_STATUS1 \
> >> @@ -531,15 +534,18 @@ int
> >> dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
> >>    *
> >>    * @dp_catalog: DP catalog structure
> >>    *
> >> - * Return: DP controller hw revision
> >> + * Return: void
> >>    *
> >>    */
> >> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> >> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16
> >> *major, u16 *minor)
> >>   {
> >>       const struct dp_catalog_private *catalog =
> >> container_of(dp_catalog,
> >>                   struct dp_catalog_private, dp_catalog);
> >> +    u32 reg_dp_hw_version;
> >>   -    return dp_read_ahb(catalog, REG_DP_HW_VERSION);
> >> +    reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
> >> +    *major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
> >> +    *minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
> >
> > After looking at the code, it might be easier to keep
> > dp_catalog_hw_revision as is, add define for hw revision 1.2 and
> > corepare to it directly.
> I thought having a  define value of the version would be harder to
> follow than what's here currently. Since having it compare to the
> version value looks a little difficult to read versus having an explicit
> major and minor value version to compare to. For example having (major
>  >= 1 && minor >= 2) versus having something like (hw_version >=
> DPU_HW_VERSION_1_2)

The problem is that major + minor are harder to follow and harder to
implement. You got them wrong, btw. For example 2.1 is greater or
equal than 1.2, but it doesn't pass your test. So, I think, a single
define is easier and less error prone.

> >
> >>   }
> >>     /**
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> index 563903605b3a7..94c377ef90c35 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> @@ -170,7 +170,7 @@ void dp_catalog_ctrl_config_misc(struct
> >> dp_catalog *dp_catalog, u32 cc, u32 tb);
> >>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32
> >> rate,
> >>                   u32 stream_rate_khz, bool fixed_nvid, bool
> >> is_ycbcr_420);
> >>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog
> >> *dp_catalog, u32 pattern);
> >> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
> >> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16
> >> *major, u16 *minor);
> >>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
> >>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
> >>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool
> >> enable);
> >



-- 
With best wishes
Dmitry
