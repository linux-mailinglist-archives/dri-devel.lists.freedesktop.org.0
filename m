Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D08A6B879
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 11:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8610E778;
	Fri, 21 Mar 2025 10:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jw03Jjnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id A27D110E76F;
 Fri, 21 Mar 2025 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=taNGpSsT9yLqZwW/7TUK635vZZQRd6sl6eS/ZIQodwA=; b=j
 w03JjndOyDU0V9XCF5Ag4w3qmFyQkKqaU3kNqxmn/cFJi4OFpH51NkPQnYRIqHqa
 CxmaXjUO3jSwlm3LGwfN9yOltaMRuOSK9NjDjSCH1k5ikhaKyfcNICpKydysyEgE
 vSjXCLy0yB+QX4ztKnRbPouB5dVR6pkXfe0Jrttrqo=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Fri, 21 Mar 2025 18:05:33 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 21 Mar 2025 18:05:33 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: lumag@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
 <20250321-optimistic-prompt-civet-bdcdba@houat>
X-NTES-SC: AL_Qu2fAPmevk0o5SWebOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDjp4xEhV2B6MH/20uOCARCyuyGufh9t7txYW6d3eJ0gIXOvsAZyJ0cP6n6VjAxo3w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5a6bffa.a00e.195b82a4808.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgD3T37tOd1nOPOCAA--.44580W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAMXXmfdMFz-jgABsE
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

CkhpIE1heGltZe+8jAoKQXQgMjAyNS0wMy0yMSAxNzo0ODowNCwgIk1heGltZSBSaXBhcmQiIDxt
cmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMDQ6NTM6
MzhQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gCj4+IEluIHNvbWUgYXBwbGljYXRpb24gc2NlbmFyaW9zLCB3ZSBo
b3BlIHRvIGdldCB0aGUgY29ycmVzcG9uZGluZwo+PiBjb25uZWN0b3Igd2hlbiB0aGUgYnJpZGdl
J3MgZGV0ZWN0IGhvb2sgaXMgaW52b2tlZC4KPj4gCj4+IEluIG1vc3QgY2FzZXMsIHdlIGNhbiBn
ZXQgdGhlIGNvbm5lY3RvciBieSBkcm1fYXRvbWljX2dldF9jb25uZWN0b3JfZm9yX2VuY29kZXIK
Pj4gaWYgdGhlIGVuY29kZXIgYXR0YWNoZWQgdG8gdGhlIGJyaWRnZSBpcyBlbmFibGVkLCBob3dl
dmVyIHRoZXJlIHdpbGwKPj4gc3RpbGwgYmUgc29tZSBzY2VuYXJpb3Mgd2hlcmUgdGhlIGRldGVj
dCBob29rIG9mIHRoZSBicmlkZ2UgaXMgY2FsbGVkCj4+IGJ1dCB0aGUgY29ycmVzcG9uZGluZyBl
bmNvZGVyIGhhcyBub3QgYmVlbiBlbmFibGVkIHlldC4gRm9yIGluc3RhbmNlLAo+PiB0aGlzIG9j
Y3VycyB3aGVuIHRoZSBkZXZpY2UgaXMgaG90IHBsdWcgaW4gZm9yIHRoZSBmaXJzdCB0aW1lLgo+
PiAKPj4gU2luY2UgdGhlIGNhbGwgdG8gYnJpZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0
aGUgY29ubmVjdG9yLCBwYXNzaW5nCj4+IGRvd24gdGhlIGNvcnJlc3BvbmRpbmcgY29ubmVjdG9y
IGRpcmVjdGx5IHdpbGwgbWFrZSB0aGluZ3Mgc2ltcGxlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPgo+RlRSLCBJJ20gYWdhaW5zdCBp
dCBhbmQgd291bGQgaGF2ZSBhcHByZWNpYXRlZCB0aGF0IHlvdSB3YWl0IGZvciBhCj5tZWFuaW5n
ZnVsIGNsb3N1cmUgdG8gdGhlIGRpc2N1c3Npb24gd2UndmUgaGFkIG9uIHRoaXMuCgpObyBwcm9i
bGVtLiBJIGp1c3Qgd2FudCB0byBrbm93IGhvdyB0byBwcm9jZWVkIHdpdGggdGhpcy4KCgo+Cj5N
YXhpbWUK
