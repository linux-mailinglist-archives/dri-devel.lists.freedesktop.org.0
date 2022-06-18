Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F55503A0
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29C610E4D5;
	Sat, 18 Jun 2022 09:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC7A10E3FD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 09:09:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso5405153wms.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 02:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5qwrk79Tn/PEUNz25nMaZG0kEcYcF8tTTzn/h+CAKM=;
 b=hV2H/ZgYoFgaQk+3jhcnfvsjv+CpgKpJEWmpB9XtI+jFZ2fg/TGx7nyZjzc9rqzj3w
 PUQ0VAqmaQoYzrRj0jbeQw6a93bWE5TLIn3T8Hw0KSRTLeTR6OrBk2vMN4+UlWInLQQx
 7ErciFI+Mx+bdZ3zbZhiOz6WaOp6wG7BfLhWYXdEU8N2BnL78KgvI4TniybwEfSX3R98
 FAyNCuRYmvAOYEwXhfGEdDS6a+iAgfC1hjNjQJzqMtLm4xr1LLxxSD1BM74eas8/3cT0
 MtMYPjaCB6TFPep+os/4SXUFC3GoFLywQmXY3yLPDicHCw43ZZVQXnPXjId2OH2Opuo2
 vMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5qwrk79Tn/PEUNz25nMaZG0kEcYcF8tTTzn/h+CAKM=;
 b=Yq25708a0COW96RrWmWZgoMU35ek9PynIVfEZwAPDRSarz3B3ZG7QX3K4lWILRODxL
 j4TmLKBbaaYXd2yrES9O6mVsFqgU28xsHMUoeUpxpHdnPS/NikihZR2jhrvwjllhhWyn
 gO9OvKEUFteM4+e8M35dn3X7w6WQHNVa0M6+hTsqNYPOHITVf/AtoFS0W6mTsg10EHgg
 IJRbFTxo91hhvjiGWN6EvgNVDeiz3NDvzPnhoqcsl747sMTheMuUKMqRrhViLyqIzmxE
 bjqgkqBAiqnA6aarlWFivsToVrIqGi+q6XBEErIXELlCP6ZUDNMDqdgQT41Ib0uoS+Zw
 OcKQ==
X-Gm-Message-State: AOAM5333adoeiKRyniJdTUzkA3ytpdrySg4GU+l924hJvyRCnGVAc2kw
 z6jGC7A/It+k6fcZK/1gdCiHcmDGIKPGdzl3s/EneQ==
X-Google-Smtp-Source: ABdhPJxL5jhB9XjTyu9u+mlmAKz/3M9qIhmcShpkIliHupr1o77eZ5wIM2xzCLiPquWA7CVZlsscwpzw48pDnga0Uuc=
X-Received: by 2002:a05:600c:4e88:b0:39c:7c53:d7ff with SMTP id
 f8-20020a05600c4e8800b0039c7c53d7ffmr25841225wmq.176.1655543341045; Sat, 18
 Jun 2022 02:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220608010709.272962-1-maira.canal@usp.br>
 <CABVgOSmesj5MGfQrtdWCgXzm1VXRoG0fAMCbkBCAvtqediqAjQ@mail.gmail.com>
 <8b040fb2-7edd-6fd1-864e-ee04115c5b1d@usp.br>
 <CABVgOSmyUC11fwpsH8Y6a_8hCKphyyZj2uYT+dhuRfHT2uonmA@mail.gmail.com>
 <44745ed7-18ad-ad7c-fef5-2f0f71d289d1@usp.br>
In-Reply-To: <44745ed7-18ad-ad7c-fef5-2f0f71d289d1@usp.br>
From: David Gow <davidgow@google.com>
Date: Sat, 18 Jun 2022 17:08:49 +0800
Message-ID: <CABVgOSk8grWzD2AR3KLOK_CioDu=vy_gOgpofTvp+8PvZSaoRg@mail.gmail.com>
Subject: Re: [RFC 0/3] drm/amd/display: Introduce KUnit to Display Mode Library
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000c7dc6805e1b538d3"
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

--000000000000c7dc6805e1b538d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 18, 2022 at 4:24 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> On 6/17/22 04:55, David Gow wrote:
> > On Fri, Jun 17, 2022 at 6:41 AM Ma=C3=ADra Canal <maira.canal@usp.br> w=
rote:
> >>
> >> Hi David,
> >>
> >> Thank you for your feedback!
> >>
> >> On 6/16/22 11:39, David Gow wrote:
> >>> On Wed, Jun 8, 2022 at 9:08 AM Ma=C3=ADra Canal <maira.canal@usp.br> =
wrote:
> >>
> >>>>
> >>>> As kunit_test_suites() defines itself as an init_module(), it confli=
cts with
> >>>> the existing one at amdgpu_drv. So, if we use kunit_test_suites(), w=
e won't
> >>>> be able to compile the tests as modules and, therefore, won't be abl=
e to use
> >>>> IGT to run the tests. This problem with kunit_test_suites() was alre=
ady
> >>>> discussed in the KUnit mailing list, as can be seen in [7].
> >>>
> >>> I'm not sure I fully understand why these tests need to be part of th=
e
> >>> amdgpu module, though admittedly I've not played with IGT much. Would
> >>> it be possible to compile these tests as separate modules, which coul=
d
> >>> depend on amdgpu (or maybe include the DML stuff directly), and
> >>> therefore not have this conflict? I definitely was able to get these
> >>> tests working under kunit_tool (albeit as built-ins) by using
> >>> kunit_test_suites(). If each suite were built as a separate module (o=
r
> >>> indeed, even if all the tests were in one module, with one list of
> >>> suites), then it should be possible to avoid the init_module()
> >>> conflict. That'd also make it possible to run these tests without
> >>> actually needing the driver to initialise, which seems like it might
> >>> require actual hardware(?)
> >>
> >> Initially, we tried the kunit_test_suites() approach. And it did work =
pretty well for the kunit_tool (although we didn't test any hardware-specif=
ic unit test). But when compiling the test as a module, we would get a link=
ing error, pointing out multiple definitions of 'init_module'/'cleanup_modu=
le' at kunit_test_suites().
> >>
> >> At this point, we thought about a couple of options to resolve this pr=
oblem:
> >> - Add EXPORT_SYMBOL to the functions we would test. But, this doesn't =
scale pretty well, because it would pollute AMDGPU code as the tests expand=
.
> >> - Take the Thunderbolt path and add the tests to the driver stack.
> >>
> >> We end up taking the Thunderbolt path as it would be more maintainable=
.
> >>
> >> Compiling the tests as a module is essential to make the tests run at =
IGT, as IGT essentially loads the module, runs it, and parses the output (a=
 very very simplified explanation of what IGT does). IGT is a very known to=
ol for DRI developers, so we believe that IGT support is crucial for this p=
roject.
> >>
> >> If you have any other options on how to make the module compilation vi=
able without using the 'thunderbolt'-style, we would be glad to hear your s=
uggestions.
> >
> > As you point out, there are really two separate problems with
> > splitting the tests out totally:
> > - It's ugly and pollutes the symbol namespace to have EXPORT_SYMBOL()
> > everywhere.
> > - It's impossible to have multiple init_module() "calls" in the same mo=
dule.
> >
> > The first of these is, I think, the harder to solve generally. (There
> > are some ways to mitigate the namespace pollution part of it by either
> > hiding the EXPORT_SYMBOL() directives behind #ifdef CONFIG_KUNIT or
> > similar, or by using symbol namespaces:
> > https://www.kernel.org/doc/html/latest/core-api/symbol-namespaces.html
> > -- or both -- but they don't solve the issue entirely.)
> >
> > That being said, it's as much a matter of taste as anything, so if
> > keeping things in the amdgpu module works well, don't let me stop you.
> > Either way should work, and have their own advantages and
> > disadvantages.
> >
> > The latter is just a quirk of the current KUnit implementation of
> > kunit_test_suites(). This multiple-definition issue will go away in
> > the not-too-distant future.
> >
> > So my suggestion here would be to make sure any changes you make to
> > work around the issue with multiple init_module definitions are easy
> > to remove. I suspect you could probably significantly simplify the
> > whole dml_test.{c,h} bit to just directly export the kunit_suites and
> > maybe throw them all in one array to pass to
> > __kunit_test_suites_init(). Then, when the improved modules work
> > lands, they could be deleted entirely and replaced with one or more
> > calls to kunit_test_suite().
> >
> >>>
> >>> There are two other reasons the 'thunderbolt'-style technique is one
> >>> we want to avoid:
> >>> 1. It makes it much more difficult to run tests using kunit_tool and
> >>> KUnit-based CI tools: these tests would not run automatically, and if
> >>> they were built-in as-is, they'd need to be
> >>> 2. We're planning to improve module support to replace the
> >>> init_module()-based implementation of kunit_test_suites() with one
> >>> which won't have these conflicts, so the need for this should be
> >>> short-lived.
> >>>
> >>> If you're curious, an early version of the improved module support ca=
n
> >>> be found here, though it's out-of-date enough it won't apply or work
> >>> as-is:
> >>> https://lore.kernel.org/all/101d12fc9250b7a445ff50a9e7a25cd74d0e16eb.=
camel@codeconstruct.com.au/
> >>>
> >>> Now, that's unlikely to be ready very soon, but I'd be hesitant to
> >>> implement too extensive a system for avoiding kunit_test_suites()
> >>> given at some point it should work and we'll need to migrate back to
> >>> it.
> >>
> >> We hope to see in the near future the improved module support from KUn=
it as it would make the addition of tests much more simple and clean.
> >>
> >> Could you explain more about what is missing to make this improved mod=
ule support come upstream?
> >>
> >
> > Mostly just time and some other priorities. We've taken another look
> > at it over the last couple of days, and will try to accelerate getting
> > it in within the next couple of kernel releases. (Hopefully sooner
> > rather than later.)
> Is there anything we can do to make this move faster? As it is our great
> interest to make this work in KUnit, maybe I, Isabella, Tales, or Magali
> can start work on this feature. We don=C2=B4t have much knowledge of the
> inner workings of KUnit, but if you point out a path, we can try to work
> on this task.
>
> Maybe, could we work in the same way as Jeremy?

Daniel and I have quickly tidied up and finished the various
in-progress bits of this and sent it out here:
https://lore.kernel.org/linux-kselftest/20220618090310.1174932-1-davidgow@g=
oogle.com/T/

You should be able to apply that series and then just use
kunit_test_suites(), which will no-longer conflict with module_init
functions.

The most useful thing you could do is to test and/or review it --
there's almost certainly something I'll have missed.

Cheers,
-- David

--000000000000c7dc6805e1b538d3
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
MDIwAhABQeVybOOpR4bOOXZYL5T3MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCB
1EzPKyO4sDw0SWhbVASwpUD2LLn+joxofAY1tK+B+TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA2MTgwOTA5MDFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAqN3YpcCN6/Ufm24QRwPY
lFccv//gmmmzh/PSSGScuA9xHHjUExMKF4eZsDCf2Kzmz+2tycnEL+dHRRRF+Y3p21WpmSAP/XSf
oAZA5zE6nLeyZP5Guv6o52f4tx+AGiMJ3cw5+ujJgMqz7+MfKMn9noE909FILgMmH8DneMYxcvAQ
+mUDcUWejKZSC+vDqSrXWcdC19+cB0dhCe1ICdNJFecXVvinxJlnPt3kibAUOJZLRIZiiZg6ZV6z
BoCXLf0rc3NvxXZbGoa3+xXqcR/cV8b4jPg63NIkAxgBXKKZnrVBgsKmLvrjHput3Ox9+C/FyK1t
oTW4d0X0KbFGhqAHSw==
--000000000000c7dc6805e1b538d3--
