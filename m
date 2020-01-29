Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234AF14CB4F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 14:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40276E372;
	Wed, 29 Jan 2020 13:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8E46E372;
 Wed, 29 Jan 2020 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=088J6zul/ms40YvFF1jL5fQpUK3E/9pYydqTGXobSPQ=; b=cJGD7dlQrjP6G6pWqTN7uWrcW8
 XsEfWifVY42P5UK/t5+BPwyBpy7ykk8pAve4upHmfhDb1XNh4eXheb9dkJKfvTHoqCbn3jK2VJhOX
 6nr+51kxNaOoNpj0i7aDif0iOt0yERtPFpApyCuz8MGj9pw4oOilGBBFecC5vIrjjUHMrZOnjGvvw
 m+6W1KxdCtngraSoblpfaqnMD6ELPV0OtQo5pIt+2bSqnZ2WPnVRPsfN4vVtKclIv1wZyEXmhtpcW
 eGtPGnZ402pjbmiJvTZRoNwlCbbf6w2Km0bKZkzwbgNjRNqUG4uGCIFEWiZ7byJ3plTtQUI/9WMbF
 Gai5eW0g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59890
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iwnDC-0004Ur-LA; Wed, 29 Jan 2020 14:16:54 +0100
Subject: Re: [PATCH 3/5] drm/client: Rename _force to _locked
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
 <20200129082410.1691996-4-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b9214acc-24ea-4007-643b-a07f6b6db065@tronnes.org>
Date: Wed, 29 Jan 2020 14:16:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129082410.1691996-4-daniel.vetter@ffwll.ch>
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

CgpEZW4gMjkuMDEuMjAyMCAwOS4yNCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBQbHVzIGV4dGVu
ZCB0aGUga2VybmVsZG9jIGEgYml0IHRvIGV4cGxhaW4gaG93IHRoaXMgc2hvdWxkIGJlIHVzZWQu
Cj4gV2l0aCB0aGUgcHJldmlvdXMgcGF0Y2ggdG8gZHJvcCB0aGUgZm9yY2UgcmVzdG9yZSB0aGUg
bWFpbiB1c2VyIG9mCj4gdGhpcyBmdW5jdGlvbiBpcyBub3QgZW1waGFzaXMgb24gdGhlICJJIGhv
bGQgdGhlIGludGVybmFsIG1hc3RlciBsb2NrCgpUaGUgX25vdF8gY29uZnVzZXMgbWUsIHRoZSBl
bXBoYXNpcyBpcyBub3cgdGhhdCAiSSBob2xkIHRoZSBsb2NrIiByaWdodD8KCj4gYWxyZWFkeSIg
YXNwZWN0LCBzbyByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIG1hdGNoLgo+IAo+IFN1Z2dlc3RlZCBi
eSBOb3JhbGYuCj4gCj4gQ2M6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+
IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
