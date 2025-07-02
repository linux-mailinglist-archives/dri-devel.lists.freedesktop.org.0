Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D00FAF110D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 12:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126A210E6BD;
	Wed,  2 Jul 2025 10:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="iaBrpt5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1140 seconds by postgrey-1.36 at gabe;
 Wed, 02 Jul 2025 10:02:03 UTC
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FEE10E6BD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4RQYA4LXGsUIWNPdNTtVuOGRdOSD5lcBfI1QeblMubo=; b=iaBrpt5YQVSfENcFXe3c8keYCU
 wzc9HKfk0zluF3aivIgYfE5G/RLtrK3dPANS8aJAPA8LDIRl7HaCxdmwa121sjUMqPUMMpLyDNVUH
 GuatSg110C3ejmYZyv51XYfJmy+Jz1fM+FW510fgYFLckcHGl9oR+XtZiBfYNgRVR5GBvc1bNtV6N
 xrhJa2jbZgOJ2osxxBYGlKQGB5fCpN4zQfoOz9YIq/apzElce5by9eCANwYlB+aeVv6moZLVysKGb
 /7GCveHJhnWtwgo4Ct3XWpPmFzDYzmPyPdzUN1h6zYNryWEL2+UEUxpkmKW8VtUHQlU9dCdNflKxg
 j88L0Z0Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com
 ([174.114.102.5]:60874 helo=asus)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <rpjday@crashcourse.ca>)
 id 1uWtzT-0000000D58N-3lT8; Wed, 02 Jul 2025 05:42:58 -0400
Date: Wed, 2 Jul 2025 05:42:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/ttm: remove redundant ternaray operation on ret
In-Reply-To: <20250702092541.968932-1-colin.i.king@gmail.com>
Message-ID: <e3cfe3dd-5edd-ef67-6651-62ecf31cd4ad@crashcourse.ca>
References: <20250702092541.968932-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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


  subject has typo, should be "ternary"

rday
