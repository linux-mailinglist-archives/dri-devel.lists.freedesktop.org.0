Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919F11C9D8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 10:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353396ECEF;
	Thu, 12 Dec 2019 09:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5526ECEF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 09:49:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 50CF220025;
 Thu, 12 Dec 2019 10:49:32 +0100 (CET)
Date: Thu, 12 Dec 2019 10:49:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/3] drm/vram-helper: Various cleanups
Message-ID: <20191212094930.GA32429@ravnborg.org>
References: <20191212074117.29283-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212074117.29283-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=Us_BYnCFKwWqwM_rN4gA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=68kxEXcerHAAc8rfip4W:22
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Thu, Dec 12, 2019 at 08:41:14AM +0100, Thomas Zimmermann wrote:
> A number of cleanups that I wanted to apply for some time. The first
> two patches simplify the public interface. The third patch adds support
> for struct drm_driver.gem_create_object. All tested by running fbdev,
> X11 and Weston on ast HW.
> 
> v2:
> 	* make drm_gem_vram_create() still work if GEM object is not
> 	  first in struct
> 
> Thomas Zimmermann (3):
>   drm/vram-helper: Remove interruptible flag from public interface
>   drm/vram-helper: Remove BO device from public interface
>   drm/vram-helper: Support struct drm_driver.gem_create_object

I have browsed the code changes - everything now looks fine.
As I miss the high-level picture (which is just my lack of DRM
knowledge) this is not a review. But you can add my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
