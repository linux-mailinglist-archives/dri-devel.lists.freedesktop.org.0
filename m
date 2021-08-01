Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DF3DCDB1
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 22:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6426E199;
	Sun,  1 Aug 2021 20:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155DB6E199
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 20:28:16 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 09fff2bd-f307-11eb-8d1a-0050568cd888;
 Sun, 01 Aug 2021 20:28:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0CCB5194B1A;
 Sun,  1 Aug 2021 22:28:36 +0200 (CEST)
Date: Sun, 1 Aug 2021 22:28:10 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: lichenyang <lichenyang@loongson.cn>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devel@linuxdriverproject.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v4 2/3] drm/loongson: Add GPIO and I2C driver for
 loongson drm.
Message-ID: <YQcD2q7+Dax65lv2@ravnborg.org>
References: <20210730094148.620768-1-lichenyang@loongson.cn>
 <20210730094148.620768-2-lichenyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730094148.620768-2-lichenyang@loongson.cn>
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

Hi lichenyang,

On Fri, Jul 30, 2021 at 05:41:47PM +0800, lichenyang wrote:
> Implement use GPIO and I2C driver to detect connector
> and fetch EDID via DDC.
> 
> v3:
> - Change some driver log to the drm_ version.
> 
> v2:
> - Optimize the error handling process.
> - Delete loongson_i2c_bus_match and loongson_i2c_add function.
> - Optimize part of the code flow.
> 
> Signed-off-by: lichenyang <lichenyang@loongson.cn>

I will return later with more detailed feedback.

One high-level comment is that all the i2c support would be much better
modelled as a bridge. And then you could use the bridge_connector.

	Sam
