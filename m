Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35106A1BAE8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A9710E9F3;
	Fri, 24 Jan 2025 16:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hMTIG+Kq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A06610E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:48:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so1936494f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1737737308; x=1738342108;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bD3zpI2EfCBXFsdiAHJ5ClXHEpOwqtAPDJc7CcW/jYE=;
 b=hMTIG+Kq6ECidztsTovuGO7BEcUB1HcqEzNgiSvg6VHKh6hAxliTjipmm3UTdhMX5H
 JmvawAEvSHcu1K2Ibngw5qmeKpOmrKU1ULWycvfh4aHup/RpEOVCOSwN5b6Q8CyUSUmk
 0X+Z7y7GtkhqFbdQ/H31lDqi+kMzSZXU1IuM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737308; x=1738342108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bD3zpI2EfCBXFsdiAHJ5ClXHEpOwqtAPDJc7CcW/jYE=;
 b=hJPrmfdKiU1YLlfCsZa+N9KL0GkqDIPNt0JT9aro5FDO62l2q2mMevZi/3kwY1CsLG
 2nmI1ssg2c/AVT4my8FJYB/moKegGckTH1xkh4Mon41toatsAhXMSDxu2V4IwnFM4Ajo
 DVkS0aufVIwQnTPsBd2WqxqE5MD4jtv9eVlJhdfrxRHQ4ALhyYmPrp9YwGQ9ZsuecNza
 TftWdzMM7rBfR1XOgwLYf2gHShKZIcyzTceBDQo0SaaNIqWv6CSKMYI/skgHmSJn1Djb
 9/ULiEVqPu1yFxMkozL423ulqFtG13MgVBR7ibPWfcZhOcncDivaFUw7cjWT7UKDK+Fs
 Xjjw==
X-Gm-Message-State: AOJu0Yz/+tqpHDpSrvB9kOAmDjzvMv7xpnodmczxL3KNv1qtZmQHHFBM
 mbxD4NRqhdTAdhZKFFaPbAqpmUvompkeWZULP65GX216R9nrrctKeFBAtRwQYK/aMV6jVqRoLyM
 xp0c/uMkZ3aWcAmtPCc676jkDXWFkmNBisPQm
X-Gm-Gg: ASbGncsc4E1Ywg4ozAqWbWPt02HcynCrKCZjUN1N9AlCU9k+wVFWO3RiRicB5HZLvus
 YEq8VX7XV3INfEJ0T40G/LXxBGWByQCLh3KWxYtO227H3NNJN6Llzh1vroJtIXMk=
X-Google-Smtp-Source: AGHT+IE2wMwwU2FfVMhZMKLlkB94UkGAloZykebXFzHo5W0izxmF78nXSxm1FoRjl9SNNDzA9BGrIf+dbtgLF+SDaSo=
X-Received: by 2002:a5d:47a3:0:b0:38a:a11e:7af6 with SMTP id
 ffacd0b85a97d-38bf5677cf5mr30710686f8f.6.1737737307907; Fri, 24 Jan 2025
 08:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20250115044954.2496547-1-zack.rusin@broadcom.com>
 <20250115044954.2496547-2-zack.rusin@broadcom.com>
In-Reply-To: <20250115044954.2496547-2-zack.rusin@broadcom.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 24 Jan 2025 10:48:16 -0600
X-Gm-Features: AWEUYZnw3X-0bai6W7H-3KeTV821qEfRtJxDWBOyKYiDiXGTqQlY6b2KBUbSRxw
Message-ID: <CAO6MGth6+R1Z-C85Ar=5omWZf20aRz=Lby7WnL6Po3kTh4ur6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Refactor cursor handling
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000f81cd1062c767e98"
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

--000000000000f81cd1062c767e98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:50=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> +int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
> +                               struct drm_plane_state *new_state)
> +{
> +       struct drm_framebuffer *fb =3D new_state->fb;
> +       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> +       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_state)=
;
> +       struct vmw_plane_state *old_vps =3D vmw_plane_state_to_vps(plane-=
>state);
> +       struct vmw_private *vmw =3D vmw_priv(plane->dev);
> +       struct vmw_bo *bo =3D NULL;
> +       struct vmw_surface *surface;
> +       int ret =3D 0;
> +
> +       if (!vmw_user_object_is_null(&vps->uo)) {
> +               vmw_user_object_unmap(&vps->uo);
> +               vmw_user_object_unref(&vps->uo);
> +       }
> +
> +       if (fb) {
> +               if (vmw_framebuffer_to_vfb(fb)->bo) {
> +                       vps->uo.buffer =3D vmw_framebuffer_to_vfbd(fb)->b=
uffer;
> +                       vps->uo.surface =3D NULL;
> +               } else {
> +                       memcpy(&vps->uo, &vmw_framebuffer_to_vfbs(fb)->uo=
, sizeof(vps->uo));
> +               }
> +               vmw_user_object_ref(&vps->uo);
> +       }
> +
> +       vps->cursor.update_type =3D vmw_cursor_update_type(vmw, vps);
> +       switch (vps->cursor.update_type) {
> +       case VMW_CURSOR_UPDATE_LEGACY:
> +               surface =3D vmw_user_object_surface(&vps->uo);
> +               if (!surface || vps->cursor.legacy.id =3D=3D surface->sno=
oper.id)
> +                       vps->cursor.update_type =3D VMW_CURSOR_UPDATE_NON=
E;
> +               break;
> +       case VMW_CURSOR_UPDATE_MOB: {
> +               bo =3D vmw_user_object_buffer(&vps->uo);
> +               if (bo) {
> +                       struct ttm_operation_ctx ctx =3D { false, false }=
;
> +
> +                       ret =3D ttm_bo_reserve(&bo->tbo, true, false, NUL=
L);
> +                       if (ret !=3D 0)
> +                               return -ENOMEM;
> +
> +                       ret =3D ttm_bo_validate(&bo->tbo, &bo->placement,=
 &ctx);
> +                       if (ret !=3D 0)
> +                               return -ENOMEM;
> +
> +                       /*
> +                        * vmw_bo_pin_reserved also validates, so to skip
> +                        * the extra validation use ttm_bo_pin directly
> +                        */
> +                       if (!bo->tbo.pin_count)
> +                               ttm_bo_pin(&bo->tbo);
> +
> +                       if (vmw_framebuffer_to_vfb(fb)->bo) {
> +                               const u32 size =3D new_state->crtc_w *
> +                                                new_state->crtc_h *
> +                                                sizeof(u32);
> +
> +                               (void)vmw_bo_map_and_cache_size(bo, size)=
;
> +                       } else {
> +                               vmw_bo_map_and_cache(bo);
> +                       }
> +                       ttm_bo_unreserve(&bo->tbo);
> +               }
> +               if (!vmw_user_object_is_null(&vps->uo)) {
> +                       if (!vmw_cursor_plane_changed(vps, old_vps) &&
> +                           !vmw_cursor_buffer_changed(vps, old_vps)) {
> +                               vps->cursor.update_type =3D
> +                                       VMW_CURSOR_UPDATE_NONE;
> +                       } else {
> +                               vmw_cursor_mob_get(vcp, vps);
> +                               vmw_cursor_mob_map(vps);
> +                       }
> +               }
> +       }
> +               break;
> +       case VMW_CURSOR_UPDATE_NONE:
> +               /* do nothing */
> +               break;
> +       }
> +
> +       return 0;
> +}

Is there any way we can determine the update type at KMS init time and
create a different drm_plane_helper_funcs vtable for each type?
Essentially splitting this function, atomic_check, etc. into 4
variants and removing all the switches.

--000000000000f81cd1062c767e98
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
V0fYJUiKJMCwvDmndOil8EtMA8j2T6taUZoQINiKQ0oDWgY6eYVv7AdPVIeOOs3noCyUL8AyA7Bl
yoOPBB2/gk8VGcolEKgAAj+3hPbBF/d19x1bZzU3wABizBomVwykx5ms1nVXDbQajz8jqYECKWh9
3OMo7BuC3TAClu5mLr2zs0Ccpp6NRRkjTF8WtCJ+jSnjFJGLAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF2lhbi5mb3JiZXNAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSvJWzgGK7aSByS+CQVBVfM
Xgm5azANBgkqhkiG9w0BAQsFAAOCAgEAfrWiLF3zrYq7D+KPNRaAP70FbxHeaiUfn27Hbu37Eefz
xeJTcFZH04IEtXqpM3NWYZm4A/dFn/VQPbLCRaeXzpT2TESVH6EFY7BEF0rnSSlUbFyi000MnSH3
h5m+MoyE+PzLqfzLBZS+EU/haCpPy6Nqhs3fPKG3w5VTnUPsAxXK7rSmkIDVNsvwRttuMq9KHJzH
Bx51dP/z3mel4OuMjgrwHk5uNY1Sn1MZAUQztVUsWguyfoKcmhxXbBccR5DdEfBgDEbq8bicPQ3J
kqEy1QZXJfHlJuAJIiEw7odGctwqLeGCU6cBLhnsg54ngjO3uYC6tIySul55MRxFKE8HIwIrx+D5
2SwhDeVLZ8sTK40uPzW5xg5laOWVCvmy2b+cHCGzarUeIlYdtw0ejdH9Hbkm0G7IrDvjkhPa64gR
6Q+m5CGRDk+8iWhieH6WFE4HL++BpZhoi+YsOkGU3DK0dA+pxQnXNcNw1s0eNbSUVwQzmlC4LqiK
Gj5JV81HTPLhoAya57a9i28Fp5qHZiFnCq4HMvwiwY7IWe+UwUuueU199aTK80xNiS553vHc6FpI
/vxGy+LveJqEtodfKqQKwDOVu//c1Lz3uergJHqFYTMykk5U95J3FG5q/7Mqe4RF6E9OgtuAJidS
6Ca5anjLQ/qzIfTjoXX7TJSjPztehRQxggJkMIICYAIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgx2/5+PPF/QoW30N7swDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIGnb
49gH9sRXRbRMTp9UIVxe48QPGWasyyWp2+FNasz8MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDEyNDE2NDgyOFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBLt4L0opckmgJ2oZxonGzR
C8zdz4AvXyE5oH4Eyfq8kdS/E3JZN70vwcZUE04Abmq/X2q8xb+zg5UynQ44zcArD1gauj/1pv3h
yhW+z2eYbHTxkYxFlmltiqV0dKqcSdMRY1U2FmWDkB7JojpE5AD35Kt87tEirYW1L4GIMzh9p4mh
FJyCAYuHhQy4WWJ8BBlSbNfMMUFNOtAJqPZD6qIEVKdmudufOp/4KNzR+fWTNhavJlNkfFiDLtMF
7wYG4rnYQ0ni8eK4BkTVn8NFSiItGYKZ7OUujy5mQ1rMGXAQ/uhC16FMU0D0JzLpH7cIFt53uoWg
ChpQb7umTipYFYDC
--000000000000f81cd1062c767e98--
