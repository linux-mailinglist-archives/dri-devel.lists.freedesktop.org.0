Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45440A74DDB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCFD10EA52;
	Fri, 28 Mar 2025 15:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NLId2hif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4A10EA4F;
 Fri, 28 Mar 2025 15:32:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 317D4A4113F;
 Fri, 28 Mar 2025 15:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087FCC4CEE4;
 Fri, 28 Mar 2025 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743175968;
 bh=nyvXSEqidS12SJhS47TDZr2qHkMFpFzbhcBVfQ56ZAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLId2hif5lVkH94V6V9vUnvvCLmKlIkOmvrtqqMsygWpq54AnfeBmLYJ7Xz2aXCWZ
 Q5AcFF7WuT6fZZTawrjRhynWrWJu4y9Y8ALv7b0amIRoe+61+vUn1njvDuz41fY+DD
 IWjmCHgjl9zB5PHou9J6yaUCZa0PQQUp0JnHVsHdbXjqUT3zU29hU0wakT4lQv74NW
 6riMtv6zDtF7LjRSHWhaTFtT3Eo7/wzd4ucATxaR1T7dRGnlko5Sf6r2/za5zx9eNl
 mCHQDcTC3IZ9knr/oInFXPPntO5Nn6+JyTuz75BWUMYC7BeGx38uAi5hndyJJcQ4Xy
 DfqNkTaYmZNnQ==
Date: Fri, 28 Mar 2025 16:32:44 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau/conn: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-bBHGKTJOs5Ld95@cassiopeiae>
References: <Z-a4meHAy-t58bcE@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-a4meHAy-t58bcE@kspp>
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

On Fri, Mar 28, 2025 at 08:56:25AM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/conn.c:34:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks!
