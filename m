Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6856AD9B7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A510E105;
	Tue,  7 Mar 2023 08:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396F710E105
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:58:06 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id c19so13536487qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 00:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678179485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mf9D3mYUVq4IaTZ5HVptNWacWozv4toT5Gz07corxFA=;
 b=Cw5vxT8b+ZuLpPRMhrExdLyMQioKls98qgN2MOw7IdH+ykb+e4nSzytjnDsN6AYdpR
 SWFu55+CfjpGPkfNoST0Cslphar0ecrcJCnkttJVJu9i+RYQkNM8QUK/ezm2FpOuipN4
 Oqaix52ZVU/wmk0nMZQVNOFSuH0wT+KthFJ9CGmunDevicGCKd71i5ZsQuAU8twXcT3w
 jiPSGJoZwnBIX+XrXIhJQaOW4ZyWTna83t53nksG46pR03R8Wm2EH+vjMtrH0J/0L3bv
 ZOHQDdqyIGVI1gI8xyktUzoJaO1MlV7p9KOjK216fraEhsY96id/f2+Ht3VblQ2oeZxV
 fqdQ==
X-Gm-Message-State: AO0yUKU8pNky60NcqLL9iWQpXOkiMR4fksLcexHUyPW1xNAWlRf3zY1z
 8VbQ21wekms8z5n2IVefv8GU8XL8sOn3ug==
X-Google-Smtp-Source: AK7set/D6KJQiPucNeAniCPnZ6NEMXAJReiaxtP3ey1LjgJoLa0KTrr80pBDnjPWtF6F6Bh7iBiylQ==
X-Received: by 2002:ac8:7f4f:0:b0:3bf:c7f4:24b with SMTP id
 g15-20020ac87f4f000000b003bfc7f4024bmr23465030qtk.42.1678179485046; 
 Tue, 07 Mar 2023 00:58:05 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 q25-20020a37f719000000b007343fceee5fsm9087958qkj.8.2023.03.07.00.58.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 00:58:03 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 82so10690255ybn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 00:58:03 -0800 (PST)
X-Received: by 2002:a5b:542:0:b0:a67:c976:c910 with SMTP id
 r2-20020a5b0542000000b00a67c976c910mr6389341ybp.7.1678179482859; Tue, 07 Mar
 2023 00:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>
 <c560dd1c-03ac-1aa7-f3ac-2a2d9f411505@suse.de>
In-Reply-To: <c560dd1c-03ac-1aa7-f3ac-2a2d9f411505@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2023 09:57:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWRwN7Ks1ougy81Lh=NKLD+y04Xr6O+Ee+3k5Z4QH2Rg@mail.gmail.com>
Message-ID: <CAMuHMdUWRwN7Ks1ougy81Lh=NKLD+y04Xr6O+Ee+3k5Z4QH2Rg@mail.gmail.com>
Subject: Re: [PATCH 00/99] fbdev: Fix memory leak in option parsing
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, timur@kernel.org,
 corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net, mbroemme@libmpq.org,
 linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Mar 7, 2023 at 9:23=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 07.03.23 um 08:53 schrieb Geert Uytterhoeven:
> > On Mon, Mar 6, 2023 at 5:00=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Introduce struct option_iter and helpers to parse command-line
> >> options with comma-separated key-value pairs. Then convert fbdev
> >> drivers to the new interface. Fixes a memory leak in the parsing of
> >> the video=3D option.
> >>
> >> Before commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings t=
o
> >> caller; clarify ownership"), a call to fb_get_options() either
> >> returned an internal string or a duplicated string; hence ownership of
> >> the string's memory buffer was not well defined, but depended on how
> >> users specified the video=3D option on the kernel command line. For
> >> global settings, the caller owned the returned memory and for per-driv=
er
> >> settings, fb_get_options() owned the memory. As calling drivers were
> >> unable to detect the case, the memory was leaked.
> >>
> >> Commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to calle=
r;
> >> clarify ownership") changed sematics to caller-owned strings. Drivers
> >> still leaked the memory, but at least ownership was clear.
> >>
> >> This patchset fixes the memory leak and changes string ownership back
> >> to fb_get_options(). Patch 1 introduces struct option_iter and a few
> >> helpers. The interface takes an option string, such as video=3D, in th=
e
> >> common form value1,key2:value2,value3 etc and returns the individial
> >> comma-separated pairs. Various modules use this pattern, so the code
> >> is located under lib/.
> >>
> >> Patches 2 to 98 go through fbdev drivers and convert them to the new
> >> interface. This often requires a number of cleanups. A driver would
> >> typically refer to the option string's video mode. Such strings are no=
w
> >> copied to driver-allocated memory so that drivers don't refer directly
> >> to the option string's memory. The option iterator then replaces manua=
l
> >> parsing loops based on strsep(",").
> >
> > Thanks for your series!
> >
> > Unfortunately I cannot say I'm thrilled about this: you are replacing
> > a single small dynamic memory leak by 36 larger static memory leaks.
>
> That's fair enough.
>
> > Am I missing something?
>
> The current size of the videomode buffers is ridiculously large. I just
> needed something that could hold the string. A long mode description
> might look like
>
>    1920x1080MR-32@120ime
>
> which has 21 characters. 32-byte buffers would probably be more than enou=
gh.

But there are a few exceptions...

> I think it should also be possible to do a simple kstrdup() on the given
> videomode string and free the copy in the module's _fini function.

That sounds like the sanest approach to me.

> That also brings up the question of these MODULE ifdefs. Almost all of
> the fbdev drivers only parse the command-line option if they are not
> build as a module. Do you know why? Because of the awkward semantics of
> the old fb_get_options()?

That's just historical: to get to see anything on the console (on
the graphics hardware without VGA text mode that fbdev was originally
developed for), you needed to have your main fbdev driver builtin.
Drivers for secondary displays could be loadable modules, and using
fbset for those offered more flexibility than a module parameter.

> I think this should be changed so that they
> always respect the video=3D parameter.

I agree that makes sense.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
