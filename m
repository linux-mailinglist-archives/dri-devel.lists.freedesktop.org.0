Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD861F6BB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CAB89257;
	Wed, 15 May 2019 14:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC63C89257;
 Wed, 15 May 2019 14:40:10 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60955
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hQv4j-0002RL-3E; Wed, 15 May 2019 16:40:09 +0200
Subject: Re: [PATCH v5 07/11] drm/fb-helper: Move out commit code
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-8-noralf@tronnes.org>
 <20190515090944.GC31712@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d9898198-06f0-ee8d-512f-1056568a468e@tronnes.org>
Date: Wed, 15 May 2019 16:40:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515090944.GC31712@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=uEHoETa9O8BqwUawelTCODGKpGbR7m03rDhW5ZMYC9k=; 
 b=sgEPX7NWboh5ZdA2yMmcj17ZdtTViLJgBT2tm363B2qqXsFE97LrM1E6QB6kWIaPocLbg9GowNFguYHPNnAhSRE5cMSxdKnM9WKQUOf+tRycsFvuV7a9hmv3k9j4mmzqj0WRdVJHikZGLkvmvXRpOy0qV/TAWoCR9GEovEuut8fMROlgvLOEcSTBQgtPBuoP4hheXgEojs9IuqXzUHvz3gjUO7nLCt1X75YGAXHwiqxmhTMipwfQeP7VxDnrwOpUajEvpjai3ImeoXKSLQWriuiRvnjrlcoIhMrZbWyieZMgxlqLe5RQtYhmjfpwd7dFQYaykbp5lLKOA93y3w1Pag==;
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMDUuMjAxOSAxMS4wOSwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwODowMTozNVBNICswMjAwLCBOb3JhbGYgVHLD
uG5uZXMgd3JvdGU6Cj4+IE1vdmUgdGhlIG1vZGVzZXQgY29tbWl0IGNvZGUgdG8gZHJtX2NsaWVu
dF9tb2Rlc2V0Lgo+PiBObyBjaGFuZ2VzIGV4Y2VwdCBleHBvcnRpbmcgQVBJLgo+Pgo+PiB2Mjog
TW92ZSB0byBkcm1fY2xpZW50X21vZGVzZXQuYyBpbnN0ZWFkIG9mIGRybV9jbGllbnQuYwo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBS
ZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IAo+IEFzc3VtZXMg
dGhpcyBpcyBhIG9uZS10by1vbmUgY29weS4gSSBkaWQgbm90IGNoZWNrIGl0IGxpbmUtYnktbGlu
ZS4KClllcCwgSSd2ZSBqdXN0IGN1dCBhbmQgcGFzdGVkIG92ZXIgdGhlIGNvZGUuCgo+IFNob3Vs
ZCBnaXQgYmUgYWJsZSB0byB0ZWxsIHRoaXMgd2l0aCBwcm9wZXIgb3B0aW9ucz8KPiAKCk5vIGlk
ZWEsIGdpdCBpcyBhIHZlcnkgdXNlZnVsIGFuZCBwb3dlcmZ1bCB0b29sLCBidXQgSSBrbm93IG9u
bHkgdGhlIGJhc2ljcy4KCj4gCVNhbQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
