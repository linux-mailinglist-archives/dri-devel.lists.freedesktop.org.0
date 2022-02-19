Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72624BC6D9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 09:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B587710EF7F;
	Sat, 19 Feb 2022 08:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004A410F080
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 08:00:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso7934049wme.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wuyYQjgmW3zHTKsYq+dZzLaUwaB5smOROQWIsbjUqwE=;
 b=r8eobeYUMkPe7i0nI4Hmu069452DIROw0dI83JI/X9hu4qDnx8wKZNsBTY41P/iSED
 r0FWbLKpiXFmXrFU2yUvM1LQsxXAJrOQgvmx0OJG7ipRML3iuLdITCCARVH2wrmcZEK5
 mwCwhdBL08+3LbjsAZ4T6n9E2b0HHYYXM73WvR7aot8IIOXH57IvZjTEjeKwv8RtKiqn
 AeSWpiJlL9Ihub0GV/tU5xcr4GnA0iMNtyQT/kTNha9SNXOxxvnScg0fzTjk6ddJE+5a
 vi+NNfuvfMEPIXbG9Wqtj+Amlgp3j+q0PkFoiX1Y4TCsXu1M9TDSaTRLuRx9JyrPPbyI
 0qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wuyYQjgmW3zHTKsYq+dZzLaUwaB5smOROQWIsbjUqwE=;
 b=xZjrvtLYXkCJBauRBYMASrnUSBJrF7J4lfYVO0gOWKdD4WkM8IsF2Oyl+GW1Gsu5eb
 3nFPwS3RAViDQiNv9JilukYlgq6i4jdspBk6HNDZd/NAx67l2FKw9EdzdELWG+eBspqQ
 o7aFTW4QxtFozhu9bVFU9MSAX5ntigTxrm7Rz0jYtl9t0UJzxx+D4zbUUtydCEOiaytC
 zrvlHEZ1IKD3MUlBYv0rATbeabfClUD/VvJQzsP5sXUI2AqhmazUm8cq/7mGeqSAUXzq
 Gc6GUcIgGtPNAiNbDxFzQrzV7icZALcxozCMaVwvuv6vboXGtYL4ZmHEo0e4A/T601pg
 KnUw==
X-Gm-Message-State: AOAM530JgPx0qDsoqieJdC7djP2Ebhf1h3v7bVgLSGhNGnD3I9+65Zfz
 fqXch4iDHeM7CvtoQwRd/p/Rn9jKUFhNIs6z4dHbvQ==
X-Google-Smtp-Source: ABdhPJzbJOrM/2OLBtDRNHfACqh08uaaCdcmb5NeBmC69hAFuvYRavqZoqsRXsCrlc74PcOn8wHgcFrPuLcM4oK0IOY=
X-Received: by 2002:a05:600c:215:b0:37c:729:f84d with SMTP id
 21-20020a05600c021500b0037c0729f84dmr9399022wmi.131.1645257615313; Sat, 19
 Feb 2022 00:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20220218075727.2737623-1-davidgow@google.com>
 <20220218075727.2737623-5-davidgow@google.com>
 <ac4c5f8c890e5bdd7ad7ecc04a51e72fa3ac1703.camel@sipsolutions.net>
In-Reply-To: <ac4c5f8c890e5bdd7ad7ecc04a51e72fa3ac1703.camel@sipsolutions.net>
From: David Gow <davidgow@google.com>
Date: Sat, 19 Feb 2022 16:00:04 +0800
Message-ID: <CABVgOSnBq0QE+Cq+SDeV-LxOQYbGZ6Bqbjix6h-UpNj0GMicPA@mail.gmail.com>
Subject: Re: [PATCH 4/4] kunit: tool: Disable broken options for --alltests
To: Johannes Berg <johannes@sipsolutions.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000bf40a305d85a6359"
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
Cc: x86@kernel.org, linux-rdma@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, linux-um <linux-um@lists.infradead.org>,
 dri-devel@lists.freedesktop.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 KUnit Development <kunit-dev@googlegroups.com>, felix.kuehling@amd.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000bf40a305d85a6359
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 8:26 PM Johannes Berg <johannes@sipsolutions.net> w=
rote:
>
> On Fri, 2022-02-18 at 15:57 +0800, David Gow wrote:
> >
> > Note that, while this does build again, it still segfaults on startup,
> > so more work remains to be done.
>
> That's probably just a lot more stuff getting included somehow?
>

Yeah: it used to work (a couple of years ago), but something has
broken it in the meantime. It's just a shame that bisecting things
with allyesconfig takes so long...

> > They are:
> > - CONFIG_VFIO_PCI: Needs ioport_map/ioport_unmap.
> > - CONFIG_INFINIBAND_RDMAVT: Needs cpuinfo_x86 and __copy_user_nocache
> > - CONFIG_BNXT: Failing under UML with -Werror
> > ERROR:root:../drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c: In functio=
n =E2=80=98bnxt_ptp_enable=E2=80=99:
> > ../drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:400:43: error: array s=
ubscript 255 is above array bounds of =E2=80=98struct pps_pin[4]=E2=80=99 [=
-Werror=3Darray-bounds]
> >   400 |                         ptp->pps_info.pins[pin_id].event =3D BN=
XT_PPS_EVENT_EXTERNAL;
> >       |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~
> > - CONFIG_PATA_CS5535: Needs MSR access (__tracepoint_{read,write}_msr)
> > - CONFIG_VDPA: Enables CONFIG_DMA_OPS, which is unimplemented. ('dma_op=
s' is not defined)
> >
> > These are all issues which should be investigated properly and the
> > corresponding options either fixed or disabled under UML. Having this
> > list of broken options should act as a good to-do list here, and will
> > allow these issues to be worked on independently, and other tests to
> > work in the meantime.
> >
>
> I'm not really sure it makes sense to even do anything other than
> disabling these.
>
> It looks like all of them are just exposed by now being able to build
> PCI drivers on UML. Surely the people writing the driver didn't expect
> their drivers to run over simulated PCI (which is what the UML PCI
> support is all about).
>
> Now from a PCI driver point of view you can't really tell the difference
> (and anyway the driver won't be probed), but the issues (at least the
> build time ones) come from having
>
>     UML && PCI && X86_64
>
> or
>
>     UML && PCI && X86_32
>
> because drivers typically depend on X86_64 or X86_32, rather than on
> "X86 && X86_64" or "X86 && X86_32". In a sense thus, the issue is those
> drivers don't know that "!X86 && (X86_32 || X86_64)" can happen (with
> UML).
>
>
> Now you could say that's the driver bug, or you could say that they
> should just add "depends on !UML" (though that's basically equivalent to
> adding "depends on X86" and the latter may be preferable in some cases).
>
> Or actually in the three patches you have (1-3) it's in the code, but
> same thing, you can either add && !UML (like you did) or add && X86.
>

I didn't realise X86 wasn't defined in UML: that's definitely a bit
cleaner than !UML in a number of these cases.

Not all of those issues are fundamentally solved by "depends on X86",
though: there are a few which might be other missing things in UML
(maybe the 'dma_ops' issues?), and/or might be the result of -Werror
being enabled.

>
> Arguably, however, building PCI drivers by default is somewhat
> questionable in the first place?

We do want the ability to build PCI drivers under UML, as it makes
running KUnit tests for PCI drivers much simpler and more pleasant.
And indeed, it does work for KUnit in general, it's just that some
drivers do have the issues mentioned above, so allyesconfig picks up
every broken driver.

We don't actually build the PCI drivers by default, only if the
"--alltests" option is passed, which does include them, as we do have
tests which depend on PCI we'd like to run (like the thunderbolt
test).

>
> So maybe you should just add
>
>     # CONFIG_UML_PCI_OVER_VIRTIO is not set
>
> to the broken_on_uml.config since it exposes all these issues, and
> really is not very useful since you're not going to actually run with
> any simulated PCI devices anyway, so drivers will not be probed.

I did try this as well, and it just got us a different set of issues
(there are a bunch of drivers which depend on IOMEM but don't state it
-- I'll try to send fixes for those out next week). And we'd lose
things like the thunderbolt test if PCI

Ultimately, the 'broken_on_uml.config' file is just there to pare back
allyesconfig a bit for KUnit's purposes, but we still definitely want
as many options (and hence tests) enabled as possible long-term. So I
think actual fixes to either the code or Kconfig do make sense.

Is 'make ARCH=3Dum allyesconfig' something we actually want to be able
to build? If so, no amount of adding things to KUnit's
broken_on_uml.config will solve the underlying issues, and we'll need
to at least update the Kconfig entries.

Cheers,
-- David

--000000000000bf40a305d85a6359
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
MDIwAhABQeVybOOpR4bOOXZYL5T3MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCC1
hK5mkWbXD3kQGhQArPS3EpKnqjuOZpFfFWnAx7DK6DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjAyMTkwODAwMTVaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAjnpewcuZUJVS6VIu0yi4
03UYYnjQhPEECv0bhdeu4hsYPRtRxIiCLf3pHo16X6hgQixHb8uSkg5VJDcLfSKM6CCkOQLj8Zt8
tZ1qXXWuD2yF+nWgcW0zHG9zpfGy2g5v0H3e4z3XswHVBQdgFcsY/N2v/m+7FlSlIKp4eKHVUyWQ
QDocj2QwLwrPTzvToOVgfvnPDNf3CuMwA80C7v9WEX/syUDQMaQSWCyfuxTiaUHfBdvRCGgZt+M7
XGmNI+IWcxeYhj5xZo4LWkK8APgeCTs5d+MhF0JpZK1QqJnb9rWSjyf7hOJdwPpedIOyrjQDfmbx
pB+HTOm+2IxT/N2jYA==
--000000000000bf40a305d85a6359--
