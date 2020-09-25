Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4782785E5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 13:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC73F6EC94;
	Fri, 25 Sep 2020 11:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DFE6E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 11:32:10 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M6lUk-1kNPa21Vi2-008IoJ for <dri-devel@lists.freedesktop.org>; Fri, 25
 Sep 2020 13:32:08 +0200
Received: by mail-qk1-f170.google.com with SMTP id n133so2343317qkn.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 04:32:08 -0700 (PDT)
X-Gm-Message-State: AOAM53267qRT/eRRmgQhQppaDZUCTpXViE9zBIQt2dCeTm/6EYGd7saG
 5OHVR0buZMXHHwIcIqFcYwK2D0iPlg1T6HeUdk4=
X-Google-Smtp-Source: ABdhPJx6ewrlWaRTSHIqlQrw+rKO7nXCIyzMa6HgJMLyR6GVXtL8m3RFlHN9L9HcuFDN5VDSQuUZf+KvXWM6om9D0g0=
X-Received: by 2002:ae9:c30d:: with SMTP id n13mr3632853qkg.138.1601033527016; 
 Fri, 25 Sep 2020 04:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200918100812.1447443-1-arnd@arndb.de>
 <20200918124808.GD438822@phenom.ffwll.local>
 <20200924205436.GP1223313@ravnborg.org>
In-Reply-To: <20200924205436.GP1223313@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Sep 2020 13:31:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1P=oY9XexnXjk6F_wcbm8OnZ=70rXPTRED+Z6LjU9_QA@mail.gmail.com>
Message-ID: <CAK8P3a1P=oY9XexnXjk6F_wcbm8OnZ=70rXPTRED+Z6LjU9_QA@mail.gmail.com>
Subject: Re: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:jlIVzruGrWk4oACOblLU4MXLGJGhKVvIuh2qb8AxJM9GHnmXGDL
 5yYAtpa0H8gccDiSaXLphj+cIqrsppt4fJfUXnX2X1/FzaxmpMB9LiZwF38i6x8+ARNC+ss
 /X/RXz87vFV157cEgRlsXPZ/2nOS/2gq1L+C16cLcUqY53I4etk8g6haaIE01UFHngWaSo2
 ptDbJDd5ldnf8O14Peatg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k68rmcWPITM=:Er3mWm52p3WBa6DBTevNae
 ZmIZVzv0yBuFM5n/ScPK1x5kGK6zQEHXw1na+F6wXfANyvTVQX3Bros+co4g/SVAEh+Kc+kKR
 uBt54RF6hA42qlMUsmGdRpAE6V566zdDi+ceecsxrS3PNjKOL2nX/zb1U0l6HQbOuDDBXF7Bq
 KnKIFFfFKjM8+gcs4X6ehKgNypH9OT5sFtwbaByBXo60aYMRS9QH0wxQgjjXj9+BcYHZw0JLk
 h7OJDgybD3pRH2/XVHyWFRxu9iSHZQLFlJZNwRIJqQr4Qt2rMqurv49Ya1WjqJzekZ858+2is
 Pv7rplyQIJFDfC+9tb0fRn7uo0y0i868xCCTJlVXWRv3SETbqtXm2x2pK8oEYWgwBqrh5sU1f
 QGAnAc/2ItmUymLYpm4hBtgxYWV8lx4Zo0p4HK1+0Jj8zp5kGS9IBx87u6+9/oDhHrJtao0Mq
 GKct/EjpW5OMkjNsVke7j0bdZN/fjQ0m+5f46avtZsa9tsZZbnXy8FHk7MKfHrFAZAiZOP7uc
 2nLurHbDsDNsCcIRtZB+fcmGBImoi92bsTTmw8/Tw65qPPvDbysgeGjczz2VnPkZmFoKPxH++
 4EU4qaAtI2c6glF0RetrQ5mb0Jqfd1i9a2YbB6ATdIHBDHf9vNH/iexyPaQExebd19H0e8fc6
 By2DY21fMa5Hdkm14MBD3SL5gdWxfCTnqj3cgVsuZom6Jpbp2KgyUwpMHYsJWeEMb7qre2BTr
 hf2dBIogcvb9/otgaWiwJSs/AOCm+dVuxBg2o6L7QhkVZ7ES/HRB24jB4wXTQCYz0IEj37iwt
 nIC+QmbpKsTyfDyj5kBXtqTH/xAHYkhJtzmQER5EtbjepZ4hjWdTc7S8jzNKe1AyuZJ0FVVKi
 +7uRgVOXA0sligEQ4ebJ1Q0+aXLka2JusXxlIVJ5x0H5ZkhN2INZua1w0lBznvxBe1poelE4+
 SKrLDrEkidnHErz5LRAFW8kn/uwsSDX4fm/YthcKmh2aeghHXI6Lo
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "David S . Miller" <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 10:54 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel/Arnd.
>
> On Fri, Sep 18, 2020 at 02:48:08PM +0200, Daniel Vetter wrote:
> > On Fri, Sep 18, 2020 at 12:08:10PM +0200, Arnd Bergmann wrote:
> > > The fbdev code uses compat_alloc_user_space in a few of its
> > > compat_ioctl handlers, which tends to be a bit more complicated
> > > and error-prone than calling the underlying handlers directly,
> > > so I would like to remove it completely.
> > >
> > > This modifies two such functions in fbdev, and removes another
> > > one that is completely unused.
> > >
> > >     Arnd
> > >
> > > Arnd Bergmann (3):
> > >   fbdev: simplify fb_getput_cmap()
> > >   fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
> > >   fbdev: sbuslib: remove compat_alloc_user_space usage
> >
> > Looks all good, but we're also kinda looking for a new volunteer for
> > handling fbdev patches ... drm-misc commit rights, still not interested?
>
> Hi Daniel - I read the above as an a-b. And Arnd did not take the bait
> it seems.

Ah right, I meant to reply but then forgot about it.

I don't really want commit access, thanks for the offer.

> Hi Arnd. checkpatch complained about some whitespace, which I fixed
> while applying.
> Will push to drm-misc-next tomorrow unless I hear anything else.

Great, thanks!

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
