Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A011BFF720
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 02:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EC86E0CD;
	Sun, 17 Nov 2019 01:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE266E0C2;
 Sun, 17 Nov 2019 01:29:42 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0419F2075E;
 Sun, 17 Nov 2019 01:29:41 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191114185152.101059-1-robdclark@gmail.com>
References: <20191114185152.101059-1-robdclark@gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: ignore NULL clocks
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Sat, 16 Nov 2019 17:29:41 -0800
Message-Id: <20191117012942.0419F2075E@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573954182;
 bh=VzNM7mKIbzruoB4g8aBQDy+zckMzp5W6fs0DAz7WWAk=;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
 b=ggHD7FX4Mo4k8sYridHaOsXYP+LxdXkfCAKu8nGIz/CTXPsx/ybkQQIqBftd2zqo9
 JOspo/oiuju7vknDgz7m7BlOH2HKzyTEXSVNo4i4E35iOS72ZT5cGWk7I4hoxFG612
 vuQDZfWb/xZZX0h1XLZHVeHiVGd9UokrC9GMA0TI=
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMTEtMTQgMTA6NTE6NTApCj4gRnJvbTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFRoaXMgaXNuJ3QgYW4gZXJyb3IuICBBbHNv
IHRoZSBjbGsgQVBJcyBoYW5kbGUgdGhlIE5VTEwgY2FzZSwgc28gd2UgY2FuCj4ganVzdCBkZWxl
dGUgdGhlIGNoZWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNo
cm9taXVtLm9yZz4KPiBUZXN0ZWQtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0u
b3JnPgo+IC0tLQoKQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
