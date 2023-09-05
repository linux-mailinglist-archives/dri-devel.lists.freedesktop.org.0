Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBF7921FF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 12:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D5210E4A9;
	Tue,  5 Sep 2023 10:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1610E4A9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 10:57:12 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d7b8d2631fdso2015944276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693911431; x=1694516231; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFp9JN673sSpwa45B4q2HQSN730WX8grbrKR4m9d76A=;
 b=i6+pVCzECF2oVmJH63wW8MbDK5jHRu8rSD5Omo67duOlg9UDorMTWvugVfitB1s1S1
 oUXshRsxWh95RT/s0MGK2lmXZfWk+B3fqY6bLz9Vb0zc0H2T6qicyWpnOXz/rlItSUIS
 5qJBCTSWrKWjXFpVgi0elVoIUyvZU/6GdEbxZSfUMuQEQF5EcLf2X1d5bI22muynB3A+
 1vwkmQcwzcGoDzUvg2ymPhgvofGBrME8OtLHT6g36nc7+qFOMzCH/0tRgIGFSbgt+XVd
 kgpUe55gNjaQVstYxQsXosO9FjPBq0/Rl3hlruEI3LzhiWIHRmsozj+b75WJNf8VlalA
 xbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693911431; x=1694516231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFp9JN673sSpwa45B4q2HQSN730WX8grbrKR4m9d76A=;
 b=fLeLIwSJe0MP5J8cTKs3sfIhZ42LY4Gi8WD7V0BpYsuvFiZ1PvPnoUdoXE+iImRD2C
 dx4ZaSX/Q+3gTFNTIMKTMbDdRfoNLKHqXAHMQquCdz4QV5Ud+lm17pHZEOl7FJS1mCqu
 vExRqRs0JYdsclarJh+zA00wpkbMc9Aka8l6A7OjgcKMP3e6wJdnVJaignUH4dJuD7vD
 X9yc65/kt+n+pkH2RHmHWv6ugMtZ2uNPtDVwsQo74zkNdcD2tjeCjtYb9QINzUDv2xHK
 5gdCg+UkbCtPc1VYUOJKtayQm5nkkqB68glu6G7j4aRMZ8GmAJ48m0NTQDOSpciPVJaz
 pMow==
X-Gm-Message-State: AOJu0YwIXNcR7lQBmA+bWl8iPZ2eFAQkR4sugTygafqMhwue6JSTOP6u
 kr8V9e3TA89/J6BuCpqM8R1UGwIxwCJKgUAmT7tzfg==
X-Google-Smtp-Source: AGHT+IGZHwMQlo/ityKImZ2VeEtB90rqhklF5U6Gv8PiiU7XpveUbpNUVJmNlPMw3mBk4Obk/SUY2ph1gPYN6jbIHDo=
X-Received: by 2002:a25:ac20:0:b0:d53:f98f:8018 with SMTP id
 w32-20020a25ac20000000b00d53f98f8018mr13526068ybi.65.1693911431284; Tue, 05
 Sep 2023 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
In-Reply-To: <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Sep 2023 13:56:59 +0300
Message-ID: <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
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
 Won Chung <wonchung@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heikki,

On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > dev_fwnode() checks never succeed, making the respective commit NOP.
>
> That's not true. The dev->fwnode is assigned when the device is
> created on ACPI platforms automatically. If the drm_connector fwnode
> member is assigned before the device is registered, then that fwnode
> is assigned also to the device - see drm_connector_acpi_find_companion().
>
> But please note that even if drm_connector does not have anything in
> its fwnode member, the device may still be assigned fwnode, just based
> on some other logic (maybe in drivers/acpi/acpi_video.c?).
>
> > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > breaks drivers already using components (as it was pointed at [1]),
> > resulting in a deadlock. Lockdep trace is provided below.
> >
> > Granted these two issues, it seems impractical to fix this commit in any
> > sane way. Revert it instead.
>
> I think there is already user space stuff that relies on these links,
> so I'm not sure you can just remove them like that. If the component
> framework is not the correct tool here, then I think you need to
> suggest some other way of creating them.

The issue (that was pointed out during review) is that having a
component code in the framework code can lead to lockups. With the
patch #2 in place (which is the only logical way to set kdev->fwnode
for non-ACPI systems) probing of drivers which use components and set
drm_connector::fwnode breaks immediately.

Can we move the component part to the respective drivers? With the
patch 2 in place, connector->fwnode will be copied to the created
kdev's fwnode pointer.

Another option might be to make this drm_sysfs component registration optional.

> Side note. The problem you are describing here is a limitation in the
> component framework - right now it's made with the idea that a device
> can represent a single component, but it really should allow a device
> to represent multiple components. I'm not saying that you should try
> to fix the component framework, but I just wanted to make a note about
> this (and this is not the only problem with the component framework).
>
> I like the component framework as a concept, but I think it needs a
> lot of improvements - possibly rewrite.

Yes. There were several attempts to rewrite the component framework,
but none succeeded up to now. Anyway, I consider rewriting components
framework to be a bigger topic compared to drm connector fwnode setup.

--
With best wishes
Dmitry
