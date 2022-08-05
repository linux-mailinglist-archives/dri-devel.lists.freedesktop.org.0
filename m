Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF23B58A461
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 03:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6789BAC46B;
	Fri,  5 Aug 2022 01:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04A83ACACF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 01:03:00 +0000 (UTC)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2750JNpl009247;
 Thu, 4 Aug 2022 19:19:24 -0500
Message-ID: <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Date: Fri, 05 Aug 2022 10:19:22 +1000
In-Reply-To: <20220720142732.32041-11-tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-20 at 16:27 +0200, Thomas Zimmermann wrote:
> +#if !defined(CONFIG_PPC)
> +static inline void out_8(void __iomem *addr, int val)
> +{ }
> +static inline void out_le32(void __iomem *addr, int val)
> +{ }
> +static inline unsigned int in_le32(const void __iomem *addr)
> +{
> +       return 0;
> +}
> +#endif

These guys could just be replaced with readb/writel/readl respectively
(beware of the argument swap).

Cheers,
Ben.

