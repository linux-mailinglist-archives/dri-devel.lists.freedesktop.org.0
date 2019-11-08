Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C05F4EE7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 16:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FE06F9C4;
	Fri,  8 Nov 2019 15:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209F6F9C4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 15:07:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7497B4C7;
 Fri,  8 Nov 2019 15:06:58 +0000 (UTC)
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
To: John Donnelly <john.p.donnelly@oracle.com>
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
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
Message-ID: <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
Date: Fri, 8 Nov 2019 16:06:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============1462851673=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1462851673==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="n9Ud6ADduNdHncrsShrj254F7uq9UQvJg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n9Ud6ADduNdHncrsShrj254F7uq9UQvJg
Content-Type: multipart/mixed; boundary="oXeQ5GXPlrNYIxYAMOl9WLryfwmTjYzAf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <john.p.donnelly@oracle.com>
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Message-ID: <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
In-Reply-To: <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>

--oXeQ5GXPlrNYIxYAMOl9WLryfwmTjYzAf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.11.19 um 13:55 schrieb John Donnelly:
>=20
>=20
>> On Nov 8, 2019, at 1:46 AM, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>>
>> Hi John
>>
>> Am 07.11.19 um 23:14 schrieb John Donnelly:
>>>
>>>
>>>> On Nov 7, 2019, at 10:13 AM, John Donnelly <john.p.donnelly@oracle.c=
om> wrote:
>>>>
>>>>
>>>>
>>>>> On Nov 7, 2019, at 7:42 AM, Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>>>>
>>>>> Hi John
>>>>>
>>>>> Am 07.11.19 um 14:12 schrieb John Donnelly:
>>>>>> Hi  Thomas ;  Thank you for reaching out.=20
>>>>>>
>>>>>> See inline:=20
>>>>>>
>>>>>>> On Nov 7, 2019, at 1:54 AM, Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>>>>>
>>>>>>> Hi John,
>>>>>>>
>>>>>>> apparently the vgaarb was not the problem.
>>>>>>>
>>>>>>> Am 07.11.19 um 03:29 schrieb John Donnelly:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I am investigating an issue where we lose video activity when th=
e display is switched from from =E2=80=9Ctext mode=E2=80=9D to =E2=80=9Cg=
raphic mode=E2=80=9D=20
>>>>>>>> on a number of  servers using this driver.    Specifically  star=
ting the GNOME desktop.=20
>>>>>>>
>>>>>>> When you say "text mode", do you mean VGA text mode or the graphi=
cal
>>>>>>> console that emulates text mode?
>>>>>>>
>>>>>>
>>>>>>
>>>>>> I call =E2=80=9Ctext mode=E2=80=9D the 24x80  ascii mode ;  - NOT =
GRAPHICS .       Ie : run-level 3;  So I  guess your term for it is VGA. =

>>>>>
>>>>> Yes.
>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>> When you enable graphics mode, does it set the correct resolution=
? A lot
>>>>>>> of work went into memory management recently. I could imagine tha=
t the
>>>>>>> driver sets the correct resolution, but then fails to display the=

>>>>>>> correct framebuffer.
>>>>>>
>>>>>>  There is no display at all ;  so there is no resolution  to menti=
on.   =20
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> If possible, could you try to update to the latest drm-tip and at=
tach
>>>>>>> the output of
>>>>>>>
>>>>>>> /sys/kernel/debug/dri/0/vram-mm
>>>>>>
>>>>>> I don=E2=80=99t see that file ;   Is there something else I need t=
o do ?=20
>>>>>
>>>>> That file is fairly new and maybe it's not in the mainline kernel y=
et.
>>>>> See below for how to get it.
>>>>
>>>>  I  built your =E2=80=9Ctip=E2=80=9D ;  Still no graphics displayed =
=2E=20
>>>>
>>>>
>>>>  mount -t debugfs none /sys/kernel
>>>>
>>>> cat /proc/cmdline=20
>>>> BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-5.4.0-rc6.drm.+ root=3D/dev/mapper=
/ol_ca--dev55-root ro crashkernel=3Dauto resume=3D/dev/mapper/ol_ca--dev5=
5-swap rd.lvm.lv=3Dol_ca-dev55/root rd.lvm.lv=3Dol_ca-dev55/swap console=3D=
ttyS0,9600,8,n,1 drm.debug=3D0xff
>>>>
>>>>
>>>> cat  /sys/kernel/dri/0/vram-mm=20
>>>>
>>>> In VGA mode :
>>>>
>>>>
>>>> cat  /sys/kernel/dri/0/vram-mm=20
>>>> 0x0000000000000000-0x0000000000000300: 768: used
>>>> 0x0000000000000300-0x0000000000000600: 768: used
>>>> 0x0000000000000600-0x00000000000007ee: 494: free
>>>> 0x00000000000007ee-0x00000000000007ef: 1: used
>>>> 0x00000000000007ef-0x00000000000007f0: 1: used
>>>>
>>>>
>>>> In GRAPHICS mode ( if it matters )=20
>>>>
>>>>
>>>> cat  /sys/kernel/dri/0/vram-mm=20
>>>> 0x0000000000000000-0x0000000000000300: 768: used
>>>> 0x0000000000000300-0x0000000000000600: 768: used
>>>> 0x0000000000000600-0x00000000000007ee: 494: free
>>>> 0x00000000000007ee-0x00000000000007ef: 1: used
>>>> 0x00000000000007ef-0x00000000000007f0: 1: used
>>>> total: 2032, used 1538 free 494
>>>>
>>
>> This is interesting. In the graphics mode, you see two buffers of 768
>> pages each. That's the main framebuffers as used by X (it's double
>> buffered). Then there's a free area and finally two pages for cursor
>> images (also double buffered). That looks as expected.
>>
>> The thing is that in text mode, the areas are allocated. But the drive=
r
>> shouldn't be active, so the file shouldn't exist or only show a single=

>> free area.
>>
>=20
>       If you want me to double check this I will .    I have GNOME inst=
alled , but the machine boots to runlevel  3, then I start the desktop us=
ing init 5  I am pretty sure I took that output when the machine was in g=
raphic=E2=80=99s mode   at runlevel 5 .=20
>=20
>=20
>>
>>>>
>>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> I=E2=80=99ve attached : var/lib/gdm/.local/share/xorg/Xorg.0.log. =
;   instead ;=20
>>>>>
>>>>> Good! Looking through that log file, the card is found at line 79 a=
nd
>>>>> the generic X modesetting driver initializes below. That works as e=
xpected.
>>>>>
>>>>> I notices that several operations are not permitted (lines 78 and 8=
7). I
>>>>> guess you're starting X from a regular user account? IIRC special
>>>>> permission is required to acquire control of the display. What happ=
ens
>>>>> if you start X as root user?
>>>>
>>>>
>>>>   I am starting GNOME  as  root by doing  =E2=80=9Cinit 5=E2=80=9D f=
rom either the console  session or from ssh .
>>>>
>>>>  The default runlevel is 3  on boot .
>>>>
>>>> On failing session  running  your 5.4.0.rc6.
>>>>
>>>> 78 [   237.712] xf86EnableIOPorts: failed to set IOPL for I/O (Opera=
tion not permitted)
>>>>
>>>> 87 [   237.712] (EE) open /dev/fb0: Permission denied
>>>>
>>>> Booting 4.18 kernel yields the same error results in: /var/lib/gdm/.=
local/share/xorg/Xorg.0.log
>>>>
>>>> 78 [   101.334] xf86EnableIOPorts: failed to set IOPL for I/O (Opera=
tion not permitted)
>>>>
>>>>  87 [   101.334] (EE) open /dev/fb0: Permission denied
>>>>
>>>>
>>>> What is strange the X logs  ( bad and Ok ) files essentially appear =
as if GNOME started !
>>>>
>>>>
>>>>
>>>>
>>>> <Xorg.0.log.bad><Xorg.0.log.Ok>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Here is my cmdline  -  I just tested 5.3.0 and it fails too  ( my =
last test was 5.3.8 and it failed also ) .=20
>>>>>>
>>>>>> # cat /proc/cmdline=20
>>>>>> BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-5.3.0+ root=3D/dev/mapper/ol_ca-=
-dev55-root ro crashkernel=3Dauto resume=3D/dev/mapper/ol_ca--dev55-swap =
rd.lvm.lv=3Dol_ca-dev55/root rd.lvm.lv=3Dol_ca-dev55/swap console=3DttyS0=
,9600,8,n,1 drm.debug=3D0xff
>>>>>>
>>>>>> When you say =E2=80=9Ctip=E2=80=9D. - Are you referring to a speci=
fic kernel  ?  I can build a  5.4.0.rc6  ;   The problem appears to have =
been introduced around 5.3 time frame.=20
>>>>>
>>>>> The latest and greatest DRM code is in the drm-tip branch at
>>>>>
>>>>> git://anongit.freedesktop.org/drm/drm-tip
>>>>>
>>>>> If you build this version you should find
>>>>>
>>>>> /sys/kernel/debug/dri/0/vram-mm
>>>>>
>>>>> on the device. You have to build with debugfs enabled and
>>>>> maybe have to mount debugfs at /sys/kernel/debug.
>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> before and after switching to graphics mode. The file lists the
>>>>>>> allocated regions of the VRAM.
>>>>>>>
>>>>>>>>
>>>>>>>> This adapter is  Server Engines  Integrated Remote Video Acceler=
ation Subsystem (RVAS)  and is used as remote console in iLO/DRAC environ=
ments. =20
>>>>>>>>
>>>>>>>> I don=E2=80=99t see any specific errors in the gdm logs or messa=
ge file other than this:
>>>>>>>
>>>>>>> You can boot with drm.debug=3D0xff on the kernel command line to =
enable
>>>>>>> more warnings.
>>>>>>>
>>>>>>>
>>>>>>> Could you please attach the output of lspci -v for the VGA adapte=
r?
>>>>>>>
>>>>>>
>>>>>>
>>>>>> Here is the output from the current machine; The previous addresse=
s were from another model using the same SE device:
>>>>>>
>>>>>>
>>>>>> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: remove_conf=
licting_pci_framebuffers: bar 0: 0xc5000000 -> 0xc5ffffff
>>>>>> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: remove_conf=
licting_pci_framebuffers: bar 1: 0xc6810000 -> 0xc6813fff
>>>>>> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: remove_conf=
licting_pci_framebuffers: bar 2: 0xc6000000 -> 0xc67fffff
>>>>>> Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: vgaarb: dea=
ctivate vga console
>>>>>>
>>>>>>
>>>>>> lspci -s 3d:00.0 -vvv -k=20
>>>>>> 3d:00.0 VGA compatible controller: Matrox Electronics Systems Ltd.=
 MGA G200e [Pilot] ServerEngines (SEP1) (rev 05) (prog-if 00 [VGA control=
ler])
>>>>>> 	Subsystem: Oracle/SUN Device 4852
>>>>>> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r+ Stepping- SERR+ FastB2B- DisINTx-
>>>>>> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
>>>>>> 	Latency: 0, Cache Line Size: 64 bytes
>>>>>> 	Interrupt: pin A routed to IRQ 16
>>>>>> 	NUMA node: 0
>>>>>> 	Region 0: Memory at c5000000 (32-bit, non-prefetchable) [size=3D1=
6M]
>>>>>> 	Region 1: Memory at c6810000 (32-bit, non-prefetchable) [size=3D1=
6K]
>>>>>> 	Region 2: Memory at c6000000 (32-bit, non-prefetchable) [size=3D8=
M]
>>>>>> 	Expansion ROM at 000c0000 [disabled] [size=3D128K]
>>>>>> 	Capabilities: [dc] Power Management version 2
>>>>>> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3h=
ot-,D3cold-)
>>>>>> 		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
>>>>>> 	Capabilities: [e4] Express (v1) Legacy Endpoint, MSI 00
>>>>>> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <64ns, L1=
 <1us
>>>>>> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
>>>>>> 		DevCtl:	Report errors: Correctable+ Non-Fatal+ Fatal+ Unsupporte=
d-
>>>>>> 			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>>>>>> 			MaxPayload 128 bytes, MaxReadReq 128 bytes
>>>>>> 		DevSta:	CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr- TransPe=
nd-
>>>>>> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency=
 L0s <64ns
>>>>>> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
>>>>>> 		LnkCtl:	ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>>>>>> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>>>>> 		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive=
- BWMgmt- ABWMgmt-
>>>>>> 	Capabilities: [54] MSI: Enable- Count=3D1/1 Maskable- 64bit-
>>>>>> 		Address: 00000000  Data: 0000
>>>>>> 	Kernel driver in use: mgag200
>>>>>> 	Kernel modules: mgag200
>>>>>
>>>>> Looks all normal.
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  Snip  =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>>
>>>
>>> Hi Thomas=20
>>> ,
>>> I hopefully narrowed down the breakage between these up-stream commit=
s,  which is v5.2 and 5.3.0-rc1:  =20
>>>
>>>
>>> between :  0ecfebd2b524 2019-07-07 | Linux 5.2      to :   5f9e832c13=
70 2019-07-21 | Linus 5.3-rc1
>>>
>>>
>>> I started to bisect this range on by date, by day ,  based on the cha=
nges done in :
>>>
>>> drivers/gpu/drm/
>>>
>>> fec88ab0af97 2019-07-14 | Merge tag 'for-linus-hmm' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rdma/rdma  ;  works=20
>>>
>>> Hopefully something in drivers/gpu/drm/ between the date range of 201=
9-07-14 to 2019-07-21 will surface tomorrow.
>>
>> Great, thanks for bisecting.
>>
>> Could you attach your kernel config file? I'd like to compare with my
>> config and try to reproduce the issue.
>>
>> Best regards
>> Thomas
>=20
>   Hi.
>=20
>   Here are config files generated after a =E2=80=9C make oldconfig =E2=80=
=9C     that started with an original .config file from a master file  we=
 use for 5.4.0.-rc4. :
>=20
>      config.5.2.21 -  work with that flavor
>     config.5.3.   fails with 5.3 and later.=20
>=20
>   Do you have access to mgag200 style adapter ? =20

I do.

I think I've been able to reproduce the issue. Buffers seem to remain in
video ram after they have been pinned there. I'll investigate next week.
I hope your bisecting session can point to the cause.

Best regards
Thomas

>=20
>=20
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oXeQ5GXPlrNYIxYAMOl9WLryfwmTjYzAf--

--n9Ud6ADduNdHncrsShrj254F7uq9UQvJg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3FhI4ACgkQaA3BHVML
eiOppwf/dFOBVtYJ8dpzGITtKhiLNvqwdN1kmLpAWaLe6TgpI0woqWzEXEWmXSrB
dAAGyqq06tYyyJG3DABfYh9ZEGDdspVqCAsz/UFIaFJjxCKhn4XEYRorIWje83/f
UiBmYqSPp5egYx4orB9A+VVvtfhK4ngvFuhg9FSrJmHS4iKUB87rsFI/gdRndEG2
k5ollVefxIEV+seAOQo5vd1PZroEks5QPiKE0gyjPtaEfySlyKY1L5+qYP9CKFJe
2WC2Yw25brD5xls9wwrE+XWvAvpHVpWEZZgV+7GGk9m+Pf+b2/h/vkFtW74Kp4s1
bAb2bLYjcrVmuUxSIqkyKxPab32oYw==
=n268
-----END PGP SIGNATURE-----

--n9Ud6ADduNdHncrsShrj254F7uq9UQvJg--

--===============1462851673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1462851673==--
