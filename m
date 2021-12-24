Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421847EC27
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 07:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D1610E14B;
	Fri, 24 Dec 2021 06:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E20610E14B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 06:33:24 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m21so31261520edc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 22:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XjtGT6YFArsZwODmVNVyG4AWkdbVGlc8Iu9OnFC6dvs=;
 b=HK6utSBWcuubJ7yGxQA/jjmKwUMWcnqVR6M4GlXJefwZyrE91+DQiJfjjZCgj/VDWK
 G4sasEqB+Ky8IhEuxpK3scRBBo16WE9SerUIBrCpszdvuPSPtKHNFTezGpVxfEI5TPoh
 tOWSj1BF1awZ9PBGqgwHJFD4ZoctRjQyjYT6epPC2nva+c3St3L/zXStS82YPTqrpN5N
 uWATjvZZ+/FFFEwJ/QnflYH3NDhFGNqRjSUnUlINrm5L5rc6d73T4UpbewwfoM2nNzuA
 9TdcT5g0oCHfdoz47KzhSkDh2XGytDpuZjJvnq+HXuJPcpjGk6KzQ7sPyu+tm8CjB80S
 JDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XjtGT6YFArsZwODmVNVyG4AWkdbVGlc8Iu9OnFC6dvs=;
 b=a+tBGvhnffepJasDTv5N/uyBl9NBZT+9cMbvO2BEZrBfLO+FWHrv5CRIRZ5oP0DWLo
 sxoryiQGms9l+ZNSRmpcNTBcFdvChgwqo/XmeUPPux2RnqkGpr1ssR363FomRJxjqkLE
 sGJS/DzbXQjseLiv9gsTbFqzsJzDyp1VMce0yaNo2dD350lusazStCJrEckQfNeyy0dV
 oSXtayhGyvMfvBQl2VK5PGjemUHP06IoiLL/FNvceUnrpPmBjlLILJ9VYnzRJ7K7vL7B
 2A9y2B5ZcmzLQ/hlwHgWPtIsAO/47qY0vD40N89vPhVSQUFyQBbLS+kAl1js4FypVYf6
 CQGw==
X-Gm-Message-State: AOAM532OLuYTLjQNOrIstFAgnLBNhtEpR9kAKhM2R1xMkJG5qAGDi1oV
 zXtMwNFsIIcLnavYruAO0aw=
X-Google-Smtp-Source: ABdhPJz+p/eqkXTn0u7lNvMk2XnS83JcPSgiiGMwgCJhri0KULMlAh1P7FA9OxZiD9f7pDpl9FmG4Q==
X-Received: by 2002:a05:6402:50c8:: with SMTP id
 h8mr2191169edb.210.1640327602840; 
 Thu, 23 Dec 2021 22:33:22 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id ec4sm2680319edb.79.2021.12.23.22.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 22:33:22 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: Re: Empty IN_FORMATS in sun4i-drm
Date: Fri, 24 Dec 2021 07:33:21 +0100
Message-ID: <3149565.44csPzL39Z@kista>
In-Reply-To: <20211223095923.pes7tag5uqsoidy5@luna>
References: <20211214120248.y2zdzr5zsqowixjx@luna> <2084377.irdbgypaU6@kista>
 <20211223095923.pes7tag5uqsoidy5@luna>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne =C4=8Detrtek, 23. december 2021 ob 10:59:23 CET je Emmanuel Gil Peyrot=
=20
napisal(a):
> On Tue, Dec 14, 2021 at 06:58:56PM +0100, Jernej =C5=A0krabec wrote:
> > Dne torek, 14. december 2021 ob 13:02:48 CET je Emmanuel Gil Peyrot=20
> > napisal(a):
> > > Hi,
> > >=20
> > > After updating Weston from 9f8561e9 to 07326040 (latest master), it
> > > fails to run on my PinePhone saying =E2=80=9Cformat 0x34325258 not su=
pported by
> > > output DSI-1=E2=80=9D and then exiting.
> > >=20
> > > This format is XR24, which would be extremely surprising not to be
> > > present, and drm_info[1] says it is present.  Looking into Weston=E2=
=80=99s
> > > code, I found that drm_plane_populate_formats()=E2=80=99s docstring s=
ays it uses
> > > =E2=80=9Ceither the IN_FORMATS blob property (if available), or the p=
lane's
> > > format list if not.=E2=80=9D  Looking back at drm_info, I saw said IN=
_FORMATS
> > > blob being empty of formats (while the format list is fully populated=
):
> > > "IN_FORMATS" (immutable): blob =3D 32
> > > =E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_FORMAT_MOD_LINEAR (0x0)
> >=20
> > Does this solve your issue? http://ix.io/3Ipo
>=20
> Hi, yes it does, thanks!
>=20
> Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

Thanks, but this issue is already in process of being fixed with a more gen=
eral=20
approach (this driver is not the only one with this type of issue).

Please look and comment at:
https://patchwork.kernel.org/project/dri-devel/cover/20211222090552.25972-1=
=2Djose.exposito89@gmail.com/

Best regards,
Jernej

>=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > >=20
> > > This makes me think the kernel should populate IN_FORMATS with at lea=
st
> > > the same formats as the format list when supported, or stop advertisi=
ng
> > > this property altogether.
> > >=20
> > > Other compositors (such as phoc) still run file, probably because they
> > > use the format list exclusively, without consideration for modifiers.
> > >=20
> > > Besides fixing this driver, would it make sense to also make Weston
> > > ignore an empty IN_FORMATS and fall back to the format list?
> > >=20
> > > Thanks,
> > >=20
> > > [1] https://github.com/ascent12/drm_info
> > >=20
> > > --=20
> > > Emmanuel Gil Peyrot
> > >=20
> >=20
>=20
> --=20
> Emmanuel Gil Peyrot
>=20


