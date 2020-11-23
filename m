Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3EC2C1F83
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A515F6E21B;
	Tue, 24 Nov 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62E9898E4;
 Mon, 23 Nov 2020 16:17:12 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id i18so18703347ioa.3;
 Mon, 23 Nov 2020 08:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9G9wehhbpTZzWWOvGr3rWAgWQ0geLC9Yp77M/YC6Idw=;
 b=jzsPhOCPkH8JcubkL+ilpCqrpmJxzR/ZZhmza1K1c0eddk7+QY69lMXZ1zjj7yUobv
 UPOat94Oznz5N+aYQtyK2tx44PHGHvaT6c5ydFaOoT5387NjxS4giDE0liSNJKSpvdGp
 HKiV67o8ZfM+QomP6uHJNCHgME5k654Lm9OlI5uZEZV/BZyGXhrMcp4osA9RqzKjR7Ze
 0dIcMPHMz9M6e1KbFfvtyGGjldyt3D137VsBHg9GBRp12UjhpWPsI6mtFPtV54IoaC+K
 mSdXyd8g5UOodS4awURhueIsrAq2XHUWM9vJndBZGt3fLtR88qq6iY1NEsTPrUzb2MVL
 n+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9G9wehhbpTZzWWOvGr3rWAgWQ0geLC9Yp77M/YC6Idw=;
 b=r14VZuPE97rurh1VIJDI5kRsfB1JnpG2JjIg6bj3c2dAN2lsJ5jIz3aFivwEtV4nHd
 t1phpEXwqc3I2qmzBVS6XQMcJfv0Ir4CRavB/TYmnBpJv+btQE2h2MkEPMuOHbOGVBEY
 ods8ssB/IYXXyn9l4vWSnJ3HxkFSxk9uPumh4U2DPZSSa5NTBhDtd1wpxyd5ViYZJj8O
 2oYOMvyC/zQULH9zFo5t1lEPFJyn3T4+KNxHcyfIKVRTwCukoiXQcTaAmx9SaLtFbELg
 LqKmFqgidmCxYPXnS+CDhLoNjXw6A9rLf/Y/TdHmKnfbMjgcya8ZwatF72+8WfVRWpxU
 O+7g==
X-Gm-Message-State: AOAM532j90eIUBWMIzTN1rM2EoPvP/+MInJFDaOJI8mg1AF2yCVfykkh
 vyrwOJNjEZGSsK/t2r8Go2pb62hKi35GVO9Ca5M=
X-Google-Smtp-Source: ABdhPJw5wxDBX8QpwE2CghMfFtPIAtnmG9XIUqmbpxXD9wxvuYGnavpxLlav0NBfuecvTCMrGKLgN0Lee5ktV7i8vQ8=
X-Received: by 2002:a05:6602:22c7:: with SMTP id
 e7mr415585ioe.114.1606148231969; 
 Mon, 23 Nov 2020 08:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20201121165058.1644182-1-trix@redhat.com>
 <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
 <87y2ism5or.fsf@intel.com>
In-Reply-To: <87y2ism5or.fsf@intel.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 17:17:00 +0100
Message-ID: <CAKXUXMydH+VtMeuftPRgCg_PYm2iChOMkUYjO=QTG=NRM3QFiw@mail.gmail.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 Joe Perches <joe@perches.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 4:52 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> >> A difficult part of automating commits is composing the subsystem
> >> preamble in the commit log.  For the ongoing effort of a fixer
> >> producing
> >> one or two fixes a release the use of 'treewide:' does not seem
> >> appropriate.
> >>
> >> It would be better if the normal prefix was used.  Unfortunately
> >> normal is
> >> not consistent across the tree.
> >>
> >>
> >>      D: Commit subsystem prefix
> >>
> >> ex/ for FPGA DFL DRIVERS
> >>
> >>      D: fpga: dfl:
> >>
> >
> > I've got to bet this is going to cause more issues than it solves.
>
> Agreed.
>

Tom, this a problem only kernel janitors encounter; all other
developers really do not have that issue. The time spent on creating
the patch is much larger than the amount saved if the commit log
header line prefix would be derived automatically. I believe Julia
Lawall, Arnd Bergmann and Nathan Chancellor as long-term
high-frequency janitors do have already scripted approaches to that
issue. Maybe they simply need to share these scripts with you and you
consolidate them and share with everyone?

Also, making clean-up patches cumbersome has a positive side as well;
maintainers are not swamped with fully automated patch submissions.
There have been some bad experiences with some submitters on that in
the past...

> > SCSI uses scsi: <driver>: for drivers but not every driver has a
> > MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> > things, but we're not consistent.  Block uses blk-<something>: for all
> > of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> > the next thing you're going to cause is an explosion of suggested
> > MAINTAINERs entries.
>
> On the one hand, adoption of new MAINTAINERS entries has been really
> slow. Look at B, C, or P, for instance. On the other hand, if this were
> to get adopted, you'll potentially get conflicting prefixes for patches
> touching multiple files. Then what?
>
> I'm guessing a script looking at git log could come up with better
> suggestions for prefixes via popularity contest than manually maintained
> MAINTAINERS entries. It might not always get it right, but then human
> outsiders aren't going to always get it right either.
>
> Now you'll only need Someone(tm) to write the script. ;)
>
> Something quick like this:
>
> git log --since={1year} --pretty=format:%s -- <FILES> |\
>         grep -v "^\(Merge\|Revert\)" |\
>         sed 's/:[^:]*$//' |\
>         sort | uniq -c | sort -rn | head -5
>
> already gives me results that really aren't worse than some of the
> prefixes invented by drive-by contributors.
>

I agree I do not see the need to introduce something in MAINTAINERS;
from my observations maintaining MAINTAINERS, there is sufficient work
on adoption and maintenance of the existing entries already without
such an yet another additional entry. Some entries are outdated or
wrong and the janitor task of cleaning those up is already enough work
for involved janitors and enough churn for involved maintainers. So a
machine-learned approach as above is probably good enough, but if you
think you need more complex rules try to learn them from the data at
hand... certainly a nice task to do with machine learning on commit
message prefixes.

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
