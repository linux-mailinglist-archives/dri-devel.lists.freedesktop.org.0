Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824FF402509
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4095289450;
	Tue,  7 Sep 2021 08:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 07 Sep 2021 08:22:58 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB1089364
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:22:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4ahC-1mLsPB2GJy-001gSX for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep
 2021 10:17:51 +0200
Received: by mail-wr1-f47.google.com with SMTP id n5so13118784wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:17:48 -0700 (PDT)
X-Gm-Message-State: AOAM5305vfVa9iAINDsPT5tiHKy+a8GsptIHsHc+DWntoLHtSiNrh0Fl
 k2tW6O2apI8hTLk7kA82v+L8My6UzhtHenocOIY=
X-Google-Smtp-Source: ABdhPJyiTwB42Ik9Nd62RhRczNyAg0nbb/ltMSwY4nNsSbCmZOvOZpJebJwSFy4ShYpdcFJayx1+05VvpIVcJPUKXQE=
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr17191037wrv.71.1631002668640; 
 Tue, 07 Sep 2021 01:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210906194917.376116-1-palmer@dabbelt.com>
 <CAMuHMdUtg1qA7hx-QGGwd6nfe_vDEzoH95732T736FPH0Jb5dA@mail.gmail.com>
In-Reply-To: <CAMuHMdUtg1qA7hx-QGGwd6nfe_vDEzoH95732T736FPH0Jb5dA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Sep 2021 10:17:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2R=GhAjBNjKk7hs6E7Fr6j3yAbSvf29+TdiZtpsSgisQ@mail.gmail.com>
Message-ID: <CAK8P3a2R=GhAjBNjKk7hs6E7Fr6j3yAbSvf29+TdiZtpsSgisQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume
 unused warning
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:S7xGS3vop3VOyDCJHkpVOZATuizXEPph5V8cVhiuW0tVQF69MxY
 WIbO0T0V0vvzZw3kcck3ElcUl8xW82wbWerqIwjwCTZIqovPAuNUikcpSoxNjc4Iot7Fpzi
 dBzE+kbZ849MfgvSfzbse7qKu6DWvwtAm31X58nTU9npPvR9ravO76l8cVJkMPi4czJKqG0
 aWqriJ8UBNqec9QRi16bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jpBbWNxphck=:QMmg4Vs36Toxp9T9oMzCs/
 IWBpo/zLQFvAnoTj9KorX2kZSoQBJzl4BBlr2GSBsQdf+gja/ujter01z2flq1PRobx9RJG0/
 D0DXGqflv3q7G7Vi5uAk3V5WR9wxAzOA32A582bQvmoVcVJ8b+Ks/VToxOzty1iauvczjJxXQ
 iTnOovuhmJMfIEAbZJoFjPcDIGgj5+EjPTySPcZlTzYTtlnomiQeWNDw7hTeNk06/sCsBTX8b
 UH9sxitJ57bIGdM/I7vYv2ztHrWpv7INK6SZaaGRjNaeeRaurnZejIvhlZxfOfEXhQkKPf4pr
 jOEN//q3TYto7+LCQGqojqDcdPD3esPsvfUM4/AqFC6+Dk2XDhwl84x+33xHqX2/wGmnPEKOC
 SjZTBy8NRkicBShLfNlb8gaCY8uPQGH+WSuVbylBXJ67uUU4S+0gTeCzQwL6GxujtEFi2sHms
 v4VlouSAnYd8O5OiIVFzcYzURexBrbc0NUdiVtHOXmyNUAwbpAmLJnPr3/B/GWSU2gBVLQToo
 HFxoDMkUaMD79yebnprGAdHRL+oPPPGawTawkwzF7P2U9K6Juzvfn9Ikhwc0ZvGc9RqyJ85MC
 Dr3dJ4gRtfhk67uhN6zM9L5wg+QovoJn3aP1ba80MM+zlBNbeCXN1o3h+qYQ8hxEEkT3DXKwR
 RjpqT6LzU8a38FOFkZqJknSbC4K6ksIycWld2mtWCkzZCZ0iKMlcOt5TF3/g8GE+oPTm21VJA
 ACA2PGq5xWBZXc38SdI739yYpqJSP/f1lDtXjIGnW4odW+JrH7e6LZFDvWUPO+GoRIJVgXivb
 aSRydZ9NeFeA56cm4Qc4YrKzHLdvD69Xq19QmtX2pvoV+rP5dAqJyaycyrICCrIL21VI2lze+
 eP5bxB2JNZRf9Fc3YQtg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 7, 2021 at 9:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Sep 6, 2021 at 9:58 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > From: Palmer Dabbelt <palmerdabbelt@google.com>

> >
> > +#ifdef CONFIG_PM_SLEEP
> >  static int cdn_dp_resume(struct device *dev)
>
> An alternative solution would be to tag the function with
> __maybe_unused.

Right. In this case, both are correct, but generally speaking I tend to use the
__maybe_unused variant because it's more reliable at fixing the warning for
good when there are additional functions called by the suspend/resume
helpers that now become unused in some configurations, or when you pick
the wrong set of #ifdefs.

Having fewer #ifdef checks also helps with build coverage testing when there
is a warning inside of an #ifdef.

       Arnd
