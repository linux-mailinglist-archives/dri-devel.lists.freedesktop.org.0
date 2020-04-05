Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80AD19EA44
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 12:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542056E0D4;
	Sun,  5 Apr 2020 10:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9366E0D4
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Zu+94vGYYFJ5Q7xClw21WJyGqzgQ2Rx1FUDOx08QAs=; b=k01p7WsvWHFPIR6Zh7cPhM9gCU
 9O9HArinjreaQzUmkGUif47NtPWs/8rhqsGWqswci7OrBlCEL16o+zylOdd9iVxCW4PcTGbpkMdho
 21+ulfPcls+8HMqKEGzn/pA+6MV+bXT9v/HjsghHR8EsDMN2HAEjlxpcBLg/vaUicBIYQ5W7/WfK5
 ks/b0TowCFmm0XjM32Fj9KoQJd8A0eGUDwTm3s2JxASVqy//F/rRqxX091k9nPxDITpNgO6Un60Fs
 TcBoYHrrhU+AfSjfYF7vBV9r9tKsGblwZRc/kDPQHcUAUSeBpQM0LeioOd/4N97GfHL+9TmASHzX9
 kokrZmJw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51669
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jL25M-0002Zv-Of; Sun, 05 Apr 2020 12:01:00 +0200
Subject: Re: [PATCH 19/44] drm/repaper: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-20-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <40e9d900-ff89-7560-b5c9-d19c81617687@tronnes.org>
Date: Sun, 5 Apr 2020 12:00:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-20-daniel.vetter@ffwll.ch>
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

CgpEZW4gMDMuMDQuMjAyMCAxNS41OCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBBbHJlYWR5IHVz
aW5nIGRldm1fZHJtX2Rldl9pbml0LCBzbyB2ZXJ5IHNpbXBsZSByZXBsYWNtZW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENj
OiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQoKQWNrZWQtYnk6
IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
