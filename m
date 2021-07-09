Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618F3C2976
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50186EA5E;
	Fri,  9 Jul 2021 19:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C35E6EA5E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:18:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 608a676f-e0ea-11eb-9082-0050568c148b;
 Fri, 09 Jul 2021 19:18:01 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 39F96194B1F;
 Fri,  9 Jul 2021 21:18:15 +0200 (CEST)
Date: Fri, 9 Jul 2021 21:18:03 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/12] drm/mgag200: Introduce separate variable for PLL S
 parameter
Message-ID: <YOig68qJkyk7AsCw@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705124515.27253-6-tzimmermann@suse.de>
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
Cc: John.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 02:45:08PM +0200, Thomas Zimmermann wrote:
> The S parameter is controls the loop filter bandwidth when programming
> the PLL. It's currently stored as part of P (i.e., the clock divider.)
> Add a separate variable for S prepares the PLL code for a further
> refactoring.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I guess I will soon learn why they all had s << 3.

This patch is
Acked-by: Sam Ravnborg <sam@ravnborg.org>
