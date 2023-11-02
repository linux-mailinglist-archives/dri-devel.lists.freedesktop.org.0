Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6A7DF0F0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 12:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAED10E086;
	Thu,  2 Nov 2023 11:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7D610E086
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 11:09:56 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c514cbbe7eso11394741fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698923395; x=1699528195; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bNnYz3x2A8pkur9hVW7htGG0dM8D69hXBJmw2CQHbjw=;
 b=jrl23PYpkfIeVPZN5tnYbDqaH57uqzJ7AXlbzujKm7u62mmKKXFpnBXc+2ubgSsQY2
 uuLEPLGAQNKYZSwi1CmgRAYhF82uBfje7O1Wwmsr0PMZ6RhmyGgroXiQhpVkqjqhTWJ1
 UvBAb4fR4SlTYS396+aWJGxwqz+xtGcjNS+heKxFuKm0ZQIWUIaxe49orVK0gmYdd0nS
 tyeuOPJEcHA5dMCQj5uNU6V0uypCBE7XP7Ajac8dzVf9imYWzw+7geOVwi8HsHTAJ9jk
 InjskGYeow3Xi2XEwztIVjmQpODGyhV6Qd8kkaI1lI/wlCoTSO6SCp0ZDfObDwq4JIzw
 EPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698923395; x=1699528195;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bNnYz3x2A8pkur9hVW7htGG0dM8D69hXBJmw2CQHbjw=;
 b=hypHmPSc+okfBKzwlj5LMcRFyet7pyy7VRZI2k992KNoT1PKtZkcJji9i8rYbtWAR7
 loZxw6Z/bx7U3AiPGSCmIt8aN1jzEZ58U36mFVorRr8Nc7HT+CSSE7UmQLFJ36L1s8sr
 VacpsKDi/tq6Pu5tW1b7dIJDtO2D6Eebg42vL9StfyP3pQgzZartU74QfvzKy5peckRp
 F6zFHqm/KqXjU46dGrbJxsGsH1UAOVa+6VFiBg7NpfYKgJXISmQzKLnkE2hA+TeQ/LTS
 BAEEjnUeNe+l8xWpZzx7IXd87zqCsRxf8V3HVvHMX7OtlIIQ99jT3R5u9ofRjj8G3/II
 hknQ==
X-Gm-Message-State: AOJu0Yytop/oVhLFbH3fsiZQdR4jrE1UOG99ZL8/HF81XwEpp9Cd75su
 E3aSReLQW+LBWmW7GG0QG3RKvL99PQQIXyO/Izc=
X-Google-Smtp-Source: AGHT+IG9KDieSBirPxFU0CVcSErkAjUOyULiQIcIYlbUeCA4leQhkQfRH18LVGNZAI1GJ6w7vDMbnQibJlYwVmNEN7w=
X-Received: by 2002:a2e:9bc2:0:b0:2c1:6b9c:48d6 with SMTP id
 w2-20020a2e9bc2000000b002c16b9c48d6mr13907602ljj.16.1698923394315; Thu, 02
 Nov 2023 04:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANH0Q9mzBVr7KTJQmvLsqndpTZ8JU0rDfDQhu10kFsRgfybA4A@mail.gmail.com>
 <ccf8e1ae-efa5-4d09-bc43-4ed18536c910@linux.intel.com>
In-Reply-To: <ccf8e1ae-efa5-4d09-bc43-4ed18536c910@linux.intel.com>
From: Trigger Huang <trigger.huang@gmail.com>
Date: Thu, 2 Nov 2023 19:09:42 +0800
Message-ID: <CANH0Q9=bF-j3=sS+Hw8FmD4dm9cnGNt5f6XAdRpo6KaHdGb0nw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5Baccel=2Fivpu=5D_Help_=2D=2D_Which_Intel_CPU_processor_c?=
 =?UTF-8?Q?an_be_used_for_iVPU_driver=EF=BC=9F?=
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000006b38720609296d4e"
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006b38720609296d4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacek,

Thanks for the quick response.

Seems I need to wait for a while if I want to buy a  Meteor Lake based
platform because I got the following message from wiki(
*https://en.wikipedia.org/wiki/Meteor_Lake
<https://en.wikipedia.org/wiki/Meteor_Lake>)*

           *Meteor Lake is Intel's codename for the first-generation of
Intel Core Ultra mobile processors, to be released to the market on
December 14, 2023*

BTW, is it possible that NPU (formerly known as VPU) will be available on
some desktop CPUs in the future?

Thanks,
Trigger

On Thu, Nov 2, 2023 at 5:24=E2=80=AFPM Jacek Lawrynowicz <
jacek.lawrynowicz@linux.intel.com> wrote:

> Hi,
>
> You need a Meteor Lake based platform.
> Intel 14th gen desktop CPUs were supposed to be Meteor Lake but they ende=
d
> up as Raptor Lake.
> NPU (formerly known as VPU) will be available in 14th gen mobile chips.
> I will update the Kconfig description.
>
> Regards,
> Jacek
>
> On 02.11.2023 07:59, Trigger Huang wrote:
> > Hello,
> >
> > I want to have a try for the iVPU driver but don't know which CPU
> platform
> > is suitable. Would you help?
> >
> > According to the description in linux/drivers/accel/ivpu/Kconfig, it sa=
ys
> > that Choose this option if you have a system that has an *14*th
> generation
> > Intel CPU
> > But according to the Intel  I7 *14*700k spec (
> >
> https://www.intel.com/content/www/us/en/products/sku/236783/intel-core-i7=
-processor-14700k-33m-cache-up-to-5-60-ghz/specifications.html
> ),
> > there is
> > no description about Versatile Processing Unit.
> >
> > So which CPU should I choose?
> >
> > Thanks,
> > Trigger
> >
>

--0000000000006b38720609296d4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jacek,</div><div><br></div><div>Thanks for the qui=
ck=C2=A0response.</div><div><br></div><div>Seems I need to wait for a while=
 if I want to buy a=C2=A0 Meteor Lake based platform because I got the foll=
owing message from wiki(=C2=A0<i><a href=3D"https://en.wikipedia.org/wiki/M=
eteor_Lake">https://en.wikipedia.org/wiki/Meteor_Lake</a>)</i></div><div><b=
r></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<i>Meteor Lake is Int=
el&#39;s codename for the first-generation of Intel Core Ultra mobile proce=
ssors, to be released to the market on December 14, 2023</i><br></div><div>=
<br></div><div>BTW, is it possible that NPU (formerly known as VPU) will be=
 available on some desktop CPUs in the future?</div><br><div>Thanks,</div><=
div>Trigger</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Nov 2, 2023 at 5:24=E2=80=AFPM Jacek Lawrynowicz &=
lt;<a href=3D"mailto:jacek.lawrynowicz@linux.intel.com">jacek.lawrynowicz@l=
inux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi,<br>
<br>
You need a Meteor Lake based platform.<br>
Intel 14th gen desktop CPUs were supposed to be Meteor Lake but they ended =
up as Raptor Lake.<br>
NPU (formerly known as VPU) will be available in 14th gen mobile chips.<br>
I will update the Kconfig description.<br>
<br>
Regards,<br>
Jacek<br>
<br>
On 02.11.2023 07:59, Trigger Huang wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I want to have a try for the iVPU driver but don&#39;t know which CPU =
platform<br>
&gt; is suitable. Would you help?<br>
&gt; <br>
&gt; According to the description in linux/drivers/accel/ivpu/Kconfig, it s=
ays<br>
&gt; that Choose this option if you have a system that has an *14*th genera=
tion<br>
&gt; Intel CPU<br>
&gt; But according to the Intel=C2=A0 I7 *14*700k spec (<br>
&gt; <a href=3D"https://www.intel.com/content/www/us/en/products/sku/236783=
/intel-core-i7-processor-14700k-33m-cache-up-to-5-60-ghz/specifications.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.intel.com/content/www/u=
s/en/products/sku/236783/intel-core-i7-processor-14700k-33m-cache-up-to-5-6=
0-ghz/specifications.html</a>),<br>
&gt; there is<br>
&gt; no description about Versatile Processing Unit.<br>
&gt; <br>
&gt; So which CPU should I choose?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Trigger<br>
&gt; <br>
</blockquote></div>

--0000000000006b38720609296d4e--
