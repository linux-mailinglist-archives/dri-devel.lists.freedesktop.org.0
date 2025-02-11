Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B2A30599
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9216310E223;
	Tue, 11 Feb 2025 08:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 17125 seconds by postgrey-1.36 at gabe;
 Tue, 11 Feb 2025 08:18:32 UTC
Received: from mail-sg02.corpemail.net (mail-sg02.corpemail.net
 [128.199.154.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E90A10E223
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:18:32 +0000 (UTC)
Received: from ssh248.corpemail.net
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id JCZ00156;
 Tue, 11 Feb 2025 16:13:56 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 16:13:57 +0800
Received: from jtjnmail201607.home.langchao.com ([fe80::c5ea:abc2:7a50:1de9])
 by jtjnmail201607.home.langchao.com ([fe80::c5ea:abc2:7a50:1de9%8])
 with mapi id 15.01.2507.039; Tue, 11 Feb 2025 16:13:57 +0800
From: =?utf-8?B?Q2hhcmxlcyBIYW4o6Z+p5pil6LaFKQ==?= <hanchunchao@inspur.com>
To: "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "michal.simek@amd.com" <michal.simek@amd.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>, "vishal.sagar@amd.com"
 <vishal.sagar@amd.com>
Subject: =?utf-8?B?562U5aSNOiBbdjJdIGRybTogeGxueDogenlucW1wX2Rwc3ViOiBBZGQgTlVM?=
 =?utf-8?B?TCBjaGVja3MgaW4genlucW1wX2F1ZGlvX2luaXQoKQ==?=
Thread-Topic: [v2] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
Thread-Index: AQHbfFqDUG/O/LdoEku4p/UqcsYT7rNBwGJw
Date: Tue, 11 Feb 2025 08:13:57 +0000
Message-ID: <918c999b8e1b45989138bbd33c154b4c@inspur.com>
References: <c8ad55ccade09d4c181e51166535e55e11-2-25web.de@g.corp-email.com>
 <03681acf-9524-4fd1-b40d-a7cafe1c5572@web.de>
In-Reply-To: <03681acf-9524-4fd1-b40d-a7cafe1c5572@web.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [182.45.253.55]
Content-Type: multipart/signed; micalg=SHA1;
 protocol="application/x-pkcs7-signature";
 boundary="----=_NextPart_000_002D_01DB7C9F.E60393C0"
MIME-Version: 1.0
tUid: 2025211161356c9458b5b42758e501954083d7244cde3
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

------=_NextPart_000_002D_01DB7C9F.E60393C0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your suggestions. I will read these documents carefully.

-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Markus Elfring <Markus.Elfring@web.de>=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B42=E6=9C=8811=E6=97=A5 =
15:56
=E6=94=B6=E4=BB=B6=E4=BA=BA: Charles Han(=E9=9F=A9=E6=98=A5=E8=B6=85) =
<hanchunchao@inspur.com>; dri-devel@lists.freedesktop.org; =
linux-arm-kernel@lists.infradead.org
=E6=8A=84=E9=80=81: LKML <linux-kernel@vger.kernel.org>; David Airlie =
<airlied@gmail.com>; Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>; Maarten Lankhorst =
<maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; =
Michal Simek <michal.simek@amd.com>; Simona Vetter <simona@ffwll.ch>; =
Thomas Zimmermann <tzimmermann@suse.de>; Tomi Valkeinen =
<tomi.valkeinen@ideasonboard.com>; Vishal Sagar <vishal.sagar@amd.com>
=E4=B8=BB=E9=A2=98: Re: [v2] drm: xlnx: zynqmp_dpsub: Add NULL checks in =
zynqmp_audio_init()

=E2=80=A6
> Add NULL check in zynqmp_audio_init(), to handle kernel NULL pointer=20
> dereference error.

* Can it be more desirable to prevent such issues?

* Would the message subject have been nicer with a key word like =
=E2=80=9CPATCH=E2=80=9D
  (besides other refinements)?


=E2=80=A6
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
=E2=80=A6

Will you become more familiar with patch version descriptions?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pr=
eviously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n310

Regards,
Markus

------=_NextPart_000_002D_01DB7C9F.E60393C0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILJTCCA8kw
ggKxoAMCAQICEHiR8OF3G5iSSYrK6OtgewAwDQYJKoZIhvcNAQELBQAwWTETMBEGCgmSJomT8ixk
ARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTES
MBAGA1UEAxMJSU5TUFVSLUNBMB4XDTE3MDEwOTA5MjgzMFoXDTM0MDUxMTEyMjAwNFowWTETMBEG
CgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQB
GRYEaG9tZTESMBAGA1UEAxMJSU5TUFVSLUNBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAq+Q17xtjJLyp5hgXDie1r4DeNj76VUvbZNSywWU5zhx+e0Lu0kwcZ0T3KncZdgdWyqYvRJMQ
/VVqX3gS4VxtLw3zBrg9kGuD0LfpH0cA2b0ZHpxRh5WapP14flcSh/lnawig29z44wfUEg43yTZO
lOfPKos/Dm6wyrJtaPmD6AF7w4+vFZH0zMYfjQkSN/xGgS3OPBNAB8PTHM2sV+fFmnnlTFpyRg0O
IIA2foALZvjIjNdUfp8kMGSh/ZVMfHqTH4eo+FcZPZ+t9nTaJQz9cSylw36+Ig6FGZHA/Zq+0fYy
VCxR1ZLULGS6wsVep8j075zlSinrVpMadguOcArThwIDAQABo4GMMIGJMBMGCSsGAQQBgjcUAgQG
HgQAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBReWQOmtExYYJFO
9h61pTmmMsE1ajAQBgkrBgEEAYI3FQEEAwIBATAjBgkrBgEEAYI3FQIEFgQUJmGwrST2eo+dKLZv
FQ4PiIOniEswDQYJKoZIhvcNAQELBQADggEBAIhkYRbyElnZftcS7NdO0TO0y2wCULFpAyG//cXy
rXPdTLpQO0k0aAy42P6hTLbkpkrq4LfVOhcx4EWC1XOuORBV2zo4jk1oFnvEsuy6H4a8o7favPPX
90Nfvmhvz/rGy4lZTSZV2LONmT85D+rocrfsCGdQX/dtxx0jWdYDcO53MLq5qzCFiyQRcLNqum66
pa8v1OSs99oKptY1dR7+GFHdA7Zokih5tugQbm7jJR+JRSyf+PomWuIiZEvYs+NpNVac+gyDUDkZ
sb0vHPENGwf1a9gElQa+c+EHfy9Y8O+7Ha8IpLWUArNP980tBvO/TYYU6LMz07h7RyiXqr7fvEcw
ggdUMIIGPKADAgECAhN+AAC/VCtcoMk3ynmeAAAAAL9UMA0GCSqGSIb3DQEBCwUAMFkxEzARBgoJ
kiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkW
BGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQTAeFw0yMDA1MDkwMDM4MzJaFw0yNTA1MDgwMDM4MzJa
MIGoMRMwEQYKCZImiZPyLGQBGRYDY29tMRgwFgYKCZImiZPyLGQBGRYIbGFuZ2NoYW8xFDASBgoJ
kiaJk/IsZAEZFgRob21lMRUwEwYDVQQLDAzmtarmva7kv6Hmga8xDzANBgNVBAsMBueUqOaItzES
MBAGA1UEAwwJ6Z+p5pil6LaFMSUwIwYJKoZIhvcNAQkBFhZoYW5jaHVuY2hhb0BpbnNwdXIuY29t
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzm0yCuz4EQ3xxu11MjZDvWhjKBqOXHQq
WMG9kcf6SW0yQXtyQCGGputXc8oJ/n7XIfs96MZcphiKzLhIFkjkyvqlsCX6GqkcBd/98tDoIbq+
WDvPOrEYi/Sxsyh1Z9Ewn8EjK6jhBHCXq5FBgbxGjZLsHOYlWNrU17jSmPBszSTXXAMBrPTKpgHq
mWlZVDIuggE1ob3cZhymT8U8gQTES1sf0DzgHVXjLle1XZia/K/1Pa/W11Lh83GAmzmhqw5hCmPb
7zGmZCkjSjV0qVa/Q8OWjCAa23lLrEy8M/kZDroI1KubkC1fDdOO3NF1EpJx4oG4nnWJdsIf1vA8
rcS4fQIDAQABo4IDwzCCA78wPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUIgvKpH4SB13qGqZE9
hoD3FYPYj1yBSv2LJoGUp00CAWQCAWAwKQYDVR0lBCIwIAYIKwYBBQUHAwIGCCsGAQUFBwMEBgor
BgEEAYI3CgMEMAsGA1UdDwQEAwIFoDA1BgkrBgEEAYI3FQoEKDAmMAoGCCsGAQUFBwMCMAoGCCsG
AQUFBwMEMAwGCisGAQQBgjcKAwQwRAYJKoZIhvcNAQkPBDcwNTAOBggqhkiG9w0DAgICAIAwDgYI
KoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBT7zLhcTtRnG/DUzvnf
bTyU6LH+GjAfBgNVHSMEGDAWgBReWQOmtExYYJFO9h61pTmmMsE1ajCCAQ8GA1UdHwSCAQYwggEC
MIH/oIH8oIH5hoG6bGRhcDovLy9DTj1JTlNQVVItQ0EsQ049SlRDQTIwMTIsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9t
ZSxEQz1sYW5nY2hhbyxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVj
dENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hjpodHRwOi8vSlRDQTIwMTIuaG9tZS5sYW5nY2hh
by5jb20vQ2VydEVucm9sbC9JTlNQVVItQ0EuY3JsMIIBKQYIKwYBBQUHAQEEggEbMIIBFzCBsQYI
KwYBBQUHMAKGgaRsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIw
U2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ob21lLERDPWxhbmdjaGFv
LERDPWNvbT9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhv
cml0eTBhBggrBgEFBQcwAoZVaHR0cDovL0pUQ0EyMDEyLmhvbWUubGFuZ2NoYW8uY29tL0NlcnRF
bnJvbGwvSlRDQTIwMTIuaG9tZS5sYW5nY2hhby5jb21fSU5TUFVSLUNBLmNydDBJBgNVHREEQjBA
oCYGCisGAQQBgjcUAgOgGAwWaGFuY2h1bmNoYW9AaW5zcHVyLmNvbYEWaGFuY2h1bmNoYW9AaW5z
cHVyLmNvbTANBgkqhkiG9w0BAQsFAAOCAQEAMkzghq4SHO2Fi0jhZ+VOCkTi/CTHr498pTYAVLS0
sn5HIh5mWwendN0n32AyOhH6rsbFvddJ0fpH3B86HtXSc20xlnq902GTXbW//53nIGrZ4h/JQvyd
rEd/LXg7eg2MnGwRkF5+4FgA49bazD0rNDgrEWmJxZKw8AKtAbdPwxy1Ht1SnxmzK00VSG2z3SgI
0Jm9SSBrytasx8AtE28UXL3uda2/agWd7LsHcApmqPBkdBxS4WotiWyEJfYbU4KQhdSB+v8utqmB
akOC+gFarxuIilfCjNjh0b9jlTgRo5/vG6kpCUBiy1yiOQ9rTi6NjGzDfVCBJ745tySGx7xZYDGC
A5MwggOPAgEBMHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdj
aGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTESMBAGA1UEAxMJSU5TUFVSLUNBAhN+AAC/VCtcoMk3
ynmeAAAAAL9UMAkGBSsOAwIaBQCgggH4MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI1MDIxMTA4MTMzM1owIwYJKoZIhvcNAQkEMRYEFHxBFKHzFmx3Xwn+/bmj9g4X
EK0QMH8GCSsGAQQBgjcQBDFyMHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEYMBYGCgmSJomT8ixk
ARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTESMBAGA1UEAxMJSU5TUFVSLUNBAhN+
AAC/VCtcoMk3ynmeAAAAAL9UMIGBBgsqhkiG9w0BCRACCzFyoHAwWTETMBEGCgmSJomT8ixkARkW
A2NvbTEYMBYGCgmSJomT8ixkARkWCGxhbmdjaGFvMRQwEgYKCZImiZPyLGQBGRYEaG9tZTESMBAG
A1UEAxMJSU5TUFVSLUNBAhN+AAC/VCtcoMk3ynmeAAAAAL9UMIGTBgkqhkiG9w0BCQ8xgYUwgYIw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZI
hvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQME
AgIwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAF8ADHL4UjhGPFlG/c0SV4HXbzndGmdM
Oj0kj04sdK+vtep48Do2vpFY694iXN9X83gMtWOB2jvBwhavsqAMWly+O2OXoB7h56rJwueD8q3g
Opbn+FSdoxHyCeC9r5IeV3KwIe1x1XUyptE8sea2GXmKEbd6memM3VsGIcy7dpUMFIWQgtnKy3Lx
LR+iS8rMwq6j8Q56zyn6IryfbUxRhcdeDLclPbM2H6+/IjwYxWKUrukKvuRQirBWKWjwD3QtJRQ8
uThD91sjk8ZhKtGSxh05M220mZnacNTfgHu4H7Q8wlXdh11wJC6xl+Z/Who9hHzaulTxex7H1ZRO
tCeoiCsAAAAAAAA=

------=_NextPart_000_002D_01DB7C9F.E60393C0--
