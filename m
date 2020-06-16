Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B731FB27A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 15:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED6D6E8A7;
	Tue, 16 Jun 2020 13:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6638B6E8A7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 13:49:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D83FAAECE;
 Tue, 16 Jun 2020 13:50:01 +0000 (UTC)
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
To: Rong Chen <rong.a.chen@intel.com>, Emil Velikov <emil.l.velikov@gmail.com>
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
 <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <30f08ee3-6851-ebae-d645-3f535d536cd6@suse.de>
Date: Tue, 16 Jun 2020 15:49:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@lists.01.org, OTC LSE PnP <otc.lse.pnp@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1333255097=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1333255097==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7T6mw3QK3XnioULNj5melKopK66yzXiuk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7T6mw3QK3XnioULNj5melKopK66yzXiuk
Content-Type: multipart/mixed; boundary="BpvgDzScdKBvqEswUjZDqR9rNoFW5Hbrd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, Emil Velikov <emil.l.velikov@gmail.com>
Cc: john.p.donnelly@oracle.com, ML dri-devel
 <dri-devel@lists.freedesktop.org>, lkp@lists.01.org,
 OTC LSE PnP <otc.lse.pnp@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <30f08ee3-6851-ebae-d645-3f535d536cd6@suse.de>
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
 <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
In-Reply-To: <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>

--BpvgDzScdKBvqEswUjZDqR9rNoFW5Hbrd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.06.20 um 05:10 schrieb Rong Chen:
>=20
>=20
> On 6/16/20 4:58 AM, Emil Velikov wrote:
>> Hi all,
>>
>> On Thu, 4 Jun 2020 at 08:11, kernel test robot <rong.a.chen@intel.com>=

>> wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -64.9% regression of
>>> phoronix-test-suite.glmark2.800x600.score due to commit:
>>>
>> On one hand, I'm really happy to see performance testing happening
>> although this report is missing various crucial pieces of information.=

>>
>>> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15]
>>> drm/mgag200: Split MISC register update into PLL selection, SYNC and
>>> I/O")
>>> url:
>>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mgag20=
0-Convert-to-atomic-modesetting/20200515-163744
>>>
>>> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>>
>>> in testcase: phoronix-test-suite
>>> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with=

>>> 48G memory
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need_x: true
>> Replace "need_x" with the Xorg version as seen in `Xorg -version'.
>=20
> # Xorg -version
> /bin/sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)=

>=20
> X.Org X Server 1.20.4
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 4.9.0-8-amd64 x86_64 Debian
> Current Operating System: Linux lkp-nhm-2ep1
> 5.7.0-rc5-01428-ge44e907dd8f937 #1 SMP Tue Jun 2 19:51:38 CST 2020 x86_=
64
> Kernel command line:=C2=A0 ip=3D::::lkp-nhm-2ep1::dhcp
> root=3D/dev/disk/by-id/wwn-0x55cd2e4123123127-part2
> rootflags=3Dsubvol=3Ddebian-x86_64-phoronix
> remote_rootfs=3Dinternal-lkp-server:/osimage/debian/debian-x86_64-phoro=
nix
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/lkp-nhm-2ep1/phoronix-test-suite-performance-=
true-glmark2-1.1.0-ucode=3D0x1d-debian-x86_64-phoronix-e44e907dd8f937313d=
35615d799d54162c56d173-20200616-56456-1kgmjzm-0.yaml
> ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-7.6
> branch=3Dlinux-devel/devel-hourly-2020051600
> commit=3De44e907dd8f937313d35615d799d54162c56d173
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.6/gcc-7/e44e907dd8f937313d35615d7=
99d54162c56d173/vmlinuz-5.7.0-rc5-01428-ge44e907dd8f937
> console=3DttyS1,115200 console=3Dtty0 max_uptime=3D3600
> RESULT_ROOT=3D/result/phoronix-test-suite/performance-true-glmark2-1.1.=
0-ucode=3D0x1d/lkp-nhm-2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/=
e44e907dd8f937313d35615d799d54162c56d173/4
> LKP_SERVER=3Dinn nokaslr selinux=3D0 debug apic=3Ddebug sysrq_always_en=
abled
> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Do=
n
> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2
> prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr
> ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200
> console=3DttyS0,115200 vga=3Dnormal rw
> Build Date: 05 March 2019=C2=A0 08:11:12PM
> xorg-server 2:1.20.4-1 (https://www.debian.org/support)
> Current version of pixman: 0.36.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Before reporting problems, c=
heck http://wiki.x.org
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to make sure that you have t=
he latest version.
>=20
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test: glmark2-1.1.0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpufreq_governor: pe=
rformance
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ucode: 0x1d
>>>
>>> test-description: The Phoronix Test Suite is the most comprehensive
>>> testing and benchmarking platform available that provides an
>>> extensible framework for which new tests can be easily added.
>>> test-url: http://www.phoronix-test-suite.com/
>>>
>> Please remove the test description and url. They don't add any value.
>>
>> Mention which Mesa version is used as well as on what GPU. The output
>> of lspci and glxinfo will help here.
>=20
> Attached please find the outputs of lspci and glxinfo
>=20
>>
>> For this particular test - there is no Mesa/upstream driver for this
>> GPU, so I imagine one of the swrast drivers was used. Which one -
>> swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
>> The output of `LD_DEBUG=3Dlibs glxinfo=C2=A0 |& grep _dri.so` will hel=
p here.
>=20
> # LD_DEBUG=3Dlibs glxinfo=C2=A0 |& grep _dri.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2132:=C2=A0=C2=A0=C2=A0=C2=A0 calling in=
it: /usr/lib/i386-linux-gnu/dri/swrast_dri.so
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2132:=C2=A0=C2=A0=C2=A0=C2=A0 calling fi=
ni: /usr/lib/i386-linux-gnu/dri/swrast_dri.so [0]
>=20
> Best Regards,
> Rong Chen

Thanks for testing. If I send out a patch, could you try it?

Best regards
Thomas

>=20
>>
>>> commit:
>>> =C2=A0=C2=A0 bef2303526 ("drm/mgag200: Move mode-setting code into se=
parate
>>> helper function")
>>> =C2=A0=C2=A0 e44e907dd8 ("drm/mgag200: Split MISC register update int=
o PLL
>>> selection, SYNC and I/O")
>>>
>> Actually the offending commit has a subtle change of behaviour - it
>> adds an extra MGAREG_MISC_RAMMAPEN.
>> That is not documented and I've failed to spot it during review.
>>
>> Thomas - shall we revert that line in itself or at least add an inline=

>> comment why it is needed?
>>
>>> =C2=A0=C2=A0 100
>>> +--------------------------------------------------------------------=
-+
>>> =C2=A0=C2=A0=C2=A0 90 |-+=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +=C2=A0=C2=A0 +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=
 +=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 80 |-:=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=
 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 70 |-::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=
=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=
=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0=
 : : :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0=
 : :=C2=A0=C2=A0=C2=A0 : :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 60 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=
=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
=C2=A0 : :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 50 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=
=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
=C2=A0 : :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 40 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0 :=C2=
=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0 : : :=C2=A0=C2=A0 :=C2=A0=
 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : =
: :=C2=A0=C2=A0 :=C2=A0 : :O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O
>>> O O=C2=A0 O |
>>> =C2=A0=C2=A0=C2=A0 30 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0 :=C2=
=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 20 |-+ ::=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=
:=C2=A0=C2=A0 :=C2=A0 : O
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=

>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 10 |-+=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 0
>>> +--------------------------------------------------------------------=
-+
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phoronix-test-suite.glmark2=
=2E1024x768.score
>>>
>>> =C2=A0=C2=A0 70
>>> +--------------------------------------------------------------------=
--+
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +..+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=
=C2=A0 +=C2=A0=C2=A0=C2=A0
>>> +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>>> =C2=A0=C2=A0 60 |-:=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 :=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=
 :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 50 |-::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=
=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0=
 : :=C2=A0=C2=A0 : :=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 40 |:+:=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0=C2=A0=C2=
=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=
 : :=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |: :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=A0 : :=C2=A0=C2=A0=C2=A0 : :=C2=A0=
 : :=C2=A0=C2=A0 : :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
>>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 30 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=
=A0 : :O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>> O=C2=A0=C2=A0 O=C2=A0 O |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0 : : :=C2=A0=C2=A0 :=C2=A0 : :=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=
=A0 :=C2=A0=C2=A0 :=C2=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 20 |:+ : : :=C2=A0=C2=A0 :=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0 : : :=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0 :=C2=
=A0 :
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ::=C2=A0=C2=A0 :=C2=A0 :=
=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0 ::=C2=A0=C2=A0=
 :=C2=A0 :=C2=A0=C2=A0 ::=C2=A0=C2=A0 : : O
>>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0 10 |-+=C2=A0 :=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 :=C2=A0 :=C2=
=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 : :=C2=
=A0 O :=C2=A0=C2=A0=C2=A0 O : : O=C2=A0 :=C2=A0=C2=A0 :=C2=A0 : O :=C2=A0=
=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0
>>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0 0
>>> +--------------------------------------------------------------------=
--+
>>>
>>>
>>> [*] bisect-good sample
>>> [O] bisect-bad=C2=A0 sample
>>>
>> Hmm I must be going blind - there isn't even a single * in either of
>> the graphs.
>> Or perhaps my eyesight is fine and the legend or the graphs need fixin=
g.
>>
>> HTH
>> -Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BpvgDzScdKBvqEswUjZDqR9rNoFW5Hbrd--

--7T6mw3QK3XnioULNj5melKopK66yzXiuk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7ozgEACgkQaA3BHVML
eiMosQgAoGkPJ59DjlnZK9VYvVRAIKeTSxTZUYl8rGaWVTqkvChXvCtn3cEZv7//
NPxQjswX7Q8O/kyzV/i7LN4tY7MhVA/vPVq1sfGWnc3q9NIvcB6zBkdXZ4YiWGOv
HYACieaXQoJS4UlSjA4dPrMy32NyLCckI65ykn/9t5r/fSvuCYV1mapL6l68NkWh
vgTugAYlUeqPE0ElaG8+ehfg4/NzV3i4U5Poc7sKqLZUcpbTIM4btZLXbrvorYWT
IfvJPOjiTIV3dBl4eOoF1UP/lNmLd4OgEEcX8HrRjKD5aS8ehhLwSm4LtuMLcXEz
DbgHDuERBSAjDrnR0yUyzmq+nyBj5g==
=G2Tf
-----END PGP SIGNATURE-----

--7T6mw3QK3XnioULNj5melKopK66yzXiuk--

--===============1333255097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1333255097==--
