Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF9677E95
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFBA10E23D;
	Mon, 23 Jan 2023 15:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E90210E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:02:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 8D62E4E5;
 Mon, 23 Jan 2023 15:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8D62E4E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1674486157; bh=wxSnxIUwdkEE3c/KbtJ9Rj/dEJdzd01IhaDBd3YRbOA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NmRRM54uhrNW9CPQE0Rj7FopmjfzAKSU48AkFmXI0PBahR3aZFhVv/eI2ez+LoQdt
 GAwYh6oeA5wECwc1VQwN51GdGKYJ3pRv9sjFAyB5PU6NyuPRJB5Fj49M9rtpAg90hA
 mGPUpT3XUv7qqmpuYvcPec8YgT+TOBIcluJ1TZ6CAVlJnVS8pi6FNVqF+QhufMW4B+
 FV+OdLKAsAKEypABjdte4J85m/2O/g6sbTnwMqgqCRN+jZ4f78bASoJqxscJz6dI3F
 Hho+mHPNvcZo038OgNds35wZPvtdAVg0kaVxnJntVPoQ1g5X7wLgwH/M1nzD8v/OGH
 XykY+7P/t3Ggg==
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 0/8] Docs: Add missing SPDX license identifiers of
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
Date: Mon, 23 Jan 2023 08:02:36 -0700
Message-ID: <874jshl2er.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
 Andrew Morton <akpm@linux-foundation.org>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SeongJae Park <sj@kernel.org> writes:

> Some subsystem documents are missing SPDX license identifiers on index
> files.  This patchset adds those.

Documentation/ is far behind on the SPDX front, and I'm all in favor of
fixing that.  I do worry, though, about sticking license declarations
onto files that did not previously have them; do we know what the
original contributor's intent was?

> Changes from v1
> (https://lore.kernel.org/lkml/20230114194741.115855-2-sj@kernel.org/)
> - Separate from index file content changes
> - Separate patch for each subsystem doc (Alex Deucher)
> - Use MIT license for gpu (Alex Deucher)
>
> SeongJae Park (8):
>   Docs/crypto/index: Add missing SPDX License Identifier
>   Docs/driver-api/index: Add missing SPDX License Identifier
>   Docs/gpu/index: Add missing SPDX License Identifier
>   Docs/hwmon/index: Add missing SPDX License Identifier
>   Docs/input/index: Add missing SPDX License Identifier
>   Docs/mm/index: Add missing SPDX License Identifier
>   Docs/scheduler/index: Add missing SPDX License Identifier
>   Docs/sound/index: Add missing SPDX License Identifier
>
>  Documentation/crypto/index.rst     | 2 ++
>  Documentation/driver-api/index.rst | 2 ++

I added this one, and GPLv2 is fine there.

>  Documentation/gpu/index.rst        | 2 ++
>  Documentation/hwmon/index.rst      | 2 ++
>  Documentation/input/index.rst      | 2 ++
>  Documentation/mm/index.rst         | 2 ++
>  Documentation/scheduler/index.rst  | 2 ++
>  Documentation/sound/index.rst      | 2 ++
>  8 files changed, 16 insertions(+)

Thanks,

jon
