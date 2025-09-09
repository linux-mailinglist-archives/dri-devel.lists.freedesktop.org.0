Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D5B4A397
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB3210E639;
	Tue,  9 Sep 2025 07:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L+Kg7mCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D910E639;
 Tue,  9 Sep 2025 07:33:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 64C2B44730;
 Tue,  9 Sep 2025 07:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C451C4CEF4;
 Tue,  9 Sep 2025 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757403220;
 bh=2rV/0wVJYCaheEbQJ41p1oFShqazpfBG9bo/I2W5EqU=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=L+Kg7mCuNljoXjR+E1tGWRNV0DS+qqSCPbusoTxNlxXkyR/1D6UCQ6LS4GVuTpkES
 ouDaR3VHlUBnKs2nx6QufF8NrO1XqVkqZKYBzcwZ5lFzmP0wijr5dJot7/ANSMVHru
 VlZqyiIK7Oe+J+wGgewezxuVoNTbLSKjoFIOxl6bKHma0sUecfCWhZKn9VhdAdGLH1
 7v/A3wJ4dWAKNN8Argx8stx2RezWL4U5Ng/joghkmrMwYyVOqCzZza+Kx1etpG9Hna
 5E9S/YYelddxj9BcIMDcb/BO53qXzopV1k8Y/qQI90Bl6P5O8r3zczZcs1QHhf4va5
 XzgNIOMjs41yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 09:33:37 +0200
Message-Id: <DCO3G4UZUP7X.1HS1MKZZHSSQD@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, "Dave Airlie" <airlied@redhat.com>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/4] nouveau: populate buffers before exporting them.
References: <20250904021643.2050497-1-airlied@gmail.com>
 <20250904021643.2050497-3-airlied@gmail.com>
In-Reply-To: <20250904021643.2050497-3-airlied@gmail.com>
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

On Thu Sep 4, 2025 at 4:16 AM CEST, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> Before exporting a buffer, make sure it has been populated with
> pages at least once.

NIT: I'd add the rationale of why that's needed from patch 1 to the driver
patches as well.

> Signed-off-by: Dave Airlie <airlied@redhat.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
