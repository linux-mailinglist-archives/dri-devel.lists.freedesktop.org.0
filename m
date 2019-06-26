Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDE563A5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AEB6E2B6;
	Wed, 26 Jun 2019 07:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2F6E2B1;
 Wed, 26 Jun 2019 07:49:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so1477839wrl.9;
 Wed, 26 Jun 2019 00:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=RIS5OAdSl1g5wuHYioH9lMHrQCerw2WUtGC5ejXxZ7o=;
 b=kSE17EzbyWYQaEgRSN3lMC7QnMGwNTnwdfdNSttGX+hy/kuatouZdSxjI+s/HmWOKw
 H4udfDAXv65sZgCK11GIJ+vPHBaTjtahUpE1mmNPAIXpiIgYFl32bIndQxVK4ATsymsC
 sz7MFDo922ia+wLaEu35JpAt1t5QXo5BkJpVrm1fLLQsAy2wSozy74dJXmQUX66rIRzN
 V5W2wC7iQmdZMHl0eTkGdWJtzyv3+/uXzwnCSslil11n17NTNk/YxqaoOl880ywNUNB1
 TYQclSnnzvw1W4EZF0XcV4OUA64+ZjvdAt85q5RqEYmllAy96AieSZ3DCwyAqRCNqMOi
 qxdA==
X-Gm-Message-State: APjAAAU0f0hllPu2WyjTYvFgogIlEkS1unrzYB1WjfgJidslLHQLlWej
 cjyQeKToIEmuZv6K5jdmi/YX1ZXn
X-Google-Smtp-Source: APXvYqxXFeWFR3nXllfKyaEGag2gpXGKeuOZR6FyiR/B/2d7k4diAI7wIjHCEwwSw7r4bkisD+h/pA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr2395344wrn.204.1561535345313; 
 Wed, 26 Jun 2019 00:49:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c4sm16887637wrt.86.2019.06.26.00.49.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 00:49:04 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v12
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190625124654.122364-1-christian.koenig@amd.com>
 <20190625160539.GB12905@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <819ef4bd-e862-6390-d2e3-60f9d6c9cab4@gmail.com>
Date: Wed, 26 Jun 2019 09:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625160539.GB12905@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RIS5OAdSl1g5wuHYioH9lMHrQCerw2WUtGC5ejXxZ7o=;
 b=jGG+gdQsbnXh4vtVIO+kwqQxwFCpP1foV54fTrcnpQ7l4DuWsXgsPsHkggBFI6fXnw
 4VStGJqqqh9tICSmkmPYuWZgpJL9RW8pXZJEllQ4ngyNG+8JanRKJ5/xQauVriHUrtOQ
 5YEnR/t4bGkpt1s7oZa89B7Ec/saGh4AFhGhJ+uTJhc9c9txpi2a2Sp6cWBOoIcnAH4k
 DzVbRRuNNVbqdwjDo4G9jzqzg81U6XszxnZR0A/Ma9ya6dpBpu7878tiMyLRMbIkWD3U
 4u/dKeAP9s6yLAYvLzTxT3UfmyjOITb3RLTaNmMzr4Uz8vi2LnZtysYymxe2OUQ/kgw/
 faWw==
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
Reply-To: christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMTkgdW0gMTg6MDUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgSnVu
IDI1LCAyMDE5IGF0IDAyOjQ2OjQ5UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IE9uIHRoZSBleHBvcnRlciBzaWRlIHdlIGFkZCBvcHRpb25hbCBleHBsaWNpdCBwaW5uaW5nIGNh
bGxiYWNrcy4gSWYgdGhvc2UKPj4gY2FsbGJhY2tzIGFyZSBpbXBsZW1lbnRlZCB0aGUgZnJhbWV3
b3JrIG5vIGxvbmdlciBjYWNoZXMgc2cgdGFibGVzIGFuZCB0aGUKPj4gbWFwL3VubWFwIGNhbGxi
YWNrcyBhcmUgYWx3YXlzIGNhbGxlZCB3aXRoIHRoZSBsb2NrIG9mIHRoZSByZXNlcnZhdGlvbiBv
YmplY3QKPj4gaGVsZC4KPj4KPj4gT24gdGhlIGltcG9ydGVyIHNpZGUgd2UgYWRkIGFuIG9wdGlv
bmFsIGludmFsaWRhdGUgY2FsbGJhY2suIFRoaXMgY2FsbGJhY2sgaXMKPj4gdXNlZCBieSB0aGUg
ZXhwb3J0ZXIgdG8gaW5mb3JtIHRoZSBpbXBvcnRlcnMgdGhhdCB0aGVpciBtYXBwaW5ncyBzaG91
bGQgYmUKPj4gZGVzdHJveWVkIGFzIHNvb24gYXMgcG9zc2libGUuCj4+Cj4+IFRoaXMgYWxsb3dz
IHRoZSBleHBvcnRlciB0byBwcm92aWRlIHRoZSBtYXBwaW5ncyB3aXRob3V0IHRoZSBuZWVkIHRv
IHBpbgo+PiB0aGUgYmFja2luZyBzdG9yZS4KPj4KPj4gdjI6IGRvbid0IHRyeSB0byBpbnZhbGlk
YXRlIG1hcHBpbmdzIHdoZW4gdGhlIGNhbGxiYWNrIGlzIE5VTEwsCj4+ICAgICAgbG9jayB0aGUg
cmVzZXJ2YXRpb24gb2JqIHdoaWxlIHVzaW5nIHRoZSBhdHRhY2htZW50cywKPj4gICAgICBhZGQg
aGVscGVyIHRvIHNldCB0aGUgY2FsbGJhY2sKPj4gdjM6IG1vdmUgZmxhZyBmb3IgaW52YWxpZGF0
aW9uIHN1cHBvcnQgaW50byB0aGUgRE1BLWJ1ZiwKPj4gICAgICB1c2UgbmV3IGF0dGFjaF9pbmZv
IHN0cnVjdHVyZSB0byBzZXQgdGhlIGNhbGxiYWNrCj4+IHY0OiB1c2UgaW1wb3J0ZXJfcHJpdiBm
aWVsZCBpbnN0ZWFkIG9mIG1hbmdsaW5nIGV4cG9ydGVyIHByaXYuCj4+IHY1OiBkcm9wIGludmFs
aWRhdGlvbl9zdXBwb3J0ZWQgZmxhZwo+PiB2Njogc3F1YXNoIHRvZ2V0aGVyIHdpdGggcGluL3Vu
cGluIGNoYW5nZXMKPj4gdjc6IHBpbi91bnBpbiB0YWtlcyBhbiBhdHRhY2htZW50IG5vdwo+PiB2
ODogbnVrZSBkbWFfYnVmX2F0dGFjaG1lbnRfKG1hcHx1bm1hcClfbG9ja2VkLAo+PiAgICAgIGV2
ZXJ5dGhpbmcgaXMgbm93IGhhbmRsZWQgYmFja3dhcmQgY29tcGF0aWJsZQo+PiB2OTogYWx3YXlz
IGNhY2hlIHdoZW4gZXhwb3J0L2ltcG9ydGVyIGRvbid0IGFncmVlIG9uIGR5bmFtaWMgaGFuZGxp
bmcKPj4gdjEwOiBtaW5pbWFsIHN0eWxlIGNsZWFudXAKPj4gdjExOiBkcm9wIGF1dG9tYXRpY2Fs
bHkgcmUtZW50cnkgYXZvaWRhbmNlCj4+IHYxMjogcmVuYW1lIGNhbGxiYWNrIHRvIG1vdmVfbm90
aWZ5Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBPbmUgdGhpbmcgSSd2ZSBmb3Jnb3R0ZW4sIGp1c3Qgc3R1bWJsZWQgb3Zl
ciB0dG1fYm8tPm1vdmluZy4gRm9yIHBpbm5lZAo+IGJ1ZmZlciBzaGFyaW5nIHRoYXQncyBub3Qg
bmVlZGVkLCBhbmQgSSB0aGluayBmb3IgZHluYW1pYyBidWZmZXIgc2hhcmluZwo+IGl0J3MgYWxz
byBub3QgZ29pbmcgdG8gYmUgdGhlIHByaW1hcnkgcmVxdWlyZW1lbnQuIEJ1dCBJIHRoaW5rIHRo
ZXJlJ3MgdHdvCj4gcmVhc29ucyB3ZSBzaG91bGQgbWF5YmUgbG9vayBpbnRvIG1vdmluZyB0aGF0
IGZyb20gdHRtX2JvIHRvIHJlc3Zfb2JqOgoKVGhhdCBpcyBhbHJlYWR5IHBhcnQgb2YgdGhlIHJl
c3Zfb2JqLiBUaGUgZGlmZmVyZW5jZSBpcyB0aGF0IHJhZGVvbiBpcyAKb3ZlcndyaXRpbmcgdGhl
IG9uZSBpbiB0aGUgcmVzdl9vYmogZHVyaW5nIENTIHdoaWxlIGFtZGdwdSBpc24ndC4KClNvIGZv
ciBhbWRncHUgd2Uga2VlcCBhbiBleHRyYSBjb3B5IGluIHR0bV9iby0+bW92aW5nIHRvIGtlZXAg
dGhlIHBhZ2UgCmZhdWx0IGhhbmRsZXIgZnJvbSB1bm5lY2Vzc2FyeSB3YWl0aW5nIGZvciBhIGZl
bmNlIGluIHJhZGVvbi4KCj4KPiAtIFlvdSBzb3VuZCBsaWtlIHlvdSB3YW50IHRvIHVzZSB0aGlz
IGEgbG90IG1vcmUsIGV2ZW4gaW50ZXJuYWxseSBpbgo+ICAgIGFtZGdwdS4gRm9yIHRoYXQgSSBk
byB0aGluayB0aGUgc2VwZWFyYXRlIGRtYV9mZW5jZSBqdXN0IHRvIG1ha2Ugc3VyZQo+ICAgIHRo
ZSBidWZmZXIgaXMgYWNjZXNzaWJsZSB3aWxsIGJlIG5lZWRlZCBpbiByZXN2X29iai4KPgo+IC0g
T25jZSB3ZSBoYXZlIC0+bW92aW5nIEkgdGhpbmsgdGhlcmUncyBzb21lIGdvb2QgY2hhbmNlcyB0
byBleHRyYWN0IGEgYml0Cj4gICAgb2YgdGhlIGV2aWN0aW9uL3BpcGVsaW5lIGJvIG1vdmUgYm9p
bGVycGxhdGUgZnJvbSB0dG0sIGFuZCBtYXliZSB1c2UgaXQKPiAgICBpbiBvdGhlciBkcml2ZXJz
LiBpOTE1IGNvdWxkIGFscmVhZHkgbWFrZSB1c2Ugb2YgdGhpcyBpbiB1cHN0cmVhbSwgc2luY2UK
PiAgICB3ZSBhbHJlYWR5IHBpcGVsaW5lIGdldF9wYWdlcyBhbmQgY2xmbHVzaCBvZiBidWZmZXJz
LiBPZmMgb25jZSB3ZSBoYXZlCj4gICAgdnJhbSBzdXBwb3J0LCBldmVuIG1vcmUgdXNlZnVsLgoK
SSBhY3R1YWxseSBpbmRlZWQgd2FudGVkIHRvIGFkZCBtb3JlIHN0dWZmIHRvIHRoZSByZXNlcnZh
dGlvbiBvYmplY3QgCmltcGxlbWVudGF0aW9uLCBsaWtlIGZpbmFsbHkgY2xlYW5pbmcgdXAgdGhl
IGRpc3RpbmN0aW9uIG9mIHJlYWRlcnMvd3JpdGVycy4KCkFuZCBjbGVhbmluZyB1cCB0aGUgZmVu
Y2UgcmVtb3ZhbCBoYWNrIHdlIGhhdmUgaW4gdGhlIEtGRCBmb3IgZnJlZWQgdXAgCkJPcy4gVGhh
dCB3b3VsZCBhbHNvIGFsbG93IGZvciBnZXR0aW5nIHJpZCBvZiB0aGlzIGluIHRoZSBsb25nIHRl
cm0uCgpDaHJpc3RpYW4uCgo+Cj4gQW5kIGRvaW5nIHRoYXQgc2xpZ2h0IHNlbWFudGljIGNoYW5n
ZSBpcyBtdWNoIGVhc2llciBvbmNlIHdlIG9ubHkgaGF2ZSBhCj4gZmV3IGR5bmFtaWMgZXhwb3J0
ZXJzL2ltcG9ydGVycy4gQW5kIHNpbmNlIGl0J3MgYSBwdXJlIG9wdC1pbiBvcHRpbWl6YXRpb24K
PiAoeW91IGNhbiBhbHdheXMgZmFsbCBiYWNrIHRvIHRoZSBleGNsdXNpdmUgZmVuY2UpIGl0IHNo
b3VsZCBiZSBlYXN5IHRvCj4gcm9sbCBvdXQuCj4KPiBUaG91Z2h0cyBhYm91dCBtb3ZpbmcgdHRt
X2JvLT5tb3ZpbmcgdG8gcmVzdl9vYmo/IE9mYyBzdHJpY3RseSBvbmx5IGFzIGEKPiBmb2xsb3cg
dXAuIFBsdXMgbWF5YmUgd2l0aCBhIGNsZWFyZXIgbmFtZSA6LSkKPgo+IENoZWVycywgRGFuaWVs
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
