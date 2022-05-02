Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C925517781
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 21:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD3310F3A3;
	Mon,  2 May 2022 19:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019B10F3A3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 19:41:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E27C1484;
 Mon,  2 May 2022 21:41:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651520489;
 bh=7fS1iDiQS0BFHXb6Blv7uJsVuEU2kQ6EnwifQcIZAzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L6vTOnaYs7l4Xlv3+utCAZq5wLz1L8z9dE5E8+De/yg2+Pma+zdmoo/867c5Ze76+
 exCdf2KgzXrGOkXEsHqhG4eyuJpbCE1tqzVXQPVbHV8+oMRr0hcpp/eZbX9GD6wYiL
 rZ001sxYlJkkZ4F/yveoIbAQI0FZ6+DVNlid2hh0=
Date: Mon, 2 May 2022 22:41:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
Message-ID: <YnAz6HPPfWpYcZvF@pendragon.ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-2-javierm@redhat.com>
 <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
 <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
 <bc6b6598-0e09-1a43-4086-e4164ab42a20@redhat.com>
 <YnAkwRL7b++a0omG@pendragon.ideasonboard.com>
 <21db3772-b85a-59ff-df17-9056b3099977@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21db3772-b85a-59ff-df17-9056b3099977@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 09:28:45PM +0200, Javier Martinez Canillas wrote:
> On 5/2/22 20:36, Laurent Pinchart wrote:
> > On Mon, May 02, 2022 at 07:15:16PM +0200, Javier Martinez Canillas wrote:
> >> On 5/2/22 18:55, Javier Martinez Canillas wrote:
> >>
> >> [snip]
> >>
> >>>> drop the depth option to drm_fbdev_generic_setup() ? There's a FIXME
> >>>> comment in drm_fbdev_generic_setup() that could be related.
> >>>
> >>> A FIXME makes sense, I'll add that to when posting a v3.
> >>
> >> There's actually a FIXME already in drm_fbdev_generic_setup(), so it's
> >> a documented issue [0]:
> > 
> > That's what I meant by "there's a FIXME" :-) It doesn't have to be
> > addressed by this series, but it would be good to fix it.
> 
> doh, I misread your original email. Yes, it's the same issue as you
> said and something that I plan to look at some point as a follow-up.
>  
> I hope that we could just replace fbcon with a kms/systemd-consoled/foo
> user-space implementation before fixing all the stuff in the DRM fbdev
> emulation layer :)

If you can do that, I'll provide champagne :-)

-- 
Regards,

Laurent Pinchart
