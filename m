Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B386373F1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706F10E6A8;
	Thu, 24 Nov 2022 08:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132F10E6A8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:31:27 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id v128so864807vsb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nqkIoTahfJM/Upg/gdOrONhqr0PADZSJNncZsa4RrEQ=;
 b=hWZOlaGP9Qo2AI3Fe5dexE/3lmY/Kwo7K2MpIiNVbpVlSuEtkcv2oVyQQbrnlojM6j
 vnH/pD0F1JmX3qbvtbHGk6rpbVh/e02n1d/1XLw6ZlLZ26xINQPjBgG3+zQRj8iv2kr8
 vpNvLSTv2xtvH3VGQ55Uy6+3fqxJhdncU8hkPSXzbJkvTQoRnum4hEP4pNQI9JSDeHnI
 wqWmztPvEmq/7A529fYvvAppduKXDd3I6WPW3cHGoJx6SHPgR5U+tBSQwdowxC24MXgc
 UGwhfN9XHL8jpcjw0hZmRG1FT+K/DD530PqDC69m4XwdcJw3gHC7hD+RMFwpwfuGQwxW
 CS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nqkIoTahfJM/Upg/gdOrONhqr0PADZSJNncZsa4RrEQ=;
 b=0Bo1LCNvZYmxNyg6xBuXsfO6fnKC/tzZC9dXOPiDqrtvEX1VMktuJba47fMrKqmNOb
 VuQYHph8gHxEAtT3CCCQ4fAQKKJX0mWcqIlnPne/DowB4xuSSXgwXVzXVHYUawU34ok8
 rtE+FfT0jdRwxqMhL/9G1HRHRiJPsGD3USknSmJF5qIHsNvXHFStEsSY4lDXUqFcWeI7
 SmDdELryl/BJ9lYM4B86gRiYRLrwiZfSfRABA8GUgkzXtT55vDNLF90PF/re0nfqVwK8
 fEq2kQwmpu47aWGFUgPW7Y/J6jCpRPQa3S1jR5hxKW40yvKN5P7S5VVcuodMw7Gq9gg8
 iRVA==
X-Gm-Message-State: ANoB5plnh+p3BCFHiqOw2XeWJGvD6t2k80oIscHdNqTgryFJNH33jG2v
 28mJ0bibLVmu6YljrrjHUrFbNcRqMIvoYLj3ntlFKA==
X-Google-Smtp-Source: AA0mqf5HLXx/+xnIsJ4INeKyRQRDw5F+3IFrspoENoyTgQ/Vw1VXQ/wbPnCZCJA9sF+cNiML7lSO0r7e+9DGFoqK77M=
X-Received: by 2002:a05:6102:c0d:b0:3af:2b1c:9908 with SMTP id
 x13-20020a0561020c0d00b003af2b1c9908mr19487383vss.18.1669278686319; Thu, 24
 Nov 2022 00:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
From: David Gow <davidgow@google.com>
Date: Thu, 24 Nov 2022 16:31:14 +0800
Message-ID: <CABVgOSmtiPMd+GB40_o=eDPg3cKVA3qPNbbYFoRJvJRxQBDj5A@mail.gmail.com>
Subject: Re: [PATCH 00/24] drm: Introduce Kunit Tests to VC4
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000256ca905ee333bcf"
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
Cc: linux-kselftest@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000256ca905ee333bcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 11:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> This series introduce Kunit tests to the vc4 KMS driver, but unlike what =
we
> have been doing so far in KMS, it actually tests the atomic modesetting c=
ode.
>
> In order to do so, I've had to improve a fair bit on the Kunit helpers al=
ready
> found in the tree in order to register a full blown and somewhat function=
al KMS
> driver.
>
> It's of course relying on a mock so that we can test it anywhere. The moc=
king
> approach created a number of issues, the main one being that we need to c=
reate
> a decent mock in the first place, see patch 22. The basic idea is that I
> created some structures to provide a decent approximation of the actual
> hardware, and that would support both major architectures supported by vc=
4.
>
> This is of course meant to evolve over time and support more tests, but I=
've
> focused on testing the HVS FIFO assignment code which is fairly tricky (a=
nd the
> tests have actually revealed one more bug with our current implementation=
). I
> used to have a userspace implementation of those tests, where I would cop=
y and
> paste the kernel code and run the tests on a regular basis. It's was obvi=
ously
> fairly suboptimal, so it seemed like the perfect testbed for that series.
>
> Let me know what you think,
> Maxime
>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Ma=C3=ADra Canal <mairacanal@riseup.net>
> Cc: Brendan Higgins <brendan.higgins@linux.dev>
> Cc: David Gow <davidgow@google.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---

Hi Maxime,

Thanks very much for this! I'm really excited to see these sorts of
tests being written.

I was able to successfully run these under qemu with:
./tools/testing/kunit/kunit.py run --kunitconfig
drivers/gpu/drm/vc4/tests --arch arm64
--cross_compile=3Daarch64-linux-gnu-
(and also with clang, using --make_options LLVM=3D1 instead of the
--cross_compile flag)

On the other hand, they don't compile as a module:
ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/vc4/tests/vc4_m=
ock.o
ERROR: modpost: missing MODULE_LICENSE() in
drivers/gpu/drm/vc4/tests/vc4_mock_crtc.o
ERROR: modpost: missing MODULE_LICENSE() in
drivers/gpu/drm/vc4/tests/vc4_mock_output.o
ERROR: modpost: missing MODULE_LICENSE() in
drivers/gpu/drm/vc4/tests/vc4_mock_plane.o
ERROR: modpost: missing MODULE_LICENSE() in
drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.o
ERROR: modpost: missing MODULE_LICENSE() in
drivers/gpu/drm/tests/drm_managed_test.o
ERROR: modpost: "vc4_drm_driver"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "vc5_drm_driver"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "drm_kunit_helper_alloc_device"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "__drm_kunit_helper_alloc_drm_device_with_driver"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "__vc4_hvs_alloc"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "vc4_dummy_plane"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "vc4_mock_pv" [drivers/gpu/drm/vc4/tests/vc4_mock.ko] undef=
ined!
ERROR: modpost: "vc4_dummy_output"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
ERROR: modpost: "vc4_kms_load" [drivers/gpu/drm/vc4/tests/vc4_mock.ko]
undefined!
ERROR: modpost: "vc4_txp_crtc_data"
[drivers/gpu/drm/vc4/tests/vc4_mock.ko] undefined!
WARNING: modpost: suppressed 17 unresolved symbol warnings because
there were too many)

Most of those are just the need to export some symbols. There's some
work underway to support conditionally exporting symbols only if KUnit
is enabled, which may help:
https://lore.kernel.org/linux-kselftest/20221102175959.2921063-1-rmoar@goog=
le.com/

Otherwise, I suspect the better short-term solution would just be to
require that the tests are built-in (or at least compiled into
whatever of the drm/vc4 modules makes most sense).

The only other thing which has me a little confused is the naming of
some of the functions, specifically with the __ prefix. Is it just for
internal functions (many of them aren't static, but maybe they could
use the VISIBLE_IF_KUNIT macro if that makes sense), or for versions
of functions which accept extra arguments? Not a big deal (and maybe
it's a DRM naming convention I'm ignorant of), but I couldn't quite
find a pattern on my first read through.

But on the whole, these look good from a KUnit point-of-view. It's
really to see some solid mocking and driver testing, too. There would
be ways to avoid passing the 'struct kunit' around in more places (or
to store extra data as a kunit_resource), but I think it's better
overall to pass it around like you have in this case -- it's certainly
more compatible with things which might span threads (e.g. the
workqueues).

Thanks a bunch,
-- David

--000000000000256ca905ee333bcf
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
N0A3bgltvER3q1cGraQJMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAxS21FdvRtCQVc
jgEj+xxSnUr0N9reJlI5J9zRiBCWGxm5yhz965IDka3XVFEbj+beJj/gyHoxbaTGf2AjOufpcMqy
p4mtqc2l4Csudl8QeiBaOUDx4VKADbgxqpjvwD5zRpSKVj4S9y3BJi9xrRdPOm1Z2ZZYxRUxUz7d
2MXoxQsFucGJO5a4CwDBaGgJAqvwCXU5Q64rKVIUBk6mtcd3cDwX+PXqx4QrhHFGq6b6oi37YQ8B
+bhlXqlkLrbPlPFk+4Rh4EaW92iD5g8kvtXCOwvIIvs+15Io0dbpIe2W5UKo2OcyDDFvrOACmUOE
/GuEkhENcyDVyEs/4/N2u9WYMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABj4peqtakTCOMXLZ2mEqRMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCW
zdSv/PfuQvDHwNdZH2ByM6r5vevZTQHxen9TwIF1ETAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjExMjQwODMxMjZaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAbeZea/NihYTOj34Ng0Wq
dWCUJjwUNnljtMPBNPYf7sxoZZEPHg7vdPB5W2bwmRlaqe2H42b0g5wTLbDpqXJ6PFrMqAKmRW+l
oRVHsq92VjvBA1An1VYAyw7ieJ9rlDh6URPMb9e4d4M7T7dnzY9lI7aBB0g2wYzluTxIUxjUU+2N
zLSExF2ESOUgOeMgVz7OAGtBwI8yA/eUck6X6jG6/H1VX+Z7A0lgdkOBu+cb8IrcWjjT3m7TQPXJ
7MN42EG2TXu1XA6Q5ZS9enNYfCQUZ5Wqk/1RdntNZyhcNpqCSKKO9xdCigLJtNwgG2WGqekG99uq
JnfgkUYK29LD+3Q1sw==
--000000000000256ca905ee333bcf--
