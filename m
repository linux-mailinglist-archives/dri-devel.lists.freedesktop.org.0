Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBBD2BBA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350DF6EB4C;
	Thu, 10 Oct 2019 13:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7AC6EB4C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:51:11 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58426
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iIYqT-00083M-Tc; Thu, 10 Oct 2019 15:51:09 +0200
Subject: Re: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Ulf Magnusson <ulfalizer@gmail.com>, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com
References: <20190927174218.GA32085@huvuddator>
 <c3b41a7b-ef3b-7960-13a1-d4b8dd6f15b6@tronnes.org>
Message-ID: <10f6225f-89c0-268e-8ef9-7a6b7c22e911@tronnes.org>
Date: Thu, 10 Oct 2019 15:51:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c3b41a7b-ef3b-7960-13a1-d4b8dd6f15b6@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z9kT8deS5roy+K52zZTsn6tV5HXJkoAJ1yAla/8rmZU=; b=AcworK715AEXg5eIsIVd5jDN9O
 9PJ+TZmcl1xkVfpSlXl+071b3lkDENK0W6/fevePDKMd2zFClxy1B+AAuBIK2/yDAEoNvqGm7XTg2
 zvi768iIkqezp/ohhS9tyfEfrhI6dBtG+o4afnxOUH8ZnYyR2qeuv17yISXpu64CkYd/Hf8poQrb5
 VZuZvyRiEaTtProqjGunHzXDrS8cSuscJAOlRazRz7IvTTwGhdFGDrOwBlaAKw+Ca+vbbv6eZJgRM
 F+mhx8shxX/zzaMGDu5uPExZbH9YSYzJsd/YFWJgxCXtJ/x4kwz0MrNNB7d0nkZXaxhfcpJQndrxB
 DG1+b2vA==;
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
Cc: david@lechnology.com, Jason Gunthorpe <jgg@ziepe.ca>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, tglx@linutronix.de, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDEuMTAuMjAxOSAxMi41OCwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAyNy4wOS4yMDE5IDE5LjQyLCBza3JldiBVbGYgTWFnbnVzc29uOgo+PiBDb21taXQgNTU0YjM1
MjlmZTAxICgidGhlcm1hbC9kcml2ZXJzL2NvcmU6IFJlbW92ZSB0aGUgbW9kdWxlIEtjb25maWcn
cwo+PiBvcHRpb24iKSBjaGFuZ2VkIHRoZSB0eXBlIG9mIFRIRVJNQUwgZnJvbSB0cmlzdGF0ZSB0
byBib29sLCBzbwo+PiBUSEVSTUFMIHx8ICFUSEVSTUFMIGlzIG5vdyBhbHdheXMgeS4gUmVtb3Zl
IHRoZSByZWR1bmRhbnQgZGVwZW5kZW5jeS4KPj4KPj4gRGlzY292ZXJlZCB0aHJvdWdoIEtjb25m
aWdsaWIgZGV0ZWN0aW5nIGEgZGVwZW5kZW5jeSBsb29wLiBUaGUgQyB0b29scwo+PiBzaW1wbGlm
eSB0aGUgZXhwcmVzc2lvbiB0byB5IGJlZm9yZSBydW5uaW5nIGRlcGVuZGVuY3kgbG9vcCBkZXRl
Y3Rpb24sCj4+IGFuZCBzbyBkb24ndCBzZWUgaXQuIENoYW5naW5nIHRoZSB0eXBlIG9mIFRIRVJN
QUwgYmFjayB0byB0cmlzdGF0ZSBtYWtlcwo+PiB0aGUgQyB0b29scyBkZXRlY3QgdGhlIHNhbWUg
bG9vcC4KPj4KPj4gTm90IHN1cmUgaWYgcnVubmluZyBkZXAuIGxvb3AgZGV0ZWN0aW9uIGFmdGVy
IHNpbXBsaWZpY2F0aW9uIGNhbiBiZQo+PiBjYWxsZWQgYSBidWcuIEZpeGluZyB0aGlzIG5pdCB1
bmJyZWFrcyBLY29uZmlnbGliIG9uIHRoZSBrZXJuZWwgYXQKPj4gbGVhc3QuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFVsZiBNYWdudXNzb24gPHVsZmFsaXplckBnbWFpbC5jb20+Cj4+IC0tLQo+IAo+
IFRoYW5rcywgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Lgo+IAoKVGhpcyBoYXMgbm93IGJlZW4g
cXVldWVkIGZvciB0aGUgbmV4dCAtcmMgcHVsbC4KCkRpc2N1c3Npb246IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMTk4MjYvCgpOb3JhbGYuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
