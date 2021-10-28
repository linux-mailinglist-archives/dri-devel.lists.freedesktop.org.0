Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E739D43F37F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 01:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9D6E849;
	Thu, 28 Oct 2021 23:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D361E6E849
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 23:30:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5F5B3E5;
 Fri, 29 Oct 2021 01:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635463826;
 bh=JcLFu97F9jATu7U5es1JKJ7Z8uhcuGGjiyfilLUPp+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mXSxNvLXWd4c4ZVyWYBkqFKJ8UqdlUf1uCmxElw7l4DULMa1EopUnFRbtHEhrdcIP
 1CvE+4wXBQpLdFnSNpBmm2YIhBw5jSuJHi1C3rxgh8NNystzi5XQp5nJNOsf3KEicD
 mw7YZPDqZAlzKPXGT3C7H7VFToFrgp5fmLQbp4i8=
Date: Fri, 29 Oct 2021 02:30:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm: Add R10 and R12 FourCC
Message-ID: <YXsyevoVkpJ52K6q@pendragon.ideasonboard.com>
References: <20211027233140.12268-1-laurent.pinchart@ideasonboard.com>
 <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
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

Hi Simon,

On Thu, Oct 28, 2021 at 09:49:18PM +0000, Simon Ser wrote:
> > +/* 10 bpp Red */
> > +#define DRM_FORMAT_R10		fourcc_code('R', '1', '0', ' ') /* [15:0] x:R 6:10 little endian */
> > +
> > +/* 12 bpp Red */
> > +#define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
> 
> Are these codes arbitrary, or are they taken from somewhere else?
> 
> If they are arbitrary, maybe it'd be better to pick XR10 and XR12 instead of
> R10 and R12, to allow a future patch to add other format codes with the padding
> at the end if we ever need that.

They are arbitrary indeed, but modelled after DRM_FORMAT_R8 which used
'R8  '. As you've noticed, XR12 is already taken.

I don't think we'll need a format with padding at that end (with data
aligned to tbe MSB) as that would essentially be DRM_FORMAT_R16.

-- 
Regards,

Laurent Pinchart
