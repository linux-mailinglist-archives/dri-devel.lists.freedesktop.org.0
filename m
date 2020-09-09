Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A27262A98
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41B26EAD1;
	Wed,  9 Sep 2020 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259A06EAD1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yoGI2txn64gsAVVnDofePE+LRxZjRbFKYHuVddNt/tg=; b=FVhqr7Uwcz9R5pFfUpreqPH5RQ
 79+aVCLV0r41wYvm22Uc+EkqzNo2AFGECxGD7Cu633DcxfNP1AdvDM4nWK/ez8grB83MTU1EX08PR
 RACBsjalyxUx/rjdUz3xgfXtp5sZI1kVhfM+mqDAFJ34mDRsbFYgOx8I2pXvbAyqX47HyK+Rulf8k
 GSJg2u8B+fCGllQMIW0rHgD3lgKguSoph0AnzZG4Wt2ieNZTrCpqbzAd09dnp0hI9ysMl8UBFxXLy
 uhFFV4eE8R2nGYxmGpdWUwCAS9JVguATklG1bVFm9BTmUm7GZD4ISNxvRnHJKwoOF51a7ugZenC0S
 oizxc9qg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvf4-000086-CE; Wed, 09 Sep 2020 11:41:02 +0300
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <81c4020b-38d5-b94b-5919-b988341aee72@kapsi.fi>
Date: Wed, 9 Sep 2020 11:40:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
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

T24gOS85LzIwIDI6MzYgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4gSGkgYWxsLAo+Pgo+PiBoZXJlJ3Mg
YSBzZWNvbmQgcmV2aXNpb24gb2YgdGhlIEhvc3QxeC9UZWdyYURSTSBVQVBJIHByb3Bvc2FsLAo+
PiBob3BlZnVsbHkgd2l0aCBtb3N0IGlzc3VlcyBmcm9tIHYxIHJlc29sdmVkLCBhbmQgYWxzbyB3
aXRoCj4+IGFuIGltcGxlbWVudGF0aW9uLiBUaGVyZSBhcmUgc3RpbGwgb3BlbiBpc3N1ZXMgd2l0
aCB0aGUKPj4gaW1wbGVtZW50YXRpb246Cj4gQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHRoZSBj
dXJyZW50IHN0YXR1cyBvZiB0aGUgRE1BIGhlYXBzLiBBcmUgd2UKPiBzdGlsbCBnb2luZyB0byB1
c2UgRE1BIGhlYXBzPwo+IAoKU29ycnksIHNob3VsZCBoYXZlIG1lbnRpb25lZCB0aGUgc3RhdHVz
IGluIHRoZSBjb3ZlciBsZXR0ZXIuIEkgc2VudCBhbiAKZW1haWwgdG8gZHJpLWRldmVsIGFib3V0
IGhvdyBETUEgaGVhcHMgc2hvdWxkIGJlIHVzZWQgLS0gSSBiZWxpZXZlIHRoZSAKY29uY2x1c2lv
biB3YXMgdGhhdCBpdCdzIG5vdCBlbnRpcmVseSBjbGVhciwgYnV0IGRtYS1idWZzIHNob3VsZCBv
bmx5IGJlIAp1c2VkIGZvciBidWZmZXJzIHNoYXJlZCBiZXR3ZWVuIGVuZ2luZXMuIFNvIGZvciB0
aGUgdGltZSBiZWluZywgd2UgCnNob3VsZCBzdGlsbCBpbXBsZW1lbnQgR0VNIGZvciBpbnRyYS1U
ZWdyYURSTSBidWZmZXJzLiBUaGVyZSBzZWVtcyB0byBiZSAKc29tZSBwbGFubmluZyBvbmdvaW5n
IHRvIHNlZSBpZiB0aGUgZGlmZmVyZW50IHN1YnN5c3RlbSBhbGxvY2F0b3JzIGNhbiAKYmUgdW5p
ZmllZCAoc2VlIGRtYS1idWYgaGVhcHMgdGFsayBmcm9tIGxpbnV4IHBsdW1iZXJzIGNvbmZlcmVu
Y2UpLCBidXQgCmZvciBub3cgd2Ugc2hvdWxkIGdvIGZvciBHRU0uCgpNaWtrbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
