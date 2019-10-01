Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACEC3FFD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 20:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3D26E882;
	Tue,  1 Oct 2019 18:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9226E882
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 18:38:36 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B34D12133F;
 Tue,  1 Oct 2019 18:38:35 +0000 (UTC)
Date: Tue, 1 Oct 2019 14:38:34 -0400
From: Sasha Levin <sashal@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH] video: hyperv_fb: Add the support of hibernation
Message-ID: <20191001183834.GA8171@sasha-vm>
References: <1568244833-66476-1-git-send-email-decui@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568244833-66476-1-git-send-email-decui@microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569955116;
 bh=SFNaZVvdlStLpfO46A2b6K/AG9EpSTq9sMu/WFeNxPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GFVKmnlvkOhetuVuOA+0dp0CketPneA2Uq5efIkAWIQuB5H9UowQytql9ORm979zW
 OzZpZEFG9VNZ4o2AySWIXL6b8eDo0ygO8c1lY5fKZb3zJ9tSoDTx+bHUdUAtxQcYYC
 7KJpMNgaUHd1E5BgSTs6aQCDzq3k/MjiRsm9XcyQ=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMTE6MzQ6MTBQTSArMDAwMCwgRGV4dWFuIEN1aSB3cm90
ZToKPlRoaXMgcGF0Y2ggZGVwZW5kcyBvbiB0aGUgdm1idXMgc2lkZSBjaGFuZ2Ugb2YgdGhlIGRl
ZmluaXRpb24gb2YKPnN0cnVjdCBodl9kcml2ZXIuCj4KPlNpZ25lZC1vZmYtYnk6IERleHVhbiBD
dWkgPGRlY3VpQG1pY3Jvc29mdC5jb20+CgpRdWV1ZWQgdXAgZm9yIGh5cGVydi1uZXh0LCB0aGFu
a3MhCgotLQpUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
