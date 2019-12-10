Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0E119275
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6189B27;
	Tue, 10 Dec 2019 20:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF6C89B27;
 Tue, 10 Dec 2019 20:52:09 +0000 (UTC)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N0nzR-1hlB5e22SL-00woj5; Tue, 10 Dec 2019 21:52:07 +0100
Received: by mail-qt1-f177.google.com with SMTP id p5so4062996qtq.12;
 Tue, 10 Dec 2019 12:52:07 -0800 (PST)
X-Gm-Message-State: APjAAAVak0bKV9CgZJVefYayKZoS1141QLw7ERQJ0ju0EAaL6aopPFjL
 A6TCvpXHTXkU7gIxRxaVeL/T7wLDezuNx7iDgtw=
X-Google-Smtp-Source: APXvYqx1uN5tm9eCOzoQBysKWKFpMTzZPxr5PqaW9bDfYB2yfC5l95PFbwxivepFESYFJ8F3qgkDRXUfr5anVcdWFA0=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr31351077qte.204.1576011126328; 
 Tue, 10 Dec 2019 12:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20191210195941.931745-1-arnd@arndb.de>
 <cded03ab-40fe-a904-7b1f-5b3623bb7af4@amd.com>
In-Reply-To: <cded03ab-40fe-a904-7b1f-5b3623bb7af4@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Dec 2019 21:51:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3XHWPBOsCpFtdoT8F-pAMXaekDOX1rNjjMWKLN6WSK6w@mail.gmail.com>
Message-ID: <CAK8P3a3XHWPBOsCpFtdoT8F-pAMXaekDOX1rNjjMWKLN6WSK6w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: include linux/slab.h where needed
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
X-Provags-ID: V03:K1:odURU4WPiLkXcucDlfc71UXCfG4jWw1BS+LkraKFiBaJJhf9Fy3
 dI56MMQ925HwgfXKKYKCM5Pv99R82KVx7dqkhkH/UM0ZoTAfKLrwd9xBwGhBPr9dRZDf/dF
 kzk+3LMe/oCEx/tcXRO28SzJQkrsrrHjq2YBgMJBAFazCIUTvuzV7emcIyWtaAINx95yPwB
 VpD1QnZecxkXw2t7jkMnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8n5+XbAx3k=:sInwACHy37zGBlbaLaKCZH
 8W3et3YlDo17Zy0KMKc4Iya5A4d3gXe9mfxxNQlR50D4zcYAhl8QLdzvw2xChJD3bBfIszU/f
 g3UEsjKG6X/n2RPSk+IjddsPSkiQNRpJIp6isM3f5ejJo/WB/dSHvSnHFToI9pXvZJXo5ef0b
 jA/CxWjrNq4osQeu9OIJieN1aUNU3HW5BJ1I7Hui2X1B1LnDcvuKCIOdko3rPjPXlsA7rAcpg
 OCoLX4TliLWURZWms65CyUyjc4IK3wRDG3jElCpxft8gtuI1QpKrHTRb4/6ZRz52g3QR0+/ZV
 rBPmZb2K93v3JbJbmg7OptuYnpYW6vQod2kwczHDdQTV5vqbecpNl8IZVtEk+46C/MCdqb0OF
 QKfJ4gnWLS7+EtLnZlSocBqqfHK79eTsIgNEcCcUA5zdRT8DAPS3ySc2CEq4MEt7O8CS6mruU
 VqeKiQgFk326Lqq+KxMnheZyYP49lfiCXI3uQDsPvKwN3Ztjl4aMLRAx652tTPIj03pDceeoq
 r7dFlSis+U5OmaTgAmIJMnsesVPP0PJD1Fq0uoeGr5pkCXAa1mcdPqBmEYNKZ0I0aiwdJMMB+
 d87XzQOUFAX+9yeppSySIZhdOEI8M86ofhnfVxT/Lk1mBQ1NPSg22uPPcbaN9fcjylxnxLnsM
 hM0c3Tyy4R6lpZdkmQEiAYsfRHON0mM0HQNUH+0xO7PCZaqAatn2IH4r8FLf6/dbodRXwcc4u
 9vCl6tQ3DiXDeaMHgL/SajjfidgKnRk/0bUTyC2D2+LifjLFWcXcOQ/A0B4bIDwlvQhGzQEj9
 EE5JwGT51+V0lW1E5WtmJiJoY+dXVGovZsja1jgInAletEJB6Rxqi/EAu5DgF8kbMIonfu7VE
 zz8ZCb+/94nJKovf5bBg==
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
Cc: Eric Yang <Eric.Yang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Strauss <michael.strauss@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 9:30 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2019-12-10 2:59 p.m., Arnd Bergmann wrote:
> > Calling kzalloc() and related functions requires the
> > linux/slab.h header to be included:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c: In function 'dcn21_ipp_create':
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:679:3: error: implicit declaration of function 'kzalloc'; did you mean 'd_alloc'? [-Werror=implicit-function-declaration]
> >     kzalloc(sizeof(struct dcn10_ipp), GFP_KERNEL);
> >
> > A lot of other headers also miss a direct include in this file,
> > but this is the only one that causes a problem for now.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> What version of the kernel are you building?

This is v5.5-rc1, plus some local patches.

> We have:
>
> #include <linux/slab.h>
>
> in os_types.h which gets included as part of this file:
>
> #include <dc.h> -> #include <dc_types.h> -> #include <os_types.h>

I don't see linux/slab.h in os_types.h. I now see that commit
4fc4dca8320e ("drm/amd: drop use of drmp.h in os_types.h")
was merged into linux-5.3, which may have caused this.

I also don't see anything in os_types.h that needs linux/slab.h.

    Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
