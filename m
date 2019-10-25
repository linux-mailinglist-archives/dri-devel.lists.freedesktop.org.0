Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317CCE6E16
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C426E47A;
	Mon, 28 Oct 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE0B6EBCF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 23:32:42 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id q24so3119339edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53yH7/uaXqdrwxgYB9Z47HSHpvLxk3mUn6GWgjoDX1k=;
 b=nKJHu+DILsFHu7SZgVK1m2I5I3zv3dy5wyDPxsAXuynLAS2klJpCc67VJqd4B8ReP6
 xNqOecdMRcRuXeF+J7J/69z5J7l5BQDShyA/ciKRCnl4jnDYQFlNLc4x6meRsPiGrvYW
 /09Wbb8VOMOJtOh0KjZ8bQ3vsleQexuo7mXPKrSQ8RhtUc51t/LGSl7t6tefP2mYegWx
 KssnfJW47kRAcHn3GcdX3kE0nY8miAR/MR3NvyXhjroBUvbF1qod6EtR4te77ebZCO/9
 1cWY+u8iUOlU4lwElLQxNUyp8eb31jh1CXb495mpb2fs5hLl0vhAsdQrG1k6hEFu27Vp
 DQTQ==
X-Gm-Message-State: APjAAAVPR0kwajLy9JfmhbJrfVPwp8NrAqgzMbZxW3tfgTSdv4zPPYTv
 ahbBwpGwl2MZ1/ao5nCSL8eEzSz1Ya2vKP5RU8Y=
X-Google-Smtp-Source: APXvYqz769LDdVQAKT6dKxtfm0ChR8hbmqoc0jVwlkWk2TcKLi8TwfsfQMql2BOxt6F8LwNgS6lRRTuNz9I/hd3Zw1M=
X-Received: by 2002:a17:906:e82:: with SMTP id
 p2mr5896396ejf.237.1572046361188; 
 Fri, 25 Oct 2019 16:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191025225009.50305-1-john.stultz@linaro.org>
 <20191025225009.50305-2-john.stultz@linaro.org>
In-Reply-To: <20191025225009.50305-2-john.stultz@linaro.org>
From: Rob Herring <rob.e.herring@gmail.com>
Date: Fri, 25 Oct 2019 18:32:29 -0500
Message-ID: <CAC=3eda3sCMjCQbFX2Y0-6iVt-YRR7P_Y1ksJOsLw9CmJJRxbA@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] dt-bindings: dma-buf: heaps: Describe CMA
 regions to be added to dmabuf heaps interface.
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=53yH7/uaXqdrwxgYB9Z47HSHpvLxk3mUn6GWgjoDX1k=;
 b=DO2SmefHOAxn4ZRC/98N4YdzE/zPlygnI3sdZ/lMw8GE1Y0Jn+4ecitQL7PrEYjGNw
 nQO6urZcflUp3c+zcDVjzayJv+IrElZA2btlmB3VaFWiL3jmKwLwSiQ1OxdhcsXuZI+L
 g+eV3KjvUpPKvnhtHgLRTuKuPpD0jg+V0ZN5qnxWgTpnXqsP+SDsqu0W0Bzb+stVXhgk
 RWjG2kHGTXqK0jCfgqtjCSzL8QQ4chhr/EyVRDBCuEXwVFT16w+jM6bUBju/OUqIoJDj
 KOp0FPD9cjau7zgCUdkP/nQ5aLjrK2hB9iKTIbO5A4dd0tc0wNwqKQoR4ZxZ6SNkIybw
 gWlQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgNTo1MSBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGJpbmRpbmcgc3BlY2lmaWVzIHdoaWNoIENNQSBy
ZWdpb25zIHNob3VsZCBiZSBhZGRlZCB0byB0aGUKPiBkbWFidWYgaGVhcHMgaW50ZXJmYWNlLgoK
SXMgdGhpcyBhbiBJT04gRFQgYmluZGluZyBpbiBkaXNndWlzZT8gSSB0aG91Z2h0IEkga2lsbGVk
IHRoYXQuIDspCgo+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4gQ2M6
IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gQ2M6IExhdXJhIEFiYm90dCA8
bGFiYm90dEByZWRoYXQuY29tPgo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2Fp
Z25hcmRAbGluYXJvLm9yZz4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJv
Lm9yZz4KPiBDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KPiBDYzogUHJhdGlr
IFBhdGVsIDxwcmF0aWtwQGNvZGVhdXJvcmEub3JnPgo+IENjOiBCcmlhbiBTdGFya2V5IDxCcmlh
bi5TdGFya2V5QGFybS5jb20+Cj4gQ2M6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KPiBD
YzogQ2hlbmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+Cj4gQ2M6IEFsaXN0YWlyIFN0cmFjaGFu
IDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KPiBDYzogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29n
bGUuY29tPgo+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiBDYzog
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8u
b3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQgICAgICAg
ICAgfCAzMSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmRlN2IxZjFjMjY5Cj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEv
ZG1hYnVmLWhlYXAtY21hLnR4dAo+IEBAIC0wLDAgKzEsMzEgQEAKPiArKiBETUEtQlVGIENNQSBI
ZWFwCj4gKwo+ICtTcGVjaWZpZXMgYSBDTUEgcmVnaW9uIHRoYXQgc2hvdWxkIGJlIGFkZGVkIHRv
IHRoZSBkbWEtYnVmIGhlYXBzCj4gK2ludGVyZmFjZS4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gKy0gY29tcGF0aWJsZTogTXVzdCBiZSAiZG1hYnVmLWhlYXAtY21hIgo+ICstIG1lbW9y
eS1yZWdpb246IHBoYW5kbGUgdG8gYSBDTUEgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUKPiArCj4gK0V4
YW1wbGU6Cj4gK1RoaXMgZXhhbXBsZSBoYXMgYSBjYW1lcmEgQ01BIG5vZGUgaW4gcmVzZXJ2ZWQg
bWVtb3J5LCB3aGljaCBpcyB0aGVuCj4gK3JlZmVyZW5jZWQgYnkgdGhlIGRtYWJ1Zi1oZWFwLWNt
YSBub2RlLgo+ICsKPiArCj4gKyAgICAgICByZXNlcnZlZC1tZW1vcnkgewo+ICsgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiArICAgICAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8Mj47Cj4gKyAgICAgICAgICAgICAgIHJhbmdlczsKPiArICAgICAgICAgICAgICAgLi4uCj4g
KyAgICAgICAgICAgICAgIGNtYV9jYW1lcmE6IGNtYS1jYW1lcmEgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwIDB4MjRDMDAwMDAgMHgwIDB4NDAwMDAwMD47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV1c2FibGU7Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAg
ICAgICAgICAgIC4uLgo+ICsgICAgICAgfTsKPiArCj4gKyAgICAgICBjbWFfaGVhcCB7Cj4gKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZG1hYnVmLWhlYXAtY21hIjsKPiArICAgICAgICAg
ICAgICAgbWVtb3J5LXJlZ2lvbiA9IDwmY21hX2NhbWVyYT47CgpXaHkgdGhlIGluZGlyZWN0aW9u
IGhlcmU/IENhbid0IHlvdSBqdXN0IGFkZCBhIGZsYWcgcHJvcGVydHkgdG8KcmVzZXJ2ZWQtbWVt
b3J5IG5vZGVzIGxpa2Ugd2UgZG8gdG8gZmxhZyBDTUEgbm9kZXM/CgpBcyBJIHN1c3BlY3RlZCwg
aXQncyBiZWNhdXNlIGluIHBhdGNoIDIgeW91J3JlIGp1c3QgYWJ1c2luZyBEVCB0bwppbnN0YW50
aWF0ZSBwbGF0Zm9ybSBkZXZpY2VzLiBXZSBhbHJlYWR5IHN1cHBvcnQgYmluZGluZyBkcml2ZXJz
IHRvCnJlc2VydmVkLW1lbW9yeSBub2RlcyBkaXJlY3RseS4KClJvYgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
