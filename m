Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D910323EA6D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0875D6E9AB;
	Fri,  7 Aug 2020 09:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07246E9AB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gGIwDhOjA1LUWyVCPaxr0QUqfVFuaQ2aeOuDTG1FAG0=; b=MslSwSkr01gt37As8fjtp3c4L+
 6xxPqtPSL4bh0HaSr22/l0EGjObkF7Y1b2yd2VrnO1qxWjAao21ToRnsob2Q5HbRxmUk+K7ktL12e
 fWSA93OWvOje0tkgZmr2nk07ub+RYndaYdyv+soRH/pget70PhJuqhr+rN+PgY2iCwHGJtCohnlZg
 v4TLPW1TL7Ywcwt3k72wJq6XiXclEFTwFNgw7x4GdYH1v54sHHX+/uCERdnN1lRTARFnk8sUiEwEi
 Uit4ZbeeL+I0RrTXQKS5ObwCFH0AHHQtFg6tWAe7QKe14ZsFxgXUV+ABxCRIBtndf2CBx3IADZFgB
 HQotCxuQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53009
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1k3ymc-0001ze-4F; Fri, 07 Aug 2020 11:35:26 +0200
Subject: Re: [PATCH 3/6] drm/xen-front: Add YUYV to supported formats
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-4-andr2000@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a7a3ce30-34a8-c084-5cbd-88271271ac67@tronnes.org>
Date: Fri, 7 Aug 2020 11:35:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731125109.18666-4-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzEuMDcuMjAyMCAxNC41MSwgc2tyZXYgT2xla3NhbmRyIEFuZHJ1c2hjaGVua286Cj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgo+IAo+IEFkZCBZVVlWIHRvIHN1cHBvcnRlZCBmb3JtYXRzLCBzbyB0aGUgZnJvbnRl
bmQgY2FuIHdvcmsgd2l0aCB0aGUKPiBmb3JtYXRzIHVzZWQgYnkgY2FtZXJhcyBhbmQgb3RoZXIg
SFcuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IC0tLQoKQWNrZWQtYnk6IE5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
