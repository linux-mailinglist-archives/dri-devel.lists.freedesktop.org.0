Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F1710D53
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 15:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAC410E0B4;
	Thu, 25 May 2023 13:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AEC10E0B4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685021838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fRqwtPfrYiaorS/XrNRhEIvrzW43ho6+lNQt/9/oc5k=;
 b=ZEoZ4+CB2RZ7Z7AaU2BYPvwWh1/4uIIujHgMh1CldacrXs0zmWAezveQs42r1yUkaa4dXy
 cvzFlaGUjUwKlrZ+KatlldulXnEUsiMfQ3hV8rMHoBAWyWBzDBT0hEcoHohzCdV3vs8+zG
 8gSJQmB+5L0LVC6aLb6zQGQ7dvp/8I0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-3pjDCFiqONOq_DklZkzgyQ-1; Thu, 25 May 2023 09:37:17 -0400
X-MC-Unique: 3pjDCFiqONOq_DklZkzgyQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f4d2efca9cso56398e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 06:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685021835; x=1687613835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fRqwtPfrYiaorS/XrNRhEIvrzW43ho6+lNQt/9/oc5k=;
 b=MUz2dwLXw5IcosxgLshtYOy/tJbWAUkVQ9DP4qSVfQ+5sKztqN4D38rRbA0/TF/Ftm
 NfWO3eYj0KtCqS2H5L1DDxkz9QoT0tJwVf5kMWZlFYd5ecXNm0EnlzVej2Qgzqpxi8Mh
 5QnW/FVAPyVzwGgVUzOcNAsNTvVAYoSltdMOLq3n2Z56DAq86hLt0JocTmJQqvTsctaB
 Iia0upCt68JIhbhulmM/oKUqxlv+J/NvF9cEU3r3bIM8Ns+cGQukWhwnUk/8PC/idFK1
 IjtJYkb1eNZ4cWsfj1u3nLzaqlOs6P/FTcGXQBPrXfH1/GZz+Y0VzqKwtOQa6POwBizZ
 TDIQ==
X-Gm-Message-State: AC+VfDynqQ3HZZZMqg4+7bSX2PC2hzHDi9LTMgljj++1Mx1J99AEXzmY
 qhkH91xWbmDz826ewfTdHvoggNn8St8PC9qTSf7+13OynjSqgxa9LczXqDkt1bt377Rc0GT7d4n
 ABlyj7EmMEsTvubnxGkzaRqyDy6UUEJ2dC4YrnEMyCqak
X-Received: by 2002:a2e:b62c:0:b0:2af:1ce9:41ac with SMTP id
 s12-20020a2eb62c000000b002af1ce941acmr7719932ljn.4.1685021835686; 
 Thu, 25 May 2023 06:37:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dIPRGKlFZKGKsRGv4KkwfLcWRlZfcyZ49rIkMaOSqhsx98fsATCLwgvUr7nUMnVPV4asAYQkIYTjFLQqBeYU=
X-Received: by 2002:a2e:b62c:0:b0:2af:1ce9:41ac with SMTP id
 s12-20020a2eb62c000000b002af1ce941acmr7719913ljn.4.1685021835395; Thu, 25 May
 2023 06:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
 <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
 <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>
In-Reply-To: <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 25 May 2023 15:37:03 +0200
Message-ID: <CACO55tvXVD8ByKeg5iNP9rQy7Xcz5b3cfYHwy09f=OKtJ3_Byg@mail.gmail.com>
Subject: Re: Fwd: absent both plymouth, and video= on linu lines, vtty[1-6]
 framebuffers produce vast raster right and bottom borders on the larger
 resolution of two displays
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f0168405fc84b769"
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
Cc: Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Antonino Daplas <adaplas@gmail.com>,
 Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>, Felix Miata <mrmazda@earthlink.net>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f0168405fc84b769
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wouldn't be surprised if 4a16dd9d18a0 is the culprit and that it was
always broken like this with drm fbdev. Anyway, the logs don't indicate we
are actually doing anything wrong, It's just that the tty handling is a
little bonkers as always.

On Thu, May 25, 2023 at 1:37=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:

> On 5/25/23 17:55, Bagas Sanjaya wrote:
> > On 5/25/23 17:52, Bagas Sanjaya wrote:
> >> Hi,
> >>
> >> I notice a regression report on Bugzilla [1]. Quoting from it:
> >>
> >>> Original Summary:
> >>> absent both plymouth, and video=3D on linu lines, vtty[1-6] framebuff=
ers
> produce vast raster right and bottom borders on the larger resolution of
> two displays
> >>>
> >>> To reproduce:
> >>> 1-connect two unequal native resolution displays to a Tesla or Firmi
> GPU
> >>> 2-don't have plymouth in use (I don't ever have it installed, so don'=
t
> know whether it impacts)
> >>> 3-don't include e.g. video=3D1440x900@60 directive on Grub's linu lin=
es
> >>> 4-boot Tumbleweed or Fedora 38
> >>> 5-switch to a vtty, e.g. Ctrl-Alt-F3
> >>>
> >>> Actual behavior:
> >>> 1-Both displays utilize the resolution (same pixel grid) of the lower
> resolution display
> >>> 2-Lower resolution display behaves as expected (light text on black
> background)
> >>> 3-Higher resolution display uses same pixels as lower resolution
> display, with light text on black background, leaving right side and bott=
om
> raster instead of black
> >>>
> >>> Expected behavior:
> >>> 1-Both displays utilize the resolution (same pixel grid) of the lower
> resolution display
> >>> 2-Lower resolution display behaves as expected
> >>> 3-Entire higher resolution display's background is black instead of
> portions in raster
> >>>
> >>> Workaround: add e.g. video=3D1440x900@60 to Grub's linu lines, which
> causes both displays to use the same nominal mode on the full display spa=
ce.
> >>>
> >>> Typical other linu line options:
> >>> noresume consoleblank=3D0 net.ifnames=3D0 ipv6.disable=3D1 preempt=3D=
full
> mitigations=3Dnone
> >>>
> >>> My Tesla has HDMI and DVI outputs, tested with 1920x1200 and 1680x105=
0
> displays.
> >>> My Fermi has dual DisplayPort, tested with 2560x1440 and 1680x1050
> displays.
> >>> Occurs Tumbleweed with 6.3.2 and 6.2.12 kernel-default, and with
> 6.2.15 on Fedora 38, and (partially with Tesla, right side only) with
> 6.2.12 and 6.3.3 on Mageia 9.
> >>> Does not occur with 6.1.12 kernel-default on NVidia, or with AMD
> Caicos (Terascale2) GPU, or with Intel Eaglelake GPU.
> >>> Tested only on legacy booting (no UEFI support).
> >>> Others might describe what I call "raster" as multicolored snow.
> >>
> >> See bugzilla for the full thread and attached dmesg.
> >>
> >> Anyway, I'm adding it to regzbot:
> >>
> >> #regzbot introduced: v6.1.12..v6.2.12
> >> #regzbot title: vast raster right and bottom borders on larger display
> (two displays with inequal resolution) unless forcing resolution with
> video=3D parameter
> >>
> >
> > Oops, I forget to add bugzilla link:
> >
> > #regzbot introduced: v6.1.12..v6.2.12
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217479
> > #regzbot from: Felix Miata <mrmazda@earthlink.net>
> >
>
> Oops, again, I messed up the regzbot entry (reporter field still assigned
> to me). Inconclusiving...
>
> #regzbot inconclusive: Wrong reporter assigned (from: doesn't take effect=
)
>
> Please ignore this thread as I will send a new one with proper regzbot
> commands.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
>
>

--000000000000f0168405fc84b769
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif">I wouldn&#39;t be surprised if=C2=A04a16dd9d18a0=
 is the culprit and that it was always broken like this with drm fbdev. Any=
way, the logs don&#39;t indicate we are actually doing anything wrong, It&#=
39;s just that the tty handling is a little bonkers as always.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 May 25, 2023 at 1:37=E2=80=AFPM Bagas Sanjaya &lt;<a href=3D"mailto:bagasd=
otme@gmail.com">bagasdotme@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 5/25/23 17:55, Bagas Sanjaya wrote:<=
br>
&gt; On 5/25/23 17:52, Bagas Sanjaya wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I notice a regression report on Bugzilla [1]. Quoting from it:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Original Summary:<br>
&gt;&gt;&gt; absent both plymouth, and video=3D on linu lines, vtty[1-6] fr=
amebuffers produce vast raster right and bottom borders on the larger resol=
ution of two displays<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To reproduce:<br>
&gt;&gt;&gt; 1-connect two unequal native resolution displays to a Tesla or=
 Firmi GPU<br>
&gt;&gt;&gt; 2-don&#39;t have plymouth in use (I don&#39;t ever have it ins=
talled, so don&#39;t know whether it impacts)<br>
&gt;&gt;&gt; 3-don&#39;t include e.g. video=3D1440x900@60 directive on Grub=
&#39;s linu lines<br>
&gt;&gt;&gt; 4-boot Tumbleweed or Fedora 38<br>
&gt;&gt;&gt; 5-switch to a vtty, e.g. Ctrl-Alt-F3<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Actual behavior:<br>
&gt;&gt;&gt; 1-Both displays utilize the resolution (same pixel grid) of th=
e lower resolution display<br>
&gt;&gt;&gt; 2-Lower resolution display behaves as expected (light text on =
black background)<br>
&gt;&gt;&gt; 3-Higher resolution display uses same pixels as lower resoluti=
on display, with light text on black background, leaving right side and bot=
tom raster instead of black<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Expected behavior:<br>
&gt;&gt;&gt; 1-Both displays utilize the resolution (same pixel grid) of th=
e lower resolution display<br>
&gt;&gt;&gt; 2-Lower resolution display behaves as expected<br>
&gt;&gt;&gt; 3-Entire higher resolution display&#39;s background is black i=
nstead of portions in raster<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Workaround: add e.g. video=3D1440x900@60 to Grub&#39;s linu li=
nes, which causes both displays to use the same nominal mode on the full di=
splay space.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Typical other linu line options:<br>
&gt;&gt;&gt; noresume consoleblank=3D0 net.ifnames=3D0 ipv6.disable=3D1 pre=
empt=3Dfull mitigations=3Dnone<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My Tesla has HDMI and DVI outputs, tested with 1920x1200 and 1=
680x1050 displays.<br>
&gt;&gt;&gt; My Fermi has dual DisplayPort, tested with 2560x1440 and 1680x=
1050 displays.<br>
&gt;&gt;&gt; Occurs Tumbleweed with 6.3.2 and 6.2.12 kernel-default, and wi=
th 6.2.15 on Fedora 38, and (partially with Tesla, right side only) with 6.=
2.12 and 6.3.3 on Mageia 9.<br>
&gt;&gt;&gt; Does not occur with 6.1.12 kernel-default on NVidia, or with A=
MD Caicos (Terascale2) GPU, or with Intel Eaglelake GPU.<br>
&gt;&gt;&gt; Tested only on legacy booting (no UEFI support).<br>
&gt;&gt;&gt; Others might describe what I call &quot;raster&quot; as multic=
olored snow.<br>
&gt;&gt;<br>
&gt;&gt; See bugzilla for the full thread and attached dmesg.<br>
&gt;&gt;<br>
&gt;&gt; Anyway, I&#39;m adding it to regzbot:<br>
&gt;&gt;<br>
&gt;&gt; #regzbot introduced: v6.1.12..v6.2.12<br>
&gt;&gt; #regzbot title: vast raster right and bottom borders on larger dis=
play (two displays with inequal resolution) unless forcing resolution with =
video=3D parameter<br>
&gt;&gt;<br>
&gt; <br>
&gt; Oops, I forget to add bugzilla link:<br>
&gt; <br>
&gt; #regzbot introduced: v6.1.12..v6.2.12 <a href=3D"https://bugzilla.kern=
el.org/show_bug.cgi?id=3D217479" rel=3D"noreferrer" target=3D"_blank">https=
://bugzilla.kernel.org/show_bug.cgi?id=3D217479</a><br>
&gt; #regzbot from: Felix Miata &lt;<a href=3D"mailto:mrmazda@earthlink.net=
" target=3D"_blank">mrmazda@earthlink.net</a>&gt;<br>
&gt; <br>
<br>
Oops, again, I messed up the regzbot entry (reporter field still assigned<b=
r>
to me). Inconclusiving...<br>
<br>
#regzbot inconclusive: Wrong reporter assigned (from: doesn&#39;t take effe=
ct)<br>
<br>
Please ignore this thread as I will send a new one with proper regzbot<br>
commands.<br>
<br>
Thanks.<br>
<br>
-- <br>
An old man doll... just what I always wanted! - Clara<br>
<br>
</blockquote></div></div>

--000000000000f0168405fc84b769--

