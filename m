Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B69320E7B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 00:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BC46E48D;
	Sun, 21 Feb 2021 23:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7D6E48D
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 23:07:36 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y7so50784490lji.7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 15:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9CZc6j54KVkhNtnlVAPjyH9O60vJPCOdPJohXtM448=;
 b=VJE0KaWIqLNIiVJZbdHs7iPeShk8LirvoiZO0J4hrm9nUuO13brxoUpPUVYVGEp5Yc
 z2DLPU/lGPdy0+JV8Sh+xoVbZsY236mVW2P/emeJPhXbdj98+0x08/R9XeqZDRD29nEK
 NN/0xcVdF7ZYkPc7TtkjCNnUSVwu7OYjs1Cio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9CZc6j54KVkhNtnlVAPjyH9O60vJPCOdPJohXtM448=;
 b=cAaAxvJZTxvYZZ5agVajUCE/b85ck6oiQzlEt+AQMbO1SgmMkQIJxJphFuwByxj6Cx
 y9kwl7VvRgmga7ijM4rbZDpWvrascCVpghredH/AajVuIas8aLXER4IlIBqKF96mGxTG
 HwwKY/urmjvXksEvTHhD/d7+ADaShfEw87fBpMbHHVpKEPZWYFAR3Rvyfj7Bh3dYTB3T
 YFmSSyVuBFjC4RkIyNW6KucwEob459g3jTiV4WfkGBHwP+RQbIB6CkVqgj5/4xHZdjVm
 6LcAEm4+K5yitp5Y8LHLJ7RArce0VpGf+BxYAX6iS6GNku8q4oTOAuIgO0Rl43/WT92b
 86ew==
X-Gm-Message-State: AOAM533hX4APj7qSHhLXdgoP3WjCONMA7cmHZlXSAV6Ho82RPi0Esia4
 qrYQ/yi4s73PP+JqrNSZspjSdpZybOi//A==
X-Google-Smtp-Source: ABdhPJyO231zuJKn97R+4z3T4L5/k+jW/0a0tdLNQsqOs1hnCp1oipUBGFc1HGngEwy+9hv3eL9vHQ==
X-Received: by 2002:a2e:90f:: with SMTP id 15mr12998132ljj.7.1613948854625;
 Sun, 21 Feb 2021 15:07:34 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id u15sm228134lff.262.2021.02.21.15.07.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 15:07:34 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id e17so52896291ljl.8
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 15:07:33 -0800 (PST)
X-Received: by 2002:a05:651c:112:: with SMTP id
 a18mr12843554ljb.465.1613948853595; 
 Sun, 21 Feb 2021 15:07:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
In-Reply-To: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Feb 2021 15:07:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgiPxXzRNnfaXk7ozSWSu7fFU--kTmVjkDaTB05wwUk_g@mail.gmail.com>
Message-ID: <CAHk-=wgiPxXzRNnfaXk7ozSWSu7fFU--kTmVjkDaTB05wwUk_g@mail.gmail.com>
Subject: Re: [git pull] drm for 5.12-rc1
To: Dave Airlie <airlied@gmail.com>, Kevin Wang <kevin1.wang@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 10:06 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Let me know if there are any issues,

gcc was happy, and I obviously already pushed out my merge, but then
when I did my clang build afterwards, it reports:

  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning:
variable 'structure_size' is used uninitialized whenever switch
default is taken [-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:770:23: note:
uninitialized use occurs here
          memset(header, 0xFF, structure_size);
                               ^~~~~~~~~~~~~~

and clang is very very right. That "default" case is completely
broken, and will generate a randomly sized memset. Not good.

Presumably that default case never happens, but if so it shouldn't exist.

Perhaps better yet, make the "default" case just do a "return" instead
of a break. Breaking out of the switch statement to code that cannot
possibly work is all kinds of mindless.

Kevin/Alex? This was introduced by commit de4b7cd8cb87
("drm/amd/pm/swsmu: unify the init soft gpu metrics function")

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
