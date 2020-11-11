Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFAC2AF7F1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A576E072;
	Wed, 11 Nov 2020 18:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBC96E072
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:31:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4ACE220048;
 Wed, 11 Nov 2020 19:31:49 +0100 (CET)
Date: Wed, 11 Nov 2020 19:31:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] drm: add debug logs for drm_mode_atomic_ioctl
 errors
Message-ID: <20201111183148.GB2999095@ravnborg.org>
References: <AVFi5ZzKwRVLtY8AQyxvqgIbcUfVgNebOtGVwSNMKvs@cp4-web-038.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AVFi5ZzKwRVLtY8AQyxvqgIbcUfVgNebOtGVwSNMKvs@cp4-web-038.plabs.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=rc14GTUnYGsM_Z5mAVoA:9 a=CjuIK1q_8ugA:10 a=NB7fjztKfZwA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 09:07:39AM +0000, Simon Ser wrote:
> Be nice to user-space and log what happened when returning EINVAL in
> drm_mode_atomic_ioctl.
> 
> v2:
> 
> - Migrate to drm_dbg_atomic (Sam)
> - Add debug log for arg->reserved (Ville)
> - Drop redundant "atomic" word in log messages (Ville)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
