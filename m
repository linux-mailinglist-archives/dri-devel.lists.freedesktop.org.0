Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA3039436A
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C21B6F5BC;
	Fri, 28 May 2021 13:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0338B6F5C1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:31:52 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c09:5500::19dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 106861F442C0;
 Fri, 28 May 2021 14:31:49 +0100 (BST)
Date: Fri, 28 May 2021 09:31:45 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH 0/4] drm/panfrost: Plumb cycle counters to userspace
Message-ID: <YLDwwTa6rs8S1hU7@maud>
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
 <997658d4-ba30-f150-7b15-183403d7ae94@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997658d4-ba30-f150-7b15-183403d7ae94@collabora.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomeu,

> Will this be enough to implement GL_TIMESTAMP and GL_TIME_ELAPSED queries?
> 
> Guess the DDK implements these as WRITE_VALUE jobs, and there's also a soft
> job BASE_JD_REQ_SOFT_DUMP_CPU_GPU_TIME that I guess is used for
> glGet*(GL_TIMESTAMP). Other DRM drivers use an ioctl for that instead.

For anything implemented as WRITE_VALUE jobs, this is necessary and
sufficient on the kernel side. If an out-of-band soft job or ioctl is
truly needed (I haven't looked), of course that needs additional piping.

Thanks,

Alyssa
