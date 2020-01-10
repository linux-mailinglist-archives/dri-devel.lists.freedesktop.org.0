Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CF13720F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 17:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17996EA44;
	Fri, 10 Jan 2020 16:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5377E89A6D;
 Fri, 10 Jan 2020 16:02:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q6so2287179wro.9;
 Fri, 10 Jan 2020 08:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fk4l7uGygizrgCjzbf0QE8J+XpL6US2LefSlzMowOTc=;
 b=NVBEGPNhnL488QezvjtNkfrWuBvTvtvebb7vpa5vAIAzNYqHBkRnWjdh23TVsRXWoJ
 SGc1PNlntHtywOBWO5FLUIGtvKNRNqPO3MTWauCfLU2FeHK6c2fhU3ekETcXy0ljjmWh
 ThoCdxx9AsZEzDavVUyJ2AaT1jmiISBMMtjqEUG2e8NNELZXDBi7lv1XcX13LH7YMvBY
 SaQcri0rruc8hFSAjTfxaMt4XN7Obxt9y0xVasNJ1sMGKrJS/b9A+VUEi24zdJ1QPjoj
 /3i1cwp2VAV3m/g8zGQ0bpTGlSxESX/FHPObeYD376/Piv1gv7dpjDpPPEkCWnh5V12F
 cq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fk4l7uGygizrgCjzbf0QE8J+XpL6US2LefSlzMowOTc=;
 b=OCwzslIWbpn9u1i4nEKJpx+CAmkH/MzueQ8TX20+kxtVRm2tVedVczjbOZtfn/RVwA
 rwbqRoHQgrb1JwrG/h92gPdvlFjC480nARszO2r/i9xcNxlXJdGcECuEPfeYKVl8gm3J
 Sq4pTD/mJkVGRDYRjIHBphgv3jyqET/KfsGqqE9d7TxKvxr1z4pMZs7JfZV9VhNuhdWI
 F63cdyHrH6I04TGGsy2Qv2bFsXENDLHJgIdmEtsn8JxFFLT6WL6F70QOj1gFD9c81PJ2
 2D8EOuv+tZz7eKoGMt88CTuq2MSTSPAyIHcDRDV4HJqDqhciO8rvzSVWKB0hvkQL6h80
 gZPA==
X-Gm-Message-State: APjAAAWG2YCYrmJVIkkXLtaNKqYH1LakduKacSWpSviyQjrhk8TFQDTz
 eHeZNHIm8dmJU4JN5kFsFjs4ZPLh7Y8XARGi0Vw=
X-Google-Smtp-Source: APXvYqxS9x4bESFullmo5dI3Te4aTGskQMwp2UyMm++IhPSTsPffIPhudMsris3wraNVGWHqIVVD1vnWbhunXcAx7Jc=
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr4151805wrp.71.1578672155990; 
 Fri, 10 Jan 2020 08:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
 <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
 <CADnq5_NPdg8MjQ5cB2aCD+US1Hv+FoP1gqKcA4W2e0pouG8cGQ@mail.gmail.com>
 <CAEsyxyjMsCU8rzyO0GewU_-uV5+UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com>
 <bae132f3-73e6-5004-c9a9-adb632338268@amd.com>
In-Reply-To: <bae132f3-73e6-5004-c9a9-adb632338268@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 10 Jan 2020 17:02:24 +0100
Message-ID: <CAEsyxyjr9MBFmVn_K_TBfq5mJO-OCLPKjwxX+xX9iRO+s7iLSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
To: Harry Wentland <hwentlan@amd.com>
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
Cc: mario.kleiner.de@gmail.de, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1246791235=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1246791235==
Content-Type: multipart/alternative; boundary="000000000000132222059bcb416a"

--000000000000132222059bcb416a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 10:26 PM Harry Wentland <hwentlan@amd.com> wrote:

>
>
> On 2020-01-09 4:04 p.m., Mario Kleiner wrote:
>
> On Thu, Jan 9, 2020 at 8:49 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
>> On Thu, Jan 9, 2020 at 11:47 AM Mario Kleiner
>> <mario.kleiner.de@gmail.com> wrote:
>> >
>> > On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher <alexdeucher@gmail.com>
>> wrote:
>> >>
>> >> On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
>> >> <mario.kleiner.de@gmail.com> wrote:
>> >> >
>> As Harry mentioned in the other thread, won't this only work if the
>> display was brought up by the vbios?  In the suspend/resume case,
>> won't we just fall back to 2.7Gbps?
>>
>> Alex
>>
>>
> Adding Harry to cc...
>
> The code is only executed for eDP. On the Intel side, it seems that
> intel_edp_init_dpcd() gets only called during driver load / modesetting
> init, so not on resume.
>
> On the AMD DC side, dc_link_detect_helper() has this early no-op return at
> the beginning:
>
> if ((link->connector_signal == SIGNAL_TYPE_LVDS ||
> 			link->connector_signal == SIGNAL_TYPE_EDP) &&
> 			link->local_sink)
> 		return true;
>
>
> So i guess if link->local_sink doesn't get NULL'ed during a suspend/resume
> cycle, then we never reach the setup code that would overwrite with non
> vbios settings?
>
> Sounds reasonable to me, given that eDP panels are usually fixed internal
> panels, nothing that gets hot(un-)plugged?
>
> I can't test, because suspend/resume with the Polaris gpu on the MBP 2017
> is totally broken atm., just as vgaswitcheroo can't do its job. Looks like
> powering down the gpu works, but powering up doesn't. And also modesetting
> at vgaswitcheroo switch time is no-go, because the DDC/AUX lines apparently
> can't be switched on that Apple gmux, and handover of that data seems to be
> not implemented in current vgaswitcheroo. At the moment switching between
> AMD only or Intel+AMD Prime setup is quite a pita...
>
>
> I haven't followed the entire discussion on the i915 thread but for the
> amdgpu dc patch I would prefer a DPCD quirk to override the reported link
> settings with the correct link rate.
>
> Harry
>
>
Ok, as you wish. How do i do that? Is there already some DP related
official mechanism, or do i just add some if-statement to

detect_edp_sink_caps
<https://elixir.bootlin.com/linux/v5.5-rc5/ident/detect_edp_sink_caps>()
that matches on a new EDID quirk to be defined for that panel in
drm_edid etc., and then

if (edit quirk for that panel)
    dpcd[DP_MAX_LINK_RATE
<https://elixir.bootlin.com/linux/v5.5-rc5/ident/DP_MAX_LINK_RATE>] =
0xc;

The other question would be if we should do it for this panel on AMD DC at
all? I see my original patch more as something to fix other odd (Apple?)
panels, than for this specific one. As mentioned above, photometer testing
on AMD DC with a Polaris on the MBP 2017 suggests that the deault 2.7 Gbps
8 bit mode + AMD's spatial dithering provides higher quality results for >=
10 bpc framebuffers than actually running the panel at 10 bit without
dithering.

As a little side-note, for squeezing out more precision than the 10 bpc
framebuffers we officially have in Mesa/OpenGL, my software Psychtoolbox
has some special hacks, playing funny tricks with resizing X-Screens,
applying bit-twiddling shaders to images and MMIO programming the gpu
"behind the back" of the driver, to get the gpu into RGBA16161616 linear
scanout mode. That gives up to 12 bpc precision on that panel according to
photometer measurements. While AMD's dithering with the panel in 8 bit + 4
bit spatial dithering gives pretty good results, panel at 10 bit + 2 bit
spatial dithering has some artifacts. And even at a normal 10 bit
framebuffer, the 8 bit panel + 2 bit dithering seems to give better results
than 10 bit panel mode.

-mario

--000000000000132222059bcb416a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 10:26 PM Harry=
 Wentland &lt;<a href=3D"mailto:hwentlan@amd.com">hwentlan@amd.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <br>
    <br>
    <div>On 2020-01-09 4:04 p.m., Mario Kleiner
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Thu, Jan 9, 2020 at 8:49 PM Alex Deucher &lt;<a=
 href=3D"mailto:alexdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.=
com</a>&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 9, =
2020 at
            11:47 AM Mario Kleiner<br>
            &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_bl=
ank">mario.kleiner.de@gmail.com</a>&gt;
            wrote:<br>
            &gt;<br>
            &gt; On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher &lt;<a href=3D=
"mailto:alexdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&=
gt;
            wrote:<br>
            &gt;&gt;<br>
            &gt;&gt; On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner<br>
            &gt;&gt; &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" targ=
et=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;
            wrote:<br>
            &gt;&gt; &gt;<br>
            As Harry mentioned in the other thread, won&#39;t this only wor=
k
            if the<br>
            display was brought up by the vbios?=C2=A0 In the suspend/resum=
e
            case,<br>
            won&#39;t we just fall back to 2.7Gbps?<br>
            <br>
            Alex<br>
            <br>
          </blockquote>
        </div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">Adding Harry to cc...<br>
        </div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">The code is only executed for eDP. On
          the Intel side, it seems that intel_edp_init_dpcd() gets only
          called during driver load / modesetting init, so not on
          resume.</div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">On the AMD DC side,
          dc_link_detect_helper() has this early no-op return at the
          beginning:</div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">
          <pre>if ((link-&gt;connector_signal =3D=3D SIGNAL_TYPE_LVDS ||
			link-&gt;connector_signal =3D=3D SIGNAL_TYPE_EDP) &amp;&amp;
			link-&gt;local_sink)
		return true;</pre>
        </div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">So i guess if link-&gt;local_sink
          doesn&#39;t get NULL&#39;ed during a suspend/resume cycle, then w=
e
          never reach the setup code that would overwrite with non vbios
          settings?</div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">Sounds reasonable to me, given that eDP
          panels are usually fixed internal panels, nothing that gets
          hot(un-)plugged?</div>
        <div class=3D"gmail_quote"><br>
        </div>
        <div class=3D"gmail_quote">I can&#39;t test, because suspend/resume
          with the Polaris gpu on the MBP 2017 is totally broken atm.,
          just as vgaswitcheroo can&#39;t do its job. Looks like powering
          down the gpu works, but powering up doesn&#39;t. And also
          modesetting at vgaswitcheroo switch time is no-go, because the
          DDC/AUX lines apparently can&#39;t be switched on that Apple gmux=
,
          and handover of that data seems to be not implemented in
          current vgaswitcheroo. At the moment switching between AMD
          only or Intel+AMD Prime setup is quite a pita...<br>
        </div>
        <div class=3D"gmail_quote"><br>
        </div>
      </div>
    </blockquote>
    <br>
    I haven&#39;t followed the entire discussion on the i915 thread but for
    the amdgpu dc patch I would prefer a DPCD quirk to override the
    reported link settings with the correct link rate.<br>
    <br>
    Harry<br>
    <br></div></blockquote><div><br></div><div>Ok, as you wish. How do i do=
 that? Is there already some DP related official mechanism, or do i just ad=
d some if-statement to <br><pre><span class=3D"gmail-nf"><a href=3D"https:/=
/elixir.bootlin.com/linux/v5.5-rc5/ident/detect_edp_sink_caps">detect_edp_s=
ink_caps</a></span><span class=3D"gmail-p">() that matches on a new EDID qu=
irk to be defined for that panel in drm_edid etc., and then<br><br>if (edit=
 quirk for that panel)<br>    dpcd[<span class=3D"gmail-cp"><a href=3D"http=
s://elixir.bootlin.com/linux/v5.5-rc5/ident/DP_MAX_LINK_RATE">DP_MAX_LINK_R=
ATE</a>] =3D 0xc;<br><br></span></span></pre> </div><div>The other question=
 would be if we should do it for this panel on AMD DC at all? I see my orig=
inal patch more as something to fix other odd (Apple?) panels, than for thi=
s specific one. As mentioned above, photometer testing on AMD DC with a Pol=
aris on the MBP 2017 suggests that the deault 2.7 Gbps 8 bit mode + AMD&#39=
;s spatial dithering provides higher quality results for &gt;=3D 10 bpc fra=
mebuffers than actually running the panel at 10 bit without dithering.<br><=
/div><div><br></div><div>As a little side-note, for squeezing out more prec=
ision than the 10 bpc framebuffers we officially have in Mesa/OpenGL, my so=
ftware Psychtoolbox has some special hacks, playing funny tricks with resiz=
ing X-Screens, applying bit-twiddling shaders to images and MMIO programmin=
g the gpu &quot;behind the back&quot; of the driver, to get the gpu into RG=
BA16161616 linear scanout mode. That gives up to 12 bpc precision on that p=
anel according to photometer measurements. While AMD&#39;s dithering with t=
he panel in 8 bit + 4 bit spatial dithering gives pretty good results, pane=
l at 10 bit + 2 bit spatial dithering has some artifacts. And even at a nor=
mal 10 bit framebuffer, the 8 bit panel + 2 bit dithering seems to give bet=
ter results than 10 bit panel mode.</div><div><br></div><div>-mario</div><d=
iv><br></div><div>=C2=A0</div></div></div>

--000000000000132222059bcb416a--

--===============1246791235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1246791235==--
