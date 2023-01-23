Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FC6787E5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F94E10E55D;
	Mon, 23 Jan 2023 20:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8640E10E55D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:34:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02BDAB80E8F;
 Mon, 23 Jan 2023 20:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795F8C433EF;
 Mon, 23 Jan 2023 20:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674506075;
 bh=FmnPLtlEEZLnIMIwawfGix9wzSwjvgWL7c11CtPG7VM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gF5F3tETTnRMP1JPBnu7Ptp/If+nrlkHmh1UvayGFWUyXYmpvpFIlY+pg0zyr7IvH
 EVxJOqmXmJX4Qp/NQU69I9zkedvW44RZCoOXej3wWBme0Mdka7wWgcqiXHBS0ZO9AT
 gCCeJ5Uq2QZnfqQa2fxLrDKyt14RL6D7czuJJnAOpLLNhbfPWA+yt32/GYape34E4O
 F5mvBPdKOsbsv8biqPPZmtLiy9WobD+Fa+Nr4SCWtPIUvLRWLgmYTlf3NVqXtdDuWD
 rOx+KcDSyNsyRQHtz5q6KnNbBnT517gw8xLmWe7kphfoQ/6r8WJFEAIN5ITvVAGWH0
 7e32wlfHKB2Xw==
Date: Mon, 23 Jan 2023 14:34:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 1/1] Docs/subsystem-apis: Remove '[The ]Linux'
 prefixes from titles of listed documents
Message-ID: <20230123203434.GA979965@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230122184834.181977-1-sj@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-doc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-mm@kvack.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-hwmon@vger.kernel.org,
 Iwona Winiarska <iwona.winiarska@intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 22, 2023 at 06:48:34PM +0000, SeongJae Park wrote:
> Some documents that listed on subsystem-apis have 'Linux' or 'The Linux'
> title prefixes.  It's duplicated information, and makes finding the
> document of interest with human eyes not easy.  Remove the prefixes from
> the titles.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

PCI/index.rst change is fine with me:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> Changes from v1
> (https://lore.kernel.org/lkml/20230114194741.115855-1-sj@kernel.org/)
> - Drop second patch (will post later for each subsystem)
> 
>  Documentation/PCI/index.rst        | 6 +++---
>  Documentation/cpu-freq/index.rst   | 6 +++---
>  Documentation/crypto/index.rst     | 6 +++---
>  Documentation/driver-api/index.rst | 6 +++---
>  Documentation/gpu/index.rst        | 6 +++---
>  Documentation/hwmon/index.rst      | 6 +++---
>  Documentation/input/index.rst      | 6 +++---
>  Documentation/mm/index.rst         | 6 +++---
>  Documentation/peci/index.rst       | 6 +++---
>  Documentation/scheduler/index.rst  | 6 +++---
>  Documentation/scsi/index.rst       | 6 +++---
>  Documentation/sound/index.rst      | 6 +++---
>  Documentation/virt/index.rst       | 6 +++---
>  Documentation/watchdog/index.rst   | 6 +++---
>  14 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
> index c17c87af1968..e73f84aebde3 100644
> --- a/Documentation/PCI/index.rst
> +++ b/Documentation/PCI/index.rst
> @@ -1,8 +1,8 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> -=======================
> -Linux PCI Bus Subsystem
> -=======================
> +=================
> +PCI Bus Subsystem
> +=================
>  
>  .. toctree::
>     :maxdepth: 2
