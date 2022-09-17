Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5BB5BB89D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3810E3A8;
	Sat, 17 Sep 2022 14:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F75210E39C;
 Sat, 17 Sep 2022 14:01:03 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id s14so3691333ybe.7;
 Sat, 17 Sep 2022 07:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zD/Sef8RPFCu0UVUYWziEP2nxLn+8U8oMtAWbA1WOKg=;
 b=YcC3cgGuhWS4Xg3lrgZagbYgcH7H+Oqs1Vtfdb19quwhZaGI9UkGTfJt0FGuC3TbGk
 cC65tdI5WnSnZBN82+V6LK9oswdYJU3KLJq6NoFtrUPaQ6p2Xvxopnlu32vLyj2QvSUL
 d2Dw+zRNL37+TnmVi1iohbS1coBfaP8ILUJ+0wNcjTbQdFjoD6QL2lSRLYKcMN7hH9oL
 z1KxYlu1exKoBhQOaq5Q1um1ACC3dGlNgbLomefFeD4frSFk69CfgbS12OBMoOtME9Y+
 YFTpir5rXiAsWbkTm5IHbNzHkcZu+iLcrlGir95p2yHh63P9SNdm/rocCcaTwgCOeScc
 Wztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zD/Sef8RPFCu0UVUYWziEP2nxLn+8U8oMtAWbA1WOKg=;
 b=Dr9Z7ZM2ZWIkySGbIbUw/hEwhMHWRz4rr5YhJmjGkFQSfuz1RM09JdOAdpNSKoaU1x
 F9J5aMCknTLNbfn9jpOjrJaTqcrP8+iUxW/oXWml542/MoJ/Ff2S6eO+lykzKtfTh+Lf
 BTeM9Iy8xBfnu4Fr9y+pFRWZSKtVi6c6hsrs+X7fdwnboxuzmc1Z/LUrTzsBMyNa/zWd
 T5aroDhveVAKDh6IofWdMS9C5QcVqV9o10socp/MOwurdGqez7eBQWgqJe8kv068E0PS
 RH2PkdArF/7JadZXnrrtlxF5jBpdGza7Wi5umJa0QY78/6RxyTnc7xsXLZUuNCnRIJF/
 xg7w==
X-Gm-Message-State: ACrzQf2x7LfBGArVVozv/16JbbsfJMA/nVgwdger68NWWSHOJ4JuPqzN
 3NQNxUnwjCFZatuCi0glngEt80TbIz4AqH8E4XQ=
X-Google-Smtp-Source: AMsMyM6MSZI9tekALssIfUCVIXmmS+TxhNp3mdgEOPjIBYJ6CwNaZ3jWo3MxCGHOKPfoAytGRmXAHXSCXcB/twZbNMc=
X-Received: by 2002:a5b:845:0:b0:683:6ed7:b3b6 with SMTP id
 v5-20020a5b0845000000b006836ed7b3b6mr8163614ybq.183.1663423262817; Sat, 17
 Sep 2022 07:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <YyWniVAqJclcbSqN@debian> <YyXK1rJYEc04Sobt@dev-arch.thelio-3990X>
In-Reply-To: <YyXK1rJYEc04Sobt@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 17 Sep 2022 15:00:26 +0100
Message-ID: <CADVatmPwPjpEJdfygtQtt7d6oQfABUtTVrn2k57eKFEFQChDbQ@mail.gmail.com>
Subject: Re: mainline build failure (new) for x86_64 allmodconfig with clang
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Leo Li <sunpeng.li@amd.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On Sat, Sep 17, 2022 at 2:25 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sudip,
>
> On Sat, Sep 17, 2022 at 11:55:05AM +0100, Sudip Mukherjee (Codethink) wrote:
> > Hi All,
> >
> > The latest mainline kernel branch fails to build for x86_64 allmodconfig
> > with clang. The errors are:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:4020:6: error: stack frame size (2184) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> > void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> >      ^
> > 1 error generated.
> >
> >
> > Note: This is a new error seen on top on a335366bad13 ("Merge tag 'gpio-fixes-for-v6.0-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux").
> > Previous reported clang build error is now fixed, thanks to Nathan.
> >
> > And, it appears Nathan has already sent a fix for this:
> > https://github.com/intel-lab-lkp/linux/commit/4ecc45d7585ae2e05d622879ad97e13a7d8c595b
> > https://github.com/intel-lab-lkp/linux/commit/819976a950b497d7f10cd9a198a94c26a9005b30
>
> I did not realize this was a mainline issue too :( it seems that
> commit af2f2a256e04 ("drm/amd/display: Enable dlg and vba compilation
> for dcn314") is needed to see this and it was only in -next for three
> releases (20220914 to 20220916), which I missed checking as closely as I
> normally do due to Plumbers wrapping up and traveling.

This has become a mainline issue since today.
I saw in it linux-next also, but missed reporting :(


-- 
Regards
Sudip
