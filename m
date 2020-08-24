Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6625130F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB16E878;
	Tue, 25 Aug 2020 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B356E598
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598303487; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEDvPQGA28ui4gkChbVblrhftFg/zkWXqE9+iID1kIo=;
 b=iCjfVXPhWcXAJva525nkOFlCkK56Na49yEBbJ8xxpkA3OywJRvsLn2kC1txFweJzLP7hfl
 JbwTz4mo4AkoLplPLrkCikxWVvinyO1TXjWdwbOwb48d0nuxH+O3+vhN9E/cqfFxhpg6YV
 DhQ6kvKwk1S8LNSG/wNLbLu0JeuLylM=
Date: Mon, 24 Aug 2020 23:11:16 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-Id: <SU6LFQ.ROILRVX1L3XN3@crapouillou.net>
In-Reply-To: <CAAEAJfBO5-T9oG_whDu5=MDcthAJpbJ5ER3eJJx1gXMsHu-v7w@mail.gmail.com>
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason> <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
 <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
 <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
 <CAAEAJfBO5-T9oG_whDu5=MDcthAJpbJ5ER3eJJx1gXMsHu-v7w@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun. 24 ao=FBt 2020 =E0 14:38, Ezequiel Garcia =

<ezequiel@vanguardiasur.com.ar> a =E9crit :
> On Mon, 24 Aug 2020 at 13:05, H. Nikolaus Schaller =

> <hns@goldelico.com> wrote:
>> =

>>  Hi Ezequiel,
>> =

>>  > Am 24.08.2020 um 15:46 schrieb Ezequiel Garcia =

>> <ezequiel@vanguardiasur.com.ar>:
>>  >
>>  > On Fri, 21 Aug 2020 at 19:24, Paul Cercueil =

>> <paul@crapouillou.net> wrote:
>>  >>
>>  >>
>>  >>
>>  >> Le sam. 22 ao=FBt 2020 =E0 0:11, Paul Boddie <paul@boddie.org.uk> a
>>  >> =E9crit :
>>  >>
>>  >> If you send clean patches, there's no reason for me not to merge =

>> them.
>>  >>
>>  >
>>  > I'd really like to see HDMI support on my CI20 being merged. =

>> Thank to
>>  > recent ingenic-drm work and thanks for Paul Boddie and Nikolaus =

>> work,
>>  > the patches are IMO quite clean.
>> =

>>  I have done some testing and it appears that it only works if DRM is
>>  compiled into the kernel. At least in my setup. If DRM and/or HDMI =

>> are made
>>  modules there is no video or code doesn't compile completely.
>> =

>>  We have to analyse that further.
>> =

> =

> Ah! That's true.
> =

> The fix is just re-organizing the code a bit. Just pushed a possible
> fix for that (following the IPU handling by Paul Cercueil),
> please feel free to test this:
> =

> https://gitlab.collabora.com/linux/0day/-/commits/jz4780-drm-hdmi-module-=
fix-v5.9-rc2
> =

> FWIW, my test setup uses mainline vanilla U-Boot v2020.07.
> The kernel is loaded via TFTP. Debian mipsel is mounted via NFS
> (which means dm9000 works). I'm testing with weston and modetest.
> =

> Note that enabling DRM_INGENIC_IPU will make the driver
> fail to load, as the IPU is not optional (and not present on =

> ci20.dts).
> A minor thing to fix.

Actually that's a bug, the IPU should be optional. I'll come up with a =

fix.

>>  And it seems to differ significantly from what Paul has developed =

>> recently
>>  to make it work. It seems to be quite lucky that we have a working =

>> setup now :)
>> =

>>  > Nikolaus, Paul: Do you have plans to submit these?
>> =

>>  Yes, as soon as we are sure that it works (and when it doesn't).
>> =

>>  But thanks to your work it is now much easier to improve things, =

>> since we
>>  are no longer looking for a break-through but just have to avoid =

>> regressions.
>> =

>>  > If not, I'll be happy to get them out the door for review.
>> =

>>  Let it mature a little first and have it tested on more setups and =

>> rebased
>>  to mainline v5.9-rc2 :)
>> =


DRM drivers follow their own schedule, you should rebase to =

drm-misc-next instead.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
