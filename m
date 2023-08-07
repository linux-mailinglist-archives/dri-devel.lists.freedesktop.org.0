Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433C772B4D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD8010E2EA;
	Mon,  7 Aug 2023 16:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4C010E2E8;
 Mon,  7 Aug 2023 16:41:59 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bf0c4489feso3293231fac.0; 
 Mon, 07 Aug 2023 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426518; x=1692031318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFf6/4I+/bBlEwSARy/+YTAUPS77qELMgK5GKsW+qM4=;
 b=obYYyvj3+agyRqvKqDFokL3B2XRKHkuEG/+5mQPRAPHxemanlZahUhyjlJbLo6L69s
 Ee9g8aR0LJPS21XRFY8zSa+ESbt0q/gBmu56cEDSnbgo3TSxqG0cSrIJrbGZn/BwfbT6
 NWwwoOQQAuCaYOqbF6nTuyUV3KI50bvL1oGRU+D5xlKPXLACRaD+t0W4nDWrRlkuo3FV
 XmlRIGf4VeIlVYum1zqqYVHJeCgpMEd7yh7x2O4BUy0vWxqx7uQsJG/PW50DDm6xdF/s
 NOSgXRh2KgXJ5o5ZTI3yXCuqYMxO2vJLRwdfD3FRrOBEDe+MiNcmOw9tJJl8csJkcmsl
 0Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426518; x=1692031318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFf6/4I+/bBlEwSARy/+YTAUPS77qELMgK5GKsW+qM4=;
 b=VamK7q6KzKhC5b5CAteb9mLcy2u/ybFcJWgT+oUA9/u1BmBLf6/i9BYKUDNVgnU7ZZ
 Jsi3EHon0xWA9c7oit4ZvYXZzBt9AzhXNKnMk+bXV/Q7MuwvF+TaDxCTqHrhsApthUwt
 XHWQHpnOyEt40thQ9bx1cHks2bQKCRyatUqRNsmRtXCUKGRciDxwb9i7CVT3YbYai6zZ
 /CG8+AOc1Ym5eM9IC5tu1Y+m8HcMS/UVbRkO9hQD5Kq74h1rORt4IWYniI9Pq372DEjQ
 co4RR8btS75sJVhp3DAQrHydf1p3EXlWYGRgVjfJSilMQkrEtaRkRKdscx5YREbI5s8g
 DEfQ==
X-Gm-Message-State: AOJu0YzjSxOZDIP3Nwf14fIZJUqqEDjfJLr9L0Wg2Lb+n2/TP/LGX/YP
 s95XvPb80VSpYdNtlZ9Q3aBBES+KY4heqnAfwVw=
X-Google-Smtp-Source: AGHT+IEFq3RD5atcVKPg/ax1n0Rg2FEB0tR36eeDThJdnA8hchvwUJr/dSVJwoe11m3iVs63cy/hOj1dKYgqnE9fjl8=
X-Received: by 2002:a05:6870:c18d:b0:1be:d49b:a3c5 with SMTP id
 h13-20020a056870c18d00b001bed49ba3c5mr11828163oad.29.1691426513821; Mon, 07
 Aug 2023 09:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230801023915.4756-1-sunran001@208suo.com>
 <DM6PR12MB261918C00FCDF3E4BBBC1C57E40AA@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB261918C00FCDF3E4BBBC1C57E40AA@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:41:43 -0400
Message-ID: <CADnq5_NkbVgAuz3dNA0OLna9FKJqYwikMpHksdaGAQPep+q1RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega20_hwmgr.h
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: Ran Sun <sunran001@208suo.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:25=E2=80=AFAM Quan, Evan <Evan.Quan@amd.com> wrote=
:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ran
> > Sun
> > Sent: Tuesday, August 1, 2023 10:39 AM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; airlied@gmail.com;
> > daniel@ffwll.ch
> > Cc: Ran Sun <sunran001@208suo.com>; dri-devel@lists.freedesktop.org;
> > amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] drm/amd/pm: Clean up errors in vega20_hwmgr.h
> >
> > Fix the following errors reported by checkpatch:
> >
> > ERROR: open brace '{' following enum go on the same line
> >
> > Signed-off-by: Ran Sun <sunran001@208suo.com>
> > ---
> >  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> > b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> > index 075c0094da9c..1ba9b5fe2a5d 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> > @@ -385,8 +385,7 @@ struct vega20_odn_data {
> >       struct vega20_odn_temp_table    odn_temp_table;
> >  };
> >
> > -enum OD8_FEATURE_ID
> > -{
> > +enum OD8_FEATURE_ID {
> >       OD8_GFXCLK_LIMITS               =3D 1 << 0,
> >       OD8_GFXCLK_CURVE                =3D 1 << 1,
> >       OD8_UCLK_MAX                    =3D 1 << 2,
> > @@ -399,8 +398,7 @@ enum OD8_FEATURE_ID
> >       OD8_FAN_ZERO_RPM_CONTROL        =3D 1 << 9
> >  };
> >
> > -enum OD8_SETTING_ID
> > -{
> > +enum OD8_SETTING_ID {
> >       OD8_SETTING_GFXCLK_FMIN =3D 0,
> >       OD8_SETTING_GFXCLK_FMAX,
> >       OD8_SETTING_GFXCLK_FREQ1,
> > --
> > 2.17.1
>
