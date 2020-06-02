Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A71EC284
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 21:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5D96E45C;
	Tue,  2 Jun 2020 19:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5806E45C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 19:15:35 +0000 (UTC)
Date: Tue, 02 Jun 2020 19:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591125332;
 bh=BtLXHL5bynedhQ+EHGNHCicv1d4UL1yB3LV1pyRod7k=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=i5GtaVfqc0zvzqAIzchinXy3TQdPHa8ds6PEDtZs+jCdn7+Gc21oQbmEKJ12G1XFK
 3fAWajPzkHVYRCZL6gqHyKRHs5mWDgkyGPu1bF16qnGJCEf5aGM7MIAKHKLxRl90lZ
 JtI3mJinJYWbcv9xPw9yBB6oxB5O7sqLfn07UFhQ=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document how user-space should use link-status
Message-ID: <gTv4qExqdRoSwnkGNBWgzn5oOzF9XDeZT84AotaDqL3KCEEcE_qynbFKre-t0ZRqh0JuAyS-APo9_XZ2Wxr_kYOG1YfS0-tsWooSxfyN9jc=@emersion.fr>
In-Reply-To: <20200602103846.5c38d080@eldfell.localdomain>
References: <krnCwRP0UCcVJbY-8ILP_gEFf4EaUdKPSuuHisFkphFaoOl2EAnU032oOWAeJi2xlsFsA7qeR8lypXs71-SoULZnd2gP5C7ohDEfsWTB5-A=@emersion.fr>
 <20200602103846.5c38d080@eldfell.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, June 2, 2020 9:38 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> Can it happen that there will be no modes left in
> the list?

Reading drm_helper_probe_single_connector_modes, this sounds unlikely
but possible.

This isn't specific to link-status though. This can be the case on a
regular hotplug uevent too.

> What if userspace is driving two connectors from the same CRTC, and only
> one connector gets link-status bad, what does it mean? Is the other
> connector still running as normal, as if the failed connector didn't
> even exist?
>
> That is mostly a question about what happens if userspace does not fix
> up the link-status=bad connector and does not detach it from the CRTC,
> but keeps on flipping or modesetting as if the failure never happened.
> I guess I could ask it about both a CRTC that has another connector
> still good, and a CRTC where the failed connector was the only one.
>
> Can I trust that if the other connector is in any way affected, it too
> will get link-status bad?

link-status is about link maintenance (e.g. DP link training), so I
think the other connector would be fine in this case. I'll add this to
the next version and let Daniel/Manasi comment if that's incorrect.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
