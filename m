Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BDE54F244
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92E10EA12;
	Fri, 17 Jun 2022 07:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FD410F616
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:55:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso4211913wml.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GatU5kyLkP9wVzP9O7C37aQwWsU8CQbUA3dx1uLUxxk=;
 b=QNOMGRb94r073C7kc+jyXMHGC2DptZ/Pjt98c+Of2InCllr9Fu8nNYQe/3TsQC3Giy
 lhqoAF6GO5dXe678SMzFg9s2PeDseR1JCHpS4RRtcMh8N1Srfm9nYkkBbJm4GhfHTN6L
 MqIhcMwolPqVg1HFKTP9+Pbr4XrjfmMjOxfgcgyHn/UzRwbZf/qfNdRnyakNNoenTedN
 xT1xdfE5RycdLhZG5PkUJ4BgDOo6+YeU+ImXP/lZpWzvT33k8ygj9Ft8rkI5v8aTTnED
 iijw+g/CZ3/AQBtX20Snwr6FWJOxJBiajp4meqQIfFip4KrFv18D7p518uaoNdlldKQk
 d7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GatU5kyLkP9wVzP9O7C37aQwWsU8CQbUA3dx1uLUxxk=;
 b=gx/jh3EQ/OT+Fx6SMZcFuWpZ99XAroWu/DJ+Nru+R7QfQK+oel0F1s9lU4po00oG6e
 EPCFbNwn5cYoyP2duM0ubo0uKCNHXdqGfPO1QbR3QfPfIX8T3UdMoD9wdnJrVT82DESh
 IpcyrN58TZ1vtejhFy4a2mL5iXafx2DblixpE2dVXKOzGV3ks88qetHAMgULzSnTkUgV
 UophRFBJcFX/dUe4E0OVgn5Tt6z9oNdEk7p+0BH7n+tgItzqeRu/r5zpWPyATFzlfccn
 rTSg6T+/fJWIySbRJfstEYcEC4L1aH+dnjSVB88EgteUyMG1/ahugJ51bx4KlRk70YZ4
 xVqQ==
X-Gm-Message-State: AJIora93Z4jLQ0nJudFUZxLnRxNIA+NH2mZZinsHY3pqEi5Cw529Ynt5
 6ykpbtm5eNkP0jxlWxacIDfITAU0qJcoR3GI5mFBRA==
X-Google-Smtp-Source: AGRyM1tfVChwyDIlBb0orUq+mPQGXjKNmDtT8mPbODrQ1rPHW7Mae1N118ArHfVpa41Sud5Pdp2NbY6FRof/lc9TyH8=
X-Received: by 2002:a1c:6a16:0:b0:39c:655a:ac2c with SMTP id
 f22-20020a1c6a16000000b0039c655aac2cmr9010421wmc.66.1655452522565; Fri, 17
 Jun 2022 00:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220608010709.272962-1-maira.canal@usp.br>
 <CABVgOSmesj5MGfQrtdWCgXzm1VXRoG0fAMCbkBCAvtqediqAjQ@mail.gmail.com>
 <8b040fb2-7edd-6fd1-864e-ee04115c5b1d@usp.br>
In-Reply-To: <8b040fb2-7edd-6fd1-864e-ee04115c5b1d@usp.br>
From: David Gow <davidgow@google.com>
Date: Fri, 17 Jun 2022 15:55:11 +0800
Message-ID: <CABVgOSmyUC11fwpsH8Y6a_8hCKphyyZj2uYT+dhuRfHT2uonmA@mail.gmail.com>
Subject: Re: [RFC 0/3] drm/amd/display: Introduce KUnit to Display Mode Library
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000093fdaf05e1a013b3"
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
Cc: Harrison Chiu <harrison.chiu@amd.com>, Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Jun Lei <jun.lei@amd.com>, magalilemes00@gmail.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, mwen@igalia.com,
 Sean Paul <seanpaul@chromium.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, tales.aparecida@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000093fdaf05e1a013b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 6:41 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Hi David,
>
> Thank you for your feedback!
>
> On 6/16/22 11:39, David Gow wrote:
> > On Wed, Jun 8, 2022 at 9:08 AM Ma=C3=ADra Canal <maira.canal@usp.br> wr=
ote:
>
> >>
> >> As kunit_test_suites() defines itself as an init_module(), it conflict=
s with
> >> the existing one at amdgpu_drv. So, if we use kunit_test_suites(), we =
won't
> >> be able to compile the tests as modules and, therefore, won't be able =
to use
> >> IGT to run the tests. This problem with kunit_test_suites() was alread=
y
> >> discussed in the KUnit mailing list, as can be seen in [7].
> >
> > I'm not sure I fully understand why these tests need to be part of the
> > amdgpu module, though admittedly I've not played with IGT much. Would
> > it be possible to compile these tests as separate modules, which could
> > depend on amdgpu (or maybe include the DML stuff directly), and
> > therefore not have this conflict? I definitely was able to get these
> > tests working under kunit_tool (albeit as built-ins) by using
> > kunit_test_suites(). If each suite were built as a separate module (or
> > indeed, even if all the tests were in one module, with one list of
> > suites), then it should be possible to avoid the init_module()
> > conflict. That'd also make it possible to run these tests without
> > actually needing the driver to initialise, which seems like it might
> > require actual hardware(?)
>
> Initially, we tried the kunit_test_suites() approach. And it did work pre=
tty well for the kunit_tool (although we didn't test any hardware-specific =
unit test). But when compiling the test as a module, we would get a linking=
 error, pointing out multiple definitions of 'init_module'/'cleanup_module'=
 at kunit_test_suites().
>
> At this point, we thought about a couple of options to resolve this probl=
em:
> - Add EXPORT_SYMBOL to the functions we would test. But, this doesn't sca=
le pretty well, because it would pollute AMDGPU code as the tests expand.
> - Take the Thunderbolt path and add the tests to the driver stack.
>
> We end up taking the Thunderbolt path as it would be more maintainable.
>
> Compiling the tests as a module is essential to make the tests run at IGT=
, as IGT essentially loads the module, runs it, and parses the output (a ve=
ry very simplified explanation of what IGT does). IGT is a very known tool =
for DRI developers, so we believe that IGT support is crucial for this proj=
ect.
>
> If you have any other options on how to make the module compilation viabl=
e without using the 'thunderbolt'-style, we would be glad to hear your sugg=
estions.

As you point out, there are really two separate problems with
splitting the tests out totally:
- It's ugly and pollutes the symbol namespace to have EXPORT_SYMBOL()
everywhere.
- It's impossible to have multiple init_module() "calls" in the same module=
.

The first of these is, I think, the harder to solve generally. (There
are some ways to mitigate the namespace pollution part of it by either
hiding the EXPORT_SYMBOL() directives behind #ifdef CONFIG_KUNIT or
similar, or by using symbol namespaces:
https://www.kernel.org/doc/html/latest/core-api/symbol-namespaces.html
-- or both -- but they don't solve the issue entirely.)

That being said, it's as much a matter of taste as anything, so if
keeping things in the amdgpu module works well, don't let me stop you.
Either way should work, and have their own advantages and
disadvantages.

The latter is just a quirk of the current KUnit implementation of
kunit_test_suites(). This multiple-definition issue will go away in
the not-too-distant future.

So my suggestion here would be to make sure any changes you make to
work around the issue with multiple init_module definitions are easy
to remove. I suspect you could probably significantly simplify the
whole dml_test.{c,h} bit to just directly export the kunit_suites and
maybe throw them all in one array to pass to
__kunit_test_suites_init(). Then, when the improved modules work
lands, they could be deleted entirely and replaced with one or more
calls to kunit_test_suite().

> >
> > There are two other reasons the 'thunderbolt'-style technique is one
> > we want to avoid:
> > 1. It makes it much more difficult to run tests using kunit_tool and
> > KUnit-based CI tools: these tests would not run automatically, and if
> > they were built-in as-is, they'd need to be
> > 2. We're planning to improve module support to replace the
> > init_module()-based implementation of kunit_test_suites() with one
> > which won't have these conflicts, so the need for this should be
> > short-lived.
> >
> > If you're curious, an early version of the improved module support can
> > be found here, though it's out-of-date enough it won't apply or work
> > as-is:
> > https://lore.kernel.org/all/101d12fc9250b7a445ff50a9e7a25cd74d0e16eb.ca=
mel@codeconstruct.com.au/
> >
> > Now, that's unlikely to be ready very soon, but I'd be hesitant to
> > implement too extensive a system for avoiding kunit_test_suites()
> > given at some point it should work and we'll need to migrate back to
> > it.
>
> We hope to see in the near future the improved module support from KUnit =
as it would make the addition of tests much more simple and clean.
>
> Could you explain more about what is missing to make this improved module=
 support come upstream?
>

Mostly just time and some other priorities. We've taken another look
at it over the last couple of days, and will try to accelerate getting
it in within the next couple of kernel releases. (Hopefully sooner
rather than later.)

> >
> > At the very least, having the dependency on KUNIT=3Dm is a very bad
> > idea: it should be possible to have tests built as modules, even if
> > KUnit itself isn't, and ideally (even if this sort-of implementation
> > is required), it _should_ be possible to have these tests be built-in
> > if all their dependencies (KUnit, amdgpu) are, which would make it
> > possible to run the tests without a userland.
> >
>
> Thank you for the suggestion! We will change the KUNIT dependency.

Thanks -- with that gone, the tests do build for me under kunit_tool,
though I can't seem to get them to run as-is. (Moving the call to
amdgpu_dml_test_init() into the amdgpu_init() function in amdgpu_drv.c
does work, though I'm not sure if that's a sufficiently correct /
viable solution.)


Cheers,
-- David

--00000000000093fdaf05e1a013b3
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
G7p3AiuB2sgfq6cOpbO5MEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBsL34EJkCtu9Nu
2+R6l1Qzno5Gl+N2Cm6/YLujukDGYa1JW27txXiilR9dGP7yl60HYyG2Exd5i6fiLDlaNEw0SqzE
dw9ZSIak3Qvm2UybR8zcnB0deCUiwahqh7ZncEPlhnPpB08ETEUtwBEqCEnndNEkIN67yz4kniCZ
jZstNF/BUnI3864fATiXSbnNqBwlJS3YkoaCTpbI9qNTrf5VIvnbryT69xJ6f25yfmxrXNJJe5OG
ncB34Cwnb7xQyk+uRLZ465yUBkbjk9pC/yamL0O7SOGYUclrQl2c5zzGuVBD84YcQGDOK6gSPj6w
QuBfOooZPOyZZZ8AMih7J980MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABQeVybOOpR4bOOXZYL5T3MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAz
5ZAkQzNyom7f3RYgzuYTlMRiMkYPxawTWjJ4bL2OhjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA2MTcwNzU1MjNaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAoWZZ7/izHgOxFftrr2xg
SyvChZjZXQpDT0PnF52aoskf9XJ6c1gwKj8TTGCAg3qUDbnzuC1Atv/3JHWWAoiMX8N7HLADKBm+
pLrjRM/Rxox0h+Mw5ijozAnA67BlyTX7nmvUQbydsrgPjejBzHE+UBwHWERgFEDuNlxGI2bGX5kz
un7MbY2SaOc8JJ2q6eex8CC3Vbjh3TwWFTKhUavcQ7n7hjtzBx2U/VETK5PTVs/PVm4/PYIN7p8A
a0YwXVmpmQC46oApdLCiYTenhxw6ck9rHc6KmuzlQreH10qiC7epqfuvdjKBFU0232Bp1LQwGLqY
KZHRxb2aNxZCGyMjJA==
--00000000000093fdaf05e1a013b3--
