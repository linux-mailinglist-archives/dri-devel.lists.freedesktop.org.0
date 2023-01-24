Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1467A699
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 00:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4648110E26F;
	Tue, 24 Jan 2023 23:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593C710E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:03:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5ADA61353;
 Tue, 24 Jan 2023 23:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AC5C433EF;
 Tue, 24 Jan 2023 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674601423;
 bh=FInAJGM6hitQqEWREbqfiZT6RW4VKmJRYiGIyELSJQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDav27OxxZTsAQgsUUqCRxbi02UJHTXeQ4BNvRR2EVcVurslbfZQ1hQbAIbZQ0Dfe
 d2YSKzxKcs/H8PX8n256ShJsj1Yt/HpEuQvjdnXNW7LxK4qClB/5cWjD9N85pUzOHq
 f9gUdwmJmO9TH4Nu6ulKdR7s5iitURCwPLteuRHaK6g42tTBOlrwyVzrc/b54PXQrm
 FbSFiUK1nyUKX9eWCnkged8yubqQAufRoj0a6bqC3EvH/1rfsEWHb0Tb9HTxrVTird
 q9ZhjkXbmN7rMAWQP3zs8stWUwCCsCvl/nEQ1sr2UBHleUHB7lQ7F6o7uEEzUcCbTU
 KQ4JYbXPqsgEQ==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
Date: Tue, 24 Jan 2023 23:03:40 +0000
Message-Id: <20230124230340.113608-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87a627ftuf.fsf@meer.lwn.net>
References: 
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-mm@kvack.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 15:31:04 -0700 Jonathan Corbet <corbet@lwn.net> wrote:

> SeongJae Park <sj@kernel.org> writes:
> 
> > Some subsystem documents are missing SPDX license identifiers on index
> > files.  This patchset adds those.
> >
> > Changes from v1
> > (https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
> > - Separate from index file content changes
> > - Separate patch for each subsystem doc (Alex Deucher)
> > - Use MIT license for gpu (Alex Deucher)
> >
> > SeongJae Park (8):
> >   Docs/crypto/index: Add missing SPDX License Identifier
> >   Docs/driver-api/index: Add missing SPDX License Identifier
> >   Docs/gpu/index: Add missing SPDX License Identifier
> >   Docs/hwmon/index: Add missing SPDX License Identifier
> >   Docs/input/index: Add missing SPDX License Identifier
> >   Docs/mm/index: Add missing SPDX License Identifier
> >   Docs/scheduler/index: Add missing SPDX License Identifier
> >   Docs/sound/index: Add missing SPDX License Identifier
> 
> So I've applied patches 2 (since I wrote the initial file) and 8 (with
> Takashi's ack).  The others are also fine, I think, but I hesitate to
> apply license texts to files without knowing that they match the
> author's intent.  I hate to say it, but I think the best approach is to
> send each of the remaining patches to the appropriate maintainers for
> the subsystem involved.

That makes 100% sense, thank you, Jon!


Thanks,
SJ

> 
> Thanks,
> 
> jon
