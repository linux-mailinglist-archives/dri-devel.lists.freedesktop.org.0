Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839A737325
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901F510E193;
	Tue, 20 Jun 2023 17:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2618910E193
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=glErMHd1IE//rfCeyQ3nSqHoM8FjG/q9L2Q9Dl7UQ4o=;
 b=htgRbiRrzlgEFTmVRopzx61vftmGE0pwYLiV7XGxE1RLJ76CN85RjUYKslaVP1k6IO6x96YqNvOtU
 025it0V6JLL9vx15VTWR53Gz+DPghxZXZKFqdbvuPcsAoEh5WVgEJ3852EIuzhiffpuUsp4YduoyrA
 of6f+w/pqK2kiGA03sOJK8Z10rP6b13KK/QgAD/f5DiEUWBKgOptXJOSAI24s4t1ut9r0SEOq1jGwl
 Vy9RsDkC0pOSJxqI8PhJ/luq4Jw77e8xCZuVknpIRGgI3wKYIIUQ2/HFqS4Y2m2owLSNSDIxnSrq6K
 X+ehCnH/ddyqbgcCq3hWbbwQHMVaX8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=glErMHd1IE//rfCeyQ3nSqHoM8FjG/q9L2Q9Dl7UQ4o=;
 b=x7CbOreORFyzSeeAWWwFDkpas3kWwvAlFw5lmIxzqRK6G8RUfrlq446U0ckN75BPP4KP/lADpyTPy
 pVGuT3EBA==
X-HalOne-ID: 52a01b4e-0f92-11ee-9053-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 52a01b4e-0f92-11ee-9053-5ba399456a4a;
 Tue, 20 Jun 2023 17:46:04 +0000 (UTC)
Date: Tue, 20 Jun 2023 19:46:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/sysfs: rename drm_sysfs_connector_status_event()
Message-ID: <20230620174602.GA2187479@ravnborg.org>
References: <20230620174231.260335-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620174231.260335-1-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org, Manasi Navare <navaremanasi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon.

On Tue, Jun 20, 2023 at 05:42:42PM +0000, Simon Ser wrote:
> Rename drm_sysfs_connector_status_event() to
> drm_sysfs_connector_property_event(). Indeed, "status" is a bit
> vague: it can easily be confused with the connected/disconnected
> status of the connector. This function has nothing to do with
> connected/disconnected: it merely sends a notification that a
> connector's property has changed (e.g. HDCP, privacy screen, etc).
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Manasi Navare <navaremanasi@chromium.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Makes sense to me.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
