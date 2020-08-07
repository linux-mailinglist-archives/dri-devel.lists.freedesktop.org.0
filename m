Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8823EC7E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 13:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8262B6E108;
	Fri,  7 Aug 2020 11:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13F6E108
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 11:29:20 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E71C72075D;
 Fri,  7 Aug 2020 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596799760;
 bh=2JO2qwpAelZwwN528SuEDP5/1BeDcXQDZwzFngk84Mg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WnRYJ+GaYJUsUT1XcKXM1hxTWAAVWjVPJ9Mz64glMrlMGtb4SFiQTL3VDutmtW+KR
 6YnfVbTEP0Dx3+oJ7Oe7N8ChP9LyKemQ3AwB5VANkYujn3vwqVG0TW7cpB2RrI8b1l
 O703VSR0SYxMqQPuLFR8xKJ0rIhyGUD93qkK7ims=
Date: Fri, 7 Aug 2020 13:29:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
Message-ID: <20200807132916.70772823@coco.lan>
In-Reply-To: <20200807085943.GA966139@ravnborg.org>
References: <20200805105137.2b272efc@coco.lan>
 <CALAqxLV_8phvdvezZV39sumS=D42+cZdfxCrCz6ht6eia8totQ@mail.gmail.com>
 <20200807092418.57843051@coco.lan>
 <20200807085943.GA966139@ravnborg.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 7 Aug 2020 10:59:43 +0200
Sam Ravnborg <sam@ravnborg.org> escreveu:

> Hi Mauro.
> 
> > 
> > I know. What can be done is to send a diff at patch 00/xx with
> > the entire history for each driver folded, in order to easy
> > for reviewers.  
> Personnaly this would be preferred as I assume the history is a lot of
> forth and back rather than incremental logical changes.

Actually, it is not that bad. The changes at the code are incremental. 
I suspect that the initial patch is actually a folded changeset for
the Linaro's 4.9 Kernel tree. The changes afterwards happened inside
the Linaro tree, more or less following the usual one patch per
logical change approach.

On the top of that, there are the changes I did myself, in order to port
it from 4.9. Having those at the history helps a lot, in the case
I made any mistake on such ports.

> No promises of any useful reviews though...

A review on the folded change should be enough. In case of doubts
about something, the detailed changeset could be useful, specially
to help identifying eventual mistakes I could have done during the 
port.

Anyway, my plan is to first get the non-DRM changesets reviewed, as
I may need to modify some things depending on the feedback from
the other subsystems.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
