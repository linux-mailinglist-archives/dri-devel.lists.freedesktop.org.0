Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9916687E2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00D6893D5;
	Mon, 15 Jul 2019 11:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A933C893D5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:09:27 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 04:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; 
 d="p7s'?scan'208";a="342355820"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
 by orsmga005.jf.intel.com with ESMTP; 15 Jul 2019 04:09:25 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.164]) by
 irsmsx110.ger.corp.intel.com ([169.254.15.82]) with mapi id 14.03.0439.000;
 Mon, 15 Jul 2019 12:09:24 +0100
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "rodrigosiqueiramelo@gmail.com"
 <rodrigosiqueiramelo@gmail.com>, "contact@emersion.fr" <contact@emersion.fr>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] drm/vkms: Introduce basic support for configfs
Thread-Topic: [PATCH 0/2] drm/vkms: Introduce basic support for configfs
Thread-Index: AQHVL7x4YveMo9okKkWw2xwRMcGVLqbEEe8AgAI71oCABT2CgA==
Date: Mon, 15 Jul 2019 11:09:24 +0000
Message-ID: <d7300673f3fbb10331080b751aa4e9a7ec8f56f8.camel@intel.com>
References: <cover.1561950553.git.rodrigosiqueiramelo@gmail.com>
 <20190710170116.GB15868@phenom.ffwll.local>
 <20190712030757.a7sp5xmyzyt24i4e@smtp.gmail.com>
In-Reply-To: <20190712030757.a7sp5xmyzyt24i4e@smtp.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.161]
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0412594757=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0412594757==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-XsNIlUTdmdRPnnB0v0Ef"

--=-XsNIlUTdmdRPnnB0v0Ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-12 at 00:07 -0300, Rodrigo Siqueira wrote:
> On 07/10, Daniel Vetter wrote:
> > On Mon, Jul 01, 2019 at 12:23:39AM -0300, Rodrigo Siqueira wrote:
> > > This patchset introduces the support for configfs in vkms by
> > > adding a
> > > primary structure for handling the vkms subsystem and exposing
> > > connectors as a use case.  This series allows enabling/disabling
> > > virtual
> > > and writeback connectors on the fly. The first patch of this
> > > series
> > > reworks the initialization and cleanup code of each type of
> > > connector,
> > > with this change, the second patch adds the configfs support for
> > > vkms.
> > > It is important to highlight that this patchset depends on
> > > https://patchwork.freedesktop.org/series/61738/.
> > >=20
> > > After applying this series, the user can utilize these features
> > > with the
> > > following steps:
> > >=20
> > > 1. Load vkms without parameter
> > >=20
> > >   modprobe vkms
> > >=20
> > > 2. Mount a configfs filesystem
> > >=20
> > >   mount -t configfs none /mnt/
> > >=20
> > > After that, the vkms subsystem will look like this:
> > >=20
> > > vkms/
> > >  |__connectors
> > >     |__Virtual
> > >         |__ enable
> > >=20
> > > The connectors directories have information related to
> > > connectors, and
> > > as can be seen, the virtual connector is enabled by default.
> > > Inside a
> > > connector directory (e.g., Virtual) has an attribute named
> > > =E2=80=98enable=E2=80=99
> > > which is used to enable and disable the target connector. For
> > > example,
> > > the Virtual connector has the enable attribute set to 1. If the
> > > user
> > > wants to enable the writeback connector it is required to use the
> > > mkdir
> > > command, as follows:
> > >=20
> > >   cd /mnt/vkms/connectors
> > >   mkdir Writeback
> > >=20
> > > After the above command, the writeback connector will be enabled,
> > > and
> > > the user could see the following tree:
> > >=20
> > > vkms/
> > >  |__connectors
> > >     |__Virtual
> > >     |   |__ enable
> > >     |__Writeback
> > >         |__ enable
> > >=20
> > > If the user wants to remove the writeback connector, it is
> > > required to
> > > use the command rmdir, for example
> > >=20
> > >   rmdir Writeback
> > >=20
> > > Another way to enable and disable a connector it is by using the
> > > enable
> > > attribute, for example, we can disable the Virtual connector
> > > with:
> > >=20
> > >   echo 0 > /mnt/vkms/connectors/Virtual/enable
> > >=20
> > > And enable it again with:
> > >=20
> > >   echo 1 > /mnt/vkms/connectors/Virtual/enable
> > >=20
> > > It is important to highlight that configfs 'obey' the parameters
> > > used
> > > during the vkms load and does not allow users to remove a
> > > connector
> > > directory if it was load via module parameter. For example:
> > >=20
> > >   modprobe vkms enable_writeback=3D1
> > >=20
> > > vkms/
> > >  |__connectors
> > >     |__Virtual
> > >     |   |__ enable
> > >     |__Writeback
> > >         |__ enable
> > >=20
> > > If the user tries to remove the Writeback connector with =E2=80=9Crmd=
ir
> > > Writeback=E2=80=9D, the operation will be not permitted because the
> > > Writeback
> > > connector was loaded with the modules. However, the user may
> > > disable the
> > > writeback connector with:
> > >=20
> > >   echo 0 > /mnt/vkms/connectors/Writeback/enable
>=20
> Thanks for detail this issue, I just have some few questions inline.
> =20
> > I guess I should have put a warning into that task that step one is
> > designing the interface. Here's the fundamental thoughts:
> >=20
> > - The _only_ thing we can hotplug after drm_dev_register() is a
> >   drm_connector. That's an interesting use-case, but atm not really
> >   supported by the vkms codebase. So we can't just enable/disable
> >   writeback like this. We also can't change _anything_ else in the
> > drm
> >   driver like this.
>=20
> In the first patch of this series, I tried to decouple enable/disable
> for virtual and writeback connectors; I tried to take advantage of
> drm_connector_[register/unregister] in each connector. Can we use the
> first patch or it doesn't make sense?
>=20
> I did not understand why writeback connectors should not be
> registered
> and unregister by calling drm_connector_[register/unregister], is it
> a
> writeback or vkms limitation? Could you detail why we cannot change
> connectors as I did?

Hi,

I guess, some more stuff should happen during the hotplug, like
drm_kms_helper_hotplug_event()?

>=20
> Additionally, below you said "enable going from 1 -> 0, needs to be
> treated like a physical hotunplug", do you mean that we first have to
> add support for drm_dev_plug and drm_dev_unplug in vkms?
> =20
> > - The other bit we want is support multiple vkms instances, to
> > simulate
> >   multi-gpus and fun stuff like that.
>=20
> Do you mean something like this:
>=20
> configfs/vkms/instance1
> > _enable_device=20
> > _more_stuff
> configfs/vkms/instance2
> > _enable_device
> > _more_stuff
> configfs/vkms/instanceN
> > _enable_device
> > _more_stuff

I think it would be a good idea. This way the creation of new device
could look like this:

mkdir -p instanceN/connector/virtual0
echo "virtual" > instanceN/connector/virtual0/type
echo 1 > instanceN/connector/virtual0/enable
mkdir -p instanceN/crtc/crtc0
...
echo 1 > instanceN/enable

Once the last command is executed, the whole instanceN/ becomes
immutable, except for
 - instanceN/enable, so we can later disable it
 - instanceN/connector, where we can create new connectors, it would be
treated as a hotplug.

>=20
> Will each instance work like a totally independent device? What is
> the
> main benefit of this? I can think about some use case for testing
> prime, but I cannot see other things.

We can test that userspace always select the right device to display.=20

> =20
> > - Therefore vkms configs should be at the drm_device level, so a
> >   directory under configfs/vkms/ represents an entire device.
> >=20
> > - We need a special config item to control
> >   drm_dev_register/drm_dev_unregister. While a drm_device is
> > registers,
> >   all other config items need to fail if userspace tries to change
> > them.
> >   Maybe this should be a top-level "enable" property.
> >=20
> > - Every time enable goes from 0 -> 1 we need to create a completely
> > new
> >   vkms instance. The old one might still be around, waiting for the
> > last
> >   few references to disappear.
> >=20
> > - enable going from 1 -> 0 needs to be treated like a physical
> > hotunplug,
> >   i.e. not drm_dev_unregister but drm_dev_unplug. We also need to
> > annotate
> >   all the vkms code with drm_dev_enter/exit() as the kerneldoc of
> >   drm_dev_unplug explains.
> >=20
> > - rmdir should be treated like enable going from 1 -> 0. Or maybe
> > we
> >   should disable enable every going from 1 -> 0, would propably
> > simplify
> >   everything.
> >=20
> > - The initial instance created at module load also neeeds to be
> > removable
> >   like this.
> >=20
> > Once we have all this, then can we start to convert driver module
> > options
> > over to configs and add cool features. But lots of infrastructure
> > needed
> > first.
> >=20
> > Also, we probably want some nasty testcases which races an rmdir in
> > configfs against userspace still doing ioctl calls against vkms.
> > This is
> > ideal for validation the hotunplug infrastructure we have in drm.
> >=20
> > An alternative is adding connector hotplugging. But I think before
> > we do
> > that we need to have support for more crtc and more connectors as
> > static
> > module options. So maybe not a good starting point for configfs.
>=20
> So, probably the first set of tasks should be:
>=20
> 1. Enable multiple CRTC via module parameters. For example:
>   modprobe vkms crtcs=3D13
> 2. Enable multiple connectors via module parameters. For example:
>   modprobe vkms crtcs=3D3 connector=3D3 // 3 virtual connectors per crtc

But do we want to have those parameters as module options, if we then
plan to replace those with configfs? =20

>=20
> Thanks again,
> =20
> > The above text should probably be added to the vkms.rst todo item
> > ...
> > -Daniel
> >=20
> > >=20
> > > Rodrigo Siqueira (2):
> > >   drm/vkms: Add enable/disable functions per connector
> > >   drm/vkms: Introduce configfs for enabling/disabling connectors
> > >=20
> > >  drivers/gpu/drm/vkms/Makefile         |   3 +-
> > >  drivers/gpu/drm/vkms/vkms_configfs.c  | 229
> > > ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/vkms/vkms_drv.c       |   6 +
> > >  drivers/gpu/drm/vkms/vkms_drv.h       |  17 ++
> > >  drivers/gpu/drm/vkms/vkms_output.c    |  84 ++++++----
> > >  drivers/gpu/drm/vkms/vkms_writeback.c |  31 +++-
> > >  6 files changed, 332 insertions(+), 38 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> > >=20
> > > --=20
> > > 2.21.0
> > >=20
> > >=20
> > > --=20
> > > Rodrigo Siqueira
> > > https://siqueira.tech
> >=20
> > --=20
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
--=20
Oleg Vasilev <oleg.vasilev@intel.com>
Intel Corporation

--=-XsNIlUTdmdRPnnB0v0Ef
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MTUxMTA5MjNaMCMGCSqGSIb3DQEJBDEWBBT0Zrn8
wZvssji9MS59TL82S2P7dzANBgkqhkiG9w0BAQEFAASCAQBC6GD9uzx6Huzknvr0HjUYSf6gRst7
dz9rUV7GxCiBFehcaCUhnRCq6w0vsDl1/QUV9zTsKRIcHKHYgL5kUwohHQXZJ9dRknhZ495W873X
QNeiNml9EAOd6NzEeNfqeCCMXFddaXx3Wa0n5G4SHAyUhJrRlwVcClX1GFyBjRaTrR0gCBenDc1U
X0ta1Lk79IZXpZ3P7DpBOo+iVJX+nJcQlKZjjotl2pH3+FRT54Cbk9L3KXt6MsVApBvZXTO9Jc6I
AYIl2ht8U9slFLG77LNSxeamnyRhDix10JHPg/UnC1ft+Axd/BkfKgPOKNIaVF72+2zPitsfO8dI
ToMs2BU+AAAAAAAA


--=-XsNIlUTdmdRPnnB0v0Ef--

--===============0412594757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0412594757==--
