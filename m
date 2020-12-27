Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C46F2E3221
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 18:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3C78951B;
	Sun, 27 Dec 2020 17:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BDC8951B;
 Sun, 27 Dec 2020 17:26:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id jx16so11569119ejb.10;
 Sun, 27 Dec 2020 09:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fYA4ItWJ+MXoqQrWvdslES/oUgC8OPAZMDNdGxtMbd4=;
 b=oVk3PaIurW/fSl62nphCw7S2EFdzrodfsRUywgd1pRAjTdV2o7lIghCOrn0iLbvQZ8
 C9M8G/GUlu5E0uFuIFvDXKrXd6OSLyqcE8Jj67JSGZcTbZTiA35bHB2QIt7sxBXjoR8D
 SjJyVeBTWmcB7MApr9y6WwVYss4LGmCcl/enKNmtQZq/+o8nkZOkP9uDD7Ce2gbVCt+l
 29REd2KS/X+zVGTu3amNidehRNVVHnrrWU+bcPWMqvM3QBRCWLJonT0adoE5KfrJs24O
 Yd8+eP8wUzjmDwewD4dSNu5rpjbarLN/Ato1NzghgDGm1nnvBb1pAnFK1IJ1KOcGrc1z
 olFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYA4ItWJ+MXoqQrWvdslES/oUgC8OPAZMDNdGxtMbd4=;
 b=f0bDLTBqZgZ8vv4QOe88T3u5XKJSOytXOVs7Dc9+c/Pg7J+xtR4A6uVt5jmVmntDTj
 Z3cKi9UeCiy4FH9ZTXPtVujHcX0cBoyNCjK1rIFMhXDR/WM6sZlWLtGSh8vPLoRCdDc1
 LpMRjdIbptoKcsSKN5KvW0+/GztmxsO2ZpMl0MbhESkk7eI96j5knAX2dkKFsEidR73w
 wncj564ZYvzQmHcDdC8xenWD7b+tbSU7SDY9It/rDC4NlPNJ1VcyGAkkorlPzlupmr6F
 iNxW5rbTv7VNldtVlhTpiC8i13N3qcWjhKjyE7xIpCe2L9PgIfiPjzVrG+cYx3RE6TIb
 XcTQ==
X-Gm-Message-State: AOAM532N3C9v5eH/yI9+m8ylK+mrYzzgbnbABdka4nX9lP1kFIvJb2dx
 sL6F+eelOwCFP5db5S9JfBYYnwhX8lhSSwAhqvA=
X-Google-Smtp-Source: ABdhPJzHBadVH7rP6S04tR7jqTcBesaKuVoVncM18rozpFdybee3El8LVhrqaxdW7uIUZmza6+BCpXSbYqP0+Ssj6go=
X-Received: by 2002:a17:906:4d8d:: with SMTP id
 s13mr38806900eju.305.1609090017453; 
 Sun, 27 Dec 2020 09:26:57 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsPsXSTh+WO2XESOU+Q1ocrWmS1c1YJFarzmA=woK_ke5Q@mail.gmail.com>
 <CABXGCsPBBDX3ozAgtT174nesiM+Gx4UkQi+PD27jB3i9OQ=G0g@mail.gmail.com>
In-Reply-To: <CABXGCsPBBDX3ozAgtT174nesiM+Gx4UkQi+PD27jB3i9OQ=G0g@mail.gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Sun, 27 Dec 2020 18:26:46 +0100
Message-ID: <CAD=4a=XQGQ6L3oyjioA-D4kyCtxcVcmXKz7eZuSNgmyrqkYFhw@mail.gmail.com>
Subject: Re: [bug] Radeon 3900XT not switch to graphic mode on kernel 5.10
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0284848226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0284848226==
Content-Type: multipart/alternative; boundary="000000000000e6ea9105b775768b"

--000000000000e6ea9105b775768b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-2 means no such file or directory. Perhaps you need to rebuild your
ramdisk manually for some reason.

Regards
//Ernst

Den s=C3=B6n 27 dec. 2020 kl 17:58 skrev Mikhail Gavrilov <
mikhail.v.gavrilov@gmail.com>:

> On Sun, 27 Dec 2020 at 21:39, Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
> > I suppose the root of cause my problem here:
> >
> > [    3.961326] amdgpu 0000:0b:00.0: Direct firmware load for
> > amdgpu/sienna_cichlid_sos.bin failed with error -2
> > [    3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to init sos firmware
> > [    3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Failed to load psp
> firmware!
> > [    3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init
> > of IP block <psp> failed -2
> > [    3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_device_ip_init faile=
d
> > [    3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error during GPU init
> > [    3.961911] amdgpu: probe of 0000:0b:00.0 failed with error -2
> >
>
> # dnf provides */sienna_cichlid_sos.bin
> Last metadata expiration check: 3:01:27 ago on Sun 27 Dec 2020 06:53:25 P=
M
> +05.
> linux-firmware-20201218-116.fc34.noarch : Firmware files used by the
> Linux kernel
> Repo        : @System
> Matched from:
> Filename    : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin
>
> linux-firmware-20201218-116.fc34.noarch : Firmware files used by the
> Linux kernel
> Repo        : rawhide
> Matched from:
> Filename    : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin
>
> # dnf install linux-firmware-20201218-116.fc34.noarch
> Last metadata expiration check: 3:02:11 ago on Sun 27 Dec 2020 06:53:25 P=
M
> +05.
> Package linux-firmware-20201218-116.fc34.noarch is already installed.
> Dependencies resolved.
> Nothing to do.
> Complete!
>
> Looks like firmware is present. So I didn't understand why the kernel
> cannot read firmware.
>
> --
> Best Regards,
> Mike Gavrilov.
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--000000000000e6ea9105b775768b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">-2 means no such file or directory. Perhaps you need to=
 rebuild your ramdisk manually for some reason.</div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Regard=
s</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif">//Ernst<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Den s=C3=B6n 27 dec. 2020 kl 17:58 skrev Mikhail=
 Gavrilov &lt;<a href=3D"mailto:mikhail.v.gavrilov@gmail.com">mikhail.v.gav=
rilov@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, 27 Dec 2020 at 21:39, Mikhail Gavrilov<br>
&lt;<a href=3D"mailto:mikhail.v.gavrilov@gmail.com" target=3D"_blank">mikha=
il.v.gavrilov@gmail.com</a>&gt; wrote:<br>
&gt; I suppose the root of cause my problem here:<br>
&gt;<br>
&gt; [=C2=A0 =C2=A0 3.961326] amdgpu 0000:0b:00.0: Direct firmware load for=
<br>
&gt; amdgpu/sienna_cichlid_sos.bin failed with error -2<br>
&gt; [=C2=A0 =C2=A0 3.961359] amdgpu 0000:0b:00.0: amdgpu: failed to init s=
os firmware<br>
&gt; [=C2=A0 =C2=A0 3.961433] [drm:psp_sw_init [amdgpu]] *ERROR* Failed to =
load psp firmware!<br>
&gt; [=C2=A0 =C2=A0 3.961529] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR=
* sw_init<br>
&gt; of IP block &lt;psp&gt; failed -2<br>
&gt; [=C2=A0 =C2=A0 3.961549] amdgpu 0000:0b:00.0: amdgpu: amdgpu_device_ip=
_init failed<br>
&gt; [=C2=A0 =C2=A0 3.961569] amdgpu 0000:0b:00.0: amdgpu: Fatal error duri=
ng GPU init<br>
&gt; [=C2=A0 =C2=A0 3.961911] amdgpu: probe of 0000:0b:00.0 failed with err=
or -2<br>
&gt;<br>
<br>
# dnf provides */sienna_cichlid_sos.bin<br>
Last metadata expiration check: 3:01:27 ago on Sun 27 Dec 2020 06:53:25 PM =
+05.<br>
linux-firmware-20201218-116.fc34.noarch : Firmware files used by the<br>
Linux kernel<br>
Repo=C2=A0 =C2=A0 =C2=A0 =C2=A0 : @System<br>
Matched from:<br>
Filename=C2=A0 =C2=A0 : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin<br>
<br>
linux-firmware-20201218-116.fc34.noarch : Firmware files used by the<br>
Linux kernel<br>
Repo=C2=A0 =C2=A0 =C2=A0 =C2=A0 : rawhide<br>
Matched from:<br>
Filename=C2=A0 =C2=A0 : /usr/lib/firmware/amdgpu/sienna_cichlid_sos.bin<br>
<br>
# dnf install linux-firmware-20201218-116.fc34.noarch<br>
Last metadata expiration check: 3:02:11 ago on Sun 27 Dec 2020 06:53:25 PM =
+05.<br>
Package linux-firmware-20201218-116.fc34.noarch is already installed.<br>
Dependencies resolved.<br>
Nothing to do.<br>
Complete!<br>
<br>
Looks like firmware is present. So I didn&#39;t understand why the kernel<b=
r>
cannot read firmware.<br>
<br>
--<br>
Best Regards,<br>
Mike Gavrilov.<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a><br>
</blockquote></div>

--000000000000e6ea9105b775768b--

--===============0284848226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0284848226==--
