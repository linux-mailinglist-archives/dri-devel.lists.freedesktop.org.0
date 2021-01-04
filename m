Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392012EA662
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A076E057;
	Tue,  5 Jan 2021 08:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D189F61;
 Mon,  4 Jan 2021 15:01:44 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id x15so25555444ilq.1;
 Mon, 04 Jan 2021 07:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ULNOsqWsWG/Y0sZF+wwgdwl1ApvW+03QwvSjNQ+ZxL4=;
 b=uQ0VxNBnDs5XpgJFxbKC1MMJE3Zk/pjiniSyO2anV9m+785UUsyT1ey80yYPvxPNBN
 BtxOUDw6G2PEOTjPJDzgwUJmH42n7qsiTgaW4ZyNk8WRuGBJ7FuaYRUz5jzgMt/nizQG
 mLNZCCQilWbQXFlDNAXDg3Wn3os1HZJvI6SoaVw/tuySUgYdLVPzDlO/TyEZJW1O8gax
 kxI8VSpvoMxVyveEongJqehyrfajwEOsK3MfQXFXfGrBhwRbN4Nm5ENRr2sTeJydBDG7
 iyl+KKRn222hIvitizelVmFTZLTvTTyyGu+Lwp2lOQ2KZk+H1qBqhhDxUJIuvS+8CBMA
 d1Tw==
X-Gm-Message-State: AOAM533uk48bfJ7NQ0Ox70JJG9zTQvfifk+1al3V9BG4xFW5vaAiNtKh
 ic9kmcmBb2Wgh5biAkIMG/Q2pgvCXp8IS80GGPQ=
X-Google-Smtp-Source: ABdhPJyQBXk8OuM30+srhP5cXkgxv8nXL9d32m/S/yR0WvXNyib++LzUhIW8o7XI7wB3JJKIl9r9+k+hjg29t2NN8Nc=
X-Received: by 2002:a92:bd0f:: with SMTP id c15mr70881682ile.296.1609772503790; 
 Mon, 04 Jan 2021 07:01:43 -0800 (PST)
MIME-Version: 1.0
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
 <MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20@MN2PR12MB4488.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB44884E8F0C885F8DCDCF37CDF7D20@MN2PR12MB4488.namprd12.prod.outlook.com>
From: Davide Corrado <davide@davidecorrado.eu>
Date: Mon, 4 Jan 2021 16:01:32 +0100
Message-ID: <CAM0ywnxDNcROH-3BMxfTMp28+YL-5rcn=5=pZxgaa_ge3L+vug@mail.gmail.com>
Subject: Re: amdgpu does not support 3840x2160@30Hz on kaveri apu
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0267966370=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0267966370==
Content-Type: multipart/alternative; boundary="00000000000041faa705b8145e80"

--00000000000041faa705b8145e80
Content-Type: text/plain; charset="UTF-8"

SOLVED

I opened a ticket here:

https://gitlab.freedesktop.org/drm/amd/-/issues/1425

and they suggested, at the end, the same hint (amdgpu.dc=1).

... which, I was sure, I already tried with no results. Maybe I just
misspelled it, and it didn't work.

It's working now, thank you so much for your help.





On Mon, Jan 4, 2021 at 3:01 PM Deucher, Alexander <Alexander.Deucher@amd.com>
wrote:

> [AMD Official Use Only - Internal Distribution Only]
>
> You might try enabling DC (the newer modesetting infrastructure).  Append
> amdgpu.dc=1 to the kernel command line in grub.
>
> Alex
>
> ------------------------------
> *From:* Davide Corrado <davide@davidecorrado.eu>
> *Sent:* Saturday, January 2, 2021 1:50 PM
> *To:* Deucher, Alexander <Alexander.Deucher@amd.com>
> *Cc:* Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie <
> airlied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>;
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>;
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>;
> linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> *Subject:* amdgpu does not support 3840x2160@30Hz on kaveri apu
>
> hello, I'd like to report this issue that I am having since I updated my
> display (samsung U28E590). The amdgpu does not support the native
> resolution of my new monitor, which is 3840x2160*.* Using a HDMI or DVI
> connection (I tried both, same results), the maximum supported refresh is
> 30Hz, so I'm stuck with that (don't have a displayport). The radeon module
> works fine, I'm having this issue just when I use amdgpu (which I'd like
> to, because performance is better).
>
> Some info of my hardware:
>
> cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G
> kernel version (I tried different ones and different linux distros, same
> results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020
> x86_64 x86_64 x86_64 GNU/Linux
> Monitor: Samsung U28E590.
>
> description:
> If I boot the system using amdgpu and no video mode selection, the system
> boots but I don't get a screen during boot and in wayland. I can connect
> using ssh, so the system is running fine, just no display; If I force a
> full HD resolution with "video:" in the kernel line, I can see the boot
> process but the screen disappears when wayland starts (because the default
> resolution is 3840x2160@30Hz). Using a full HD monitor results in no
> issues, so it must be related to this very 4k resolution.
>
> As I have already stated, radeon module works with the same
> software/hardware configuration.
> thanks you so much for your time :-)
>
> --
> Davide Corrado
> UNIX Team Leader
>
> Via Abramo Lincoln, 25
> 20129 Milano
>
> Tel +39 3474259950
>


-- 
Davide Corrado
UNIX Team Leader

Via Abramo Lincoln, 25
20129 Milano

Tel +39 3474259950

--00000000000041faa705b8145e80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>SOLVED<br></div><div><br></div><div>I opened a ticket=
 here:</div><div><br></div><div><a href=3D"https://gitlab.freedesktop.org/d=
rm/amd/-/issues/1425">https://gitlab.freedesktop.org/drm/amd/-/issues/1425<=
/a></div><div><br></div><div>and they suggested, at the end, the same hint =
(amdgpu.dc=3D1).</div><div><br></div><div>... which, I was sure, I already =
tried with no results. Maybe I just misspelled it, and it didn&#39;t work.<=
/div><div><br></div><div>It&#39;s working now, thank you so much for your h=
elp.</div><div><br></div><div><br></div><div><br></div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Jan 4, 2021 at 3:01 PM Deucher, Alexander &lt;<a href=3D"mailto:Alexande=
r.Deucher@amd.com">Alexander.Deucher@amd.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:rgb(0,120,215);margin:5p=
t" align=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
You might try enabling DC (the newer modesetting infrastructure).=C2=A0 App=
end amdgpu.dc=3D1 to the kernel command line in grub.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Alex</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_-7159689094131398294appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-7159689094131398294divRplyFwdMsg" dir=3D"ltr"><font sty=
le=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fro=
m:</b> Davide Corrado &lt;<a href=3D"mailto:davide@davidecorrado.eu" target=
=3D"_blank">davide@davidecorrado.eu</a>&gt;<br>
<b>Sent:</b> Saturday, January 2, 2021 1:50 PM<br>
<b>To:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om" target=3D"_blank">Alexander.Deucher@amd.com</a>&gt;<br>
<b>Cc:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com=
" target=3D"_blank">Christian.Koenig@amd.com</a>&gt;; <a href=3D"mailto:air=
lied@linux.ie" target=3D"_blank">airlied@linux.ie</a> &lt;<a href=3D"mailto=
:airlied@linux.ie" target=3D"_blank">airlied@linux.ie</a>&gt;; <a href=3D"m=
ailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a> &lt;<a href=3D=
"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;; <a href=
=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org" tar=
get=3D"_blank">amd-gfx@lists.freedesktop.org</a>&gt;; <a href=3D"mailto:dri=
-devel@lists.freedesktop.org" target=3D"_blank">dri-devel@lists.freedesktop=
.org</a> &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_=
blank">dri-devel@lists.freedesktop.org</a>&gt;;
 <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux-ke=
rnel@vger.kernel.org</a> &lt;<a href=3D"mailto:linux-kernel@vger.kernel.org=
" target=3D"_blank">linux-kernel@vger.kernel.org</a>&gt;<br>
<b>Subject:</b> amdgpu does not support 3840x2160@30Hz on kaveri apu</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div>hello, I&#39;d like to report this issue that I am having since I upda=
ted my display (samsung U28E590). The amdgpu does not support the native re=
solution of my new monitor, which is 3840x2160<i>.</i> Using a HDMI or DVI =
connection (I tried both, same results),
 the maximum supported refresh is 30Hz, so I&#39;m stuck with that (don&#39=
;t have a displayport). The radeon module works fine, I&#39;m having this i=
ssue just when I use amdgpu (which I&#39;d like to, because performance is =
better).</div>
<div><br>
</div>
<div>Some info of my hardware:</div>
<div><br>
</div>
<div>cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G</div>
<div>kernel version (I tried different ones and different linux distros, sa=
me results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020 x8=
6_64 x86_64 x86_64 GNU/Linux</div>
<div>Monitor: Samsung U28E590.</div>
<div><br>
</div>
<div>description:<br>
</div>
<div>If I boot the system using amdgpu and no video mode selection, the sys=
tem boots but I don&#39;t get a screen during boot and in wayland. I can co=
nnect using ssh, so the system is running fine, just no display; If I force=
 a full HD resolution with &quot;video:&quot;
 in the kernel line, I can see the boot process but the screen disappears w=
hen wayland starts (because the default resolution is 3840x2160@30Hz). Usin=
g a full HD monitor results in no issues, so it must be related to this ver=
y 4k resolution.<br>
</div>
<div><br>
</div>
<div>As I have already stated, radeon module works with the same software/h=
ardware configuration.<br>
</div>
thanks you so much for your time :-)<br>
<div>
<div><br>
-- <br>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">Davide Corrado<br>
<div>UNIX Team Leader<span><br>
</span></div>
<div><br>
</div>
Via Abramo Lincoln, 25<br>
20129 Milano<br>
<br>
Tel +39 3474259950<br>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div><div dir=3D"ltr">Davide Corrado<br><div>UNIX Team Leader<span><br></=
span></div><div><br></div>Via Abramo Lincoln, 25<br>20129 Milano<br><br>Tel=
 +39 3474259950<br></div></div></div></div></div></div></div></div>

--00000000000041faa705b8145e80--

--===============0267966370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0267966370==--
