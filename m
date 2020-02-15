Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B315FFB9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 19:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119E46E900;
	Sat, 15 Feb 2020 18:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664196E900
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dSonFg/wT1PhOFMeG2cNMDkAO52fBhiLonIuIbHmC2g=; b=eqRKVhCOH9XrtYitzrQUJIk9hT
 VqrT2h1/nQJRkFvZF9MsnRo1PtUm9bJQ+MpdIIPFd4IWwhKQaR03wAtoKErFJ3uVQsLfqqDAeO+i3
 aAn75yDXdY4fAnbfIHhjbNtdtpkWZdoO5askQ2G53AHaMuSDKdwqhIeSjS0l7rIxnMmAYpxc9jsuM
 srvTiUuyphbfPRcXgslqx9co5PKgRLPmKLug8KZcknJRq6OfGnhUulVCVshKBh8L4AXCAF+R2aXSa
 LQiQYu4fORY7zhZkEu5k727ztNo7vyOEiQHsOvoIxbfpklQauDOPNBGrxfaBxqkAroqXbmMXQYWgB
 jnsS48Gg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53543
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j32Lq-00059M-2P; Sat, 15 Feb 2020 19:39:38 +0100
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
To: Emmanuel Vadot <manu@FreeBSD.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@intel.com, efremov@linux.com, tzimmermann@suse.de,
 sam@ravnborg.org, chris@chris-wilson.co.uk, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-2-manu@FreeBSD.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fa7fef1d-6619-5d2e-6274-6883acfb55d6@tronnes.org>
Date: Sat, 15 Feb 2020 19:39:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200215180911.18299-2-manu@FreeBSD.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMDIuMjAyMCAxOS4wOSwgc2tyZXYgRW1tYW51ZWwgVmFkb3Q6Cj4gRnJvbTogRW1t
YW51ZWwgVmFkb3QgPG1hbnVARnJlZUJTRC5Pcmc+Cj4gCj4gQ29udHJpYnV0b3JzIGZvciB0aGlz
IGZpbGUgYXJlIDoKPiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBE
ZW5pcyBFZnJlbW92IDxlZnJlbW92QGxpbnV4LmNvbT4KPiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPgo+IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBOb3Jh
bGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+Cj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gCj4g
U2lnbmVkLW9mZi1ieTogRW1tYW51ZWwgVmFkb3QgPG1hbnVARnJlZUJTRC5vcmc+Cj4gLS0tCgpB
Y2tlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
