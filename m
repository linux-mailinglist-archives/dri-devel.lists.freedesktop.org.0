Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70A1CF238
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 12:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7E56E0BE;
	Tue, 12 May 2020 10:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3E6E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 10:19:04 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id 1so7491291vsl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/AsQa/OLIaC4mxgaTX9/zDMQgLH0nxvUygPCn0RQ8XI=;
 b=M+gFov2imtvKiCEdbTCPcaG/7OsrHR6ZpqOfM2AohMyG1on8fBjm1QzzUeWj/WcL7t
 c6TlPdCLIyN4m9A8DpBjwGAonHgud35j7rbEnabNcKx/D19dlM3Vwg9ozexGOJG6uaPq
 V+fjpTiI0xHqxkw5r/u54JX94PXovBZaqXHiagxBRDLnUWZ5IlVrSYie5r4KevSigp6L
 yXMatC09riqcjOHmTptEPv5EvmCPippcautanxo92u40FCnoVWpDBz0BElowaWvfKwlI
 R71LjIYHl6gbqH3hFRucF5Kw8e3df7WVTpaUGjrQP+NtYdoNZVHy0IwBvo7UZrl49ipc
 P14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/AsQa/OLIaC4mxgaTX9/zDMQgLH0nxvUygPCn0RQ8XI=;
 b=VeGYkt0ZQmlzW055apOkQVxU1KOqrpDct5xl3UMDlzSTCaT4wVMQy7reiQ6GQHnUsD
 +mXK8eTKypvdFrIrkhymlzPS2uFD/F3yUx3zZQ4zB/KonQuUGrxp0g9BfzyTW++B860I
 rGsK15IeMc+FOtjGrYS3bs3MtErfJt716k3KnIUMhTayQ156qWD1hZegrZ72NL439G9F
 TkspxP2wZNj/brexmZYaYi0dcv/zXpXIAZRZ9oXwKA0NlfRJV2qSZ4mxM6ZSdMOEYngG
 GeI35xCQgsSaVYLYpVtaSEnT5LNGJzjkceIgzuT2ctee+DvD1WaEuUzKqZxofcuy/Fqu
 DgDQ==
X-Gm-Message-State: AGi0PuYNx2lF21WkgVXsukVAhhh6bk/ZlAcoEv2YMMvGHvJ3UW5glMC7
 VMtZ4gqls6+wcS1gxDEdba4ursJaGUyV3cE2XeU=
X-Google-Smtp-Source: APiQypJKJOBuauTImMYjUNlRlo7VhllL5b2CANK1V2FYzDUyiId0Jx5jL+F0qj3DCWuirLyokJDIhhMs/4uyUuUUxXQ=
X-Received: by 2002:a67:fe8c:: with SMTP id b12mr14828547vsr.186.1589278743229; 
 Tue, 12 May 2020 03:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-14-tzimmermann@suse.de>
In-Reply-To: <20200512084258.12673-14-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 11:16:24 +0100
Message-ID: <CACvgo52PubG0Qp+9GLYB1A5CfW7j86WmMwfwqbYqTZR186+oGg@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] drm/mgag200: Use simple-display data structures
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:

>  static void mga_crtc_init(struct mga_device *mdev)
>  {
>         struct drm_device *dev = mdev->dev;
> -       struct mga_crtc *mga_crtc;
> -
> -       mga_crtc = kzalloc(sizeof(struct mga_crtc) +
> -                             (MGAG200FB_CONN_LIMIT * sizeof(struct drm_connector *)),

The #define MGAG200FB_CONN_LIMIT in mgag200_drv.h is no longer used, correct?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
