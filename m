Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227234D42A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5593689B9E;
	Mon, 29 Mar 2021 15:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D330C89B9E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:42:27 +0000 (UTC)
Date: Mon, 29 Mar 2021 15:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617032545;
 bh=2/L+rxb2brglmePjN5EhVd44vXZ9B62TDl2wMhMnNvM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=pzfGQ01zvflujGIEayX0OMJGoqbj7T9F30YdUsKOtGTni+fq2VFO81AFwyLk2vmIw
 E3wPDQ8qv3nSqR+aF0dh1jyiJ5LHMGoAJ/Lhss4H/G2ggIqEXCWQGc/CxN0/cZlxmV
 gB9gFcffeTgLCHaadQC0G+SuirYDb/fi8vLmCf30Wuc3aSlAG1bRtEq9gNeipa+QBw
 bb9XaugILBIQSk+41KfSEkGS+kD1R8ZQvCLDuvlMBRUqk9MHOoQwvlDEPrCpDlRJi7
 O7ysdoQ53KcthccIw+ELEIW/Ft/WPc4Is1BM9JIG/w/V10cqeuX/EcIXqIpf1hEh8p
 9MVixi+OMnckQ==
To: Paul Cercueil <paul@crapouillou.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <rExcDgzsvu0kmMtp6ujD3gpKLXeYz121Dzm8yJrZOvv1A6IJkB9sTBGFcJHQTCTvAGmcrZ79bdD78ZYUeK3el868UYXTK46dkKnmlpQkj4Y=@emersion.fr>
In-Reply-To: <25MQQQ.YYKN0GE2YPZN1@crapouillou.net>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
 <S1LQQQ.K5HO8ISMBGA02@crapouillou.net>
 <20210329153541.a3yil2aqsrtf2nlj@gilmour>
 <25MQQQ.YYKN0GE2YPZN1@crapouillou.net>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, od@zcrc.me,
 Maxime Ripard <maxime@cerno.tech>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBNYXJjaCAyOXRoLCAyMDIxIGF0IDU6MzkgUE0sIFBhdWwgQ2VyY3VlaWwgPHBh
dWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKCj4gT2ssIEkgcmVhZCB0aGF0IGFzICJhbGwgZHJp
dmVycyBzaG91bGQgcHJvdmlkZSBBVCBMRUFTVCBvbmUgcHJpbWFyeQo+IHBsYW5lIHBlciBDUlRD
IiwgYW5kIG5vdCBhcyAiYWxsIGRyaXZlcnMgc2hvdWxkIHByb3ZpZGUgT05FIEFORCBPTkxZCj4g
T05FIHByaW1hcnkgcGxhbmUgcGVyIENSVEMiLiBNeSBiYWQuCgpZZWFoLCBpdCdzIGEgbGl0dGxl
IGNvbXBsaWNhdGVkIHRvIGRvY3VtZW50LCBiZWNhdXNlIGl0J3MgcG9zc2libGUgZm9yCmEgcHJp
bWFyeSBwbGFuZSB0byBiZSBjb21wYXRpYmxlIHdpdGggbXVsdGlwbGUgQ1JUQ3PigKYgV2UgdHJp
ZWQgdG8KaW1wcm92ZSB0aGlzIFsxXSByZWNlbnRseS4KClsxXTogaHR0cHM6Ly9kcmkuZnJlZWRl
c2t0b3Aub3JnL2RvY3MvZHJtL2dwdS9kcm0ta21zLmh0bWwjcGxhbmUtYWJzdHJhY3Rpb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
