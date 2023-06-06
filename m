Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA037246AB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1B310E366;
	Tue,  6 Jun 2023 14:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10E10E366
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:46:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8340283;
 Tue,  6 Jun 2023 16:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686062763;
 bh=pw45dOR/x1K4kscKK9p3R+j5WFm9Dixeih/5F+y5akk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TdSbk7awKDLtnNr/g4kU7IPzYXD9no+P/5N6x5tZ9gpNxQMR3H+7AZlOUvLuk0o/b
 KBkMOjTXLca7j5q28EfL8UFiYgC4VntqgNOhm2OfVTJUuJYLMDY1ViqxFTofJ0kHJy
 lm/0dee3uG0i4cddQi5qoKDjh8xw47owA/IhERfc=
Date: Tue, 6 Jun 2023 17:46:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 3/8] drm: Remove usage of deprecated DRM_INFO
Message-ID: <20230606144625.GF5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <52c8eb0f241a9d67ce5b7e6fc64dc397e735ccd8.1686047727.git.code@siddh.me>
 <20230606142322.GB5197@pendragon.ideasonboard.com>
 <1889125187d.5d36766d120183.6659725053490512400@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1889125187d.5d36766d120183.6659725053490512400@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 08:08:27PM +0530, Siddh Raman Pant wrote:
> On Tue, 06 Jun 2023 19:53:22 +0530, Laurent Pinchart wrote:
> > Hi Siddh,
> > 
> > Thank you for the patch.
> 
> Anytime :)
> 
> > Any plan to remove it from drivers as well ? If not you should mention
> > in the commit message (probably in the subject line itself) that you're
> > only addressing the DRM core.
> > 
> > Same comment for further patches in this series.
> 
> Yeah, this patch set aims to replace just in drm core (as mentioned in
> the cover).
> 
> I thought "drm" would suffice since I did not specify a specific driver
> like i915. So the subject line should say "drm core: ..."?

I would write

drm: Remove usage of deprecated DRM_INFO in DRM core

The "drm: " prefix doesn't imply you're touching the core only, you
could do a tree-wide change that also touches all drivers.

-- 
Regards,

Laurent Pinchart
