Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40CBB1ADB
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 22:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365A310E004;
	Wed,  1 Oct 2025 20:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZS0TGsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1810E071
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 20:25:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BD344035C;
 Wed,  1 Oct 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE7AC4CEF1;
 Wed,  1 Oct 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759350326;
 bh=cDMQ/Miw1V0mOMDj+NmDGCe9tUvPtu2fAp4XgseFJ9g=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=PZS0TGsycQoKnA6NetFuERcWGqOTKxUTYvMvOkHT2kJm0KC2/JVDw/B6OawN7tsDE
 ubGnFkdgVQMXciI4Z0YjGsVTl+jAYQyaoFQb2o2/YNuylG5nlzxuXEPALYXqI3ONiM
 DfvT66jFQZccEkLYA23HAyEIjZanqtp4xECeshpWF7IYkacK+coT+TUHjx+qJvGsfO
 /79qi32odWuiCgHA/ZgnlvaydADi8odQEjrkeOmvfKH7I0aujcay9f1WQ9JPtXy0h2
 6NrNqo37Amiaz4VzdNf/r+hjPESZASSFruWBlHVSplBRGv2ymzK7x+cU/sch5vlPpU
 ZOgAcE6zP2XGw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 22:25:23 +0200
Message-Id: <DD79N0TCT29D.24XVMO4AIFJZN@kernel.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [git pull] drm for 6.18-rc1
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Sima Vetter"
 <sima@ffwll.ch>, "dri-devel" <dri-devel@lists.freedesktop.org>, "LKML"
 <linux-kernel@vger.kernel.org>
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
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

On Wed Oct 1, 2025 at 6:06 AM CEST, Dave Airlie wrote:
> The other big thing here is rust stuff. There is a pin-init rework
> which may also be merged in other trees (I can't remember).

I have taken the pin-init PR through the drm-rust tree for this cycle -- no
other tree involved.

- Danilo
