Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180A65536FA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 17:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B695210E1B3;
	Tue, 21 Jun 2022 15:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127F10E2DA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 15:58:22 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id j9so5505878ilr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVa9EIh+i5Q6XRan1FynNxbsWTmgds0/W/AATBRzizk=;
 b=hsfOBPueNuYUDJ4ySSjM5CFNwSHVz1OsdRwtih7AsUeN9l0hqX9tPC8OKcaaW+LFgz
 A80pod35uNbA0Zzg1htq2cfLvyFPl2Ku5Y/UfWuoAPgwaz5FO6m4F9UuSpmz43XASrmK
 GEAng3UvqAmTqgzGWPsKKcbpLlYI185+xCFNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVa9EIh+i5Q6XRan1FynNxbsWTmgds0/W/AATBRzizk=;
 b=waAQnEnhUwRHUSgooJtubEg1nxPn2SL3g0Er1yV7Sj/AedZd70pf/JDcK6KbBHl8oc
 80ZjXw63uS0LEBxahoRu663SfNNSaN6F88eToI88lVeJ57yWacqwCgLvigCicnFhY/eT
 u0T4taTn4D0BKxTfBHEjxhjjSP++IjT9AUCWG9tsEncAAP5NEbZsmDYjnPAOP4OBvJaF
 hbqjSpVsoWrgFKHPRZLAtI9bZsWyn1wLSIcx1pQTm+B5solvxZb/cn+bowGdf+u6STSz
 +EDd+OQylJDM6esPyvLNvzUnvjlVI1PtYva7yOobKtXXj5cQZGDGHv/QZZlHM9iseucc
 GAOw==
X-Gm-Message-State: AJIora9Fp01KFsjgQr03ss/cIsSTC+gtVeJjV79C4ZiNG403nnKd1UqC
 LTgQD1ZF8zxpYBOaL4+OSbwRWuOOO41Ihw==
X-Google-Smtp-Source: AGRyM1sMbKYLaqHkD6V/1gCZwGGCq9kp/HFINUw/HmEpYhaY+jPY5BLKdvHqyQowOuko6oEvtwqSuA==
X-Received: by 2002:a05:6e02:1a23:b0:2d3:82bb:4dae with SMTP id
 g3-20020a056e021a2300b002d382bb4daemr16549990ile.62.1655827101622; 
 Tue, 21 Jun 2022 08:58:21 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a02cc27000000b00335d7c314b1sm6980540jap.53.2022.06.21.08.58.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 08:58:19 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id n12so2310475ilt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 08:58:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1e0b:b0:2d1:b5e8:38a0 with SMTP id
 g11-20020a056e021e0b00b002d1b5e838a0mr17149386ila.296.1655827099263; Tue, 21
 Jun 2022 08:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220609072722.3488207-1-hsinyi@chromium.org>
 <CAJMQK-hg5kLUV=ZgVN5=qX=bRiBWx3O-4X9wPF6CwxpQVSuinA@mail.gmail.com>
 <CAD=FV=XMjSu9pJHj+2L7vrVocDkn4+VcPQ07tNKZMfj4qUYgYA@mail.gmail.com>
In-Reply-To: <CAD=FV=XMjSu9pJHj+2L7vrVocDkn4+VcPQ07tNKZMfj4qUYgYA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Jun 2022 08:58:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYnOq_qDqTTw7HYjPk4XDZaSpgDPJ_T_6BGV9OftuE_w@mail.gmail.com>
Message-ID: <CAD=FV=UYnOq_qDqTTw7HYjPk4XDZaSpgDPJ_T_6BGV9OftuE_w@mail.gmail.com>
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

On Wed, Jun 15, 2022 at 6:36 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jun 14, 2022 at 10:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Thu, Jun 9, 2022 at 3:27 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > Panels usually call drm_connector_set_panel_orientation(), which is
> > > later than drm/kms driver calling drm_dev_register(). This leads to a
> > > WARN()[1].
> > >
> > > The orientation property is known earlier. For example, some panels
> > > parse the property through device tree during probe.
> > >
> > > The series add a panel API drm_connector_set_orientation_from_panel()
> > > for drm/kms drivers. The drivers can call the API to set panel's
> > > orientation before drm_dev_register().
> > >
> > > Panel needs to implement .get_orientation callback to return the property.
> > >
> > > [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
> > >
> > > Hsin-Yi Wang (8):
> > >   drm/panel: Add an API to allow drm to set orientation from panel
> > >   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
> > >   drm/panel: panel-edp: Implement .get_orientation callback
> > >   drm/panel: lvds: Implement .get_orientation callback
> > >   drm/panel: panel-simple: Implement .get_orientation callback
> > >   drm/panel: ili9881c: Implement .get_orientation callback
> > >   drm/panel: elida-kd35t133: Implement .get_orientation callback
> > >   drm: Config orientation property if panel provides it
> > >
> > hi Maintainers,
> >
> > All the patches are reviewed. If there's no other comments, will this
> > series be picked? Thanks.
>
> Unless someone beat me to it or yells, my plan was to land them to
> drm-misc-next next week. Since it touches core code I wanted to give a
> little extra time. Also at the moment patch #8 is all Chromium (all
> author and reviewers are chromium.org) at the moment so that's another
> reason to make sure it has sufficient time on the lists.

As promised, I've pushed to drm-misc-next. Note: I had to fix
whitespace problems in almost every patch. Please run checkpatch on
your patches.

15b9ca1641f0 drm: Config orientation property if panel provides it
a64af136771a drm/panel: elida-kd35t133: Implement .get_orientation callback
db9b4ffbfa82 drm/panel: ili9881c: Implement .get_orientation callback
a960e35ac011 drm/panel: panel-simple: Implement .get_orientation callback
c0398df2a195 drm/panel: lvds: Implement .get_orientation callback
47bef230225b drm/panel: panel-edp: Implement .get_orientation callback
3fa214eea43a drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
5e41b01a7808 drm/panel: Add an API to allow drm to set orientation from panel

-Doug
