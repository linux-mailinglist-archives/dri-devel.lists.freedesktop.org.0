Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10987DF29B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530E10E04C;
	Thu,  2 Nov 2023 12:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007910E04C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:38:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9CFEE61467
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3764FC433CD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698928710;
 bh=ODmxgaPCW3o20t0EE5335siDRe/G6d3/sBppTZyOmJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CGQ5Mw9LwNieWV8AZ0DCKFMSHkzB3AeQ8ykOImYit9Ox14xQTbSz7hVTnR9IL2GM5
 Wuu3STdyRAg41A7QA+C6PmiQVymyK13SZrzT4fekyR6+wPHz27//mhH2ctN6EVTz4z
 Tfcp2xzYJ79qHtUQ1AASRDPIlz1dJlNpTnUja/PqSmj/tu/io/F3CW7K0c4pSOx1My
 jdknSffKPhCa1ZJjxLM0ru6lmOQ9HcBtVWefs3A72hSwiAE2M/wr8Nla1Xc53UUjOF
 porWdxZMFnfR8Xr6wJneMa4Q39wPx8lb4q+ZodKpacojJWneoSZrUXebd2TlRXgXxJ
 pBiS35M3I69Nw==
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so1465398a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 05:38:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YyEGf4w9xgqd8lSvX4IzDJk9CD+PSgesa8GJWOVr/CBomXnCpbw
 +nCP1q4NIK1sqjUqsqZKehD+dMJq4D2ThAcURX0=
X-Google-Smtp-Source: AGHT+IGdavNSlk/OWbRr3EFQOpzjG0rraw4qKuY0x3H0o4VyXAtV0YcsILWhqmkqIQtugo2OOfc7p4wf9Eas5Yy1ZuY=
X-Received: by 2002:a17:906:fe41:b0:9b6:aac1:6fa5 with SMTP id
 wz1-20020a170906fe4100b009b6aac16fa5mr4450693ejb.55.1698928708561; Thu, 02
 Nov 2023 05:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
 <ZSO9uArAtsPMPeTP@debian.me>
 <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
 <c9b79a69-bdc1-4457-900d-709a15d99568@leemhuis.info>
 <CAAhV-H4qQW_fOdkTxmT1xbvo4LOapzw_tOw7Kma47xmh0PvpPA@mail.gmail.com>
 <ZTWoDSPxGO-ApR4r@P70.localdomain>
 <82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info>
 <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
 <ba16ad66-4b35-4fb4-b4e6-1d785f260eea@ristioja.ee>
 <CAAhV-H64AKdGoHnVLLOYXznpr_aq1jC_TUYXFQRdOjoBxanxkw@mail.gmail.com>
 <c3bb7983-86e4-424e-aadd-e82a0cb6ef37@ristioja.ee>
 <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
 <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
 <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
In-Reply-To: <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 2 Nov 2023 20:38:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
Message-ID: <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
To: Jaak Ristioja <jaak@ristioja.ee>
Content-Type: multipart/mixed; boundary="0000000000002c605e06092aaaa3"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Evan Preston <x.arch@epreston.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002c605e06092aaaa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jaak,

On Wed, Nov 1, 2023 at 7:52=E2=80=AFPM Jaak Ristioja <jaak@ristioja.ee> wro=
te:
>
> On 31.10.23 14:17, Huacai Chen wrote:
> > Hi, Jaak and Evan,
> >
> > On Sun, Oct 29, 2023 at 9:42=E2=80=AFAM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> >>
> >> On Sat, Oct 28, 2023 at 7:06=E2=80=AFPM Jaak Ristioja <jaak@ristioja.e=
e> wrote:
> >>>
> >>> On 26.10.23 03:58, Huacai Chen wrote:
> >>>> Hi, Jaak,
> >>>>
> >>>> On Thu, Oct 26, 2023 at 2:49=E2=80=AFAM Jaak Ristioja <jaak@ristioja=
.ee> wrote:
> >>>>>
> >>>>> On 25.10.23 16:23, Huacai Chen wrote:
> >>>>>> On Wed, Oct 25, 2023 at 6:08=E2=80=AFPM Thorsten Leemhuis
> >>>>>> <regressions@leemhuis.info> wrote:
> >>>>>>>
> >>>>>>> Javier, Dave, Sima,
> >>>>>>>
> >>>>>>> On 23.10.23 00:54, Evan Preston wrote:
> >>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
> >>>>>>>>> On Fri, Oct 20, 2023 at 5:35=E2=80=AFPM Linux regression tracki=
ng (Thorsten
> >>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
> >>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya <bagasdo=
tme@gmail.com> wrote:
> >>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> >>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenh=
uacai@kernel.org> wrote:
> >>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression t=
racking (Thorsten
> >>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integr=
ated Intel HD
> >>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) resul=
ts in a blank
> >>>>>>>>>>>>>>>> screen after boot until the display manager starts... if=
 it does start
> >>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems to be=
 a workaround.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a=
8041717e3a2e4
> >>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initca=
ll to
> >>>>>>>>>>>>>>>> subsys_initcall_sync").
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things =
work fine
> >>>>>>>>>>>>> again. So I guess the reason:
> >>>>>>>>>>
> >>>>>>>>>> Well, this to me still looks a lot (please correct me if I'm w=
rong) like
> >>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enabled =
beforehand
> >>>>>>>>>> if I understood things correctly. Or is there a proper fix for=
 this
> >>>>>>>>>> already in the works and I just missed this? Or is there some =
good
> >>>>>>>>>> reason why this won't/can't be fixed?
> >>>>>>>>>
> >>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because the=
re was
> >>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works but i=
t has a
> >>>>>>>>> blank screen. Of course it is valuable to investigate further a=
bout
> >>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort b=
ecause
> >>>>>>>>> I don't have a same machine.
> >>>>>>>
> >>>>>>> Side note: Huacai, have you tried working with Jaak to get down t=
o the
> >>>>>>> real problem? Evan, might you be able to help out here?
> >>>>>> No, Jaak has no response after he 'fixed' his problem by disabling=
 SIMPLEDRM.
> >>>>>>
> >>>>>
> >>>>> I'm sorry, what was it exactly you want me to do? Please be mindful=
 that
> >>>>> I'm not familiar with the internals of the Linux kernel and DRI, an=
d it
> >>>>> might sometimes take weeks before I have time to work and respond o=
n this.
> >>>> It doesn't matter. I hope you can do some experiments to investigate
> >>>> deeper. The first experiment you can do is enabling SIMPLEFB (i.e.
> >>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) to see
> >>>> whether there is also a blank screen. If no blank screen, that
> >>>> probably means SIMPLEDRM has a bug, if still blank screen, that mean=
s
> >>>> the firmware may pass wrong screen information.
> >>>
> >>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLEDRM=3Dy=
 and
> >>> get no blank screen with CONFIG_FB_SIMPLE=3Dy and CONFIG_DRM_SIMPLEDR=
M unset.
> >> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device created
> >> by sysfb_init(). Since FB_SIMPLE works fine, I think the real problem
> >> is that DRM_SIMPLEDRM has a bug. The next step is to enable
> >> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, adding
> >> some printk() in simpledrm_probe() and its sub-routines to see where
> >> the driver fails. The output of these printk() can be seen by the
> >> 'dmesg' command after boot.
> > I need your help. I tried with my laptop (ThinkPad E490, Intel Core
> > i3-8145U, UHD Graphics 620) but I can't reproduce your problem. So
> > please patch your 6.5.x kernel with this temporary patch [1], then
> > build a "bad kernel" with SIMPLEDRM enabled. And after booting your
> > machine with this "bad kernel", please give me the dmesg output. Thank
> > you very much.
> >
> > [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9
>
> I'm unable to download it. Can you please send it by e-mail?
I'm sorry, please download from attachment.

Huacai

>
> Jaak
>
> >
> >
> > Huacai
> >
> >>
> >> Huacai
> >>
> >>>
> >>> Jaak
> >>>
> >>>>
> >>>> Huacai
> >>>>
> >>>>>
> >>>>> Jaak
> >>>>>
> >>>>>>>
> >>>>>>> But I write this mail for a different reason:
> >>>>>>>
> >>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
> >>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700H=
Q).
> >>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only a b=
lank
> >>>>>>>> screen after boot and a rapidly flashing device-access-status
> >>>>>>>> indicator.
> >>>>>>>
> >>>>>>> This additional report makes me wonder if we should revert the cu=
lprit
> >>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> >>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I gues=
s that
> >>>>>>> might lead to regressions for some users? But the patch descripti=
on says
> >>>>>>> that this is not a common configuration, so can we maybe get away=
 with that?
> >>>>>>    From my point of view, this is not a regression, 60aebc9559492c
> >>>>>> doesn't cause a problem, but exposes a problem. So we need to fix =
the
> >>>>>> real problem (SIMPLEDRM has a blank screen on some conditions). Th=
is
> >>>>>> needs Jaak or Evan's help.
> >>>>>>
> >>>>>> Huacai
> >>>>>>>
> >>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracke=
r' hat)
> >>>>>>> --
> >>>>>>> Everything you wanna know about Linux kernel regression tracking:
> >>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>>>>>> If I did something stupid, please tell me, as explained on that p=
age.
> >>>>>>>
> >>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen is bl=
ank (don't
> >>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/fir=
mware: Move
> >>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sync")=
 there is
> >>>>>>>>>>>>> no platform device created for SIMPLEDRM at early stage, so=
 it seems
> >>>>>>>>>>>>> also "no problem".
> >>>>>>>>>>>> I don't understand above. You mean that after that commit th=
e platform
> >>>>>>>>>>>> device is also none, right?
> >>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to work, and=
 that
> >>>>>>>>>>> commit makes the platform device created earlier. So, before =
that
> >>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; a=
fter that
> >>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
> >>>>>>>>>>>
> >>>>>>>>>>> Huacai
> >>>>>>>>>>>>
> >>>>>>>>>>>> Confused...
> >>>>>>>>>>>>
> >>>>>>>>>>>> --
> >>>>>>>>>>>> An old man doll... just what I always wanted! - Clara
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>
> >>>
>

--0000000000002c605e06092aaaa3
Content-Type: application/octet-stream; name="patch-6.5.9"
Content-Disposition: attachment; filename="patch-6.5.9"
Content-Transfer-Encoding: base64
Content-ID: <f_loh69tyi0>
X-Attachment-Id: f_loh69tyi0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyBiL2RyaXZlcnMvZmlybXdhcmUv
c3lzZmIuYwppbmRleCA4MmZjZmQyOWIuLjVmMjlhYjJiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9m
aXJtd2FyZS9zeXNmYi5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYwpAQCAtODMsMjUg
KzgzLDM3IEBAIHN0YXRpYyBfX2luaXQgaW50IHN5c2ZiX2luaXQodm9pZCkKIAogCXN5c2ZiX2Fw
cGx5X2VmaV9xdWlya3MoKTsKIAorCXByaW50aygic3lzZmIgMVxuIik7CiAJLyogdHJ5IHRvIGNy
ZWF0ZSBhIHNpbXBsZS1mcmFtZWJ1ZmZlciBkZXZpY2UgKi8KIAljb21wYXRpYmxlID0gc3lzZmJf
cGFyc2VfbW9kZShzaSwgJm1vZGUpOwogCWlmIChjb21wYXRpYmxlKSB7CisJCXByaW50aygic3lz
ZmIgMlxuIik7CiAJCXBkID0gc3lzZmJfY3JlYXRlX3NpbXBsZWZiKHNpLCAmbW9kZSk7CiAJCWlm
ICghSVNfRVJSKHBkKSkKIAkJCWdvdG8gdW5sb2NrX211dGV4OwogCX0KIAogCS8qIGlmIHRoZSBG
QiBpcyBpbmNvbXBhdGlibGUsIGNyZWF0ZSBhIGxlZ2FjeSBmcmFtZWJ1ZmZlciBkZXZpY2UgKi8K
LQlpZiAoc2ktPm9yaWdfdmlkZW9faXNWR0EgPT0gVklERU9fVFlQRV9FRkkpCisJaWYgKHNpLT5v
cmlnX3ZpZGVvX2lzVkdBID09IFZJREVPX1RZUEVfRUZJKSB7CiAJCW5hbWUgPSAiZWZpLWZyYW1l
YnVmZmVyIjsKLQllbHNlIGlmIChzaS0+b3JpZ192aWRlb19pc1ZHQSA9PSBWSURFT19UWVBFX1ZM
RkIpCisJCXByaW50aygic3lzZmIgM2FcbiIpOworCX0KKwllbHNlIGlmIChzaS0+b3JpZ192aWRl
b19pc1ZHQSA9PSBWSURFT19UWVBFX1ZMRkIpIHsKIAkJbmFtZSA9ICJ2ZXNhLWZyYW1lYnVmZmVy
IjsKLQllbHNlIGlmIChzaS0+b3JpZ192aWRlb19pc1ZHQSA9PSBWSURFT19UWVBFX1ZHQUMpCisJ
CXByaW50aygic3lzZmIgM2JcbiIpOworCX0KKwllbHNlIGlmIChzaS0+b3JpZ192aWRlb19pc1ZH
QSA9PSBWSURFT19UWVBFX1ZHQUMpIHsKIAkJbmFtZSA9ICJ2Z2EtZnJhbWVidWZmZXIiOwotCWVs
c2UgaWYgKHNpLT5vcmlnX3ZpZGVvX2lzVkdBID09IFZJREVPX1RZUEVfRUdBQykKKwkJcHJpbnRr
KCJzeXNmYiAzY1xuIik7CisJfQorCWVsc2UgaWYgKHNpLT5vcmlnX3ZpZGVvX2lzVkdBID09IFZJ
REVPX1RZUEVfRUdBQykgewogCQluYW1lID0gImVnYS1mcmFtZWJ1ZmZlciI7Ci0JZWxzZQorCQlw
cmludGsoInN5c2ZiIDNkXG4iKTsKKwl9CisJZWxzZSB7CiAJCW5hbWUgPSAicGxhdGZvcm0tZnJh
bWVidWZmZXIiOworCQlwcmludGsoInN5c2ZiIDNlXG4iKTsKKwl9CiAKIAlwZCA9IHBsYXRmb3Jt
X2RldmljZV9hbGxvYyhuYW1lLCAwKTsKIAlpZiAoIXBkKSB7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jCmluZGV4IDc5MTEyYjE5NS4uNjJmZTJhNmVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGlueS9zaW1wbGVkcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0u
YwpAQCAtNjM3LDYgKzYzNyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2lt
cGxlZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwKIAlzaXplX3QgbmZv
cm1hdHM7CiAJaW50IHJldDsKIAorCXByaW50aygiVDogY3JlYXRlIDFcbiIpOwogCXNkZXYgPSBk
ZXZtX2RybV9kZXZfYWxsb2MoJnBkZXYtPmRldiwgZHJ2LCBzdHJ1Y3Qgc2ltcGxlZHJtX2Rldmlj
ZSwgZGV2KTsKIAlpZiAoSVNfRVJSKHNkZXYpKQogCQlyZXR1cm4gRVJSX0NBU1Qoc2Rldik7CkBA
IC02NDcsNiArNjQ4LDcgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVk
cm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LAogCSAqIEhhcmR3YXJlIHNl
dHRpbmdzCiAJICovCiAKKwlwcmludGsoIlQ6IGNyZWF0ZSAyXG4iKTsKIAlyZXQgPSBzaW1wbGVk
cm1fZGV2aWNlX2luaXRfY2xvY2tzKHNkZXYpOwogCWlmIChyZXQpCiAJCXJldHVybiBFUlJfUFRS
KHJldCk7CkBAIC02NTUsMzEgKzY1Nyw0MCBAQCBzdGF0aWMgc3RydWN0IHNpbXBsZWRybV9kZXZp
Y2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsCiAJCXJl
dHVybiBFUlJfUFRSKHJldCk7CiAKIAlpZiAocGQpIHsKKwlwcmludGsoIlQ6IGNyZWF0ZSAzYS0x
XG4iKTsKIAkJd2lkdGggPSBzaW1wbGVmYl9nZXRfd2lkdGhfcGQoZGV2LCBwZCk7CiAJCWlmICh3
aWR0aCA8IDApCiAJCQlyZXR1cm4gRVJSX1BUUih3aWR0aCk7CisJcHJpbnRrKCJUOiBjcmVhdGUg
M2EtMlxuIik7CiAJCWhlaWdodCA9IHNpbXBsZWZiX2dldF9oZWlnaHRfcGQoZGV2LCBwZCk7CiAJ
CWlmIChoZWlnaHQgPCAwKQogCQkJcmV0dXJuIEVSUl9QVFIoaGVpZ2h0KTsKKwlwcmludGsoIlQ6
IGNyZWF0ZSAzYS0zXG4iKTsKIAkJc3RyaWRlID0gc2ltcGxlZmJfZ2V0X3N0cmlkZV9wZChkZXYs
IHBkKTsKIAkJaWYgKHN0cmlkZSA8IDApCiAJCQlyZXR1cm4gRVJSX1BUUihzdHJpZGUpOworCXBy
aW50aygiVDogY3JlYXRlIDNhLTRcbiIpOwogCQlmb3JtYXQgPSBzaW1wbGVmYl9nZXRfZm9ybWF0
X3BkKGRldiwgcGQpOwogCQlpZiAoSVNfRVJSKGZvcm1hdCkpCiAJCQlyZXR1cm4gRVJSX0NBU1Qo
Zm9ybWF0KTsKIAl9IGVsc2UgaWYgKG9mX25vZGUpIHsKKwlwcmludGsoIlQ6IGNyZWF0ZSAzYi0x
XG4iKTsKIAkJd2lkdGggPSBzaW1wbGVmYl9nZXRfd2lkdGhfb2YoZGV2LCBvZl9ub2RlKTsKIAkJ
aWYgKHdpZHRoIDwgMCkKIAkJCXJldHVybiBFUlJfUFRSKHdpZHRoKTsKKwlwcmludGsoIlQ6IGNy
ZWF0ZSAzYi0yXG4iKTsKIAkJaGVpZ2h0ID0gc2ltcGxlZmJfZ2V0X2hlaWdodF9vZihkZXYsIG9m
X25vZGUpOwogCQlpZiAoaGVpZ2h0IDwgMCkKIAkJCXJldHVybiBFUlJfUFRSKGhlaWdodCk7CisJ
cHJpbnRrKCJUOiBjcmVhdGUgM2ItM1xuIik7CiAJCXN0cmlkZSA9IHNpbXBsZWZiX2dldF9zdHJp
ZGVfb2YoZGV2LCBvZl9ub2RlKTsKIAkJaWYgKHN0cmlkZSA8IDApCiAJCQlyZXR1cm4gRVJSX1BU
UihzdHJpZGUpOworCXByaW50aygiVDogY3JlYXRlIDNiLTRcbiIpOwogCQlmb3JtYXQgPSBzaW1w
bGVmYl9nZXRfZm9ybWF0X29mKGRldiwgb2Zfbm9kZSk7CiAJCWlmIChJU19FUlIoZm9ybWF0KSkK
IAkJCXJldHVybiBFUlJfQ0FTVChmb3JtYXQpOworCXByaW50aygiVDogY3JlYXRlIDNiLTVcbiIp
OwogCQltZW0gPSBzaW1wbGVmYl9nZXRfbWVtb3J5X29mKGRldiwgb2Zfbm9kZSk7CiAJCWlmIChJ
U19FUlIobWVtKSkKIAkJCXJldHVybiBFUlJfQ0FTVChtZW0pOwpAQCAtNjkwLDE1ICs3MDEsMTgg
QEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0
ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LAogCQkJb2Zfbm9kZV9wdXQocGFuZWxfbm9kZSk7CiAJ
CX0KIAl9IGVsc2UgeworCXByaW50aygiVDogY3JlYXRlIDNjXG4iKTsKIAkJZHJtX2VycihkZXYs
ICJubyBzaW1wbGVmYiBjb25maWd1cmF0aW9uIGZvdW5kXG4iKTsKIAkJcmV0dXJuIEVSUl9QVFIo
LUVOT0RFVik7CiAJfQorCXByaW50aygiVDogY3JlYXRlIDRcbiIpOwogCWlmICghc3RyaWRlKSB7
CiAJCXN0cmlkZSA9IGRybV9mb3JtYXRfaW5mb19taW5fcGl0Y2goZm9ybWF0LCAwLCB3aWR0aCk7
CiAJCWlmIChkcm1fV0FSTl9PTihkZXYsICFzdHJpZGUpKQogCQkJcmV0dXJuIEVSUl9QVFIoLUVJ
TlZBTCk7CiAJfQogCisJcHJpbnRrKCJUOiBjcmVhdGUgNVxuIik7CiAJLyoKIAkgKiBBc3N1bWUg
YSBtb25pdG9yIHJlc29sdXRpb24gb2YgOTYgZHBpIGlmIHBoeXNpY2FsIGRpbWVuc2lvbnMKIAkg
KiBhcmUgbm90IHNwZWNpZmllZCB0byBnZXQgYSBzb21ld2hhdCByZWFzb25hYmxlIHNjcmVlbiBz
aXplLgpAQCAtNzEyLDggKzcyNiw4IEBAIHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAq
c2ltcGxlZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwKIAlzZGV2LT5m
b3JtYXQgPSBmb3JtYXQ7CiAJc2Rldi0+cGl0Y2ggPSBzdHJpZGU7CiAKLQlkcm1fZGJnKGRldiwg
ImRpc3BsYXkgbW9kZT17IiBEUk1fTU9ERV9GTVQgIn1cbiIsIERSTV9NT0RFX0FSRygmc2Rldi0+
bW9kZSkpOwotCWRybV9kYmcoZGV2LCAiZnJhbWVidWZmZXIgZm9ybWF0PSVwNGNjLCBzaXplPSVk
eCVkLCBzdHJpZGU9JWQgYnl0ZVxuIiwKKwlkcm1faW5mbyhkZXYsICJkaXNwbGF5IG1vZGU9eyIg
RFJNX01PREVfRk1UICJ9XG4iLCBEUk1fTU9ERV9BUkcoJnNkZXYtPm1vZGUpKTsKKwlkcm1faW5m
byhkZXYsICJmcmFtZWJ1ZmZlciBmb3JtYXQ9JXA0Y2MsIHNpemU9JWR4JWQsIHN0cmlkZT0lZCBi
eXRlXG4iLAogCQkmZm9ybWF0LT5mb3JtYXQsIHdpZHRoLCBoZWlnaHQsIHN0cmlkZSk7CiAKIAkv
KgpAQCAtNzIzLDMzICs3MzcsMzggQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpz
aW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LAogCWlmIChtZW0p
IHsKIAkJdm9pZCAqc2NyZWVuX2Jhc2U7CiAKKwlwcmludGsoIlQ6IGNyZWF0ZSA2YS0xXG4iKTsK
IAkJcmV0ID0gZGV2bV9hcGVydHVyZV9hY3F1aXJlX2Zyb21fZmlybXdhcmUoZGV2LCBtZW0tPnN0
YXJ0LCByZXNvdXJjZV9zaXplKG1lbSkpOwogCQlpZiAocmV0KSB7CiAJCQlkcm1fZXJyKGRldiwg
ImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSAlcHI6ICVkXG4iLCBtZW0sIHJldCk7CiAJ
CQlyZXR1cm4gRVJSX1BUUihyZXQpOwogCQl9CiAKLQkJZHJtX2RiZyhkZXYsICJ1c2luZyBzeXN0
ZW0gbWVtb3J5IGZyYW1lYnVmZmVyIGF0ICVwclxuIiwgbWVtKTsKKwkJZHJtX2luZm8oZGV2LCAi
dXNpbmcgc3lzdGVtIG1lbW9yeSBmcmFtZWJ1ZmZlciBhdCAlcHJcbiIsIG1lbSk7CiAKKwlwcmlu
dGsoIlQ6IGNyZWF0ZSA2YS0yXG4iKTsKIAkJc2NyZWVuX2Jhc2UgPSBkZXZtX21lbXJlbWFwKGRl
di0+ZGV2LCBtZW0tPnN0YXJ0LCByZXNvdXJjZV9zaXplKG1lbSksIE1FTVJFTUFQX1dDKTsKIAkJ
aWYgKElTX0VSUihzY3JlZW5fYmFzZSkpCiAJCQlyZXR1cm4gc2NyZWVuX2Jhc2U7CiAKKwlwcmlu
dGsoIlQ6IGNyZWF0ZSA2YS0zXG4iKTsKIAkJaW9zeXNfbWFwX3NldF92YWRkcigmc2Rldi0+c2Ny
ZWVuX2Jhc2UsIHNjcmVlbl9iYXNlKTsKIAl9IGVsc2UgewogCQl2b2lkIF9faW9tZW0gKnNjcmVl
bl9iYXNlOwogCisJcHJpbnRrKCJUOiBjcmVhdGUgNmItMVxuIik7CiAJCXJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CiAJCWlmICghcmVzKQogCQkJ
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAKKwlwcmludGsoIlQ6IGNyZWF0ZSA2Yi0yXG4iKTsK
IAkJcmV0ID0gZGV2bV9hcGVydHVyZV9hY3F1aXJlX2Zyb21fZmlybXdhcmUoZGV2LCByZXMtPnN0
YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOwogCQlpZiAocmV0KSB7CiAJCQlkcm1fZXJyKGRldiwg
ImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSAlcHI6ICVkXG4iLCByZXMsIHJldCk7CiAJ
CQlyZXR1cm4gRVJSX1BUUihyZXQpOwogCQl9CiAKLQkJZHJtX2RiZyhkZXYsICJ1c2luZyBJL08g
bWVtb3J5IGZyYW1lYnVmZmVyIGF0ICVwclxuIiwgcmVzKTsKKwkJZHJtX2luZm8oZGV2LCAidXNp
bmcgSS9PIG1lbW9yeSBmcmFtZWJ1ZmZlciBhdCAlcHJcbiIsIHJlcyk7CiAKIAkJbWVtID0gZGV2
bV9yZXF1ZXN0X21lbV9yZWdpb24oJnBkZXYtPmRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6
ZShyZXMpLAogCQkJCQkgICAgICBkcnYtPm5hbWUpOwpAQCAtNzYzLDEwICs3ODIsMTIgQEAgc3Rh
dGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RyaXZlciAqZHJ2LAogCQkJbWVtID0gcmVzOwogCQl9CiAKKwlwcmludGsoIlQ6IGNy
ZWF0ZSA2Yi0zXG4iKTsKIAkJc2NyZWVuX2Jhc2UgPSBkZXZtX2lvcmVtYXBfd2MoJnBkZXYtPmRl
diwgbWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShtZW0pKTsKIAkJaWYgKCFzY3JlZW5fYmFzZSkK
IAkJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCisJcHJpbnRrKCJUOiBjcmVhdGUgNmItNFxu
Iik7CiAJCWlvc3lzX21hcF9zZXRfdmFkZHJfaW9tZW0oJnNkZXYtPnNjcmVlbl9iYXNlLCBzY3Jl
ZW5fYmFzZSk7CiAJfQogCkBAIC03NzQsNiArNzk1LDcgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVk
cm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2
LAogCSAqIE1vZGVzZXR0aW5nCiAJICovCiAKKwlwcmludGsoIlQ6IGNyZWF0ZSA3XG4iKTsKIAly
ZXQgPSBkcm1tX21vZGVfY29uZmlnX2luaXQoZGV2KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gRVJS
X1BUUihyZXQpOwpAQCAtNzkwLDYgKzgxMiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2Rl
dmljZSAqc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwKIAog
CS8qIFByaW1hcnkgcGxhbmUgKi8KIAorCXByaW50aygiVDogY3JlYXRlIDhcbiIpOwogCW5mb3Jt
YXRzID0gZHJtX2ZiX2J1aWxkX2ZvdXJjY19saXN0KGRldiwgJmZvcm1hdC0+Zm9ybWF0LCAxLAog
CQkJCQkgICAgc2Rldi0+Zm9ybWF0cywgQVJSQVlfU0laRShzZGV2LT5mb3JtYXRzKSk7CiAKQEAg
LTgwNSw2ICs4MjgsNyBAQCBzdGF0aWMgc3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNpbXBsZWRy
bV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsCiAKIAkvKiBDUlRDICovCiAK
KwlwcmludGsoIlQ6IGNyZWF0ZSA5XG4iKTsKIAljcnRjID0gJnNkZXYtPmNydGM7CiAJcmV0ID0g
ZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcyhkZXYsIGNydGMsIHByaW1hcnlfcGxhbmUsIE5VTEws
CiAJCQkJCSZzaW1wbGVkcm1fY3J0Y19mdW5jcywgTlVMTCk7CkBAIC04MTQsNiArODM4LDcgQEAg
c3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShz
dHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LAogCiAJLyogRW5jb2RlciAqLwogCisJcHJpbnRrKCJUOiBj
cmVhdGUgMTBcbiIpOwogCWVuY29kZXIgPSAmc2Rldi0+ZW5jb2RlcjsKIAlyZXQgPSBkcm1fZW5j
b2Rlcl9pbml0KGRldiwgZW5jb2RlciwgJnNpbXBsZWRybV9lbmNvZGVyX2Z1bmNzLAogCQkJICAg
ICAgIERSTV9NT0RFX0VOQ09ERVJfTk9ORSwgTlVMTCk7CkBAIC04MjMsNiArODQ4LDcgQEAgc3Rh
dGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RyaXZlciAqZHJ2LAogCiAJLyogQ29ubmVjdG9yICovCiAKKwlwcmludGsoIlQ6IGNy
ZWF0ZSAxMVxuIik7CiAJY29ubmVjdG9yID0gJnNkZXYtPmNvbm5lY3RvcjsKIAlyZXQgPSBkcm1f
Y29ubmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZzaW1wbGVkcm1fY29ubmVjdG9yX2Z1bmNz
LAogCQkJCSBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93bik7CkBAIC04MzMsNiArODU5LDcgQEAg
c3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShz
dHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LAogCQkJCQkJICAgICAgIERSTV9NT0RFX1BBTkVMX09SSUVO
VEFUSU9OX1VOS05PV04sCiAJCQkJCQkgICAgICAgd2lkdGgsIGhlaWdodCk7CiAKKwlwcmludGso
IlQ6IGNyZWF0ZSAxMlxuIik7CiAJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihj
b25uZWN0b3IsIGVuY29kZXIpOwogCWlmIChyZXQpCiAJCXJldHVybiBFUlJfUFRSKHJldCk7CkBA
IC04NzAsMjAgKzg5NywyNCBAQCBzdGF0aWMgaW50IHNpbXBsZWRybV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCXVuc2lnbmVkIGludCBjb2xvcl9tb2RlOwogCWludCByZXQ7
CiAKKwlwcmludGsoIlQ6IHByb2JlIDFcbiIpOwogCXNkZXYgPSBzaW1wbGVkcm1fZGV2aWNlX2Ny
ZWF0ZSgmc2ltcGxlZHJtX2RyaXZlciwgcGRldik7CiAJaWYgKElTX0VSUihzZGV2KSkKIAkJcmV0
dXJuIFBUUl9FUlIoc2Rldik7CiAJZGV2ID0gJnNkZXYtPmRldjsKIAorCXByaW50aygiVDogcHJv
YmUgMlxuIik7CiAJcmV0ID0gZHJtX2Rldl9yZWdpc3RlcihkZXYsIDApOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKKwlwcmludGsoIlQ6IHByb2JlIDNcbiIpOwogCWNvbG9yX21vZGUgPSBk
cm1fZm9ybWF0X2luZm9fYnBwKHNkZXYtPmZvcm1hdCwgMCk7CiAJaWYgKGNvbG9yX21vZGUgPT0g
MTYpCiAJCWNvbG9yX21vZGUgPSBzZGV2LT5mb3JtYXQtPmRlcHRoOyAvLyBjYW4gYmUgMTUgb3Ig
MTYKIAogCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRldiwgY29sb3JfbW9kZSk7CisJcHJpbnRr
KCJUOiBwcm9iZSA0XG4iKTsKIAogCXJldHVybiAwOwogfQo=
--0000000000002c605e06092aaaa3--
