Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2530711D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687BE6E943;
	Thu, 28 Jan 2021 08:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05E89F08
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 22:06:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a12so4901722lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w4UzLpV8aeIvghlGpXTYskzYBALzwvbsPewbvs0UWB0=;
 b=uNq31EBc1MHV0VcDHLVub0/i7Z0pS7OB6tHn+5pTo84LYs/r3KMtS4mMF8gIz4LLFr
 zvY7T5uSQzlMCMno0ehRnLiXn7tlOMOinIuzEBj2Fj8lu6Wgsnr0tnDFL508TuNCyeEC
 WULq60W87WJpMkIrstv+cRNPep7QZDxwOLv/tPzJaQuE51hllbFhGDoZ/ttRseH1ncZd
 B74YRxJz9ClvpUST0oi6e3mQxj3HhrznXBzfV+ZhPuOUkj/Emk/CHYSq1HqjkU5vwiha
 V2jCjSQotlcN6VWu+3A6Z0IHJkKLz4LhAEMTYb0sftPB+FOYQu/Js/3ljPEMN/4NpMOI
 5Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w4UzLpV8aeIvghlGpXTYskzYBALzwvbsPewbvs0UWB0=;
 b=XHLrSwD3MzHZdmjDNB+FNiQakBVTGgpWcKtagz6gaQ6v//zdNCvoflx5LJLGYt3JTb
 fsoVDFSiyTJePQ0Fd1Y9VdjdVPzxMAv/sBLOuC7kiH3irmluUHpyXBKQj1JAO5PCihpb
 OA5MH0ZkG4wBdvhkmnf9m3E0RCmASqwrsNDoSq2FyebYcZ9dGW6QpWRz83iHpSxGuCJe
 J0WxH/tWghDzuHiV0jZMNOyU03BfaV99AB8japHrDgSrlyV2EVyBYpt5cZDZm4AUs7s9
 ydAT2+cnhv9Z9Uucd7PkMuGleLUwp+2WCjCptfpFrP5Ju46i6mGkZjuDerGB0LLuCvRB
 XukA==
X-Gm-Message-State: AOAM532bMUvs7/P9Cvf4QOz9eYHLIky11MQaS+Kl3VerIcPS1/DIiOoL
 CmDOsZN+4UNMO4QEfV4jUJs9YNwYYjc=
X-Google-Smtp-Source: ABdhPJw1hofd9fLlol38qlFI48ZZMLmBA4ldPwxc4kQMLljkdKlyBtH4c1m0aYzMiMFzZG9cLI0u3A==
X-Received: by 2002:a05:6512:224f:: with SMTP id
 i15mr6174387lfu.545.1611785206351; 
 Wed, 27 Jan 2021 14:06:46 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id 24sm848983lfy.32.2021.01.27.14.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:06:45 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
 <9f755e95-97fc-4f57-5e8d-426af589c857@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <007d123f-526a-c68a-3c52-aba165172cdf@gmail.com>
Date: Thu, 28 Jan 2021 01:06:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <9f755e95-97fc-4f57-5e8d-426af589c857@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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

MjguMDEuMjAyMSAwMDo1NywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gCj4gCj4gT24g
MS8yNy8yMSAxMToyNiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyNi4wMS4yMDIxIDA1
OjQ1LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+PiA1LiBUaGUgaGFyZHdhcmUgc3Rh
dGUgb2Ygc3luYyBwb2ludHMgc2hvdWxkIGJlIHJlc2V0IHdoZW4gc3luYyBwb2ludCBpcwo+Pj4+
IHJlcXVlc3RlZCwgbm90IHdoZW4gaG9zdDF4IGRyaXZlciBpcyBpbml0aWFsaXplZC4KPj4+Cj4+
PiBUaGlzIG1heSBiZSBkb2FibGUsIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGNyaXRpY2FsIGZv
ciB0aGlzIFVBUEksIHNvCj4+PiBsZXQncyBjb25zaWRlciBpdCBhZnRlciB0aGlzIHNlcmllcy4K
Pj4+Cj4+PiBUaGUgdXNlcnNwYWNlIHNob3VsZCBhbnl3YXkgbm90IGJlIGFibGUgdG8gYXNzdW1l
IHRoZSBpbml0aWFsIHZhbHVlIG9mCj4+PiB0aGUgc3luY3BvaW50IHVwb24gYWxsb2NhdGlvbi4g
VGhlIGtlcm5lbCBzaG91bGQgc2V0IGl0IHRvIHNvbWUgaGlnaAo+Pj4gdmFsdWUgdG8gY2F0Y2gg
YW55IGlzc3VlcyByZWxhdGVkIHRvIHdyYXBhcm91bmQuCj4+Cj4+IFRoaXMgaXMgY3JpdGljYWwg
YmVjYXVzZSBtaW4gIT0gbWF4IHdoZW4gc3luYyBwb2ludCBpcyByZXF1ZXN0ZWQuCj4gCj4gVGhh
dCBJIHdvdWxkIGp1c3QgY29uc2lkZXIgYSBidWcsIGFuZCBpdCBjYW4gYmUgZml4ZWQuIEJ1dCBp
dCdzCj4gb3J0aG9nb25hbCB0byB3aGV0aGVyIHRoZSB2YWx1ZSBnZXRzIHJlc2V0IGV2ZXJ5IHRp
bWUgdGhlIHN5bmNwb2ludCBpcwo+IGFsbG9jYXRlZC4KPiAKPj4KPj4+IEFsc28sIHRoaXMgbWFr
ZXMgY29kZSBtb3JlIGNvbXBsaWNhdGVkIHNpbmNlIGl0IG5vdyBuZWVkcyB0byBlbnN1cmUgYWxs
Cj4+PiB3YWl0cyBvbiB0aGUgc3luY3BvaW50IGhhdmUgY29tcGxldGVkIGJlZm9yZSBmcmVlaW5n
IHRoZSBzeW5jcG9pbnQsCj4+PiB3aGljaCBjYW4gYmUgbm9udHJpdmlhbCBlLmcuIGlmIHRoZSB3
YWl0ZXIgaXMgaW4gYSBkaWZmZXJlbnQgdmlydHVhbAo+Pj4gbWFjaGluZSBvciBzb21lIG90aGVy
IGRldmljZSBjb25uZWN0ZWQgdmlhIFBDSWUgKGEgcmVhbCB1c2VjYXNlKS4KPj4KPj4gSXQgc291
bmRzIHRvIG1lIHRoYXQgdGhlc2UgVk0gc3luYyBwb2ludHMgc2hvdWxkIGJlIHRyZWF0ZWQgdmVy
eQo+PiBzZXBhcmF0ZWx5IGZyb20gYSBnZW5lcmljIHN5bmMgcG9pbnRzLCBkb24ndCB5b3UgdGhp
bmsgc28/IExldCdzIG5vdCBtaXgKPj4gdGhlbSBhbmQgZ2V0IHRoZSBnZW5lcmljIHN5bmMgcG9p
bnRzIHVzYWJsZSBmaXJzdC4KPj4KPiAKPiBUaGV5IGFyZSBub3Qgc3BlY2lhbCBpbiBhbnkgd2F5
LCBJJ20ganVzdCByZWZlcnJpbmcgdG8gY2FzZXMgd2hlcmUgdGhlCj4gd2FpdGVyIChjb25zdW1l
cikgaXMgcmVtb3RlLiBUaGUgYWxsb2NhdG9yIG9mIHRoZSBzeW5jcG9pbnQgKHByb2R1Y2VyKQo+
IGRvZXNuJ3QgbmVjZXNzYXJpbHkgZXZlbiBuZWVkIHRvIGtub3cgYWJvdXQgaXQuIFRoZSBzYW1l
IGNvbmNlcm4gaXMKPiBhcHBsaWNhYmxlIHdpdGhpbiBhIHNpbmdsZSBWTSwgb3Igc2luZ2xlIGFw
cGxpY2F0aW9uIGFzIHdlbGwuIEp1c3QKPiBwdXR0aW5nIG91dCB0aGUgcG9pbnQgdGhhdCB0aGlz
IGlzIHNvbWV0aGluZyB0aGF0IG5lZWRzIHRvIGJlIHRha2VuIGNhcmUKPiBvZiBpZiB3ZSB3ZXJl
IHRvIHJlc2V0IHRoZSB2YWx1ZS4KCldpbGwga2VybmVsIGRyaXZlciBrbm93IHRoYXQgaXQgZGVh
bHMgd2l0aCBhIFZNIHN5bmMgcG9pbnQ/CgpXaWxsIGl0IGJlIHBvc3NpYmxlIHRvIGdldCBhIG5v
bi1WTSBzeW5jIHBvaW50IGV4cGxpY2l0bHk/CgpJZiBkcml2ZXIga25vd3MgdGhhdCBpdCBkZWFs
cyB3aXRoIGEgVk0gc3luYyBwb2ludCwgdGhlbiB3ZSBjYW4gdHJlYXQgaXQKc3BlY2lhbGx5LCBh
dm9pZGluZyB0aGUgcmVzZXQgYW5kIGV0Yy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
