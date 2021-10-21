Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA1D436900
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E346EC90;
	Thu, 21 Oct 2021 17:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509C56EC90
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 17:27:52 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 39761925-3294-11ec-9c3f-0050568c148b;
 Thu, 21 Oct 2021 17:27:54 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1A698194B4A;
 Thu, 21 Oct 2021 19:27:49 +0200 (CEST)
Date: Thu, 21 Oct 2021 19:27:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: John Keeping <john@metanate.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/3] drm/panel: ilitek-ili9881c: Read panel orientation
Message-ID: <YXGjE9HWFTmQvcUw@ravnborg.org>
References: <20211020153432.383845-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020153432.383845-1-john@metanate.com>
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

Hi John,

On Wed, Oct 20, 2021 at 04:34:27PM +0100, John Keeping wrote:
> Support the "rotation" DT property for ILI9881C based panels.
> 
> The first patch is a fix for the binding, then the usual binding update
> followed by the corresponding driver update.
> 
> John Keeping (3):
>   dt-bindings: ili9881c: add missing panel-common inheritance
>   dt-bindings: ili9881c: add rotation property
>   drm/panel: ilitek-ili9881c: Read panel orientation

Thanks for fixing my mistake in ilitek,ili9881c.yaml.
All patches applied to drm-misc-next. They will show up in -next in 1-2
weeks.

	Sam
