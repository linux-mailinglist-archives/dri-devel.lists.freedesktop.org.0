Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A873AA1BDFB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 22:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1661D10E1EE;
	Fri, 24 Jan 2025 21:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CTwp6Wvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCDD10E1EE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:43:44 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso4785503276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1737755023; x=1738359823;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=84xlwba5nN0NtRaGDYC9Vw6p7UpqEDvgA60htSEpdQk=;
 b=CTwp6Wvn2/bmSUEtlFY7lVeSXHOGQIc6vlHHBhLdnx0KsiZmrJ4Z6XVrSR8Glmzoqu
 VEib+PxC9freQdsQjz+zOtZ4qt02r5EnGhCOHfEWZfHFIIJ6m2bMKY/2yU+MKyVSnrlG
 yzpsx/nuwW/XWatUPMSNXGPGxnuRawW1RJ87U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755023; x=1738359823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84xlwba5nN0NtRaGDYC9Vw6p7UpqEDvgA60htSEpdQk=;
 b=B0MQdIGRdqJKKKNDE5Pz8QmppUTEYHCBIdY9RAk00j49pZWu0P/9nCghUYptXbsV2y
 xboNoW0AUScn1kNkOs7NXjV8nr//zRG/g6NVoMKXitmYk3RxsWF8D4c30Zod+A38UExg
 6/hmemDnwQqLlgN7M+X+b96OkXFpSLln5JFg1qsTUC0StztV9QhuGiHnlPBtvI+/1qk6
 +9AKUiIDQKaFZOYUBej9shGSpkt/HfaPuOsRtEMrqXP3Bk7fqciz+Y93ouVprElAfjq+
 VgWIp6Iv0yCJ06FLL9zrlF1HYyIToeTCX0g90rO2qECGYz4ZOMUR/Zds0Akpk90l1EQa
 uOBw==
X-Gm-Message-State: AOJu0YwEwr11NxQ02iLslbAJdCsi1/uSbCUbAPVNynM1JUo/WNoiKM/n
 wdcMU5aEyZ9AdwZSyJ3wHPF+JizLoRiRRKWf01Y1TGgMJEdrgklQMNsPJcIZT48cogXGtyYKMDD
 x5WSRafVoT9sHsZFSACliHGRatpWW6vFVEAM5
X-Gm-Gg: ASbGncuq5PKdEEyrd0eVoGdWXxv5+KcLRBZFQPEYhiKisE7YqX6LncL33eI5NxkFwp1
 06+sjmSFIyqU57Ji1vUfL+qS7kF7EVov2l3/tWygucOAC8QgoZgIEXs1FQXpsDMk=
X-Google-Smtp-Source: AGHT+IEypqu+VaboQQfqiPKx/N3fzKgr0y8DIZ5rlmR1JdcfsmSnkjtBUcPJQ0dt+upu6bgi1ZbCVCUT9/9C5kxuAYA=
X-Received: by 2002:a05:690c:368f:b0:6ef:a187:f377 with SMTP id
 00721157ae682-6f6eb9324d7mr259901957b3.34.1737755023039; Fri, 24 Jan 2025
 13:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20250115044954.2496547-1-zack.rusin@broadcom.com>
 <20250115044954.2496547-2-zack.rusin@broadcom.com>
 <CAO6MGth6+R1Z-C85Ar=5omWZf20aRz=Lby7WnL6Po3kTh4ur6Q@mail.gmail.com>
In-Reply-To: <CAO6MGth6+R1Z-C85Ar=5omWZf20aRz=Lby7WnL6Po3kTh4ur6Q@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 24 Jan 2025 16:43:31 -0500
X-Gm-Features: AWEUYZlBUo9muUAa58hF5_shxnYbAnrZORr-t68OgMvPq9dU9QsaR-TNGg9KrI8
Message-ID: <CABQX2QMVA8WBmpd6Xe=6eEoJ4=EsHqhEn4C1dJ70N4M3pktz8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Refactor cursor handling
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000df55c4062c7a9e5b"
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

--000000000000df55c4062c7a9e5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 11:48=E2=80=AFAM Ian Forbes <ian.forbes@broadcom.co=
m> wrote:
>
> On Tue, Jan 14, 2025 at 10:50=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.=
com> wrote:
> >
> > +int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
> > +                               struct drm_plane_state *new_state)
> > +{
> > +       struct drm_framebuffer *fb =3D new_state->fb;
> > +       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> > +       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_stat=
e);
> > +       struct vmw_plane_state *old_vps =3D vmw_plane_state_to_vps(plan=
e->state);
> > +       struct vmw_private *vmw =3D vmw_priv(plane->dev);
> > +       struct vmw_bo *bo =3D NULL;
> > +       struct vmw_surface *surface;
> > +       int ret =3D 0;
> > +
> > +       if (!vmw_user_object_is_null(&vps->uo)) {
> > +               vmw_user_object_unmap(&vps->uo);
> > +               vmw_user_object_unref(&vps->uo);
> > +       }
> > +
> > +       if (fb) {
> > +               if (vmw_framebuffer_to_vfb(fb)->bo) {
> > +                       vps->uo.buffer =3D vmw_framebuffer_to_vfbd(fb)-=
>buffer;
> > +                       vps->uo.surface =3D NULL;
> > +               } else {
> > +                       memcpy(&vps->uo, &vmw_framebuffer_to_vfbs(fb)->=
uo, sizeof(vps->uo));
> > +               }
> > +               vmw_user_object_ref(&vps->uo);
> > +       }
> > +
> > +       vps->cursor.update_type =3D vmw_cursor_update_type(vmw, vps);
> > +       switch (vps->cursor.update_type) {
> > +       case VMW_CURSOR_UPDATE_LEGACY:
> > +               surface =3D vmw_user_object_surface(&vps->uo);
> > +               if (!surface || vps->cursor.legacy.id =3D=3D surface->s=
nooper.id)
> > +                       vps->cursor.update_type =3D VMW_CURSOR_UPDATE_N=
ONE;
> > +               break;
> > +       case VMW_CURSOR_UPDATE_MOB: {
> > +               bo =3D vmw_user_object_buffer(&vps->uo);
> > +               if (bo) {
> > +                       struct ttm_operation_ctx ctx =3D { false, false=
 };
> > +
> > +                       ret =3D ttm_bo_reserve(&bo->tbo, true, false, N=
ULL);
> > +                       if (ret !=3D 0)
> > +                               return -ENOMEM;
> > +
> > +                       ret =3D ttm_bo_validate(&bo->tbo, &bo->placemen=
t, &ctx);
> > +                       if (ret !=3D 0)
> > +                               return -ENOMEM;
> > +
> > +                       /*
> > +                        * vmw_bo_pin_reserved also validates, so to sk=
ip
> > +                        * the extra validation use ttm_bo_pin directly
> > +                        */
> > +                       if (!bo->tbo.pin_count)
> > +                               ttm_bo_pin(&bo->tbo);
> > +
> > +                       if (vmw_framebuffer_to_vfb(fb)->bo) {
> > +                               const u32 size =3D new_state->crtc_w *
> > +                                                new_state->crtc_h *
> > +                                                sizeof(u32);
> > +
> > +                               (void)vmw_bo_map_and_cache_size(bo, siz=
e);
> > +                       } else {
> > +                               vmw_bo_map_and_cache(bo);
> > +                       }
> > +                       ttm_bo_unreserve(&bo->tbo);
> > +               }
> > +               if (!vmw_user_object_is_null(&vps->uo)) {
> > +                       if (!vmw_cursor_plane_changed(vps, old_vps) &&
> > +                           !vmw_cursor_buffer_changed(vps, old_vps)) {
> > +                               vps->cursor.update_type =3D
> > +                                       VMW_CURSOR_UPDATE_NONE;
> > +                       } else {
> > +                               vmw_cursor_mob_get(vcp, vps);
> > +                               vmw_cursor_mob_map(vps);
> > +                       }
> > +               }
> > +       }
> > +               break;
> > +       case VMW_CURSOR_UPDATE_NONE:
> > +               /* do nothing */
> > +               break;
> > +       }
> > +
> > +       return 0;
> > +}
>
> Is there any way we can determine the update type at KMS init time and
> create a different drm_plane_helper_funcs vtable for each type?
> Essentially splitting this function, atomic_check, etc. into 4
> variants and removing all the switches.

No, unfortunately we can't. The cursor snooper depends on the
framebuffer surface that's been assigned to the plane and not on
capabilities of the device that we'd have access to at the init time,
i.e. it's the client that dictates it and at init time we don't know
what clients would use this.
Sadly cursor snooper is only relevant on very old xservers, so the
question would be "can we get rid of the cursor snooper" and, also,
unfortunately because we can't break old userspace the answer is no.

z

--000000000000df55c4062c7a9e5b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJkMIICYAIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIHhQ
TWC2bAJzAxnFknkvSmur9CfduQQRAaot9nggkn+1MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDEyNDIxNDM0M1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBm3LOmJOp67dgd+hos8nKh
+vbeKQ+WishxsGmOsViaJmI381GuZnZuOURajvM7os1Po6QiEOcsk7iBN6ysnjrmpqqLLntp7sBt
WCCDwJRaaXvjzknEJss5etiFVwsuCYl0sICANAp5Zk20i3ftKvLTXgX5K6/1X43LeNmc9h3LgnSK
jRS48hb9xhOSRZLDBBFxIizpC2jhj4oj4Lw1JF0bDCswFIO1UaB1NUEWC64VNY78ps1ZCqcgFWBH
Hanh8AdDH8bMfWH7/SEtKCfe1Pf3Z9xcc/IAGs7Dj/fdjCVRs1QeYKdVW7lrgz0RaGjLeLOBaolt
DTXAsgix+Yl/ABsK
--000000000000df55c4062c7a9e5b--
