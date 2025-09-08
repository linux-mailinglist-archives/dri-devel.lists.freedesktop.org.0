Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95D3B49C18
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B0410E5E7;
	Mon,  8 Sep 2025 21:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EKgB4i5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2010E5E7;
 Mon,  8 Sep 2025 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1AtuB/LujT3vSX0rRZe+ZwqGxLhE/7kKDf8v5+5hGxk=; b=EKgB4i5QznFldmy5eJUYovwV0m
 0E3WKl/59Uf1t1HpSIT8HSfCbfcldMF/qwNQ+wNA9kIsrtYstJ7Ecm5LJDB/p6ZvVQ77eTbLfha8x
 jwIL7uUnBMVyd7tMTqLsEEzkAaWwiP/paAQUy1URHAq825MMkhIJGmg3jhYXD8XM/8rv6SrkJ7Hch
 VU7bV0iSsq5G7G8/2wn+un+n+n7HZ1IeXOP0QM1u4+b347cqfTu/em2BaNVhCObluTsv4vndgEFHm
 w6VzP+djH4/YKI0NGvmK632gtFJEzuCj/tr89YRSA3mRan5gWsVAxbdKLdrP/DH7YbZj5FMPAz8Qb
 4YtrXyuA==;
Received: from [189.6.12.239] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uvjXn-008gza-1F; Mon, 08 Sep 2025 23:36:59 +0200
Date: Mon, 8 Sep 2025 18:36:12 -0300
From: Melissa Wen <mwen@igalia.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>, 
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, airlied@gmail.com,
 simona@ffwll.ch, 
 "Hung, Alex" <Alex.Hung@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Message-ID: <5ntmr5pekfsq2eavqeb5yhs2m7dvb7nm2plwlodzlf3c5lcfza@v6qgoe5l6ysu>
References: <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
 <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
 <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
 <67169725b87e02cc8fdc19be5fc7df59@igalia.com>
 <CAD9O9Dq=dAsMs5a3VzgSvLwfuYYhkARDFBXyWUy+yktEZv5WbQ@mail.gmail.com>
 <bdfc8786-d4b8-4391-a4d4-c5fe06020802@igalia.com>
 <CAD9O9DqxJQyAJM=po4yDbAC=hHK2pi12qTVYeb+ar_GenGpMnw@mail.gmail.com>
 <478eb8175779f03a399f7d933614e14c@igalia.com>
 <8d859c5f-2551-4624-a9b8-a816f1809feb@linux.dev>
 <801d0d97e7cdd1eb3b845347ccb5ddbf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <801d0d97e7cdd1eb3b845347ccb5ddbf@igalia.com>
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

On 07/18, Melissa Wen wrote:
> On 18-07-2025 00:51, Matthew Schwartz wrote:
> [...]
> 
> In short, there is a chance that you are not seeing those glitches
> because there are no changes in the pipe split when transitioning
> between 1-2 overlay planes in your hw, but the split happens on steam
> deck for some reasons. I don't know how the driver decides whether or
> not to split pipes.
> 
> That said, if AMD prefers to go with an exception for steam deck, better
> if this situation is documented.

Resuming this discussion as we shared many findings here...

Looks like not only Steam Deck in DCN3+ family is affected by those
glitches on overlay planes, DCN3.02 seems to have similar issue, as just
reported by:

https://gitlab.freedesktop.org/drm/amd/-/issues/4559

So I think we must rethink the steam-deck-expection approach proposed
by:

https://gitlab.freedesktop.org/agd5f/linux/-/commit/11262624508d14583ebc7744145a38da67dab192

Melissa

> 
> Steam Deck still needs the clear_update_flags() because it uses plane
> color caps and therefore sets multiple update flags, and some glitches
> appear when transitioning from 2 planes (with pipe split) to 3 planes
> (no pipe split). It might be related to minimal transition machinery.
> 
> Thank you for all inputs.
> 
> Melissa
