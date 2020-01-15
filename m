Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82E13CAAB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 18:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445096EA53;
	Wed, 15 Jan 2020 17:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0AE6EA53
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 17:14:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7DC9A81200;
 Wed, 15 Jan 2020 18:14:00 +0100 (CET)
Date: Wed, 15 Jan 2020 18:13:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115171358.GA23015@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
 <20200115122253.GA22854@ravnborg.org>
 <848720ca-6062-8314-e874-3a36f8aee1da@ti.com>
 <20200115144309.GA20850@ravnborg.org>
 <b4f5d846-aa44-a759-1caa-70244dfabeb3@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4f5d846-aa44-a759-1caa-70244dfabeb3@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=FBmygEOeIvoNrRZmZRsA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri.

> Well, I'll bite the bullet then, and start mangling the code to the
> "strict" format.

While touching the code please consider moving all logging
over to the new drm_{err,warn,info,dbg} functions.
They give the nice "[drm]" marker.
And they are a tad shorter as you do not have to dereference ddev->dev
everywhere.
And you then also gain support for controlling logging using
drm.debug=0xxxx, os sysfs too.

See drm_print.h in latest drm_misc_next

With or without this change you can add my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
