Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A032C1E5B78
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 11:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723A16E0F8;
	Thu, 28 May 2020 09:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D336E0F8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 09:09:32 +0000 (UTC)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MGhds-1jqpTM4Bfu-00Do1Y; Thu, 28 May 2020 11:09:31 +0200
Received: by mail-qt1-f169.google.com with SMTP id j32so6687511qte.10;
 Thu, 28 May 2020 02:09:29 -0700 (PDT)
X-Gm-Message-State: AOAM531ZckDf+1kJ/gxkWCd2TbySgD1KgU8746k9/qwuKp2dSFw6u495
 +rBBFiqHpW7c+bqtM9renkzbODeqTnOH1G/ZiH8=
X-Google-Smtp-Source: ABdhPJw0lPr/TwhrVNC3iy5YtxH6Hjy8bzmX2rAe1KGmP7eYz/oL6ngiwKPu38ETWEqiMphjY7bZ3Eseev3rSciH8pY=
X-Received: by 2002:ac8:6a09:: with SMTP id t9mr2005129qtr.7.1590656968528;
 Thu, 28 May 2020 02:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134254.854672-1-arnd@arndb.de>
 <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
 <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
 <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
In-Reply-To: <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 May 2020 11:09:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3wuK9hHWCypF0HEzWY_iSn1SQJ22j26ykXYeVYYqKpCg@mail.gmail.com>
Message-ID: <CAK8P3a3wuK9hHWCypF0HEzWY_iSn1SQJ22j26ykXYeVYYqKpCg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
To: Dave Airlie <airlied@gmail.com>
X-Provags-ID: V03:K1:+m3ukmoA1ks/niOL9hBvbGQ8a1cq/CDwTe+9K4T9isRbNoC9Nnn
 i0dqCCiverb0ay5guh+7xAc+JPFc3i3OHyBO/pG1Hb4t3YuHAC8hu6knV9gqL6irC957St2
 Fxk5tY24hlWYJys6kyXJxTI5Ci95Hog1DR6CjScN/Tff2O+KPK/0uozYdvc3bHGIEm7WP8p
 d1Ph0cuTZEarP2cuVpHeg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C8bldEvzp0Y=:ln1mGADWnb4CxUIUhBSIIB
 LZHmR/nWtSf4nNwXq1QTCyRDBlDn9xTUGHeWIdGTmZr7niclwdR9zUjXR0P5DPou9EPNRWRqt
 mjjfl2Eguv9OxQtI04HIrrdJP2onZfuY8BLe73XwxsroDfsRUQIHtaxx95stZaZnKsANkPii/
 ImbbXtiePqEUtowEQMC9ntk4k0deUjJVqLazjyRsPOOtA1YSC9fpJMls4WuwyqSJwzEfBWpI1
 R1b6GtseEdjtZAX8NVpgBu+3XLKW2mIYgVeChIUeDEjz2h7O2SpU0r7zK4xLq1r3f/shXPssk
 BDXI403+CuSDPpuYGrMIsH9LmIqhB9gkgva9K+da6pYYsc27f5cNps6BoWbmLDUS2NRVniM6e
 y10uO3G5xyAfiBXiiNm7ggH2t0zN51/Dak1nf5J2plH2tQXFBZgOOFqBGMyHP3SShs+tWGRQp
 V4XFmePP6lWcXOHCBScJKunALzcjHNsEt8JgawVm9gOy2/GBc+SQJ97I/azv0RpzIzmqB+EhF
 So633hGuHTulJgLN11uL1P2Hg6ykvNTley3UhReTorONgaEyMPGhZuRK7+wxLN3l8sYMLvepV
 I/BIZ178MKVU+5QH31wrCQOKFuH37yPQ9Io8QeCgDndeO+XPWyB5cSBl9FnMZt1cW0AtWCDQu
 osu8K3QmmOSWYhwcw+4kq2IMI/9YSz9pzBEIzrWaulKOKCRpve9RS3bhlwvU6wWSGB85VNDRk
 /HHmQh0uWHxsU2y/JNWcigv1rX5sutcwZYSeMXeVf3sT1XVf+6jEFw0ndruhVBdttMq+N+s7o
 EEG8eKVS82n0t3p7pwuwy5eqWuxiDmJJ0P0hbqrtaIh/zsJo0M=
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 7:37 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 28 May 2020 at 00:36, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > Isn't this already fixed by
> > >
> > > https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403
> >
> > Ok, I see that fixes the link error, but I when I created my fix, that did
> > not seem like the correct solution because it reverts part of the original
> > patch without reverting the rest of it. Unfortunately there was no
> > changelog text in the first patch to explain why this is safe.
>
> No it doesn't, I think you missed the pci in API name.
>
> The initial behaviour doesn't use the pci version of the API, the
> replacement did, and the fix used the drm wrapper around the pci one.
>
> So this patch isn't necessary now that I've fixed it the other way,

Ok, got it, thanks for explaining!

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
