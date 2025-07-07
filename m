Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7FBAFB57A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB3710E49D;
	Mon,  7 Jul 2025 13:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0363010E49D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:58:31 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 330E42009184;
 Mon,  7 Jul 2025 15:58:30 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 268BA4D174; Mon,  7 Jul 2025 15:58:30 +0200 (CEST)
Date: Mon, 7 Jul 2025 15:58:30 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Hans de Goede <hansg@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>, David Airlie <airlied@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Ben Hutchings <ben@decadent.org.uk>, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ahmed Salem <x0rw3ll@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] agp/amd64: Check AGP Capability before binding to
 unsupported devices
Message-ID: <aGvShrJJTj2ERdZr@wunner.de>
References: <b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de>
 <aGbaNd3qCK3WvAe-@tassilo>
 <4ef523a2-48b3-45e9-94da-7811e1bfae76@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ef523a2-48b3-45e9-94da-7811e1bfae76@kernel.org>
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

On Mon, Jul 07, 2025 at 02:53:32PM +0200, Hans de Goede wrote:
> So I think we should move forward with Lukas' fix dor 6.16 and then
> my patch to disable probing of unsupported devices by default can
> be merged into linux-next .

Sounds good to me.

Dave is out all week and has not commented on this matter at all so far:

https://lore.kernel.org/r/CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com/

I assume Bjorn may not be comfortable applying my patch without an ack
from Dave.  I am technically able to apply my own patch through drm-misc
and I believe Hans' Reviewed-by is sufficient to allow me to do that.

I'd feel more comfortable having additional acks or Reviewed-by's though.
I'm contemplating applying the patch to drm-misc by Wednesday evening,
that would allow it to land in Linus' tree before v6.16-rc6.

If anyone has objections, needs more time to review or wants to apply
the patch, please let me know.

Thanks,

Lukas
