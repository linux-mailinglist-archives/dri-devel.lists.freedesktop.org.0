Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4D20CA5F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176E76E152;
	Sun, 28 Jun 2020 20:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618A6E057
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 19:43:14 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so8263637edy.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGY8B6Oe7XCHiADnLEqpel5yWhZGTgQFMZLJLu4AeLg=;
 b=Rc16qhzTaGkvar0RBwernOkMKUaB2kPbxraK853fDwlvWWhKavUOOmXLt+hsQMDnQC
 NQQjm3eyWCkcTkss7DUV5Bbs6lnHwIJxtikNZ+2hU13pN3y9YPIZT7Kjk8wOmiemCmme
 +WsbPSNfbSAEIjHWlHDmF00fPKbKEJwT6SMoXCVMOPsjpBsFXYCNZ1jnQENLd0gvAQw3
 rlwZ/lxlGi0swTvJ9mOnHX3+sABFxlv7iCHPx4fukAeVYdmqxcVSTAkoPTHfKE2eUstI
 VFy1cKoRZ0A2Df5tA0TsKm6yoSwvcEzXCXFWS+/aFGd29fYODwSMf1zuR7LrzkAdJQda
 3/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGY8B6Oe7XCHiADnLEqpel5yWhZGTgQFMZLJLu4AeLg=;
 b=QYG7ey5+AGqsRovYN9jd1nTwTWmrCtEOvRbcucEm+yw+mjrD15kMAmyW2bHAevUJxP
 zylqQNzrKD4Y31XIMwF42JXTVmNhFNFtIZDJgLMsCIlsolGJu0cnW8VZkHiFArDDTOtV
 bgcFTCm/VHwg6D7QHh8O5QGgnMk/YL/YqMDhY4Yr7qxZLBTQxRK/aWwf4fTyI6veYOW9
 vw9FQ2BUC8R9X8sqbvAN62sq2w6p8/sbL9TZokjZDbFGyGvkf5PNghYWc9WL/PJyebFm
 JOeJaDi+LEcWmpTV+R8dd/b4sOtt53uIZ9+QBXq6YcgIsXDl7gjS4f4GHGR8TBHu7n0Z
 baKw==
X-Gm-Message-State: AOAM530/AP0Cbf6Y26I/bjxBORxP7Nmpwm2pWEUGIC3MqIub3RVqlQ75
 mGgdmkPgmcdP3IZ7093OxYHEUCbegDUXGN6pfdU=
X-Google-Smtp-Source: ABdhPJzQiWUDIYGSsX+B23VyHEVSNyAyfdKQrssW7lJL48zy17S+fQiaHNN7lg3dINy+2DQpLyN47qQsODs8ks9qGJM=
X-Received: by 2002:a05:6402:542:: with SMTP id
 i2mr8211841edx.318.1593286992686; 
 Sat, 27 Jun 2020 12:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <202006210249.QHly8bQZ%lkp@intel.com>
 <CA+h21hpABfDvthiwq_JwWGpqZ68VJxu5TOBVbw_Gaxpq8j+XQg@mail.gmail.com>
 <CAKwvOdnAKR_CtOccZohR_r1kzKKVuvo8LbpLi0s3ek+3u+c_zw@mail.gmail.com>
In-Reply-To: <CAKwvOdnAKR_CtOccZohR_r1kzKKVuvo8LbpLi0s3ek+3u+c_zw@mail.gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Sat, 27 Jun 2020 22:43:01 +0300
Message-ID: <CA+h21hokCCF52O1wxkg0gLqS9ZcGtB0xMBm07_--i56=anJ=Rg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning:
 stack frame size of 8312 bytes in function 'ld9040_prepare'
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nick,

On Mon, 22 Jun 2020 at 19:50, Nick Desaulniers <ndesaulniers@google.com> wrote:
>

> > I really don't get what's the problem here. The listing of
> > ld9040_prepare at the given commit and with the given .config is:
>
> I wrote a tool to help debug these.
> https://github.com/ClangBuiltLinux/frame-larger-than
> If you fetch the randconfig and rebuild with debug info, that tool
> will help show you which variables are used in which stack frames and
> what their sizes are.  Also note that strange things get dug up from
> randconfigs.
>
>
> --
> Thanks,
> ~Nick Desaulniers

I ran your tool and it basically told me that all 11 calls to
ld9040_dcs_write from within ld9040_init are inlined by the compiler.
Each of these ld9040_dcs_write functions calls ld9040_spi_write_word
twice, so 22 inline calls to that. Now, sizeof(struct
spi_transfer)=136 and sizeof(struct spi_message)=104, so, no wonder we
run out of stack pretty quickly.

But my question is: what's wrong with the code, if anything at all?
Why does the compiler try to inline it, and then complain that it's
using too much stack when basically nobody appears to have asked it to
inline it?

Thanks,
-Vladimir
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
