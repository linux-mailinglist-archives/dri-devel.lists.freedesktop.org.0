Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A761D78C6
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 14:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7787D6E13C;
	Mon, 18 May 2020 12:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC96E13C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 12:40:07 +0000 (UTC)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04ICdm4v019140
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 May 2020 07:39:52 -0500
Message-ID: <906228e89ae11cad241f78ac74142d030f3ab16e.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 22:39:47 +1000
In-Reply-To: <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
 <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-05-18 at 12:00 +0100, Emil Velikov wrote:
> I believe you reported issues due to different page size for the CPU/GPU.
> Have you tried nouveau recently, there has been a handful of patches
> on the topic since your report.
> 
> Alternatively, it would make sense you rebase, cleanup and merge your patch.

That was a problem for the G5s. There were other issues for more
ancient machines with older nVidia GPUs. Additionally a lot of those
Apple machines don't have a BIOS ROM to get the various tables from.

At this stage unfortunately I don't have access to most of that HW to
test with anymore. I do have one G5 I might be able to dig out of my
basement this week to try out.

In any case, digging out that patch should be useful as powerpc64 is
still 64k pages :)

Cheers,
Ben.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
