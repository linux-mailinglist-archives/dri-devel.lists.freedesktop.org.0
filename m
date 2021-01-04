Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D882EA66C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881776E077;
	Tue,  5 Jan 2021 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271E89D9A;
 Mon,  4 Jan 2021 12:37:56 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id q5so25107006ilc.10;
 Mon, 04 Jan 2021 04:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EPHv7BVb2X/PWW1/GyJ5rqSu6qKtZbD/Q+JoLGq6Vas=;
 b=sTVRA1h772AeoN0dWFUmd15t4EiQdimyfokCGPUGiRY2MilIOpKOQhL7DU5xjik70x
 hqFvOEGSEE9kQ61wd8JVHB6RlRO9DnMNsSGpJqPfAnQ6b+haO20MV3vSBN3sCSfZ5A8I
 MsxJisVpyajYAK2u4sDRxzNMTlmGzajzW1yMyB/7vUuym5q0tBFum0VExUBQjQOr+xIG
 AzYrJwKjumZWZSqFZFI9YLB9poQZHBUEYUMCDm1DftBYx/cap6NkFzW3+y3CGMtwFzow
 MysglqxWap0AhAkupiKscoUxjT7QpjvMWGyd41n+WJfbckGSP0pqcGQ6vT53Eiw5LuNc
 rknw==
X-Gm-Message-State: AOAM53361IiCOEFfxvtVtKB4obXF3ZfCW3RxxwrjxCzsxMbO0bC/kJgF
 CGquVLsBenKiushWx5JTZ6BTbZtHDsLRF/KdMairFM8GiBQ=
X-Google-Smtp-Source: ABdhPJw89djuFQL8TO55Mafxo8GNJRpzji4pt7+QKZU+t1Lb1hXLsGaLdOzvLaPdgap4VFUpvwYCsb3iLbsmWX22unQ=
X-Received: by 2002:a05:6e02:1185:: with SMTP id
 y5mr72477063ili.119.1609763876180; 
 Mon, 04 Jan 2021 04:37:56 -0800 (PST)
MIME-Version: 1.0
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
 <4f208b1a-b90a-6afb-79a7-c5027f7529b2@gmail.com>
 <CAM0ywnycLPS9de-3QLhoreM=dNrsn4-=un8EFsw8Wf5g4z91Dw@mail.gmail.com>
In-Reply-To: <CAM0ywnycLPS9de-3QLhoreM=dNrsn4-=un8EFsw8Wf5g4z91Dw@mail.gmail.com>
From: Davide Corrado <davide@davidecorrado.eu>
Date: Mon, 4 Jan 2021 13:37:45 +0100
Message-ID: <CAM0ywnxfw6CngRnVhB-9f_5TOVaGe9KO6LJ310vqiguz=wj10Q@mail.gmail.com>
Subject: Re: amdgpu does not support 3840x2160@30Hz on kaveri apu
To: christian.koenig@amd.com
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0424577380=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0424577380==
Content-Type: multipart/alternative; boundary="0000000000000315b605b8125c11"

--0000000000000315b605b8125c11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Btw, should the driver switch to the lower supported resolution then?

Il Lun 4 Gen 2021, 13:04 Davide Corrado <davide@davidecorrado.eu> ha
scritto:

> Hello. This resolution is supported by the Apu and the motherboard specs.
> Will try what you suggest and let you know
>
> Il Lun 4 Gen 2021, 12:10 Christian K=C3=B6nig <ckoenig.leichtzumerken@gma=
il.com>
> ha scritto:
>
>> Hi Davide,
>>
>> adding a few of our AMD display people.
>>
>> In general as already suggested by others opening a bug report to track
>> this is the right thing to do.
>>
>> In the past we had a few bug reports like this because amdgpu is more
>> strict in checking hardware limitations.
>>
>> For example it can be that your HDMI port on the board can only handle a
>> certain maximum pixel clock, but radeon is ignoring this while amdgpu is=
n't.
>>
>> What you can try to do is to manually override the used mode, e.g. copy
>> the modeline used when radeon is active and manually add that using xran=
dr
>> when amdgpu is active and see if it works or not.
>>
>> Regards,
>> Christian.
>>
>> Am 02.01.21 um 19:50 schrieb Davide Corrado:
>>
>> hello, I'd like to report this issue that I am having since I updated my
>> display (samsung U28E590). The amdgpu does not support the native
>> resolution of my new monitor, which is 3840x2160*.* Using a HDMI or DVI
>> connection (I tried both, same results), the maximum supported refresh i=
s
>> 30Hz, so I'm stuck with that (don't have a displayport). The radeon modu=
le
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
>> If I boot the system using amdgpu and no video mode selection, the syste=
m
>> boots but I don't get a screen during boot and in wayland. I can connect
>> using ssh, so the system is running fine, just no display; If I force a
>> full HD resolution with "video:" in the kernel line, I can see the boot
>> process but the screen disappears when wayland starts (because the defau=
lt
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
>>
>> _______________________________________________
>> amd-gfx mailing listamd-gfx@lists.freedesktop.orghttps://lists.freedeskt=
op.org/mailman/listinfo/amd-gfx
>>
>>
>>

--0000000000000315b605b8125c11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Btw, should the driver switch to the lower supported reso=
lution then?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Il Lun 4 Gen 2021, 13:04 Davide Corrado &lt;<a href=3D"mailto:d=
avide@davidecorrado.eu">davide@davidecorrado.eu</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Hello. This resolution i=
s supported by the Apu and the motherboard specs. Will try what you suggest=
 and let you know</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Il Lun 4 Gen 2021, 12:10 Christian K=C3=B6nig &lt;<a href=
=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank" rel=3D"noref=
errer">ckoenig.leichtzumerken@gmail.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>Hi Davide,<br>
      <br>
      adding a few of our AMD display people.<br>
      <br>
      In general as already suggested by others opening a bug report to
      track this is the right thing to do.<br>
      <br>
      In the past we had a few bug reports like this because amdgpu is
      more strict in checking hardware limitations.<br>
      <br>
      For example it can be that your HDMI port on the board can only
      handle a certain maximum pixel clock, but radeon is ignoring this
      while amdgpu isn&#39;t.<br>
      <br>
      What you can try to do is to manually override the used mode, e.g.
      copy the modeline used when radeon is active and manually add that
      using xrandr when amdgpu is active and see if it works or not.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      Am 02.01.21 um 19:50 schrieb Davide Corrado:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>hello, I&#39;d like to report this issue that I am having sinc=
e
          I updated my display (samsung U28E590). The amdgpu does not
          support the native resolution of my new monitor, which is
          3840x2160<i>.</i> Using a HDMI or DVI connection (I tried
          both, same results), the maximum supported refresh is 30Hz, so
          I&#39;m stuck with that (don&#39;t have a displayport). The radeo=
n
          module works fine, I&#39;m having this issue just when I use
          amdgpu (which I&#39;d like to, because performance is better).</d=
iv>
        <div><br>
        </div>
        <div>Some info of my hardware:</div>
        <div><br>
        </div>
        <div>cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G</div>
        <div>kernel version (I tried different ones and different linux
          distros, same results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec
          21 14:08:22 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux</div>
        <div>Monitor: Samsung U28E590.</div>
        <div><br>
        </div>
        <div>description:<br>
        </div>
        <div>If I boot the system using amdgpu and no video mode
          selection, the system boots but I don&#39;t get a screen during
          boot and in wayland. I can connect using ssh, so the system is
          running fine, just no display; If I force a full HD resolution
          with &quot;video:&quot; in the kernel line, I can see the boot pr=
ocess
          but the screen disappears when wayland starts (because the
          default resolution is 3840x2160@30Hz). Using a full HD monitor
          results in no issues, so it must be related to this very 4k
          resolution.<br>
        </div>
        <div><br>
        </div>
        <div>As I have already stated, radeon module works with the same
          software/hardware configuration.<br>
        </div>
        thanks you so much for your time :-)<br>
        <div>
          <div><br>
            -- <br>
            <div dir=3D"ltr" data-smartmail=3D"gmail_signature">
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
      <br>
      <fieldset></fieldset>
      <pre>_______________________________________________
amd-gfx mailing list
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" rel=3D"noreferrer noreferr=
er" target=3D"_blank">amd-gfx@lists.freedesktop.org</a>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </div>

</blockquote></div>
</blockquote></div>

--0000000000000315b605b8125c11--

--===============0424577380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0424577380==--
