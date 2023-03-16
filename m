Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE846BC25E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 01:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABC610EBF1;
	Thu, 16 Mar 2023 00:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C753C10EA2D;
 Thu, 16 Mar 2023 00:22:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40F12B81FA2;
 Thu, 16 Mar 2023 00:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D09C433EF;
 Thu, 16 Mar 2023 00:22:43 +0000 (UTC)
Date: Wed, 15 Mar 2023 20:22:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Message-ID: <20230315202242.581c67bf@gandalf.local.home>
In-Reply-To: <20230315202133.7cb1a0fe@gandalf.local.home>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230308074333.49546088@gandalf.local.home>
 <980021d5-09f7-9fc3-2726-44884a57822f@gmail.com>
 <CAM0jSHPf5u4=GGWm6x-zVkLA_LScAxq371ny2NoozuNjHfQefQ@mail.gmail.com>
 <2b7fe203-82f5-2726-cd64-01c7421560d3@amd.com>
 <20230315162011.351d0f71@gandalf.local.home>
 <20230315202133.7cb1a0fe@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.william.auld@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Mar 2023 20:21:33 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 15 Mar 2023 16:20:11 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>=20
> > On Wed, 15 Mar 2023 20:51:49 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> > > Steven please try the attached patch.   =20
> >=20
> > I applied it, but as it's not always reproducible, I'll have to give it
> > several runs before I give you my "tested-by" tag. =20
>=20
> I ran my tests a bunch of times with this applied and it didn't fail once.
> As it got further than it ever did before (it usually took 1 to 3 runs to
> trigger, and I ran it over 10 times).
>=20
> Reported-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>

I hope that this gets in by -rc3, as I want to start basing my next branch
on that tag.

Thanks,

-- Steve

