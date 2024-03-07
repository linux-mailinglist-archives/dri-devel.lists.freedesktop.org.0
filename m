Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255988749A7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF3F10F207;
	Thu,  7 Mar 2024 08:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRdMuR3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0768F10F20F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 08:30:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4579DCE23AF;
 Thu,  7 Mar 2024 08:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31159C433F1;
 Thu,  7 Mar 2024 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709800238;
 bh=QNfBF7t3bIKzhPaT5Cw7SRBoQyMjYyl7EnboWndkJDk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MRdMuR3Rzjq6wLsYKS6FZbfc1xyI3QlHQt6z65ZSOskEOg5FmPQmL6J95BWGkMm8+
 KFd0lk9gz0nOSpiElhC/pJz4D6j60ErH6VaYxkAT+SKHuYOop68Z5YSYKhVVNVXuD/
 oyDaoKp35SUZ5v5J6SvXXYUqleBVFlt38YRN6RxGSi3HDfl17v2iKoN0XYxnY0e1hY
 M5fy84lruka6GuTQET4gn6gtGISEQ59rwYjLvjllXA9bAoENbSls/MMDvo4dcDIt0e
 Vi8sG+3eHznlrFNVvyKrC7nplt7mt7iWfh2kk8kDVpUQcyAwUurfzoIXiUDNqrdPyD
 Vuk/ak5l76nog==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240229095225.242795-2-matthew.auld@intel.com>
References: <20240229095225.242795-2-matthew.auld@intel.com>
Subject: Re: [PATCH] drm/tests/buddy: fix print format
Message-Id: <170980023565.810165.12599955029858883600.b4-ty@kernel.org>
Date: Thu, 07 Mar 2024 09:30:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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

On Thu, 29 Feb 2024 09:52:26 +0000, Matthew Auld wrote:
> This will report a build warning once we have: 806cb2270237 ("kunit:
> Annotate _MSG assertion variants with gnu printf specifiers").
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

