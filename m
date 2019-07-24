Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06555728A8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E7C6E471;
	Wed, 24 Jul 2019 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0526E452
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:41:19 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d37fd8d0002>; Tue, 23 Jul 2019 23:41:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 23:41:19 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 23:41:19 -0700
Received: from [10.24.46.79] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jul
 2019 06:41:16 +0000
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
 <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
 <fe7a0f13-4e85-56db-7629-92c6a8f67014@nvidia.com>
 <5281fd84-bbe8-8482-0224-068b87349aaa@gmail.com>
From: Viswanath L <viswanathl@nvidia.com>
Message-ID: <5142f8d7-a387-a556-8209-536439be4925@nvidia.com>
Date: Wed, 24 Jul 2019 12:11:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5281fd84-bbe8-8482-0224-068b87349aaa@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563950477; bh=g96D4ApIOGkTzcjdy6YtT9b/KtR9E/nksr8Tz76ZlKY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=IB4B3//Zn56Hj/tus4pf69WYZzx2eWrV1celvtp+CrKNjYMeOQweQI2Gw+JydwvvF
 i+/KcylKF4DPnfQMaYzyGrtW2vQmR/yfr1SGo/rEPrzT8GaXB+HORffU9Q5d2s64XL
 G3eClMqwnORXr15sf2AAV4d7yaEpbYRoxmHNh9Nuaf7BsJROmNyYjr42clgpqdv+mp
 vhHJ4LaZna1plLDmxgMu05ckg1jVvNEbe6SckH4p5uHUEyozNWFkFjQAbjGeqMt4WC
 gh/LFGuMU6JXntxvDrjP8sZY9lXdKJvEE3T4yEJwh4UV2PcFcORU3TgttBX6L9E4UV
 dLAfmyZu4DixA==
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gRG1pdHJ5LCBJIGhhdmUgcHVzaGVkIG5ldyBwYXRjaCBzZXQgdjMgCihodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3BhdGNoLzExMzU2MDUvKS4gUmVxdWVzdCB5b3UgdG8ga2luZGx5
IHJldmlldy4KClRoYW5rcy4KCk9uIDcvMjMvMjAxOSAzOjQ4IFBNLCBEbWl0cnkgT3NpcGVua28g
d3JvdGU6Cj4gMjMuMDcuMjAxOSAxMzoxMSwgVmlzd2FuYXRoIEwg0L/QuNGI0LXRgjoKPj4gVGhh
bmtzIGZvciB5b3VyIGNvbW1lbnRzLCBEbWl0cnkuIFBsZWFzZSBzZWUgbXkgcmVzcG9uc2VzIGlu
bGluZS4KPj4KPj4gT24gNy8yMy8yMDE5IDY6MDAgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToK
Pj4+IDIyLjA3LjIwMTkgMTI6MjcsIFZpc3dhbmF0aCBMINC/0LjRiNC10YI6Cj4+Pj4gSERNSSBw
bHVnb3V0IGNhbGxzIHJ1bnRpbWUgc3VzcGVuZCwgd2hpY2ggY2xlYXJzIGludGVycnVwdCByZWdp
c3RlcnMKPj4+PiBhbmQgY2F1c2VzIGF1ZGlvIGZ1bmN0aW9uYWxpdHkgdG8gYnJlYWsgb24gc3Vi
c2VxdWVudCBwbHVnaW47IHNldHRpbmcKPj4+PiBpbnRlcnJ1cHQgcmVnaXN0ZXJzIGluIHNvcl9h
dWRpb19wcmVwYXJlKCkgc29sdmVzIHRoZSBpc3N1ZQo+Pj4gSGVsbG8gVmlzd2FuYXRoLAo+Pj4K
Pj4+IEEgZG90IHNob3VsZCBiZSBpbiB0aGUgZW5kIG9mIHNlbnRlbmNlLCBwbGVhc2UuIEFuZCBz
aG91bGQgYmUgYmV0dGVyIHRvCj4+PiBzL3BsdWdpbi9wbHVnLWluLyBpbiB0aGUgY29tbWl0J3Mg
bWVzc2FnZS90aXRsZSBiZWNhdXNlICdwbHVnaW4nIHNvdW5kcwo+Pj4gYXMgYSBub3VuLgo+PiBb
VkxdIFllcywgSSdsbCBtYWtlIHRoZSBhYm92ZSBjaGFuZ2VzLgo+Pj4gUGxlYXNlIGRvbid0IHZl
cnNpb24gcGF0Y2ggYXMgdjIgaWYgdjEgd2Fzbid0IGV2ZXIgc2VudCBvdXQuCj4+IFtWTF0gTm93
IHRoYXQgSSBoYXZlIHNlbnQgdjIsIHNoYWxsIEkgY29udGludWUgd2l0aCB2MiBmb3IgdGhlIG5l
eHQKPj4gcGF0Y2g/IEFwb2xvZ2llcyBmb3IgdGhpcyBvdmVyc2lnaHQuCj4gdjMgc2hvdWxkIGJl
IGdvb2QuCj4KPj4+IFlvdSBzaG91bGQgYWRkIGEgc3RhYmxlIHRhZyBoZXJlIHRvIGdldCBwYXRj
aCBiYWNrcG9ydGVkIGludG8gc3RhYmxlCj4+PiBrZXJuZWwgdmVyc2lvbnM6Cj4+Pgo+Pj4gQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+PiBbVkxdIFllcywgd2lsbCBhZGQuCj4+Pj4gU2ln
bmVkLW9mZi1ieTogVmlzd2FuYXRoIEwgPHZpc3dhbmF0aGxAbnZpZGlhLmNvbT4KPj4+IFRoZSBr
ZXJuZWwgdXBzdHJlYW1pbmcgcnVsZXMgcmVxdWlyZSBhIGZ1bGwgbmFtZS4gSSdtIHByZXR0eSBz
dXJlIHRoYXQgTAo+Pj4gaXNuJ3QgeW91cnMgc3VybmFtZS4KPj4gW1ZMXSBNeSBuYW1lIGFwcGVh
cnMgYXMgIlZpc3dhbmF0aCBMIiBpbiBhbGwgY29tcGFueSByZWNvcmRzIGFuZCBlbWFpbAo+PiBs
aXN0cy4gSSB3b3VsZCBzdHJvbmdseSBwcmVmZXIgdG8ga2VlcCBpdCB0aGlzIHdheSwgdW5sZXNz
IHRoYXQgaXMgYW4KPj4gYWJzb2x1dGUgbm8tbm8uCj4gSSBndWVzcyBpdCBzaG91bGQgYmUgb2th
eSwgYnV0IGEgZnVsbCBuYW1lIGlzIG11Y2ggbW9yZSBwcmVmZXJhYmxlLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
