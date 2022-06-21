Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76735552E91
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F246A10EF0A;
	Tue, 21 Jun 2022 09:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8A10F08E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:38:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w17so18052135wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 02:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SqHyT7s5Ve8Ffc9HwxQE1Nidv5pzchhv4ePaicaEoAs=;
 b=iy9eXz0Dhy8kINwHRwDG7dsl3wONMaUjo/RSdDIYk08YcUReVAl//CkXyBXVC+f91R
 uGvxd14aDlLpR7g+DtCBy+VhzEZ4tTUCkziB82LMmlWApf/pLbVt/euXnrRWYVs0YSCs
 W2A1Ttmpwi7iPSRlmRxo34qf0F8dDsIRQB9pFUlweLeBh9MeDCppSUX1LfQP0qb+goL5
 JqvxLDr08LeMRxecMgJh+Ocwn/HTjGWkDgLw06kan8SR9BTKSg3zLeaBRDm+FJpePMQO
 BKqfUfSFEcspiEpCfDQecfZYPy3dg0NUvgIuciW4B+LfhLaZNA8nf7saAkQ2l0hDcXLA
 0OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqHyT7s5Ve8Ffc9HwxQE1Nidv5pzchhv4ePaicaEoAs=;
 b=LE27c2qo2aApoNp8ZMI2CGHmI9rlnx55DuriT0t2Pg+HqhDADx9vcpgQWHCiy2aBoF
 7Vld6E/4RaCIhUMSLqED2LgyE8i2LjxoiygXgdjL6Hp1GkaGvtzJh63Uy9mlPVs5TU2s
 ocfAu7FSddhx3OAKbcwUx57wCdVyDx6T9Bj8I0nMa0U4kEbgAMZgXTRmPnJ6rdIJKxFU
 PF/YXxVLRPq66DYD775h+AK8Wx7uhOVqGcM4IwLQhVY8l2gmf+59AgFty8jHVdqhg++c
 a0B2NEqTh1TlANdyrnHKPDbjHji+d3ybdwfx/IEfC/3Msrk1pv36MHNJM2TLy0mZu1FT
 b56w==
X-Gm-Message-State: AJIora+KLZKrwphuC36igyzKOyl60oBeiBDax0mPaUxj/NtBdJ7WLaSv
 qVAAd3F4Y1GqSWh5Sgrpo1+86JLGQcvOl+OtJB7yUw==
X-Google-Smtp-Source: AGRyM1tzhdoZDAzCVUfX8+RYfDzDgZ71KrhAad4YF+JMh5eFqeqZ2h6qbjnT+0eTSSpfS7NKk0J89gvdq3GRE7T9TSU=
X-Received: by 2002:a5d:570e:0:b0:21b:9610:2dd7 with SMTP id
 a14-20020a5d570e000000b0021b96102dd7mr3422861wrv.337.1655804319725; Tue, 21
 Jun 2022 02:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-2-jose.exposito89@gmail.com>
In-Reply-To: <20220620160640.3790-2-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Tue, 21 Jun 2022 17:38:28 +0800
Message-ID: <CABVgOSmPfxdcxuU6xtuT2sN75ivs+Atgmt=2PNcdWqnMcrnbEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/rect: Add DRM_RECT_INIT() macro
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000053ee0305e1f1fc97"
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
Cc: dri-devel@lists.freedesktop.org, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000053ee0305e1f1fc97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 12:06 AM Jos=C3=A9 Exp=C3=B3sito
<jose.exposito89@gmail.com> wrote:
>
> Add a helper macro to initialize a rectangle from x, y, width and
> height information.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

This looks good to me, though I have one minor concern about the macro
name. (But if it's okay with the DRM folks, which it seems to be, I
won't object.)

Either way,
Reviewed-by: David Gow <davidgow@google.com>

>  include/drm/drm_rect.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
> index 6f6e19bd4dac..e8d94fca2703 100644
> --- a/include/drm/drm_rect.h
> +++ b/include/drm/drm_rect.h
> @@ -47,6 +47,22 @@ struct drm_rect {
>         int x1, y1, x2, y2;
>  };
>
> +/**
> + * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
> + * @x: x coordinate
> + * @y: y coordinate
> + * @w: width
> + * @h: height
> + *
> + * RETURNS:
> + * A new rectangle of the specified size.
> + */
> +#define DRM_RECT_INIT(x, y, w, h) ((struct drm_rect){ \
> +               .x1 =3D (x), \
> +               .y1 =3D (y), \
> +               .x2 =3D (x) + (w), \
> +               .y2 =3D (y) + (h) })
> +

My only slight concern here is that it might be a little bit confusing
that a macro called DRM_RECT_INIT() accepts x/y/w/h, whereas the
actual struct drm_rect is x1/y1/x2/y2. If the macro were called
something like DRM_RECT_INIT_FROM_XYWH() or similar.


>  /**
>   * DRM_RECT_FMT - printf string for &struct drm_rect
>   */
> --
> 2.25.1
>

--00000000000053ee0305e1f1fc97
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
z/tQRXr3iPeVmZCr7nttMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAx+EQjLATc/sze
VoZkH7OLz+/no1+y31x4BQ3wjW7lKfay9DAAVym896b7ECttSo95GEvS7pYMikzud57WypK7Bjpi
ep8YLarLRDrvyyvBuYtyDrIewkuASHtV1oy5E6QZZe2VOxMm6e2oJnFFjbflot4A08D3SwqDwV0i
OOYwT0BUtHYR/3903Dmdx5Alq+NDvUHDjozgo0f6oIkwDXT3yBV36utQ/jFisd36C8RD5mM+NFpu
3aqLXARRbKtxw29ErCwulof2dcAonG7cd5j+gmS84sLhKU+BhL1OQVXnJ5tj7xZ5Ri5I23brcwk0
lk/gWqfgs3ppT9Xk7zVit9q8MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCB6
zf1rxXavYyPOZWnreseoyzAN7QOC+ObHzKsASfcEQTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA2MjEwOTM4NDBaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAf/FzvCRC9xepfeZj+Anu
nJUoStIaZ1MtUTGwQXDyjcySHC3TPXwnWDGME2dHHQ56jpyxI7ZIr8tJXORJGYDN3BLnk3S+aKs2
6VGOdpUbHYfQa+gfFzDTbLBJFrHfWQc7xUl5TxP20bOnU5cpPVwQkkCYwmxwr34tLDaMKboRn7tY
QQcNGcuo01+yGXH7Jl1BiyIpYw4MxY6v4/DguPvqEkqiGBUwP5zyjhlP5Pq8MAfZhr4FDieUd9Gy
5HkjmDmQjbQrC3B8/zGNCkh3x3r6l98THHqj6h9cKrTstMuHf8faGIxDjqcvwPvVHe7bs9cC+9Nn
6FlgfeXYqpRQE/tlcQ==
--00000000000053ee0305e1f1fc97--
