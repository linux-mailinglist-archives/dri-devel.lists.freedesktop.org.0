Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390C7C390
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE5889E2C;
	Wed, 31 Jul 2019 13:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E789E2C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:32:37 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61391
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsoiZ-0001a5-G7; Wed, 31 Jul 2019 15:32:35 +0200
Subject: Re: [PATCH 0/3] drm/tinydrm: Rename to drm/tiny
To: dri-devel@lists.freedesktop.org
References: <20190725105132.22545-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9df09283-111f-1d65-ef60-fc827cabd34b@tronnes.org>
Date: Wed, 31 Jul 2019 15:32:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725105132.22545-1-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=U1fkx90lC5fFrI2WVFZsahnaMeb5ja47EUlft9lAMlU=; 
 b=I2cG6q3pD7T7nzjZIdMIaEQsgsORxY/+1XenEnGGzoTd3kxTHfMpzZvT9mXCxS+6/B9uHM7V11bRLaPeq/2AEtQ1cr3kE8IbJHFuBsPlM5j0X4Mu+mCjaVizga7mRCQ3DjyjH1+GjvAflVI2MOBwRahawMTO+2lI3ivmDqDZVg4QFhsQYudsoWgIftXIZFX4XkvWDnAHNC1SRWYiSGB3nyVnTgWQltHjAlj0Gz0lf8xJoUP+koIXblPoV/32Xcj4p0nZ8SET8e8LizP5VD1zpE9k/lJ7vVY4eai5bx3HggXMgqPlS0w49+vEgN3r2CVC52k8sXSUJn9Yu/13ChtRpw==;
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjUuMDcuMjAxOSAxMi41MSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFRoaXMgaXMg
dGhlIGZpbmFsIHBvbGlzaCBvbiB0aW55ZHJtIHR1cm5pbmcgaXQgaW50byBfdGhlXyBwbGFjZSBm
b3IgdGlueQo+IERSTSBkcml2ZXJzLgo+IAo+IE5vcmFsZi4KPiAKPiBOb3JhbGYgVHLDuG5uZXMg
KDMpOgo+ICAgZHJtL3Rpbnlkcm0vS2NvbmZpZzogUmVtb3ZlIG1lbnVjb25maWcgRFJNX1RJTllE
Uk0KPiAgIGRybS90aW55ZHJtOiBSZW5hbWUgZm9sZGVyIHRvIHRpbnkKPiAgIGRybS9nbTEydTMy
MDogTW92ZSBkcml2ZXIgdG8gZHJtL3RpbnkKPiAKClNlcmllcyBhcHBsaWVkIHRvIGRybS1taXNj
LW5leHQsIHRoYW5rcyBmb3IgcmV2aWV3aW5nLgoKTm9yYWxmLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
