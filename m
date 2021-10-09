Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFFE427B5E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 17:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572B6E1B7;
	Sat,  9 Oct 2021 15:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05A6E1B7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 15:39:17 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 074a5cf0-2917-11ec-ac3c-0050568cd888;
 Sat, 09 Oct 2021 15:39:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B57BF194BAC;
 Sat,  9 Oct 2021 17:39:02 +0200 (CEST)
Date: Sat, 9 Oct 2021 17:39:12 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add support for Sharp LS060T1SX01 panel
Message-ID: <YWG3oC7Bp54tIYkN@ravnborg.org>
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
 <20210926001005.3442668-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926001005.3442668-3-dmitry.baryshkov@linaro.org>
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

Hi Dmityry,

On Sun, Sep 26, 2021 at 03:10:05AM +0300, Dmitry Baryshkov wrote:
> Add driver to support Sharp LS06T1SX01 FullHD panel. The panel uses
> nt35695 driver IC. For example this LCD module can be found in the
> kwaek.ca Dragonboard Display Adapter Bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The driver looks fine. It would have been nicer could you have used
regulator_bulk - but I guess timing constraints prevents that - right?

Please address the following checkpatch warnings:

-:181: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#181: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:129:
+	msleep(1);

-:187: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#187: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:135:
+	msleep(10);

-:193: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#193: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:141:
+	msleep(10);

-:210: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#210: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:158:
+	msleep(10);

-:241: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#241: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:189:
+	msleep(10);


I expect patches to be checkpatch --strict clean - or it is mentioned in
the changelog otherwise.

	Sam
