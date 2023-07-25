Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD12760FCE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 11:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7410E099;
	Tue, 25 Jul 2023 09:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC5E10E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:54:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fc075d9994so62885e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690278886; x=1690883686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Bt6oW8BH2d1blicm1s+7gb/+VOXuxAEaNsIS8ndbBA=;
 b=u1mqvLPTdivZo9cPYp8DgbkiMqWuG/sjS9EZ9LzF0BFbAwhAH1ywPyVpZdkG65cQZU
 ILjNl0WIUnRqYuhGYdBm3C9kS4KDGTU9llVxYwVLA5KYAE4BHRYll7hEZFf8CZ4iZv3b
 pmXCMfNjOu7gBvTgo9BJ4O8mnvMnU2zwp6zkmTN5NWBSKciC6SgbXSC7ZJIxoNo705G/
 04OTTI3OPZuZOmRnx2cBh1L92uwwEXdHDagGqrBAZI7lZF/MvRUW+tG9vfNjlPTqMr0B
 6b8bGODZk7oQBlkh00mcokYe/2UVakrNhJ0FRLtwKqpvKjH5l7DDbPYYNfOuC0BKR4eW
 FviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690278886; x=1690883686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Bt6oW8BH2d1blicm1s+7gb/+VOXuxAEaNsIS8ndbBA=;
 b=dO/gOQfcOYUka3u8bUGhTK7QmqxZ9b+p/rehT+80+JHvNAHzMLBTqgYvEG549PqnM4
 ji5pW1ohbCix32y/txNL3sGHPEXmNSK8A0ACZf5U34EqJUCMdptsOGukN0s5MepzRqNS
 K874WItCcCuS78FKBLdiEP8CRN0kIifpKQGiVNqrMNlb3KUJ1Di6LwH33sTwDQBXcnBx
 7KaIK7VQVNBiYEtVO1ghRq51dbPG+H7rW+kazP0wBfKa9mqZpY+tQe1vImqxhL6C1v5M
 D9G2xJVAQjBHWJCNS9t9mz+w75fLEkPf/wJU8x+Ws8Ub0R2JJNsPgXMfaeV08MUOucha
 LxdA==
X-Gm-Message-State: ABy/qLb7SGmafn+qz9uAHeHcrdKMA6d2WqiXbaektOCfHGtEugZlRsDw
 M/HR8QIXZEDxamoUyFtesCUl4rYwIf/ekhTnWEbzcg==
X-Google-Smtp-Source: APBJJlF7npgU9ya3lKw2WBkyEVJmOGQMtu1wRFbay3tO3HFmNk0FIQUhiYAhgNcZAL376gzjBwQnv76jvjk9XgtvK5w=
X-Received: by 2002:a05:600c:1d21:b0:3fd:e15:41e3 with SMTP id
 l33-20020a05600c1d2100b003fd0e1541e3mr58179wms.2.1690278886240; Tue, 25 Jul
 2023 02:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-10-maira.canal@usp.br>
 <7yc3fkagtlr4i7qnkulwvfzqjs7v64ddugcc3cxt6g5oawvqoa@ax67ukkrr7jt>
 <j4twjg4rd74qq6wjr7nrtrtkh6cdxehuw5lmeavu7z5q5lhtih@nofkcrdnwty7>
In-Reply-To: <j4twjg4rd74qq6wjr7nrtrtkh6cdxehuw5lmeavu7z5q5lhtih@nofkcrdnwty7>
From: David Gow <davidgow@google.com>
Date: Tue, 25 Jul 2023 17:54:32 +0800
Message-ID: <CABVgOSmtZVfuLNBXymVfeuv_997TanhR3R_=Sk0sJL359jhw7Q@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: selftest: convert drm_mm selftest to KUnit
To: Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000009c87ff06014cb8a5"
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, siqueirajordao@riseup.net,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, Shuah Khan <skhan@linuxfoundation.org>,
 kunit-dev@googlegroups.com, michal.winiarski@intel.com,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009c87ff06014cb8a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Jul 2023 at 16:38, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Thu, Apr 27, 2023 at 03:14:39PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > On Fri, Jul 08, 2022 at 05:30:52PM -0300, Ma=C3=ADra Canal wrote:
> > > From: Arthur Grillo <arthur.grillo@usp.br>
> > >
> > > Considering the current adoption of the KUnit framework, convert the
> > > DRM mm selftest to the KUnit API.
> > >
> > > Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
> > > Tested-by: David Gow <davidgow@google.com>
> > > Acked-by: Daniel Latypov <dlatypov@google.com>
> > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > > Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> >
> > I'm very late to the party, but I'd like to discuss that patch some mor=
e.
> >
> > Two tests (drm_test_mm_reserve, drm_test_mm_insert) in it take a super
> > long time to run (about 30s each on my machine).
> >
> > If we run all the DRM tests and VC4 tests, each of those two are longer
> > to run than all the ~300 tests combined. About 100 times longer.
> >
> > I don't think that running for so long is reasonable, and for multiple
> > reasons:
> >
> >   - While I don't know drm_mm well, it doesn't look like any of those
> >     tests do something that really should take this long. I'm especiall=
y
> >     skeptical about the fact that we test each operation 8192 times by
> >     default.
> >
> >   - It makes using kunit more tedious than it should be. Like I said, o=
n
> >     a very capable machine, running the all the DRM and VC4 tests takes
> >     about 50s with those two tests, ~0.4s without.
> >
> >   - The corollary is that it will get in the way of people that really
> >     want to use kunit will just remove those tests before doing so,
> >     defeating the original intent.
> >
> >
> > I understand that it came from selftests initially, but I think we
> > should rewrite the tests entirely to have smaller, faster tests. It's
> > not clear to me why those tests are as complicated as they are though.
> >
> > Also, going forward we should probably put disencourage tests running
> > that long. Could Kunit timeout/warn after a while if a test is taking
> > more than X seconds to run?
>
> I'd still like to address this. We spend ~90% of the DRM kunit tests
> execution time executing those two tests, which doesn't seem like a
> reasonable thing to do.

FWIW, KUnit is going to add a "speed" attribute for tests, so that
it's easy to skip tests which are slow:
https://lore.kernel.org/linux-kselftest/20230724162834.1354164-3-rmoar@goog=
le.com/T/#u

This would allow the slow tests to be marked using KUNIT_CASE_SLOW(),
and then be run via kunit.py --filter "speed>slow".

It obviously doesn't make the tests themselves any faster, but could
at least make it possible to run only the fast tests during
development, and the full, slower set before sending the patches out
(or in CI), for example.

-- David

--0000000000009c87ff06014cb8a5
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
9IGQSBx2i4m+hGXJpET+MEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQCRI3Z4cAidgFcv
Usqdz765x6KMZSfg/WtFrYg8ewsP2NpCxVM2+EhPyyEQ0k0DhtzdtGoI/Ug+jdFDyCKB9P2+EPLh
iMjMnFILp7Zs4r18ECHlvZuDZfH9m0BchXIxu5jLIuQyKUWrCRDZZEDNr510ZhhVfYSFPA8ms1nk
jyzYFOHYQyv5IfML/3IBFKlON5OZa+V8EZYULYcNkp03DdWglafj7SXZ1/XgAbVYrC381UvrsYN8
jndVvoa1GWwe+NVlIIK7Q3uAjV3qLEDQpaNPg1rr0oAn6YmvTccjVMqj2YNwN+RHhKNzgRGxY5ct
FaN+8fXZhRhpv3bVbAWuPZXoMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABAz5xDls09r2CKyYRqnNbMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCv
WNcnqYw8mk/1/r4z/9bB9r5ypURbSqohGBeEaG7mkDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzA3MjUwOTU0NDZaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAIrrKb7qMlI/RWtwySS0i
W1hsXLeuwi+cGCQ1befajbKgmGuQM4BUZMp7P8lU/OL/8oYvtHlZJFGr422kSF2HZQtNK8Rt/Nvr
xuCkkvlHsvHbb5/9H50Dk01D6WOCHX5UPfeVNozn+nXLWttkQwR8/kH8RAUuVFOs0PIIVE/D8uhq
xn7bombKgOET7G+5WKhHzTYi8oH3rp69UoAXWpa7HlK8CR0SrnhbaaN5DzaHldj/3iqyziUBpft5
A1lXx+ovX/9+yvderiqUhLifd/jd+LJe7b3oRPQDPU5dYWBinBEkYuV55RzLNpDpKW3JMiQ0GhwQ
IDpHpcWjp/mMBO3WMQ==
--0000000000009c87ff06014cb8a5--
