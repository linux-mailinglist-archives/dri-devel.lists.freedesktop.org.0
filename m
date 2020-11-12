Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A32B175D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B677D6E484;
	Fri, 13 Nov 2020 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1055C6E102
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 18:35:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v20so7358238ljk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=miIu13KxlSOBKHhTLoXa2WQbRM17FuJOoRdz4AkNItI=;
 b=fr5l0fBAq2ZmeoxgV+JJ0kcApWaUf08Oml/ufjfvroOXOng1hAGXJ8QoJUr6kK1NWD
 JtAg0c6r03I0AeN3xAYZ9+driV8BKfbzKasKnmZr7gd5RREdIvP1QRUIzVe8Isq+84JA
 sukx9nHj+EB6o1gERkPJQEN/fBtIcYTB+LqKzcCXZDDUduQHyt8KE5Az/MO4DJacAVj3
 eUgWptNjBAngAg67NqLTZlV39nvaN+Ow9S6EK1j03fiNYUqigSxvS81bVknHd9cZZ9Fu
 R39M4uWekRUVWA9i58vTMBEpb3Nb+TFhFjLkcRxu0kSyXWranJZguS8oKgq90CoL3Vqg
 rpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=miIu13KxlSOBKHhTLoXa2WQbRM17FuJOoRdz4AkNItI=;
 b=es31COXUGiBa2k1br9JpF5jzKFKISm+Weli8mg1avxBJkpavbjMXbNcEIF09W49148
 VVDHloUztKhwow/1FkhFuCFz2ekPme3ue9HXK1Pr+03LDoYoWbTHn6VI8oVTJxocj9JX
 yMOR+iQ22ht10nLRnP9ZOv0RvN6gkEczxYNus+5ORya1n01+030JL2+dQMLr7ufVE1jn
 0/MGccP+hzqQJLnjgmuPriW3VSep+9drWyL7a4kYnPdNvPWBLzklXSyR8Pwcjq1ygHsz
 h0HqGZJRUlMM3oz7mjV1DKwRYNmZ1w3qWMUnnvylCs7ANAcF+LwvPoEqa6Dg+lMOveYO
 UHQg==
X-Gm-Message-State: AOAM532vqXoxlTFZce7W7v/+jJK6CImBKILHkbrNE5Ge4yw7YXJa8jgv
 T65eo253Q1ugBSUMcGchAr0=
X-Google-Smtp-Source: ABdhPJxvidQKpVH9KguGEtW2lNOcIPN6PI+8msmeYNakuq2X2PmLasc5jQ4UbxhPMnfF/riuT73D/g==
X-Received: by 2002:a05:651c:1122:: with SMTP id
 e2mr335918ljo.317.1605206134426; 
 Thu, 12 Nov 2020 10:35:34 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id r9sm767192ljd.23.2020.11.12.10.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 10:35:33 -0800 (PST)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
 <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
 <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
 <0f1c8226-4960-aa35-9436-2361fc8fb6ae@gmail.com>
 <6aad99a9-a9a2-498b-9834-9314a6fa9af6@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b73ea2ff-59c5-929c-ebbc-b7bc25c9105e@gmail.com>
Date: Thu, 12 Nov 2020 21:35:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6aad99a9-a9a2-498b-9834-9314a6fa9af6@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMTEuMjAyMCAxNzo1MywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+IEkgZ3Vl
c3MgZm9yIHRoZSBjaGFubmVsX21hcCB3ZSBjYW4gZHJvcCB0aGUgb2Zmc2V0L2xlbmd0aCwgSSBq
dXN0IHRoaW5rCj4gaXQncyBmYWlybHkgb2J2aW91cyB0aGF0IGFuIElPTU1VIG1hcHBpbmcgQVBJ
IGxldHMgeW91IHNwZWNpZnkgZnJvbQo+IHdoZXJlIGFuZCBob3cgbXVjaCB5b3Ugd2FudCB0byBt
YXAuIFN1cmUsIGl0J3Mgbm90IGEgZnVuY3Rpb25hbGl0eQo+IGJsb2NrZXIgYXMgaXQgY2FuIHNp
bXBseSBiZSBpbXBsZW1lbnRlZCBpbiB1c2Vyc3BhY2UgYnkgc2hpZnRpbmcgdGhlCj4gcmVsb2Mg
b2Zmc2V0IC8gSU9WQSBlcXVpdmFsZW50bHksIGJ1dCBpdCB3aWxsIHJlZHVjZSBJTyBhZGRyZXNz
IHNwYWNlCj4gdXNhZ2UgYW5kIHByZXZlbnQgYWNjZXNzIHRvIG1lbW9yeSB0aGF0IHdhcyBub3Qg
aW50ZW5kZWQgdG8gYmUgbWFwcGVkIHRvCj4gdGhlIGVuZ2luZS4KCkl0IGNvdWxkIGJlIGEgZ29v
ZCBmZWF0dXJlLCBidXQgSSdkIHdhbnQgdG8gc2VlIGhvdyB1c2Vyc3BhY2Ugd2lsbApiZW5lZml0
IGZyb20gdXNpbmcgaXQgaW4gcHJhY3RpY2UgYmVmb3JlIHB1dHRpbmcgZWZmb3J0IGludG8gaXQu
CgpDb3VsZCB5b3UgcGxlYXNlIGdpdmUgZXhhbXBsZXMgb2YgaG93IHRoaXMgZmVhdHVyZSB3aWxs
IGJlIHVzZWZ1bCBmb3IKdXNlcnNwYWNlPyBXaGF0IGlzIHRoZSB1c2UtY2FzZSBmb3IgYWxsb2Nh
dGluZyBhIHNpbmdsZSBidWZmZXIgYW5kIHRoZW4KbWFwcGluZyBpdCBwYXJ0aWFsbHk/IElzIHRo
aXMgbmVlZGVkIGZvciBhIHVzZXJzcGFjZSBtZW1vcnkgcG9vbCBvcgpzb21ldGhpbmcgZWxzZT8K
Ci4uLgo+IEkgYW0gd2VsbCBhd2FyZSBvZiB0aGF0LiBJJ20gbm90IHNheWluZyB0aGF0IHdlIHNo
b3VsZCBjb3B5IHRoZQo+IGRvd25zdHJlYW0gc3RhY2suIEkgYW0gc2F5aW5nIHRoYXQgd2hlbiBk
ZXNpZ25pbmcgYW4gQUJJLCB3ZSBzaG91bGQKPiBjb25zaWRlciBhbGwgaW5mb3JtYXRpb24gYXZh
aWxhYmxlIG9uIHdoYXQga2luZCBvZiBmZWF0dXJlcyB3b3VsZCBiZQo+IHJlcXVpcmVkIGZyb20g
aXQuCj4gCj4gR29pbmcgdGhyb3VnaCB0aGUgcHJvcG9zZWQgVGVncmFEUk0gVUFQSSwgdGhlcmUg
YXJlIHNvbWUgZmVhdHVyZXMgdGhhdAo+IHdvdWxkIHByb2JhYmx5IG5vdCBiZSBpbW1lZGlhdGVs
eSB1c2VkIGJ5IHVzZXJzcGFjZSwgb3Igc3VwcG9ydGVkIGluIGEKPiBub24tTk9PUCBmYXNoaW9u
IGJ5IHRoZSBrZXJuZWw6Cj4gKiBNYXAgb2Zmc2V0L2xlbmd0aAo+ICogSU9WQSBvZiBtYXBwaW5n
Cj4gKiBDcmVhdGlvbiBvZiBzeW5jX2ZpbGUgcG9zdGZlbmNlCj4gKiBXYWl0aW5nIGZvciBzeW5j
X2ZpbGUgcHJlZmVuY2VzCj4gKiBTVUJNSVRfQ09OVEVYVF9TRVRVUCBmbGFnCj4gKiBIYXZpbmcg
dHdvIHN5bmNwdF9pbmNycwo+ICogUmVzZXJ2YXRpb25zPwo+IAo+IEkgc3VwcG9zZSB3ZSBjYW4g
cmVtb3ZlIGFsbCBvZiB0aGF0IGZvciBub3csIGFzIGxvbmcgYXMgd2UgZW5zdXJlIHRoYXQKPiB0
aGVyZSBpcyBhIHBhdGggdG8gYWRkIHRoZW0gYmFjay4gSSdtIGp1c3QgYSBiaXQgY29uY2VybmVk
IHRoYXQgd2UnbGwKPiBlbmQgdXAgd2l0aCAxMCBkaWZmZXJlbnQgQUJJIHJldmlzaW9ucyBhbmQg
dXNlcnNwYWNlIHdpbGwgaGF2ZSB0byBkbyBhCj4gdmVyc2lvbiBkZXRlY3Rpb24gZGFuY2UgYW5k
IGVuYWJsZSB0aGluZ3MgZGVwZW5kaW5nIG9uIGRyaXZlciB2ZXJzaW9uLgo+IAo+IEFueXRoaW5n
IGVsc2UgdG8gcmVtb3ZlPwoKSSBndWVzcyBpdCBzaG91bGQgYmUgZW5vdWdoIGZvciBub3cuCgpS
ZXNlcnZhdGlvbnMgYXJlIG5lZWRlZCBmb3IgdGhlIGdyYXRlIGRyaXZlcnMsIGJ1dCB0aGV5IG5l
ZWQgdG8gYmUgZG9uZQppbiBjb25qdW5jdGlvbiB3aXRoIHRoZSBEUk0gc2NoZWR1bGVyLiBJIGd1
ZXNzIGl0IHNob3VsZCBiZSBmaW5lIGlmCnlvdSdsbCByZW1vdmUgcmVzZXJ2YXRpb25zLCBJJ2xs
IHRoZW4gdGFrZSBhIGxvb2sgYXQgaG93IHRvIGludGVncmF0ZQp0aGVtIGFuZCBkcm0tc2NoZWQg
b24gdG9wIG9mIHlvdXJzIGNoYW5nZXMuCgo+IFJlZ2FyZGluZyB0aGluZ3MgbGlrZSBleHBsaWNp
dCBjaGFubmVsX21hcCwgc3VyZSwgd2UgY291bGQgbWFwIHRoaW5ncwo+IGltcGxpY2l0bHkgYXQg
c3VibWl0IHRpbWUsIGJ1dCBpdCBpcyBhIGh1Z2UgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb24K
PiBuZXdlciBjaGlwcywgYXQgbGVhc3QuIFNvIHRlY2huaWNhbGx5IHVzZXJzcGFjZSBkb2Vzbid0
IG5lZWQgaXQsIGJ1dAo+IGdvaW5nIGJ5IHRoYXQgYXJndW1lbnQsIHdlIGNhbiBnZXQgcmlkIG9m
IGEgbG90IG9mIGtlcm5lbCBmdW5jdGlvbmFsaXR5Cj4gLS0gYWZ0ZXIgYWxsLCBpdCdzIG9ubHkg
bmVlZGVkIGlmIHlvdSB3YW50IHlvdXIgaGFyZHdhcmUgdG8gcGVyZm9ybSB3ZWxsLgoKSSBoYXZl
IG5vIGRvdWJ0IHRoYXQgaXQncyBiZXR0ZXIgdG8gaGF2ZSBzdGF0aWMgbWFwcGluZ3MsIGJ1dCBp
dCdzIG5vdApvYnZpb3VzIGhvdyBpdCBzaG91bGQgYmUgaW1wbGVtZW50ZWQgd2l0aG91dCBzZWVp
bmcgYSBmdWxsIHBpY3R1cmUuIEkKbWVhbiB0aGF0IG1heWJlIGl0IGNvdWxkIGJlIHBvc3NpYmxl
IHRvIGF2b2lkIGhhdmluZyB0aGVzZSBzcGVjaWFsCklPQ1RMcyBieSBjaGFuZ2luZyB0aGUgd2F5
IG9mIGhvdyBoYXJkd2FyZSBpcyBleHBvc2VkIHRvIHVzZXJzcGFjZSBzdWNoCnRoYXQgZ2VuZXJp
YyBVQVBJIGNvdWxkIGJlIHVzZWQgaW4gb3JkZXIgdG8gYWNoaWV2ZSB0aGUgc2FtZSBnb2Fscy4K
Ci4uLgo+IElmIGl0IGlzIGtub3duIHRvIGRlYWRsb2NrLCB3ZSBzaG91bGQgZml4IGl0LiBJbiBh
bnkgY2FzZSwgd2hpY2gga2luZCBvZgo+IHNjaGVkdWxlciBpcyB1c2VkIHNob3VsZG4ndCBhZmZl
Y3QgdGhlIEFCSSwgYW5kIHdlIGFscmVhZHkgaGF2ZSBhCj4gZnVuY3Rpb25hbCBpbXBsZW1lbnRp
b24gaW4gdGhlIEhvc3QxeCBkcml2ZXIsIHNvIHdlIHNob3VsZCBtZXJnZSB0aGUgQUJJCj4gZmly
c3QgcmF0aGVyIHRoYW4gd2FpdCBmb3IgYW5vdGhlciB5ZWFyIHdoaWxlIHRoZSByZXN0IG9mIHRo
ZSBkcml2ZXIgaXMKPiByZWRlc2lnbmVkIGFuZCByZXdyaXR0ZW4uCgpQZXJoYXBzIHNob3VsZCBi
ZSBmaW5lIHRvIHN0YXJ0IGV4dGVuZGluZyB0aGUgQUJJLCBidXQgdGhlbiBpdCBzaG91bGQKc3Rh
eSB1bmRlciBEUk1fVEVHUkFfU1RBR0lORyB1bnRpbCB3ZSB3aWxsIGJlIGNvbmZpZGVudCB0aGF0
IGl0J3MgYWxsIGdvb2QuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
