Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C3119879
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3B6E9A7;
	Tue, 10 Dec 2019 21:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069DB6E9A7;
 Tue, 10 Dec 2019 21:40:17 +0000 (UTC)
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N3sye-1hfRA015aS-00zn9q; Tue, 10 Dec 2019 22:40:16 +0100
Received: by mail-qk1-f176.google.com with SMTP id k6so17835183qki.5;
 Tue, 10 Dec 2019 13:40:16 -0800 (PST)
X-Gm-Message-State: APjAAAUh2WCW4Wjdj/9StJkjt6bHjOKK7s8gNd28NRFDiPTI+zwQkySy
 ohBM8hQVgSU2Z1TOsPW620bzwNTjvh1hmxQNwQs=
X-Google-Smtp-Source: APXvYqxUoC6H/HWZMBtDiTF2+IJfRax40MKZBHGh8CU2NKudSB89mZzzFUDhBYEjsX0QO0qaYD1duiXIHE3h8N56nz0=
X-Received: by 2002:a37:4e4e:: with SMTP id c75mr13322344qkb.3.1576014015095; 
 Tue, 10 Dec 2019 13:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20191210203101.2663341-1-arnd@arndb.de>
 <DM6PR12MB34665D3A13E23D8AA7E2E7919E5B0@DM6PR12MB3466.namprd12.prod.outlook.com>
 <b552de20-dca5-b5d1-e5e8-4c09bc3fdcb5@amd.com>
In-Reply-To: <b552de20-dca5-b5d1-e5e8-4c09bc3fdcb5@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Dec 2019 22:39:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2qM2Vi9qH5b+REBWp2tpb96CpxjmeGSbc63XfGwD6ozg@mail.gmail.com>
Message-ID: <CAK8P3a2qM2Vi9qH5b+REBWp2tpb96CpxjmeGSbc63XfGwD6ozg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix undefined struct member reference
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
X-Provags-ID: V03:K1:6onsag38alwAFdwUCrZ1vFjpbq2l6kgueJ2VhyuqKNTaOjWpTy9
 J/8rdrYA+RE8r4dy6ZzbCqNBrMWCqFcOVCOWboNrNJhcVjk3Tr+5I6dQAdDa+jpsjYVByYb
 rHWPgJsbp8JPfEEycHIM4teHmlJcfDdNmOTPyG96eWqVnJOQcvTFeM99fj0i3GrYyydtjpN
 KZxNOxRwJlx9rHBp01Mjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ofGskJrol9Y=:RUBX/Zbkiu8bpN2jABBz3k
 jWzPGJpfIN1B3rF5IyATDXH/4gY5HJvpWBCEb0/Mub7aSDRnZrEEbS4l5d4rQIN/5MAhQu57q
 NL2+9d4tTrxiq6bNmW2teBOENW297Q49W+BW2O+cvtJQaBbqIwi71RbWgEgLljbh5XnWOhxj3
 tIq7JGOtTJeh01dwPvyyr8G+hsFCO5EAmWdYUXNr/ALahTvO8u30VzrTym1EiTlK6gBlX0gp/
 FcC4u7dg2gn+xSOBSrRJMwEaWZKIYEmOR99ll4Lv31CY2ywpfrgR4GC9V0mWAzRgwzPDb1bMr
 h2RfB/KG5Ol0/GYJcgDR65AG9pOeB5mUha1apTIS8buIoHzQtHe5LhioVEX437RhPgFMNEOrq
 jcd+9GTgiyFpTHTkfT1ez04zutFluljdRiVchA2Pe1rIststY6pXsEvz8gUSnUTSSebmffy5Y
 Mx6MB+SlfX+bY7EtKu6pHESVavsWKURtOv+DWMsgRKnZE+IyMBEten62JxnhN9ZyrWtrc9Rn4
 Hc95+2BXhHlzmzWchgB/kSdMYnP0C0kEw7BdezWoh+aW7WYvaudr1+PQ67dn72kDF4Amu2bhb
 oj46tCqZBhAp9UfO0lTGDzHe61xnbzGEv8wKxOOkrVPo9pqWg82l1ESdqVUMY/WXII80N3lxp
 Gfc7mz0nkpSaDvGWtT7oziLpm6BTndbXV5PtKkOfY2oE/e2lv82/KMT4pwdLBA5s2ZwIC5+Xh
 ckfkcXZglEkpNAavPOsh+IESxzf3blKWBPChZ7yb6xZD0MehL3rUF/bMBrEYOawhfhpDsM6MK
 MRVBJYD4s9VAQpxJ+RvrDNb9a0V+n9Iw6E9D5MfKI/ov37EfWu9hT4Gii31ldSKgr/plx1wuh
 K+phlXUU5ntOsnw3nbSg==
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
Cc: "Yang, Eric" <Eric.Yang2@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>,
 "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Liu, Zhan" <Zhan.Liu@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>, David Airlie <airlied@linux.ie>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 9:56 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
> On 2019-12-10 3:54 p.m., Liu, Zhan wrote:

> >>
> >> Fixes: c3d03c5a196f ("drm/amd/display: Include num_vmid and num_dsc
> >> within NV14's resource caps")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thank you for catching that On my side I kept that flag enabled all the time, so I didn't realize there was a warning hidden here.
> >
> > Reviewed-by: Zhan Liu <zhan.liu@amd.com>
>
> What tree is this reported on?

This is plain linux-5.5-rc1.

> We dropped this flag whenever building DCN. Sounds like we're missing a
> patch if you're getting this.
>
> So this is a NAK from me for going into amd-staging-drm-next at least.

Fair enough, please revert c3d03c5a196f ("drm/amd/display: Include
num_vmid and num_dsc within NV14's resource caps") for 5.5-rc2 then.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
