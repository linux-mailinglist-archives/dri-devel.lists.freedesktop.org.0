Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFFF5F0559
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 08:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681DB10E1AF;
	Fri, 30 Sep 2022 06:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646D910E1AF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 06:50:55 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id b15so1803160vkp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=B3puPSD7pZHrHXbl5YI0fsNw4I+r92A58bxTydU+T68=;
 b=LerCOyeMtv7pyvrPvJRYelG9p0HtQmaybaxosu9aQWR2DXSLOoIqwrLn+Yvk1zElTs
 4eFnjbS6dnpzZLfR4ZFrFAwdyN9BwDEKGrJtRJ3v1kiNxRbJna1JD3SShIqyhwSBEDJH
 jTucDUsL0OSX8zznKT8Cn2jALCxuR7c8cs4GtHBywOCkw2W8yJxmRcC1SMNInpemuJy9
 2dTXOXbLOMWHwEXy+Es2Nng6ShA5KI97R/RHknRxhmt7KSsVdIEEaOI5gHJUm5x+9FJV
 LU/TTgnGzL3UvZDoc96XLeYczCRqm01fM6YIy+nQviZvzJGr4Vq6w5IzAnzwy7iF30d7
 d1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=B3puPSD7pZHrHXbl5YI0fsNw4I+r92A58bxTydU+T68=;
 b=alTFn1IjGA9Rsmt4V9+VwyPQiFHvU5hmvCzRIsynZf2np8EV8EqiSAOeE0Rs0AstLt
 Y8u+na0qKEntCccHrmF9xtkFRB2e6laPP6sSMWK8K4CPtIlXZehRgGxxYmgSh1FtJOs6
 +r7OXTivBpuB6QNUpJ6QZRWFb0kEKFpMjyMFbySqCjRoBf+5cR21HkZvHZG66/VEZAsE
 3W5o9aiyA9tvOH1j0CSU7SJxjkC+LxR5698qaPl6GRDJw0/RFEGqrv2UoAyDHBSkwa+W
 qDpo6UTbxoVyriNLw4PTfMjwJtFtVNao/ce2pJRXWRBzS2K98jFRpGKm/KJLAnf5mL/T
 T63g==
X-Gm-Message-State: ACrzQf1xh1VWGA2bfcyTEkLLWAJ9Ff14crQ/pa17MmVIBz6puEN9n2zg
 Vs5SBlKmH2LP0mvIDlxM9xYkZD6L1kVdHmyUpe3VfA==
X-Google-Smtp-Source: AMsMyM5mR67gOWTWESSJVt2alBBUArnw+HvrAEm+llg5MrPUhP4xrrud0K4NHEXhqRk0uTv8GmVXIAkxj7mwRxfMdVY=
X-Received: by 2002:a1f:a788:0:b0:3a1:e690:a2a3 with SMTP id
 q130-20020a1fa788000000b003a1e690a2a3mr3625477vke.4.1664520654348; Thu, 29
 Sep 2022 23:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220927221206.55930-1-mcanal@igalia.com>
 <20220927221206.55930-2-mcanal@igalia.com>
 <20220929223333.vh6wy45mfx6kccds@nostramo>
In-Reply-To: <20220929223333.vh6wy45mfx6kccds@nostramo>
From: David Gow <davidgow@google.com>
Date: Fri, 30 Sep 2022 14:50:43 +0800
Message-ID: <CABVgOSkx7KYNRKCN5h=37zQGR0qu+BDCb6cQeqbCwX8UxC3knw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/tests: Split
 drm_test_dp_mst_sideband_msg_req_decode into parameterized tests
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000058196505e9df6af9"
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthur.grillo@usp.br>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, Tales Aparecida <tales.aparecida@gmail.com>,
 Daniel Latypov <dlatypov@google.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Isabella Basso <isabbasso@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000058196505e9df6af9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 6:33 AM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> On Tue, Sep 27, 2022 at 07:12:06PM -0300, Ma=C3=ADra Canal wrote:
> > The drm_test_dp_mst_sideband_msg_req_decode repeats the same test
> > structure with different parameters. This could be better represented
> > by parameterized tests, provided by KUnit.
> >
> > In order to convert the tests to parameterized tests, the test case for
> > the client ID was changed: instead of using get_random_bytes to generat=
e
> > the client ID, the client ID is now hardcoded in the test case.
>
> Generally "random" usage is not incompatible with parameterized tests, we=
 can
> create parameterized tests that use random data.
> The idea is to pass a function that generates the actual param (where we =
have a
> pointer to function as one of the members in "params" struct).
>
> For example, see "random_dp_query_enc_client_id" usage here:
> https://lore.kernel.org/dri-devel/20220117232259.180459-7-michal.winiarsk=
i@intel.com/
>
> In this case, we just compare data going in with data going out (and the =
data
> itself is not transformed in any way), so it doesn't really matter for co=
verage
> and we can hardcode.
>
> -Micha=C5=82

FWIW, while the uses of randomness in DRM tests so far haven't
concerned me much, I think we'll eventually want to have some way of
ensuring the inputs to tests are deterministic.

My thoughts are that (at some point) we'll add a kunit_random()
function or similar, which will use a pseudorandom number generator
which can be set to a deterministic seed before each test case. That
way, there'd be a way to reproduce an error easily if it occurred. (Of
course, there'd be a way of setting different or random seeds to
preserve the extra coverage you'd otherwise get.)

I don't think this is something worth holding up or changing existing
tests at the moment, but having tests behave deterministically is
definitely desirable, so +1 to avoiding get_random_bytes() if it's not
giving you any real benefit.

We've also had a few requests in the past for being able to pass in a
custom set of parameters from userspace, which opens up some other
interesting possibilities, though it's not a priority at the moment.

Cheers,
-- David

--00000000000058196505e9df6af9
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
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCZ
52dqCR2wWMEzupKSD30RVEmos3EIyytijvbGsGvKFTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA5MzAwNjUwNTRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAMoyqirby0KPoX5R/iRhg
6WPJ6+jP+COKyCTwbkAQo5PascZxHozOM1TC/WnwrPtlpjOQdQ9zqbXGMKKmaw2qYCjOQ1/3sQYn
ZNp5bkLKQcAwlMrcK0TFEBCrUK2JRzpZU3XqSDCMTI38WOgT4DeQ8uG+Fqv8sixg9lWNZgej1zQh
VCCGGcIpDlIcRKIIxPnYJ2YDCKtZz+RAJdo+cpqTpqy24Kusop3nxdAg+JJb8ISM/IoCEjc2LyQH
B+xrBeJF2762dcvtRO/95vixe140vAyQx1zWCazUDlWvf+eSQs/7QCn18HY9nvzu5e6WczXHuDZ3
btwa11ORlI82ytMg6Q==
--00000000000058196505e9df6af9--
