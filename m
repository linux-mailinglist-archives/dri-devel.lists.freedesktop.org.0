Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D89454F73
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 22:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FDA6E5BF;
	Wed, 17 Nov 2021 21:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0096E546;
 Wed, 17 Nov 2021 21:37:17 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id m6so9445387oim.2;
 Wed, 17 Nov 2021 13:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6s2y1fTtS8lf6NP+/c4Jj61w5cSCKIlT27IH4NZh8QY=;
 b=IzY64stNZSLG1jDnQarZT7E46remPFZ029D4S/vqqHEmD8VdCjr14Z3AcNv2AxIn3/
 UERbzYUIueJ9g5p26p7z0J3l+NTHYiB5wqouskDkVQwIiK5CmEbFy52Z03/rSc2qNf5K
 A94sZTzv9jrfUD7eoRjbvyInwpfHa6D7BngkfpgHy1JLKEVSgdKTFmVMaBUgEjUQHVB1
 Mcm04hz14NnzO0qzLtGwBbhU8lm9QS+OB5Liz6wnjs9mrtbpNmjmiZGJoqWQ9xO5FrPy
 hhokYy/HmWtCnnp/5TbMPAu/rnpucLtLbRC7flysMbBdBbpsATf1RHMgS1Ja7QGU4x4d
 vVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6s2y1fTtS8lf6NP+/c4Jj61w5cSCKIlT27IH4NZh8QY=;
 b=P2x0HVa+uHzCjdbhqg8C0Nek6ptJzNgwFSBjhwrIfwrY8NDZi7g2MHCm2bDLdkBTWB
 1dUEQjJwayhJvxk+A2XgxGuqJzwj1b1dTz5mqgqHsCjTU5qOJ2w9dbQAH9LXm6Iu6ueo
 Le+wd0gjDOfrJBebBInWlcNMIlrxRVui8rIIjfap5aKB1WJMf7AiJmfWZAgiuqdft81i
 D5GQWZ30stFQPUyZOqK0zJi6PCdFW1x9ynrJnHe9GdJ9kWrGbBVk4djXcdC/FFp/Yk7+
 vPqHusDq19FAkt+Cq9MLjapyLvwkOE0kyIcro2XegNAMjB+ydgpDqLHcLTUJHyUsjued
 gA6A==
X-Gm-Message-State: AOAM532zKdVJRXTujldO/8ZVdBqU+7HDG+0tsn+d29p0YJQq4JRxNjM1
 GTMsP+pueHZWSPhX7+jXXiMIvOWNnH7tG8CSt2Y=
X-Google-Smtp-Source: ABdhPJxRBhq8/gv8eMPKGOit+nrmHWfUJX84g36vbajBhRrGeBC4A7eR2tqOn3eN842fWjlV1756/kPkDXA0fJuG49E=
X-Received: by 2002:a05:6808:44:: with SMTP id
 v4mr2874414oic.123.1637185036704; 
 Wed, 17 Nov 2021 13:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20211116013438.26517-1-bernard@vivo.com>
 <88328288-ef1f-ef8b-987f-43dc8dc69ee7@gmail.com>
In-Reply-To: <88328288-ef1f-ef8b-987f-43dc8dc69ee7@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:37:05 -0500
Message-ID: <CADnq5_O+A8WaZv_+avrmvzt9Jjr7vwkYqnZx7-wkNtzRx0pc9A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: cleanup the code a bit
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
Cc: Leo Li <sunpeng.li@amd.com>, Bernard Zhao <bernard@vivo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Nov 16, 2021 at 4:19 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 16.11.21 um 02:34 schrieb Bernard Zhao:
> > In function dc_sink_destruct, kfree will check pointer, no need
> > to check again.
> > This change is to cleanup the code a bit.
> >
> > Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> This one and the other patch are Acked-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_sink.c | 10 +---------
> >   1 file changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gp=
u/drm/amd/display/dc/core/dc_sink.c
> > index a249a0e5edd0..4b5e4d8e7735 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> > @@ -33,14 +33,6 @@
> >    * Private functions
> >    ********************************************************************=
**********/
> >
> > -static void dc_sink_destruct(struct dc_sink *sink)
> > -{
> > -     if (sink->dc_container_id) {
> > -             kfree(sink->dc_container_id);
> > -             sink->dc_container_id =3D NULL;
> > -     }
> > -}
> > -
> >   static bool dc_sink_construct(struct dc_sink *sink, const struct dc_s=
ink_init_data *init_params)
> >   {
> >
> > @@ -75,7 +67,7 @@ void dc_sink_retain(struct dc_sink *sink)
> >   static void dc_sink_free(struct kref *kref)
> >   {
> >       struct dc_sink *sink =3D container_of(kref, struct dc_sink, refco=
unt);
> > -     dc_sink_destruct(sink);
> > +     kfree(sink->dc_container_id);
> >       kfree(sink);
> >   }
> >
>
