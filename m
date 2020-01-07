Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80E1335B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7802D6E145;
	Tue,  7 Jan 2020 22:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CE46E145
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:26:53 +0000 (UTC)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1jLZ2b47Ze-00hfHK for <dri-devel@lists.freedesktop.org>; Tue, 07
 Jan 2020 23:26:52 +0100
Received: by mail-qk1-f173.google.com with SMTP id c17so927406qkg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 14:26:51 -0800 (PST)
X-Gm-Message-State: APjAAAVPshdyxX6p2DZWvU+7wSN02noK2wJ2aX3y54cLApMoTzYaCfEr
 KPaLfhyyqjbGAxazi8b0wIAU7K8Z+dlfKO6l0gk=
X-Google-Smtp-Source: APXvYqwG1LARCdNIKMhTJaBhIBGBLfcCf2DMbWm1oGmzF4texL29S6PXyRbn/Bq49xuTuLPfyx5ZUFoZ7cDXliTBdLk=
X-Received: by 2002:a37:84a:: with SMTP id 71mr1543490qki.138.1578436010905;
 Tue, 07 Jan 2020 14:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20200107212747.4182515-1-arnd@arndb.de>
 <20200107220019.GC7869@pendragon.ideasonboard.com>
 <CAK8P3a1Gt10_OLF1dXiNBxcO-seJfutcPu3w_dsHKNsDN4r7-A@mail.gmail.com>
 <20200107221222.GE7869@pendragon.ideasonboard.com>
In-Reply-To: <20200107221222.GE7869@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 23:26:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ny0UhOpvVNE3x6gE=3SG7h_sBvtR7L7Hj2XsjrkavAA@mail.gmail.com>
Message-ID: <CAK8P3a0ny0UhOpvVNE3x6gE=3SG7h_sBvtR7L7Hj2XsjrkavAA@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Provags-ID: V03:K1:t26IEbyLxhFY09WssFFK2bP2tTWXxAmQG0+yeeCasTqGnxscpv0
 ePypQ7wYYoOe24//up8gONS/jph51/S3Qf48CKSGAuCnGvw1IrhREu7llp7yK0zEucZN/z0
 WCJvhgjZMMy7a8/gm4QA2Hs1R3UltuEbMljKcWFWfbJxrOeCuWdMlerwJb7E2qcIFVFwk4e
 ysSUU3GtItUdetixFwN/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gGKcvoUkSoM=:dUW2oh4J09iDei/UQRfgEk
 Pw/Ji8wnd7qfTBsww/LSQXjgNdcWCCDt5/WgHWjrBSW2i6Lq6p3l6pYNzjGVztobpiGvn55k4
 h1qKs5b9m7YBEeFCF6DG01I3CqSMLIEkQS9Ccgl/HZhkIhF8mFPYa1VoWBfvGH3tMMahw+OXn
 zneM8fk6IIhVeqVGew+MVmC1yCTCH396gO4nfdG+2KweqTsVKvCU59y67oJHhKyb1iSYrEIcA
 DtUiXed7bbKIxe0sMmrShqPdwxf+PBmiQc/V7QjB8xRr8d1t57SdNH0cszIjMtOkFAWQGNBrQ
 v5f4/8o95WNuFwT3nH0CniUau57Kn5m6Qv9VPHV5+G1A40wvVlRSs7Vypdmy37+rHi9vAkHTO
 ExEvRnq1yC/s7PT1Abya+2BsDx6m2m1/D5tPHYSEzZgYNDhLQk2tNZX7RVlQjeHzqijAYbLCg
 yDdWc4SPedtvAuAiRV+GqASGzgGN6MFAYxjNAsibEUgyz8oxRwK682m00phV3y5MNWA4K+aIe
 E0Z9zDwi3UfVcVY9Vj/BMxYDUyeY/Nizicu50Tq/nj11JfqWKNRvw8/H3F9vxN4jJqzd13fKy
 fgN/1os2h+GXTuvrwSgzYzLumpnTKZttKzlYkRvx0BfLp8SxLRuqy0SyQT8qnCy9XBjwQFakr
 eA+ndXsN6KwofcxachmP2exQixwt0/XccmIMVgV6cTJ80MOukAQtwTHWaOaGJT+GMBczDSeO9
 TC0W5hd2WF+gbJPEGy2SYjVTXXlZTsFNPARuL1M0iA8EjbHKrNCeUCWPWhIZdOFUr5O2aSDJC
 e/dF31nzMiOkEwsb+4XhaXYOArrGp9bTTO9ZqXXMS4irNeCk9ImVVZuKmeWIT4bLJZhOejBWr
 79zAmdEkZ2OvvDYXI8MA==
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 7, 2020 at 11:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Jan 07, 2020 at 11:09:13PM +0100, Arnd Bergmann wrote:
> > On Tue, Jan 7, 2020 at 11:00 PM Laurent Pinchart wrote:

> > > Isn't this something that should be fixed at the compiler level ?
> >
> > I suspect but have not verified that structleak gcc plugin is partly at
> > fault here as well, it has caused similar problems elsewhere.

I checked that now, and it's indeed the structleak plugin.

Interestingly the problem goes away without the -fconserve-stack
option, which is meant to reduce the stack usage bug has the
opposite effect here (!).

I'll do some more tests tomorrow.

> > If you like I can try to dig deeper before that patch gets merged,
> > and explain more in the changelog or open a gcc bug if necessary.
>
> I think we'll need to merge this in the meantime, but if gcc is able to
> detect too large frame sizes, I think it should have the ability to take
> a frame size limit into account when optimizing. I haven't checked if
> this is already possible and just not honoured here (possibly due to a
> bug) or if the feature is entirely missing. In any case we'll likely
> have to live with this compiler issue for quite some time.

When talking to gcc developers about other files that use excessive
amounts of stack space, it was pointed out to me that this is a
fundamentally hard problem to solve in general: what usually happens
is that one optimization step uses a heuristic for inlining, but the
register allocator much later runs out of registers and spills them to
the stack at a point when it's too late to undo the earlier optimizations.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
