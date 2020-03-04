Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4682179586
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 17:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1117A6EB39;
	Wed,  4 Mar 2020 16:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12896EB39
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 16:41:40 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n18so3057330edw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 08:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ySiSOnqcuA6nNk8c0jQCBZCPf0dSfXosbzJcm8d2dZY=;
 b=CGhp6TNsRBfRwAxiBCYBK+2j2pYnrWkcFtf+MnmaID1ngwxqdlKRJ6FfdxB35Sa+ID
 Og7cAaCnPcGGkMbb9DNd4/GpvNZ0RAupTytTiQZBUPb56W4J0gv+vo2Tp7BqLGM/Wa92
 eNYypwTywpd6WelSB6qAzgraAMaAT725rtlK3vF1oavPqVDtvB5gSUb0EfMWRpOZfXb+
 w86CuJRAP20QEzeMX0DYwE9Xonf5xONmLXLnGqGepmA5OWHvlRbe0HQGvlyYICbwVwdC
 7+2JjcXKhUoM3R4bnp3PLB7ijlZe/D7JyaTO6/lTKOH8JikLCLkg/7X0szhBZCXyU3Mu
 IvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ySiSOnqcuA6nNk8c0jQCBZCPf0dSfXosbzJcm8d2dZY=;
 b=V4PM5IrD/2ikMFQNKTdy37gN3YNA9lzekrO9H3YQ5eRYVZZCJVagA3Q0XdV0RSE7uE
 waokYA8LCUxviu/7MxHltQKnuM1fE50rvWFlmVSJ221dtB9ue4FlzrDmGyMqq2+hIFch
 S1WH9HCroQ0QtjOPE0bT+MS+B+JgM72kv31+FIEcZJO+bIRrzsaQbBR80tOOV87wKo/h
 GZytH9tEt7Diftfc8pfXAgt9vZWdPfkF9rdJ6rXQMi1N8Lgs3GtjYMTAo5z5ST51bHdh
 SK4/9IfbAHDDWUiBtR3Adr0IIi37pKwSmRD9zKx5n4TKz+6YLEReGADD3an4mQ8NEd0+
 buSQ==
X-Gm-Message-State: ANhLgQ34MyuihRlZEWFqi4btz7yyp33WdvtSks4R9aWldFRHyoFJqmV0
 6f5moQN/aiA9c86iE8lFwx4JSL/Yw0gguT5EzZIryw==
X-Google-Smtp-Source: ADFU+vt2Ptn+2fuU7L5gaFz0uxQGB+VvuZ4/Df2PK08OKaAQBCL6bfkBEoaOGk9rhadFD/j7RFC6f9y4mgdpei2KZt8=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr3441099edt.98.1583340099330;
 Wed, 04 Mar 2020 08:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local>
 <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
 <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
 <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
In-Reply-To: <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 4 Mar 2020 10:41:28 -0600
Message-ID: <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Chenbo Feng <fengc@google.com>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Jesse Hall <jessehall@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgNCwgMjAyMCBhdCAxMDoyNyBBTSBKYXNvbiBFa3N0cmFuZCA8amFzb25Aamxl
a3N0cmFuZC5uZXQ+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgNCwgMjAyMCBhdCAyOjM0IEFNIENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
QW0gMDMuMDMuMjAgdW0gMjA6MTAgc2NocmllYiBKYXNvbiBFa3N0cmFuZDoKPiA+ID4gT24gVGh1
LCBGZWIgMjcsIDIwMjAgYXQgMjoyOCBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPiA+IDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4gPj4gW1NOSVBdCj4gPiA+Pj4gSG93ZXZlciwg
SSdtIG5vdCBzdXJlIHdoYXQgdGhlIGJlc3Qgd2F5IGlzIHRvIGRvIGdhcmJhZ2UgY29sbGVjdGlv
biBvbgo+ID4gPj4+IHRoYXQgc28gdGhhdCB3ZSBkb24ndCBnZXQgYW4gaW1wb3NzaWJseSBsaXN0
IG9mIGZlbmNlIGFycmF5cy4KPiA+ID4+IEV4YWN0bHkgeWVzLiBUaGF0J3MgYWxzbyB0aGUgcmVh
c29uIHdoeSB0aGUgZG1hX2ZlbmNlX2NoYWluIGNvbnRhaW5lciBJCj4gPiA+PiBjYW1lIHVwIHdp
dGggZm9yIHRoZSBzeW5jIHRpbWVsaW5lIHN0dWZmIGhhcyBzdWNoIGEgcmF0aGVyIHNvcGhpc3Rp
Y2F0ZWQKPiA+ID4+IGdhcmJhZ2UgY29sbGVjdGlvbi4KPiA+ID4+Cj4gPiA+PiBXaGVuIHNvbWUg
b2YgdGhlIGluY2x1ZGVkIGZlbmNlcyBzaWduYWwgeW91IG5lZWQgdG8gZnJlZSB1cCB0aGUKPiA+
ID4+IGFycmF5L2NoYWluIGFuZCBtYWtlIHN1cmUgdGhhdCB0aGUgbWVtb3J5IGZvciB0aGUgY29u
dGFpbmVyIGNhbiBiZSByZXVzZWQuCj4gPiA+IEN1cnJlbnRseSAoYXMgb2YgdjIpLCBJJ20gdXNp
bmcgZG1hX2ZlbmNlX2FycmF5IGFuZCBiZWluZyBjYXJlZnVsIHRvCj4gPiA+IG5vdCBib3RoZXIg
Y29uc3RydWN0aW5nIG9uZSBpZiB0aGVyZSdzIG9ubHkgb25lIGZlbmNlIGluIHBsYXkuICBJcwo+
ID4gPiB0aGlzIGluc3VmZmljaWVudD8gIElmIHNvLCBtYXliZSB3ZSBzaG91bGQgY29uc2lkZXIg
aW1wcm92aW5nCj4gPiA+IGRtYV9mZW5jZV9hcnJheS4KPiA+Cj4gPiBUaGF0IHN0aWxsIHdvbid0
IHdvcmsgY29ycmVjdGx5IGluIGFsbCBjYXNlcy4gU2VlIHRoZSBwcm9ibGVtIGlzIG5vdAo+ID4g
b25seSBvcHRpbWl6YXRpb24sIGJ1dCBhbHNvIGF2b2lkaW5nIHNpdHVhdGlvbnMgd2hlcmUgdXNl
cnNwYWNlIGNhbgo+ID4gYWJ1c2UgdGhlIGludGVyZmFjZSB0byBkbyBuYXN0eSB0aGluZ3MuCj4g
Pgo+ID4gRm9yIGV4YW1wbGUgaWYgdXNlcnNwYWNlIGp1c3QgY2FsbHMgdGhhdCBmdW5jdGlvbiBp
biBhIGxvb3AgeW91IGNhbgo+ID4gY3JlYXRlIGEgbG9uZyBjaGFpbiBvZiBkbWFfZmVuY2VfYXJy
YXkgb2JqZWN0cy4KPiA+Cj4gPiBJZiB0aGF0IGNoYWluIGlzIHRoZW4gc3VkZGVubHkgcmVsZWFz
ZWQgdGhlIHJlY3Vyc2l2ZSBkcm9wcGluZyBvZgo+ID4gcmVmZXJlbmNlcyBjYW4gb3ZlcndyaXRl
IHRoZSBrZXJuZWwgc3RhY2suCj4gPgo+ID4gRm9yIHJlZmVyZW5jZSBzZWUgd2hhdCBkYW5jZSBp
cyBuZWNlc3NhcnkgaW4gdGhlIGRtYV9mZW5jZV9jaGFpbl9yZWxlYXNlCj4gPiBmdW5jdGlvbiB0
byBhdm9pZCB0aGF0Ogo+ID4gPiAgICAgICAgIC8qIE1hbnVhbGx5IHVubGluayB0aGUgY2hhaW4g
YXMgbXVjaCBhcyBwb3NzaWJsZSB0byBhdm9pZAo+ID4gPiByZWN1cnNpb24KPiA+ID4gICAgICAg
ICAgKiBhbmQgcG90ZW50aWFsIHN0YWNrIG92ZXJmbG93Lgo+ID4gPiAgICAgICAgICAqLwo+ID4g
PiAgICAgICAgIHdoaWxlICgocHJldiA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoY2hhaW4t
PnByZXYsIHRydWUpKSkgewo+ID4gLi4uLgo+ID4KPiA+IEl0IHRvb2sgbWUgcXVpdGUgYSB3aGls
ZSB0byBmaWd1cmUgb3V0IGhvdyB0byBkbyB0aGlzIHdpdGhvdXQgY2F1c2luZwo+ID4gaXNzdWVz
LiBCdXQgSSBkb24ndCBzZWUgaG93IHRoaXMgd291bGQgYmUgcG9zc2libGUgZm9yIGRtYV9mZW5j
ZV9hcnJheS4KPgo+IEFoLCBJIHNlZSB0aGUgaXNzdWUgbm93ISAgSXQgaGFkbid0IGV2ZW4gb2Nj
dXJyZWQgdG8gbWUgdGhhdCB1c2Vyc3BhY2UKPiBjb3VsZCB1c2UgdGhpcyB0byBidWlsZCB1cCBh
biBpbmZpbml0ZSByZWN1cnNpb24gY2hhaW4uICBUaGF0J3MgbmFzdHkhCj4gIEknbGwgZ2l2ZSB0
aGlzIHNvbWUgbW9yZSB0aG91Z2h0IGFuZCBzZWUgaWYgY2FuIGNvbWUgdXAgd2l0aAo+IHNvbWV0
aGluZyBjbGV2ZXIuCj4KPiBIZXJlJ3Mgb25lIHRob3VnaHQ6ICBXZSBjb3VsZCBtYWtlIGRtYV9m
ZW5jZV9hcnJheSBhdXRvbWF0aWNhbGx5Cj4gY29sbGFwc2UgYW55IGFycmF5cyBpdCByZWZlcmVu
Y2VzIGFuZCBpbnN0ZWFkIGRpcmVjdGx5IHJlZmVyZW5jZSB0aGVpcgo+IGZlbmNlcy4gIFRoaXMg
d2F5LCBubyBtYXR0ZXIgaG93IG11Y2ggdGhlIGNsaWVudCBjaGFpbnMgdGhpbmdzLCB0aGV5Cj4g
d2lsbCBuZXZlciBnZXQgbW9yZSB0aGFuIG9uZSBkbWFfZmVuY2VfYXJyYXkuICBPZiBjb3Vyc2Us
IHRoZQo+IGRpZmZpY3VsdHkgaGVyZSAoYW5zd2VyaW5nIG15IG93biBxdWVzdGlvbikgY29tZXMg
aWYgdGhleSBwaW5nLXBvbmcKPiBiYWNrLWFuZC1mb3J0aCBiZXR3ZWVuIHNvbWV0aGluZyB3aGlj
aCBjb25zdHJ1Y3RzIGEgZG1hX2ZlbmNlX2FycmF5Cj4gYW5kIHNvbWV0aGluZyB3aGljaCBjb25z
dHJ1Y3RzIGEgZG1hX2ZlbmNlX2NoYWluIHRvIGdldAo+IGFycmF5LW9mLWNoYWluLW9mLWFycmF5
LW9mLWNoYWluLW9mLS4uLiAgTW9yZSB0aG91Z2h0IG5lZWRlZC4KCkFuc3dlcmluZyBteSBvd24g
cXVlc3Rpb25zIGFnYWluLi4uICBJIHRoaW5rIHRoZQphcnJheS1vZi1jaGFpbi1vZi1hcnJheSBj
YXNlIGlzIGFsc28gc29sdmFibGUuCgpGb3IgYXJyYXktb2YtY2hhaW4sIHdlIGNhbiBzaW1wbHkg
YWRkIGFsbCB1bnNpZ25hbGVkIGRtYV9mZW5jZXMgaW4gdGhlCmNoYWluIHRvIHRoZSBhcnJheS4g
IFRoZSBhcnJheSB3b24ndCBzaWduYWwgdW50aWwgYWxsIG9mIHRoZW0gaGF2ZQp3aGljaCBpcyBl
eGFjdGx5IHRoZSBzYW1lIGJlaGF2aW9yIGFzIGlmIHdlJ2QgYWRkZWQgdGhlIGNoYWluIGl0c2Vs
Zi4KCkZvciBjaGFpbi1vZi1hcnJheSwgd2UgY2FuIGFkZCBhbGwgdW5zaWduYWxlZCBkbWFfZmVu
Y2VzIGluIHRoZSBhcnJheQp0byB0aGUgc2FtZSBwb2ludCBpbiB0aGUgY2hhaW4uICBUaGVyZSBt
YXkgYmUgc29tZSBmaWRkbGluZyB3aXRoIHRoZQpjaGFpbiBudW1iZXJpbmcgcmVxdWlyZWQgaGVy
ZSBidXQgSSB0aGluayB3ZSBjYW4gZ2V0IGl0IHNvIHRoZSBjaGFpbgp3b24ndCBzaWduYWwgdW50
aWwgZXZlcnl0aGluZyBpbiB0aGUgYXJyYXkgaGFzIHNpZ25hbGVkIGFuZCB3ZSBnZXQgdGhlCnNh
bWUgYmVoYXZpb3IgYXMgaWYgd2UnZCBhZGRlZCB0aGUgZG1hX2ZlbmNlX2FycmF5IHRvIHRoZSBj
aGFpbi4KCkluIGJvdGggY2FzZXMsIHdlIGVuZCB1cCB3aXRoIGVpdGhlciBhIHNpbmdsZSBhcnJh
eSBvciBhIHNpbmdsZSBhbmQKZGVzdHJ1Y3Rpb24gZG9lc24ndCByZXF1aXJlIHJlY3Vyc2lvbi4g
IFRob3VnaHRzPwoKLS1KYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
