Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F37BAE0E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16706E0F8;
	Mon, 23 Sep 2019 06:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31CB6FE11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 22:55:37 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.90]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMbO-1iNZIV2E0C-00EKWI; Sat, 21
 Sep 2019 00:55:23 +0200
Subject: Re: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM
 driver instead of firmware."
To: Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
References: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
 <09f15af6-a849-a5eb-ac39-f4cdb07ebfb9@gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
Message-ID: <3b5db3d9-147b-6cbe-a3be-16569b5fa5b0@gmx.net>
Date: Sat, 21 Sep 2019 00:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <09f15af6-a849-a5eb-ac39-f4cdb07ebfb9@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:fvhcLD5NIXoijsnJbghoo73iDEDtCLM7Oh+qleIkLeb3h9niSfO
 0wsgJf0BMb1IqJfXSpk9EOsD6qIGQC/bQYWnAnWEbr8pRuCxWcj2XZg7hpovodcHsco7SGL
 PpzmESTGMs87zGwuwB2NnQ461gmxw7mfFRDDftU7fBaMogkzwtpjD51Gn14I5oQJcJaJjnm
 D5LKHnEU5mWFJ51PvyLgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oGkxg6wEmkY=:UTTqj+UGIQ/jKVxdAI6upI
 f52frNj8xcvkOpGY2YZquOhvfG9p7CmL5pV+VmsTHYQQclc0llluyw0JRyKDmyY9UgbelUXn7
 yaN6FBb7ORlvVbe9LmjDhLEDYNuOU61hRaOW3b/7LUm1qmLq5Og+0Ml9wqvzLRMhu3bRYmbRS
 MQLRj6W+SEPQxBp/CxAIj98ShQFEWiOs3XpVCUz7EVt2zcnKz6zbMxKZRLE5KtaG/dmjmAeqb
 d1lene6LwfVLetV/29jKpEQOlbjiktJCZwi/EWzW9Y2KISKs5Tx/Oi+9Wg6jM/4NEv/vOzvKw
 ehaAVQnQLrYVxD1FMdr5PtbGhsc8r7Nm0+IXLPw1n+cPIFc4B8nvNpt/baUl9ZmIiP4NuNOJ/
 DXXp01j4UGc54lyVeCAgKPvDJYTewq58eZuthTm+eVAFGSWRNbY4IbYIL+Cm5u0Zu/oHQLrQN
 lv8ymHuJUl4+0iL6wKZme83zMfQpWvD7D0MoNQ2cBuHTv+xrN2020fGc+eIHgGkC5rcZrHkR6
 JmlgETDL5ILhdkVU4w5Cw0FxLAr5nzS3KW+rVH3iAUEVMwpNERo2MheQ5bB4rCCm183Hc2QTF
 1+RgGWXW5w/RKtS6UMIn2xiV6+bgwBFjHt2jc9tnEuF1iiFLAZwEImAlDbpisoBArXuJuWrGg
 8H8Cfz43UFJIqTarQytvu4Xzc2uOfAtzU3kVblKbzTxUibQIaKI8spaBBlK/sQJWjxyT+tDUV
 lKPLUbmOJi5A85r7fNUcU8KWo5DHVXZVRxdRAP6/r5Gqzf7IBvisIB7R5kS4GYLNOx/sm0TLh
 pIqC/lzuHhovlVX3EM05AElKuPS8kiO818jGhaPIrCf8Tm+0I0J/qz9JoR86YMl/RpCT48nVl
 NeLhQs1jdvNY6xEsbd38wq23uj/6dFfCYTLWLg9wKvj6WeUkNOF2sOHKbiSNTgxoa+SDeoAm7
 fvzu1j4Bbl1o10sVcPm6zTpUy/c9K3GcpiUZsEjjY1mkMFTtlVv4mZik20oOCGCFxXhAb51+7
 wYJULKJpqOfyo3jHuZZ1CqLFWEvp6xtH4XzSbrJW9HCfadWHCf1Z7SfJBXDeXZsyt43W/Pq44
 pIAGu8HxtI5DDTopkUegy26Luis1AjbHl+uIZSMbwKc9iZIFGBnV1XvaHPjptJ0RRjhhdl5me
 rVKeoAHKcFrGRoyX7deeYi2DM8G+XJi2FxZRPc6lT5HD/bJeUc22K9Sx6Ld2RUmzh+tSOLbWR
 xXRhWX9z6KucEV/wma4U/AMtFTEOsQGKbiJlyU9KxeUOc4XdrNnN/RiIjcJI=
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1569020123;
 bh=fg+Fhu6V5VJyuACGUBLseXFjv2kSmmWXdJJcK6kyNNY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=gKJUcSTOAUmRIRlqF0chMUVnkrHWKQcJ1D9WFftnxHSmTtH5vy+iIofPK6i8Oxw4s
 QFBEwkr9HpJlANo0lk/+Bn7LmNdiIz+meEpt5xTKVHBcTqh8fRjpYJkZ8kd2YhDpLu
 BmCgQyASHJHhZCeq4KDW/n15Q4IRATP5YyJ1Y85I=
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
Cc: stable@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmxvcmlhbiwKCkFtIDIwLjA5LjE5IHVtIDE5OjUyIHNjaHJpZWIgRmxvcmlhbiBGYWluZWxs
aToKPiBPbiA5LzgvMTkgODo0NCBBTSwgU3RlZmFuIFdhaHJlbiB3cm90ZToKPj4gU2luY2UgcmVs
ZWFzZSBvZiB0aGUgbmV3IEJDTTI4MzUgUE0gZHJpdmVyIHRoZXJlIGhhcyBiZWVuIHNldmVyYWwg
cmVwb3J0cwo+PiBvZiBWM0QgcHJvYmluZyBpc3N1ZXMuIFRoaXMgaXMgY2F1c2VkIGJ5IHRpbWVv
dXRzIGR1cmluZyBwb3dlcmluZy11cCB0aGUKPj4gR1JBRlggUE0gZG9tYWluOgo+Pgo+PiAgIGJj
bTI4MzUtcG93ZXI6IFRpbWVvdXQgd2FpdGluZyBmb3IgZ3JhZnggcG93ZXIgT0sKPj4KPj4gSSB3
YXMgYWJsZSB0byByZXByb2R1Y2UgdGhpcyByZWxpYWJsZSBvbiBteSBSYXNwYmVycnkgUGkgM0Ir
IGFmdGVyIHNldHRpbmcKPj4gZm9yY2VfdHVyYm89MSBpbiB0aGUgZmlybXdhcmUgY29uZmlndXJh
dGlvbi4gU2luY2UgdGhlcmUgYXJlIG5vIGlzc3Vlcwo+PiB1c2luZyB0aGUgZmlybXdhcmUgUE0g
ZHJpdmVyIHdpdGggdGhlIHNhbWUgc2V0dXAsIHRoZXJlIG11c3QgYmUgYW4gaXNzdWUKPj4gaW4g
dGhlIEJDTTI4MzUgUE0gZHJpdmVyLgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGhhc24ndCBi
ZWVuIG11Y2ggcHJvZ3Jlc3MgaW4gaWRlbnRpZnlpbmcgdGhlIHJvb3QgY2F1c2UKPj4gc2luY2Ug
SnVuZSAobW9zdGx5IGluIHRoZSBsYWNrIG9mIGRvY3VtZW50YXRpb24pLCBzbyBpIGRlY2lkZWQg
dG8gc3dpdGNoCj4+IGJhY2sgdW50aWwgdGhlIGlzc3VlIGluIHRoZSBCQ00yODM1IFBNIGRyaXZl
ciBpcyBmaXhlZC4KPj4KPj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xp
bnV4L2lzc3Vlcy8zMDQ2Cj4+IEZpeGVzOiBlMWRjMmIyZTFiZWYgKCIgQVJNOiBiY20yODN4OiBT
d2l0Y2ggVjNEIG92ZXIgdG8gdXNpbmcgdGhlIFBNIGRyaXZlciBpbnN0ZWFkIG9mIGZpcm13YXJl
LiIpCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
biBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+Cj4gRG8geW91IHdhbnQgbWUgdG8gcGljayB1cCB0
aGlzIGNoYW5nZSBkaXJlY3RseSwgb3Igd291bGQgeW91IHdhbnQgdG8KPiBpc3N1ZSBhIHB1bGwg
cmVxdWVzdCBmb3IgNS40LXJjWCB3aXRoIG90aGVyIGZpeGVzPwoKdGhlcmUgYXJlbid0IGFueSBv
dGhlciBmaXhlcywgcGxlYXNlIHBpY2sgdXAgdGhpcyBkaXJlY3RseS4KClRoYW5rcwoKU3RlZmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
