Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806742E1D88
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 15:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBB46E09E;
	Wed, 23 Dec 2020 14:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D448F6E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 14:46:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A910222B3;
 Wed, 23 Dec 2020 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608734797;
 bh=TIcmLBYA1QjLglfRUgalXVt5vjwLXmYuBYb+XgwpW84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmu8Xip1AFX5E3+YvFYBc/+Uz5fLYRF7Yon0B26guRhMtvrwQGGXunKhSfPSQSmrr
 wB2q/3t7fqHQ9Pp5cU1T/m3J6AgKuKydR6TtdqSayvhyov4XLEcosjZranmLgTwoQv
 87yNpegXLWfAKt+dRoLbbSF/iNELHerB9IMpr1KEGL8i9xb03funllC9i6CZJuU0+e
 fSt2b/E4B1AumZLjVTw7/Fydkqy9U4Y66fk3RUsoCfPQWluQbv1H/WA6Tg9WnzAEUw
 7Y7T+oDW4+YI2kX4zaPveJtDvGkkoAyPQ/vGggSvndeF5aL307SbQFwdothKztHgH4
 MtpmAts6smtUg==
Date: Wed, 23 Dec 2020 15:46:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/fb-helper: Add a FIXME that generic_setup is
 very confusing
Message-ID: <20201223144633.au2evq5m2fvfh25o@hendrix>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
 <20201211161113.3350061-2-daniel.vetter@ffwll.ch>
 <X+G0gDNlSCGLyjGK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X+G0gDNlSCGLyjGK@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 22, 2020 at 09:55:28AM +0100, Daniel Vetter wrote:
> On Fri, Dec 11, 2020 at 05:11:13PM +0100, Daniel Vetter wrote:
> > I tried to fix this for real, but it's very sprawling and lots of
> > drivers get this mildly wrong one way or the other.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
>
> Anyone feeling like an ack on this one?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
