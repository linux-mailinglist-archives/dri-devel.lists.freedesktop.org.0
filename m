Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521478143C9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 09:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E40510E340;
	Fri, 15 Dec 2023 08:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A51310E31C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:54:36 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6da3659535fso334421a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 21:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702619675; x=1703224475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCJOW0HTWFqTjpEhxTj1el+zslba+C9AgKBFgvSSX8M=;
 b=XaJot3Kei6rQ5MMYk0R+gCvdlmhWTBDekXmWF0GntzVjBJZrkQlCJn/C0B8J35bXod
 m4EOjsfwCZ+3RkA71aYk+BhTSiz52g31nywX7DAQcrJ/NKtduJwHtnu0/iIR7UMS6rkV
 elENKjWPd9Ho5SscrvhrbBWvTZQnVTWv/g/+0tYuDRZttPQ7Dg1owgPEfNIUP9o62FfA
 wEzS/2tRCFjoihXC46jwsQOySY+NTOVXoZiKxHVS0ngfzW/SrP8lFoFsMwgBaA4x00PQ
 dE1xT76c7VygcycFCq2Zy6tKkhaIBYCiS3MEhPItLzfAfF29D7/Kom56g0RATqlRVeyX
 qzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702619675; x=1703224475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCJOW0HTWFqTjpEhxTj1el+zslba+C9AgKBFgvSSX8M=;
 b=xP6cC19JI6DuhdmcOrylzZ5IU+3z9hxJdUxvSD4aaRbjTI3IqXrASnB/FhwTuqNjH6
 piXnwjud4XTbri1sxiG14PN7hxkqxCpA7UXWgXdCNVoLH+vUC2gpYfeZPSrMQypTzIy/
 69Hs9GQymliednCLamc3ZI+1vDDJKgLxUC585Atc+L81EGPkd/wW3afEkwM8O3FfNgts
 g7eVPsd/0AlIkaYToo/b6wtbQQzUt2K41EuP7erbSn8Ueka1sQn+zhBhotGPl3yKTlok
 TND04v/jTSwAAEMYGMoh8un5HoLh1VVNeHH7M6wbg3ybxMGwRBvfgD/K+ikMPbFWqobS
 JZ1w==
X-Gm-Message-State: AOJu0YwAO2SA47TrIOO1eSlnCGPQklzq8mdlmAhAKu5HcskUbZUHgX1s
 rmzynXoazYUZXjV0J11N2J1+fVPKoNEtxdr7Tb4=
X-Google-Smtp-Source: AGHT+IFSHbIbrncQrnBc79uTTFBIB1KX1UP5iOvBoXKujoMLbJ+yAfaSq9uVSeyXU4SFuEsOkGxbg5LqUQlxNV+crJ4=
X-Received: by 2002:a05:6808:1250:b0:3b8:b063:9b6f with SMTP id
 o16-20020a056808125000b003b8b0639b6fmr12501939oiv.97.1702619674806; Thu, 14
 Dec 2023 21:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20231215053016.552019-1-ghanshyam1898@gmail.com>
 <346d12b2-a78e-4372-880a-e522fdca7169@infradead.org>
In-Reply-To: <346d12b2-a78e-4372-880a-e522fdca7169@infradead.org>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Fri, 15 Dec 2023 11:23:58 +0530
Message-ID: <CAG-Bmod7tsFzh=5vzHCy6CUy5FFBGfg19NYmbVUsvniC4hGiaQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: vmwgfx: fixed typos
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 15 Dec 2023 08:39:42 +0000
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 11:05=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 12/14/23 21:30, Ghanshyam Agrawal wrote:
> > Fixed some typos in vmwgfx_execbuf.c
> >
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/=
vmwgfx/vmwgfx_execbuf.c
> > index 36987ef3fc30..272141b6164c 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> > @@ -621,10 +621,10 @@ static int vmw_resources_reserve(struct vmw_sw_co=
ntext *sw_context)
> >   * @sw_context: Pointer to the software context.
> >   * @res_type: Resource type.
> >   * @dirty: Whether to change dirty status.
> > - * @converter: User-space visisble type specific information.
> > + * @converter: User-space visible type specific information.
>
> ack.
>
> >   * @id_loc: Pointer to the location in the command buffer currently be=
ing parsed
> >   * from where the user-space resource id handle is located.
> > - * @p_res: Pointer to pointer to resource validalidation node. Populat=
ed on
> > + * @p_res: Pointer to pointer to resource validation node. Populated o=
n
> >   * exit.
>
> ack.
>
> >   */
> >  static int
>
> Please also fix this one:
> vmwgfx_execbuf.c:1072: asynchronus =3D=3D> asynchronous
>
> I suggest that you try codespell.
>
> Thanks.
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html

Hi Randy,

Thanks for your acknowledgements and feedback. Codespell did suggest one
more change but I am not sure if it should be applied. Let me ask someone.
I will make changes and resend the second patch.

Thanks & Regards,
Ghanshyam Agrawal
