Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9D988371
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 13:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD61A10E0AD;
	Fri, 27 Sep 2024 11:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HyuCsri1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4E10E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 11:45:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02D8FA45565;
 Fri, 27 Sep 2024 11:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5C9C4CEC4;
 Fri, 27 Sep 2024 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727437520;
 bh=SCBHUHxhOwHyz3EI7691IIa2jeVDdt/x341S4Aze9Pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HyuCsri15Qa9MOPHBw6bUyOaa7NNgvMqZgVUWDC0ETt2sHgk20D93bwiMx2tBHIXH
 7zdo6BUcn0ejOllZPfnAv0kc8cDcEj8wZjXL8rG8q/o3/fdr9y36CqYs2GzKpHZchR
 E0C73baS1s5RL2RJ3MxL0ihM8Uz5tvqOX+IfoDBY=
Date: Fri, 27 Sep 2024 13:45:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Huang Xiaojia <huangxiaojia2@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com,
 thellstrom@vmware.com, syeh@vmware.com, yuehaibing@huawei.com,
 weiyongjun1@huawei.com, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 5.10] drm/vmwgfx: Remove rcu locks from user resources
Message-ID: <2024092751-sloppy-pyromania-d2b3@gregkh>
References: <20240921064804.2868105-1-huangxiaojia2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921064804.2868105-1-huangxiaojia2@huawei.com>
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

On Sat, Sep 21, 2024 at 02:48:04PM +0800, Huang Xiaojia wrote:
> [ Upstream commit a309c7194e8a2f8bd4539b9449917913f6c2cd50 ]

We can't take this until you submit backports for newer kernels also.
Please send for all affected kernels, thanks.

greg k-h
