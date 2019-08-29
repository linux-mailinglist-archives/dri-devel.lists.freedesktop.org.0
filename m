Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9892A2A8E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 01:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D9F6E17C;
	Thu, 29 Aug 2019 23:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FF76E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 23:11:11 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F3D5208C2;
 Thu, 29 Aug 2019 23:11:10 +0000 (UTC)
Date: Thu, 29 Aug 2019 19:11:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.19.y 3/3] drm/tilcdc: Register cpufreq notifier
 after we have initialized crtc
Message-ID: <20190829231109.GR5281@sasha-vm>
References: <20190829200001.17092-1-mathieu.poirier@linaro.org>
 <20190829200001.17092-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829200001.17092-4-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567120270;
 bh=ag0UIe0YzhQynQuCXKX36KQPqflG0cViD6Fin3LuR7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PVREcpwizbQy+GWwZCdLcHvjGLow3aetqQLoIwjCWBKXmHDy4tKY4RbjsElKDmHsY
 5BUzfpbbFSdPADeQWT1GBYGnftSc0i5kVDUIOdKiFxYnn6zQkkc6KkkKPq8S4kRjfL
 f+3roI81jUEVpZXC+k0vmuC7z9Xs0BbyaG+W4l8E=
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
Cc: architt@codeaurora.org, jejb@linux.vnet.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, stable@vger.kernel.org,
 vinholikatti@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MDA6MDFQTSAtMDYwMCwgTWF0aGlldSBQb2lyaWVy
IHdyb3RlOgo+RnJvbTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPgo+Y29tbWl0IDQzMjk3
M2ZkM2EyMDEwMjg0MGQ1ZjdlNjFhZjlmMWEwM2MyMTdhNGMgdXBzdHJlYW0KPgo+UmVnaXN0ZXIg
Y3B1ZnJlcSBub3RpZmllciBhZnRlciB3ZSBoYXZlIGluaXRpYWxpemVkIHRoZSBjcnRjIGFuZAo+
dW5yZWdpc3RlciBpdCBiZWZvcmUgd2UgcmVtb3ZlIHRoZSBjdHJjLiBSZWNlaXZpbmcgYSBjcHVm
cmVxIG5vdGlmeQo+d2l0aG91dCBjcnRjIGNhdXNlcyBhIGNyYXNoLgo+Cj5SZXBvcnRlZC1ieTog
UGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KPlNpZ25lZC1vZmYtYnk6IEp5
cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj5TaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IFBvaXJpZXIg
PG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPgoKSSd2ZSBxdWV1ZWQgdGhpcyBvbmUgZm9yIDQu
MTkgYW5kIDQuMTQsIHRoYW5rIHlvdSEKCi0tClRoYW5rcywKU2FzaGEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
