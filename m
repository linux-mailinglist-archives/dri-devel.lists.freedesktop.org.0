Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86202EA677
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2C6E081;
	Tue,  5 Jan 2021 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8D9892F2;
 Mon,  4 Jan 2021 12:05:00 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id m23so24818163ioy.2;
 Mon, 04 Jan 2021 04:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUBMrAmlSOZhdrm4eF9Z+KjHV7JViNGZkg6sdwN3kpM=;
 b=TJwegq2S/QmGziiDOH5HVQcg0lXIbY/ziGCY0zNuvEUkh/cN2vx5K8gZYmbdj4XG1t
 GTwvEOPqbHyTqtfrXcxHsN0X9/VVf2Hwsmd8HFrcxPdqqW5yK6Z4wJsNkZoGi3tkaqV0
 pjCiU6qCmOpzZglmkcjKcZ9T7w4qBYW2oDlwzrjtWIzd8qi115o3JD1CDOyA+YF+LHns
 Agu6X6xpjKlZFckUPNJtJNRyfBigT1MrzrXe4FxxT8saBNYu0NOQDmoT5rBP/n5imEHC
 +vosPjG/uRQJnhvp9s2gLzC84ItpjyyBpW0GSOjAl0MPLI+bestlguNaNqnKLRAgq8Ul
 TvUw==
X-Gm-Message-State: AOAM530vowg6AymcukuBWWMKmeBb8sawyacN0KlXbfiw2JxWLnpmhvvn
 3G7+Ow+zi1MTKHL8sovqG07Q3qd/Q6mIi7ov0cY=
X-Google-Smtp-Source: ABdhPJxMciMED3uDX6vpaNNq6iBRllIplrCWfmMhVlJ+p2hXh+7qXybHSpY4aer7EF1Eo0WE0AyMeT7FHf+OQi5TPhM=
X-Received: by 2002:a02:8585:: with SMTP id d5mr62156648jai.109.1609761899574; 
 Mon, 04 Jan 2021 04:04:59 -0800 (PST)
MIME-Version: 1.0
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
 <4f208b1a-b90a-6afb-79a7-c5027f7529b2@gmail.com>
In-Reply-To: <4f208b1a-b90a-6afb-79a7-c5027f7529b2@gmail.com>
From: Davide Corrado <davide@davidecorrado.eu>
Date: Mon, 4 Jan 2021 13:04:49 +0100
Message-ID: <CAM0ywnycLPS9de-3QLhoreM=dNrsn4-=un8EFsw8Wf5g4z91Dw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0807221683=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0807221683==
Content-Type: multipart/alternative; boundary="000000000000327adb05b811e638"

--000000000000327adb05b811e638
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello. This resolution is supported by the Apu and the motherboard specs.
Will try what you suggest and let you know

Il Lun 4 Gen 2021, 12:10 Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail=
.com>
ha scritto:

> Hi Davide,
>
> adding a few of our AMD display people.
>
> In general as already suggested by others opening a bug report to track
> this is the right thing to do.
>
> In the past we had a few bug reports like this because amdgpu is more
> strict in checking hardware limitations.
>
> For example it can be that your HDMI port on the board can only handle a
> certain maximum pixel clock, but radeon is ignoring this while amdgpu isn=
't.
>
> What you can try to do is to manually override the used mode, e.g. copy
> the modeline used when radeon is active and manually add that using xrand=
r
> when amdgpu is active and see if it works or not.
>
> Regards,
> Christian.
>
> Am 02.01.21 um 19:50 schrieb Davide Corrado:
>
> hello, I'd like to report this issue that I am having since I updated my
> display (samsung U28E590). The amdgpu does not support the native
> resolution of my new monitor, which is 3840x2160*.* Using a HDMI or DVI
> connection (I tried both, same results), the maximum supported refresh is
> 30Hz, so I'm stuck with that (don't have a displayport). The radeon modul=
e
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
> process but the screen disappears when wayland starts (because the defaul=
t
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
> _______________________________________________
> amd-gfx mailing listamd-gfx@lists.freedesktop.orghttps://lists.freedeskto=
p.org/mailman/listinfo/amd-gfx
>
>
>

--000000000000327adb05b811e638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello. This resolution is supported by the Apu and the mo=
therboard specs. Will try what you suggest and let you know</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il Lun 4 Gen 202=
1, 12:10 Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@=
gmail.com">ckoenig.leichtzumerken@gmail.com</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
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
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank" rel=3D"n=
oreferrer">amd-gfx@lists.freedesktop.org</a>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" target=
=3D"_blank" rel=3D"noreferrer">https://lists.freedesktop.org/mailman/listin=
fo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000327adb05b811e638--

--===============0807221683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0807221683==--
