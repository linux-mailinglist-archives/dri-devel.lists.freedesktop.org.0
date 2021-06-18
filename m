Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61E3AD3A6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D9789016;
	Fri, 18 Jun 2021 20:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8B389016;
 Fri, 18 Jun 2021 20:33:37 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so10953246otl.3; 
 Fri, 18 Jun 2021 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0lqhtlNOacqNuU9HVlYS2QY7iZE+rcKx/NRXadqAqMk=;
 b=AuSfHwDEDhrhZndV8N8LFsf/T1gLt0SL4Kr2SNUF3Pc/mezMmFtpzDBDHqrAsZUjOm
 IRy03UanKoPueyLJxxyoLwi+7yWLwc1lE2fQ43tMiNmxgh+UQyYW3eDQZEGvBUoTnFoj
 +W3JlBI2s3t6P+TdabfSmM9EOHIXcrktMpAx6Z8ZPVkBgpCN4pW/H43hJYBKtTXrXlNc
 cU0YcDuTzY89LB2/chwHDZe20OZ1MOmyeksmzE80G7z+nWE7K/jmpMIHeolUcG+xslRh
 OdMkZqqVcKl668REH5zuplzsz+5hxYSztvpMIQWLSN9pjFs59J2hBmTmeE+tjuO2FgUP
 0GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lqhtlNOacqNuU9HVlYS2QY7iZE+rcKx/NRXadqAqMk=;
 b=SWMoLh0Nz64HAbJSGXrnuk69GoD2FBfa+A/ttIPW/9lKx8XuUAg19plqKMp6JkqaAM
 3Kn2FY9en/nwgrLBB03LIxHNZxcbVRxwkD09Goc7oMqvsSkQVLPTUDjBnsMx6sYATiPT
 SHP7TxAAM5uLx9l67JQgeqgSJ4KqM9534+w40bQWZTvumhUtO/4M56cSF0FrMWTNImsz
 5BSogtYoVccW1PnlU3qa98PiuvgBgYyQbmVE67QpX7M4tDwWlUKaJEfzqCEZKWJY9YUB
 eDHy5V0gL8nSUSOzjJ8v2qX54nyt4OGPBvtK5Cc1Ws5fHGFdPJVvjAhLbAcIgK9xxa8V
 R20A==
X-Gm-Message-State: AOAM531qkg4WQV7SiMMrjsvOpMrhhXjM4cjtanp7GzQxSiY20YOj4aoV
 PUg4lzU0R8xJrLXnM/1/9lgWEqGSg3qyC9SYuh4=
X-Google-Smtp-Source: ABdhPJyjQScV8NzchfGaMSY3StM8W4pyefE41t+e7LgjnMwAVnpBNSxJU4R9UsEIdEPTSE9noHheT+zInrDw6nypnQE=
X-Received: by 2002:a05:6830:33ef:: with SMTP id
 i15mr11028481otu.311.1624048416499; 
 Fri, 18 Jun 2021 13:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210617023109.204591-1-pulehui@huawei.com>
 <fa86062f-cb45-245b-1bf0-494ffcd33908@amd.com>
In-Reply-To: <fa86062f-cb45-245b-1bf0-494ffcd33908@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 16:33:25 -0400
Message-ID: <CADnq5_OOQqWf9yTcSwN=U8+1VbyfD-f_RfhQ+Gura_BJkspZmg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Fix gcc unused variable warning
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: jinlong zhang <jinlong.zhang@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 zhangjinhao2@huawei.com, Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Pu Lehui <pulehui@huawei.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Martin Tsai <martin.tsai@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jimmy.Kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 17, 2021 at 2:43 PM Harry Wentland <harry.wentland@amd.com> wro=
te:
>
> On 2021-06-16 10:31 p.m., Pu Lehui wrote:
> > GCC reports the following warning with W=3D1:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3635:17:
> > warning:
> >  variable =E2=80=98status=E2=80=99 set but not used [-Wunused-but-set-v=
ariable]
> >   3635 |  enum dc_status status =3D DC_ERROR_UNEXPECTED;
> >        |                 ^~~~~~
> >
> > The variable should be used for error check, let's fix it.
> >
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers=
/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index fcb635c85330..cf29265870c8 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -3681,6 +3681,10 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
> >                               DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STR=
UCTURE_REV,
> >                               lttpr_dpcd_data,
> >                               sizeof(lttpr_dpcd_data));
> > +             if (status !=3D DC_OK) {
> > +                     dm_error("%s: Read LTTPR caps data failed.\n", __=
func__);
> > +                     return false;
> > +             }
> >
> >               link->dpcd_caps.lttpr_caps.revision.raw =3D
> >                               lttpr_dpcd_data[DP_LT_TUNABLE_PHY_REPEATE=
R_FIELD_DATA_STRUCTURE_REV -
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
