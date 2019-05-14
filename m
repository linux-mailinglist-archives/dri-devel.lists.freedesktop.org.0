Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2C1E8DA
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2864E8953E;
	Wed, 15 May 2019 07:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022E892EE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 07:55:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E7hLLU012623; Tue, 14 May 2019 08:55:42 +0100
Received: from hhmail02.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com with ESMTP id 2sdpft2tqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2019 08:55:42 +0100
Received: from michael-imgtec (10.80.17.22) by hhmail02.hh.imgtec.org
 (10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 14 May
 2019 08:55:41 +0100
Date: Tue, 14 May 2019 15:55:37 +0800
From: Michael Yang <michael.yang@imgtec.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [EXTERNAL] Re: [PATCH] sync_file: Return reasonable timestamp
 when merging signaled fences
Message-ID: <20190514075537.GA7483@michael-imgtec>
References: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
 <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
 <155740236592.28545.17880521046408313036@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155740236592.28545.17880521046408313036@skylake-alporthouse-com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.17.22]
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=imgtec.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=dk201812; bh=uKFpAT7GrQSucExulDdH+qORJ6Ns2etUzr/PYek6Ejo=;
 b=uv78+xKCIP2KAgoPoLFzjakPS3sRS4qdQA4jVZnoFVUCXbE0As6rDPZpgOZFpxLGLw5W
 bIgn2bPSswq6S4LlAeBOwR0sw2DOFb3JllXfs8GWs0xiuKQ8IgqzN+kyPHvDUU3PqoCw
 IRV+wOq11mv3MpakmxE0ekRjIuIFa3VtKZM/e0EoaVlXPqT14i542tlMsrRjMRD9795t
 hksBwX+1eIgBFbGa3JodYXnlkXS7cP6rvyVR9Vv/7RSK1NC1dbZRjsWvqQxADTOKmbQ5
 eOeRvzAV+5lB7ngjVxdFv6BoqQkOQJl9QQceVp5A7qSN2c60J9n9x31u1kDFBScL4lU8 tw== 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMTI6NDY6MDVQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgTWljaGFlbCBZYW5nICgyMDE5LTA1LTA5IDA1OjM0OjExKQo+ID4gSWYg
YWxsIHRoZSBzeW5jIHBvaW50cyB3ZXJlIHNpZ25hbGVkIGluIGJvdGggZmVuY2VzIGEgYW5kIGIs
Cj4gPiB0aGVyZSB3YXMgb25seSBvbmUgc3luYyBwb2ludCBpbiBtZXJnZWQgZmVuY2Ugd2hpY2gg
aXMgYV9mZW5jZVswXS4KPiA+IFRoZSBGZW5jZSBzdHJ1Y3R1cmUgaW4gYW5kcm9pZCBmcmFtZXdv
cmsgbWlnaHQgYmUgY29uZnVzZWQgYWJvdXQKPiA+IHRpbWVzdGFtcCBpZiB0aGVyZSB3ZXJlIGFu
eSBzeW5jIHBvaW50cyB3aGljaCB3ZXJlIHNpZ25hbGVkIGFmdGVyCj4gPiBhX2ZlbmNlWzBdLiBJ
dCBtaWdodCBiZSBtb3JlIHJlYXNvbmFibGUgdG8gdXNlIHRpbWVzdGFtcCBvZiBsYXN0IHNpZ25h
bGVkCj4gPiBzeW5jIHBvaW50IHRvIHJlcHJlc2VudCB0aGUgbWVyZ2VkIGZlbmNlLgo+ID4gVGhl
IGlzc3VlIGNhbiBiZSBmb3VuZCBmcm9tIEVHTCBleHRlbnNpb24gQU5EUk9JRF9nZXRfZnJhbWVf
dGltZXN0YW1wcy4KPiA+IFNvbWV0aW1lcyB0aGUgcmV0dXJuIHZhbHVlIG9mIEVHTF9SRUFEU19E
T05FX1RJTUVfQU5EUk9JRCBpcyBoZWFkIG9mCj4gPiB0aGUgcmV0dXJuIHZhbHVlIG9mIEVHTF9S
RU5ERVJJTkdfQ09NUExFVEVfVElNRV9BTkRST0lELgo+ID4gVGhhdCBtZWFucyBkaXNwbGF5L2Nv
bXBvc2l0aW9uIGhhZCBiZWVuIGNvbXBsZXRlZCBiZWZvcmUgcmVuZGVyaW5nCj4gPiB3YXMgY29t
cGxldGVkIHRoYXQgaXMgaW5jb3JyZWN0Lgo+ID4gCj4gPiBTb21lIGRpc2N1c3Npb24gY2FuIGJl
IGZvdW5kIGF0Ogo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91
PWh0dHBzLTNBX19hbmRyb2lkLTJEcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb21fY19rZXJuZWxfY29t
bW9uXy0yQl85MDcwMDkmZD1Ed0lGYVEmYz1icTlwcG1ndlN3M29RRmZSODcxRF93JnI9TmdnNnZo
b3VQa2d3U0liRE1VN3JETjBaZlQyUWF4NTB4dVdrWFhxUTN6dyZtPU45UjlkWEdKM3prMGUwZ1hO
TTR0c2lybzd4Q09MbFd4NmMzSEFFc2VTU3cmcz02c1kydDlpMnd2eWxXSC1yUFVsdlkxTUl1V0tq
Q1B6VDhTZUNncFpPSUdrJmU9IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFlhbmcg
PG1pY2hhZWwueWFuZ0BpbWd0ZWMuY29tPgo+ID4gLS0tCj4gPiBIaSwKPiA+IEkgZGlkbid0IGdl
dCByZXNwb25zZSBzaW5jZSBJIHByZXZpb3VzbHkgc2VudCB0aGlzIGEgbW9udGggYWdvLgo+ID4g
Q291bGQgc29tZW9uZSBoYXZlIGEgY2hhbmNlIHRvIGxvb2sgYXQgaXQgcGxlYXNlPwo+ID4gVGhh
bmtzLgo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYyB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUu
YyBiL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYwo+ID4gaW5kZXggNGY2MzA1Yy4uZDQ2YmZl
MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYwo+ID4gKysrIGIv
ZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCj4gPiBAQCAtMjc0LDggKzI3NCwyOSBAQCBzdGF0
aWMgc3RydWN0IHN5bmNfZmlsZSAqc3luY19maWxlX21lcmdlKGNvbnN0IGNoYXIgKm5hbWUsIHN0
cnVjdCBzeW5jX2ZpbGUgKmEsCj4gPiAgICAgICAgIGZvciAoOyBpX2IgPCBiX251bV9mZW5jZXM7
IGlfYisrKQo+ID4gICAgICAgICAgICAgICAgIGFkZF9mZW5jZShmZW5jZXMsICZpLCBiX2ZlbmNl
c1tpX2JdKTsKPiA+ICAKPiA+IC0gICAgICAgaWYgKGkgPT0gMCkKPiA+IC0gICAgICAgICAgICAg
ICBmZW5jZXNbaSsrXSA9IGRtYV9mZW5jZV9nZXQoYV9mZW5jZXNbMF0pOwo+ID4gKyAgICAgICAv
KiBJZiBhbGwgdGhlIHN5bmMgcHRzIHdlcmUgc2lnbmFsZWQsIHRoZW4gYWRkaW5nIHRoZSBzeW5j
X3B0IHdobwo+ID4gKyAgICAgICAgKiB3YXMgdGhlIGxhc3Qgc2lnbmFsZWQgdG8gdGhlIGZlbmNl
Lgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgaWYgKGkgPT0gMCkgewo+ID4gKyAgICAgICAg
ICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKmxhc3Rfc2lnbmFsZWRfc3luY19wdCA9IGFfZmVuY2Vz
WzBdOwo+ID4gKyAgICAgICAgICAgICAgIGludCBpdGVyOwo+ID4gKwo+ID4gKyAgICAgICAgICAg
ICAgIGZvciAoaXRlciA9IDE7IGl0ZXIgPCBhX251bV9mZW5jZXM7IGl0ZXIrKykgewo+IAo+IElm
IHRoZXJlIGlzIG1vcmUgdGhhbiBvbmUgZmVuY2UsIHN5bmNfZmlsZS0+ZmVuY2UgaXMgYSBmZW5j
ZV9hcnJheSBhbmQKPiBpdHMgdGltZXN0YW1wIGlzIHdoYXQgeW91IHdhbnQuIElmIHRoZXJlIGlz
IG9uZSBmZW5jZSwgc3luY19maWxlLT5mZW5jZQo+IGlzIGEgcG9pbnRlciB0byB0aGF0IGZlbmNl
LCBhbmQgbmF0dXJhbGx5IGhhcyB0aGUgcmlnaHQgdGltZXN0YW1wLgo+IAo+IEluIHNob3J0LCB0
aGlzIHNob3VsZCBiZSBoYW5kbGVkIGJ5IGRtYV9mZW5jZV9hcnJheV9jcmVhdGUoKSB3aGVuIGdp
dmVuCj4gYSBjb21wbGV0ZSBzZXQgb2Ygc2lnbmFsZWQgZmVuY2VzLCBpdCB0b28gc2hvdWxkIGlu
aGVyaXQgdGhlIHNpZ25hbGVkCj4gc3RhdHVzIHdpdGggdGhlIHRpbWVzdGFtcCBiZWluZyB0YWtl
biBmcm9tIHRoZSBsYXN0IGZlbmNlLiBJdCBzaG91bGQKPiBhbHNvIGJlIGNhcmVmdWwgdG8gaW5o
ZXJpdCB0aGUgZXJyb3Igc3RhdHVzLgo+IC1DaHJpcwpUaGFua3MgQ2hyaXMgZm9yIHRoZSBpbnB1
dHMuIEZvciB0aGlzIGNhc2UsIHRoZXJlIHdpbGwgYmUgb25seSBvbmUgZmVuY2UKaW4gc3luY19m
aWxlLT5mZW5jZSBhZnRlciBkb2luZyBzeW5jX2ZpbGVfbWVyZ2UoKS4gUmVnYXJkaW5nIHRvIHRo
ZSBjdXJyZW50CmltcGxlbWVudGF0aW9uLCBkbWFfZmVuY2VfYXJyYXlfY3JlYXRlKCkgaXMgbm90
IGNhbGxlZCBhcyBudW1fZmVuY2VzIGlzIGVxdWFsCnRvIDEuIEkgd2FzIHdvbmRlcmluZyBkbyB5
b3Ugc3VnZ2VzdCB0aGF0IHdlIHBhc3MgYSBjb21wbGV0ZSBzZXQgb2Ygc2lnbmFsZWQKZmVuY2Vz
IHRvIHN5bmNfZmlsZV9zZXRfZmVuY2UoKSBhbmQgaGFuZGxlIGl0IGluIGRtYV9mZW5jZV9hcnJh
eV9jcmVhdGUoKS4KVGhhbmtzLgotIE1pY2hhZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
