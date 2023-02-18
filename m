Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51169BABE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 16:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6D10E4E2;
	Sat, 18 Feb 2023 15:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4B910E4E2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 15:34:08 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id fd2so3591001edb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 07:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whvjdDNL0YyihGiScLJpuUiNsWaIXqPHSQ+hAFVaT/o=;
 b=hfCRopqQcvYe0p1NI/OnI0Asw7RK8dQG5GwB8iUEm7S86KQ3sogc8ptsBp/zppu7LU
 i1siVZxe14sq04QMCn/k8ZBI6WN4yQe5KI2o019L4PbCIhP0CMtuotM/mJ/g4XVuAuKW
 CJk3ESbIluAB34DjHZztYhby968kkDAqPqef7RBDePZ1sYc0b3DmHzrQRbw5CIzlDN5A
 ArZMX2prYjp7oy43pO6ROeEvJYybyoOk86sNh018m5lDqNE25awOPeEZogPjk9e13LWv
 DUQ8vBpgVqh5RhRK+LLvEAojVflWJbyML817mnm6dqGhApLMPxhjeX+zKUGKfzPcxJIe
 e9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whvjdDNL0YyihGiScLJpuUiNsWaIXqPHSQ+hAFVaT/o=;
 b=MlJQ8eiDyuKBM96DjXDQ7jHxrpeTVZRHXCUaA+sQymr0/q+86zP4quWmduf1Xul3gH
 vcAY4AsBEz/sIslLWk7fjAU7qKdbrsGOVEiyJXbgU73Z4/SUVeZ/0p4+VzrZZQ8VZpOH
 yfMov/L423TGRlNXYct90ZWfI+BAjAeLlvGImQovebCzy5wHIQLNei5cRaOpQspF7c23
 0mkOB959AXw0QhXgrG1spjUYOXn62HmzvEJGdPHQHck49YQNtRFHli3/zMYF9KkMtfo+
 w8i15b3PgI30rDh/T/0eOLmOqUzghqS06b7SXBEQpqVWymffP13qSsRo3cKAVrAlFmvj
 bESg==
X-Gm-Message-State: AO0yUKUj37lZBAk1MqP1lQKfyOfvpO7HyWHpjLBlpB94OlplU0dbmkGT
 ZYmjPzKl65hWN4Wj9viflCtfq4eB1jH+VWwGhSk=
X-Google-Smtp-Source: AK7set9Tuyg7KuTgdoHJxdFQUaB/2dr0ffoue42nj2SuS5ryAeoWm2tBfUGhw5vYZutZ4hccrYOmriLPrj7eG6rP15w=
X-Received: by 2002:a50:8add:0:b0:4ad:274:cf12 with SMTP id
 k29-20020a508add000000b004ad0274cf12mr253734edk.4.1676734447404; Sat, 18 Feb
 2023 07:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
 <Y+DPQjukgC0BELkN@intel.com>
 <CAFBinCBpbRu9xfCEfZJfT7t3doV=+CX03+h7W+HsoW5T4X0W0w@mail.gmail.com>
 <Y+oa6O6+s5UXvOP6@intel.com>
 <CAFBinCC6RRiN0=XYNw464omzjHrRcNZn39i3_Ztfq6M2xMpgRw@mail.gmail.com>
 <Y+v+jFKiQ3Rj2aYL@intel.com>
In-Reply-To: <Y+v+jFKiQ3Rj2aYL@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Feb 2023 16:33:56 +0100
Message-ID: <CAFBinCARqY5K6r_9WcKvBnVfUJuFv78ZYk6D0UiA7FYaA4Kkog@mail.gmail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 10:35 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
[...]
> > > We should perhaps just get rid of HDMI_VENDOR_INFOFRAME_SIZE
> > > entirely.
> > My thought was to make it the correct size for
> > drm_hdmi_vendor_infoframe_from_display_mode(). Then developers using
> > this "common" vendor infoframe don't have to worry much.
> > If there's another vendor infoframe implementation (which I'm not
> > aware of, but it may exist - since as you point out: it's vendor
> > specific) then the driver code shouldn't use
> > drm_hdmi_vendor_infoframe_from_display_mode() but rather implement
> > something custom. At that point the person implementing that will also
> > need to know their specific infoframe maximum size.
>
> Yes but that other infoframe will still have
> type=3D=3DHDMI_INFOFRAME_TYPE_VENDOR, and
> HDMI_INFOFRAME_SIZE(VENDOR) would again
> give the wrong answer.
So this means the way forward is to remove HDMI_VENDOR_INFOFRAME_SIZE?
That means it's up to the (HDMI) driver developers to use a big enough
buffer (by hard-coding the size). Last time I checked all drivers did.


Best regards,
Martin
