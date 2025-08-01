Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA9B17CEA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 08:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854CF10E3BB;
	Fri,  1 Aug 2025 06:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Blto+PeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E90210E3BB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=dC9KBw4sEw7jTJErqmakBD0kKQgNF16I4/sEVGhGTmY=; b=B
 lto+PeNwDpC8srkaginYB0U4gqIN9WJWFIvDk/BYFkvbLN/wEXkrGQc9WrLOEh7f
 lFA9ylmVjq8RcKzFsX8aJS4g+lnPwffLO8+9FW//6jEo2yjq6TIryofG9mNQuP6Q
 04BwBQBgM4eH5glWunGbU7YqHVPxALQU+lnOoIS9sg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Fri, 1 Aug 2025 14:28:09 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 1 Aug 2025 14:28:09 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Intel Graphics" <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re:Re: linux-next: build warning after merge of the drm-misc tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250801144354.0ac00f39@canb.auug.org.au>
References: <20250716203115.6e02e50c@canb.auug.org.au>
 <20250801144354.0ac00f39@canb.auug.org.au>
X-NTES-SC: AL_Qu2eBvyZtk4j7yCcZekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrp+T8Sd2ZaF1DE/tCJOQeHiwGOexp84/ZoY4N9R58o3UA/dpqW8flVjzX0UsNm4w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7304e450.4ca8.198645108de.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgDnT_15XoxoQz8LAA--.23127W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgCcXmiMTk2huQACst
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

CkhlbGxv77yMCgpBdCAyMDI1LTA4LTAxIDEyOjQzOjU0LCAiU3RlcGhlbiBSb3Rod2VsbCIgPHNm
ckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToKPkhpIGFsbCwKPgo+T24gV2VkLCAxNiBKdWwgMjAy
NSAyMDozMToxNSArMTAwMCBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4g
d3JvdGU6Cj4+Cj4+IEFmdGVyIG1lcmdpbmcgdGhlIGRybS1taXNjIHRyZWUsIHRvZGF5J3MgbGlu
dXgtbmV4dCBidWlsZCAoaHRtbGRvY3MpCj4+IHByb2R1Y2VkIHRoaXMgd2FybmluZzoKPj4gCj4+
IGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmM6MTI0Mjogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2Nvbm5lY3Rvcicgbm90IGRlc2NyaWJlZCBpbiAnZHJt
X2JyaWRnZV9kZXRlY3QnCj4+IAo+PiBJbnRyb2R1Y2VkIGJ5IGNvbW1pdAo+PiAKPj4gICA1ZDE1
NmE5YzNkNWUgKCJkcm0vYnJpZGdlOiBQYXNzIGRvd24gY29ubmVjdG9yIHRvIGRybSBicmlkZ2Ug
ZGV0ZWN0IGhvb2siKQo+Cj5JIGFtIHN0aWxsIHNlZWluZyB0aGF0IHdhcm5pbmcuICBUaGF0IGNv
bW1pdCBpcyBub3cgaW4gTGludXMnIHRyZWUuCgoKVGhlIGZpeCBpcyBoZXJl77yaCgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNTA3MTYxMjU2MDIuMzE2NjU3My0xLWFuZHlz
aHJrQDE2My5jb20vCgpIb3BlIHRoYXQgYSBNYWludGFpbmVyIGNhbiByZXZpZXcgYW5kIGFwcGx5
IGl0LgoKCj4KPi0tIAo+Q2hlZXJzLAo+U3RlcGhlbiBSb3Rod2VsbAo=
