Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA99E7C4D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 00:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C910E1DB;
	Fri,  6 Dec 2024 23:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="t92R02nF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADF610E1DB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 23:13:40 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-725aa5c597cso2028786b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733526820; x=1734131620;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ffDbDjoVU0iyMZ+EBRurPZ1YWaazAPhZEYSoFhXEpws=;
 b=t92R02nF/IueYusUSMZYSQVXnn9Of4N22i2vI6UwPN/OG9o7AtfNiefY/BcPkzsHqC
 pekP+nDoxMaSlKIcehO6VbEExbL00e0VXwNiZbauE9KPKe3cGX7fKbiw1ZmhmpDvPzrj
 u3cDg3BlcGPe5gVQEVl4SWYxVb1kXSRIEgDq5sE10MRgQTWzB1Kw+tF8aRlCQmDv8ZYM
 vwUTOhZvSoQSR12sQ9x7TQudihdbOCW/93bBJ9OcFWFagkp8t6u5CUGYX4nOq2KqoYcj
 Rl8gEH10Ei/ZX5vXCBw1zO4vv8fwsZd0b4/bJ+//e5c5uM8E5fr9nwA48YHw0gxqv5zn
 t8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733526820; x=1734131620;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffDbDjoVU0iyMZ+EBRurPZ1YWaazAPhZEYSoFhXEpws=;
 b=V7hDrHGiu7daqOTlxvHE7KFvNTRif0Pvbq9lqHQXV3+k4S9YikNOV5Nfo8eYdcjcM7
 0wS2B8c06JEj5wf+DHHnW/F2J2aqxW4NFw7XnRcbNitIT6+hbsuJrE7O3dUuK8mR7Vxq
 lScc774o+Ad1iA7P+QvOi+/XUXckKr9UMC5orjjCbGO6XzHLq4pfBqcS5Y+56gCSig3z
 q6dstG6fJFC+Lm5++StEQCrzy/EHdWCfpA8/dcMm+17dWghXNRQi98LAh5+/Y84wmnEE
 LdUwpROgxpdku693le18RW7ULwQ+RCIgrxu3lTvrIusCCKYCvSgjho4mKFfjrYoeMvvg
 8lZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8lS6ClB2LnkSOFu2AKEsos5jaa+8NgGmsuWe2SxTHIrpp5UO2wOV9Qm+H6n9kyLhPZQ9AFOJSuUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUi8fiqaCoVzUqRGrZ7G/PwUClZik01Mxp/6ZxqRnHwhb7sSrK
 tNqt29OLMNAQaMFGAYk1UHpbYp6zi3NXUibb/vrdHyg/7iXqBieZKhhGBDDfVliclw6QjO+drqq
 joGQ6HLGdlPN5CtVRaKOtTVfWOmKJ5lsk6JmelXzW82aBHMKa3Q==
X-Gm-Gg: ASbGncuyX6sbx7kE1Cu7WWk5Yx2mD1cmaunj2EOkNhtn0E5e1kKRHav4dJrDd1TedWQ
 +/t50pUZMFrvcAMrd92+3XticXlWhEkeJIw==
X-Google-Smtp-Source: AGHT+IEKvtMV/28KWaRO+RPE3adDJTlL/G7se4O0ZAIJ3JYHyvkbafHljL8zXEvHuUGEYX9iK47Df3kt5+5hDeDY3BY=
X-Received: by 2002:a17:902:d507:b0:216:19a4:dbcb with SMTP id
 d9443c01a7336-21619b41fb7mr55098105ad.45.1733526820523; Fri, 06 Dec 2024
 15:13:40 -0800 (PST)
MIME-Version: 1.0
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <f094ae61-04a9-8bd9-7b43-72ccdca22d5a@quicinc.com>
 <CAHbf0-HBYFTHqdC1w8Nhw1oVErXeMdtcdHZbebwmt8x20VwkHA@mail.gmail.com>
 <CAHbf0-H3jk17+aKTYUMTHMFT=KGAVh_xWMfe+VYrqXS-0jdQ5w@mail.gmail.com>
 <d7b0cc20-1ee9-8d21-7a8f-4dc84be3b7f9@amd.com>
 <89496055-5564-edcf-ff25-cbbb2bf9dd33@quicinc.com>
In-Reply-To: <89496055-5564-edcf-ff25-cbbb2bf9dd33@quicinc.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 6 Dec 2024 23:13:28 +0000
Message-ID: <CAHbf0-FLkbjKQSAHfRv_z-BubShbSztOG=ftwwhTuekdLfKVyg@mail.gmail.com>
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000058ae8e0628a22a92"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000058ae8e0628a22a92
Content-Type: text/plain; charset="UTF-8"

I can send one in tomorrow if you like

On Fri, 6 Dec 2024, 22:55 Jeffrey Hugo, <quic_jhugo@quicinc.com> wrote:

> On 12/6/2024 11:47 AM, Lizhi Hou wrote:
> >
> > On 12/6/24 09:01, Mike Lothian wrote:
> >> On Fri, 6 Dec 2024 at 16:41, Mike Lothian <mike@fireburn.co.uk> wrote:
> >>> On Fri, 6 Dec 2024 at 16:26, Jeffrey Hugo <quic_jhugo@quicinc.com>
> >>> wrote:
> >>>> On 12/5/2024 8:44 AM, Mike Lothian wrote:
> >>>>> Hi
> >>>>>
> >>>>> I needed to add the following to get things compiling for me
> >>>>>
> >>>>>
> >>>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>>>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>>>> index fe684f463b945..79b9801935e71 100644
> >>>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> >>>>> @@ -6,6 +6,7 @@
> >>>>> #include <drm/drm_device.h>
> >>>>> #include <drm/drm_managed.h>
> >>>>> #include <linux/bitfield.h>
> >>>>> +#include <linux/interrupt.h>
> >>>>> #include <linux/iopoll.h>
> >>>> Looking at the code, this is valid.  However, I'm not sure why this is
> >>>> broken for you and not others.  Do you have any ideas?  How are you
> >>>> building this?  Is the tree and/or defconfig unique in some way?
> >>>>
> >>>>> #define CREATE_TRACE_POINTS
> >>>>>
> >>>>>
> >>>>> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
> >>>>> from npu.sbin.1.5.2.380 to npu.sbin
> >>>>>
> >>>>> Cheers
> >>>>>
> >>>>> Mike
> >>>>>
> >>> I'm building with clang 19.1.5, this is on linus's tree 6.13-rc1
> >>>
> >>> I've applied AMD-XDNA-driver and AMD-NPU-driver-improvements series
> >>>
> >>> These are the errors I see without the above patch:
> >>>
> >>> drivers/accel/amdxdna/amdxdna_mailbox.c:342:8: error: unknown type
> >>> name 'irqreturn_t'
> >>>    342 | static irqreturn_t mailbox_irq_handler(int irq, void *p)
> >>>        |        ^
> >>> drivers/accel/amdxdna/amdxdna_mailbox.c:352:9: error: use of
> >>> undeclared identifier 'IRQ_HANDLED'
> >>>    352 |         return IRQ_HANDLED;
> >>>        |                ^
> >>> drivers/accel/amdxdna/amdxdna_mailbox.c:380:4: error: call to
> >>> undeclared function 'disable_irq'; ISO C99 and later do not support
> >>> implicit function declarations [-Wimplicit-function-declaration]
> >>>    380 |                         disable_irq(mb_chann->msix_irq);
> >>>        |                         ^
> >>> drivers/accel/amdxdna/amdxdna_mailbox.c:497:8: error: call to
> >>> undeclared function 'request_irq'; ISO C99 and later do not support
> >>> implicit function declarations [-Wimplicit-function-declaration]
> >>>    497 |         ret = request_irq(mb_irq, mailbox_irq_handler, 0,
> >>> MAILBOX_NAME, mb_chann);
> >>>        |               ^
> >>> drivers/accel/amdxdna/amdxdna_mailbox.c:521:2: error: call to
> >>> undeclared function 'free_irq'; ISO C99 and later do not support
> >>> implicit function declarations [-Wimplicit-function-declaration]
> >>>    521 |         free_irq(mb_chann->msix_irq, mb_chann);
> >>>        |         ^
> >>> drivers/accel/amdxdna/amdxdna_mailbox.c:538:2: error: call to
> >>> undeclared function 'disable_irq'; ISO C99 and later do not support
> >>> implicit function declarations [-Wimplicit-function-declaration]
> >>>    538 |         disable_irq(mb_chann->msix_irq);
> >>>        |         ^
> >>> 6 errors generated.
> >>>
> >>> With the patch applied I then got firmware issues so I had to rename
> >>> the newly upstreamed firmware, I'm not sure of the code needs to load
> >>> the versioned file or if the file needs renamed in linux-firmware
> >>>
> >>> I'm attaching my .config
> >>>
> >>> Cheers
> >>>
> >>> Mike
> >> The attachment bounced so heres a link to the .config on github
> >> https://github.com/FireBurn/KernelStuff/blob/quark/dot_config_tip
> >
> > I am able to reproduce with your .config. I believe it is because
> > CONFIG_TRACING is disabled.
> >
> > If you are ok, I can include your fix to
> >
> https://lore.kernel.org/dri-devel/20241204213729.3113941-1-lizhi.hou@amd.com/T/#t
>
> It should be a separate patch, with a reported-by and a fixes tag.
>
> -Jeff
>

--00000000000058ae8e0628a22a92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I can send one in tomorrow if you like=C2=A0</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 6 Dec=
 2024, 22:55 Jeffrey Hugo, &lt;<a href=3D"mailto:quic_jhugo@quicinc.com">qu=
ic_jhugo@quicinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On 12/6/2024 11:47 AM, Lizhi Hou wrote:<br>
&gt; <br>
&gt; On 12/6/24 09:01, Mike Lothian wrote:<br>
&gt;&gt; On Fri, 6 Dec 2024 at 16:41, Mike Lothian &lt;<a href=3D"mailto:mi=
ke@fireburn.co.uk" target=3D"_blank" rel=3D"noreferrer">mike@fireburn.co.uk=
</a>&gt; wrote:<br>
&gt;&gt;&gt; On Fri, 6 Dec 2024 at 16:26, Jeffrey Hugo &lt;<a href=3D"mailt=
o:quic_jhugo@quicinc.com" target=3D"_blank" rel=3D"noreferrer">quic_jhugo@q=
uicinc.com</a>&gt; <br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt; On 12/5/2024 8:44 AM, Mike Lothian wrote:<br>
&gt;&gt;&gt;&gt;&gt; Hi<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I needed to add the following to get things compiling =
for me<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c<b=
r>
&gt;&gt;&gt;&gt;&gt; b/drivers/accel/amdxdna/amdxdna_mailbox.c<br>
&gt;&gt;&gt;&gt;&gt; index fe684f463b945..79b9801935e71 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/drivers/accel/amdxdna/amdxdna_mailbox.c<br>
&gt;&gt;&gt;&gt;&gt; +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c<br>
&gt;&gt;&gt;&gt;&gt; @@ -6,6 +6,7 @@<br>
&gt;&gt;&gt;&gt;&gt; #include &lt;drm/drm_device.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; #include &lt;drm/drm_managed.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; #include &lt;linux/bitfield.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; #include &lt;linux/iopoll.h&gt;<br>
&gt;&gt;&gt;&gt; Looking at the code, this is valid.=C2=A0 However, I&#39;m=
 not sure why this is<br>
&gt;&gt;&gt;&gt; broken for you and not others.=C2=A0 Do you have any ideas=
?=C2=A0 How are you<br>
&gt;&gt;&gt;&gt; building this?=C2=A0 Is the tree and/or defconfig unique i=
n some way?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; #define CREATE_TRACE_POINTS<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I also had to rename the firmware in /lib/firmware/amd=
npu/1502_00/<br>
&gt;&gt;&gt;&gt;&gt; from npu.sbin.1.5.2.380 to npu.sbin<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Cheers<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Mike<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m building with clang 19.1.5, this is on linus&#39;s tre=
e 6.13-rc1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve applied AMD-XDNA-driver and AMD-NPU-driver-improvemen=
ts series<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; These are the errors I see without the above patch:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; drivers/accel/amdxdna/amdxdna_mailbox.c:342:8: error: unknown =
type<br>
&gt;&gt;&gt; name &#39;irqreturn_t&#39;<br>
&gt;&gt;&gt; =C2=A0=C2=A0 342 | static irqreturn_t mailbox_irq_handler(int =
irq, void *p)<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^<br>
&gt;&gt;&gt; drivers/accel/amdxdna/amdxdna_mailbox.c:352:9: error: use of<b=
r>
&gt;&gt;&gt; undeclared identifier &#39;IRQ_HANDLED&#39;<br>
&gt;&gt;&gt; =C2=A0=C2=A0 352 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return IRQ_HANDLED;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt;&gt;&gt; drivers/accel/amdxdna/amdxdna_mailbox.c:380:4: error: call to<=
br>
&gt;&gt;&gt; undeclared function &#39;disable_irq&#39;; ISO C99 and later d=
o not support<br>
&gt;&gt;&gt; implicit function declarations [-Wimplicit-function-declaratio=
n]<br>
&gt;&gt;&gt; =C2=A0=C2=A0 380 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 disable_irq(mb_chann-&gt;msix_irq);<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt;&gt;&gt; drivers/accel/amdxdna/amdxdna_mailbox.c:497:8: error: call to<=
br>
&gt;&gt;&gt; undeclared function &#39;request_irq&#39;; ISO C99 and later d=
o not support<br>
&gt;&gt;&gt; implicit function declarations [-Wimplicit-function-declaratio=
n]<br>
&gt;&gt;&gt; =C2=A0=C2=A0 497 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ret =3D request_irq(mb_irq, mailbox_irq_handler, 0,<br>
&gt;&gt;&gt; MAILBOX_NAME, mb_chann);<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt;&gt;&gt; drivers/accel/amdxdna/amdxdna_mailbox.c:521:2: error: call to<=
br>
&gt;&gt;&gt; undeclared function &#39;free_irq&#39;; ISO C99 and later do n=
ot support<br>
&gt;&gt;&gt; implicit function declarations [-Wimplicit-function-declaratio=
n]<br>
&gt;&gt;&gt; =C2=A0=C2=A0 521 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 free_irq(mb_chann-&gt;msix_irq, mb_chann);<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt;&gt;&gt; drivers/accel/amdxdna/amdxdna_mailbox.c:538:2: error: call to<=
br>
&gt;&gt;&gt; undeclared function &#39;disable_irq&#39;; ISO C99 and later d=
o not support<br>
&gt;&gt;&gt; implicit function declarations [-Wimplicit-function-declaratio=
n]<br>
&gt;&gt;&gt; =C2=A0=C2=A0 538 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 disable_irq(mb_chann-&gt;msix_irq);<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt;&gt;&gt; 6 errors generated.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With the patch applied I then got firmware issues so I had to =
rename<br>
&gt;&gt;&gt; the newly upstreamed firmware, I&#39;m not sure of the code ne=
eds to load<br>
&gt;&gt;&gt; the versioned file or if the file needs renamed in linux-firmw=
are<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m attaching my .config<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Mike<br>
&gt;&gt; The attachment bounced so heres a link to the .config on github<br=
>
&gt;&gt; <a href=3D"https://github.com/FireBurn/KernelStuff/blob/quark/dot_=
config_tip" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.=
com/FireBurn/KernelStuff/blob/quark/dot_config_tip</a><br>
&gt; <br>
&gt; I am able to reproduce with your .config. I believe it is because <br>
&gt; CONFIG_TRACING is disabled.<br>
&gt; <br>
&gt; If you are ok, I can include your fix to <br>
&gt; <a href=3D"https://lore.kernel.org/dri-devel/20241204213729.3113941-1-=
lizhi.hou@amd.com/T/#t" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://lore.kernel.org/dri-devel/20241204213729.3113941-1-lizhi.hou@amd.com/T=
/#t</a> <br>
<br>
It should be a separate patch, with a reported-by and a fixes tag.<br>
<br>
-Jeff<br>
</blockquote></div>

--00000000000058ae8e0628a22a92--
