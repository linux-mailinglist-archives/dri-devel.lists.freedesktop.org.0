Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E3777091
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 08:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51FD10E4BD;
	Thu, 10 Aug 2023 06:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8510E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 06:40:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 52FB26607214;
 Thu, 10 Aug 2023 07:40:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691649606;
 bh=uOhqG4fispv1HyT2wcQA5GUwaFe6s8niX9CF29QCBcU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=or8l/s2hclUj6kLR9o2yS5mQ0v212t2y9IL2hyekXL5y/QRFsn/r/gWKOJmhkXFTk
 dpbClVxX715GI5WgilckC5gJzAt/ZG93CUo9LAaV8VFGbWD8V8TQMQkSRqknXIR56k
 ybaSjGUW3QNhQ8/A8QLeRq7JrCrpv+MogMLOr+5PKaGQvThzk+GK21iBpYND1RCsnc
 ODYv5POT0b5o+du806UAiaSYD9huuZXyWgsTMyc9YIWIrJc9AIoXbKw7LtqtlTEML8
 WgzYDtJcBA/vuSZIhu9EqDIa0Z7wrEjpQwQ2pjZGiHjs1J2HsnS/D44VrSFmUsIs1O
 MBZnw3JUzcvTQ==
Date: Thu, 10 Aug 2023 08:40:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Message-ID: <20230810084002.636cc827@collabora.com>
In-Reply-To: <20230809153755.GA832145@dev-arch.thelio-3990X>
References: <20230731123625.3766-1-christian.koenig@amd.com>
 <20230809153755.GA832145@dev-arch.thelio-3990X>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: ndesaulniers@google.com, naresh.kamboju@linaro.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, mripard@kernel.org, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, trix@redhat.com,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Aug 2023 08:37:55 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Christian,
> 
> Can this be applied to drm-misc? Other drivers are starting to make use
> of this API and our builds with clang-17 and clang-18 have been broken
> for some time due to this.

Queued to drm-misc-next.
