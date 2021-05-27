Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6A3937D1
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 23:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287376F4E3;
	Thu, 27 May 2021 21:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70766F4E3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 21:14:38 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c09:5500::19dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7CEEA1F43E05;
 Thu, 27 May 2021 22:14:36 +0100 (BST)
Date: Thu, 27 May 2021 17:14:31 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: alyssa.rosenzweig@collabora.com
Subject: Re: [PATCH 0/4] drm/panfrost: Plumb cycle counters to userspace
Message-ID: <YLALtwJOJ2Epiw2c@maud>
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The main outstanding questing is the proper name. Performance monitoring
> ("PERMON") is the name used by kbase, but it's jargon-y and risks
> confusion with performance counters, an orthogonal mechanism. Cycle
> count is more descriptive and matches the actual hardware name, but
> obscures that the same mechanism is required for GPU timestamps. This
> bit of bikeshedding aside, I'm pleased with the patches.

PANFROST_JD_REQ_CLOCK might be the clearest.
