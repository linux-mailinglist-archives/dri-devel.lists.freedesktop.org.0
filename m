Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFF39E520
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745A66E95E;
	Mon,  7 Jun 2021 17:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007D36E95E;
 Mon,  7 Jun 2021 17:18:39 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id z3so18808108oib.5;
 Mon, 07 Jun 2021 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bs0iIp2b+xLwRPkKeIWpOD/7m4nhQ2yrv+tV+dY2+Dk=;
 b=ZfJqjDRtbPhKwBfzpuNEpxC+DixbiXqh1fDLnKXYnFPI9Qlf1ttw6aMTd691KAb0Nw
 ap3EFjQ+F1P/azkjwjFcJeplW20c8Wy6rjIAmiBeQoqKJH06tOpZ1ZxK8mXwXNZmU4Mx
 z1Zyl6+qqWUh4SVUR92ud5048RIyYmOg+5JJNAI8yoCx9nbMxHazeBm79+GM1fF22BzC
 LSNRJ7TCk9ni35039MOrYp56Cn62e7XcsMy2W6AAr53IWdOXTJY2MN+62tsZ0I+Aeu6R
 He586b00SYq/ywaPZ6ehXU4jLQGpDiMhI0UNYVyK9P/mkSM36+TBm2C58avFcUFUoNH7
 iQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bs0iIp2b+xLwRPkKeIWpOD/7m4nhQ2yrv+tV+dY2+Dk=;
 b=r3hYAcUVCqcpVfUGebT2XfVehWxNqt1cGul5UqWfefrPT4BEYGgUa1wrg7f0K0Yu8G
 LNcqbrJUu5OZwA0lANr2wQ8GIVRdFL+1dX412ZQc7hqJa3pRM3VqUIiv4NH7UHWLw0qm
 LXigxvgzEn7iufZos/DHuzbjTrEqrWcVkOm1odVOkmClmyIGAAtoMlzqFeO3wOpF9twc
 SptQPLh/4WCMuYhn1T1VIt12wYOtVRaPzD5SmyQb3b2/gS0MQaD5hfOrRGR62zHxAzs5
 dZDIezlMVwrFSICNUdzxCBmARLQLe3khW9+9kZ8qHkVxviXmuqnW4ZcJXcdyoJ6LqzZy
 z7vg==
X-Gm-Message-State: AOAM5319nuCNjcnHRHOhtOORWldoEI0iCgsN0MnYSXYlvSW6IYE/UH5N
 adKVpU7K2S3jQ9fPwI/Z1rAYU4y67ZSi2kU9rdg=
X-Google-Smtp-Source: ABdhPJyirKNeUEEtw5y9m++p4gcGiiOq1LOMwU9dlkkw7YMYbr+3rPlg1bL7kJG8ZiRpSn4RBR+dXRzlWAbHbNNqDsM=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr196398oie.120.1623086319382; 
 Mon, 07 Jun 2021 10:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <ea7ecbef546a03ef71d65bfe82608bb347e6f3c2.1622883895.git.christophe.jaillet@wanadoo.fr>
 <99a5eba3-2d2a-65a8-9b03-a3d4043c5ec5@gmail.com>
In-Reply-To: <99a5eba3-2d2a-65a8-9b03-a3d4043c5ec5@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Jun 2021 13:18:28 -0400
Message-ID: <CADnq5_PSw_zLDpdpAgxbUKLH54toLyxL23Ytw0q8G+xBzcaeRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a a typo in a comment
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jun 7, 2021 at 6:46 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 05.06.21 um 11:06 schrieb Christophe JAILLET:
> > s/than/then/
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index 89ebbf363e27..1476236f5c7c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -662,7 +662,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pa=
rser *p)
> >    * @error:  error number
> >    * @backoff:        indicator to backoff the reservation
> >    *
> > - * If error is set than unvalidate buffer, otherwise just free memory
> > + * If error is set then unvalidate buffer, otherwise just free memory
> >    * used by parsing context.
> >    **/
> >   static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, in=
t error,
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
