Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB567267ED
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 20:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1819110E539;
	Wed,  7 Jun 2023 18:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36A910E539;
 Wed,  7 Jun 2023 18:05:54 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-557d4a08bbaso4427359eaf.2; 
 Wed, 07 Jun 2023 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686161154; x=1688753154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rrcUk3QXD5nFY+wcOPn8saiJBhZSNAUJ+BdDVGNC138=;
 b=NLRCyNLDmaHkVdK4yHA5tcb2zzlmiY9NDfuZ7tyPI2g+uVgZwG3l6FH5LX4m4yokwy
 nmuw6wWKIvJRDc3xDSEekccAdl6YH9Ze5O1jpu+Cqmhe3Ti2Dn84t5zpAc7DQrjeQvgV
 DlMze3GpxVhlQD65cuhbW3T6sDP+22G8TSsHlZEVnml2kAcdpCXihy/rxCNhy0dbsD/Z
 KM6HnP9yAd/80VqYIPTU8KXMBnq5WBQcnwUrj9N4JQzRjmjNYfUOklSh012dHbyra7mr
 e57HT5qiND/zPSl+0lASBoF6rmyxAsXaAU2pr+DkpaFCkafQ0t+zA1RUplND/udCak4Y
 ET6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686161154; x=1688753154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrcUk3QXD5nFY+wcOPn8saiJBhZSNAUJ+BdDVGNC138=;
 b=lLM7ACeVfGOXc5bt2C83hMIKxkBYGpe1IUWERAp2vFgo38io+nhIoJiqe2u9KOYimL
 5ZTlY/vwr3Aj3pnHl0xFmDuZRvZYpOFF/oxBX71MVx2yTnq484GS364tmGzijcN4PcGN
 SrE9LYKSEt0mD7ai0XluYyrPGyEHy3d5ld2boreFR+s6yEfWO6i3hkFuuhEL5/0dB4pX
 CwNciowiG4yA2mX7UktayAI9tCsOUdg9ITJJG7W3Q30pKG0m/bNhUxJV4N2RaNerehNW
 4r7xoZ2XBjmZc5o3iGtbTeKrKz4wOemEnegPUXyVSds7KtaHxD0b3zrETLWV0kPEyrGM
 6HOw==
X-Gm-Message-State: AC+VfDwc5eACrGzQ4rFAe75UPtvTCZfF/wryM5pUlJ228EtoqoFj39eV
 30APRSALBDZviZiXRtBHNXXokGycDD/6LXG1SXA=
X-Google-Smtp-Source: ACHHUZ7TdRWEjprJMV3MT1zLscbuyK+HS5AVs7cUsAEHXT15VUdjl+aJOgCuufi/iZpOdxUYrBMfxqGPqWbHs8od9Xs=
X-Received: by 2002:a4a:ea89:0:b0:558:a782:5209 with SMTP id
 r9-20020a4aea89000000b00558a7825209mr3113447ooh.1.1686161153788; Wed, 07 Jun
 2023 11:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
 <0cac032a-0f65-5134-cde5-f535fc58c5ab@felixrichter.tech>
 <e7eed5ce-e7a0-e03e-f8c7-3582d9771a33@leemhuis.info>
 <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
 <CADnq5_MCXgtxNB_WBfAw+ZSKNeczSYL7gZPkpqqJ859G=LYkgA@mail.gmail.com>
 <076f493a-9e88-db37-f4a0-2a269e94d51e@felixrichter.tech>
In-Reply-To: <076f493a-9e88-db37-f4a0-2a269e94d51e@felixrichter.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Jun 2023 14:05:42 -0400
Message-ID: <CADnq5_Ojz=dTO-ve0KxrLb+v0OouwbQdGTn4Fm8vwEjR2Ww-gw@mail.gmail.com>
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
To: Felix Richter <judge@felixrichter.tech>
Content-Type: multipart/mixed; boundary="0000000000009b25b505fd8dfcf4"
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
Cc: dri-devel@lists.freedesktop.org, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009b25b505fd8dfcf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 4:42=E2=80=AFAM Felix Richter <judge@felixrichter.te=
ch> wrote:
>
> Hi Guys,
>
> so I checked, the kernel I am running has this commit
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> /commit/?id=3D08da182175db4c7f80850354849d95f2670e8cd9) applied already!
>
> https://github.com/ju6ge/linux/commit/917680e6056aa288cac288d3afd2745d372=
beb61u
>
> And the bug of display flickering persists with or without the
> amdgpu.sg_display=3D0 variable applied!

That is unexpected.  Setting sg_display=3D0 should be equivalent to
reverting 81d0bcf9900932633d270d5bc4a54ff599c6ebdb.  Does the attached
patch (with sg_display=3D0 set) make any difference?

Alex


>
> Kind regards,
> Felix Richter
>
>
> On 6/5/23 16:11, Alex Deucher wrote:
> > + Hamza
> > This is a known issue.  You can workaround it by setting
> > amdgpu.sg_display=3D0.  It should be issue should be fixed in:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D08da182175db4c7f80850354849d95f2670e8cd9
> >
> > Alex
> >
> >
> >
> >> Now if this is the desired long term fix I do not know =E2=80=A6
> >>
> >> Kind regards,
> >> Felix Richter
> >>
> >> On 02.05.23 16:12, Linux regression tracking (Thorsten Leemhuis) wrote=
:
> >>> On 02.05.23 15:48, Felix Richter wrote:
> >>>> On 5/2/23 15:34, Linux regression tracking (Thorsten Leemhuis) wrote=
:
> >>>>> On 02.05.23 15:13, Alex Deucher wrote:
> >>>>>> On Tue, May 2, 2023 at 7:45=E2=80=AFAM Linux regression tracking (=
Thorsten
> >>>>>> Leemhuis)<regressions@leemhuis.info>  wrote:
> >>>>>>
> >>>>>>> On 30.04.23 13:44, Felix Richter wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> I am running into an issue with the integrated GPU of the Ryzen =
9
> >>>>>>>> 7950X. It seems to be a regression from kernel version 6.1 to 6.=
2.
> >>>>>>>> The bug materializes in from of my monitor blinking, meaning it
> >>>>>>>> turns full white shortly. This happens very often so that the
> >>>>>>>> system becomes unpleasant to use.
> >>>>>>>>
> >>>>>>>> I am running the Archlinux Kernel:
> >>>>>>>> The Issue happens on the bleeding edge kernel: 6.2.13
> >>>>>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
> >>>>>>>>
> >>>>>>>> I have two monitors attached to the system. One 42 inch 4k Displ=
ay
> >>>>>>>> and a 24 inch 1080p Display and am running sway as my desktop.
> >>>>>>>>
> >>>>>>>> Let me know if there is more information I could provide to help
> >>>>>>>> narrow down the issue.
> >>>>>>> Thanks for the report. To be sure the issue doesn't fall through =
the
> >>>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regr=
ession
> >>>>>>> tracking bot:
> >>>>>>>
> >>>>>>> #regzbot ^introduced v6.1..v6.2
> >>>>>>> #regzbot title drm: amdgpu: system becomes unpleasant to use afte=
r
> >>>>>>> monitor starts blinking and turns full white
> >>>>>>> #regzbot ignore-activity
> >>>>>>>
> >>>>>>> This isn't a regression? This issue or a fix for it are already
> >>>>>>> discussed somewhere else? It was fixed already? You want to clari=
fy
> >>>>>>> when
> >>>>>>> the regression started to happen? Or point out I got the title or
> >>>>>>> something else totally wrong? Then just reply and tell me -- idea=
lly
> >>>>>>> while also telling regzbot about it, as explained by the page lis=
ted in
> >>>>>>> the footer of this mail.
> >>>>>>>
> >>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags
> >>>>>>> pointing
> >>>>>>> to the report (the parent of this mail). See page linked in foote=
r for
> >>>>>>> details.
> >>>>>> This sounds exactly like the issue that was fixed in this patch wh=
ich
> >>>>>> is already on it's way to Linus:
> >>>>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c=
7f80850354849d95f2670e8cd9
> >>>>> FWIW, you in the flood of emails likely missed that this is the sam=
e
> >>>>> thread where you yesterday replied "If the module parameter didn't =
help
> >>>>> then perhaps you are seeing some other issue.  Can you bisect?". Th=
at's
> >>>>> why I decided to add this to the tracking. Or am I missing somethin=
g
> >>>>> obvious here?
> >>>>>
> >>>>> /me looks around again and can't see anything, but that doesn't hav=
e to
> >>>>> mean anything...
> >>>>>
> >>>>> Felix, btw, this guide might help you with the bisection, even if i=
t's
> >>>>> just for kernel compilation:
> >>>>>
> >>>>> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linu=
x.html
> >>>>>
> >>>>> And to indirectly reply to your mail from yesterday[1]. You might w=
ant
> >>>>> to ignore the arch linux kernel git repo and just do a bisection be=
tween
> >>>>> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were=
 you
> >>>>> I'd also try 6.3 or even mainline before that, in case the issue wa=
s
> >>>>> fixed already.
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@fe=
lixrichter.tech/
> >>>>>
> >>>> Thanks for the pointers, I'll do a bisection on my desktop from 6.1 =
to
> >>>> the newest commit.
> >>> FWIW, I wonder what you actually mean with "newest commit" here: a
> >>> bisection between 6.1 and mainline HEAD might be a waste of time, *if=
*
> >>> this is something that only happens in 6.2.y (say due to a broken or
> >>> incomplete backport)
> >>>
> >>>> That was the part I was mostly unsure about =E2=80=A6 where
> >>>> to start from.
> >>>>
> >>>> I was planning to use PKGBUILD scripts from arch to achieve the same
> >>>> configuration as I would when installing
> >>>> the package and just rewrite the script to use a local copy of the
> >>>> source code instead of the repository.
> >>>> That way I can just use the bisect command, rebuild the package and =
test
> >>>> again.
> >>> In my experience trying to deal with Linux distro's package managers
> >>> creates more trouble than it's worth.
> >>>
> >>>> But I probably won't be able to finish it this week, since I am on
> >>>> vacation starting tomorrow and will not have access to the computer =
in
> >>>> question. I will be back next week, by that time the patch Alex is
> >>>> talking about might
> >>>> already be in mainline. So if that fixes it, I will notice and let y=
ou
> >>>> know. If not I will do the bisection to figure out what the actual i=
ssue
> >>>> is.
> >>> Enjoy your vacation!
> >>>
> >>> Ciao, Thorsten
>

--0000000000009b25b505fd8dfcf4
Content-Type: text/x-patch; charset="US-ASCII"; name="sg_display_test.diff"
Content-Disposition: attachment; filename="sg_display_test.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lim0srqt0>
X-Attachment-Id: f_lim0srqt0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IGNjNjVjMzM0Y2I2NC4uMTk1YjRmZjdhMjg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTE2MzEsMTAgKzE2MzEs
NyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCQlicmVhazsKIAl9CiAJaWYgKGluaXRfZGF0YS5mbGFncy5ncHVfdm1fc3VwcG9ydCAmJgot
CSAgICAoYW1kZ3B1X3NnX2Rpc3BsYXkgPT0gMCkpCi0JCWluaXRfZGF0YS5mbGFncy5ncHVfdm1f
c3VwcG9ydCA9IGZhbHNlOwotCi0JaWYgKGluaXRfZGF0YS5mbGFncy5ncHVfdm1fc3VwcG9ydCkK
KwkgICAgKGFtZGdwdV9zZ19kaXNwbGF5ICE9IDApKQogCQlhZGV2LT5tb2RlX2luZm8uZ3B1X3Zt
X3N1cHBvcnQgPSB0cnVlOwogCiAJaWYgKGFtZGdwdV9kY19mZWF0dXJlX21hc2sgJiBEQ19GQkNf
TUFTSykK
--0000000000009b25b505fd8dfcf4--
