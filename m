Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF286B3878
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AB010E97A;
	Fri, 10 Mar 2023 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FAF10E97A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:24:31 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id ks17so3171277qvb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678436670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tbDlSIaO3/jiqD80O4ij9Gm4MwJA0fTC0h0kloiqAU=;
 b=uhnkjpLTazuxqV+u3a76tStFJVlP6XgGs+2IIj2POnXLVfHSWejqSh2dR0dgQkvVC4
 weIiUXuCb3qty8wLK4TyLTClRNbJ+4PrPmrXDba5LH3t8OfPhcBU76eO8ZZ9T5tGTStz
 8adov3ZCzNZ6JFgmkhAiAlWVb5EigV03v/MRHDe/pzjG/a7ip0lj+bkAl7SdnaopQYs3
 i0jNaUeJpTsG0TCbY4nzgzZoP9FhbNMGlABrNqDqxXzIbSD5BIBdhhlNHmV6uMkjtLye
 9q3+Wnb/Vaf0UB8+RsVhdD459XvCHv4B6Vp1/VNCSZwxHdGO/7Y4EJxpT2wDrzF13aZ2
 8Wlw==
X-Gm-Message-State: AO0yUKV+KGvyCsAjaCnuWwLK2B8tW/tkEFrJiFsTQVSw2yYMAPhG+L8u
 nKpxkDq3uIHyrUPitMHMGpOLtXuMEJW9Ng==
X-Google-Smtp-Source: AK7set/dFI8+wy/FzZuFF2KHlVnZS398SSN2n0L8xx7YwCFAok1C2LPHCnP1BihbL7ZFT51dlutSBg==
X-Received: by 2002:a05:6214:300b:b0:573:179:3caf with SMTP id
 ke11-20020a056214300b00b0057301793cafmr13525981qvb.2.1678436670638; 
 Fri, 10 Mar 2023 00:24:30 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 b80-20020ae9eb53000000b007425ef4cbc2sm883646qkg.100.2023.03.10.00.24.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:24:30 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id t4so4474593ybg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:24:29 -0800 (PST)
X-Received: by 2002:a05:6902:208:b0:acd:7374:f154 with SMTP id
 j8-20020a056902020800b00acd7374f154mr15193253ybs.7.1678436669227; Fri, 10 Mar
 2023 00:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20230309160201.5163-1-tzimmermann@suse.de>
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2023 09:24:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9mmPDvTpeHQWMoi1pAqoDn1go4in995pGkamOQmBXjA@mail.gmail.com>
Message-ID: <CAMuHMdX9mmPDvTpeHQWMoi1pAqoDn1go4in995pGkamOQmBXjA@mail.gmail.com>
Subject: Re: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
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
Cc: linux-fbdev@vger.kernel.org, thomas@winischhofer.net, adaplas@gmail.com,
 timur@kernel.org, corbet@lwn.net, deller@gmx.de, rdunlap@infradead.org,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Mar 9, 2023 at 5:02=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Introduce struct option_iter and helpers to parse command-line
> options with comma-separated key-value pairs. Then convert fbdev
> drivers to the new interface. Fixes a memory leak in the parsing of
> the video=3D option.
>
> Before commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to
> caller; clarify ownership"), a call to fb_get_options() either
> returned an internal string or a duplicated string; hence ownership of
> the string's memory buffer was not well defined, but depended on how
> users specified the video=3D option on the kernel command line. For
> global settings, the caller owned the returned memory and for per-driver
> settings, fb_get_options() owned the memory. As calling drivers were
> unable to detect the case, they had no option but to leak the the memory.
>
> Commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to caller;
> clarify ownership") changed semantics to caller-owned strings. Drivers
> still leaked the memory, but at least ownership was clear.

While I can find the actual patch[1], I cannot find this commit?
Where was it applied?

[1] https://lore.kernel.org/all/20230209135509.7786-3-tzimmermann@suse.de

> This patchset fixes the memory leak and changes string ownership back
> to fb_get_options(). Patch 1 introduces struct option_iter and a few
> helpers. The interface takes an option string, such as video=3D, in the
> common form value1,key2:value2,value3 etc and returns the individual
> comma-separated pairs. Various modules use this pattern, so the code
> is located under lib/.
>
> Patches 2 to 100 go through fbdev drivers and convert them to the new
> interface. This often requires a number of cleanups. A driver would
> typically refer to the option string's video mode. Such strings are now
> copied to driver-allocated memory so that drivers don't refer directly
> to the option string's memory. The option iterator then replaces manual
> parsing loops based on strsep(","). All driver-allocated memory is
> released by removing the device or unloading the module.
>
> Patch 101 finally changes the ownership of the option string to be
> internal to fb_get_option(); thereby fixing the memory leak. The option
> iterator holds its own copy of the string and is not affected by the
> change.
>
> Most fbdev drivers only support to parse option strings if they are
> built-in. I assume that's because of the original fuzzy semantics of
> fb_get_options(). A later patchset could change the driver to respect
> video=3D settings in any configuration.
>
> v2:
>         * use kstrdup()/kfree() for video strings (Geert, Timur)
>         * fix iterator docs (Randy)
>         * update iterator interface

Thanks for the update, this looks much better!

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
