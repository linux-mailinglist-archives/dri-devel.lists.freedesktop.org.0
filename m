Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0C98981
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 04:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AAA6EA53;
	Thu, 22 Aug 2019 02:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FB26E9BD;
 Thu, 22 Aug 2019 02:37:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id d16so4110224wme.2;
 Wed, 21 Aug 2019 19:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FnJXlWkYTImrZ648hhe3Q+F34mtsiF3thL6otpcC1pg=;
 b=X/37NO6iZMPKOrOuHZeutP32FDcBY3O+tzZmfcA4rp14cHec2ev98OblD4t3oKSU7X
 uJPLKtqETAuWu0JDNsa35BPqwgCEGVeAOBFfd1Re+RTZ2ssUv7WB+ym+fyCgP9YlXRvg
 K8MMg+Wu2QjBV32HcYUQqNPTU1zTKowf+z1c+AKjsVmgLInwgPX+U/SUWB7DWY9+WWZO
 ICQNXaAPVdt+KaRhklUjzz3hrQbEHj2RlPCuYodss+Z0vaOF+P/Nzp9DdbiGKeCZ8qJh
 Ti9pt84haFz1KCYB3UH/bIvIBOjIcKyziIeSrH88IRo5ToGbCkeuNCDvv+ZY9NQyYmN9
 1foA==
X-Gm-Message-State: APjAAAUOfmqfXVj66s9jIRjkwrOjc7FXkvpN6schVzTxxb06Pz3FspOA
 tN5+qaQthX67ZI8XxLReZhLRlOKPqgr8Efej5Lg=
X-Google-Smtp-Source: APXvYqzLSen9+2Ns3bu+kBmfqQDECPwm5ebLUwETew2hhJHQ3IVaaPRqtbUBq/phve0FdPRxGU4Ya23E6UtBJf+eykI=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr3018156wmd.34.1566441458066; 
 Wed, 21 Aug 2019 19:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190627075350.86800-1-yuehaibing@huawei.com>
In-Reply-To: <20190627075350.86800-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2019 22:37:26 -0400
Message-ID: <CADnq5_PE3r+4ZrUmc7o0_ah4wZpBi5jhR-yBHA_F+9gzX7Os5Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable
 'psp_enabled'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FnJXlWkYTImrZ648hhe3Q+F34mtsiF3thL6otpcC1pg=;
 b=ZTSUneOsoNDwJqBUVGQ6y9p4QAVbDXIEigOZHHNRzQV9YZnmv/Ap2WPnFoeiaigESJ
 Io/dRVe538Au1IGYFxmVwAjEpNpX+04la9qaHRAlVK3TL9tArl2Ah20M/2n3TqgrqRNq
 FCHEu7ZyQEdL/zQkG+ZhdVoUmVQsQGyRS3yvwCjh9kmTDGzaZrHX78+wsFuWTvZ2/3UV
 ihouujRlDyZ/HOcJLhj2Ckp0YAUCQFiRecSoqZ+uHjamfSO9/UmPp9dQH+s9FlCLpZgX
 cncAl6xgVZUo4AWg5bjaRdyzGC5s36x1F4G+aOPzyLyEJebMd2HNMThGZNCMzuEPtQ/O
 wD3Q==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Dave Airlie <airlied@linux.ie>, Leo Liu <leo.liu@amd.com>,
 tiancyin <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDEwOjI5IEFN
IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBGaXhlcyBnY2Mg
Jy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9udi5jOiBJbiBmdW5jdGlvbiAnbnZfY29tbW9uX2Vhcmx5X2luaXQnOgo+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmM6NDcxOjc6IHdhcm5pbmc6Cj4gIHZhcmlhYmxl
ICdwc3BfZW5hYmxlZCcgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KPgo+IEl0J3Mgbm90IHVzZWQgc2luY2UgaW5yb2R1Y3Rpb24gaW4KPiBjb21taXQgYzZiNmE0
MjE3NWY1ICgiZHJtL2FtZGdwdTogYWRkIG5hdmkxMCBjb21tb24gaXAgYmxvY2sgKHYzKSIpCj4K
PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCA1IC0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4gaW5kZXgg
YWYyMGZmYjU1YzU0Li44YjlmYTNkYjhkYWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMK
PiBAQCAtNDY4LDcgKzQ2OCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVu
Y3MgbnZfYXNpY19mdW5jcyA9Cj4KPiAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2
b2lkICpoYW5kbGUpCj4gIHsKPiAtICAgICAgIGJvb2wgcHNwX2VuYWJsZWQgPSBmYWxzZTsKPiAg
ICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOwo+Cj4gICAgICAgICBhZGV2LT5zbWNfcnJlZyA9IE5VTEw7Cj4gQEAgLTQ4NSwx
MCArNDg0LDYgQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUp
Cj4KPiAgICAgICAgIGFkZXYtPmFzaWNfZnVuY3MgPSAmbnZfYXNpY19mdW5jczsKPgo+IC0gICAg
ICAgaWYgKGFtZGdwdV9kZXZpY2VfaXBfZ2V0X2lwX2Jsb2NrKGFkZXYsIEFNRF9JUF9CTE9DS19U
WVBFX1BTUCkgJiYKPiAtICAgICAgICAgICAoYW1kZ3B1X2lwX2Jsb2NrX21hc2sgJiAoMSA8PCBB
TURfSVBfQkxPQ0tfVFlQRV9QU1ApKSkKPiAtICAgICAgICAgICAgICAgcHNwX2VuYWJsZWQgPSB0
cnVlOwo+IC0KPiAgICAgICAgIGFkZXYtPnJldl9pZCA9IG52X2dldF9yZXZfaWQoYWRldik7Cj4g
ICAgICAgICBhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSAweGZmOwo+ICAgICAgICAgc3dpdGNoIChh
ZGV2LT5hc2ljX3R5cGUpIHsKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
