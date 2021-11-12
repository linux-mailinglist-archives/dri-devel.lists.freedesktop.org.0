Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0A44EFCD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 23:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFCC6E0AD;
	Fri, 12 Nov 2021 22:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23A6E0AD;
 Fri, 12 Nov 2021 22:55:12 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bf8so20622810oib.6;
 Fri, 12 Nov 2021 14:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=14vmfAQ42quabFA6Quk5Bt5QbM2BlKN3RxLO3GHhoBE=;
 b=bLxiRmCthb17BYPT3738L9W5unWLvZF2OnGc1K2TH22vAfvajxwu9tkJrBJJFypWmj
 ZKSGqBXbx6Yc//lBGfFP96tOvexhr8BaVlOVDYXSVFFz5ZsQeLqVHeADP+Dv4eRcl9z8
 O0LrlDHx/MJmyyLb1E4C8f14Z3xLVlNqyj/HS9xGFVkWksi0M9i1gXURZqenZqnMYBOp
 Oo7e+fV6F0Sj5miUcNxHW0DBv+bA20mZl379QxADgoSeAC3Q7jCsr0RihKJuHiUgf4LJ
 Q5eKpBC+VZzHGTLCiIu++PE3+hy/C5i/rErUBDvjXRKjD2inqbXXqffJCHBBw4lTsCSO
 C9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=14vmfAQ42quabFA6Quk5Bt5QbM2BlKN3RxLO3GHhoBE=;
 b=KeepU+vHe8hE1zmjmvV4dHWAWhuxF/qPCsvoQaPjyT83tENYKP/4xFeV3XGxlt0XRF
 zhIPSxWpeix04oxorLuh0kAgXRdQbo0A5ZTg0zdogV9X8jzieAYBXT497ksh4Rk+LT5x
 PNwy2BvLt4OvvV5BZZjDvIJ6hR/89ikoOILcmzslYty0XYmRTWgB7KqZWAShwBUgsfQj
 hbtTk0QT/0xGstpMM2ppz09to6liK9jOhid6qoJJHTjb/gYbd27RmMfT6xo1WXz3uEuH
 RvrzFQjpK5pyyQTLGY9tZ2RI/VhUI5YtRN9TjMn3H8r21R22m9x18DMpOZjCTsHwaOcO
 lf5Q==
X-Gm-Message-State: AOAM530wlGvHzdtgsMH0fG0ZHDTzYEksRr4OMExPgMhW+9+I5+4Z4NsK
 SHvIua+uNvg1rGYyE7t6OAeCbRIuJSi0dk/X7qE=
X-Google-Smtp-Source: ABdhPJypOXtXccm6ljMIb6hs2AuHnjL92YyV2/XLtS509BhRrQXvoDIkWy6iJU+rPj+W1nFzyIJNQ42JQ85KTCM3THw=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr29316889oia.5.1636757711431; 
 Fri, 12 Nov 2021 14:55:11 -0800 (PST)
MIME-Version: 1.0
References: <1636625005-87952-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <abc4159c-e903-9265-826e-b44b387a7fcf@amd.com>
In-Reply-To: <abc4159c-e903-9265-826e-b44b387a7fcf@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Nov 2021 17:55:00 -0500
Message-ID: <CADnq5_PEwNL0o=FJdtm2eDeGC07Yd5HK1A8a0Ty1OW3qfBFPEw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up some inconsistent indenting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Nov 11, 2021 at 5:09 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 11.11.21 um 11:03 schrieb Jiapeng Chong:
> > Eliminate the follow smatch warning:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:622
> > dmub_srv_cmd_execute() warn: inconsistent indenting.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/=
gpu/drm/amd/display/dmub/src/dmub_srv.c
> > index 56a0332..e9fadf1 100644
> > --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> > +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> > @@ -618,8 +618,8 @@ enum dmub_status dmub_srv_cmd_execute(struct dmub_s=
rv *dmub)
> >        * read back stale, fully invalid or partially invalid data.
> >        */
> >       dmub_rb_flush_pending(&dmub->inbox1_rb);
> > +     dmub->hw_funcs.set_inbox1_wptr(dmub, dmub->inbox1_rb.wrpt);
> >
> > -             dmub->hw_funcs.set_inbox1_wptr(dmub, dmub->inbox1_rb.wrpt=
);
> >       return DMUB_STATUS_OK;
> >   }
> >
>
