Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1875896C0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 05:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E4211293F;
	Thu,  4 Aug 2022 03:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1810EFF2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 03:53:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b16so16264665edd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 20:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=iRR1iLqoiLPd05xUeu4QA8DoUj4NMWZ3GKO/1gQCb2I=;
 b=GxolS5frGx/BtcZWjbwLLwCuSaexugK/wUcVJmuMVPzwWd3CYbwSLUTiOJy07fEwtP
 d8WJPIyN2HaPusVtWhz4Ut9sGpp45K45rI/i85Fq1hTolady9EZ8zSVZuBQ6uNNKVwNB
 gRmYmsAa8aLiDH2PDaBmb+jsp4CGgRMBcYtf2cACrbr5FDWp4gdKpR/fjL2eFjp2p+qZ
 gTRJner75WzQHAcLBvFSzIPnVvfQx1MiAHOMvtjOhHyJROpafhv+n4Ry7FchlYlEUktK
 M7u3RJyZkWZdWoG85npqZjb1s7he5hnG5wDGr1RNOiyIuiq5GRNhI7fwaMjccYsU8Fqx
 FtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=iRR1iLqoiLPd05xUeu4QA8DoUj4NMWZ3GKO/1gQCb2I=;
 b=CkdHuJVQcUseqAXehRjkxUfuYcDTq0qPrHWPjT+8aV4D1X2ZAN++YYodWhGesfJsS6
 wubomz5W6f+/30nYho9/YOLoQjSlZYqqMmQ3qx7TSmLUHUjnhHXZlMx3/hQqxX0hexIM
 tGF1zABNlt2euYRH+xq1oOUQ6TCmb17jpx90p5oyFbbRzP+mQEFtsi5KLyNHxqvS2knH
 t+wvwQKcxPzWoUxhRbgwKkBWOw+qMeNDs/hFoy5FmXFrAIepUoDTor4ha4A53nqlBTHF
 iVwtk6TsqXMMOYhg/D/V6msyUaq6nT93OQoPpjbTZmZKY+vX5UQY8hDREYAmkRZebh5Z
 8dgA==
X-Gm-Message-State: AJIora+8ZJJNx+OyxC6VN8iuk2l7EG0m1LeHKD46imErKmV8b6RjZCTp
 DNRK55Jwuj4Squnu/ZA/nanYJUX4ws6d77oHHtUx3jgZ
X-Google-Smtp-Source: AGRyM1vSAPI2YsHTOOApkyHPOdms11QNqSrKtkzqP9s71qm9oI9T7GNWpOXvWGFo/ZgLzLVt38DGnhbxrJAIhpPjBGk=
X-Received: by 2002:a05:6402:90e:b0:43b:914e:f084 with SMTP id
 g14-20020a056402090e00b0043b914ef084mr29091987edz.144.1659585180675; Wed, 03
 Aug 2022 20:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
 <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
In-Reply-To: <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Aug 2022 13:52:49 +1000
Message-ID: <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Aug 2022 at 13:47, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Aug 3, 2022 at 8:37 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Actually I did miss that so that looks good.
>
> .. I wish it did, but I just actually test-booted my desktop with the
> result, and it crashes the X server.  This seems to be the splat in
> Xorg.0.log:
>
>   (II) Initializing extension DRI2
>   (II) AMDGPU(0): Setting screen physical size to 2032 x 571
>   (EE)
>   (EE) Backtrace:
>   (EE) 0: /usr/libexec/Xorg (OsLookupColor+0x13d) [0x55b1dc61258d]
>   (EE) 1: /lib64/libc.so.6 (__sigaction+0x50) [0x7f7972a3ea70]
>   (EE) 2: /usr/lib64/xorg/modules/drivers/amdgpu_drv.so
> (AMDGPUCreateWindow_oneshot+0x101) [0x7f797207ddd1]
>   (EE) 3: /usr/libexec/Xorg (compIsAlternateVisual+0xdc4) [0x55b1dc545fa4]
>   (EE) 4: /usr/libexec/Xorg (InitRootWindow+0x17) [0x55b1dc4e0047]
>   (EE) 5: /usr/libexec/Xorg (miPutImage+0xd4c) [0x55b1dc49e60b]
>   (EE) 6: /lib64/libc.so.6 (__libc_start_call_main+0x80) [0x7f7972a29550]
>   (EE) 7: /lib64/libc.so.6 (__libc_start_main+0x89) [0x7f7972a29609]
>   (EE) 8: /usr/libexec/Xorg (_start+0x25) [0x55b1dc49f2c5]
>   (EE)
>   (EE) Segmentation fault at address 0x4
>   (EE)
> Fatal server error:
>   (EE) Caught signal 11 (Segmentation fault). Server aborting
>
> so something is going horribly wrong. No kernel oops, though.
>
> It works on my intel laptop, so it's amdgpu somewhere.

I'll spin my ryzen up to see if I can reproduce, and test against the
drm-next pre-merge tree as well.

Dave.
