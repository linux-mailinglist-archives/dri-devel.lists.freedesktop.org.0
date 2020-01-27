Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7414A46D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 14:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E100F6EB86;
	Mon, 27 Jan 2020 13:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0B6EB86
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ebxf8Ake6E/PMxqisT9f7wglajK8biG5Xfp139wM2aw=; b=jSy4VuQ5DnL3Or2sra4fEuWK55
 xzjNeB3Hzts5PmdHsahAyWJkKCF1eo5OcuLUqXbEEAsF0R+e2GFTqhn6kZvlM4d7tsKIxmAe5CXFJ
 +W/sKDBTcff5uTctqUDLSBNvsfTxDK2iVKm5ca7QqUcmWoGq+t+wWKXnI53WuCxPPVc2wzAH2gApv
 7U1/eF/+V0jiU+E9AVWE9XJt8SjuhTQpN2N+KzBsyZXkJVjFIcY1LxiArNzVbwaBeN3vYIY2Xxibj
 DjOcAJ5wupAlEfFVBgd09OG3wjXkbrwRhLRXfnjgs0E8/75E2IibJmBDy/va1f/UFboclfu4Rlj+T
 uMre75Jg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62163
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iw43h-00057x-1i; Mon, 27 Jan 2020 14:04:05 +0100
Subject: Re: [PATCH v2 2/2] drm/tinydrm: add support for tft displays based on
 ilitek,ili9486
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
 <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580059987.git.kamlesh.gurudasani@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <54c01afa-f6c6-a367-ef69-0e37343f2a9e@tronnes.org>
Date: Mon, 27 Jan 2020 14:04:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580059987.git.kamlesh.gurudasani@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjYuMDEuMjAyMCAxOC40Miwgc2tyZXYgS2FtbGVzaCBHdXJ1ZGFzYW5pOgo+IFRoaXMg
YWRkcyBzdXBwb3J0IGZvdCBpbGl0ZWssaWxpOTQ4NiBiYXNlZCBkaXNwbGF5cyB3aXRoIHNoaWZ0
IHJlZ2lzdGVyCj4gaW4gZnJvbnQgb2YgY29udHJvbGxlci4KPiBPenptYWtlcixQaXNjcmVlbiBh
bmQgV2F2ZXNoYXJlLHJwaS1sY2QtMzUgYXJlIHN1Y2ggZGlzcGxheXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogS2FtbGVzaCBHdXJ1ZGFzYW5pIDxrYW1sZXNoLmd1cnVkYXNhbmlAZ21haWwuY29tPgo+
IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoK
SSdsbCBhcHBseSB0aGUgc2VyaWVzIHdoZW4gdGhlIGJpbmRpbmcgaXMgYWNjZXB0ZWQuCgpOb3Jh
bGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
