Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202D1BF17D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72176EB64;
	Thu, 30 Apr 2020 07:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1BC6EB21
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 21:29:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id re23so2862444ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kGQ1rJAVSfIScmFZh55xFwvpf38JIELZW6B3Dqo+azs=;
 b=q0VMx8sqCqcSpsHkHVlefsfeFHCzU1fRNV6iZJsNAweciNbak2UOIulYdQIF6enPqZ
 GCWpgXQdWJ9WElOzEhsmyo7Qv21L4Qb/guAoC78d+1sgmwNURkwzOHHpj6rMKEx8Opqg
 XA9d27L/VP1J4M/CKxqzESY4Ni1YfeCZ4N6qnwNNYs2chT7hS1vbtfzKbd+2P4L9ltC3
 tMS0ELf/uobpwZmfmrIMboxCLCDw5Iu5Ljd2oHgexS5M7fMKCoWdP+/r/Io7FL0CS6X8
 Zn66hqHL0kPrdRMy2Ym0cMvRVlFzJWc/RU8BEBcGba+VUiBSHDpMO/KxP1VsTgprG3vW
 hahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kGQ1rJAVSfIScmFZh55xFwvpf38JIELZW6B3Dqo+azs=;
 b=oDGk+dgb3+2/2JtD5jP7tBsvJmY/vf9ifyuU9mPFvvjD3B5zT3kPVC5sKjUr9Bswt7
 MpDM1rmVCYAQme0nM5+KiPIHxDCvEA+BZUvM9JuSV6fE+vt4IlRdZxCxc4eCiLDWjZLk
 oU4SU5Vh4/sdtqFwpmJJXHDNhUiN1mG2/IIi8Glif4enOCQHFfbfs7b5d9fpSpEydy5w
 aX5SN5+vNMS+GB+ok6E144nbXZ5Gw1zITIWrEtB1pLRoiYSwfXfoZVy2n7o/XhAYMXQJ
 jrqrMwYAnnWpKAz7PGv4yDeFDtXN298p41LLFmp2zSgX1sIegHbDv6chRcvj/XhY4tIo
 Sb5g==
X-Gm-Message-State: AGi0Pua4akXRuTVh6HefK90fKxvczag4owWBU3CrlYVZ93huFRPM8d4q
 QMPvtL4rv06BqIlN+wKjw6Gbvh/Uu1oUInOhjqN5ag==
X-Google-Smtp-Source: APiQypIqFty4V57LQmqb8lEnBEjSABBcOK274HcNfeQWMlFMYRnnAHQMvAhJ2Nw0dMjf/fEoXc0T26vQMQTi6myWA3Y=
X-Received: by 2002:a17:906:c82b:: with SMTP id
 dd11mr4390670ejb.216.1588195738702; 
 Wed, 29 Apr 2020 14:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa7:d50f:0:0:0:0:0 with HTTP; Wed, 29 Apr 2020 14:28:57
 -0700 (PDT)
In-Reply-To: <fc57479f-f9eb-e517-5fec-feb235d9e907@redhat.com>
References: <CAD4j4=CYvr8nAZ8H4U=-XP125oOWJdO1bsxdsYpoJya0RrtB6Q@mail.gmail.com>
 <fc57479f-f9eb-e517-5fec-feb235d9e907@redhat.com>
From: =?UTF-8?Q?David_Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>
Date: Wed, 29 Apr 2020 23:28:57 +0200
Message-ID: <CAD4j4=CH48u0Dp_KkrEv2-D5Ui0v99-a8O7ZbjqxA4dJ=GFngQ@mail.gmail.com>
Subject: Re: Linux GOP initialization is wrong
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0132045194=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0132045194==
Content-Type: multipart/alternative; boundary="000000000000d6d81b05a474a2bd"

--000000000000d6d81b05a474a2bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anyway, what you say is what I thought, goo video mode is not being
modified by the kernel, but, the problem is that we take then the first
available mode we can found, so the problem is we take, in devices where
the default video mode is not the first one in order, the wrong mode. So
efifb is thinking the mode is 1200x1920 when in fact we are in 1920x1200.
We don't need to change the active video mode, just find the real video
mode that is active when the kernel start up.

El martes, 28 de abril de 2020, Hans de Goede <hdegoede@redhat.com>
escribi=C3=B3:
> Hi David,
>
> On 4/28/20 1:58 AM, David Santamar=C3=ADa Rogado wrote:
>>
>> This is related to the issues at least on some devices for panel
>> orientation quirks where added.
>
> Thank you for looking into this.
>
>> My tests have been done over a Lenovo ideapad D330.
>>
>> This devices like the other ones that need panel orientation quirks,
>> shows the initramfs with wrong stride and x and y swapped. By applying
>> the panel orientation quirks this gets solved but many parts of the
>> systems components needs to be patched. Hans has done a great job with
>> plymouth, mutter... but always appears a new problem derived as for
>> example vnc desktop sharing with this devices doesn't work and the
>> output is send messed up.
>
> When I first started adding support for devices which have their
> screen mounted 90 degrees rotated my first attempts where aimed
> at solving this transparently in the kernel.
>
> Unfortunately this is not possible. On most affected devices
> the hardware does not support 90 degrees rotation for the
> primary display layer; or if it does this requires the framebuffer
> being in a hardware-specific tiled format rather then being a
> linear framebuffer. Using these tiled formats requires userspace
> to be aware of this, which rules out transparently handling this
> in the kernel.
>
> Other layers (cursor layer, video overlay layers) have similar
> issues which require userspace to be aware of what is happening,
> so unfortunately there is no other way to deal with this then
> fixing involved userspace components.
>
> I'm a bit surprised that you sat that vnc desktop sharing does
> not work, I guess that also depends on how the desktop sharing
> works. If it pokes directly at the framebuffer somehow, then yes
> it will be messed up. But if it goes through the display server
> then things might work. I guess that it is possible that the
> code doing this cannot deal with Xrandr output rotation ...
>
>> The strange thing is that bootloaders like GRUB or rEFInd seems to be
>> able to handle this and they paint themselves right, despite when
>> booting Windows directly Windows paints itself right and booted with
>> GRUB or rEFInd the first second also paint itself wrong. Haven't
>> tested this too much but the interesting thing is in the next
>> paragraph.
>
> My experience with bootloaders showing themselves the right way
> up is mixed. It seems that the firmware is doing some hacks for
> this on some devices, at least for the EFI text console.
>
> Funnily enough (for some definition of fun) on at least one of
> the devices where the firmware is playing tricks (Asus T100HA IIRC)
> the position of the carret for text-editing is off by one, which
> is very annoying when editing the kernel commandline and which
> clearly shows that things are being emulated in software here.
>
>> I decided to get the UEFI GOP video modes and found that the D330 have
>> these ones:
>> Mode 0: 1200x1920
>> Mode 1: 640x480
>> Mode 2: 800x600
>> Mode 3: 1024x768
>> Mode 4: 1920x1200 (this is the default one started by the firmware)
>> Mode 5: 480x640
>> Mode 6: 600x800
>> Mode 7: 768x1024
>>
>> So I thought that Linux is taking the first mode despite is not the
>> active one and that's why the display is messed up.
>
> Nope, Linux does not touch the mode at all (nor does grub by default).
> Doing a EFI/GOP modeset has the risk of triggering all sort of firmware
> bugs. So we stick with what we get. This has interesting side effects
> where on some systems you get a different mode when turning on the
> machine and letting it boot, vs turning it on, pressing e.g. F12 to get
> the boot menu and then boot Linux.
>
>> Playing a little I could modify the GOP video mode before booting with
>> the UEFI Shell by simple using the mode 150 101. This causes GOP video
>> mode 5 to be switched to video mode 0, the first one. Booting now
>> makes initramfs messages to be correctly rendered but in the wrong
>> orientation.
>
> Right, the rendering on the side thing is expected. As said the hardware
> cannot do 90 degrees rotation with a linear framebuffer and the GOP
> provided efifb is a linear framebuffer. So without telling the kernel
> to software rotate its text console the text will always be on its side.
>
> What your little EFI shell hack is doing is working around what seems to
> be a bug on these Lenovo devices gives us the wrong stride and dimensions
> for the EFI framebuffer.
>
> Note that this very much is a Lenovo bug, all the other devices
> with 90 degree rotated screens let us render the text console
> on its side just fine. They correctly tells us the real size
> and stride of the screen (so its portrait dimensions since it
> is a portrait screen).
>
> Even though this is a Lenovo bug we should probably still try to
> find a way to deal with this though, so that the efifb works
> correctly on these devices...
>
>> A look at drivers/firmware/efi/libstub/gop.c seems to be what is
>> happening, the first available video mode is used despite it could not
>> be the active one in GOP and the active mode is not switched to the
>> discovered one by Linux. Both GRUB and rEFInd are able to respect the
>> video mode that GOP has active so it's possible to boot them landscape
>> and portrait while being correctly rendered.
>>
>> I think the video mode should not be the first discovered one but the
>> active one, or at least, the highest resolution video mode that
>> respects the orientation.
>
> Again, Linux does not use the GOP concept of video modes at all,
> it simply takes the active mode as reported by the UEFI and uses
> that to show messages during early boot.
>
> Also note that fixing the efifb is of little value early during
> boot the kernel will load the i915 driver so that we can have
> hardware rendered 3D, support for multiple monitors, etc. and as
> soon as that is loaded the efifb settings no longer matter.
>
> The i915 driver does not care about the GOP settings at all;
> and without a quirk it too will cause everything to be rendered
> on its side.
>
> Regards,
>
> Hans
>
>

--000000000000d6d81b05a474a2bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anyway, what you say is what I thought, goo video mode is not being modifie=
d by the kernel, but, the problem is that we take then the first available =
mode we can found, so the problem is we take, in devices where the default =
video mode is not the first one in order, the wrong mode. So efifb is think=
ing the mode is 1200x1920 when in fact we are in 1920x1200. We don&#39;t ne=
ed to change the active video mode, just find the real video mode that is a=
ctive when the kernel start up.<br><br>El martes, 28 de abril de 2020, Hans=
 de Goede &lt;<a href=3D"mailto:hdegoede@redhat.com">hdegoede@redhat.com</a=
>&gt; escribi=C3=B3:<br>&gt; Hi David,<br>&gt;<br>&gt; On 4/28/20 1:58 AM, =
David Santamar=C3=ADa Rogado wrote:<br>&gt;&gt;<br>&gt;&gt; This is related=
 to the issues at least on some devices for panel<br>&gt;&gt; orientation q=
uirks where added.<br>&gt;<br>&gt; Thank you for looking into this.<br>&gt;=
<br>&gt;&gt; My tests have been done over a Lenovo ideapad D330.<br>&gt;&gt=
;<br>&gt;&gt; This devices like the other ones that need panel orientation =
quirks,<br>&gt;&gt; shows the initramfs with wrong stride and x and y swapp=
ed. By applying<br>&gt;&gt; the panel orientation quirks this gets solved b=
ut many parts of the<br>&gt;&gt; systems components needs to be patched. Ha=
ns has done a great job with<br>&gt;&gt; plymouth, mutter... but always app=
ears a new problem derived as for<br>&gt;&gt; example vnc desktop sharing w=
ith this devices doesn&#39;t work and the<br>&gt;&gt; output is send messed=
 up.<br>&gt;<br>&gt; When I first started adding support for devices which =
have their<br>&gt; screen mounted 90 degrees rotated my first attempts wher=
e aimed<br>&gt; at solving this transparently in the kernel.<br>&gt;<br>&gt=
; Unfortunately this is not possible. On most affected devices<br>&gt; the =
hardware does not support 90 degrees rotation for the<br>&gt; primary displ=
ay layer; or if it does this requires the framebuffer<br>&gt; being in a ha=
rdware-specific tiled format rather then being a<br>&gt; linear framebuffer=
. Using these tiled formats requires userspace<br>&gt; to be aware of this,=
 which rules out transparently handling this<br>&gt; in the kernel.<br>&gt;=
<br>&gt; Other layers (cursor layer, video overlay layers) have similar<br>=
&gt; issues which require userspace to be aware of what is happening,<br>&g=
t; so unfortunately there is no other way to deal with this then<br>&gt; fi=
xing involved userspace components.<br>&gt;<br>&gt; I&#39;m a bit surprised=
 that you sat that vnc desktop sharing does<br>&gt; not work, I guess that =
also depends on how the desktop sharing<br>&gt; works. If it pokes directly=
 at the framebuffer somehow, then yes<br>&gt; it will be messed up. But if =
it goes through the display server<br>&gt; then things might work. I guess =
that it is possible that the<br>&gt; code doing this cannot deal with Xrand=
r output rotation ...<br>&gt;<br>&gt;&gt; The strange thing is that bootloa=
ders like GRUB or rEFInd seems to be<br>&gt;&gt; able to handle this and th=
ey paint themselves right, despite when<br>&gt;&gt; booting Windows directl=
y Windows paints itself right and booted with<br>&gt;&gt; GRUB or rEFInd th=
e first second also paint itself wrong. Haven&#39;t<br>&gt;&gt; tested this=
 too much but the interesting thing is in the next<br>&gt;&gt; paragraph.<b=
r>&gt;<br>&gt; My experience with bootloaders showing themselves the right =
way<br>&gt; up is mixed. It seems that the firmware is doing some hacks for=
<br>&gt; this on some devices, at least for the EFI text console.<br>&gt;<b=
r>&gt; Funnily enough (for some definition of fun) on at least one of<br>&g=
t; the devices where the firmware is playing tricks (Asus T100HA IIRC)<br>&=
gt; the position of the carret for text-editing is off by one, which<br>&gt=
; is very annoying when editing the kernel commandline and which<br>&gt; cl=
early shows that things are being emulated in software here.<br>&gt;<br>&gt=
;&gt; I decided to get the UEFI GOP video modes and found that the D330 hav=
e<br>&gt;&gt; these ones:<br>&gt;&gt; Mode 0: 1200x1920<br>&gt;&gt; Mode 1:=
 640x480<br>&gt;&gt; Mode 2: 800x600<br>&gt;&gt; Mode 3: 1024x768<br>&gt;&g=
t; Mode 4: 1920x1200 (this is the default one started by the firmware)<br>&=
gt;&gt; Mode 5: 480x640<br>&gt;&gt; Mode 6: 600x800<br>&gt;&gt; Mode 7: 768=
x1024<br>&gt;&gt;<br>&gt;&gt; So I thought that Linux is taking the first m=
ode despite is not the<br>&gt;&gt; active one and that&#39;s why the displa=
y is messed up.<br>&gt;<br>&gt; Nope, Linux does not touch the mode at all =
(nor does grub by default).<br>&gt; Doing a EFI/GOP modeset has the risk of=
 triggering all sort of firmware<br>&gt; bugs. So we stick with what we get=
. This has interesting side effects<br>&gt; where on some systems you get a=
 different mode when turning on the<br>&gt; machine and letting it boot, vs=
 turning it on, pressing e.g. F12 to get<br>&gt; the boot menu and then boo=
t Linux.<br>&gt;<br>&gt;&gt; Playing a little I could modify the GOP video =
mode before booting with<br>&gt;&gt; the UEFI Shell by simple using the mod=
e 150 101. This causes GOP video<br>&gt;&gt; mode 5 to be switched to video=
 mode 0, the first one. Booting now<br>&gt;&gt; makes initramfs messages to=
 be correctly rendered but in the wrong<br>&gt;&gt; orientation.<br>&gt;<br=
>&gt; Right, the rendering on the side thing is expected. As said the hardw=
are<br>&gt; cannot do 90 degrees rotation with a linear framebuffer and the=
 GOP<br>&gt; provided efifb is a linear framebuffer. So without telling the=
 kernel<br>&gt; to software rotate its text console the text will always be=
 on its side.<br>&gt;<br>&gt; What your little EFI shell hack is doing is w=
orking around what seems to<br>&gt; be a bug on these Lenovo devices gives =
us the wrong stride and dimensions<br>&gt; for the EFI framebuffer.<br>&gt;=
<br>&gt; Note that this very much is a Lenovo bug, all the other devices<br=
>&gt; with 90 degree rotated screens let us render the text console<br>&gt;=
 on its side just fine. They correctly tells us the real size<br>&gt; and s=
tride of the screen (so its portrait dimensions since it<br>&gt; is a portr=
ait screen).<br>&gt;<br>&gt; Even though this is a Lenovo bug we should pro=
bably still try to<br>&gt; find a way to deal with this though, so that the=
 efifb works<br>&gt; correctly on these devices...<br>&gt;<br>&gt;&gt; A lo=
ok at drivers/firmware/efi/libstub/gop.c seems to be what is<br>&gt;&gt; ha=
ppening, the first available video mode is used despite it could not<br>&gt=
;&gt; be the active one in GOP and the active mode is not switched to the<b=
r>&gt;&gt; discovered one by Linux. Both GRUB and rEFInd are able to respec=
t the<br>&gt;&gt; video mode that GOP has active so it&#39;s possible to bo=
ot them landscape<br>&gt;&gt; and portrait while being correctly rendered.<=
br>&gt;&gt;<br>&gt;&gt; I think the video mode should not be the first disc=
overed one but the<br>&gt;&gt; active one, or at least, the highest resolut=
ion video mode that<br>&gt;&gt; respects the orientation.<br>&gt;<br>&gt; A=
gain, Linux does not use the GOP concept of video modes at all,<br>&gt; it =
simply takes the active mode as reported by the UEFI and uses<br>&gt; that =
to show messages during early boot.<br>&gt;<br>&gt; Also note that fixing t=
he efifb is of little value early during<br>&gt; boot the kernel will load =
the i915 driver so that we can have<br>&gt; hardware rendered 3D, support f=
or multiple monitors, etc. and as<br>&gt; soon as that is loaded the efifb =
settings no longer matter.<br>&gt;<br>&gt; The i915 driver does not care ab=
out the GOP settings at all;<br>&gt; and without a quirk it too will cause =
everything to be rendered<br>&gt; on its side.<br>&gt;<br>&gt; Regards,<br>=
&gt;<br>&gt; Hans<br>&gt;<br>&gt;

--000000000000d6d81b05a474a2bd--

--===============0132045194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0132045194==--
