Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E846AEFE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 01:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98E73D56;
	Tue,  7 Dec 2021 00:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D635D73D56
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 00:21:17 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id q14so12643861qtx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 16:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iz1HYqqjDV5hJ2cuh9A9x7TWyRQxhgTWoQDl4uHxBmM=;
 b=c8tU0yQm2HBy+LGH+alreJO4KBRKNBipE1d0bK7162y/pyWbmZ6c+9GJHFE3ktUFYx
 OcFD6mHbdQ5kypaUz61XIUUM6s7EkwX8zprDpGdumfwS8byQuIAxUhMtnlsCCjM0Fz9h
 2zHWBh0Yri3G0gnPLHse42lcFZ5Ej9C0Nfn/aAglHOecEtWeygqxTL6JNdVBJnHRddPF
 aZH59k/sQFcz6qMUwNCCTwV+MH9o88MzoGFKZ3q5vInwzuAHmYdOpP3B9nP+f693XI7W
 mWnNu1kKYxiUS8oNLtnF4wgwpjnnd+JQcAk4g4ez3jkX6f51uaz4+GEbDIeZpmwlmXqc
 +qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iz1HYqqjDV5hJ2cuh9A9x7TWyRQxhgTWoQDl4uHxBmM=;
 b=TOxaqDwFaaAx26RlR9WuCCuJgHBT35kKIjo2urYFL/7udpS44sC1NUBOqyOei8Lt9c
 e+N9effAryeqznH7SA3A0IB5/p+4B7M6AF4fxds4sw9t7TTpWG1KRxPbaoyVOln2dpOr
 65bfOOV/ku25j/cV1dlfJujcpQW68SppTMqV6mJhiruh6Vv4BHxnTDYWZK/dOW6O3sZQ
 bd9YH/3P1bBJSJ0PXopSqvyD5mfshwcQOtEjc1FCtMkF7T2eDb6HoWVjSoClUA8kfi8J
 V9AwobejRaX7li1cWjhb7X6xcvfqd+K112wgONwHtLpJRTyKYc+S1nAYJiyMJtQwiFAG
 ot3A==
X-Gm-Message-State: AOAM532o8SMZjl+nQjAUMWEW5noTgqFoNh7Lwdg9b86OWtpNn35nv0aQ
 eOpdgaRAIohOjs1rPMERqW/RKeXilizlijAFX/dr2A==
X-Google-Smtp-Source: ABdhPJx3nLB3KRorDFPw38axj8bgkOPfuiIVVRjzvvzG0U6alvfL0AGhAuC60qCaS+64EFaTJHKMrFvfMMFEElwpPAY=
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr44042897qtp.45.1638836476611; 
 Mon, 06 Dec 2021 16:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20211015001100.4193241-1-dmitry.baryshkov@linaro.org>
 <20211015001100.4193241-2-dmitry.baryshkov@linaro.org>
 <8d90118d26b0e36fff84dc32ab047dd8@codeaurora.org>
 <CAA8EJpo1zsK9hVbN63DkdMHXk2gqq48v1cQ0gw_Lg7KtF130pQ@mail.gmail.com>
 <7cffbdf36f1da12976c4fb142bd4a331@codeaurora.org>
 <1df4eff7-b90e-39e5-d158-15380e6c9324@linaro.org>
 <2b2194b3-90ef-c3f2-9cfe-1e7f6df42733@quicinc.com>
 <CAA8EJpo0eT=y9z91eriOOKigMxviSTxnzpMU3_b7oChK1bEarA@mail.gmail.com>
 <4be59c7f-8257-7a64-f660-574edf3947b5@quicinc.com>
In-Reply-To: <4be59c7f-8257-7a64-f660-574edf3947b5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Dec 2021 03:21:05 +0300
Message-ID: <CAA8EJpr+O6C5v49eBQSsdUj0b61jJ3YGjGNiThJGmfMep0+Dng@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/hdmi: switch to
 drm_bridge_connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 abhinavk@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Dec 2021 at 01:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> On 12/6/2021 2:47 PM, Dmitry Baryshkov wrote:
> > On Mon, 6 Dec 2021 at 23:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/25/2021 4:50 AM, Dmitry Baryshkov wrote:
> >>> On 19/10/2021 02:54, abhinavk@codeaurora.org wrote:
> >>>> On 2021-10-16 07:21, Dmitry Baryshkov wrote:
> >>>>> On Sat, 16 Oct 2021 at 01:25, <abhinavk@codeaurora.org> wrote:
> >>>>>>
> >>>>>> Hi Dmitry
> >>>>>>
> >>>>>> On 2021-10-14 17:11, Dmitry Baryshkov wrote:
> >>>>>>> Merge old hdmi_bridge and hdmi_connector implementations. Use
> >>>>>>> drm_bridge_connector instead.
> >>>>>>>
> >>>>>> Can you please comment on the validation done on this change?
> >>>>>> Has basic bootup been verified on db820c as thats the only platform
> >>>>>> which shall use this.
> >>>>>
> >>>>> Yes, this has been developed and validated on db820c
> >>>> Thanks for confirming.
> >>>>>
> >>>>>>
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> ---
> >>>>>>>   drivers/gpu/drm/msm/Makefile                  |   2 +-
> >>>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.c               |  12 +-
> >>>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.h               |  19 ++-
> >>>>>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |  81 ++++++++-
> >>>>>>>   .../msm/hdmi/{hdmi_connector.c => hdmi_hpd.c} | 154
> >>>>>> ++----------------
> >>>>>>>   5 files changed, 109 insertions(+), 159 deletions(-)
> >>>>>>>   rename drivers/gpu/drm/msm/hdmi/{hdmi_connector.c => hdmi_hpd.c}
> >>>>>> (62%)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/Makefile
> >>>>>>> b/drivers/gpu/drm/msm/Makefile
> >>>>>>> index 904535eda0c4..91b09cda8a9c 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/Makefile
> >>>>>>> +++ b/drivers/gpu/drm/msm/Makefile
> >>>>>>> @@ -19,7 +19,7 @@ msm-y := \
> >>>>>>>        hdmi/hdmi.o \
> >>>>>>>        hdmi/hdmi_audio.o \
> >>>>>>>        hdmi/hdmi_bridge.o \
> >>>>>>> -     hdmi/hdmi_connector.o \
> >>>>>>> +     hdmi/hdmi_hpd.o \
> >>>>>>>        hdmi/hdmi_i2c.o \
> >>>>>>>        hdmi/hdmi_phy.o \
> >>>>>>>        hdmi/hdmi_phy_8960.o \
> >>>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c
> >>>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
> >>>>>>> index db17a000d968..d1cf4df7188c 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> >>>>>>> @@ -8,6 +8,8 @@
> >>>>>>>   #include <linux/of_irq.h>
> >>>>>>>   #include <linux/of_gpio.h>
> >>>>>>>
> >>>>>>> +#include <drm/drm_bridge_connector.h>
> >>>>>>> +
> >>>>>>>   #include <sound/hdmi-codec.h>
> >>>>>>>   #include "hdmi.h"
> >>>>>>>
> >>>>>>> @@ -41,7 +43,7 @@ static irqreturn_t msm_hdmi_irq(int irq, void
> >>>>>>> *dev_id)
> >>>>>>>        struct hdmi *hdmi = dev_id;
> >>>>>>>
> >>>>>>>        /* Process HPD: */
> >>>>>>> -     msm_hdmi_connector_irq(hdmi->connector);
> >>>>>>> +     msm_hdmi_hpd_irq(hdmi->bridge);
> >>>>>>>
> >>>>>>>        /* Process DDC: */
> >>>>>>>        msm_hdmi_i2c_irq(hdmi->i2c);
> >>>>>>> @@ -283,7 +285,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >>>>>>>                goto fail;
> >>>>>>>        }
> >>>>>>>
> >>>>>>> -     hdmi->connector = msm_hdmi_connector_init(hdmi);
> >>>>>>> +     hdmi->connector = drm_bridge_connector_init(hdmi->dev,
> >>>>>> encoder);
> >>>>>>>        if (IS_ERR(hdmi->connector)) {
> >>>>>>>                ret = PTR_ERR(hdmi->connector);
> >>>>>>>                DRM_DEV_ERROR(dev->dev, "failed to create HDMI
> >>>>>> connector: %d\n",
> >>>>>>> ret);
> >>>>>>> @@ -291,6 +293,8 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >>>>>>>                goto fail;
> >>>>>>>        }
> >>>>>>>
> >>>>>>> +     drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
> >>>>>>> +
> >>>>>>>        hdmi->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> >>>>>>>        if (hdmi->irq < 0) {
> >>>>>>>                ret = hdmi->irq;
> >>>>>>> @@ -307,7 +311,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >>>>>>>                goto fail;
> >>>>>>>        }
> >>>>>>>
> >>>>>>> -     ret = msm_hdmi_hpd_enable(hdmi->connector);
> >>>>>>> +     drm_bridge_connector_enable_hpd(hdmi->connector);
> >>>>>>> +
> >>>>>>> +     ret = msm_hdmi_hpd_enable(hdmi->bridge);
> >>>>>>>        if (ret < 0) {
> >>>>>>>                DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable
> >>>>>> HPD: %d\n", ret);
> >>>>>>>                goto fail;
> >>>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h
> >>>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.h
> >>>>>>> index 82261078c6b1..736f348befb3 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> >>>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> >>>>>>> @@ -114,6 +114,13 @@ struct hdmi_platform_config {
> >>>>>>>        struct hdmi_gpio_data gpios[HDMI_MAX_NUM_GPIO];
> >>>>>>>   };
> >>>>>>>
> >>>>>>> +struct hdmi_bridge {
> >>>>>>> +     struct drm_bridge base;
> >>>>>>> +     struct hdmi *hdmi;
> >>>>>>> +     struct work_struct hpd_work;
> >>>>>>> +};
> >>>>>>> +#define to_hdmi_bridge(x) container_of(x, struct hdmi_bridge, base)
> >>>>>>> +
> >>>>>>>   void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on);
> >>>>>>>
> >>>>>>>   static inline void hdmi_write(struct hdmi *hdmi, u32 reg, u32 data)
> >>>>>>> @@ -230,13 +237,11 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi
> >>>>>>> *hdmi, int rate);
> >>>>>>>   struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
> >>>>>>>   void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
> >>>>>>>
> >>>>>>> -/*
> >>>>>>> - * hdmi connector:
> >>>>>>> - */
> >>>>>>> -
> >>>>>>> -void msm_hdmi_connector_irq(struct drm_connector *connector);
> >>>>>>> -struct drm_connector *msm_hdmi_connector_init(struct hdmi *hdmi);
> >>>>>>> -int msm_hdmi_hpd_enable(struct drm_connector *connector);
> >>>>>>> +void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
> >>>>>>> +enum drm_connector_status msm_hdmi_bridge_detect(
> >>>>>>> +             struct drm_bridge *bridge);
> >>>>>>> +int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
> >>>>>>> +void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
> >>>>>>>
> >>>>>>>   /*
> >>>>>>>    * i2c adapter for ddc:
> >>>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> >>>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> >>>>>>> index f04eb4a70f0d..211b73dddf65 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> >>>>>>> @@ -5,17 +5,16 @@
> >>>>>>>    */
> >>>>>>>
> >>>>>>>   #include <linux/delay.h>
> >>>>>>> +#include <drm/drm_bridge_connector.h>
> >>>>>>>
> >>>>>>> +#include "msm_kms.h"
> >>>>>>>   #include "hdmi.h"
> >>>>>>>
> >>>>>>> -struct hdmi_bridge {
> >>>>>>> -     struct drm_bridge base;
> >>>>>>> -     struct hdmi *hdmi;
> >>>>>>> -};
> >>>>>>> -#define to_hdmi_bridge(x) container_of(x, struct hdmi_bridge, base)
> >>>>>>> -
> >>>>>>>   void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
> >>>>>>>   {
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >>>>>>> +
> >>>>>>> +     msm_hdmi_hpd_disable(hdmi_bridge);
> >>>>>>>   }
> >>>>>>>
> >>>>>>>   static void msm_hdmi_power_on(struct drm_bridge *bridge)
> >>>>>>> @@ -251,14 +250,76 @@ static void msm_hdmi_bridge_mode_set(struct
> >>>>>>> drm_bridge *bridge,
> >>>>>>>                msm_hdmi_audio_update(hdmi);
> >>>>>>>   }
> >>>>>>>
> >>>>>>> +static struct edid *msm_hdmi_bridge_get_edid(struct drm_bridge
> >>>>>>> *bridge,
> >>>>>>> +             struct drm_connector *connector)
> >>>>>>> +{
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >>>>>>> +     struct hdmi *hdmi = hdmi_bridge->hdmi;
> >>>>>>> +     struct edid *edid;
> >>>>>>> +     uint32_t hdmi_ctrl;
> >>>>>>> +
> >>>>>>> +     hdmi_ctrl = hdmi_read(hdmi, REG_HDMI_CTRL);
> >>>>>>> +     hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl | HDMI_CTRL_ENABLE);
> >>>>>>> +
> >>>>>>> +     edid = drm_get_edid(connector, hdmi->i2c);
> >>>>>>> +
> >>>>>>> +     hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
> >>>>>>> +
> >>>>>>> +     hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
> >>>>>>> +
> >>>>>>> +     return edid;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct
> >>>>>>> drm_bridge *bridge,
> >>>>>>> +             const struct drm_display_info *info,
> >>>>>>> +             const struct drm_display_mode *mode)
> >>>>>>> +{
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >>>>>>> +     struct hdmi *hdmi = hdmi_bridge->hdmi;
> >>>>>>> +     const struct hdmi_platform_config *config = hdmi->config;
> >>>>>>> +     struct msm_drm_private *priv = bridge->dev->dev_private;
> >>>>>>> +     struct msm_kms *kms = priv->kms;
> >>>>>>> +     long actual, requested;
> >>>>>>> +
> >>>>>>> +     requested = 1000 * mode->clock;
> >>>>>>> +     actual = kms->funcs->round_pixclk(kms,
> >>>>>>> +                     requested, hdmi_bridge->hdmi->encoder);
> >>>>>>> +
> >>>>>>> +     /* for mdp5/apq8074, we manage our own pixel clk (as opposed to
> >>>>>>> +      * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
> >>>>>>> +      * instead):
> >>>>>>> +      */
> >>>>>>> +     if (config->pwr_clk_cnt > 0)
> >>>>>>> +             actual = clk_round_rate(hdmi->pwr_clks[0], actual);
> >>>>>>> +
> >>>>>>> +     DBG("requested=%ld, actual=%ld", requested, actual);
> >>>>>>> +
> >>>>>>> +     if (actual != requested)
> >>>>>>> +             return MODE_CLOCK_RANGE;
> >>>>>>> +
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>   static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >>>>>>>                .pre_enable = msm_hdmi_bridge_pre_enable,
> >>>>>>>                .enable = msm_hdmi_bridge_enable,
> >>>>>>>                .disable = msm_hdmi_bridge_disable,
> >>>>>>>                .post_disable = msm_hdmi_bridge_post_disable,
> >>>>>>>                .mode_set = msm_hdmi_bridge_mode_set,
> >>>>>>> +             .mode_valid = msm_hdmi_bridge_mode_valid,
> >>>>>>> +             .get_edid = msm_hdmi_bridge_get_edid,
> >>>>>>> +             .detect = msm_hdmi_bridge_detect,
> >>>>>>>   };
> >>>>>>>
> >>>>>>> +static void
> >>>>>>> +msm_hdmi_hotplug_work(struct work_struct *work)
> >>>>>>> +{
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge =
> >>>>>>> +             container_of(work, struct hdmi_bridge, hpd_work);
> >>>>>>> +     struct drm_bridge *bridge = &hdmi_bridge->base;
> >>>>>>> +
> >>>>>>> +     drm_bridge_hpd_notify(bridge, drm_bridge_detect(bridge));
> >>>>>>> +}
> >>>>>>>
> >>>>>>>   /* initialize bridge */
> >>>>>>>   struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
> >>>>>>> @@ -275,11 +336,17 @@ struct drm_bridge *msm_hdmi_bridge_init(struct
> >>>>>>> hdmi *hdmi)
> >>>>>>>        }
> >>>>>>>
> >>>>>>>        hdmi_bridge->hdmi = hdmi;
> >>>>>>> +     INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
> >>>>>>>
> >>>>>>>        bridge = &hdmi_bridge->base;
> >>>>>>>        bridge->funcs = &msm_hdmi_bridge_funcs;
> >>>>>>> +     bridge->ddc = hdmi->i2c;
> >>>>>>> +     bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> >>>>>>> +     bridge->ops = DRM_BRIDGE_OP_HPD |
> >>>>>>> +             DRM_BRIDGE_OP_DETECT |
> >>>>>>> +             DRM_BRIDGE_OP_EDID;
> >>>> Please correct me if wrong here. When we set DRM_BRIDGE_OP_HPD, it
> >>>> means we need to
> >>>> set the hpd_enable and hpd_disable callbacks. I am not seeing those
> >>>> being set.
> >>>>
> >>>> 707      * @DRM_BRIDGE_OP_HPD: The bridge can detect hot-plug and
> >>>> hot-unplug
> >>>> 708      * without requiring polling. Bridges that set this flag shall
> >>>> 709      * implement the &drm_bridge_funcs->hpd_enable and
> >>>> 710      * &drm_bridge_funcs->hpd_disable callbacks if they support
> >>>> enabling
> >>>> 711      * and disabling hot-plug detection dynamically.
> >>>> 712      */
> >>>> 713     DRM_BRIDGE_OP_HPD = BIT(2),
> >>>>
> >>>> So when drm_bridge_connector_enable_hpd() is called, its a no-op as
> >>>> hpd_enable() callback
> >>>> is not set.
> >>>>
> >>>> msm_hdmi_hpd_enable() actually enables the HPD logic which is getting
> >>>> called from msm_hdmi_modeset_init()
> >>>> and not from hpd_enable().
> >>>>
> >>>> In that case, do we need to set DRM_BRIDGE_OP_HPD for this? If we
> >>>> dont, what will happen?
> >>>>
> >>>
> >>> Without this flag, the drm_bridge_connector will not know that this
> >>> bridge is capable of generating HPD events on its own, ending up with
> >>> polling implementation. See drm_bridge_connector_init(),
> >>> drm_helper_hpd_irq_event(), etc.
> >>>
> >>
> >> Thanks for the details. Then, as per the documentation on the
> >> DRM_BRIDGE_OP_HPD, shouldnt we also assign msm_hdmi_hpd_enable to
> >> hpd_enable callback? Since we are already calling
> >> drm_bridge_connector_enable_hpd(), that should take care of calling it
> >> using the callback then.
> >>
> >> Similarly, you can assign msm_hdmi_hpd_disable to hpd_disable op and
> >> then call drm_bridge_connector_disable_hpd() in those places.
> >
> > Since that would be a change in the functionality, I'd prefer to have
> > that in a separate patch.
> > It looks like a nice cleanup idea, so I'd implement that at some point.
> >
> >>
> I didnt follow this part. Why would there be a change in functionality?
> You are only going to assign the hpd_enable/hpd_disable callbacks.
> And replace the calls msm_hdmi_hpd_enable/msm_hdmi_hpd_disable with
> drm_bridge_connector_enable_hpd()/drm_bridge_connector_disable_hpd()
> within the driver. AFAICT, noone else is going to issue the
> enable/disable so it should not affect functionality.

You have described the change in the functionality: to use
hpd_enable/_disable callbacks.
Since we were not using them up to now, I'd like to keep that change separate.

>
> >> That way, functionality remains intact and we follow the documentation.
> >>
> >>>>
> >>>>
> >>>>>>>
> >>>>>>> -     ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 0);
> >>>>>>> +     ret = drm_bridge_attach(hdmi->encoder, bridge, NULL,
> >>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>>>>>        if (ret)
> >>>>>>>                goto fail;
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> >>>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> >>>>>>> similarity index 62%
> >>>>>>> rename from drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> >>>>>>> rename to drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> >>>>>>> index a7f729cdec7b..1cda7bf23b3b 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> >>>>>>> @@ -11,13 +11,6 @@
> >>>>>>>   #include "msm_kms.h"
> >>>>>>>   #include "hdmi.h"
> >>>>>>>
> >>>>>>> -struct hdmi_connector {
> >>>>>>> -     struct drm_connector base;
> >>>>>>> -     struct hdmi *hdmi;
> >>>>>>> -     struct work_struct hpd_work;
> >>>>>>> -};
> >>>>>>> -#define to_hdmi_connector(x) container_of(x, struct hdmi_connector,
> >>>>>>> base)
> >>>>>>> -
> >>>>>>>   static void msm_hdmi_phy_reset(struct hdmi *hdmi)
> >>>>>>>   {
> >>>>>>>        unsigned int val;
> >>>>>>> @@ -139,10 +132,10 @@ static void enable_hpd_clocks(struct hdmi
> >>>>>> *hdmi,
> >>>>>>> bool enable)
> >>>>>>>        }
> >>>>>>>   }
> >>>>>>>
> >>>>>>> -int msm_hdmi_hpd_enable(struct drm_connector *connector)
> >>>>>>> +int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
> >>>>>>>   {
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>> to_hdmi_connector(connector);
> >>>>>>> -     struct hdmi *hdmi = hdmi_connector->hdmi;
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >>>>>>> +     struct hdmi *hdmi = hdmi_bridge->hdmi;
> >>>>>>>        const struct hdmi_platform_config *config = hdmi->config;
> >>>>>>>        struct device *dev = &hdmi->pdev->dev;
> >>>>>>>        uint32_t hpd_ctrl;
> >>>>>>> @@ -199,9 +192,9 @@ int msm_hdmi_hpd_enable(struct drm_connector
> >>>>>>> *connector)
> >>>>>>>        return ret;
> >>>>>>>   }
> >>>>>>>
> >>>>>>> -static void hdp_disable(struct hdmi_connector *hdmi_connector)
> >>>>>>> +void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
> >>>>>>>   {
> >>>>>>> -     struct hdmi *hdmi = hdmi_connector->hdmi;
> >>>>>>> +     struct hdmi *hdmi = hdmi_bridge->hdmi;
> >>>>>>>        const struct hdmi_platform_config *config = hdmi->config;
> >>>>>>>        struct device *dev = &hdmi->pdev->dev;
> >>>>>>>        int ret;
> >>>>>>> @@ -227,19 +220,10 @@ static void hdp_disable(struct hdmi_connector
> >>>>>>> *hdmi_connector)
> >>>>>>>                dev_warn(dev, "failed to disable hpd regulator:
> >>>>>> %d\n", ret);
> >>>>>>>   }
> >>>>>>>
> >>>>>>> -static void
> >>>>>>> -msm_hdmi_hotplug_work(struct work_struct *work)
> >>>>>>> -{
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>>> -             container_of(work, struct hdmi_connector, hpd_work);
> >>>>>>> -     struct drm_connector *connector = &hdmi_connector->base;
> >>>>>>> -     drm_helper_hpd_irq_event(connector->dev);
> >>>>>>> -}
> >>>>>>> -
> >>>>>>> -void msm_hdmi_connector_irq(struct drm_connector *connector)
> >>>>>>> +void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
> >>>>>>>   {
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>> to_hdmi_connector(connector);
> >>>>>>> -     struct hdmi *hdmi = hdmi_connector->hdmi;
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >>>>>>> +     struct hdmi *hdmi = hdmi_bridge->hdmi;
> >>>>>>>        uint32_t hpd_int_status, hpd_int_ctrl;
> >>>>>>>
> >>>>>>>        /* Process HPD: */
> >>>>>>> @@ -262,7 +246,7 @@ void msm_hdmi_connector_irq(struct drm_connector
> >>>>>>> *connector)
> >>>>>>>                        hpd_int_ctrl |= HDMI_HPD_INT_CTRL_INT_CONNECT;
> >>>>>>>                hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, hpd_int_ctrl);
> >>>>>>>
> >>>>>>> -             queue_work(hdmi->workq, &hdmi_connector->hpd_work);
> >>>>>>> +             queue_work(hdmi->workq, &hdmi_bridge->hpd_work);
> >>>>>>>        }
> >>>>>>>   }
> >>>>>>>
> >>>>>>> @@ -293,11 +277,11 @@ static enum drm_connector_status
> >>>>>>> detect_gpio(struct hdmi *hdmi)
> >>>>>>>                        connector_status_disconnected;
> >>>>>>>   }
> >>>>>>>
> >>>>>>> -static enum drm_connector_status hdmi_connector_detect(
> >>>>>>> -             struct drm_connector *connector, bool force)
> >>>>>>> +enum drm_connector_status msm_hdmi_bridge_detect(
> >>>>>>> +             struct drm_bridge *bridge)
> >>>>>>>   {
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>> to_hdmi_connector(connector);
> >>>>>>> -     struct hdmi *hdmi = hdmi_connector->hdmi;
> >>>>>>> +     struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >>>>>>> +     struct hdmi *hdmi = hdmi_bridge->hdmi;
> >>>>>>>        const struct hdmi_platform_config *config = hdmi->config;
> >>>>>>>        struct hdmi_gpio_data hpd_gpio = config->gpios[HPD_GPIO_INDEX];
> >>>>>>>        enum drm_connector_status stat_gpio, stat_reg;
> >>>>>>> @@ -331,115 +315,3 @@ static enum drm_connector_status
> >>>>>>> hdmi_connector_detect(
> >>>>>>>
> >>>>>>>        return stat_gpio;
> >>>>>>>   }
> >>>>>>> -
> >>>>>>> -static void hdmi_connector_destroy(struct drm_connector *connector)
> >>>>>>> -{
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>> to_hdmi_connector(connector);
> >>>>>>> -
> >>>>>>> -     hdp_disable(hdmi_connector);
> >>>>>>> -
> >>>>>>> -     drm_connector_cleanup(connector);
> >>>>>>> -
> >>>>>>> -     kfree(hdmi_connector);
> >>>>>>> -}
> >>>>>>> -
> >>>>>>> -static int msm_hdmi_connector_get_modes(struct drm_connector
> >>>>>>> *connector)
> >>>>>>> -{
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>> to_hdmi_connector(connector);
> >>>>>>> -     struct hdmi *hdmi = hdmi_connector->hdmi;
> >>>>>>> -     struct edid *edid;
> >>>>>>> -     uint32_t hdmi_ctrl;
> >>>>>>> -     int ret = 0;
> >>>>>>> -
> >>>>>>> -     hdmi_ctrl = hdmi_read(hdmi, REG_HDMI_CTRL);
> >>>>>>> -     hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl | HDMI_CTRL_ENABLE);
> >>>>>>> -
> >>>>>>> -     edid = drm_get_edid(connector, hdmi->i2c);
> >>>>>>> -
> >>>>>>> -     hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
> >>>>>>> -
> >>>>>>> -     hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
> >>>>>>> -     drm_connector_update_edid_property(connector, edid);
> >>>>>>> -
> >>>>>>> -     if (edid) {
> >>>>>>> -             ret = drm_add_edid_modes(connector, edid);
> >>>>>>> -             kfree(edid);
> >>>>>>> -     }
> >>>>>>> -
> >>>>>>> -     return ret;
> >>>>>>> -}
> >>>>>>> -
> >>>>>>> -static int msm_hdmi_connector_mode_valid(struct drm_connector
> >>>>>>> *connector,
> >>>>>>> -                              struct drm_display_mode *mode)
> >>>>>>> -{
> >>>>>>> -     struct hdmi_connector *hdmi_connector =
> >>>>>> to_hdmi_connector(connector);
> >>>>>>> -     struct hdmi *hdmi = hdmi_connector->hdmi;
> >>>>>>> -     const struct hdmi_platform_config *config = hdmi->config;
> >>>>>>> -     struct msm_drm_private *priv = connector->dev->dev_private;
> >>>>>>> -     struct msm_kms *kms = priv->kms;
> >>>>>>> -     long actual, requested;
> >>>>>>> -
> >>>>>>> -     requested = 1000 * mode->clock;
> >>>>>>> -     actual = kms->funcs->round_pixclk(kms,
> >>>>>>> -                     requested, hdmi_connector->hdmi->encoder);
> >>>>>>> -
> >>>>>>> -     /* for mdp5/apq8074, we manage our own pixel clk (as opposed to
> >>>>>>> -      * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
> >>>>>>> -      * instead):
> >>>>>>> -      */
> >>>>>>> -     if (config->pwr_clk_cnt > 0)
> >>>>>>> -             actual = clk_round_rate(hdmi->pwr_clks[0], actual);
> >>>>>>> -
> >>>>>>> -     DBG("requested=%ld, actual=%ld", requested, actual);
> >>>>>>> -
> >>>>>>> -     if (actual != requested)
> >>>>>>> -             return MODE_CLOCK_RANGE;
> >>>>>>> -
> >>>>>>> -     return 0;
> >>>>>>> -}
> >>>>>>> -
> >>>>>>> -static const struct drm_connector_funcs hdmi_connector_funcs = {
> >>>>>>> -     .detect = hdmi_connector_detect,
> >>>>>>> -     .fill_modes = drm_helper_probe_single_connector_modes,
> >>>>>>> -     .destroy = hdmi_connector_destroy,
> >>>>>>> -     .reset = drm_atomic_helper_connector_reset,
> >>>>>>> -     .atomic_duplicate_state =
> >>>>>>> drm_atomic_helper_connector_duplicate_state,
> >>>>>>> -     .atomic_destroy_state =
> >>>>>> drm_atomic_helper_connector_destroy_state,
> >>>>>>> -};
> >>>>>>> -
> >>>>>>> -static const struct drm_connector_helper_funcs
> >>>>>>> msm_hdmi_connector_helper_funcs = {
> >>>>>>> -     .get_modes = msm_hdmi_connector_get_modes,
> >>>>>>> -     .mode_valid = msm_hdmi_connector_mode_valid,
> >>>>>>> -};
> >>>>>>> -
> >>>>>>> -/* initialize connector */
> >>>>>>> -struct drm_connector *msm_hdmi_connector_init(struct hdmi *hdmi)
> >>>>>>> -{
> >>>>>>> -     struct drm_connector *connector = NULL;
> >>>>>>> -     struct hdmi_connector *hdmi_connector;
> >>>>>>> -
> >>>>>>> -     hdmi_connector = kzalloc(sizeof(*hdmi_connector), GFP_KERNEL);
> >>>>>>> -     if (!hdmi_connector)
> >>>>>>> -             return ERR_PTR(-ENOMEM);
> >>>>>>> -
> >>>>>>> -     hdmi_connector->hdmi = hdmi;
> >>>>>>> -     INIT_WORK(&hdmi_connector->hpd_work, msm_hdmi_hotplug_work);
> >>>>>>> -
> >>>>>>> -     connector = &hdmi_connector->base;
> >>>>>>> -
> >>>>>>> -     drm_connector_init_with_ddc(hdmi->dev, connector,
> >>>>>>> -                                 &hdmi_connector_funcs,
> >>>>>>> -                                 DRM_MODE_CONNECTOR_HDMIA,
> >>>>>>> -                                 hdmi->i2c);
> >>>>>>> -     drm_connector_helper_add(connector,
> >>>>>>> &msm_hdmi_connector_helper_funcs);
> >>>>>>> -
> >>>>>>> -     connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> >>>>>>> -                     DRM_CONNECTOR_POLL_DISCONNECT;
> >>>>>>> -
> >>>>>>> -     connector->interlace_allowed = 0;
> >>>>>>> -     connector->doublescan_allowed = 0;
> >>>>>>> -
> >>>>>>> -     drm_connector_attach_encoder(connector, hdmi->encoder);
> >>>>>>> -
> >>>>>>> -     return connector;
> >>>>>>> -}
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
