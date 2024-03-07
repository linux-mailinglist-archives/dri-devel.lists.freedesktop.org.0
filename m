Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6687451A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 01:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094C113609;
	Thu,  7 Mar 2024 00:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dDi8QM2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CB4113609
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 00:20:34 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6e4f1660493so192038a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 16:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709770834; x=1710375634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gKocubseZGXNLUpd/fuBD9DCeE26SidITG4A2LjDvY=;
 b=dDi8QM2rJck1tnUi3/92YmB3m/8YIuvcbn6ebX5LdSKvsHehIay9oN6QqEaFPz/qq2
 DcVuanE8ux1A2iqPoEXdSUewAITYY/piKv/ZWk8ONtfounf5AIt6hEkfjE61Gp16Mih7
 fRkzM8ke2IOcbQdHb028O8cLyP1E1X2Uw5JJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709770834; x=1710375634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gKocubseZGXNLUpd/fuBD9DCeE26SidITG4A2LjDvY=;
 b=cKCGzMjoxpMpcsc1GbzDJ0FM97wqCG8nxPoZt595xz/Gv6qMimdWHYbOKZCmVia61W
 9ByUWUb8XSpVPyXcNwzbhkm/j9hxuaZdW6kraMTgHXByyxxXQRFzOFYFIwbmmcs1BO1M
 EMiU6WEEdKDkJw4IsNXwXS5xczq/kHLMybR+p4PKbjP0t/cl2JjLYkvEfJXqVdcMz+EQ
 kbrYxJBN5dRiwUwKSd6a3lFz+JxvrhyD07j3KSssutdsq5xAgqph9vFJaN057gOJrDi4
 wzrCz7wyCvDy1uu0hR/+UATHnZwJDLnghHKfAmm8CcT6mPbp+aBLCFV+5kpdq2GInfTF
 q1tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDMmNKItlZor0x5OtI8+lz6fNYEDAaiCRrrfLsZx4icSV9JrZk8wmAuU+y7XhiDUggJMVzy+9Itg/dUN+5AhzAQVncgmBRBScWeLm7LUCh
X-Gm-Message-State: AOJu0YzOObJHIS8mumvaeLiemCoJYi3FOBJIMrJqDnlaAxzJT8W4Ycsv
 f8kzQCFIpJ/jPGdcx+r1BJcmpR81GxJFELLaLkK3pj+ffygdiUT2v/Zn3/rJ7sHe21IlHMH3FR+
 7OLz912FvhnX0Wlcmm+UZiaOnOwtyFSoNqgbT
X-Google-Smtp-Source: AGHT+IEtHB+kPDonI5+YXi6phytTz0mQ8M6d6xl7sVU+dvIAdH7vTdbZeVC/9dkBONN5lN0edTkf6SiICAK4HTDXcJM=
X-Received: by 2002:a05:6830:920:b0:6e4:e63e:f5ab with SMTP id
 v32-20020a056830092000b006e4e63ef5abmr8407257ott.17.1709770833789; Wed, 06
 Mar 2024 16:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-4-hsinyi@chromium.org>
 <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 6 Mar 2024 16:20:08 -0800
Message-ID: <CAJMQK-i=0COuMGW+PGv3zT4+JgwJc_Qj9oQHva6EQys_n3xoHA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/edid: Add a function to match EDID with
 identity
To: Doug Anderson <dianders@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Wed, Mar 6, 2024 at 3:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> >
> > +static void
> > +match_identity(const struct detailed_timing *timing, void *data)
> > +{
> > +       struct drm_edid_match_closure *closure =3D data;
> > +       unsigned int i;
> > +       const char *name =3D closure->ident->name;
> > +       unsigned int name_len =3D strlen(name);
> > +       const char *desc =3D timing->data.other_data.data.str.str;
> > +       unsigned int desc_len =3D ARRAY_SIZE(timing->data.other_data.da=
ta.str.str);
> > +
> > +       if (name_len > desc_len ||
> > +           !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME) |=
|
> > +             is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRING)=
))
> > +               return;
> > +
> > +       if (strncmp(name, desc, name_len))
> > +               return;
> > +
> > +       /* Allow trailing white spaces and \0. */
> > +       for (i =3D name_len; i < desc_len; i++) {
> > +               if (desc[i] =3D=3D '\n')
> > +                       break;
> > +               if (!isspace(desc[i]) && !desc[i])
> > +                       return;
> > +       }
>
> If my code analysis is correct, I think you'll reject the case where:
>
> name =3D "foo"
> desc[13] =3D "foo \0zzzzzzzz"
>
> ...but you'll accept these cases:
>
> desc[13] =3D "foo \nzzzzzzzz"
> desc[13] =3D "foo \0\0\0\0\0\0\0\0\0"
>
> It somehow seems weird to me that a '\n' terminates the string but not a =
'\0'.

I'm also not sure about \0... based on
https://git.linuxtv.org/edid-decode.git/tree/parse-base-block.cpp#n493,
they use \n as terminator. Maybe we should also reject \0 before\n?
Since it's not printable.

>
> I would have done:
>
>       for (i =3D name_len; i < desc_len; i++) {
>               /* Consider \n or \0 to terminate the string */
>               if (desc[i] =3D=3D '\n' || desc[i] =3D=3D '\0')
>                       break;
>               /* OK for spaces at the end, but non-space is a fail */
>               if (!isspace(desc[i]))
>                       return;
>       }
>
>
> > @@ -367,6 +367,12 @@ struct edid {
> >         u8 checksum;
> >  } __attribute__((packed));
> >
> > +/* EDID matching */
> > +struct drm_edid_ident {
> > +       u32 panel_id;
> > +       const char *name;
>
> Might not hurt to have a comment for panel_id saying that it's encoded
> by drm_edid_encode_panel_id() so it's obvious what this random u32 is.
>
>
> -Doug
