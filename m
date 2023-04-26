Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DDC6EFD2E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7C10E264;
	Wed, 26 Apr 2023 22:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59510E0E1;
 Wed, 26 Apr 2023 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682548556; x=1714084556;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=eke+wn4SSh/M5HVIwVbUwFt0Sa0cc2x3Dkvu4zF3Kv4=;
 b=Nk6UboqtcrtwnLHN7TAS4rt8QXsY5w2XSALjV7BoDn8bJr7r9Tyk09iA
 wjlJ0Qzx+xgWebLSFzx30ZiSymJMa0JUTlKn9GI8d0xNt4MbBXlHhE3wO
 iy0BSDUQO8w2l2nOxjol4txBViaIT54ouQsgU0AqMPW2eUOlLzrfSzgVU
 1RJ4m98VHAfLITXewjvavin+nh+LiVHnC/kFTIL/ghqWvnYdwpmlbMQTd
 AeQTguOQQhI4UioDj1GC8Pzgo28g18NoxGhRqbX3QnNkGCPfkMZX8oWpQ
 7HQJk3NftI7u1WOzKWszL1tL0RFsXps2A6M8MPIf4npazTsIiOlctztvP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331505541"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="331505541"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 15:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724629404"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="724629404"
Received: from taylorv1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.168.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 15:35:54 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <82cab075a8330355b3844cad26fcf842b275afb9.camel@intel.com>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
 <20230421053410.1836241-7-alan.previn.teres.alexis@intel.com>
 <82cab075a8330355b3844cad26fcf842b275afb9.camel@intel.com>
Subject: Re: [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 26 Apr 2023 15:35:54 -0700
Message-ID: <168254855442.392286.5736829518983136908@jljusten-skl>
User-Agent: alot/0.10
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, justonli@chromium.org,
 dri-devel@lists.freedesktop.org, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-26 11:17:16, Teres Alexis, Alan Previn wrote:
> alan: Hi Jordan, Tvrtko, Daniel Vetter and Lionel,...=C2=A0
> how to proceed on this series (which have required Rb/Ack's) in light of
> the recent discussion on the other series here:
> https://patchwork.freedesktop.org/patch/532994/?series=3D115980&rev=3D8
> it sounds like:
> - Jordan still wants the extension query

Yes, I do, but so far it doesn't appear that any kernel devs think
it's a reasonable request.

As I read through your emails about this pxp situation, it seems like
a separate issue. When I encountered the 8s delay, it was on MTL, and
apparently some firmware issue meant it was never going to work. So, I
thought this was a case of it either being supported, or never being
supported.

Now I'm seeing from your emails that in some cases it might be
supported, but just not ready yet. In that case a status which is
directly tied to pxp seems valuable. (But, yuck, how did we get into
this situation? :)

Can you tell that pxp is in progress, but not ready yet, as a separate
state from 'it will never work on this platform'? If so, maybe the
status could return something like:

0: It's never going to work
1: It's ready to use
2: It's starting and should work soon

I could see an argument for treating that as a case where we could
still advertise protected content support, but if we try to use it we
might be in for a nasty delay.

Maybe Lionel would have a different opinion on whether it would be a
good idea to go this route.

Regarding the extensions list I was requesting, it might be easiest
for the kernel if it just replies with all the extensions it knows
about regardless of whether they are usable right now.

-Jordan
