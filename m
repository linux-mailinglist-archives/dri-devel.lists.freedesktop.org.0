Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26025F8E9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 12:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718386E2C4;
	Mon,  7 Sep 2020 10:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8A6E2C4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 10:54:33 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8F1C620024;
 Mon,  7 Sep 2020 12:54:30 +0200 (CEST)
Date: Mon, 7 Sep 2020 12:54:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm: panel: add support for TDO tl070wsh30 panel
Message-ID: <20200907105428.GA523433@ravnborg.org>
References: <20200904161504.23915-1-narmstrong@baylibre.com>
 <7e63abb2-89d1-3047-29c2-d312ba5ce16d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e63abb2-89d1-3047-29c2-d312ba5ce16d@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=YRok_seE1VY6wa09Rq8A:9 a=CjuIK1q_8ugA:10
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 12:33:41PM +0200, Neil Armstrong wrote:
> Hi,
> 
> Please ignore this serie, the vendors patch is missing and the panel driver
> still has the vrefresh...
> 
> Will repost.

Please fix so DRM_DEV_* is replaced by dev_* logging.
We no longer use the DRM_ based logging for panels.

Drop drm_print.h from includes and fix build.

I did not read the code just noticed this detail.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
