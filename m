Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795451BE839
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 22:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88D89A1E;
	Wed, 29 Apr 2020 20:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B189A1E;
 Wed, 29 Apr 2020 20:16:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlwJv-1ilzsF0pil-00j1AE; Wed, 29 Apr 2020 22:16:28 +0200
Received: by mail-qv1-f48.google.com with SMTP id ck5so1821633qvb.11;
 Wed, 29 Apr 2020 13:16:27 -0700 (PDT)
X-Gm-Message-State: AGi0PubcGoD/oqOPr7H/rzQ35tucIZ2GW0SRfxmE3sd62g/dSmjAwxLS
 UOKDplDtAAqJu1AR6M6zV0droyHj60nHIxJaCZA=
X-Google-Smtp-Source: APiQypLcjPwxokzpMF7Rw8kO99qPhqxtI0E31pommY4IAHy487ZiF1AuTEEi6jnKVWVL5iHLduQMeGZW8J6vPMtaFeU=
X-Received: by 2002:a0c:ea43:: with SMTP id u3mr26292131qvp.211.1588191386818; 
 Wed, 29 Apr 2020 13:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200429092207.4049268-1-arnd@arndb.de>
 <f9738a59-5c7d-57ad-0d56-6455d6938964@amd.com>
In-Reply-To: <f9738a59-5c7d-57ad-0d56-6455d6938964@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 22:16:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3YCKtkt2pHQZGg8SQsbdA2Ai3ZhxCGKToD2KVRHQgnrw@mail.gmail.com>
Message-ID: <CAK8P3a3YCKtkt2pHQZGg8SQsbdA2Ai3ZhxCGKToD2KVRHQgnrw@mail.gmail.com>
Subject: Re: [PATCH] [v2] amdgpu: fix gcc-4.8 build warnings
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
X-Provags-ID: V03:K1:yZWyjics4cRPjp0O+pGmtbJ0b+oShRb9kPiIlGPXEHDiXjTFCjH
 0qpPlZJ+2dPinA+b/o7nd9bG1snydFhYLcBOJ+YPZNHYGjYqwRWn/Lm4Uh4ljoIbkMMNvTw
 X6sCL86fvQ1o60eQggFJOrM8b7OsbGhgixbifFYA6GoPdO9fseAsAXCms5vAxvoh/ME7beR
 f12ubCqHmKhzqha6LP6pQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OjVuCSWUrM0=:9i1Cf+WUGbOfeoqZJySrI8
 FEr6f6qa/2qob4UDmxpckrq5qjU5omgY/ycq33Sf/oQQjbnzjeHdH+3IXYBGj4hKL06Y6RX0U
 jrtj0bKLx6fdxMLqAyFtiR0mk228xZ3KzVP2c59qNIENHvBWBgThn5mHXcf34kuN4U6/48f1j
 lCR6n9DOU8RYJrdGAKV8KPqndfklF+1R70KCQT3ggEO8ON0eMz9bdze0fGUJOZTglEW/YpTJg
 m5fOS7xKW6U+91MAnffrXYjlG1rIuVw/8YIOwpaQz9q+mTsjImj//2Rj2Hyz10FBrDvO6ftS0
 DOZPWXuZ0iMElWzmR8392GxB0i0JWUFajOBAsORUU80G2FvubQ0uKkL0oipSs2bM/Hy2Pa46Q
 nXa8r7OmpszjoTnyTmqHs0ZQ171vRmeTNm+cCMGUjj770YTPcD2sKjetcqJ/Xw3Gnec5nENBB
 uUNF9QoROt9Fjni9AU9FoBLH45ipngpxKVOOLE+6ZBDwX5BjdK3i+mX9gWt6XscBEn6iETx/q
 wtMZm8QNkAL6EPxCQGKGjHqWNk2Uh6lAnrt6IC82Mh+e5tpkrspSvLYMTXdbKRzmD9a97l0+a
 IkjfINX1kd9KSprU0Hf9ol7DyGsaTOdIF5DBqA33xqilrMuU9oAOK7nQoL+nJmW0jT/fcvkTn
 W9nexSjNSq6gD48VOj7Bjegic8F4rNdCTnOND3UaHgLfZWdBVTCTsLele4ytTM8C6GRSRj0X7
 NkaI4ZQ5CDU3nKx1YvN/JWLXEQoi2Zx6WAAFIW2Qwne82YNICYQSs4gHKHTRcy9z9NrIECg2w
 MNMbrKf7+IlukL3GblldNfGnHfRgWDsLdz2SCddQuQEaD/tpFs=
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 3:42 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2020-04-29 5:20 a.m., Arnd Bergmann wrote:
> > Older compilers warn about initializers with incorrect curly
> > braces:
> >
> > drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
> > drivers/gpu/drm/drm_dp_mst_topology.c:5497:9: error: missing braces around initializer [-Werror=missing-braces]
> >    struct drm_dp_desc desc = { 0 };
> >           ^
> >
> > Change all instances in the amd gpu driver to using the GNU empty
> > initializer extension.
>
> These should actually be memset - instead of GCC complaining, it'll be
> clang instead.

I'm not sure what you mean, clang certainly supports most GNU extensions,
and this one is used all over the kernel.

There is a good reason for using memset instead of ={}, e.g. when you want
to be sure that all padding fields get initialized before copying
stack variables
to user space, but I find it a little harder to read.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
