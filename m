Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164C86750B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B60B10F148;
	Mon, 26 Feb 2024 12:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nO+O7iM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82310F148;
 Mon, 26 Feb 2024 12:33:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C831061188;
 Mon, 26 Feb 2024 12:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C91FC433F1;
 Mon, 26 Feb 2024 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708950799;
 bh=iVpnFC5qoBj5u4xxTGmfXF9T+j7roJU24Cf4R1lc0S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nO+O7iM0FBLFuDbRoL/eG/hNUW/srk3nonkai6ZtMHseVbweZXjRqYAyEylkPeiPM
 przp/1/YdZNfX4/+kUfdfday0DmatxiuPoyUXi05LsNmUG9KZu4EGNzJMiap18EvKy
 bePWhHZ88di0G+NUT8Yj9cXKZUaOuPJH6JLs8JxjDiQ42B6OrFyqbxmHtRiEJI0GkH
 DPAiCocOoEs0MgdFo/5EQvpiUyPuMWRagFzjBe82i+dbcdG4dJU2asj+GNsHON6M7E
 WH6CVb5nRZ/dUMT7vrj/dqAAa+AYnBncjkXFFHPcDmeNUM9yqKLA9r1R7SYLj5ByDw
 /OBc5mxR5tDxg==
Date: Mon, 26 Feb 2024 12:33:13 +0000
From: Lee Jones <lee@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/9] backlight/corgi-lcd: Include <linux/backlight.h>
Message-ID: <20240226123313.GA23065@google.com>
References: <20240219093941.3684-1-tzimmermann@suse.de>
 <20240219093941.3684-2-tzimmermann@suse.de>
 <1e577f18-c6f7-44e7-b50f-720915f257eb@suse.de>
 <20240223105652.GT10170@google.com> <874jdvo3ia.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874jdvo3ia.fsf@intel.com>
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

On Mon, 26 Feb 2024, Jani Nikula wrote:

> On Fri, 23 Feb 2024, Lee Jones <lee@kernel.org> wrote:
> > On Wed, 21 Feb 2024, Thomas Zimmermann wrote:
> >
> >> cc'ing backlight maintainers
> >
> > I cannot review/accept patches like this.
> >
> > Please submit a [RESEND].
> 
> I bounced the original [1] to you. Please consider acking to merge the
> one-line #include addition via fbdev so we don't have to respin the
> series for no good reason.

The "good reason" would be that it was not sent properly in the first
place.  My kernel.org mail is filtered by the recipients headers.  If
the original wasn't sent to me, bouncing won't work either.  I've since
reviewed the patch and seen the set on LORE.  This is non-optimal.
Please use get_maintainer.pl next time.

This time only, patch is:

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
