Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F0A79DE6F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 05:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CD410E086;
	Wed, 13 Sep 2023 03:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6AA10E073;
 Wed, 13 Sep 2023 03:00:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52a23227567so8140067a12.0; 
 Tue, 12 Sep 2023 20:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694574046; x=1695178846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0Ql+Umm198s7EODjUTAFVn1Eek/7t8Ja/ENb4v1xqU=;
 b=HkYrWqauQdNsiIGct8VRt9tj5uiMISEzdALoit0lSomNcwjP+Qim4RUu9sIc0SjgUh
 D9wI/5ucBBqjgN2RCzNFGdy5Gpr4ze69kM2U0PHka9IU61gRaiuXQUxcPyvpp+5WPxjJ
 exgU2mO1i5czZyKnykerqqvfB+ttBMaMChJPonlsK03P8wYlbrJmJu8Bwoxwyr4qIkOy
 CtztZbvjc1U6rmkM1nl5MWfNQblL9XBywYzlcIcQNK1Xw4PXZPZhmAzreYiXwE7SvckK
 jF6VT9LcynNC3xy0qA3gDs17KI+SwCESiyRdE6/IwktsZ+5i5VR0PScwPFRCfUipMQVn
 +qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694574046; x=1695178846;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0Ql+Umm198s7EODjUTAFVn1Eek/7t8Ja/ENb4v1xqU=;
 b=v3WSFafD/dbQeXCNdv9r6oCJU8Fvt2nVbUw3gKmKxNQqwQ2PB3XWaVUzdDDAX/b2ri
 IFgDfWN5OoH1yfBa6I+KlNBUBg3ExaJnM6pYAggIA+z67dmjOcIzOztr4cy6TfEirvj4
 6qYtT0V2ABwiEi6fl+V7wiTSGjUPSBn9Vo19JGBJAHoD/5Y6rsCav7Sx6ZbcBBsTFT+9
 Uso2g5ZfZdRLIFB2ocBu2IYx50bN/UZlh8mtNg5X8WJPi9sPfAFZkHyCY3nKGY9wh7FP
 OvLr2zBXiFUQ6/dAYYs7UxY2887onkvRplKdOoCMx67QP0PN7CWPtmRJYFb0TtrlFA4W
 UAKw==
X-Gm-Message-State: AOJu0YyNi0QZ01S7RBGlSqZW7Mtpb6XP4n5gStMAFNvYt6U/FK23e8qA
 G8XFRLJhQAaW5AtcP6BdEy85rr6+popVoLfHSxM=
X-Google-Smtp-Source: AGHT+IF0JSzHjtYwGdSyOBax8j/JP+0/XQuGOwuSzxEWvZ+fOgRCHl3kCpfR7eSsYL6DFD5DKB7OxY64M0Kcu7YHNxI=
X-Received: by 2002:a05:6402:6c7:b0:525:570c:566b with SMTP id
 n7-20020a05640206c700b00525570c566bmr1017895edy.22.1694574045793; Tue, 12 Sep
 2023 20:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
In-Reply-To: <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Sep 2023 20:00:33 -0700
Message-ID: <CAF6AEGvjPBETONoNet_wfR2c1o38eJ1JuajLYheMA-zvObeYBg@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM
 connectors to corresponding Type-C connectors"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Janne Grunau <j@jannau.net>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 2:15=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 06/09/2023 16:38, Heikki Krogerus wrote:
> > On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
> >> <heikki.krogerus@linux.intel.com> wrote:
> >>>
> >>> On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> >>>> Hi Heikki,
> >>>>
> >>>> On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
> >>>> <heikki.krogerus@linux.intel.com> wrote:
> >>>>>
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> >>>>>> The kdev->fwnode pointer is never set in drm_sysfs_connector_add()=
, so
> >>>>>> dev_fwnode() checks never succeed, making the respective commit NO=
P.
> >>>>>
> >>>>> That's not true. The dev->fwnode is assigned when the device is
> >>>>> created on ACPI platforms automatically. If the drm_connector fwnod=
e
> >>>>> member is assigned before the device is registered, then that fwnod=
e
> >>>>> is assigned also to the device - see drm_connector_acpi_find_compan=
ion().
> >>>>>
> >>>>> But please note that even if drm_connector does not have anything i=
n
> >>>>> its fwnode member, the device may still be assigned fwnode, just ba=
sed
> >>>>> on some other logic (maybe in drivers/acpi/acpi_video.c?).
> >>>>>
> >>>>>> And if drm_sysfs_connector_add() is modified to set kdev->fwnode, =
it
> >>>>>> breaks drivers already using components (as it was pointed at [1])=
,
> >>>>>> resulting in a deadlock. Lockdep trace is provided below.
> >>>>>>
> >>>>>> Granted these two issues, it seems impractical to fix this commit =
in any
> >>>>>> sane way. Revert it instead.
> >>>>>
> >>>>> I think there is already user space stuff that relies on these link=
s,
> >>>>> so I'm not sure you can just remove them like that. If the componen=
t
> >>>>> framework is not the correct tool here, then I think you need to
> >>>>> suggest some other way of creating them.
> >>>>
> >>>> The issue (that was pointed out during review) is that having a
> >>>> component code in the framework code can lead to lockups. With the
> >>>> patch #2 in place (which is the only logical way to set kdev->fwnode
> >>>> for non-ACPI systems) probing of drivers which use components and se=
t
> >>>> drm_connector::fwnode breaks immediately.
> >>>>
> >>>> Can we move the component part to the respective drivers? With the
> >>>> patch 2 in place, connector->fwnode will be copied to the created
> >>>> kdev's fwnode pointer.
> >>>>
> >>>> Another option might be to make this drm_sysfs component registratio=
n optional.
> >>>
> >>> You don't need to use the component framework at all if there is
> >>> a better way of determining the connection between the DP and its
> >>> Type-C connector (I'm assuming that that's what this series is about)=
.
> >>> You just need the symlinks, not the component.
> >>
> >> The problem is that right now this component registration has become
> >> mandatory. And if I set the kdev->fwnode manually (like in the patch
> >> 2), the kernel hangs inside the component code.
> >> That's why I proposed to move the components to the place where they
> >> are really necessary, e.g. i915 and amd drivers.
> >
> > So why can't we replace the component with the method you are
> > proposing in this series of finding out the Type-C port also with
> > i915, AMD, or whatever driver and platform (that's the only thing that
> > component is used for)?
>
> The drm/msm driver uses drm_bridge for the pipeline (including the last
> DP entry) and the drm_bridge_connector to create the connector. I think
> that enabling i915 and AMD drivers to use drm_bridge fells out of scope
> for this series.
>
>
> > Determining the connection between a DP and its Type-C connector is
> > starting to get really important, so ideally we have a common solution
> > for that.
>
> Yes. This is what we have been discussing with Simon for quite some time
> on #dri-devel.
>
> Unfortunately I think the solution that got merged was pretty much
> hastened in instead of being well-thought. For example, it is also not
> always possible to provide the drm_connector / typec_connector links (as
> you can see from the patch7. Sometimes we can only express that this is
> a Type-C DP connector, but we can not easily point it to the particular
> USB-C port.
>
> So, I'm not sure, how can we proceed here. Currently merged patch breaks
> drm/msm if we even try to use it by setting kdef->fwnode to
> drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c`
> is an ACPI-only thing, which is not expected to work in a non-ACPI cases.

In these cases we revert and try again next cycle

BR,
-R

>
> --
> With best wishes
> Dmitry
>
