Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2DA26299C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A1C6EA8E;
	Wed,  9 Sep 2020 08:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5B16EA8E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7unpVE96s+T4Tu7Q2uq/miX9ewFXX7Oiot3T3hNf2Q=; b=Zjb5NFyQPFB0hw8s8I0pkAxd0/
 Io7h6hijX8fYtlSP0YDBsAOhNJvZQgo4f/bEIm2qKgE9URt3tmFA3oOe5/BqIGeOAS0zczhmKudxN
 GCOtAG8K8Sowljmq8JJECScYm6SFO5gSYtbgt755L8vvFATXUIfxKZ/VhQ/vPfCBojceFtMPWn++r
 UNcDexf1O0j+D4sDDynLxmaULuPCr3sHC3NM7vPhGLYNswseAnr4PhgVvjyE2t7CfxSYm/GVKGYOD
 ITd8lajLEUxJwF1lQSaFy1v/HzZbkzfoN8AhyjuZrDm3lQ7Z8rrBPTeh7nRmt+5pD/fDUtbcXtLm9
 yV7MM1gw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvBV-0002Lq-0i; Wed, 09 Sep 2020 11:10:29 +0300
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
Date: Wed, 9 Sep 2020 11:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS85LzIwIDI6NDUgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPiAuLi4KPj4gKy8qIFN1Ym1pc3Npb24g
Ki8KPj4gKwo+PiArLyoqIFBhdGNoIGFkZHJlc3Mgb2YgdGhlIHNwZWNpZmllZCBtYXBwaW5nIGlu
IHRoZSBzdWJtaXR0ZWQgZ2F0aGVyLiAqLwo+PiArI2RlZmluZSBEUk1fVEVHUkFfU1VCTUlUX0JV
Rl9XUklURV9SRUxPQwkJKDE8PDApCj4gCj4gU2hvdWxkbid0IHRoZSBrZXJuZWwgZHJpdmVyIGJl
IGF3YXJlIGFib3V0IHdoYXQgcmVsb2NhdGlvbnMgbmVlZCB0byBiZQo+IHBhdGNoZWQ/IENvdWxk
IHlvdSBwbGVhc2UgZXhwbGFpbiB0aGUgcHVycG9zZSBvZiB0aGlzIGZsYWc/Cj4gCgpTdXJlLCB0
aGUga2VybmVsIGtub3dzIGlmIGl0IHJldHVybmVkIHRoZSBJT1ZBIHRvIHRoZSB1c2VyIG9yIG5v
dCwgc28gd2UgCmNvdWxkIHJlbW92ZSB0aGlzIGZsYWcgYW5kIGRldGVybWluZSBpdCBpbXBsaWNp
dGx5LiBJIGRvbid0IHRoaW5rIHRoZXJlIAppcyBtdWNoIGhhcm0gaW4gaXQgdGhvdWdoOyBpZiB3
ZSBoYXZlIHRoZSBmbGFnIGFuIGFwcGxpY2F0aW9uIGNhbiBkZWNpZGUgCnRvIGlnbm9yZSB0aGUg
aW92YSBmaWVsZCBhbmQganVzdCBwYXNzIFdSSVRFX1JFTE9DIGFsd2F5cywgYW5kIGl0J3Mgbm90
IApyZWFsbHkgYW55IGV4dHJhIGNvZGUgb24ga2VybmVsIHNpZGUuCgpNaWtrbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
