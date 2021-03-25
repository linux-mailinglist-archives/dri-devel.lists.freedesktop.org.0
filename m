Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A02348C8D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4163A6ECE0;
	Thu, 25 Mar 2021 09:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0236ECE0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:16:47 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id z15so1425136oic.8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXOKWywYABw9gNC/Cfe6LcUrbMnuPsaMy+ZmXW6+jwk=;
 b=VS0a8U0oOPLleG0c1Q1cJZCd6WJNc/wWetmbvouXkWTxkiwqSGZAbHnfyNDbPbXQAz
 jIQtk4leA6dx9wSun9/f0ZbtMH3ncHZ5EQJ3dw552SkTe6WXmaEoJWQR6G+eIsfOx4TS
 Qj00SO7qND7yhQto43yY/IJkGAudEz33CQXuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXOKWywYABw9gNC/Cfe6LcUrbMnuPsaMy+ZmXW6+jwk=;
 b=kT9VLSlMFYRPzQDk7iwN4OOhQ4vFHTCk0TWa9xrCNTnw6wKZph32yzf0srSSJkFWpA
 FImv/3J68kXstw8qYYOiUyKWbKYMlKEUpvZiY23y1+4rfWxpwHVxzGT571b+7QOqZL22
 sGCeBaWeEyNdQqumNeIF+y9loDspS2ORjGqWm0Iej4j7rfOM21DezeGYavmxXlxAPaq8
 DA+wSqHpn1ObrW5rL7RLIzHcA5F2Y3yZvIwbEQo8MmPl9w+qH4DGZNqTRd/O0IeG4rMw
 2rwaPFiBVhGEdA6UDO+xcyvAGWTpV3JZ9eazDbEKiBe3oJzeJUk2DghE0o48Km20Fct2
 ODSw==
X-Gm-Message-State: AOAM533g3umhFVei5KFlSkGmyUxafojI3uXLLpAJRcOVnE31QV8mVUen
 ivX1Yyj0oMIPkGEJmo8Qa056q9hvXwzfk6CWo6k4fg==
X-Google-Smtp-Source: ABdhPJytsJjbKqMJCBkhVZVEz6znKYYwTbAL/6ddw6ajhG9nL40C06B20SHXzBy9ZL4KSWKD22wiqaFfQ7AsZO8Z0Es=
X-Received: by 2002:aca:4188:: with SMTP id o130mr5286825oia.101.1616663806913; 
 Thu, 25 Mar 2021 02:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210325061901.851273-1-wanjiabing@vivo.com>
 <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
In-Reply-To: <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Mar 2021 10:16:35 +0100
Message-ID: <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kael_w@yeah.net" <kael_w@yeah.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 7:53 AM Oleksandr Andrushchenko
<Oleksandr_Andrushchenko@epam.com> wrote:
>
> Hi,
>
> On 3/25/21 8:19 AM, Wan Jiabing wrote:
> > struct xen_drm_front_drm_info has been declared.
> > Remove the duplicate.
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>
> Thank you for the patch,
>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Will apply to drm-misc-next-fixes

drm-misc-next-fixes is the wrong tree, bugfixes outside of the merge
window belong into drm-misc-fixes. Please consult

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

We need to hard-reset drm-misc-next-fixes back, please re-apply the
patches (both of them) to drm-misc-fixes. Also adding drm-misc
maintainers.
-Daniel

>
> Thank you,
>
> Oleksandr
>
> > ---
> >   drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > index 3adacba9a23b..e5f4314899ee 100644
> > --- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > +++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > @@ -16,7 +16,6 @@
> >   struct drm_connector;
> >   struct xen_drm_front_drm_info;
> >
> > -struct xen_drm_front_drm_info;
> >
> >   int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
> >                           struct drm_connector *connector);



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
