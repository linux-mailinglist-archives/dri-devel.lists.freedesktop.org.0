Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02FA35E6D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97B510EC7B;
	Fri, 14 Feb 2025 13:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LiwjkU/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE0610EC7A;
 Fri, 14 Feb 2025 13:10:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CBE3FA4046F;
 Fri, 14 Feb 2025 13:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A344C4CED1;
 Fri, 14 Feb 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739538631;
 bh=LdaSwEwl2gLdaD/CmYnheNHV+UGmaQZUXRor0FyWS3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiwjkU/lp/C6FwLqXEfp33bq4HIYvjCjEOz0RDaJzbgi2CDGPmb1gj5nl2UModCkz
 23250YWjH5Rjc8p/8jROOPyNyeSMzJxXq3HcLb//yjdVPW5kthsNCmGOOyEgEihwl8
 K4j6PiIlEEdH1TYNDRI2bd0/Lj2XhvsrkdwzNZfkKMRSLqvx/nomHRdpWbUW8Uif9F
 NCHkquu7SCJk0Q+EnzViXwHd0W/rSbp3dEzwOogZZRgeHrL+k9Tsd5zX4BcPB+rh4o
 9NVjfJpq0VWZd24Up8+BX5FMjnfWBL3GNoLRjBQ5YxbQ4gMSlbv3ZYTsUKff/jhsEU
 +IbCda2gNz9IA==
Date: Fri, 14 Feb 2025 14:10:27 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>
Subject: Re: [PATCH] drm/nouveau: select FW caching
Message-ID: <Z69Awxng8zedDwws@cassiopeiae>
References: <20250207012531.621369-1-airlied@gmail.com>
 <Z68_m1iHYN_7a_hH@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z68_m1iHYN_7a_hH@cassiopeiae>
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

On Fri, Feb 14, 2025 at 02:05:36PM +0100, Danilo Krummrich wrote:
> only force FW_CACHE if DRM_NOUVEAU_GSP_DEFAULT?

Please scratch that, it was a horrible idea.
