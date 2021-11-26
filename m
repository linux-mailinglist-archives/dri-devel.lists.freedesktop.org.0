Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498545F6AD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 22:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736C96E02C;
	Fri, 26 Nov 2021 21:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944DF6E03D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 21:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1637963823; bh=hQtmkijMLRZXolIDwevdkRaX8oiVd2xIqnyTSrDAul4=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=Uks+ItXlu81L9q78OkkSP1+hJGAZCTZVLb2cDeSl8eISgK3T2Di27kq+v9uUAXCy1
 lXEoK+wBTf9s2dHMdOevZtQnWgmvhEuypi0WopaDUij5CRvGVZeKNPftnB7Gx2dds3
 DRQTk0OWolevMbSusnVA4VozOd0svzhF1rycw0pY=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 26 Nov 2021 22:57:03 +0100 (CET)
X-EA-Auth: mzRyAwLN+ElbSoGYfK2dRGdNy16uoY0WbGuGANmltdQHdaqhKxNuMtN3NSOPwOMuBE96UJzsweg8hcuYoDNQj7FfqTiH3K4h
Date: Fri, 26 Nov 2021 22:57:00 +0100
From: Claudio Suarez <cssk@net-c.es>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core, files
 drm_a*.c
Message-ID: <YaFYLJuYjiHjAPUu@gineta.localdomain>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
 <YaEBKuGKI1Zcd1Pr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaEBKuGKI1Zcd1Pr@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 26, 2021 at 04:45:46PM +0100, Daniel Vetter wrote:
> On Fri, Nov 26, 2021 at 11:49:49AM +0100, Claudio Suarez wrote:
> > DRM_DEBUG_* and DRM_* log calls are deprecated.
> > Change them to drm_dbg_* / drm_{err,info,...} calls in drm core
> > files.
> > 
> > To avoid making a very big patch, this change is split in
> > smaller patches. This one includes drm_a*.c
> > 
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> 
> lgtm, merged into drm-misc-next, thanks for the patch.
> -Daniel

Thanks to you, Daniel.

Best regards
Claudio Suarez



