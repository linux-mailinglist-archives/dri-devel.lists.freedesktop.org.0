Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45F22B7CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 22:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DDF6E858;
	Thu, 23 Jul 2020 20:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F246E858
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595536275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=40t+4qcg6UR1VcXiSRsIIDp9z0DXZ4q6WAM4TN0/6lk=;
 b=ZRwk4UvtznB/VIKUVE2Xs4D/3hxLVykpOUb/AP4MFsNBUJA8Jm6xI6LX/f2U6qAt6tZGwp
 C2bSDNvn6DaXqlCcwS4UMYBYk7MtwFR739JdmURogWSfOJPmpIaAbMjdkP4fvyS4xnE4hS
 Izwk9khznpBlkaPkqiQBMq/EzzYhNwM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-KOT1PfMXPgGr0HHxP2_33g-1; Thu, 23 Jul 2020 16:31:10 -0400
X-MC-Unique: KOT1PfMXPgGr0HHxP2_33g-1
Received: by mail-qv1-f71.google.com with SMTP id e6so4399415qva.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 13:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40t+4qcg6UR1VcXiSRsIIDp9z0DXZ4q6WAM4TN0/6lk=;
 b=Vx2VrN0dFZ2q8q8NwZJiT74v35HxNDDosjQJsR24Edx/Qk+jD808RD+QFYD2pKPQ9L
 RcohS1PGn6VDgekiFSsgBycxGPCdCO+lHV7jER4YyLfTLsXmSWNouqj4IkeFXJUwMwFS
 YbUiI9cng7Xl6WE29Co9hidDPQBKx8sZyS+iHiDaCXqOdZFKSJ0uava3PogyMKBGUnKt
 jwnve51yAE3w7IaqlXoVIJJtFz4yQ9QVE5WDDEn0il+9c38dmF7vQhxVnXKx2+b/lEcu
 qHnNWAZkJwYIU2pydTRpdpPjne29scPLdExS3t+3qd0fkQIlvUIg+trWEAcceddkh84v
 /+fQ==
X-Gm-Message-State: AOAM532Egbmi1Irw+zOIhvDjxTfb59cPeFAFCIkBxNtTFKr4mv1fQhQH
 DRj+/kgEy8Ei4Nkl74BMxTl+dpDLtgvYrH9V5s832pcJHxdJkdZ9/ieEHzCW9uqW5fHJL8OLSPq
 EPX19uuxfi+RT/+CEi5eFhIi8TJvGeldVz1evf6wNndSr
X-Received: by 2002:a37:5c04:: with SMTP id q4mr7263417qkb.192.1595536270055; 
 Thu, 23 Jul 2020 13:31:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaz+FKwj1+Qpe9+JR57Hg1bCOgF5rhbZUwIe/feWxQzxhiCYW2p0q4YNTbBH3ZcWu7BRmV4VUvG7uvN9PukuM=
X-Received: by 2002:a37:5c04:: with SMTP id q4mr7263386qkb.192.1595536269773; 
 Thu, 23 Jul 2020 13:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
 <d3253a47-09ff-8bc7-3ca1-a80bdc09d1c2@gmail.com>
 <20200722092507.GC5180@lahna.fi.intel.com>
In-Reply-To: <20200722092507.GC5180@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 23 Jul 2020 22:30:58 +0200
Message-ID: <CACO55tsv63VP93F7xJ3nfZ7SkOk0c6WkgvuP+8fY14gypmn4Fg@mail.gmail.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 11:25 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2020 at 01:37:12PM -0500, Patrick Volkerding wrote:
> > On 7/21/20 10:27 AM, Mika Westerberg wrote:
> > > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > >> Sure thing. Also, feel free to let me know if you'd like access to one of the
> > >> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> > >> locally at my apartment and don't mind setting up AMT/KVM/SSH
> > > Probably no need for remote access (thanks for the offer, though). I
> > > attached a test patch to the bug report:
> > >
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> > >
> > > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > > anyone would have time to try it out.
> >
> >
> > Hi Mika,
> >
> > I can confirm that this patch applied to 5.4.52 fixes the issue with
> > hybrid graphics on the Thinkpad X1 Extreme gen2.
>
> Great, thanks for testing!
>

yeah, works on the P1G2 as well.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
