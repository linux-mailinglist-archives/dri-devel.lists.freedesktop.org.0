Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87306B0EEE3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 11:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757C10E789;
	Wed, 23 Jul 2025 09:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="c7msGYS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145E10E789
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:55:03 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4ab814c4f2dso119750481cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1753264502; x=1753869302;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EO09YBpdDz96d4cPRpf3m60aBgR2Imy8V5A5zUzYDbk=;
 b=c7msGYS04KodYACynco3JS6ulv8Jc3khoA0fjenuo/KRsYsFIksTELjNY1bQ6HtMgL
 zipKE47AalWW3vyHh40C5ooqlqUy1UEs++QQ2x4g3XcaKfrWkO9I5EZxjnir2iodxfrz
 aZpxIQouPGuaNd6Nxm162AMd/zHw+GhPWiUaqEyz2smWKkN7PYUZxaNpHCmUKsmTVsuZ
 IEtByk+NxYTavlOj+bpgPHOjWTOaa28evge2Gv/onzEjCD7V0/rZJ27AZGuQO2T94YLK
 qGiDXnYzS1AH57eZP0g7k3qvdtYsq1lyMRwNc9gwrZo5RYnwQHP/5XUPqJbIf5jc382+
 xHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753264502; x=1753869302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EO09YBpdDz96d4cPRpf3m60aBgR2Imy8V5A5zUzYDbk=;
 b=ghT+UryUuyqMMehozY+FbgeK9tzgWVpVrzI4wLzObxcCf8J6FfXRtLpitecjyBikHz
 +/74ej51tr1vqdVpqxIhDO91KQJD/IqOGhxnlUItlCTU2zEQERbEhDXcORjwwAdzieR/
 wHzVFLPswgDyfmA00pDlD7IgcJxu4JYUhYYLISK4A0eFWVWnKeL5tk0li0PiTZG7Aj0o
 cAH92v+XOCF2Uh3taKaudhtST9eJMGIVG4+hNnZoCD1zYPDZT6ujoARhT3/M1jT+RRb7
 4oZTbVnjFUQXPCzhXd9OGKqi5dl1Me+XIEtAwdmcweeJy/+IvoJhP0h9l6yL2KwTQjCE
 N5Mw==
X-Gm-Message-State: AOJu0YwTV+IPVDBos0BM+QvZil6Iu8r+JSUJ9H/mEUQ98VZoxmEB1l17
 wPcwB7lNICZ68/Se5/KBTJTU5F12G6hDj6nkXMvlIVmtG6AQly/U9El0ksrERssnPd22fq71lsr
 iczuMn+6TxiBr2+xFBCYeygvVRlQRgXDOW3BWhLpkNQ==
X-Gm-Gg: ASbGncsuZd6r3dcD0A6HRNNlb76S/Q0N42CQjY3STiFGCejDWjK6HV4V35GKnoPWe9o
 epsQw6Ak9zaewo3diB9X+Cy9hWSSpDJQ7YHsl1RSIjLMSxr/DvczHEeY1mbDC2fZWOipbhXSFBl
 j52izF9r4whFDsOKwV2RuZI71tnjMaGZ5GCHt62XWwAB5Sa2MMWmluV0MdqSuSxgmN+6+FxOrO+
 ULsXXgfxxvWckE=
X-Google-Smtp-Source: AGHT+IE1uBdX5SZVSkAqngrS/gIOq/KYGxK+56p++0mD//r4gyEml3uasqu/ouabhZwIG/0+OJwG8AoDZ4jGsVfhrh4=
X-Received: by 2002:ac8:5cca:0:b0:4ab:a0d2:a4da with SMTP id
 d75a77b69052e-4ae6df8ff95mr30719911cf.44.1753264502174; Wed, 23 Jul 2025
 02:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250627131751.2004-1-marius.vlad@collabora.com>
In-Reply-To: <20250627131751.2004-1-marius.vlad@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Jul 2025 10:54:51 +0100
X-Gm-Features: Ac12FXwfDiMxeYYLzt2f9OrFtginSrMeE2unNkk99U0Y5wABXga2RLJo-zDTC1c
Message-ID: <CAPj87rNvCQ2p944i3sMz3scYQtSUrAvxH_huGmrQSah0ueWzug@mail.gmail.com>
Subject: Re: [PATCH] drm: Pass down CONNECTOR ID for user-space to use
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 tzimmermann@suse.de, simona.vetter@ffwll.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marius,

On Fri, 27 Jun 2025 at 14:18, Marius Vlad <marius.vlad@collabora.com> wrote:
> Manually setting/forcing the connector status in sysfs does not
> propagate the CONNECTOR ID. For drivers that use polling, including
> manually setting it up with sysfs this would similarly to the HDP IRQ
> path which can pass it through drm_connector_helper_hpd_irq_event().

s/HDP/HPD/g

>  out:
> -       if (changed)
> -               drm_kms_helper_hotplug_event(dev);
> +       if (changed) {
> +               struct drm_connector *first_changed_connector = NULL;
> +               if (!mutex_trylock(&dev->mode_config.mutex)) {
> +                       repoll = true;
> +                       goto repoll;
> +               }
>
> +               drm_connector_list_iter_begin(dev, &conn_iter);
> +               drm_for_each_connector_iter(connector, &conn_iter) {
> +                       if (connector->sysfs_hotplug) {
> +                               drm_connector_get(connector);
> +                               first_changed_connector = connector;
> +                               connector->sysfs_hotplug = false;
> +                               break;
> +                       }
> +               }
> +               drm_connector_list_iter_end(&conn_iter);
> +               mutex_unlock(&dev->mode_config.mutex);
> +
> +               if (first_changed_connector) {
> +                       drm_sysfs_connector_hotplug_event(connector);
> +                       drm_connector_put(first_changed_connector);
> +               } else {
> +                       drm_kms_helper_hotplug_event(dev);
> +               }
> +       }
> +repoll:
>         if (repoll)
>                 schedule_delayed_work(delayed_work, DRM_OUTPUT_POLL_PERIOD);
>  }

There are a couple of different things in here, so I think it would be
good to split into multiple commits.

This commit as-is is not correct: if we force multiple connectors to a
given status at the 'same time' (i.e. before the output-poll worker
can run in between), we will only send a hotplug event for the first
connector in the list, and not the other.

The good news is that this is easy to fix: we don't need to hold the
big mode_config mutex over this list, because it's only needed to call
the connector probe, unless I'm very much mistaken. So you could drop
the locking and just call drm_sysfs_connector_hotplug_event() for
every changed connector. But then we're introducing a specialist path
for sysfs, which is not ideal.

I think first we should  aim to let output_poll_execute() send
per-connector events for _any_ kind of HPD event it finds. To that
effect, we could have a connector->status_changed bool which was set
whenever this happened, e.g. in drm_connector_helper_hpd_irq_event() /
check_connector_changed() for the connector-aware path, or
drm_helper_probe_single_connector_modes() for the general path. That
could then be cleared by drm_kms_helper_connector_hotplug_event() for
a single connector, or drm_kms_helper_hotplug_event() for all
connectors.

In the second commit, you could change output_poll_execute() to send
per-connector events, regardless of how they arrived. That would just
be iterating the connector list (without the mode_config mutex held)
and calling drm_kms_helper_connector_hotplug_event() for every changed
connector.

That would give us a nice logical progression: first we start tracking
whether a connector's status changed in a more robust way, which would
work across the multiple detection methods we have and also be OK for
sending events for delayed work. Then we start sending fine-grained
hotplug events when they come out of the poll helper. At the end of
the series, as a happy side effect of making code more generally
robust, we get HPD events for forcing connector status via sysfs.

Cheers,
Daniel
