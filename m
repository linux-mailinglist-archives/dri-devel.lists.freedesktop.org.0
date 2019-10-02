Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFBC9452
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 00:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E906E180;
	Wed,  2 Oct 2019 22:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453396E180
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 22:27:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so482996wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 15:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVuyM2HI99wS0wrEjVTuybtyAoge/UdhgX0Riu1yBrw=;
 b=BZ0LwRG7wPlkkuom7I/5uGCXnHh/OWTDj/AGBpSleZ5AKH+F2l4cJ7Kz2d3Fb8fsMu
 GUuE8h6E5Vz7owORBC5Uk6+4aYBGuEwvl1+LVNl/YCCIbGTAzOwIlRLcYBMQF8Fr+wTK
 gAjLPaxYUBB2+QxgcOmlHUa8sQ7WWtY2YfLwknCS7N3lOV3gl/oIVH4VNXhWSZx3IK7Z
 hFY3A73Ia4VCIM3I3MHf2+4tbahq5u8gXqW3UYf55ehscd78+hjC5ZOzhOzIqzGvLzIz
 PG7IhUo0rt4qE3ilw/3D/KSs01M6/HBvCRm200RYn8Jm0kGc5Vqu26qKgloQ04fct94Y
 mQfw==
X-Gm-Message-State: APjAAAUc7oiOb5ejriBYG0DGUpHZvcCgep5j5+HFjiuHt66hmuR+MdoS
 9gU1nAXikbHAm8Q1ldvPWOyHrg4C/wV9742G6LsNmw==
X-Google-Smtp-Source: APXvYqz/9fvt/NJ1VDIHFIXKAcThmwE0MvQ+M3a7SKRoqkqjvrIyn571bbWQVFHXE+01yobIs7fyFhY5VgysNS/Y4vY=
X-Received: by 2002:a7b:cd99:: with SMTP id y25mr4528872wmj.152.1570055273633; 
 Wed, 02 Oct 2019 15:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191002182255.21808-3-john.stultz@linaro.org>
 <201910030658.lcYVTiTL%lkp@intel.com>
In-Reply-To: <201910030658.lcYVTiTL%lkp@intel.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 2 Oct 2019 15:27:41 -0700
Message-ID: <CALAqxLX7JgUvixQQMn=6thfhOg_Bw1fN02KQPkO9144yRwPwMw@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] dma-buf: heaps: Add heap helpers
To: kbuild test robot <lkp@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WVuyM2HI99wS0wrEjVTuybtyAoge/UdhgX0Riu1yBrw=;
 b=JgvO7XtwX8H4Z+QL5zkjv5W3cuYCeQaxxkpdk1bbkCf2LfkQavQHb5IuxUAV1/Q2Wr
 B5alBqCxh4pcNxn/B5njq2rMSzmtHXR8NbTXEtqkFvPR2iIgWgqCI/205qFN6pKpTW5X
 EgodLXLs3wJY1ViIUMLRBILoVqAv42zDI6sxpZkqr/lnh/+MrloQSy1c3sRcNX8RsT99
 JcEpYTYslnCN6MtOhpfPTspDva41JJqGHqlxAtLHCMvrmPEdlyX7gWlz59vuBcV6UBov
 y8AsdkbjfirxsdH2i8BLOoJlvm903gpDuhtSRhwGSXJ9EJ7Vy9MZB6Zg2AAxY4B5pEOz
 NNqA==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>, kbuild-all@01.org,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAzOjEwIFBNIGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPiB3cm90ZToKPgo+IEhpIEpvaG4sCj4KPiBJIGxvdmUgeW91ciBwYXRjaCEgWWV0IHNv
bWV0aGluZyB0byBpbXByb3ZlOgo+Cj4gW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiBsaW51cy9t
YXN0ZXJdCj4gW2Nhbm5vdCBhcHBseSB0byB2NS40LXJjMSBuZXh0LTIwMTkxMDAyXQo+IFtpZiB5
b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1
cyBhIG5vdGUgdG8gaGVscAo+IGltcHJvdmUgdGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNvIHN1Z2dl
c3QgdG8gdXNlICctLWJhc2UnIG9wdGlvbiB0byBzcGVjaWZ5IHRoZQo+IGJhc2UgdHJlZSBpbiBn
aXQgZm9ybWF0LXBhdGNoLCBwbGVhc2Ugc2VlIGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS8z
NzQwNjk4Ml0KPgo+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29t
bWl0cy9Kb2huLVN0dWx0ei9ETUEtQlVGLUhlYXBzLWRlc3RhZ2luZy1JT04vMjAxOTEwMDMtMDQy
ODQ5Cj4gY29uZmlnOiBtaXBzLWFsbG1vZGNvbmZpZyAoYXR0YWNoZWQgYXMgLmNvbmZpZykKPiBj
b21waWxlcjogbWlwcy1saW51eC1nY2MgKEdDQykgNy40LjAKPiByZXByb2R1Y2U6Cj4gICAgICAg
ICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMv
bWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICBjaG1v
ZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5jb25m
aWcgdG8gbGludXggYnVpbGQgdHJlZQo+ICAgICAgICAgR0NDX1ZFUlNJT049Ny40LjAgbWFrZS5j
cm9zcyBBUkNIPW1pcHMKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxv
d2luZyB0YWcKPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4KPiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4KPiAgICBkcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmM6IEluIGZ1bmN0aW9uICdkbWFfaGVhcF9tYXBf
a2VybmVsJzoKPiA+PiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmM6NDM6MTA6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAndm1hcCc7IGRpZCB5b3Ug
bWVhbiAnYm1hcCc/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAg
ICAgdmFkZHIgPSB2bWFwKGJ1ZmZlci0+cGFnZXMsIGJ1ZmZlci0+cGFnZWNvdW50LCBWTV9NQVAs
IFBBR0VfS0VSTkVMKTsKPiAgICAgICAgICAgICAgXn5+fgo+ICAgICAgICAgICAgICBibWFwCj4g
Pj4gZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jOjQzOjQ5OiBlcnJvcjogJ1ZN
X01BUCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4gJ1ZNX01QWCc/Cj4gICAgICB2YWRkciA9IHZtYXAoYnVmZmVyLT5wYWdlcywgYnVmZmVyLT5w
YWdlY291bnQsIFZNX01BUCwgUEFHRV9LRVJORUwpOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVk1fTVBYCgoKQWgsIGxvb2tzIGxpa2Ug
SSdtIG1pc3Npbmc6CisjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgoKV2hpY2ggc29tZWhvdyBn
ZXRzIHB1bGxlZCBpbiB0aHJvdWdoIHRoZSBoZWFkZXJzIG9uIG90aGVyIGFyY2hlcy4KCkknbGwg
Zml4IHRoYXQgdXAuIFRoYW5rcyBzbyBtdWNoIQotam9obgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
