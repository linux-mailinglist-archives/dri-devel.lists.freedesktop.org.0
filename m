Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433F9C78E5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 17:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32173882AF;
	Wed, 13 Nov 2024 16:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YSDnvEwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666D010E739
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 16:29:50 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so86022621fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731515388; x=1732120188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hfqt1W/nidKagUh65+dskZ0HFRd7l9QPJ+8QdYuAArY=;
 b=YSDnvEwdQ0H9jXsTGMnm/HmkujlMx/35D0DMyqwzKBKk6zEJrY2jvruymtFfW+osBU
 wVTcgiSNEXkKU32XoIobJQXFOiNyesv+AXGkdXjIQ2fpmXAKJ3Op30PRDRWI8348ifIy
 cgpjJMxW2bAfkm2HHvvGpzh4BuLIDJQiag0usDuhlKBgDRveCLHoyErF8WXHvWrnXsq8
 bfBTKE4ZeWRaDajwBlE7gT+HOXb8Oyi2vtD5RxP3SdzAzE/tZiipZwYdFJikQHrADy69
 UqR4dsztR3I75Of/9H1PkxcGo+m1txT9hLdPCwsE3L/b0Y7ZBKpPQRSy0AVQ1lS5dGKt
 o1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731515388; x=1732120188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hfqt1W/nidKagUh65+dskZ0HFRd7l9QPJ+8QdYuAArY=;
 b=NAsvlmxxppMk0XCTi2gbWm4AMkSG+97oKo/yzXf27KU42qgwwafx3XMNkc2AdJLe5I
 K/RcNNcunMEL0/Bfd9VR1BXHhyCU2RtFDo62obMU4z7Eq0+eQqYJKs2FP1GP05syYl1I
 qm4XnkyLSAIhubkBsyzChTYs6GzTa+bxHa5gPAH9/bsRyREzcdlW4H83WC5gQD3W8ciQ
 f893QOIAcBP+6CYIpo60HSOuSkiDmcrUA+ncRVhlY2BPSWX0ULD4/hE4xiI55efUO/EY
 QrmWL7J4Aowy0KDkvUIYQbYom0mPt3/jzzvbV6YdeVo2CU2D/nxP1PLJ8Dc6sCPYNEO4
 btuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQmBW9KOAVnWa8vNX4hWX4vcNOMVCmup9MINF8Yym1XwwPO6ZWhved34pyHRbO9X/al1k8+bdIhDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxkXCP4NW2L3XigkU99h4gTsUckTYT2IlLEU258/UZgEuYJe0Q
 mOgij3eRfTcQwePN6uTH0Yvqvr4+W/Fbgm5GewxUID7wsbQpRcuwyg0m5qJedC/Z5yavsihp/rJ
 LW+z43xUYgGOgzaQf2vEq85/1mg0=
X-Google-Smtp-Source: AGHT+IG0K63G7clYWGyf+2qx8AAKKzktSdOglK6Euy7htYO5/bcDg5LOcacKllOU0lEbf8JHVeAw7kWTy2AHh5ewo9o=
X-Received: by 2002:a2e:9a0a:0:b0:2fb:5bd:8ff2 with SMTP id
 38308e7fff4ca-2ff201ba9d3mr157532151fa.16.1731515387988; Wed, 13 Nov 2024
 08:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
 <20241027075108.14273-2-vamsikrishna.brahmajosyula@gmail.com>
 <87cyjkpcik.fsf@intel.com> <Zx-h-qCeU0e9B-eK@intel.com>
In-Reply-To: <Zx-h-qCeU0e9B-eK@intel.com>
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date: Wed, 13 Nov 2024 21:59:36 +0530
Message-ID: <CAJvTgAj=fe4-JuBRUEHuw9jUm-SRvuxsfuSpkBfRpdU2i+rXmw@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/edid: convert drm_parse_hdmi_vsdb_video to use
 struct cea_db *
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 "Syrjala, Ville" <ville.syrjala@intel.com>, skhan@linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the feedback.

On Mon, Oct 28, 2024 at 8:09=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Mon, Oct 28, 2024 at 03:45:07PM +0200, Jani Nikula wrote:
> > On Sun, 27 Oct 2024, Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajo=
syula@gmail.com> wrote:
> > > @@ -6320,19 +6321,20 @@ static void drm_parse_hdmi_deep_color_info(st=
ruct drm_connector *connector,
> > >
> > >  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
> > >  static void
> > > -drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 =
*db)
> > > +drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const str=
uct cea_db *db)
> > >  {
> > >     struct drm_display_info *info =3D &connector->display_info;
> > >     u8 len =3D cea_db_payload_len(db);
> > > +   const u8 *data =3D cea_db_data(db);
> > >
> > >     info->is_hdmi =3D true;
> > >
> > > -   info->source_physical_address =3D (db[4] << 8) | db[5];
> > > +   info->source_physical_address =3D (data[3] << 8) | data[4];
> > >
> > >     if (len >=3D 6)
> > > -           info->dvi_dual =3D db[6] & 1;
> > > +           info->dvi_dual =3D data[5] & 1;
> >
> > Just commenting on one hunk, because it's a good example of the whole
> > series I think.
> >
> > The above is nice, because it improves the offset vs. length
> > comparisons. Many of the old checks like above look like off-by-ones,
> > when indexing from the beginning of the data block, not from the
> > beginning of payload, and cea_db_payload_len() excludes the first byte.
> >
> > The main problem is that the specs are written with indexing from the
> > beginning of the data block. For example, HDMI 1.4 table 8-16 defining
> > the HDMI VSDB says source physical address is at byte offsets 4 and 5,
> > and dvi dual flag at byte offset 6. That will no longer be the case in
> > code. It gets tricky to review when you have to keep adjusting the
> > offsets in your head. (I don't remember if there are specs that specify
> > the offsets starting from the "actual" payload after all the meta stuff
> > has been removed.)
>
> IIRC there was some off-by-one indexing difference between
> some of the specs. But I don't remember which ones use what.
>
> >
> > Now, if we accept having to do that mental acrobatics, why stop there?
> > You also have extended tags (first payload byte is the tag), as well as
> > vendor tags (first three payload bytes are the OUI). It begs the
> > question whether there should be higher level data and length helpers
> > that identify and remove the tags (including extended tags and OUI
> > stuff). For example, the actual data for HDMI VSDB starts at payload
> > offset 3, as the first three bytes are the HDMI OUI.
> >
> > What to do? Ville, thoughts?
>
> So just different *_{data,len}() for the different indexing variants
> (as defined by the relevant spec)? That seems like a reasonable
> apporach as then the len vs. index checks might actually make sense.
>
Please let me know if the below snippet matches the feedback.

const u8 *vsdb_data =3D cea_db_to_vsdb_data(db); // skips indexes for HDMI =
OUI
...
info->source_physical_address =3D (vsdb_data[0] << 8) | vsdb_data[1];
...
info->dvi_dual =3D vsdb_data[2] & 1;
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel

Thanks,
Vamsi
