Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EC86C92B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152810E15B;
	Thu, 29 Feb 2024 12:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wcBsRyjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E9A10E195
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:25:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDB93673;
 Thu, 29 Feb 2024 13:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709209488;
 bh=K6neWUIvFeoUW8xXFJdX5R3tPB5XjlIDUunhao1jtTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wcBsRyjry5kHLIzEbjm/NFi/nTIml+y2541VxIqpb3C8yubjlwE8UsajGdDLFH389
 D0Z6S/eV/nzltcCvWj9KNHyE+vYdlE3MkXlYXglPUTSKBRwzWpgOBXeLeUO/yelXKn
 Dg7fnds8NhKgxTm8mvtHILYR/TNTkjA8+vvwO3W8=
Date: Thu, 29 Feb 2024 14:25:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Mark Brown <broonie@kernel.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, kernelci@lists.linux.dev,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240229122503.GH30889@pendragon.ideasonboard.com>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
 <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
 <20240229111919.GF30889@pendragon.ideasonboard.com>
 <a4fc23e1-5689-4f86-beb7-5b63a0d13359@sirena.org.uk>
 <b3fb89aa-56b4-4b3c-88f6-c6320bf5c489@gtucker.io>
 <20240229122040.GG30889@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229122040.GG30889@pendragon.ideasonboard.com>
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

On Thu, Feb 29, 2024 at 02:20:41PM +0200, Laurent Pinchart wrote:
> On Thu, Feb 29, 2024 at 12:53:38PM +0100, Guillaume Tucker wrote:
> > On 29/02/2024 12:41, Mark Brown wrote:
> > > On Thu, Feb 29, 2024 at 01:19:19PM +0200, Laurent Pinchart wrote:
> > >> On Thu, Feb 29, 2024 at 01:10:16PM +0200, Nikolai Kondrashov wrote:
> > > 
> > >>> Of course. You're also welcome to join the #kernelci channel on libera.chat.
> > > 
> > >> Isn't that a bit pointless if it's no the main IM channel ?
> > > 
> > > It *was* the original channel and still gets some usage (mostly started
> > > by me admittedly since I've never joined slack for a bunch of reasons
> > > that make it hassle), IIRC the Slack was started because there were some
> > > interns who had trouble figuring out IRC and intermittent connectivity
> > > but people seem to have migrated.
> > 
> > In fact it was initially created for the members of the Linux
> > Foundation project only, which is why registration is moderated
> > for emails that don't have a domain linked to a member (BTW not
> > any Google account will just work e.g. @gmail.com is moderated,
> > only @google.com for Google employees isn't).
> > 
> > And yes IRC is the "least common denominator" chat platform.
> > Maybe having a bridge between the main Slack channel and IRC
> > would help.
> 
> If the gitlab CI pipeline proposal wants to be considered for inclusion
> in the kernel, I think it needs to switch to a free software solution
> for its *main* communication channels.

And to clarify, I didn't meant the kernel CI project, but only the
gitlab CI pipeline for the Linux kernel project. I don't know how
tightly integrated the two projects are though.

-- 
Regards,

Laurent Pinchart
