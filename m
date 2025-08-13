Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A9B23E03
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 03:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254D510E19A;
	Wed, 13 Aug 2025 01:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5010E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 01:59:19 +0000 (UTC)
Received: from Jtjnmail201614.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202508130938445172;
 Wed, 13 Aug 2025 09:38:44 +0800
Received: from Jtjnmail201618.home.langchao.com (10.100.2.18) by
 Jtjnmail201614.home.langchao.com (10.100.2.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 09:38:44 +0800
Received: from Jtjnmail201618.home.langchao.com ([fe80::e8a5:9069:4c1e:2304])
 by Jtjnmail201618.home.langchao.com ([fe80::e8a5:9069:4c1e:2304%10])
 with mapi id 15.01.2507.057; Wed, 13 Aug 2025 09:38:44 +0800
From: =?utf-8?B?R2FyeSBDaHUo5qWa5YWJ5bqGKQ==?= <chuguangqing@inspur.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?R2FyeSBDaHUo5qWa5YWJ5bqGKQ==?= <chuguangqing@inspur.com>
Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Thread-Topic: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Thread-Index: AdwL8vDUZJsVsPvWGUG6xf+62139XQ==
Date: Wed, 13 Aug 2025 01:38:44 +0000
Message-ID: <5863c61a424545119df8ccb28dc1dbf8@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [182.45.253.54]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_005F_01DC0C36.0DD98A00"
MIME-Version: 1.0
tUid: 2025813093844534e90f04f7dbd728239cde6c5e78c56
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

------=_NextPart_000_005F_01DC0C36.0DD98A00
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Thomas

This is what I've done in the yhgch_drm driver.
See the link below:
https://lore.kernel.org/all/20250808053508.52202-1-chuguangqing@inspur.com/T/#t

In fact, through modifications in Patch v2, it allows only the selection of 
DRM_VRAM_HELPER in the driver.
See the link below:
https://lore.kernel.org/all/20250729060728.82402-1-chuguangqing@inspur.com/T/#m3e33f8e155275ea548223c21777c191ecd392159

Best regards
Chuguangqing

> From: Thomas Zimmermann <tzimmermann@suse.de>
> To:chuguangqing <chuguangqing@inspur.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
>
> Hi
>
> Am 29.07.25 um 08:07 schrieb chuguangqing:
> > We encountered the following errors while compiling drm_vram_helper.ko
> >
> > ERROR: modpost: "drm_gem_ttm_print_info"
> [drivers/gpu/drm/drm_vram_helper.ko] undefined!
> > ERROR: modpost: "drm_gem_ttm_mmap"
> [drivers/gpu/drm/drm_vram_helper.ko] undefined!
> >
> > The functions drm_gem_ttm_mmap and drm_gem_ttm_print_info are
> defined in drm_gem_ttm_helper.c. This patch adds drm_gem_ttm_helper.o to
> DRM_VRAM_HELPER to resolve the undefined symbol errors.
>
> You need to select DRM_TTM_HELPER for your driver.
>
> Best regards
> Thomas
>
> >
> > Signed-off-by: chuguangqing <chuguangqing@inspur.com>
> > ---
> >   drivers/gpu/drm/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile index
> > 4dafbdc8f86a..abbe32ddf6d0 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -125,7 +125,7 @@ drm_suballoc_helper-y := drm_suballoc.o
> >   obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
> >
> >   drm_vram_helper-y := drm_gem_vram_helper.o
> > -obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
> > +obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
> > +drm_gem_ttm_helper.o
> >
> >   drm_ttm_helper-y := drm_gem_ttm_helper.o
> >   drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) +=
> drm_fbdev_ttm.o
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB
> 36809 (AG Nuernberg)
>


------=_NextPart_000_005F_01DC0C36.0DD98A00
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
SIb3DQMHMB0GA1UdDgQWBBQRC/IegXfBTn5cZmp9COa0bolxUDAfBgNVHSMEGDAWgBReWQOmtExY
YJFO9h61pTmmMsE1ajCCAQ8GA1UdHwSCAQYwggECMIH/oIH8oIH5hoG6bGRhcDovLy9DTj1JTlNQ
VVItQ0EsQ049SlRDQTIwMTIsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNl
cnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9tZSxEQz1sYW5nY2hhbyxEQz1jb20/Y2VydGlm
aWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50
hjpodHRwOi8vSlRDQTIwMTIuaG9tZS5sYW5nY2hhby5jb20vQ2VydEVucm9sbC9JTlNQVVItQ0Eu
Y3JsMIIBLAYIKwYBBQUHAQEEggEeMIIBGjCBsQYIKwYBBQUHMAKGgaRsZGFwOi8vL0NOPUlOU1BV
Ui1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29u
ZmlndXJhdGlvbixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9jQUNlcnRpZmljYXRlP2Jhc2U/
b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTBkBggrBgEFBQcwAoZYaHR0cDovL0pU
Q0EyMDEyLmhvbWUubGFuZ2NoYW8uY29tL0NlcnRFbnJvbGwvSlRDQTIwMTIuaG9tZS5sYW5nY2hh
by5jb21fSU5TUFVSLUNBKDEpLmNydDApBgNVHSUEIjAgBggrBgEFBQcDAgYIKwYBBQUHAwQGCisG
AQQBgjcKAwQwNQYJKwYBBAGCNxUKBCgwJjAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDAMBgorBgEE
AYI3CgMEMEsGA1UdEQREMEKgJwYKKwYBBAGCNxQCA6AZDBdjaHVndWFuZ3FpbmdAaW5zcHVyLmNv
bYEXY2h1Z3VhbmdxaW5nQGluc3B1ci5jb20wUAYJKwYBBAGCNxkCBEMwQaA/BgorBgEEAYI3GQIB
oDEEL1MtMS01LTIxLTE2MDY5ODA4NDgtNzA2Njk5ODI2LTE4MDE2NzQ1MzEtNTYwNDA2MA0GCSqG
SIb3DQEBCwUAA4IBAQBDRhwc9Cfe5n65yxddOeEDQbNITPIjt/Q+Mf0KqzH+d4IcHt7HNA8ZhrOp
YQJiFgjJY9eOo4+lABBfQTWVK3MrIiBTzf1MB8MRXnLKR1+FhZkDj+NRQdKDV6L1rcO+RsCJrLM2
1MGkhqFlpXCHxlyPt+T18YSXSD0ceJ5QpQ3A+/N2p+OTxezHL5GqPSJT051H43ikZC5xCpZMWafu
B0GyyrLlvvzet4Ko76Y4jWDL61EEakexUR9RgPcPhYFHiNf9f3wi3fc1AW0J1smh+3rm9INI+6Xx
/g6gEHmIeBWZfODTrhP6FGMlMMJlLQoSAZbPBadhUnssKKTWgy5rT4qUMYIDkzCCA48CAQEwcDBZ
MRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDASBgoJkiaJ
k/IsZAEZFgRob21lMRIwEAYDVQQDEwlJTlNQVVItQ0ECE34AAkSWdsZNK1EPE5IAAQACRJYwCQYF
Kw4DAhoFAKCCAfgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
ODEzMDEzODQxWjAjBgkqhkiG9w0BCQQxFgQUM9r+5oFD35dAisBthhT+2JHCSxowfwYJKwYBBAGC
NxAEMXIwcDBZMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8x
FDASBgoJkiaJk/IsZAEZFgRob21lMRIwEAYDVQQDEwlJTlNQVVItQ0ECE34AAkSWdsZNK1EPE5IA
AQACRJYwgYEGCyqGSIb3DQEJEAILMXKgcDBZMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZIm
iZPyLGQBGRYIbGFuZ2NoYW8xFDASBgoJkiaJk/IsZAEZFgRob21lMRIwEAYDVQQDEwlJTlNQVVIt
Q0ECE34AAkSWdsZNK1EPE5IAAQACRJYwgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASow
CwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYI
KoZIhvcNAwICAUAwBwYFKw4DAhowCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAKfH83KW4U5/TTcAoGnATJ1CnmrFGn4kxlekMGC5t+ezGjXam
+hT5NSIIXckxtdB5V6mGamsLOa7qCXORSQ5ALn095U6R3VhiexCkV1XOU/kenXqATGad3mcbcdNG
A/m32ECtPA+ZB8gqV1QbHvUqZvKQG6jH7Z4FC6gQ3tWLlliBFxs2xU3+e1JxZs8JQLbWmuJa7clq
R+LJFv9Xu90ZpLXMPTISCQtNlAUG0BdSfE8Y9Fv6KKXcEDycaCTHOtSX6nwMVWIg5CSvmdh74X6J
FoW3n1tDN6aeZJQpBuw6qsKlO8LPRUH5yoDXcYm9SmwtI1JMsyRLEpzULH0rM3y9mQAAAAAAAA==

------=_NextPart_000_005F_01DC0C36.0DD98A00--
