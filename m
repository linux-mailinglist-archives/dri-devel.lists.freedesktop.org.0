Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE50F3029
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE086E029;
	Thu,  7 Nov 2019 13:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EE46E029
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:43:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7F8BACB4;
 Thu,  7 Nov 2019 13:43:01 +0000 (UTC)
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
To: John Donnelly <john.p.donnelly@oracle.com>
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
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
Message-ID: <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
Date: Thu, 7 Nov 2019 14:42:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
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
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Content-Type: multipart/mixed; boundary="===============0814975351=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0814975351==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9ADTB7jkRKsHRuQzEUVbma26YjgBkMzYJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9ADTB7jkRKsHRuQzEUVbma26YjgBkMzYJ
Content-Type: multipart/mixed; boundary="9HUxT7CLt6nDmkzmMaHDq40nycGoZYexU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <john.p.donnelly@oracle.com>
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Message-ID: <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
In-Reply-To: <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>

--9HUxT7CLt6nDmkzmMaHDq40nycGoZYexU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi John

Am 07.11.19 um 14:12 schrieb John Donnelly:
> Hi  Thomas ;  Thank you for reaching out.=20
>=20
>  See inline:=20
>=20
>> On Nov 7, 2019, at 1:54 AM, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>>
>> Hi John,
>>
>> apparently the vgaarb was not the problem.
>>
>> Am 07.11.19 um 03:29 schrieb John Donnelly:
>>> Hi,
>>>
>>> I am investigating an issue where we lose video activity when the dis=
play is switched from from =E2=80=9Ctext mode=E2=80=9D to =E2=80=9Cgraphi=
c mode=E2=80=9D=20
>>> on a number of  servers using this driver.    Specifically  starting =
the GNOME desktop.=20
>>
>> When you say "text mode", do you mean VGA text mode or the graphical
>> console that emulates text mode?
>>
>        =20
>=20
>  I call =E2=80=9Ctext mode=E2=80=9D the 24x80  ascii mode ;  - NOT GRAP=
HICS .       Ie : run-level 3;  So I  guess your term for it is VGA.=20

Yes.


>      =20
>=20
>> When you enable graphics mode, does it set the correct resolution? A l=
ot
>> of work went into memory management recently. I could imagine that the=

>> driver sets the correct resolution, but then fails to display the
>> correct framebuffer.
>=20
>     There is no display at all ;  so there is no resolution  to mention=
=2E   =20
>=20
>=20
>    =20
>>
>> If possible, could you try to update to the latest drm-tip and attach
>> the output of
>>
>>  /sys/kernel/debug/dri/0/vram-mm
>=20
> I don=E2=80=99t see that file ;   Is there something else I need to do =
?=20

That file is fairly new and maybe it's not in the mainline kernel yet.
See below for how to get it.


>=20
> I=E2=80=99ve attached : var/lib/gdm/.local/share/xorg/Xorg.0.log. ;   i=
nstead ;=20

Good! Looking through that log file, the card is found at line 79 and
the generic X modesetting driver initializes below. That works as expecte=
d.

I notices that several operations are not permitted (lines 78 and 87). I
guess you're starting X from a regular user account? IIRC special
permission is required to acquire control of the display. What happens
if you start X as root user?


>=20
>=20
>=20
>=20
>  Here is my cmdline  -  I just tested 5.3.0 and it fails too  ( my last=
 test was 5.3.8 and it failed also ) .=20
>=20
> # cat /proc/cmdline=20
> BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-5.3.0+ root=3D/dev/mapper/ol_ca--dev5=
5-root ro crashkernel=3Dauto resume=3D/dev/mapper/ol_ca--dev55-swap rd.lv=
m.lv=3Dol_ca-dev55/root rd.lvm.lv=3Dol_ca-dev55/swap console=3DttyS0,9600=
,8,n,1 drm.debug=3D0xff
>=20
> When you say =E2=80=9Ctip=E2=80=9D. - Are you referring to a specific k=
ernel  ?  I can build a  5.4.0.rc6  ;   The problem appears to have been =
introduced around 5.3 time frame.=20

The latest and greatest DRM code is in the drm-tip branch at

  git://anongit.freedesktop.org/drm/drm-tip

If you build this version you should find

  /sys/kernel/debug/dri/0/vram-mm

on the device. You have to build with debugfs enabled and
maybe have to mount debugfs at /sys/kernel/debug.


>=20
>=20
>>
>> before and after switching to graphics mode. The file lists the
>> allocated regions of the VRAM.
>>
>>>
>>> This adapter is  Server Engines  Integrated Remote Video Acceleration=
 Subsystem (RVAS)  and is used as remote console in iLO/DRAC environments=
=2E =20
>>>
>>> I don=E2=80=99t see any specific errors in the gdm logs or message fi=
le other than this:
>>
>> You can boot with drm.debug=3D0xff on the kernel command line to enabl=
e
>> more warnings.
>>
>>
>> Could you please attach the output of lspci -v for the VGA adapter?
>>
>=20
>=20
> Here is the output from the current machine; The previous addresses wer=
e from another model using the same SE device:
>=20
>=20
> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: remove_conflicti=
ng_pci_framebuffers: bar 0: 0xc5000000 -> 0xc5ffffff
> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: remove_conflicti=
ng_pci_framebuffers: bar 1: 0xc6810000 -> 0xc6813fff
> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: remove_conflicti=
ng_pci_framebuffers: bar 2: 0xc6000000 -> 0xc67fffff
> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: vgaarb: deactiva=
te vga console
>=20
>=20
> lspci -s 3d:00.0 -vvv -k=20
> 3d:00.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA =
G200e [Pilot] ServerEngines (SEP1) (rev 05) (prog-if 00 [VGA controller])=

> 	Subsystem: Oracle/SUN Device 4852
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ St=
epping- SERR+ FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbo=
rt- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 16
> 	NUMA node: 0
> 	Region 0: Memory at c5000000 (32-bit, non-prefetchable) [size=3D16M]
> 	Region 1: Memory at c6810000 (32-bit, non-prefetchable) [size=3D16K]
> 	Region 2: Memory at c6000000 (32-bit, non-prefetchable) [size=3D8M]
> 	Expansion ROM at 000c0000 [disabled] [size=3D128K]
> 	Capabilities: [dc] Power Management version 2
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D=
3cold-)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
> 	Capabilities: [e4] Express (v1) Legacy Endpoint, MSI 00
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <64ns, L1 <1us=

> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
> 		DevCtl:	Report errors: Correctable+ Non-Fatal+ Fatal+ Unsupported-
> 			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 128 bytes
> 		DevSta:	CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s =
<64ns
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes Disabled- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWM=
gmt- ABWMgmt-
> 	Capabilities: [54] MSI: Enable- Count=3D1/1 Maskable- 64bit-
> 		Address: 00000000  Data: 0000
> 	Kernel driver in use: mgag200
> 	Kernel modules: mgag200

Looks all normal.

Best regards
Thomas

>=20
>=20
>> Best regards
>> Thomas
>>
>>>
>>> fb0: switching to mgag200drmfb from EFI VGA=20
>>> mgag200 0000:04:00.0: vgaarb: deactivate vga console=20
>>> fbcon: mgag200drmfb (fb0) is primary device=20
>>> mgag200 0000:04:00.0: fb0: mgag200drmfb frame buffer device=20
>>> [drm] Initialized mgag200 1.0.0 20110418 for 0000:04:00.0 on minor 0
>>>
>>> The systems worked fine with  4.18  kernels  and a recent Linux  5.2.=
18 ;  The symptom first appears in 5.3.6. and onward.=20
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9HUxT7CLt6nDmkzmMaHDq40nycGoZYexU--

--9ADTB7jkRKsHRuQzEUVbma26YjgBkMzYJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3EH2EACgkQaA3BHVML
eiNHIgf+MC3VquhvkkUEE9X0Qpo0gcAvbhGno2NohGq2kaJrFUJB/hldKBIxN+Si
M6QwbOHM7p9xHfOS6sDbG60rfc3GaCr/rd4Wa6rmP/3+0ICYDai50eYFNMqHitid
GY+hMZ8rVoOAmuBAQGNk9tW2Hn0L8HiicmN+dWdBp2QFuE2/gY/O/kcXoL6czvwQ
AO57xZ8HN4L3yBfx2e8XpaDgq278MMY8EO9fqgh4mj2+9DL5OaC/Ra3UytwvMMxv
p7r+PpW9pltCoMBPVQpX2nd1i2D7EsS4b1WZvjRm33xzgl8jO/jBl8K2ndrP1DR6
UDWWQDHTgc3gPXEqBPMW+mv0k4MHlg==
=0B6k
-----END PGP SIGNATURE-----

--9ADTB7jkRKsHRuQzEUVbma26YjgBkMzYJ--

--===============0814975351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0814975351==--
