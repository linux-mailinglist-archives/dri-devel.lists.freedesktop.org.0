Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081315FB46F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7610E803;
	Tue, 11 Oct 2022 14:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFA110E81F;
 Tue, 11 Oct 2022 14:19:26 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 h1-20020a4aa741000000b004756c611188so10138217oom.4; 
 Tue, 11 Oct 2022 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKcxW5jQIBggwtbWJ3tJfNqR5dgpzYr4Id9N6Ao1MoQ=;
 b=d6ue1vYeYddTbsXjDRi6gq7D7vMWvAyAmM9sXnR3DBvKbycsXk2TK6sIJazIl8gRSq
 WxvsImUv2Ubpd5EP0yC27fJHvvE9kyGLRjUYCjoiyPNpGa6guxgE0ZmDElow/1Osekkd
 Z8VyDWU8K1Gdal2i1GUjiS5p9FIDg3CePsJgCWnIUwwNdQRTFsnRgguzkTAR+f+bdkEB
 zVSVyip8o17m1eH3WgFoRFQ6oGm/DRhzi5WXNa+HIlnXCjHy/DsIW2+JCtK/ZzUN27IR
 Q2Xq36eVzOpMY/OJh7n5zRIYDoGenYZb5tNgerFXGCneJJIndsrRAZfG8FkUMq6fiwCU
 s55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKcxW5jQIBggwtbWJ3tJfNqR5dgpzYr4Id9N6Ao1MoQ=;
 b=y/Y0VifiahKgo/4bJ71JFMHFoEDnYiYeqlAS7QqndJnRNEP1QCuuvhRf4llcXfK+0G
 +LCGlEMBh/kq0tFT4OZIa1UPVUIFT27YNTLLcp4YfCvSmVSq+HrGqnOc8YjoQOOC0cXr
 i0cYa2rPKLW01YpKF+BSYIa0v2D6vRDXvFGhVHe2cXKFJEduvPjOOMqsTpFmrZzPFE4o
 mUjaKjEOaHcBBPFA1SxCu8FYfqYSGWG8YyiBhasliFRfk9cXUZHHMJgmLS4XHsP0rh3G
 Rs3h7Jx+GBbZdxccUeshGXULAFYrgzV4Pc9vdrW9J3JGn2Mocc1oXbTMrBemp4/l8LdZ
 XyPQ==
X-Gm-Message-State: ACrzQf3+pUAXcEK8T+Wkft64BoQVRjyutPDuJHDkLxrRMvPeUFJ1mAyo
 yS75VgZjg6B3CDDewidhXz8wiWY5C4n7XjZeFtM=
X-Google-Smtp-Source: AMsMyM5Hns/L7KGRSRFzm+03euir5VSOiwuzL+OL/6U5ycyJnX8wHWooiz6BKBAON3E8n+43oMW4GverGfZn9AG38g4=
X-Received: by 2002:a4a:a78a:0:b0:472:a078:98d6 with SMTP id
 l10-20020a4aa78a000000b00472a07898d6mr9300258oom.97.1665497965815; Tue, 11
 Oct 2022 07:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665496046.git.jani.nikula@intel.com>
 <8620697ae6a13bb9202db9edbc26ff30d9f4e2e8.1665496046.git.jani.nikula@intel.com>
 <7724d8cc-54b9-1ef9-fe34-42fcbd9b93bf@amd.com> <877d16xxen.fsf@intel.com>
In-Reply-To: <877d16xxen.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Oct 2022 10:19:14 -0400
Message-ID: <CADnq5_M_vFFroxvjT4hBszg5fw8q+DMKi+u-JKayfCtbUSzZRQ@mail.gmail.com>
Subject: Re: [PATCH 03/15] drm/amd/display: stop using connector->override_edid
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Xinhui Pan <Xinhui.Pan@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 10:12 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Tue, 11 Oct 2022, Harry Wentland <harry.wentland@amd.com> wrote:
> > On 2022-10-11 09:49, Jani Nikula wrote:
> >> The connector->override_edid flag is strictly for EDID override debugf=
s
> >> management, and drivers have no business using it.
> >>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >>
> >> I really have no idea what the functional impact here is. I can only
> >> guess that the intention is to abuse ->override_edid to block EDID
> >> property updates. In any case, this use needs to go.
> >>
> >> It also seems really curious we get here via connector .get_modes hook=
!
> >> ---
> >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 4c73727e0b7d..d96877196a7f 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -6109,7 +6109,6 @@ static void create_eml_sink(struct amdgpu_dm_con=
nector *aconnector)
> >>                              aconnector->base.name);
> >>
> >>              aconnector->base.force =3D DRM_FORCE_OFF;
> >> -            aconnector->base.override_edid =3D false;
> >
> > I'm not even sure the DRM_FORCE_OFF business is right.
> >
> > Either way, I don't think amdgpu should be messing with
> > override_edid, so this is
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Thanks for the swift review; is it okay to merge this via drm-misc-next
> along with the rest (once they've been reviewed, of course)?

Sure.  No problem.

Alex

>
> BR,
> Jani.
>
> >
> > Harry
> >
> >>              return;
> >>      }
> >>
> >> @@ -6144,8 +6143,6 @@ static void handle_edid_mgmt(struct amdgpu_dm_co=
nnector *aconnector)
> >>              link->verified_link_cap.link_rate =3D LINK_RATE_HIGH2;
> >>      }
> >>
> >> -
> >> -    aconnector->base.override_edid =3D true;
> >>      create_eml_sink(aconnector);
> >>  }
> >>
> >
>
> --
> Jani Nikula, Intel Open Source Graphics Center
