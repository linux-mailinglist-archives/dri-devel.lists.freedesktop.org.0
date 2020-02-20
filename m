Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B7166248
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3186EDD9;
	Thu, 20 Feb 2020 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613C76EDD8;
 Thu, 20 Feb 2020 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U39f/AI7tn97UgYoGJtZq8flkyYh0YqwZifQPsqYCTY=; b=oAAfJGvpj4mrB+jWKV94N7I+of
 84+D29i7fGJk2aXo52G1qpWXSAAFilnwPHFGnXVbmzFfLj6Kz21QCsQW3dmUUa9jkW17QHQBqViSJ
 0KnJ82lxlO1mVDOMMvt2sJWtmNZgo5IPFUxQ0X+2a1VB09sYA/VQj4EibelBbdlG3E63U8dVp5yf/
 ZKG1NrE2fwjrNsmx98Ko1cbaTrSxHx2TYb2R4p/QNPvN6TBgeo63HbxHZw9CwiXUor1amkpCcbGZ9
 xPshbpr7ZZdgkz3OPCtiOoxCKm77+35xBzsV9n2UNVuSLwudfoAZlD36w49Gx5ZYXw/c1boGy4WIf
 7x74fuDw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50611
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j4oaZ-00025a-Ek; Thu, 20 Feb 2020 17:22:11 +0100
Subject: Re: [PATCH 48/52] drm/mipi-dbi: Move drm_mode_config_init into mipi
 library
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-49-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <553e20fe-46e7-0edc-59e7-35750f2f5e1b@tronnes.org>
Date: Thu, 20 Feb 2020 17:22:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219102122.1607365-49-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkRlbiAxOS4wMi4yMDIwIDExLjIxLCBza3JldiBEYW5pZWwgVmV0dGVyOgo+IDcvNyBkcml2ZXJz
IGFncmVlIHRoYXQncyB0aGUgcmlnaHQgY2hvaWNlLCBsZXQncyBkbyB0aGlzLgo+IAo+IFRoaXMg
YXZvaWRzIGR1cGxpY2F0aW5nIHRoZSBzYW1lIG9sZCBlcnJvciBjaGVja2luZyBjb2RlIG92ZXIg
YWxsIDcKPiBkcml2ZXJzLCB3aGljaCBpcyB0aGUgbW90aXZhdGlvbiBoZXJlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQoK
UmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
