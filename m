Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF51760C4D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4C189153;
	Tue, 25 Jul 2023 07:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC1489153
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:47:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DC12066015A0;
 Tue, 25 Jul 2023 08:47:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690271225;
 bh=FqkQljsrQQYOynoMT2kuaNXBVI9Ga1goxxlMyTMz8vw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TpVqrT9yeALla9A5G8KsleNW0whIR/H/Z7xqayb6QGZmAsHfE91SHNvep7FB7R3ww
 fF5BxvA3MWogzwUihj5xkXJLBwV0NGQNSsiovbDAOGm207wFLqm8nDBPeHp2SRwQHQ
 v5RC1zPn8ZquR8Y7sCR0a6+0wgrZeCNbISd4ruSWFxkCK2r49WnG9cFMVVoqaaowX9
 +WYJG72rZ+GKWdT+s3xIZdTon+KyaeEIZw2mLXqh9CazPCfuZzN+WYL+36aR76AkRs
 +VbJW1HOmaxxIx67dn9a1ljF/lMWNsQG4fCtPxQnWFROSRkfK0aAjGOcjISNiIjKus
 uNx7TKYgVA/pQ==
Date: Tue, 25 Jul 2023 09:47:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v14 10/12] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <20230725094702.4322fbb5@collabora.com>
In-Reply-To: <20230722234746.205949-11-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-11-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jul 2023 02:47:44 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Add locked/unlocked postfixes to drm-shmem function names to make clear
> where reservation lock is taken and where not.

Uh, ignore my comment on patch 1 then...

> Add more common helpers to drm_gem_shmem_helper.h

I'd do the renaming and exporting in separate patches.

> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
