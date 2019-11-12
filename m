Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A6F8C64
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0A6EAEC;
	Tue, 12 Nov 2019 10:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29386EAEC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:02:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D206AD7B;
 Tue, 12 Nov 2019 10:02:37 +0000 (UTC)
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
To: John Donnelly <John.P.Donnelly@Oracle.com>, dri-devel@lists.freedesktop.org
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
 <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
 <3E3FE3C2-AD75-4F21-A73B-A69A652BC46D@oracle.com>
 <41394290-cc37-07b6-72cd-ea0ef41f2d7f@suse.de>
 <3a91efb3-1d96-ce7b-359a-42137cbb1b5a@Oracle.com>
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
Message-ID: <f56bf97d-2cdb-fbcc-9660-8c3c430388ae@suse.de>
Date: Tue, 12 Nov 2019 11:02:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <3a91efb3-1d96-ce7b-359a-42137cbb1b5a@Oracle.com>
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
Content-Type: multipart/mixed; boundary="===============2077009008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2077009008==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="URkwyDxgHdMS9QVqlLQgVEAw1hgVcaLZX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--URkwyDxgHdMS9QVqlLQgVEAw1hgVcaLZX
Content-Type: multipart/mixed; boundary="L8N4cbLrb36DhjPO88U0muDxrYhRZOBMz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <John.P.Donnelly@Oracle.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <f56bf97d-2cdb-fbcc-9660-8c3c430388ae@suse.de>
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
 <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
 <7f6090da-60a5-864c-2ed0-d20a413b3db2@suse.de>
 <43822B6A-45CB-4158-A52F-03F4669FAC5C@oracle.com>
 <B044F752-0120-484C-9C12-5A6FBD64B753@oracle.com>
 <c8999224-f585-e3fe-ec60-63632f005fc9@suse.de>
 <81D853E0-34F0-4894-B692-7E560AC2D9A1@oracle.com>
 <819f97a5-fcbe-7e8e-4b10-a09e838a69e6@suse.de>
 <3E3FE3C2-AD75-4F21-A73B-A69A652BC46D@oracle.com>
 <41394290-cc37-07b6-72cd-ea0ef41f2d7f@suse.de>
 <3a91efb3-1d96-ce7b-359a-42137cbb1b5a@Oracle.com>
In-Reply-To: <3a91efb3-1d96-ce7b-359a-42137cbb1b5a@Oracle.com>

--L8N4cbLrb36DhjPO88U0muDxrYhRZOBMz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

just a few more comments.

Am 11.11.19 um 18:40 schrieb John Donnelly:
> On 11/11/19 9:57 AM, Thomas Zimmermann wrote:
>> Hi John
>>
>> Am 08.11.19 um 19:07 schrieb John Donnelly:
>>>
>>>
>>>> On Nov 8, 2019, at 9:06 AM, Thomas Zimmermann <tzimmermann@suse.de>
>>>> wrote:
>>>>
>>>> Hi
>>>>
>>>> Am 08.11.19 um 13:55 schrieb John Donnelly:
>>>>>
>>>>>
>>>>>> On Nov 8, 2019, at 1:46 AM, Thomas Zimmermann
>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>
>>>>>> Hi John
>>>>>>
>>>>>> Am 07.11.19 um 23:14 schrieb John Donnelly:
>>>>>>>
>>>>>>>
>>>>>>>> On Nov 7, 2019, at 10:13 AM, John Donnelly
>>>>>>>> <john.p.donnelly@oracle.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>> On Nov 7, 2019, at 7:42 AM, Thomas Zimmermann
>>>>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>>>>
>>>>>>>>> Hi John
>>>>>>>>>
>>>>>>>>> Am 07.11.19 um 14:12 schrieb John Donnelly:
>>>>>>>>>> Hi=C2=A0 Thomas ;=C2=A0 Thank you for reaching out.
>>>>>>>>>>
>>>>>>>>>> See inline:
>>>>>>>>>>
>>>>>>>>>>> On Nov 7, 2019, at 1:54 AM, Thomas Zimmermann
>>>>>>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi John,
>>>>>>>>>>>
>>>>>>>>>>> apparently the vgaarb was not the problem.
>>>>>>>>>>>
>>>>>>>>>>> Am 07.11.19 um 03:29 schrieb John Donnelly:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> I am investigating an issue where we lose video activity
>>>>>>>>>>>> when the display is switched from from =E2=80=9Ctext mode=E2=
=80=9D to
>>>>>>>>>>>> =E2=80=9Cgraphic mode=E2=80=9D
>>>>>>>>>>>> on a number of=C2=A0 servers using this driver.=C2=A0=C2=A0=C2=
=A0 Specifically=C2=A0
>>>>>>>>>>>> starting the GNOME desktop.
>>>>>>>>>>>
>>>>>>>>>>> When you say "text mode", do you mean VGA text mode or the
>>>>>>>>>>> graphical
>>>>>>>>>>> console that emulates text mode?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I call =E2=80=9Ctext mode=E2=80=9D the 24x80=C2=A0 ascii mode =
;=C2=A0 - NOT GRAPHICS
>>>>>>>>>> .=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ie : run-level 3;=C2=A0 =
So I=C2=A0 guess your term for it is VGA.
>>>>>>>>>
>>>>>>>>> Yes.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> When you enable graphics mode, does it set the correct
>>>>>>>>>>> resolution? A lot
>>>>>>>>>>> of work went into memory management recently. I could imagine=

>>>>>>>>>>> that the
>>>>>>>>>>> driver sets the correct resolution, but then fails to display=

>>>>>>>>>>> the
>>>>>>>>>>> correct framebuffer.
>>>>>>>>>>
>>>>>>>>>> There is no display at all ;=C2=A0 so there is no resolution=C2=
=A0 to
>>>>>>>>>> mention.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> If possible, could you try to update to the latest drm-tip
>>>>>>>>>>> and attach
>>>>>>>>>>> the output of
>>>>>>>>>>>
>>>>>>>>>>> /sys/kernel/debug/dri/0/vram-mm
>>>>>>>>>>
>>>>>>>>>> I don=E2=80=99t see that file ;=C2=A0=C2=A0 Is there something=
 else I need to do ?
>>>>>>>>>
>>>>>>>>> That file is fairly new and maybe it's not in the mainline
>>>>>>>>> kernel yet.
>>>>>>>>> See below for how to get it.
>>>>>>>>
>>>>>>>> I=C2=A0 built your =E2=80=9Ctip=E2=80=9D ;=C2=A0 Still no graphi=
cs displayed .
>>>>>>>>
>>>>>>>>
>>>>>>>> mount -t debugfs none /sys/kernel
>>>>>>>>
>>>>>>>> cat /proc/cmdline
>>>>>>>> BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-5.4.0-rc6.drm.+
>>>>>>>> root=3D/dev/mapper/ol_ca--dev55-root ro crashkernel=3Dauto
>>>>>>>> resume=3D/dev/mapper/ol_ca--dev55-swap rd.lvm.lv=3Dol_ca-dev55/r=
oot
>>>>>>>> rd.lvm.lv=3Dol_ca-dev55/swap console=3DttyS0,9600,8,n,1 drm.debu=
g=3D0xff
>>>>>>>>
>>>>>>>>
>>>>>>>> cat=C2=A0 /sys/kernel/dri/0/vram-mm
>>>>>>>>
>>>>>>>> In VGA mode :
>>>>>>>>
>>>>>>>>
>>>>>>>> cat=C2=A0 /sys/kernel/dri/0/vram-mm
>>>>>>>> 0x0000000000000000-0x0000000000000300: 768: used
>>>>>>>> 0x0000000000000300-0x0000000000000600: 768: used
>>>>>>>> 0x0000000000000600-0x00000000000007ee: 494: free
>>>>>>>> 0x00000000000007ee-0x00000000000007ef: 1: used
>>>>>>>> 0x00000000000007ef-0x00000000000007f0: 1: used
>>>>>>>>
>>>>>>>>
>>>>>>>> In GRAPHICS mode ( if it matters )
>>>>>>>>
>>>>>>>>
>>>>>>>> cat=C2=A0 /sys/kernel/dri/0/vram-mm
>>>>>>>> 0x0000000000000000-0x0000000000000300: 768: used
>>>>>>>> 0x0000000000000300-0x0000000000000600: 768: used
>>>>>>>> 0x0000000000000600-0x00000000000007ee: 494: free
>>>>>>>> 0x00000000000007ee-0x00000000000007ef: 1: used
>>>>>>>> 0x00000000000007ef-0x00000000000007f0: 1: used
>>>>>>>> total: 2032, used 1538 free 494

Reconsidering this output, it actually makes sense. X11 only allocates a
single framebuffer and uses an additional shadow buffer for its
rendering. So the memory map is OK.

I'm having some problems with running Gnome 3.34 (3.32 is fine), which
makes it hard to distinguish Gnome errors from driver errors. I guess
I'm back to step 1. :(

Best regards
Thomas

>>>>>>>>
>>>>>>
>>>>>> This is interesting. In the graphics mode, you see two buffers of =
768
>>>>>> pages each. That's the main framebuffers as used by X (it's double=

>>>>>> buffered). Then there's a free area and finally two pages for curs=
or
>>>>>> images (also double buffered). That looks as expected.
>>>>>>
>>>>>> The thing is that in text mode, the areas are allocated. But the
>>>>>> driver
>>>>>> shouldn't be active, so the file shouldn't exist or only show a
>>>>>> single
>>>>>> free area.
>>>>>>
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you want me to double check this =
I will .=C2=A0=C2=A0=C2=A0 I have GNOME
>>>>> installed , but the machine boots to runlevel=C2=A0 3, then I start=
 the
>>>>> desktop using init 5=C2=A0 I am pretty sure I took that output when=
 the
>>>>> machine was in graphic=E2=80=99s mode=C2=A0=C2=A0 at runlevel 5 .
>>>>>
>>>>>
>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I=E2=80=99ve attached : var/lib/gdm/.local/share/xorg/Xorg.0.l=
og. ;=C2=A0=C2=A0
>>>>>>>>>> instead ;
>>>>>>>>>
>>>>>>>>> Good! Looking through that log file, the card is found at line
>>>>>>>>> 79 and
>>>>>>>>> the generic X modesetting driver initializes below. That works
>>>>>>>>> as expected.
>>>>>>>>>
>>>>>>>>> I notices that several operations are not permitted (lines 78
>>>>>>>>> and 87). I
>>>>>>>>> guess you're starting X from a regular user account? IIRC speci=
al
>>>>>>>>> permission is required to acquire control of the display. What
>>>>>>>>> happens
>>>>>>>>> if you start X as root user?
>>>>>>>>
>>>>>>>>
>>>>>>>> =C2=A0 I am starting GNOME=C2=A0 as=C2=A0 root by doing=C2=A0 =E2=
=80=9Cinit 5=E2=80=9D from either
>>>>>>>> the console=C2=A0 session or from ssh .
>>>>>>>>
>>>>>>>> The default runlevel is 3=C2=A0 on boot .
>>>>>>>>
>>>>>>>> On failing session=C2=A0 running=C2=A0 your 5.4.0.rc6.
>>>>>>>>
>>>>>>>> 78 [=C2=A0=C2=A0 237.712] xf86EnableIOPorts: failed to set IOPL =
for I/O
>>>>>>>> (Operation not permitted)
>>>>>>>>
>>>>>>>> 87 [=C2=A0=C2=A0 237.712] (EE) open /dev/fb0: Permission denied
>>>>>>>>
>>>>>>>> Booting 4.18 kernel yields the same error results in:
>>>>>>>> /var/lib/gdm/.local/share/xorg/Xorg.0.log
>>>>>>>>
>>>>>>>> 78 [=C2=A0=C2=A0 101.334] xf86EnableIOPorts: failed to set IOPL =
for I/O
>>>>>>>> (Operation not permitted)
>>>>>>>>
>>>>>>>> 87 [=C2=A0=C2=A0 101.334] (EE) open /dev/fb0: Permission denied
>>>>>>>>
>>>>>>>>
>>>>>>>> What is strange the X logs=C2=A0 ( bad and Ok ) files essentiall=
y
>>>>>>>> appear as if GNOME started !
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> <Xorg.0.log.bad><Xorg.0.log.Ok>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Here is my cmdline=C2=A0 -=C2=A0 I just tested 5.3.0 and it fa=
ils too=C2=A0 (
>>>>>>>>>> my last test was 5.3.8 and it failed also ) .
>>>>>>>>>>
>>>>>>>>>> # cat /proc/cmdline
>>>>>>>>>> BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-5.3.0+
>>>>>>>>>> root=3D/dev/mapper/ol_ca--dev55-root ro crashkernel=3Dauto
>>>>>>>>>> resume=3D/dev/mapper/ol_ca--dev55-swap
>>>>>>>>>> rd.lvm.lv=3Dol_ca-dev55/root rd.lvm.lv=3Dol_ca-dev55/swap
>>>>>>>>>> console=3DttyS0,9600,8,n,1 drm.debug=3D0xff
>>>>>>>>>>
>>>>>>>>>> When you say =E2=80=9Ctip=E2=80=9D. - Are you referring to a s=
pecific kernel=C2=A0
>>>>>>>>>> ?=C2=A0 I can build a=C2=A0 5.4.0.rc6=C2=A0 ;=C2=A0=C2=A0 The =
problem appears to have
>>>>>>>>>> been introduced around 5.3 time frame.
>>>>>>>>>
>>>>>>>>> The latest and greatest DRM code is in the drm-tip branch at
>>>>>>>>>
>>>>>>>>> git://anongit.freedesktop.org/drm/drm-tip
>>>>>>>>>
>>>>>>>>> If you build this version you should find
>>>>>>>>>
>>>>>>>>> /sys/kernel/debug/dri/0/vram-mm
>>>>>>>>>
>>>>>>>>> on the device. You have to build with debugfs enabled and
>>>>>>>>> maybe have to mount debugfs at /sys/kernel/debug.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> before and after switching to graphics mode. The file lists t=
he
>>>>>>>>>>> allocated regions of the VRAM.
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> This adapter is=C2=A0 Server Engines=C2=A0 Integrated Remote=
 Video
>>>>>>>>>>>> Acceleration Subsystem (RVAS)=C2=A0 and is used as remote co=
nsole
>>>>>>>>>>>> in iLO/DRAC environments.
>>>>>>>>>>>>
>>>>>>>>>>>> I don=E2=80=99t see any specific errors in the gdm logs or m=
essage
>>>>>>>>>>>> file other than this:
>>>>>>>>>>>
>>>>>>>>>>> You can boot with drm.debug=3D0xff on the kernel command line=

>>>>>>>>>>> to enable
>>>>>>>>>>> more warnings.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Could you please attach the output of lspci -v for the VGA
>>>>>>>>>>> adapter?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Here is the output from the current machine; The previous
>>>>>>>>>> addresses were from another model using the same SE device:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Nov=C2=A0 7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0:
>>>>>>>>>> remove_conflicting_pci_framebuffers: bar 0: 0xc5000000 ->
>>>>>>>>>> 0xc5ffffff
>>>>>>>>>> Nov=C2=A0 7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0:
>>>>>>>>>> remove_conflicting_pci_framebuffers: bar 1: 0xc6810000 ->
>>>>>>>>>> 0xc6813fff
>>>>>>>>>> Nov=C2=A0 7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0:
>>>>>>>>>> remove_conflicting_pci_framebuffers: bar 2: 0xc6000000 ->
>>>>>>>>>> 0xc67fffff
>>>>>>>>>> Nov=C2=A0 7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: vg=
aarb:
>>>>>>>>>> deactivate vga console
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> lspci -s 3d:00.0 -vvv -k
>>>>>>>>>> 3d:00.0 VGA compatible controller: Matrox Electronics Systems
>>>>>>>>>> Ltd. MGA G200e [Pilot] ServerEngines (SEP1) (rev 05) (prog-if
>>>>>>>>>> 00 [VGA controller])
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Subsystem: Oracle/SUN Device 4852
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Control: I/O+ Mem+ BusMaster+ SpecCycl=
e- MemWINV-
>>>>>>>>>> VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Status: Cap+ 66MHz- UDF- FastB2B- ParE=
rr- DEVSEL=3Dfast
>>>>>>>>>> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Latency: 0, Cache Line Size: 64 bytes
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Interrupt: pin A routed to IRQ 16
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0NUMA node: 0
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Region 0: Memory at c5000000 (32-bit, =
non-prefetchable)
>>>>>>>>>> [size=3D16M]
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Region 1: Memory at c6810000 (32-bit, =
non-prefetchable)
>>>>>>>>>> [size=3D16K]
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Region 2: Memory at c6000000 (32-bit, =
non-prefetchable)
>>>>>>>>>> [size=3D8M]
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Expansion ROM at 000c0000 [disabled] [=
size=3D128K]
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Capabilities: [dc] Power Management ve=
rsion 2
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: PMEClk- DSI+=
 D1- D2- AuxCurrent=3D0mA
>>>>>>>>>> PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: D0 NoSoftRs=
t- PME-Enable- DSel=3D0 DScale=3D0 PME-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Capabilities: [e4] Express (v1) Legacy=
 Endpoint, MSI 00
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DevCap:=C2=A0=C2=A0=
=C2=A0 MaxPayload 256 bytes, PhantFunc 0, Latency
>>>>>>>>>> L0s <64ns, L1 <1us
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DevCtl:=C2=A0=C2=A0=
=C2=A0 Report errors: Correctable+ Non-Fatal+
>>>>>>>>>> Fatal+ Unsupported-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 MaxPayload 128 bytes, MaxReadReq 128 bytes
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DevSta:=C2=A0=C2=A0=
=C2=A0 CorrErr+ UncorrErr- FatalErr- UnsuppReq+
>>>>>>>>>> AuxPwr- TransPend-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LnkCap:=C2=A0=C2=A0=
=C2=A0 Port #0, Speed 2.5GT/s, Width x1, ASPM L0s,
>>>>>>>>>> Exit Latency L0s <64ns
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LnkCtl:=C2=A0=C2=A0=
=C2=A0 ASPM Disabled; RCB 64 bytes Disabled- CommClk+
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LnkSta:=C2=A0=C2=A0=
=C2=A0 Speed 2.5GT/s, Width x1, TrErr- Train-
>>>>>>>>>> SlotClk+ DLActive- BWMgmt- ABWMgmt-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Capabilities: [54] MSI: Enable- Count=3D=
1/1 Maskable- 64bit-
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Address: 00000000=C2=
=A0 Data: 0000
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Kernel driver in use: mgag200
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Kernel modules: mgag200
>>>>>>>>>
>>>>>>>>> Looks all normal.
>>>>>>>>>
>>>>>>>>> Best regards
>>>>>>>>> Thomas
>>>>>>>>>
>>>>>>>
>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 Snip=C2=A0 =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>
>>>>>>>
>>>>>>> Hi Thomas
>>>>>>> ,
>>>>>>> I hopefully narrowed down the breakage between these up-stream
>>>>>>> commits,=C2=A0 which is v5.2 and 5.3.0-rc1:
>>>>>>>
>>>>>>>
>>>>>>> between :=C2=A0 0ecfebd2b524 2019-07-07 | Linux 5.2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 to :=C2=A0=C2=A0
>>>>>>> 5f9e832c1370 2019-07-21 | Linus 5.3-rc1
>>>>>>>
>>>>>>>
>>>>>>> I started to bisect this range on by date, by day ,=C2=A0 based o=
n the
>>>>>>> changes done in :
>>>>>>>
>>>>>>> drivers/gpu/drm/
>>>>>>>
>>>>>>> fec88ab0af97 2019-07-14 | Merge tag 'for-linus-hmm' of
>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma=C2=A0 ;=C2=
=A0 works
>>>>>>>
>>>>>>> Hopefully something in drivers/gpu/drm/ between the date range of=

>>>>>>> 2019-07-14 to 2019-07-21 will surface tomorrow.
>>>>>>
>>>>>> Great, thanks for bisecting.
>>>>>>
>>>>>> Could you attach your kernel config file? I'd like to compare with=
 my
>>>>>> config and try to reproduce the issue.
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>
>>>>> =C2=A0 Hi.
>>>>>
>>>>> =C2=A0 Here are config files generated after a =E2=80=9C make oldco=
nfig =E2=80=9C=C2=A0=C2=A0=C2=A0=C2=A0
>>>>> that started with an original .config file from a master file=C2=A0=
 we
>>>>> use for 5.4.0.-rc4. :
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 config.5.2.21 -=C2=A0 work with that flavo=
r
>>>>> =C2=A0=C2=A0=C2=A0 config.5.3.=C2=A0=C2=A0 fails with 5.3 and later=
=2E
>>>>>
>>>>> =C2=A0 Do you have access to mgag200 style adapter ?
>>>>
>>>> I do.
>>>>
>>>> I think I've been able to reproduce the issue. Buffers seem to
>>>> remain in
>>>> video ram after they have been pinned there. I'll investigate next
>>>> week.
>>>> I hope your bisecting session can point to the cause.
>>>>
>>>> Best regards
>>>> Thomas
>>>
>>> Hi Thomas,
>>>
>>>
>>> =C2=A0 Wonderful!
>>>
>>> =C2=A0 I think I have narrowed down the merge to this build which is =
:
>>> vmlinuz-5.2.0-rc5+ :
>>>
>>>
>>> be8454afc50f 2019-07-15 | Merge tag 'drm-next-2019-07-16' of
>>> git://anongit.freedesktop.org/drm/drm
>>>
>>> =C2=A0=C2=A0 Specifically this merge included these two changes :
>>>
>>> =C2=A0=C2=A0 94dc57b10399 2019-06-13 | drm/mgag200: Rewrite cursor ha=
ndling
>>> =C2=A0=C2=A0 f4ce5af71bc2 2019-06-13 | drm/mgag200: Pin framebuffer B=
O during
>>> dirty update
>>>
>>>
>>> I=C2=A0 tried reverting them and the resultant driver=C2=A0 doesn=E2=80=
=99t build
>>> afterwards due to drm calls.
>>>
>>> If I build a kernel from :
>>>
>>> fec88ab0af97 2019-07-14 | Merge tag 'for-linus-hmm' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
>>>
>>> That is posted=C2=A0 day prior to=C2=A0 be8454afc50f - the GNOME desk=
top works.
>>
>> I thought I could reproduce the problem, but I'm not so sure now.
>>
>> Please bisect the range between the two merges as described by Daniel =
to
>> find the broken commit. Doing
>>
>> =C2=A0=C2=A0 git bisect start
>> =C2=A0=C2=A0 git bisect bad be8454afc50f
>> =C2=A0=C2=A0 git bisect good fec88ab0af97
>>
>> should start the session.
>>
> Hi,
>=20
> I am OoO today . I will start this exercise tomorrow.
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


--L8N4cbLrb36DhjPO88U0muDxrYhRZOBMz--

--URkwyDxgHdMS9QVqlLQgVEAw1hgVcaLZX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3KgzkACgkQaA3BHVML
eiP6WQf+M+3gWplBUlpYkAncrbRBLojdatV3Me6h5gOhIhKy3MAlkq2YazN9sAkL
yCLO67ze+7nwZtiHhfsicLoqu6juej7vqfMmG/XNSNIHzsi32VL3sN+ByElI5M4s
R5Sdf/7vJeUkG7iKnC8m1NqtZeUVwPYU8mHySAK1MFmo6rj4dCEjPRH/clLONgxN
ykle5hgBjwl2CanQ6NKq15EVofuoGV4IFIPNexUfdHkrO4JxecM1sEJOwvGJkg/9
3klh3XbTWqcHwN7Sbwy8OQYubL2wCNxamZJkNhImczFBP/MD9xVinML91E7Jt0yA
wSMg6MSI8xmbwgMbD8WyP9gMmyFUvA==
=rKG2
-----END PGP SIGNATURE-----

--URkwyDxgHdMS9QVqlLQgVEAw1hgVcaLZX--

--===============2077009008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2077009008==--
