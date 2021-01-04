Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6D2E93F4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 12:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF589CF4;
	Mon,  4 Jan 2021 11:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE348959D;
 Mon,  4 Jan 2021 11:10:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lt17so36283399ejb.3;
 Mon, 04 Jan 2021 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Rk2YpDC6uC3V35j3Wtc7z2xlC0RaiWUROEaWtiO4S5E=;
 b=fZizny6rNj0WMLhl/C7ruJTgUye/lc8FNDyUDS7m5IcQld27yljA//KfsI/moUU5jD
 Pn3jWG56Tmjqnh2Ij9nh9/za4nJG5YMgig6+RRBk8VWi/PSkMr5mhvyjT5jHIwt05aaN
 BGE+tl0+XCZAKH0TKtxsS6W37z1jP5H3oks7k+uf1FVskEFWKMtFl922SM4TG0DcnNPB
 yWoAmpKh7O+YftQ4OMVcUHdWE8dhVuH0baYzEntKPCm5afVjudclbHPcL9xpyBIxLgDg
 vtJ54WQ45aZqRCn2eCdjKuuVlT2G6txYzF/id5T34G/nWOa+NMwuvq/ed4OVEOqgk6OM
 k9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=Rk2YpDC6uC3V35j3Wtc7z2xlC0RaiWUROEaWtiO4S5E=;
 b=Sj1AJT+nGexP1x3ZdhT+DwV4oKwtom2D4Tvfq8Wt8CUXlhBI4DSoCkbYJMBMtKGW0Q
 68l6lzaouqpUIJ1wGwFyxVmTB7CmjakX/ShWBq5OQtm4cGf9DJqEgzKJK/AFIAeBNlpd
 BW7c/SahSD6hH+igAafevmKum1p4hJ7/7bvcC3wv2jlKfq693ssLd5TIUHXlyKiZ+DuG
 3KsYRavXCxSmo70zMgBpzTkcphlQPBnKmouIqha68eooAfXYKoK9mDRfUZLgiMzdZiTp
 3oLEtUupjSpRrS2N2unTffo0qFRFlA98Vl5qrbmEIV5uRuJfpw/ba7qmHJWZk3agcHdP
 FwmQ==
X-Gm-Message-State: AOAM532pgs0dbmnm9p/jLuN1XrGkIpsKzS7XVAhsvaK8pkTL101p+Xr1
 MbCg7yWc6xJkvXw8Gukt3cTz09PAa7k=
X-Google-Smtp-Source: ABdhPJwLbAcwYBRjyaBVMhQ4STvIzDTAVprCdtFEnhvi8JkwPO6VRLFSKiP7ccch0GAT5GJhDVns/w==
X-Received: by 2002:a17:907:2131:: with SMTP id
 qo17mr65090955ejb.546.1609758651677; 
 Mon, 04 Jan 2021 03:10:51 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f18sm43461660edt.60.2021.01.04.03.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 03:10:51 -0800 (PST)
Subject: Re: amdgpu does not support 3840x2160@30Hz on kaveri apu
To: Davide Corrado <davide@davidecorrado.eu>, alexander.deucher@amd.com
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4f208b1a-b90a-6afb-79a7-c5027f7529b2@gmail.com>
Date: Mon, 4 Jan 2021 12:10:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1456973653=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1456973653==
Content-Type: multipart/alternative;
 boundary="------------AEA7A8BB94443FE0B183B10A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AEA7A8BB94443FE0B183B10A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Davide,

adding a few of our AMD display people.

In general as already suggested by others opening a bug report to track 
this is the right thing to do.

In the past we had a few bug reports like this because amdgpu is more 
strict in checking hardware limitations.

For example it can be that your HDMI port on the board can only handle a 
certain maximum pixel clock, but radeon is ignoring this while amdgpu isn't.

What you can try to do is to manually override the used mode, e.g. copy 
the modeline used when radeon is active and manually add that using 
xrandr when amdgpu is active and see if it works or not.

Regards,
Christian.

Am 02.01.21 um 19:50 schrieb Davide Corrado:
> hello, I'd like to report this issue that I am having since I updated 
> my display (samsung U28E590). The amdgpu does not support the native 
> resolution of my new monitor, which is 3840x2160/./ Using a HDMI or 
> DVI connection (I tried both, same results), the maximum supported 
> refresh is 30Hz, so I'm stuck with that (don't have a displayport). 
> The radeon module works fine, I'm having this issue just when I use 
> amdgpu (which I'd like to, because performance is better).
>
> Some info of my hardware:
>
> cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G
> kernel version (I tried different ones and different linux distros, 
> same results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22 UTC 
> 2020 x86_64 x86_64 x86_64 GNU/Linux
> Monitor: Samsung U28E590.
>
> description:
> If I boot the system using amdgpu and no video mode selection, the 
> system boots but I don't get a screen during boot and in wayland. I 
> can connect using ssh, so the system is running fine, just no display; 
> If I force a full HD resolution with "video:" in the kernel line, I 
> can see the boot process but the screen disappears when wayland starts 
> (because the default resolution is 3840x2160@30Hz). Using a full HD 
> monitor results in no issues, so it must be related to this very 4k 
> resolution.
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
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------AEA7A8BB94443FE0B183B10A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Davide,<br>
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
      while amdgpu isn't.<br>
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
    <blockquote type="cite"
cite="mid:CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>hello, I'd like to report this issue that I am having since
          I updated my display (samsung U28E590). The amdgpu does not
          support the native resolution of my new monitor, which is
          3840x2160<i>.</i> Using a HDMI or DVI connection (I tried
          both, same results), the maximum supported refresh is 30Hz, so
          I'm stuck with that (don't have a displayport). The radeon
          module works fine, I'm having this issue just when I use
          amdgpu (which I'd like to, because performance is better).</div>
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
          selection, the system boots but I don't get a screen during
          boot and in wayland. I can connect using ssh, so the system is
          running fine, just no display; If I force a full HD resolution
          with "video:" in the kernel line, I can see the boot process
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
            <div dir="ltr" class="gmail_signature"
              data-smartmail="gmail_signature">
              <div dir="ltr">
                <div>
                  <div dir="ltr">
                    <div>
                      <div dir="ltr">
                        <div>
                          <div dir="ltr">Davide Corrado<br>
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
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------AEA7A8BB94443FE0B183B10A--

--===============1456973653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1456973653==--
