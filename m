Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60079EE839
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A9D6E82A;
	Mon,  4 Nov 2019 19:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9563A6E82A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 19:21:33 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n23so5167079otr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 11:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7y4ipuWmdaUi9fFnH1wHoo3ikrWXbFhBkhRytiSTYvM=;
 b=kmu5lW/TCrMMyyMZPBinfwVrVS3qHBp7BR33hdwXMbbgweKmF5CtuHehkDXKN6UZdo
 ht8aFlvxKXdNjw84ucYOwnZwSs61nqS+S7DOhWmcgwq2MOFGlu+Mfvj8/3KEli+5+aH+
 9DR1Q3ZTkAlec70Os0HzBR9WnGau0ffPUYf6wyY/uv5HIe/Z7zNf+UHGG8Mm+kG14MYt
 dimNpYZOjPsgKHdcpH5OAdN62j92QwBLG6Fnfq/NV+b2lPjiN9K13yv8vB24KYtV+fDM
 xK/6CkfHY3rzQ7J4J5KopTz/YzTzMHDPFG5l9VjyHEofA0VDe/RTpZNDo3vX0MK7H5Bp
 5MDg==
X-Gm-Message-State: APjAAAWwjpoJyXdRnSpW8R/5DxqoeLfihKb3EYZFzEeLLzarrKDDxM+X
 LJKl0LsXFXdA5dlvtPYrWWSugp+SFlk+z9BatyDc+g==
X-Google-Smtp-Source: APXvYqwovk2ws6gw1x2ffiii11kkOdQ/I1Hg2skTx4vPM9AnnETFCFUC9S25MTgg9Czm7z5Rwb5icomH1IGIUSXKBjE=
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr18805680oth.102.1572895292765; 
 Mon, 04 Nov 2019 11:21:32 -0800 (PST)
MIME-Version: 1.0
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191104101807.79503286@eldfell.localdomain>
In-Reply-To: <20191104101807.79503286@eldfell.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 11:21:21 -0800
Message-ID: <CALAqxLXYUKNGebU6ZBVsX5xQ_hUL+imxcyOkuV5M10UxdpZuSA@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] DMA-BUF Heaps (destaging ION)
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7y4ipuWmdaUi9fFnH1wHoo3ikrWXbFhBkhRytiSTYvM=;
 b=zVPQ4vLmRwkhdd0deIKHT+LjfpSu5/1hNMNrNyCY5UyhgmQipJ3kXUzGIJuFkl/dNU
 HdpL8bcUL77aYoY+kohtMB6aXbjOEwuUHr8jZTJ0mgGXwlNntn4N/nsps4YDowaZIJWA
 DeLbG7z94g3xeyjqijOwgvQnKtts/1Y14A42VqZq/VcLXvgkUId5HzK+jMR8qqRm/UTE
 pgE2orq6ejxaiuwBzJtm/2YBf8DrrkEfoHEUd3uHNEtt7TL7mvqzqSn6bTqvkQzrlz1+
 5ug4sXR4YSdZ7Iqfs8jDpvXpVY9RWekZ1tsK+UKlHupS1IH7MURM3yP2qU/xLi4GCk7n
 jXrg==
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
Cc: Hillf Danton <hdanton@sina.com>, Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxMjoxOCBBTSBQZWtrYSBQYWFsYW5lbiA8cHBhYWxhbmVu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAgMSBOb3YgMjAxOSAyMTo0MjozMyArMDAwMAo+
IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPgo+ID4gVGhpcyBh
Z2Fpbj8gSSBrbm93IQo+ID4KPiA+IEFwb2xvZ2llcyB0byBhbGwgd2hvIGhvcGVkIEknZCBzdG9w
IGJvdGhlcmluZyB0aGVtIHdpdGggdGhpcwo+ID4gcGF0Y2ggc2V0LCBidXQgSSByYW4gYWZvdWwg
b2YgdGhlIERSTSB0cmVlIHJ1bGVzIGJ5IG5vdAo+ID4gZ2V0dGluZyB0aGUgdXNlcmxhbmQgcGF0
Y2hlcyBwcm9wZXJseSByZXZpZXdlZCBwcmlvciB0byB0aGUKPiA+IHBhdGNoZXMgbGFuZGluZyAo
SSBtaXN0YWtlbmx5IHdhcyB3YWl0aW5nIGZvciB0aGUgcGF0Y2hlcyB0bwo+ID4gbGFuZCB1cHN0
cmVhbSBiZWZvcmUgcHVzaGluZyB0aGUgdXNlcmxhbmQgcGF0Y2hlcykuIFRodXMsCj4gPiB0aGVz
ZSB3ZXJlIGNvcnJlY3RseSByZXZlcnRlZCBmcm9tIHRoZSBkcm0tbWlzYy1uZXh0IHRyZWUuCj4K
PiBIaSBKb2huLAo+Cj4gbWluZCwgeW91IGhhdmUgdG8gZ2V0IHVzZXJsYW5kIHBhdGNoZXMgcmV2
aWV3ZWQgYW5kIGFjY2VwdGVkIGJ1dCAqbm90Cj4gcHVzaGVkKi4KPgo+IFlvdSBjYW5ub3QgcHVz
aC9tZXJnZSB1c2VybGFuZCBwYXRjaGVzIGJlZm9yZSB0aGUga2VybmVsIHBhdGNoZXMgaGF2ZQo+
IHByb3Blcmx5IGxhbmRlZCwgdGhhdCBiaXQgeW91IGdvdCByaWdodC4gQnV0IHRoZSBzdXBwb3Nl
ZGx5IGNvbmZ1c2luZwo+IGJpdCBpcyB0aGF0IGZvciBrZXJuZWwgcGF0Y2hlcyB0byBsYW5kLCB0
aGUgdXNlcnNwYWNlIHBhdGNoZXMgbXVzdCBiZQo+IHJldmlld2VkIGFuZCBhY2NlcHRlZCBmaXJz
dC4KPgo+IEkganVzdCB3YW50ZWQgdG8gY2xhcmlmeSB0aGlzIHNpbmNlIHlvdSB3cm90ZSAiYmVm
b3JlIHB1c2hpbmcgdGhlCj4gdXNlcmxhbmQgcGF0Y2hlcyIgYWJvdmUuCgpZZWEuIFNvcnJ5LCAi
cHVzaGVkIiBpc24ndCBhIHZlcnkgY2xlYXIgdGVybS4gSW4gQU9TUCwgb25lIG11c3QgcHVzaCBh
CnBhdGNoIHRvIEdlcnJpdCBiZWZvcmUgaXQgaXMgcmV2aWV3ZWQuCkhvd2V2ZXIsIG9uY2Ugc29t
ZXRoaW5nIGlzIHJldmlld2VkIGl0IHVzdWFsbHkgaXMgbWVyZ2VkIGltbWVkaWF0ZWx5CihwZW5k
aW5nIGF1dG9tYXRlZCBwcmVjb21taXQgdGVzdGluZykuCgpTbyBJIHRlbmQgdG8gdXNlIHRoZSB0
ZXJtICJwdXNoZWQgZm9yIHJldmlldyIgYXMgc3VibWl0dGluZyBwYXRjaGVzCmZvciByZXZpZXcg
YXMgcmVhZHkgdG8gYmUgbWVyZ2VkLiBJbiB0aGlzIGNhc2UsIHRlY2huaWNhbGx5IEkgaGFkCmFj
dHVhbGx5ICJwdXNoZWQiIHRoZSBjaGFuZ2VzIHRvIEdlcnJpdCwgYnV0IGhhZG4ndCBhZGRlZCBh
bnlvbmUgdG8KcmV2aWV3LCB0byBlbnN1cmUgdGhlIHBhdGNoZXMgd2VyZSBub3QnIGFjY2lkZW50
YWxseSByZXZpZXdlZCBhbmQKbWVyZ2VkLgpCdXQgSWYgeW91IGxvb2sgYXQgdGhlIEdlcnJpdCBs
b2cgbm93LCB5b3UnbGwgc2VlIEkndmUgYWRkZWQgcmV2aWV3ZXJzCmFuZCBwcm92aWRlZCBhIG5v
dGUgZXhwbGljaXRseSB0byBub3QgbWVyZ2UgdGhlIGNoYW5nZXMuCgpTbyBhcG9sb2dpZXMgZm9y
IHRoZSBjb25mdXNpb24uIEkgZG8gYmVsaWV2ZSBJIHVuZGVyc3RhbmQgdGhlCnJlcXVpcmVtZW50
IG5vdywgYW5kIGFtIGRvaW5nIG15IGJlc3QgdG8gYWRoZXJlIHRvIHRoZW0uCgpUaGF0IHNhaWQs
IGdpdmVuIGRpZmZlcmVudCB1c2VybGFuZCBwcm9qZWN0cyB1c2UgZGlmZmVyZW50IGFwcHJvYWNo
ZXMsCkkgZG8gZmluZCBpdCBhIGxpdHRsZSBzdHJhbmdlIG9uIHRoZSBpbnNpc3RlbmNlIHRoYXQg
dXNlcmxhbmQgcGF0Y2hlcwpjYW5ub3QgYmUgbWVyZ2VkIHRvIHRoZWlyIHByb2plY3QgYmVmb3Jl
IHRoZSBrZXJuZWwgY2hhbmdlcyBsYW5kLgpPYnZpb3VzbHkgbm8gaW50ZXJmYWNlIGlzIGZpbmFs
IGFuZCBhbnkgdXNlcmxhbmQgdGhhdCBkb2VzIHNvIGhhcyBzb21lCnJpc2sgdGhhdCBpdCB3aWxs
IGNoYW5nZSBhbmQgYnJlYWssIGJ1dCB0aGVyZSBhcmUgbWFueSBjYXNlcyB3aGVyZQpkaXN0cm9z
IHN1cHBvcnQgbmV3IGZlYXR1cmVzIGluIHRoZWlyIHVzZXJsYW5kIG5vdCB5ZXQgbWVyZ2VkCnVw
c3RyZWFtLiAgRW5zdXJpbmcgdGhlcmUgaXMgYSByZWFsIG9wZW5zb3VyY2UgdXNlciBmb3IgdGhl
IGtlcm5lbApmZWF0dXJlIGlzIGltcG9ydGFudCwgYnV0IEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rh
bmQgd2h5IHRoZSBrZXJuZWwgaXMKZGljdGF0aW5nIHJ1bGVzIGFzIHRvIGhvdyB1c2Vyc3BhY2Ug
bWVyZ2VzIGNvZGUuCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
