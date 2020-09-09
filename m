Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F58A262A73
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222E66E270;
	Wed,  9 Sep 2020 08:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B446E270
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pk2LTrKd0ce3vCvtIx9c6np0i8syA+h7+MF5oX4G0fw=; b=zWdpz9FlYlc6dR8Jq3Jg9TBkFL
 Vf3IA4MdsX9vsNgzCmVHPSwgZIDm8IR1bDjCDXuEe7NGVENGXJA/AFiEQ6+O/8HBbQn/xAxSws5bW
 Y99JgpaEH/VWWMhVx1MZqWBiUpSENpWQZsNGab0wKkIvhclFNw55nJlimELMvNRs2+Y/BnH4Ll5ty
 8u5NDLkrUSgUDRydeug/qwwp192nGjcMps7Q5hGAdZLd26sYovDSMmhacEGWCJTru2BwiKsABGU2S
 fQ74P97u8sNek2VBO5uDGLaPXOmlxpiNPtwHWEd6BVZ58b0ScMfFmSkrGA3D5IambKUpoJE+MhM30
 j+iZeg+Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvbC-0006fS-FA; Wed, 09 Sep 2020 11:37:02 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
Date: Wed, 9 Sep 2020 11:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
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

CgpPbiA5LzkvMjAgNTozNCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDA5LjA5LjIwMjAg
MDU6MTAsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+PiAwNS4wOS4yMDIwIDEzOjM0LCBN
aWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+ICsJam9iLT50aW1lb3V0ID0gbWluKGFyZ3Mt
PnRpbWVvdXRfdXMgLyAxMDAwLCAxMDAwMFUpOwo+Pj4gKwlpZiAoam9iLT50aW1lb3V0ID09IDAp
Cj4+PiArCQlqb2ItPnRpbWVvdXQgPSAxOwo+Pgo+PiBjbGFtcCgpCj4+CgpXaWxsIGZpeC4KCj4g
Cj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGhhdmUgdGltZW91dCBpbiBtaWNyb3NlY29uZHM/Cj4g
CgpOb3Qgc3VyZSwgYnV0IGJldHRlciBoYXZlIGl0IGEgYml0IG1vcmUgZmluZS1ncmFpbmVkIHJh
dGhlciB0aGFuIApjb2Fyc2UtZ3JhaW5lZC4gVGhpcyBzdGlsbCBnaXZlcyBhIG1heGltdW0gdGlt
ZW91dCBvZiA3MSBtaW51dGVzIHNvIEkgCmRvbid0IHRoaW5rIGl0IGhhcyBhbnkgbmVnYXRpdmVz
IGNvbXBhcmVkIHRvIG1pbGxpc2Vjb25kcy4KCk1pa2tvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
