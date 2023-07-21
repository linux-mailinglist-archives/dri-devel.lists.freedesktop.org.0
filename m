Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD275D7F1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 01:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2534710E044;
	Fri, 21 Jul 2023 23:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6919410E044
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 23:47:53 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so2366176276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689983272; x=1690588072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zdidEn8+DgwQGZvgmO/L7F7xMLay9WsUmEDZLpMAbc=;
 b=ATeyEp3GDz4IolJEsWAOgfWaNajJWJaT7YmLW8cwz3oTgSTyQrQ1xDw+btoHCCmREk
 9mfO28n8sozhIRUV5vZaCRUiCzXPciykCwPDegkZ/65H8kCoLJCQNKQeWbVCrb9nZJH9
 NpLgK+05kMwTgoX8gSn8lp1AlxdkgMqLONwOG4WWu4yJlUCScPff9Sn+Nz2JpboIxDFY
 DRLQa0HBCEmdycRf76jWWOjagssQSqB+w/i0KZQsUxefDFvp1k9QdIYeJqhfOVJhNlj5
 TjaBU5pN81p9uMKOD4VyTrk2lbj6lS3srRD4PbcnEelCS37M6mKUPhRm898R0uGZQF0h
 BSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689983272; x=1690588072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zdidEn8+DgwQGZvgmO/L7F7xMLay9WsUmEDZLpMAbc=;
 b=DpDX6wfH5OV3H7EifWEmwyYNKt4cT/W6BeqYxoK4mxvjPrHBJatTtquAKfAP2Vo31D
 nn8LQkbCqzLpHF4o/B0dXA7FL3sEKXqE4t9M9nYh1v5/BU8aKgUtomYioKmd9gPBi8qG
 zsSGAnsRl0W9Op29eLGf2cSZxliPLk4nwaQXxTciJwx0VB5r5SNhPtMxG7n+FVBLep2o
 dPKy1UweqSTHJU9zQ/1B9YrJFVHAaVdv8HfXfV6Sjuw0wqC/v1501C78O5705iVmkcXh
 CWTQFBG5r1aD6XLyFj80b7VsJcBOsWCpgP7PN8mZDch2aLUtQcq83M0jrZRKjND2kg3t
 v+cg==
X-Gm-Message-State: ABy/qLbbmnBbSf6zZv7XP5CkcgA48Rw9BdVzG6+CZnqjhqCQX5ibl33y
 BQic6ObDS9InC0LmEg/NUqUfxTfTSvoSeD6uV78=
X-Google-Smtp-Source: APBJJlFkKQC+QsNexWYuobiHBX2ekwBWJ20OWolyOxCqLoJOHqwSCYA+fdngamCB9WAB4U8kMWo6B4XdlY0RmE+j8CQ=
X-Received: by 2002:a25:d804:0:b0:d01:6e22:9291 with SMTP id
 p4-20020a25d804000000b00d016e229291mr2880083ybg.34.1689983272333; Fri, 21 Jul
 2023 16:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
 <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Jul 2023 01:47:41 +0200
Message-ID: <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 22, 2023 at 12:46=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Javier Martinez Canillas <javierm@redhat.com> writes:
>
> [adding Miguel Ojeda who was not in the Cc list]
>
> Hello Miguel, could you please ack this patch so that I can take the whol=
e
> patch-set through the drm-misc tree?

A note below...

> > The drivers in this subsystem are for character-based LCD displays, whi=
ch
> > can fall into the same category of the DRM/KMS and fbdev drivers that a=
re
> > located under the "Graphics support" menu. Add auxdisplay there as well=
.

Nit: this is not exactly true, e.g. ks0108/cfag12864b (which were the
first in the subsystem) were not character-based but a very simple
black-or-white 128x64 grid, so we should probably reword slightly
this.

In any case, if Helge thinks these may belong in the "Graphics
support" menu, then I am fine with it:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
