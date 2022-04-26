Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B058E50FD32
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E5C10E36F;
	Tue, 26 Apr 2022 12:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D4E10E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:38:40 +0000 (UTC)
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MysiI-1o4aNQ30ew-00vw10 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr
 2022 14:38:38 +0200
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2f7d19cac0bso73606607b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 05:38:38 -0700 (PDT)
X-Gm-Message-State: AOAM5301sM6ar0O+1EgD5PmCJ02seysNiUlboLet5BJiZaeU676tkAnT
 LW+5TD+y374j7TMNTi1H86StKy41dvw7/evRmU0=
X-Google-Smtp-Source: ABdhPJwgCuCUa4o+AgAH4pI2w9geQ9zGuYooiQu61gb9/bVoeW8aj/5quj9UKhljTouqCt64isUtADXX7teUyfMtQT0=
X-Received: by 2002:a0d:d804:0:b0:2f4:e47d:1c2c with SMTP id
 a4-20020a0dd804000000b002f4e47d1c2cmr21230444ywe.320.1650976717282; Tue, 26
 Apr 2022 05:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
 <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
 <CAK8P3a2w1t7Sk897u0ndD66Lwp5a4DuOqqQLN4yHSg=JmrpOHQ@mail.gmail.com>
 <20220426122404.GA6788@chq-T47>
In-Reply-To: <20220426122404.GA6788@chq-T47>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Apr 2022 14:38:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2M=zw509HGRALmgbr+E6GjKoZqqkh9kCbyGB9hD_+3LA@mail.gmail.com>
Message-ID: <CAK8P3a2M=zw509HGRALmgbr+E6GjKoZqqkh9kCbyGB9hD_+3LA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of
 NVDLA driver
To: Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OoNPhpqdBjt9eTCjL3A9vaBQj+V3L63v3TwdxeWY0Ob6Q1niE/8
 ZOm6+LOTwOV4W8V4uSli5DJzSIOcopHvy+Nej8K7lQUbizLvfGWnMxSb/9ZN7HwN2AW2V/G
 LaI4sUfY2OjuZpMmSz4X2UJhxO2vBy60kS5gTR0v7cFnd8Z7eXt/pEuUud11S4gS6KsG3Sg
 jaeTUA3tvFXKJpTcQesCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5+qokr0zPe8=:84W4BvMe7OMHWBpV1Pf4dU
 ncodm54nh/6hbJj3B1mlKNzDGlHPzOQnYjhCjRNKlj/zcmjx+EsxZ6mwQgwFP14rJchJlLHdG
 hmMsBNHykr7SwuGE/VtgoTVbshsw6bv+ob4snJcBpbYal9PobpTBABXU5/lH3Upd1TLtXAstP
 1PBhaypV5mYi53oucMdGNJixIaiOs1tBHj4zuakht4YSyepsopyf/I1QlkVuTqASivumXXUav
 jYZQUUYsLPkydB9VNJx9WWF8FCNnJbYzjg6Kf3499vF5uwXOHs/9Fdtk9mnwNTHh6/8Bn6HhZ
 1m9/vhQ2FM7A/5ZUUniEC3Y7/9jwY3hcoucoQd7HFqoqR7YvnjkNUeqrUUkwYuIeVnU0PmGB5
 isSvnVAU5wVphozHPC4thWDQsxjXtbVezOnzlX77C8PCYa35sE4AHsTAQuZEgG7smG++3ztbq
 9e8gAQD+Zvu7g0rCnQAo38TNvi17PW0ktCxaAS5+X1QzZ3dAPUU+dH94r4mE/kby1Q2wkzoJN
 3RZwdh3pJnGJSLTnzbd/0rnGtLebrsFDA3osuVc1YPwTM4wBLj7z9rqDckCU5zOl1RXDP/e/p
 hros3MpsRBydC2ni1PAFJ2a2Qq4rPiZhQIx6DHlYGhaldXdqI22mu7aeXbd9MdMABH73C/jWX
 9+ku+jh8ifJ6BXXk21NZTdz/CTE6TLcc1rsZ5ei0mgvPgYQPEXlSG/OR1YeqW5ZQSjA++aer7
 +qjL2cKnSIYu+uLuga75fdJ+6gwdxRIpLj2yTzzFHuyu8SOXPpTGvwsU40F0IYQlTiz95b+t/
 qq+BzdB4EFI1TLtl8otdnc4cl7bTQOyErvkMq5Dfxz/5mrOWEI=
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 2:24 PM Cai Huoqing <cai.huoqing@linux.dev> wrote:
> On 26 4=E6=9C=88 22 12:50:50, Arnd Bergmann wrote:

> > > > +#define DRM_NVDLA_SUBMIT             0x00
> > > > +#define DRM_NVDLA_GEM_CREATE 0x01
> > > > +#define DRM_NVDLA_GEM_MMAP           0x02
> >
> > Is this an actual mmap() call, or something that needs to be done befor=
e the
> > mmap()? Is the 'handle' a file descriptor or some internal number?
> It's an gem object mmap which calls drm_gem_dumb_map_offset() inside and
> the handle is gem object handle.

Ok, thanks for the clarification. I see that other drivers have the
exact same thing,
so I assume it's fine for drivers/gpu/ then, even if it would be a bit odd =
for
other subsystems.

       Arnd
