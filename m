Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1B226F12
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39C789DA6;
	Mon, 20 Jul 2020 19:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jul 2020 19:32:47 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC54389DA6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:32:47 +0000 (UTC)
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MPaQU-1kBGii1aS2-00MgHU for <dri-devel@lists.freedesktop.org>; Mon, 20
 Jul 2020 21:27:42 +0200
Received: by mail-qv1-f45.google.com with SMTP id u8so8083030qvj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 12:27:42 -0700 (PDT)
X-Gm-Message-State: AOAM533tMMtZDh3XPINXFNDjLHE0vIE0y+y1A2ffFn9PYGn2fx8/tNGr
 GxAp/RyPOs3og1lvpSjF87RCWvI+Eioyw/GldNM=
X-Google-Smtp-Source: ABdhPJz4/GVi095uNagL1zwS7AisRzIt6vFPRcHiAqGZBWpvnfFu77t7jzve1fhi4YSFXXrmPSs1LFCvIBKpCGPSz7M=
X-Received: by 2002:ad4:4c09:: with SMTP id bz9mr21965168qvb.210.1595273261190; 
 Mon, 20 Jul 2020 12:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200720191845.20115-1-trix@redhat.com>
In-Reply-To: <20200720191845.20115-1-trix@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jul 2020 21:27:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a15yTNgDrLWB4mhTJfjLjxjexbGg4Har4S1Q9uUfCBgFw@mail.gmail.com>
Message-ID: <CAK8P3a15yTNgDrLWB4mhTJfjLjxjexbGg4Har4S1Q9uUfCBgFw@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: pvr2fb: initialize variables
To: trix@redhat.com
X-Provags-ID: V03:K1:OB/SsfxHaAFRHoD2pmkyGRCmLks+cNwnMVPWAdjt0o3rroIh+JM
 O67qm4cVTE19ssm9YFXZLOyCovQAQpIvtKMHZKvqlqjq2VUzztdTNlCnLEW8DI2XEKeLvZd
 yzQWbbvFFLf+2bRqugYB+PEzvlJxDJIv7ioeHjZamXzO/EToaOG27HJecVTH51mKJWxAo1J
 eGwrJUppCEIKqVvi4uamA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S+RLFtfQobg=:KjnCGhxfRJtrstF3fYvPrC
 XkUx1a7E2rKRmFgYEQHymO9RgBp3lFRFXJ9wCl6N8BPe9GULDkztXViYlQVVlCSJ1hGKnTq/o
 32CAhjeOck8xt7QYTzKBa9hsxYMr9lIYVM4YsaQI8Ay5YK8xoUBzpdYu2IwpmW47gscD1xBhG
 B0q3mIE1ikZn+P2XmKn5N98SJareEiBnKqx8LZopIiSxJ5lydnGdYzFuM346gXN9lHbb/+ZA9
 D8clsS4Fy8I967Abpfy064vmJmssM9PtxG0C6Dd0WcDRlMW43CjZrO4+IhvPEEjB9t6bFf5sq
 Cspd87CnGzqNbxStRLvphMK7tVjmV7ZnLArSNqDWDuK2qvdKQKVEZafTqWS6xp6JvY0DaPMMU
 DQGIdd8iB7eiy4Kj9qR1RKX1BbgS9c63rxiqsVp+hIx+TEafF+rF/IHCt592RmW33N5slFX8n
 zdFysA8k1ssdEw+bBVFZq7bwKxflF7iAMFxOibHVyqzS+RRI+C6kHa3RCbpOSrJHtwSUiRnYK
 hEIafwtLGVRD9hCMK4bmmkWYIhU4+ul2ZIWRRf0AQHeJOWolwkoHw85cKOSH7HdWnrN3t7/vw
 +XPdJtJmcrcEBgz24FUo/nZMEfKUi7qdbZPp49BdNv6qj7ycZtfmkNtnHq+NPf1uHOAL8SkSV
 j4REf8Km4n+CsRJle31pxB8+uF58CFkPuD+2Nkz6pJIHOoMndhrgZJTzygxPK/nXhxpAIHWdo
 PCbOFoisossp9Ef8HqQdCgic0j5BlGSyKujdXO2CF1+JSj4Z+o2NEe8L5BH+KRjLW/pwlbeyC
 gO7ojElJac/4Wys10P9qXAh3CPiOw7zE4pbTGxlLhZkKKZm1UyNXasCjie40nouYpg4+GOr
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 John Hubbard <jhubbard@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 9:19 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this repesentative error
>
> pvr2fb.c:1049:2: warning: 1st function call argument
>   is an uninitialized value [core.CallAndMessage]
>         if (*cable_arg)
>         ^~~~~~~~~~~~~~~
>
> Problem is that cable_arg depends on the input loop to
> set the cable_arg[0].  If it does not, then some random
> value from the stack is used.
>
> A similar problem exists for output_arg.
>
> So initialize cable_arg and output_arg.

Adding a zero-initialization is almost never the correct way to
deal with these warnings, so one has to be careful doing this.

I checked this file, and your patch is absolutely correct here. ;-)

> Signed-off-by: Tom Rix <trix@redhat.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
