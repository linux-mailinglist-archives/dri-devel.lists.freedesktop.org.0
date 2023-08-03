Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3776EE9C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572110E624;
	Thu,  3 Aug 2023 15:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4323B10E624
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:49:35 +0000 (UTC)
Received: from strictly.printclub (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 47171660719E;
 Thu,  3 Aug 2023 16:49:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691077773;
 bh=1utPjd4nZ+4QB9HS6ftCxv82n8kl2ZtzpHU962/E6rE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQU0Uu5AYqLN0uIinurSjZx1HaX+nIKQo7UMy5gKDFm805tu3uuhA1MlUo/eF9l1L
 5s6X0YNyVEkqjzr+koD539VbUlAiDo9relnPeDiyBQnw+kFM6Bq9KiNN0JuyFoUC/i
 am+vkZ4+gWqlppMfpgPe6S3dhbvJkDqWQ9NltCuaGRQgLKy2D836iUHbqGPeak6Igt
 Aij3am8eAYWhfDUTNZLF1cUIw+Oq3O0scunydRQjvWaVFZWkrw30/eTxc64Xmohccw
 97tGO/fNQDaYkUfRZT6Qm/9q2wmtfqyCgNqbQpmArN5a6mAGL3kIMy9B4VpTGPzp5C
 shiKdzaWWrDjQ==
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] doc: uapi: Document dma-buf interop design & semantics
Date: Thu,  3 Aug 2023 16:47:27 +0100
Message-ID: <20230803154908.105124-2-daniels@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20210905122742.86029-1-daniels@collabora.com>
References: <20210905122742.86029-1-daniels@collabora.com>
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,
This is v2 to the linked patch series; thanks to everyone for reviewing
the initial version. I've moved this out of a pure DRM scope and into
the general userspace-API design section. Hopefully it helps others and
answers a bunch of questions.

I think it'd be great to have input/links/reflections from other
subsystems as well here.

Cheers,
Daniel


