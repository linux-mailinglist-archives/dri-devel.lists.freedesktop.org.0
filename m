Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A9607143
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0331F10E60D;
	Fri, 21 Oct 2022 07:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6039610E60D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:38:12 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id j6so1982270uaa.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ejE4SMnZ/x2wEn474NQUx1TDuK/H+8eIuJI9akwy/Ec=;
 b=AmNDqFrDuEuFmiQ8cQHgdERUEIXL3m8Ov7cQy6azkw71cQew/r+UOwpe8ndkFTt3fX
 5Qk+eXHlK70r4QUrn/RtgET84VMWUA8Csqecu0wLoePkU1DaDQ1SdEBr8K5U9ii11mcf
 y5yzf4woBvnWupBBaFYIsJN97LSYz5OzbD7pe3Qu3eTGvuhZPr8+q91uqvvzy7tdockE
 RZWamq0WSTbcHnwJ/eSAb1/LbDfT56MbkiFz/Wt/QLEZQGCXj5wvt6keTfE0yADuaUQP
 FfhgTVm19Dx9Bv50DxAqw4lkl38S4GudWYWuBtgXa8HBSL830uWPQtJt3lD4DsqI7RRT
 L+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ejE4SMnZ/x2wEn474NQUx1TDuK/H+8eIuJI9akwy/Ec=;
 b=Vi2Plp1U/PhL3Dg1Nb6Epa0Ut+BffIEXhHvKIEAWtUnkq3k/7gpEkXJEdVKPfKBZrF
 L0VJiISIj21ecu9pfkpTHPR6KjmxdvHiLP0bEqzlpsdCBl7A14IWKMNUt7pKRrSmCWCh
 d01BXkLtKkTKs1E2EiMQugoWC6X44JHMqwTn+N6Yh8580xkcvQMBZaCP0BySAI9Tk0PS
 7p734mI465VZxutQ1vV8GXCYTuwxRJxX1STQGJMQNTXtGcX84fgzIFbNM02MyMmtRPDI
 UpFxPlknLeM+ckAlbN9Zl/4X611Pz0m0+MWqPr8XB9ODVGlS9uO7pcgfd4tYDqFgylEO
 xtFw==
X-Gm-Message-State: ACrzQf265ZSA36rnSXaWbHHMhuf9JcLCXoqBK6rNz10ckqcgsm3n9+MN
 wGrWhGpZzrWcpiKhnRnsCjk9PTRNKAodVX+1Y10HPw==
X-Google-Smtp-Source: AMsMyM7HHuen4PWY3jxXVJtXYjBTCoZ9T+nYLlemsYegq6drh05omW1aEcJ7CpmnLgg8cK73IWyaoQSAderLj2KUw0U=
X-Received: by 2002:ab0:39c1:0:b0:3ef:dcae:f17 with SMTP id
 g1-20020ab039c1000000b003efdcae0f17mr8269175uaw.26.1666337891404; Fri, 21 Oct
 2022 00:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221019073239.3779180-1-davidgow@google.com>
 <20221019172919.GA5336@elementary>
 <5639218e-bcc8-55b0-ea30-7bf2b26c92b9@redhat.com>
In-Reply-To: <5639218e-bcc8-55b0-ea30-7bf2b26c92b9@redhat.com>
From: David Gow <davidgow@google.com>
Date: Fri, 21 Oct 2022 15:37:59 +0800
Message-ID: <CABVgOSkbqRtUTmL83HU6Nf0kp9KmrL6ZpRL2F3VDtSDEQq1DCA@mail.gmail.com>
Subject: Re: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000001c4ec305eb8686d4"
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001c4ec305eb8686d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 4:03 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 10/19/22 19:29, Jos=C3=A9 Exp=C3=B3sito wrote:
>
> [...]
>
> >>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/=
gpu/drm/tests/drm_format_helper_test.c
> >> index 8d86c250c2ec..2191e57f2297 100644
> >> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> >> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> >> @@ -438,7 +438,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(st=
ruct kunit *test)
> >>      iosys_map_set_vaddr(&src, xrgb8888);
> >>
> >>      drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &f=
b, &params->clip);
> >> -    buf =3D le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
> >> +    buf =3D le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> >>      KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0)=
;
> >>  }
> >
> > Thanks a lot for fixing this bug David, I just tested it and
> > worked as expected.
> >
>
> I've pushed this to drm-misc (drm-misc-fixes) now. Thanks!
>

Thanks very much!

> > Do you think that we should update the other calls to
> > le32buf_to_cpu() to follow a similar approach?
> >
>
> Feel free to post follow-up patches if you think that other changes are n=
eeded.
>

I _think_ this should be the only actually necessary change. Maybe
there's some cleanup of the way TEST_BUF_SIZE is used, or the sparse
annotations for endianness, but I'd need to look into exactly what the
various drm_format definitions are in more detail to know for sure.

Cheers,
-- David

--0000000000001c4ec305eb8686d4
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCC2
ebUzVmIQ//JkjEGV+eb2jr2zMFLB8jGNyKXTXDg25jAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjEwMjEwNzM4MTFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAfPvz0hgtrZtFJm1gDccm
LeVuLS63Jc1txkKOYwcdeXxMpY51wNEeT2e1ipiJ+L/mbkTbtXuuQKUK3Zpsb0StcTYXJ0RNe7t4
1mbSTLqP55onei5a0YYCuKT8PhTkCyzOWCDpDIOZetvyZoqPTEmSRL2jJ+E1s0bJjM1/HmCnrocG
JsA+Xe3wfd7kFbhGOBwuUWxrm5qqo3aJjZzkEEAVWW+5tkffFhP7b5KNs3zsnE+l0aiq7dCV4yM1
Q/0EKbLo5LE2zgi30SFAVQwJTnheL0Cznz77VWJfK5dGoUtuKT7PNtriPXbKlVZj8l3TCdAzyTnV
OGYAUWOVnqxl0NkHCA==
--0000000000001c4ec305eb8686d4--
