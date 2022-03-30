Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF54ECFEA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6783C10E141;
	Wed, 30 Mar 2022 23:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5621D10E141
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 23:11:51 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 12so23622545oix.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPqh2Z2edk3dccrmJikhAgDwwrcQE2dtubUPKFnHDiI=;
 b=JXdU6TbqFBR2RVvlBxOP7S/wwBXp49N47L5DUzckpinSVQqvk/Jt7NeVrl7NF4n70z
 U+QnuTF/8k7qc+9x2qj4E58w4fjMQJ9Cayo5HbmzRE8AQvof8LDdIqO/Uqyy8xAv9YaP
 0IAubzoQdMq1+uUzsCSlm+mvZ4nIqOK8GC3RW1Ek+5626+v7U0EQf3lDQ6kMon0e7t6t
 n15OKUBMlYPmyaMa3K54foVLSfm68AFEk9ZEWRpAJeIeLDoUa8DMdYzsIqPbGqty+7Yh
 kiuvGmJ3VEO0ydyEpagSilULyWS8hv5tqQYr4unzCaWIIdNbs96bPBSANyeWbXk5vv0H
 FhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPqh2Z2edk3dccrmJikhAgDwwrcQE2dtubUPKFnHDiI=;
 b=iuexL34GkIouuzEmWW4p9gSfz+F+ArbkI6msLtbG9FW/imV5HkOkMw4Hykw4eVikcQ
 69QAGEjnfmtEdO3Fgvh5hfb+fKWrNndc2/qtT8s5XlcRCIr+DK35DHJ8X4VWDRXesUnD
 a2keX/lWzfXnkqmIXNWtsoYXh7OckpHbm09hZ62VF9Q1sTs2TFVg4qna6OjtpROdbNUh
 tfhRhhZgRSY6sV9Zxs93J3J5pOuXECuxndZUXY3ny2CcswIUU9a+T8SuDo+twMU7dasA
 zOB6yggCBVX88kRmkS2nWyD7MuFNVXYUTrmOOjM+tmEKTqryUZQWcCeQaVGNiSYNGyYC
 nnHQ==
X-Gm-Message-State: AOAM531AdQ75Kc9mGaU+QMi8OrwyEjk6l6BLWv5PzMLJFJVr548Q+ong
 Y8ACkQMPB45On4S1qw5g7HY0dQdCNkNWtX3/3bq2Wg==
X-Google-Smtp-Source: ABdhPJx9ty8tBeBMsyhu/66YtFk4uXji2wpCvCnMZCalv9Rpntd89+Wcp4ceRy0Kbf1GO1hH6OHH80kK8d2VJu0DN70=
X-Received: by 2002:a05:6808:d4b:b0:2da:398c:b46a with SMTP id
 w11-20020a0568080d4b00b002da398cb46amr1331292oik.0.1648681910424; Wed, 30 Mar
 2022 16:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat> <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
 <CAMty3ZDsZHFPmkSVdgcHCbmSb8N27nwesA_NDdMrPYhQn-D1tg@mail.gmail.com>
 <YkSzrvnto3WEJr04@phenom.ffwll.local>
In-Reply-To: <YkSzrvnto3WEJr04@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 31 Mar 2022 00:11:38 +0100
Message-ID: <CAPj87rO7a=NbarOyZp1pE=19Lf2aGjWu7sru-eHwGjX0fpN+-A@mail.gmail.com>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 30 Mar 2022 at 20:47, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Mar 31, 2022 at 12:14:31AM +0530, Jagan Teki wrote:
> > Does it mean the userspace knows when to disconnect and connect the
> > LVDS or HDMI? What if display-switch ISR will disconnect LVDS and
> > connect HDMI when HPD is On and connect LVDS and disconnect HDMI when
> > HDP is Off of-course it makes only one enable at a time.

Don't do that. :)

Be fully clear and explicit to userspace. Declare that there are
multiple connectors (one LVDS, one HDMI), with different backing
encoders as well. Declare their connection status appropriately, and
send hotplug events when it changes.

It is the responsibility of userspace to listen to these events, check
the status, and react accordingly. In the absence of userspace, fbcon
pretends to be userspace and tries to do the right thing.

> If your QT app directly uses kms, but doesn't handle hotplugs, then yes
> nothing at all happens. But that's just a userspace bug, not a kernel bug,
> and we really should _not_ work around random userspace issues like this
> in the kernel.
>
> Actually we cannot, because doing so would upset real kms compositors,
> since the kernel doing funny stuff underneath it will at best confuse it.
> And it some cases it resulted in crashes.

FWIW, this is not because userspace sucks and can't handle corner
cases; it's because hotplug is an unfixable race condition. The
correct way to handle this is eventual consistency; you make the
previous connections a zombie (allow them to continue even if they are
no longer alive), tell userspace that the connections have changed,
and trust that it will make the appropriate changes.

> > Does it mean to initialize to encoder instances and start attaching
> > those to respective bridge pipelines?
>
> I haven't checked, but I think it's not possible to change the bridge
> chaining after drm_dev_register is called due to locking.
>
> So doing bridge attach/detach from the hotplug handler is a no-go. The
> bridges need to be set up at driver load.
>
> Also with this design each bridge chain has its own drm_connector (HDMI
> and LVDS, if I got you right). But that's just how bridges work.

Yep.

> > Can you link some references in the source tree for it to make a quick check?
>
> See the atomic_best_encoder callback, doc link here:
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html?highlight=atomic_best_encoder#c.drm_connector_helper_funcs
>
> Although thinking about this you should have only 1 encoder for each
> drm_connector (if you go with separate connector for hdmi and lvds), and
> in that case the atomic helpers will take care of everything for you. Well
> except making sure that only one encoder of the two is enabled at the same
> time.

Yep again. But that's fine: declare one DRM connector for each
physical connector, only ever report one connector (and thus encoder)
connected at a time, and things will work.

Any userspace which tries to light up an output reported as
'disconnected' will expect that it will not work. Any userspace which
does not react to hotplug events cannot work with outputs which are
being hotplugged. And that's OK. You don't need to solve this with
elaborate workarounds in your drivers, you just need to give userspace
all the information it needs to make the right decisions, and then fix
it if it doesn't.

Cheers,
Daniel
