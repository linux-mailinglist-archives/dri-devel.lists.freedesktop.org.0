Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625586C7E4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA1A10E46D;
	Thu, 29 Feb 2024 11:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DrPgchJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FF910E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:19:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CA8BC67;
 Thu, 29 Feb 2024 12:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709205544;
 bh=7Eihvt86sWz7EP3y44dO8crLxvUcOmGXPcGktOO6u/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DrPgchJl8eyBsuuIvu1KwAAxBvUE2LhSUIkFpyBTTNDzjdFgAe2QAKOs5GKt4FLC1
 Hu4OTxmiFybg7PokMEe+AuTDBS89RjdgLUEi8PP2idrIgn1lO9betXc1NcDq+3Y+8l
 Hbdh3a/hEQ2dpoICE8v7cXWXcj4nvPXvdidvztlQ=
Date: Thu, 29 Feb 2024 13:19:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
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
Message-ID: <20240229111919.GF30889@pendragon.ideasonboard.com>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
 <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
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

On Thu, Feb 29, 2024 at 01:10:16PM +0200, Nikolai Kondrashov wrote:
> On 2/29/24 11:34 AM, Laurent Pinchart wrote:
> > On Thu, Feb 29, 2024 at 11:26:51AM +0200, Nikolai Kondrashov wrote:
> >> On 2/29/24 01:07, Laurent Pinchart wrote:
> >>> On Wed, Feb 28, 2024 at 07:55:24PM -0300, Helen Koike wrote:
> >>>> **Join Our Slack Channel:**
> >>>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
> >>>> Feel free to join and contribute to the conversation. The KernelCI team has
> >>>> weekly calls where we also discuss the GitLab-CI pipeline.
> >>>
> >>> Could we communicate using free software please ? Furthermore, it's not
> >>> possible to create an account on that slack instance unless you have an
> >>> e-mail address affiliated with a small number of companies
> >>> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
> >>> for me.
> >>
> >> Yes, it's not ideal that we use closed-source software for communication, but
> >> FWIW I'd be happy to invite you there. Perhaps if you try logging in e.g. with
> >> a Google account, I'd be able to see and approve your attempt too.
> > 
> > I don't use Google accounts to authenticate to third-party services,
> > sorry. And in any case, that won't make slack free software.
> 
> Of course. You're also welcome to join the #kernelci channel on libera.chat.

Isn't that a bit pointless if it's no the main IM channel ?

> It's much quieter there, though.

-- 
Regards,

Laurent Pinchart
