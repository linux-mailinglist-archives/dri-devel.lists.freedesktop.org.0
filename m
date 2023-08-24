Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73A786EC6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CAC10E538;
	Thu, 24 Aug 2023 12:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9544B10E538
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 12:11:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E765961FA5;
 Thu, 24 Aug 2023 12:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF8CC433C8;
 Thu, 24 Aug 2023 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692879084;
 bh=w0EtY0V42ap7xNdrb9LVuX4xxUWvo184EQMRJ30AxBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TD6vsq4x8nJfHJW5vQPCWvMawEscvAWes8lyEZ0QsxdwxnxWld9b5RsOSvc2FuQSl
 0plqeDSe3iC4lt9fFMnxDgsRrzt3YWT8WL80CM3fTe/svnjr5oiRhKp8vZpZHtYdWa
 QPUYstn7vfVe+vpf3Vj+rfyfA5BkdiB4D6NYApdAEi8OV0l2TWZBSsiTnKnLE0+ac1
 HY8k7zLM0lQEAieYQpGxPS5J8sfsM/ZubuFLxzHGD7awK2wKGxvTFBqdVjot1qoEpZ
 QgK3nMgh9if+OFPVdnSnxIHoi6EylMfDiRo0yLuFSepiyz8PdAPbw7+l13XdO6Tfmn
 AF9ODrgioUzVw==
Date: Thu, 24 Aug 2023 13:11:20 +0100
From: Lee Jones <lee@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 13/20] drm/tests/drm_kunit_helpers: Correct possible
 double-entry typo in 'ddrm_kunit_helper_acquire_ctx_alloc'
Message-ID: <20230824121120.GV1380343@google.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-14-lee@kernel.org>
 <b67sjdnlltxlg5qjeebbocgmpdsxv6qvyzpjwjqy5pkyeovaiv@76snvdcewxmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b67sjdnlltxlg5qjeebbocgmpdsxv6qvyzpjwjqy5pkyeovaiv@76snvdcewxmo>
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
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Maxime Ripard wrote:

> Hi,
> 
> On Thu, Aug 24, 2023 at 08:36:58AM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting prototype for ddrm_kunit_helper_acquire_ctx_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead
> > 
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: "Maíra Canal" <mairacanal@riseup.net>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > index f102c23eee1dd..c1dfbfcaa0001 100644
> > --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > @@ -156,7 +156,7 @@ static void action_drm_release_context(void *ptr)
> >  }
> >  
> >  /**
> > - * ddrm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
> > + * drm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
> >   * @test: The test context object
> >   *
> >   * Allocates and initializes a modeset acquire context.
> 
> The typo was added by your patch 9.

Whoops!  Good catch.
> 
> I've applied and squashed them both

Perfect, thank you.

-- 
Lee Jones [李琼斯]
