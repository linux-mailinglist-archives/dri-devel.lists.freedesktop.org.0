Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A37314868
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 07:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B686EA9F;
	Tue,  9 Feb 2021 06:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC556EA9F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 06:03:04 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m22so26630971lfg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 22:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gmQ70ZY+hZdLsMMGo2UlngmwDHJDaZ+KuDOOqW/O4fM=;
 b=MSe2G+QZ4H3yrCs40Y5Q5On9j3E2n6s1kR+l1TyP9LSx6o/ikcpalBDd2YZQe46vT+
 GeVCN17ebjtonmJ2kYBXgQyerjf/Gbqiwu5y0ZrHvAQihLvREjxIoF/OLK15kR014pNe
 6rdtN1/I7UJAtlgctWSVwRKheyKAdVDtrOkhNeflbhdt3r7/eRKlOT+olNYurUaBsTpV
 pv/Y454SwLRK0+GCmgCnwXzgPbR1cgGVB12Lm/jf0Kgchkwohp7oboCaaQm+3se9XXrc
 nms4ILFJWvdzXW/nGc6KFL3pgQmcAkgSIq+B25dz25SiBFwNa3O+wSLkU9dn5mR/hJOi
 T7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gmQ70ZY+hZdLsMMGo2UlngmwDHJDaZ+KuDOOqW/O4fM=;
 b=cZ7kw4TpmuYzcKNUH7/XaIS187IUbtk8k8Zoo1Ywa0zKg6d4/hECIe8dgA+0renCjD
 gnW2U+CbGaP1e9uID85S2hq0ODJQMagMkHtjoyRm+1I0juHTa+r6drOFd6iW8wZhnbp6
 aYt4KQZqEWuHU7n64eIEf1C3VIty2koGJDN8vMtkmgurKz4Qc426xxICpoLUvWBWo4gd
 fPosP1oNkywSNhtML0zUcxSeu6vLqiQxaHOgxYiBFO6KJLBUO/X9RDiDJihlLZ/rYoBF
 gOv/zAH2fB/Vka0S49JUw68fRiwL8DVcGJhDl0/AkXmWGZmniHVTm/yCvpe7yaEnHiiF
 oUlg==
X-Gm-Message-State: AOAM533+9eRSKoPKSYgasC6FT25PS9ZNslCqFMe0tvdElQ+kbYZV80sm
 +PReax2Awe/Ynl6PX0pJlX7p8d32ObgVAzk/Sbd0GQ==
X-Google-Smtp-Source: ABdhPJzoEMSmKAOK750m9HyqOcDgOs0oLbBXoG2DDtIm7KWVsrpz7mJHR5AQVFQuTkIp0l0LCzkHGQvJ3hpQ9BYXkko=
X-Received: by 2002:a19:cc7:: with SMTP id 190mr4816030lfm.361.1612850582683; 
 Mon, 08 Feb 2021 22:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org>
 <YCENrGofdwVg2LMe@phenom.ffwll.local>
 <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
 <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
In-Reply-To: <CAKMK7uECMOO5jx4433uDuMq=MBaBEYaLe6ysrT_pshrr6Bf9dA@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 9 Feb 2021 11:32:50 +0530
Message-ID: <CAO_48GGA9FajZ3FE---udupHTGSkafTf7MK01H4h4-NfR1DerA@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlLCA5IEZlYiAyMDIxIGF0IDAyOjM2LCBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgOCwgMjAyMSBhdCA5OjUxIFBN
IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPiA+IE9uIE1vbiwg
RmViIDgsIDIwMjEgYXQgMjowOCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdy
b3RlOgo+ID4gPiBPbiBTYXQsIEZlYiAwNiwgMjAyMSBhdCAwNTo0Nzo0OEFNICswMDAwLCBKb2hu
IFN0dWx0eiB3cm90ZToKPiA+ID4gPiBCeSBkZWZhdWx0IGRtYV9idWZfZXhwb3J0KCkgc2V0cyB0
aGUgZXhwb3J0ZXIgbmFtZSB0byBiZQo+ID4gPiA+IEtCVUlMRF9NT0ROQU1FLiBVbmZvcnR1bmF0
ZWx5IHRoaXMgbWF5IG5vdCBiZSBpZGVudGljYWwgdG8gdGhlCj4gPiA+ID4gc3RyaW5nIHVzZWQg
YXMgdGhlIGhlYXAgbmFtZSAoaWU6ICJzeXN0ZW0iIHZzICJzeXN0ZW1faGVhcCIpLgo+ID4gPiA+
Cj4gPiA+ID4gVGhpcyBjYW4gY2F1c2Ugc29tZSBtaW5vciBjb25mdXNpb24gd2l0aCB0b29saW5n
LCBhbmQgdGhlcmUgaXMKPiA+ID4gPiB0aGUgZnV0dXJlIHBvdGVudGlhbCB3aGVyZSBtdWx0aXBs
ZSBoZWFwIHR5cGVzIG1heSBiZSBleHBvcnRlZAo+ID4gPiA+IGJ5IHRoZSBzYW1lIG1vZHVsZSAo
YnV0IHdvdWxkIGFsbCBoYXZlIHRoZSBzYW1lIG5hbWUpLgo+ID4gPiA+Cj4gPiA+ID4gU28gdG8g
YXZvaWQgYWxsIHRoaXMsIHNldCB0aGUgZXhwb3J0ZXIgZXhwX25hbWUgdG8gdGhlIGhlYXAgbmFt
ZS4KPiA+ID4gPgo+ID4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4g
PiA+ID4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiA+ID4g
Q2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gPiA+ID4gQ2M6IENocmlzIEdv
bGRzd29ydGh5IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4KPiA+ID4gPiBDYzogTGF1cmEgQWJi
b3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFu
LlN0YXJrZXlAYXJtLmNvbT4KPiA+ID4gPiBDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdv
b2dsZS5jb20+Cj4gPiA+ID4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5j
b20+Cj4gPiA+ID4gQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KPiA+ID4g
PiBDYzogRGFuaWVsIE1lbnR6IDxkYW5pZWxtZW50ekBnb29nbGUuY29tPgo+ID4gPiA+IENjOiDD
mHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgo+ID4gPiA+IENjOiBSb2JpbiBNdXJwaHkg
PHJvYmluLm11cnBoeUBhcm0uY29tPgo+ID4gPiA+IENjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1
aWVsQGNvbGxhYm9yYS5jb20+Cj4gPiA+ID4gQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4KPiA+ID4gPiBDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZpZGlhLmNvbT4KPiA+ID4g
PiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8
am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPiA+ID4KPiA+ID4gTG9va3MgcmVhc29uYWJsZSB0byBt
ZS4KPiA+ID4KPiA+ID4gSSBndWVzcyB0aGUgbWFpbiB3b3JyeSBpcyAiZG9lcyB0aGlzIG1lYW4g
aGVhcCBuYW1lcyBiZWNvbWUgdWFwaSIsIGluCj4gPiA+IHdoaWNoIGNhc2UgSSdtIG1heWJlIG5v
dCBzbyBzdXJlIGFueW1vcmUgaG93IHRoaXMgd2lsbCB0aWUgaW50byB0aGUKPiA+ID4gb3ZlcmFs
bCBncHUgbWVtb3J5IGFjY291bnRpbmcgc3RvcnkuCj4gPiA+Cj4gPiA+IFNpbmNlIGZvciBkbWEt
YnVmIGhlYXBzIG9uZSBuYW1lIHBlciBidWZmZXIgaXMgcGVyZmVjdGx5IGZpbmUsIHNpbmNlCj4g
PiA+IGRtYS1idWYgaGVhcHMgYXJlbid0IHZlcnkgZHluYW1pYy4gQnV0IG9uIGRpc2NyZXRlIGdw
dSBkcml2ZXJzIGJ1ZmZlcnMKPiA+ID4gbW92ZSwgc28gYmFraW5nIGluIHRoZSBhc3N1bXB0aW9u
IHRoYXQgImV4cG9ydGVyIG5hbWUgPSByZXNvdXJjZSB1c2FnZSBmb3IKPiA+ID4gdGhpcyBidWZm
ZXIiIGlzIGJyb2tlbi4KPiA+Cj4gPiBJIHN1c3BlY3QgSSdtIG1pc3NpbmcgYSBzdWJ0bGV0eSBp
biB3aGF0IHlvdSdyZSBkZXNjcmliaW5nLiBNeSBzZW5zZQo+ID4gb2YgdGhlIGV4cG9ydGVyIG5h
bWUgZG9lc24ndCBhY2NvdW50IGZvciBhIGJ1ZmZlcidzIHVzYWdlLCBpdCBqdXN0Cj4gPiBkZXNj
cmliZXMgd2hhdCBjb2RlIGFsbG9jYXRlZCBpdCBhbmQgaW1wbGljaXRseSB3aGljaCBkbWFidWZf
b3BzCj4gPiBoYW5kbGVzIGl0LiAgTWF5YmUgY291bGQgeW91IGdpdmUgYSBtb3JlIHNwZWNpZmlj
IGV4YW1wbGUgb2Ygd2hhdAo+ID4geW91J3JlIGhvcGluZyB0byBhdm9pZD8KPgo+IEp1c3QgcGFy
YW5vaWEgcmVhbGx5IC0gb24gdGhlIGxpbnV4IHNpZGUgd2hlcmUgd2UgYWxsb2NhdGUgbW9zdAo+
IGJ1ZmZlcnMgKGV2ZW4gc2hhcmVkIG9uZXMpIHdpdGggdGhlIGRyaXZlciwgdGhhdCBhbGxvY2F0
b3IgaW5mbyBpc24ndAo+IHRoYXQgbWVhbmluZ2Z1bCwgaXQgcmVhbGx5IGp1c3QgdGVsbHMgeW91
IHdoaWNoIGNvZGUKPiBhbGxvY2F0ZWQvZXhwb3J0ZWQgdGhhdCBkbWEtYnVmLgo+Cj4gQnV0IG9u
IEFuZHJvaWQsIHdoZXJlIGFsbCBzaGFyZWQgYnVmZmVycyBjb21lIGZyb20gc3BlY2lmaWMgaGVh
cHMsIGl0Cj4gaXMgcmF0aGVyIG1lYW5pbmdmdWwgaW5mb3JtYXRpb24uIFNvIEkgd29uZGVyZWQg
d2hldGhlciBlLmcuIHRoZQo+IGFuZHJvaWQgZG1hYnVmIGRlYnVnIHRvb2wgdXNlcyB0aGF0IHRv
IGNvbGxlY3QgcGVyLWhlYXAgc3RhdHMsIGJ1dAo+IHNvdW5kcyBsaWtlIG5vIHJpZ2h0IG5vdy4g
UGx1cyB3aXRoIHRoZSBjaGF0IHdlJ3ZlIGhhZCBJIHRoaW5rIHdlIGhhdmUKPiBhIGxvbmctdGVy
bSBwbGFuIGZvciBob3cgdG8gZXhwb3NlIHRoYXQgaW5mb3JtYXRpb24gcHJvcGVybHkuCj4KPiA+
IFRvIG1lIHRoaXMgcGF0Y2ggaXMgbW9zdGx5IGp1c3QgYSBjb25zaXN0ZW5jeS9sZWFzdC1zdXJw
cmlzZSB0aGluZywgc28KPiA+IHRoZSBoZWFwcyBleHBvcnRlciBuYW1lIG1hdGNoZXMgdGhlIHN0
cmluZyB1c2VkIGZvciB0aGUgaGVhcCdzIGNoYXJkZXYKPiA+IGRldmljZSAodGhlIGludGVyZmFj
ZSB1c2VkIHRvIGFsbG9jYXRlIGl0KSBpbiBvdXRwdXQgbGlrZQo+ID4gZGVidWdmcy9kbWFfYnVm
L2J1ZmluZm8uCj4KPiBZZWFoIGZvciBkZWJ1ZyB0aGlzIG1ha2VzIHNlbnNlLiBhLWI6IG1lIGlm
IHlvdSB3YW50IHRoYXQgc29tZXdoZXJlIG9uCj4gdGhlIHBhdGNoZXMuCgpHcmVhdCB0aGF0IHRo
aXMgZ290IHNvcnRlZDsgSSdsbCBhcHBseSBib3RoIHRoZSBwYXRjaGVzIG9mIHRoaXMgc2VyaWVz
CnRvIGRybS1taXNjLW5leHQsIHdpdGggeW91ciBhLWIuCgo+IC1EYW5pZWwKCkJlc3QKU3VtaXQu
Cgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgoKCi0tIApUaGFua3MgYW5kIHJlZ2FyZHMsCgpT
dW1pdCBTZW13YWwKTGluYXJvIENvbnN1bWVyIEdyb3VwIC0gVGVjaCBMZWFkCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
