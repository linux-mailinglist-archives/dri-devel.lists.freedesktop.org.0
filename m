Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B784DA68E9D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6010E50C;
	Wed, 19 Mar 2025 14:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WIi7XKWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487C810E50F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 14:13:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 241B25C5783;
 Wed, 19 Mar 2025 14:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4305AC4CEE4;
 Wed, 19 Mar 2025 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742393575;
 bh=7VJOMqWqh0wQcU1BFtXa6c0GzKjyuarAJOX4Wh2GmdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WIi7XKWru5EjClACAxW7fG7MrDi1oafmrSYWuXdM4al6SJMerCD644yysnaDZp1p3
 2LDcQEEXQMHEsUw1kWs1HQdpVEhZ+Rlh3cMQGDXUheT3jqRNpEf7RchuL1QIiE0VvV
 9nXul06F0lg22xYOWnH40PRctJ5PLPcuTvKhGTABAzObaKo4uGJDbY90fglQchMrPz
 zdnDS5wAHIzRd67LmF1G3JlvIXOdZYT6Fcj3yjWaUW/4/a8WWrduL730o5XA/58K0q
 UVQaOk/8wXhRASzknHY8/8DPszhi4/o8XNYLNxMGVdTOL7jrB3VRz/2M5WGrtt7k7p
 VKIjmLhc6/iag==
From: Maxime Ripard <mripard@kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH] Documentation: vgaarbiter: Fix grammar
Date: Wed, 19 Mar 2025 15:12:50 +0100
Message-ID: <174239356754.697925.8716284607359471588.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318041249.20786-2-bagasdotme@gmail.com>
References: <20250318041249.20786-2-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 18 Mar 2025 11:12:50 +0700, Bagas Sanjaya wrote:
> Correct grammar issues:
> 
> - Fix "co-exist" subject-verb agreement
> - Correct plural form of "server" in context of more than one legacy
>   devices
> - Use passive mood for intro sentence of libpciaccess section
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
