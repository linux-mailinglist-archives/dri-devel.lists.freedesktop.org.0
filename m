Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81472C7EB98
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 01:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DCA10E00D;
	Mon, 24 Nov 2025 00:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ccQtoVBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC7210E00D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=1ojNoYcSRgOUItS36fhXAjSvyt7+UNGNmIcHggvRc3w=; b=c
 cQtoVBJuCsQ92yBqd5UX1B0lyf0g+pDfzW/dD/Yi8EJYfFOB2sa+bwy/hF/qTVrD
 2KjU10veZsWvO1H6xjD7U1n1yLoVTjK8aIPPp+LNcLYvAPU9Vv4DJGx/Vy7RmvYn
 wu0w+y6PxYjH2AfoV6eM5nmem3hCL627qDvjV4HTdY=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-144 (Coremail) ; Mon, 24 Nov 2025 08:52:47 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 24 Nov 2025 08:52:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, mripard@kernel.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 "Andy Yan" <andy.yan@rock-chips.com>, m.wilczynski@samsung.com
Subject: Re:Re: [PATCH v8 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8913609.MhkbZ0Pkbq@phil>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-2-andyshrk@163.com> <8913609.MhkbZ0Pkbq@phil>
X-CM-CTRLMSGS: ARNM03BsdXM9MTc2Mzk0NTU2Nzc2MF9mMWFkMThkZGU5MGVhNWVjOWMxY2Q4N
 TIyODc1ODVlYw==
X-NTES-SC: AL_Qu2dAfWfuk0t4SecYOkfmUgWjuw/WsG1v/Ul1YBSP556jC3r1gsLcEV5OV7n7/K1KhiBjx+mVR1uxOl/e7Rgbog6ztD4kGMVyG9OqD90thYGFw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7cc43fc7.843.19ab3595609.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kCgvCgDnUTxfrCNpAWAoAA--.919W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxR9lw2kjrF+srwAA3G
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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

CgpwaW5nLi4uLgoKQXQgMjAyNS0xMC0yMCAyMDo0NTozNCwgIkhlaWtvIFN0dWVibmVyIiA8aGVp
a29Ac250ZWNoLmRlPiB3cm90ZToKPkFtIERvbm5lcnN0YWcsIDE2LiBPa3RvYmVyIDIwMjUsIDEw
OjM4OjMxIE1pdHRlbGV1cm9ww6Rpc2NoZSBTb21tZXJ6ZWl0IHNjaHJpZWIgQW5keSBZYW46Cj4+
IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IENvbnZlcnQg
aXQgdG8gZHJtIGJyaWRnZSBkcml2ZXIsIGl0IHdpbGwgYmUgY29udmVuaWVudCBmb3IgdXMgdG8K
Pj4gbWlncmF0ZSB0aGUgY29ubmVjdG9yIHBhcnQgdG8gdGhlIGRpc3BsYXkgZHJpdmVyIGxhdGVy
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29t
Pgo+Cj5SZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+QnV0
IG9mIGNvdXJzZSBJIHdvdWxkIGJlIHJlYWxseSBoYXBweSBpZiBzb21lb25lIHdpdGggbW9yZSBl
eHBlcmllbmNlCj5vbiBnZW5lcmFsIGJyaWRnZXMgY291bGQgYWxzbyB0YWtlIGEgbG9vay4KPgo+
Cj5IZWlrbwo+Cj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yb2NrY2hpcAo=
