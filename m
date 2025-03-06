Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18559A54DC4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5626510E9C0;
	Thu,  6 Mar 2025 14:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aWIRhtaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3068F10E9DC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:28:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A78685C5794;
 Thu,  6 Mar 2025 14:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA350C4CEE0;
 Thu,  6 Mar 2025 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741271323;
 bh=llfaZ6m1nVqICHV8YOp4t9+wLvbTps13KLEhVlvlLtU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aWIRhtaFAnBS7I8wMol1rWGTLH97nLXilojiNesJpQT7x276ika1HysjDCV4+fHSH
 l2AVAobZ5uJhqcRcSmBMkHgu2To3Ql5WKYkt8VMV/fFyOpo/a7GQAu0jHu9ewVtImb
 4O1A5E57NP1+Wth5yFjTclVcNVxT1jZIc9LqqKg8HjgnWkmFzvK8WmqmGTUUyFe+Gd
 hfnmqRx7WN8Sg2U7hkIW5TgYcV+PkDk5/lDgH+2J/6IZFKC+kfDlw1AIuLbXtJ1grh
 0gz50dbO3G15ksruGbqfzztnR6PzCOV6M2g5SwtVRh2Y86P44nyYzeeZEVvZRbxi31
 IM2dTbtj5RFRw==
Date: Thu, 6 Mar 2025 15:28:38 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] drm/sched: Documentation and refcount improvements
Message-ID: <Z8mxFslgK-XE3EEX@cassiopeiae>
References: <20250305130551.136682-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130551.136682-2-phasta@kernel.org>
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

On Wed, Mar 05, 2025 at 02:05:49PM +0100, Philipp Stanner wrote:
> Philipp Stanner (3):
>   drm/sched: Adjust outdated docu for run_job()
>   drm/sched: Document run_job() refcount hazard
>   drm/sched: Update timedout_job()'s documentation

Acked-by: Danilo Krummrich <dakr@kernel.org>
