Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29A42949A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8696E8F7;
	Mon, 11 Oct 2021 16:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74216E8F7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:27:04 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 0947352e-2ab0-11ec-9c3f-0050568c148b;
 Mon, 11 Oct 2021 16:26:49 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 53079194B89;
 Mon, 11 Oct 2021 18:26:49 +0200 (CEST)
Date: Mon, 11 Oct 2021 18:26:59 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm: of: Add drm_of_lvds_get_data_mapping
Message-ID: <YWRl0/C/24SOjJpe@ravnborg.org>
References: <20211011112133.5313-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011112133.5313-1-marex@denx.de>
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

Hi Marek,
On Mon, Oct 11, 2021 at 01:21:33PM +0200, Marek Vasut wrote:
> Add helper function to convert DT "data-mapping" property string value
> into media bus format value, and deduplicate the code in panel-lvds.c
> and lvds-codec.c .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org

Looks good. I will let the bots chew it a little before we apply.

	Sam
