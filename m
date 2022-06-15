Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174A54C9ED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303A810E965;
	Wed, 15 Jun 2022 13:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7867A10E965
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:36:30 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id cn20so3774405edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zWnIQisaB23D1MVkJ7LO1Hk7sla55AkBqlxsG0Kthk=;
 b=DvQrJZOuXygLUHJr/UWGOxHJtFOET4POoEljY1Do+Nnqmr68OTk1L3WIgHJ5UVGARJ
 Nrf/2YD5NtlIolg9/TqczLw9ELFHgikQ6bwDqUGcHrVU8r8xGembhNekxtGZAYc/ZMsm
 w0II+sD69A1OUbKbLmBOceE/RXOy3t5uC2dYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zWnIQisaB23D1MVkJ7LO1Hk7sla55AkBqlxsG0Kthk=;
 b=AQfrBzLDw0yU1XbY7nIe82BnRljbh1xr1F+S06yjoBvgADSa6ytRZLgRmgxz5jSZcM
 WMZkEMuucyz0fhegdsQCRVeED0BBKACuzT4GI+S+Y1DJ6mkej1aZRf5xmb3p5c+/1ZBV
 xV7StQNXQyGE4Vpyhll6ya/J17Jw1Mvj3hshELn7hhzWUltLlhlc/OUsPKjwnS/SbIP7
 /D7ECLCdvzoJ5QCR0D7mdYYPo25iMjcSrheS3yXyv4FJk4qBQfEyNTD4v9w8BT3NXHvb
 dZKFlhSLh4YBajakrIwLfLww2LKQB0K8KPdoJyJxTfudtDxiUq20JaBwHqPhOAx1Zo8S
 YS8w==
X-Gm-Message-State: AOAM5336G+6n/xsqQj8nLdfMBCKCgSVgCvnuUCDmwaT1yA0BAplNbaHl
 /KLayJcefa4nnjDi+hf0o1mVub5u/ktfRtLB
X-Google-Smtp-Source: ABdhPJyD2ORcJOKncIUWBcBJncQSLqU/VBeDawJYua5lVW6TPlaz5UoSOYq0lxAAkbbOvfOG/YkeFw==
X-Received: by 2002:aa7:c952:0:b0:434:edcc:f247 with SMTP id
 h18-20020aa7c952000000b00434edccf247mr12828228edt.412.1655300188811; 
 Wed, 15 Jun 2022 06:36:28 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 g18-20020aa7d1d2000000b0042deea0e961sm9260074edp.67.2022.06.15.06.36.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 06:36:27 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id c21so15451828wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:36:26 -0700 (PDT)
X-Received: by 2002:a05:6000:1685:b0:218:45f0:5be6 with SMTP id
 y5-20020a056000168500b0021845f05be6mr10368799wrd.301.1655300186122; Wed, 15
 Jun 2022 06:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220609072722.3488207-1-hsinyi@chromium.org>
 <CAJMQK-hg5kLUV=ZgVN5=qX=bRiBWx3O-4X9wPF6CwxpQVSuinA@mail.gmail.com>
In-Reply-To: <CAJMQK-hg5kLUV=ZgVN5=qX=bRiBWx3O-4X9wPF6CwxpQVSuinA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Jun 2022 06:36:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMjSu9pJHj+2L7vrVocDkn4+VcPQ07tNKZMfj4qUYgYA@mail.gmail.com>
Message-ID: <CAD=FV=XMjSu9pJHj+2L7vrVocDkn4+VcPQ07tNKZMfj4qUYgYA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add a panel API to set orientation properly
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 14, 2022 at 10:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Thu, Jun 9, 2022 at 3:27 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Panels usually call drm_connector_set_panel_orientation(), which is
> > later than drm/kms driver calling drm_dev_register(). This leads to a
> > WARN()[1].
> >
> > The orientation property is known earlier. For example, some panels
> > parse the property through device tree during probe.
> >
> > The series add a panel API drm_connector_set_orientation_from_panel()
> > for drm/kms drivers. The drivers can call the API to set panel's
> > orientation before drm_dev_register().
> >
> > Panel needs to implement .get_orientation callback to return the property.
> >
> > [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
> >
> > Hsin-Yi Wang (8):
> >   drm/panel: Add an API to allow drm to set orientation from panel
> >   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
> >   drm/panel: panel-edp: Implement .get_orientation callback
> >   drm/panel: lvds: Implement .get_orientation callback
> >   drm/panel: panel-simple: Implement .get_orientation callback
> >   drm/panel: ili9881c: Implement .get_orientation callback
> >   drm/panel: elida-kd35t133: Implement .get_orientation callback
> >   drm: Config orientation property if panel provides it
> >
> hi Maintainers,
>
> All the patches are reviewed. If there's no other comments, will this
> series be picked? Thanks.

Unless someone beat me to it or yells, my plan was to land them to
drm-misc-next next week. Since it touches core code I wanted to give a
little extra time. Also at the moment patch #8 is all Chromium (all
author and reviewers are chromium.org) at the moment so that's another
reason to make sure it has sufficient time on the lists.

-Doug
