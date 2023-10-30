Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C377A7DB9AC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 13:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B1F10E2A1;
	Mon, 30 Oct 2023 12:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9378F10E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:12:18 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-59b5484fbe6so38993477b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 05:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698667937; x=1699272737; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uGGSQFPL3Jk07HUtIQ8OBKKUYnpLSAaX2KsFu6Um6GQ=;
 b=WIoSslzFI/RfUoUjgPPnkcUGOLNSVq0oNheD7aE9N0CNqUTAHKMpgG0kdqOB7BHnVa
 Nsr7xhBvMa/vCQpGZamz1h2eoznt0QBpXJqaycN21LH45pQdzcYc8QaE3A9j0e8Q4Lom
 Lc6G3U7TjrTW4zeVWQag4hcw5wE3iRveXN/30OHRU+FZ6oiTFkoKgZLIsoX5PcyWJFC6
 j+eLduPiC98Kk5eTQ2PTpLAJjloivsOQG/ecs7eWIArRmkQbK4cl3u7QZFpdjHedv7Ti
 yph65bvAH6sFAKZ80eDKUEgAg+B8bm+ush5//dQd0ZhSA8c6wU5uZ4mWcMcr5GCSQV+Y
 Gwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698667937; x=1699272737;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGGSQFPL3Jk07HUtIQ8OBKKUYnpLSAaX2KsFu6Um6GQ=;
 b=Nq4ZxyLpbqwPIrbmdyUiU7IwF6JMmdz7daUZYFLydH+AAjdIUqMP+NFgf4VMdm3XqZ
 zqcW24O0CfBIa3G7mx7UNRsqMnVsekaAl6mopnQslVW93UtydotFB0j9r6Fu0OlViWVb
 Trg480TIYXZfcy5K0vB0chhKuc+SHde/APwQiwfguHvUTxCe+RURcNBN0cpJc46bxz3Q
 ni0H7TsOdK3K4VFLXPKQMUo/yFyMKDAfiagHrsYE1f5IfN734G4GlRIT1jvC4gMAHRA2
 mr7Mk2LwSnKskAjsjYn8Aa77p+qQEir3B8IRacrqG9K66qw9OgLgva/m5IKJEyO0Fa36
 Bq3Q==
X-Gm-Message-State: AOJu0Yz5nmd0UV9StcDZ7xkHKwBiB+y/9MZ7PL2arAPBEy9zGQL2LerD
 1o63erbB8N9V7Y9T+5+DZW8yOodm5lVWxjWO/GpC4A==
X-Google-Smtp-Source: AGHT+IEIU5YGxlDfDS8T1H4xLh9KXN/ujJ6nx1J3s3yMH1x2dLaQt7oyQkWnmQ0+toE71rTekpelIaLNxT/y2t0u2tA=
X-Received: by 2002:a81:9ad2:0:b0:5a7:f002:4fe4 with SMTP id
 r201-20020a819ad2000000b005a7f0024fe4mr9657467ywg.23.1698667937668; Mon, 30
 Oct 2023 05:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
 <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
 <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org>
 <ZT9m/OoFUiZaWy9s@kuha.fi.intel.com>
 <CAA8EJprgpfh_GOeV+557YHWUJC-9W1Tw7nzb0jy5mPAv35VuGA@mail.gmail.com>
 <B8P9onfq9cXaSM_GbX3N_PSdo19FY_donmDWeAwLGlrrRvclqNcOA2LCGBnVYuJtAlJJFanedJL6GygtJHDS6WP5twzb-L7VJYnmqyFXZtk=@emersion.fr>
 <CAA8EJpoWuRw_eDSEL=khDoXrS1GctxJzXhdMy9iLb5PDG-=Vfg@mail.gmail.com>
 <ggE_bGq2Q6EpabJVQHH3boOhxNpTZLD9RVaI-RdchIuQZNkRRL5L9WL4-91foZPnzP59SI_ChrQszENrYBXsFUqK9nSvMv2e-yGYpsz5jUA=@emersion.fr>
In-Reply-To: <ggE_bGq2Q6EpabJVQHH3boOhxNpTZLD9RVaI-RdchIuQZNkRRL5L9WL4-91foZPnzP59SI_ChrQszENrYBXsFUqK9nSvMv2e-yGYpsz5jUA=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 14:12:06 +0200
Message-ID: <CAA8EJprtkC_-HXTNGT9-WOCOP15FLFkfirrUJp+nK74njPw4Ew@mail.gmail.com>
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
To: Simon Ser <contact@emersion.fr>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 12:27, Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, October 30th, 2023 at 11:22, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On Mon, 30 Oct 2023 at 12:13, Simon Ser contact@emersion.fr wrote:
> >
> > > On Monday, October 30th, 2023 at 10:47, Dmitry Baryshkov dmitry.baryshkov@linaro.org wrote:
> > >
> > > > On Mon, 30 Oct 2023 at 10:19, Heikki Krogerus
> > > > heikki.krogerus@linux.intel.com wrote:
> > > >
> > > > > On Mon, Oct 23, 2023 at 09:24:33PM +0300, Dmitry Baryshkov wrote:
> > > > >
> > > > > > On 15 September 2023 15:14:35 EEST, Heikki Krogerus heikki.krogerus@linux.intel.com wrote:
> > > > > >
> > > > > > > Hi Dmitry,
> > > > > > >
> > > > > > > On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
> > > > > > >
> > > > > > > > In order to notify the userspace about the DRM connector's USB-C port,
> > > > > > > > export the corresponding port's name as the bridge's path field.
> > > > > > > >
> > > > > > > > Signed-off-by: Dmitry Baryshkov dmitry.baryshkov@linaro.org
> > > > > > > > ---
> > > > > > > > drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 11 +++++++----
> > > > > > > > drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c | 4 +++-
> > > > > > > > drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h | 6 ++++--
> > > > > > > > 3 files changed, 14 insertions(+), 7 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > > > > > > > index b9d4856101c7..452dc6437861 100644
> > > > > > > > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > > > > > > > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > > > > > > > @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > > > > > > > struct device_node *np = dev->of_node;
> > > > > > > > const struct pmic_typec_resources *res;
> > > > > > > > struct regmap *regmap;
> > > > > > > > + char *tcpm_name;
> > > > > > > > u32 base[2];
> > > > > > > > int ret;
> > > > > > > >
> > > > > > > > @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > > > > > > > mutex_init(&tcpm->lock);
> > > > > > > > platform_set_drvdata(pdev, tcpm);
> > > > > > > >
> > > > > > > > - tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
> > > > > > > > - if (IS_ERR(tcpm->pmic_typec_drm))
> > > > > > > > - return PTR_ERR(tcpm->pmic_typec_drm);
> > > > > > > > -
> > > > > > > > tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
> > > > > > > > if (!tcpm->tcpc.fwnode)
> > > > > > > > return -EINVAL;
> > > > > > > > @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > > > > > > > goto fwnode_remove;
> > > > > > > > }
> > > > > > > >
> > > > > > > > + tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
> > > > > > > > + tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);
> > > > > > >
> > > > > > > So I got some questions and concerns off-list. This was one of the
> > > > > > > concerns. That tcpm_name is now the actual port device name, so I'm
> > > > > > > afraid this is not acceptable.
> > > > > > >
> > > > > > > You can't use device name as a reference, ever. There is no way to
> > > > > > > guarantee that a device with a specific name is what you meant it to
> > > > > > > be by the time it's accessed.
> > > > > >
> > > > > > Hmm, could you please be more specific, why? I mean, class devices are not
> > > > > > that easy to be renamed in sysfs, are they? Or are you concerned about the
> > > > > > device being destroyed behind userspace's back? At least for MSM this will be
> > > > > > a huge problem already, with the bridge driver suddenly being removed.
> > > > >
> > > > > The race exists even in your case, but please do not look at this as a
> > > > > solution for only your platform.
> > > >
> > > > Yes!
> > > >
> > > > > This is about showing the user space a link between two device
> > > > > instances (struct device), and the way you do that is by creating a
> > > > > symlink. That way the kernel can take care of reference counting and
> > > > > guarantee that the link always points to the correct device. That way
> > > > > the link will also be always visible in user space without requirement
> > > > > for any specific ABI like it should.
> > > >
> > > > I'm fine with the symlink approach (and I'll follow that up after
> > > > finishing the UCSI glue driver rework). However I feel several
> > > > deficiencies there:
> > > >
> > > > 1) It creates asymmetry with the DP MST case. Do we want to have
> > > > symlinks in each of the MST connectors? Or do we follow the PATH
> > > > properties in the MST case until we find the root port, which has
> > > > symlink? Please note, that fine X11 renames DP MST connectors
> > > > internally, so in xrandr I see DP-2-1, which maps to
> > > > /sys/class/drm/card0-DP-2. Kind of hard to follow.
> > > >
> > > > 2) For the multi-card cases, one has to remap the connector to the
> > > > card index + connector path. And this needs to be done by all user
> > > > space applications, which would like to present this kind of
> > > > information for the user.
> > > >
> > > > 3) If we were to support non-USB-C connectors (e.g. MyDP / SlimPort
> > > > and MHL used simple micro-USB connectors) there would be a completely
> > > > new uABI. And any external port / wrapper will also require a
> > > > completely new symlink kind.
> > > >
> > > > I understand your concerns regarding mentioning external device in the
> > > > PATH property. However I think we should make it easier for the
> > > > userspace app to determine the kind of the external connector. What
> > > > would you think about extending the PATH property in the following
> > > > way:
> > > >
> > > > For the USB-C connectors the PATH property has the value of
> > > > `typec:cardN-DP-m` value. Userspace app can then look for the
> > > > typec_connector symlink at the /sys/class/drm/cardN-DP-m subdir to
> > > > find the information about the corresponding USB-C port.
> > >
> > > This doesn't make sense to me. "cardN-DP-m" has nothing to do with the
> > > physical path of the connector. All of the parts of this string are
> > > exposed elsewhere in the KMS uAPI already.
> >
> > True. It seems I mixed KMS and xrandr clients in my head.
> > Just 'typec:' then? This way userspace will still know that it is a
> > USB-C connector (and can stop there) and if it needs more information
> > (e.g. physical location) it can further look for the symlink in the
> > sysfs.
>
> It sounds like an abuse of the PATH property. PATH is supposed to
> contain an actual path, not just some connector type.
>
> User-space can directly look into sysfs if it wants to figure out
> whether a connector is typec.

typec:N, where N is an id of the port?

-- 
With best wishes
Dmitry
