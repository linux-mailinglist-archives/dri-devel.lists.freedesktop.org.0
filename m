Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15022E91D7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEC789C5E;
	Mon,  4 Jan 2021 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5389930;
 Sun,  3 Jan 2021 11:15:26 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id n9so22732884ili.0;
 Sun, 03 Jan 2021 03:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cuU+meHv+cyXQ0Y1KI8HgSLxk9isQZzfJFR0KSLBo+8=;
 b=rHHN7ztMIEFoZm3GW7Ni2L4DDgIfH531Mf9LzZQj2mheUQNPLAG7JPhJp/L1H7mbOR
 /CkUY9N6XrB0JPNrx+0s/GUidqpKnyxRhH6xMdS0+hDhOZveUE4aj4P7jMKw3MMtD8mA
 bkPTrTP/6+Ow06oGJa7ISDKvpqkESMOJFkqcCyyZtW78IRMR6f1YEYQJ2H4dDSlKrL94
 bd8ixT/DisJuaw1gurBe4vVtApMGbPv+h526aCqX4sxPLDGn0rvywePGGo+2Rj4aYYgL
 KgCTxPv/sHe3i5nCOsYVPZWwsKH79OyVE9Ldk4brJ4LfcEejfA0snHUvLGXx8LpptgPj
 rUnQ==
X-Gm-Message-State: AOAM533XKojdNHXAOfQPL2/Nlw7ei4COBjHWsr4XLgTHWC+pSnAq90lb
 mBYWEkIR7bTIbgQeuQFkuQmbSH8sMdW/JR2jYx8=
X-Google-Smtp-Source: ABdhPJzskj3i9vu1Tycu9y6nb87dByLw6Fg6LPH+SWLyd62SQBBumrf68RBLtDRUAgzxdiQPNEfa81lJKyrI4oeDaUc=
X-Received: by 2002:a92:ccce:: with SMTP id u14mr66741922ilq.152.1609672525290; 
 Sun, 03 Jan 2021 03:15:25 -0800 (PST)
MIME-Version: 1.0
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
 <CAHbf0-EyfNYkcvBhnBt=rTsCTLbJATApE2sZwfyRizN6JrS4iw@mail.gmail.com>
In-Reply-To: <CAHbf0-EyfNYkcvBhnBt=rTsCTLbJATApE2sZwfyRizN6JrS4iw@mail.gmail.com>
From: Davide Corrado <davide@davidecorrado.eu>
Date: Sun, 3 Jan 2021 12:15:15 +0100
Message-ID: <CAM0ywnzGBP6ABL3g0EKwazbHMDTiGj34KxZw_KURewtg7YYuPA@mail.gmail.com>
Subject: Re: amdgpu does not support 3840x2160@30Hz on kaveri apu
To: Mike Lothian <mike@fireburn.co.uk>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1031813262=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1031813262==
Content-Type: multipart/alternative; boundary="00000000000013237205b7fd1733"

--00000000000013237205b7fd1733
Content-Type: text/plain; charset="UTF-8"

Cool, thanks!

Il Dom 3 Gen 2021, 12:06 Mike Lothian <mike@fireburn.co.uk> ha scritto:

> Hi
>
> You're probably best reporting the bug here:
>
> https://gitlab.freedesktop.org/drm/amd/-/issues
>
> Attach the output of dmesg from both Radeon and AMDGPU and the compositor
> / Wayland logs (as you're not using X)
>
> Cheers
>
> Mike
>
>
>
> On Sun, 3 Jan 2021, 06:32 Davide Corrado, <davide@davidecorrado.eu> wrote:
>
>> hello, I'd like to report this issue that I am having since I updated my
>> display (samsung U28E590). The amdgpu does not support the native
>> resolution of my new monitor, which is 3840x2160*.* Using a HDMI or DVI
>> connection (I tried both, same results), the maximum supported refresh is
>> 30Hz, so I'm stuck with that (don't have a displayport). The radeon module
>> works fine, I'm having this issue just when I use amdgpu (which I'd like
>> to, because performance is better).
>>
>> Some info of my hardware:
>>
>> cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G
>> kernel version (I tried different ones and different linux distros, same
>> results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020
>> x86_64 x86_64 x86_64 GNU/Linux
>> Monitor: Samsung U28E590.
>>
>> description:
>> If I boot the system using amdgpu and no video mode selection, the system
>> boots but I don't get a screen during boot and in wayland. I can connect
>> using ssh, so the system is running fine, just no display; If I force a
>> full HD resolution with "video:" in the kernel line, I can see the boot
>> process but the screen disappears when wayland starts (because the default
>> resolution is 3840x2160@30Hz). Using a full HD monitor results in no
>> issues, so it must be related to this very 4k resolution.
>>
>> As I have already stated, radeon module works with the same
>> software/hardware configuration.
>> thanks you so much for your time :-)
>>
>> --
>> Davide Corrado
>> UNIX Team Leader
>>
>> Via Abramo Lincoln, 25
>> 20129 Milano
>>
>> Tel +39 3474259950
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>
>

--00000000000013237205b7fd1733
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Cool, thanks!=C2=A0</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Il Dom 3 Gen 2021, 12:06 Mike Lothian =
&lt;<a href=3D"mailto:mike@fireburn.co.uk">mike@fireburn.co.uk</a>&gt; ha s=
critto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Hi<div di=
r=3D"auto"><br></div><div dir=3D"auto">You&#39;re probably best reporting t=
he bug here:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"=
https://gitlab.freedesktop.org/drm/amd/-/issues" target=3D"_blank" rel=3D"n=
oreferrer">https://gitlab.freedesktop.org/drm/amd/-/issues</a></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Attach the output of dmesg from both=
 Radeon and AMDGPU and the compositor / Wayland logs (as you&#39;re not usi=
ng X)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Mike</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sun, 3 Jan 2021, 06:32 Davide Corrado, &l=
t;<a href=3D"mailto:davide@davidecorrado.eu" target=3D"_blank" rel=3D"noref=
errer">davide@davidecorrado.eu</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div>hello, I&#39;d like to report this issue t=
hat I am having since I updated my display (samsung U28E590). The amdgpu do=
es not support the native resolution of my new monitor, which is 3840x2160<=
i>.</i> Using a HDMI or DVI connection (I tried both, same results), the ma=
ximum supported refresh is 30Hz, so I&#39;m stuck with that (don&#39;t have=
 a displayport). The radeon module works fine, I&#39;m having this issue ju=
st when I use amdgpu (which I&#39;d like to, because performance is better)=
.</div><div><br></div><div>Some info of my hardware:</div><div><br></div><d=
iv>cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G</div><div>kernel ve=
rsion (I tried different ones and different linux distros, same results!): =
5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 2020 x86_64 x86_64 x8=
6_64 GNU/Linux</div><div>Monitor: Samsung U28E590.</div><div><br></div><div=
>description:<br></div><div>If I boot the system using amdgpu and no video =
mode selection, the system boots but I don&#39;t get a screen during boot a=
nd in wayland. I can connect using ssh, so the system is running fine, just=
 no display; If I force a full HD resolution with &quot;video:&quot; in the=
 kernel line, I can see the boot process but the screen disappears when way=
land starts (because the default resolution is 3840x2160@30Hz). Using a ful=
l HD monitor results in no issues, so it must be related to this very 4k re=
solution.<br></div><div><br></div><div>As I have already stated, radeon mod=
ule works with the same software/hardware configuration.<br></div>thanks yo=
u so much for your time :-)<br><div><div><br>-- <br><div dir=3D"ltr" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><div><div dir=3D"ltr">Davide Corrado<br><div>UNIX Team Leade=
r<span><br></span></div><div><br></div>Via Abramo Lincoln, 25<br>20129 Mila=
no<br><br>Tel +39 3474259950<br></div></div></div></div></div></div></div><=
/div></div></div></div>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" rel=3D"noreferrer noreferr=
er" target=3D"_blank">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/mailman/listinfo/amd-gfx</a><br>
</blockquote></div>
</blockquote></div>

--00000000000013237205b7fd1733--

--===============1031813262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1031813262==--
