Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FB301439
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AE66E15F;
	Sat, 23 Jan 2021 09:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE596EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 22:21:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id u14so5619959wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p+wFAQDvhZKzJckMU2PTCB4geYwutkW2n4ieR3b1p7c=;
 b=PzRiNcUmdot6JGXxpzUl72+waAwAYCBKGrm/wOqFqpqn/YIEGIMEuGbcpXxwbFRSlm
 SOBocLyuiSB7j+UyAVJQxtRnEbA6+9VKrlk3oLSxWawGjvxJtF3esc7MkVFKD7wLu5eo
 F4TpcjpAYQpee6WoocuEVDpRvIjmoiknO6i1025Z9y1gttI3fC0tNg+sL/6O5T6qneOC
 k+s2sXL5Kaa/Pg+eusXwY7uVGye3iFe/B3uDL2mWFJDwBYQD9RvljoAJqNhUeWLGwoDn
 U2BtIfMSR41j+1w+FOU0GlAxbfrrUeTj3qOdPKG5V3TJjOJRrJyljTxWpOy5B/TdZv7S
 JN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p+wFAQDvhZKzJckMU2PTCB4geYwutkW2n4ieR3b1p7c=;
 b=EekiOndOVOlkYHONQfaB/Yccfbq3rnhLrJm9jIl5WlCuKqi8mFtYG8glOMPgKcwEhv
 eDOmmvt78H4rbVXKwyV/8T+UZRC2bd/l5Y4cFeXM/fv4PnhaZvkcIKSfeLOjRe7ienJE
 emEOFAzff00vCFtcN0/4MucYZq4IELq+zXXwJpwB2m1ut06FWENmSzC6iQVxvlF7Xzb8
 eqGgxNzqGfPqQhDU5WQ5XCRhDF5WaADJ1qhKdezuyAH36pMvmQ90m479DHQ2EEnayFGs
 X91SK+f5EyMHQqcT5t9sCy5P++jMwXx8UP2xolcRRhwh7Ndcj6lo5G+G7JfSZMVi32pU
 YO4Q==
X-Gm-Message-State: AOAM530WO+vOJBwqWg7ZQ6zb0XbGh3DoNJ2hY4UAFz6x/KPk6ZebBjXi
 iuAjgV0E+4oPgXhCVVyNL3DJQDPowkeieLC/1UpPAA==
X-Google-Smtp-Source: ABdhPJzbd/UOZZQeTAnMSZA8bXD9d3VDfBedEN1Zbd4a2k+DLKLdfAPmMYLlkIHhGT4WfL3kqVVIITKABzMNGSZHbOA=
X-Received: by 2002:a1c:7906:: with SMTP id l6mr5825010wme.22.1611354067218;
 Fri, 22 Jan 2021 14:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org>
 <20210119204508.9256-2-john.stultz@linaro.org>
 <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
In-Reply-To: <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 22 Jan 2021 14:20:56 -0800
Message-ID: <CAJuCfpGRkM+h16SJp7gJOaAhy+gFw1-++WP8kavOjRj3MHcpBQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the
 vmap_cnt go negative
To: Sumit Semwal <sumit.semwal@linaro.org>
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgMTE6NTYgUE0gU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIaSBKb2huLCBTdXJlbiwKPgo+Cj4gT24gV2VkLCAy
MCBKYW4gMjAyMSBhdCAwMjoxNSwgSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+
IHdyb3RlOgo+ID4KPiA+IFdlIHNob3VsZG4ndCB2dW5tYXAgbW9yZSB0aGVuIHdlIHZtYXAsIGJ1
dCBpZiB3ZSBkbywgbWFrZQo+ID4gc3VyZSB3ZSBjb21wbGFpbiBsb3VkbHkuCj4KPiBJIHdhcyBj
aGVja2luZyB0aGUgZ2VuZXJhbCB1c2FnZSBvZiB2dW5tYXAgaW4gdGhlIGtlcm5lbCwgYW5kIEkK
PiBjb3VsZG4ndCBmaW5kIG1hbnkgaW5zdGFuY2VzIHdoZXJlIHdlIG5lZWQgdG8gV0FSTl9PTiBm
b3IgdGhlIHZ1bm1hcAo+IGNvdW50IG1vcmUgdGhhbiB2bWFwIGNvdW50LiBJcyB0aGVyZSBhIHNw
ZWNpZmljIG5lZWQgZm9yIHRoaXMgaW4gdGhlIGhlYXBzPwoKSGkgU3VtaXQsCk15IHdvcnJ5IHdh
cyB0aGF0IGJ1ZmZlci0+dm1hcF9jbnQgY291bGQgc2lsZW50bHkgZ28gbmVnYXRpdmUuIEJ1dCBp
Zgp0aGlzIHdhcm5pbmcgaXMgbm90IGNvbnNpc3RlbnQgd2l0aCBvdGhlciBwbGFjZXMgd2UgZG8g
cmVmY291bnRlZAp2bWFwL3Z1bm1hcCB0aGVuIGZlZWwgZnJlZSB0byBpZ25vcmUgbXkgc3VnZ2Vz
dGlvbi4KVGhhbmtzIQoKPgo+IEJlc3QsCj4gU3VtaXQuCj4gPgo+ID4gQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiBDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2Rl
YXVyb3JhLm9yZz4KPiA+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAa2VybmVsLm9yZz4KPiA+
IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+Cj4gPiBDYzogSHJpZHlh
IFZhbHNhcmFqdSA8aHJpZHlhQGdvb2dsZS5jb20+Cj4gPiBDYzogU3VyZW4gQmFnaGRhc2FyeWFu
IDxzdXJlbmJAZ29vZ2xlLmNvbT4KPiA+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2ds
ZS5jb20+Cj4gPiBDYzogRGFuaWVsIE1lbnR6IDxkYW5pZWxtZW50ekBnb29nbGUuY29tPgo+ID4g
Q2M6IENocmlzIEdvbGRzd29ydGh5IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4KPiA+IENjOiDD
mHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgo+ID4gQ2M6IFJvYmluIE11cnBoeSA8cm9i
aW4ubXVycGh5QGFybS5jb20+Cj4gPiBDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xs
YWJvcmEuY29tPgo+ID4gQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiA+IENj
OiBKYW1lcyBKb25lcyA8amFqb25lc0BudmlkaWEuY29tPgo+ID4gQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
IFN1Z2dlc3RlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAgfCAxICsKPiA+ICBk
cml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyB8IDEgKwo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi9oZWFwcy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiA+
IGluZGV4IDM2NGZjMmYzZTQ5OS4uMGM3NmNiYzNmYjExIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9jbWFfaGVhcC5jCj4gPiBAQCAtMjMyLDYgKzIzMiw3IEBAIHN0YXRpYyB2b2lkIGNtYV9oZWFw
X3Z1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCkK
PiA+ICAgICAgICAgc3RydWN0IGNtYV9oZWFwX2J1ZmZlciAqYnVmZmVyID0gZG1hYnVmLT5wcml2
Owo+ID4KPiA+ICAgICAgICAgbXV0ZXhfbG9jaygmYnVmZmVyLT5sb2NrKTsKPiA+ICsgICAgICAg
V0FSTl9PTihidWZmZXItPnZtYXBfY250ID09IDApOwo+ID4gICAgICAgICBpZiAoIS0tYnVmZmVy
LT52bWFwX2NudCkgewo+ID4gICAgICAgICAgICAgICAgIHZ1bm1hcChidWZmZXItPnZhZGRyKTsK
PiA+ICAgICAgICAgICAgICAgICBidWZmZXItPnZhZGRyID0gTlVMTDsKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9zeXN0ZW1faGVhcC5jCj4gPiBpbmRleCA0MDUzNTFhYWQyYTguLjIzMjFjOTE4OTFmNiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCj4gPiAr
KysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwo+ID4gQEAgLTI3Myw2ICsy
NzMsNyBAQCBzdGF0aWMgdm9pZCBzeXN0ZW1faGVhcF92dW5tYXAoc3RydWN0IGRtYV9idWYgKmRt
YWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4gPiAgICAgICAgIHN0cnVjdCBzeXN0ZW1f
aGVhcF9idWZmZXIgKmJ1ZmZlciA9IGRtYWJ1Zi0+cHJpdjsKPiA+Cj4gPiAgICAgICAgIG11dGV4
X2xvY2soJmJ1ZmZlci0+bG9jayk7Cj4gPiArICAgICAgIFdBUk5fT04oYnVmZmVyLT52bWFwX2Nu
dCA9PSAwKTsKPiA+ICAgICAgICAgaWYgKCEtLWJ1ZmZlci0+dm1hcF9jbnQpIHsKPiA+ICAgICAg
ICAgICAgICAgICB2dW5tYXAoYnVmZmVyLT52YWRkcik7Cj4gPiAgICAgICAgICAgICAgICAgYnVm
ZmVyLT52YWRkciA9IE5VTEw7Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
