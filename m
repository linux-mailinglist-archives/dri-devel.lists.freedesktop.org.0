Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE83322E2F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 17:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434CE6E9DE;
	Tue, 23 Feb 2021 16:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 580 seconds by postgrey-1.36 at gabe;
 Tue, 23 Feb 2021 16:01:22 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEFD6E9DE;
 Tue, 23 Feb 2021 16:01:22 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M89P1-1lATVT1OiJ-005M5W; Tue, 23 Feb 2021 16:51:28 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 3A6551E01E7;
 Tue, 23 Feb 2021 15:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnEpDMyau6jA; Tue, 23 Feb 2021 16:51:26 +0100 (CET)
Received: from pflmari.corp.cetitec.com (2-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.2])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id E826D1E01E6;
 Tue, 23 Feb 2021 16:51:26 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Tue, 23 Feb 2021 16:51:26 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDUkfjDA4xLJlxE5@pflmari>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
X-Provags-ID: V03:K1:TZGccT2syXDhApLxVFzVDJq5wKOtDGq/dl3aJQEA5t+BCVA3L2q
 V2lhNWDapJfSve9PZ5g8vpBtD2MQCXpv4W0PVMnTyWJdp+BAqHPypSdzeLnJYlzv9EmFZC+
 +D2ZnMjL5Xr4bJYsf5D69SAm/mbjuwsuOsuWdiJQDmhgdDu0O08nB4SHW3ORqAliTh1oPrC
 5KbbtmIVlyk6JiDnl/AAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:reKDNF92mpg=:HzSCcAp1LpNOOjLHI71DVs
 PCsb+x8Qmjf11jh6L9oODUC1NWq5xsI79fGt7k5skFEHtNmwDVxMuZonkgFKBMyor9UUR1Opr
 GAy5KXwyMa2zCu1QoirClLwd9beo/Tk4oOywgHxVeBtwSzpaIdaoaZa2XkIzZ/80WqCVJ5win
 fk7YNqiQFODA9O0XLx582G2AVAMmuE0Rl1R0t5ZQd7JMvhJtZaGYC1TQYrudhvbrFypbkwec7
 yXDEmjJQgXu8il1jU4baQ7Efi44vtGvz7wU6bfiWji6BUke3jpAxAjY9Jn+IaR5xzb8G5zE+f
 ybF1WdV9qs+Od7VxauYaOFMPMyEyzRoLHhxS61p3mwkzwbChABlT69iEUbjnF0uIx1Jb8i13q
 42l+cyQ7RW65lTW0rHn9b5PH/OeO0bJbuG1FjJYP6UnUYqdfrtFl5yKAU7rNBJoc8DSZ86p7/
 tOcbLReaRQ==
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ilia Mirkin, Tue, Feb 23, 2021 16:46:52 +0100:
> On Tue, Feb 23, 2021 at 10:36 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Ilia Mirkin, Tue, Feb 23, 2021 15:56:21 +0100:
> > > On Tue, Feb 23, 2021 at 9:26 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > >
> > > > This change broke X cursor in my setup, and reverting the commit restores it.
> > > >
> > > > Dell Precision M4800, issue ~2014 with GK106GLM [Quadro K2100M] (rev a1).
> > > > libdrm 2.4.91-1 (Debian 10.8 stable).
> > > > There are no errors or warnings in Xorg logs nor in the kernel log.
> > >
> > > Could you confirm which ddx is driving the nvidia hw? You can find
> > > this out by running "xrandr --listproviders", or also in the xorg log.
> >
> > xrandr(1) does not seem to list much:
> >
> > $ xrandr --listproviders
> > Providers: number : 1
> > Provider 0: id: 0x48 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 4 outputs: 5 associated providers: 0 name:modesetting
> 
> Thanks - this is what I was looking for. name:modesetting, i.e. the
> modesetting ddx driver.
> 
> I checked nouveau source, and it seems like it uses a 64x64 cursor no
> matter what. Not sure what the modesetting ddx does.
> 
> I'd recommend using xf86-video-nouveau in any case, but some distros

I would like try this out. Do you know how to force the xorg server to
choose this driver instead of modesetting?

> have decided to explicitly force modesetting in preference of nouveau.
> Oh well. (And regardless, the regression should be addressed somehow,
> but it's also good to understand what the problem is.)
>
> Can you confirm what the problem with the cursor is?

The cursor looks stretched vertically over a bigger matrix, while missing some
lines and being wrapped over the bottom on top of that matrix.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
