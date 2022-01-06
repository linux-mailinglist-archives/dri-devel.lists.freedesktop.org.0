Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0A486268
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3F510E90E;
	Thu,  6 Jan 2022 09:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Thu, 06 Jan 2022 09:52:39 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 477BF10E908
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 09:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id D59C680B5;
 Thu,  6 Jan 2022 09:46:46 +0000 (UTC)
Date: Thu, 6 Jan 2022 11:45:58 +0200
From: Tony Lindgren <tony@atomide.com>
To: OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>
Subject: Re: [Openpvrsgx-devgroup] [PATCH] drm: omapdrm: Fix implicit dma_buf
 fencing
Message-ID: <Yda6VhRLHw06yVst@atomide.com>
References: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
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
Cc: philipp@uvos.xyz, tomba@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> [220105 15:38]:
> Fix that by initializing dma_buf resv to the resv of the gem object being
> exported.

Nice find! This also fixes my wlroots test case with termite running on
sway where termite would only partially update when switching between
desktops, so:

Tested-by: Tony Lindgren <tony@atomide.com>
