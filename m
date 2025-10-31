Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16AC234F2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 06:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C3710E2A2;
	Fri, 31 Oct 2025 05:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Fri, 31 Oct 2025 05:54:02 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E40210E13F;
 Fri, 31 Oct 2025 05:54:02 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 0C2912C0009F;
 Fri, 31 Oct 2025 06:38:57 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id C5D9E5B97; Fri, 31 Oct 2025 06:38:57 +0100 (CET)
Date: Fri, 31 Oct 2025 06:38:57 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Subject: Re: DRM_RAS for CPER Error logging?!
Message-ID: <aQRLccLXfgfoWaIP@wunner.de>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com> <aQN6dqFdrXxLKWlI@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQN6dqFdrXxLKWlI@intel.com>
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

On Thu, Oct 30, 2025 at 10:47:18AM -0400, Rodrigo Vivi wrote:
> On Tue, Oct 28, 2025 at 03:13:15PM -0400, Rodrigo Vivi wrote:
> > On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:
> > 
> > Hey Dave, Sima, AMD folks, Qualcomm folks,
> 
> + Netlink list and maintainers to get some feedback on the netlink usage
> proposed here.
> 
> Specially to check if there's any concern with CPER blob going through
> netlink or if there's any size limitation or concern.

How large are those blobs?  If the netlink message exceeds PAGE_SIZE
because of the CPER blob, a workaround might be to attach it to the
skb as fragments with skb_add_rx_frag().

Thanks,

Lukas
