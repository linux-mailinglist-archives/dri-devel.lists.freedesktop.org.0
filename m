Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671F753DA5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0A10E8B6;
	Fri, 14 Jul 2023 14:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6404210E8B5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:37:55 +0000 (UTC)
Date: Fri, 14 Jul 2023 14:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689345473; x=1689604673;
 bh=7LFNHr0E6MIF2cvyVq2X8QW4ZJsjMnat0OdnacGW5hY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=PqWTAG7642HqUPyUIp2jIs1TEvDd4dj4hNBifUEqB9n4MZ2cQ61JsZ05lbudqSzO1
 uXaO9fQk6wm95LaibC70ytRT6iiLbrkToZgM9U6Ux6GHiWYeNiJdA8ltYjTZnZtInE
 RC+ROjdwwThSJ0hBQNQv1K+WZDPRS14qs7UZ+TTLWn4wYNp6pGBfsx0qYKpw2HCHSW
 /HriK0SsImsSlUYHR9qnNOPjB48mje4SOP+D0fFkYOsD7dKDURr42cBB7rN9TQBKbm
 0993PKfLBrRMp9Cr1j7+IJ5tg8usDxkbUjqjtU9bnCF2bMdrdnoqfsp9/6d4UyLRRB
 6VPZOwMzvl3dw==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 3/3] drm/file: drop DRM_MINOR_CONTROL
Message-ID: <HwBhGvmlMRmImPdvQecgkegO5PCzZuM3XQW1_xK3MrJQk8ZKVaohV09sZBNbXrxmSf3o-8WN0Wf_Xqchr6h2rumOkp8lU_VjGTOha_6JBrI=@emersion.fr>
In-Reply-To: <ae92e39e-4087-ba36-2708-31dede0274e1@suse.de>
References: <20230714104557.518457-1-contact@emersion.fr>
 <20230714104557.518457-3-contact@emersion.fr>
 <ae92e39e-4087-ba36-2708-31dede0274e1@suse.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, July 14th, 2023 at 16:28, Thomas Zimmermann <tzimmermann@suse.de=
> wrote:

> Hi Simon
>=20
> Am 14.07.23 um 12:46 schrieb Simon Ser:
> > This entry should never be used by the kernel. Record the historical
> > context in a comment.
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: James Zhu <James.Zhu@amd.com>
> > Cc: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >   include/drm/drm_file.h | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 010239392adf..a23cc2f6163f 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -53,12 +53,14 @@ struct file;
> >   /* Note that the values of this enum are ABI (it determines
> >    * /dev/dri/renderD* numbers).
> >    *
> > + * There used to be a DRM_MINOR_CONTROL =3D 1 entry, but such nodes we=
re never
> > + * exposed. Still, some user-space has logic to handle them.
> > + *
> >    * Setting DRM_MINOR_ACCEL to 32 gives enough space for more drm mino=
rs to
> >    * be implemented before we hit any future
> >    */
> >   enum drm_minor_type {
> >   =09DRM_MINOR_PRIMARY =3D 0,
> > -=09DRM_MINOR_CONTROL =3D 1,
>=20
> Maybe rather leave this line in and comment it with "// obsolete".=20
> Otherwise someone might accidentally use 1 for something.

Yeah... That's why I added the comment. But maybe better to leave the entry
indeed, even if we risk someone accidentally using it.

> In any case
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> for the whole series.

Thanks for the review!
