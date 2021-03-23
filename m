Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C2345DF2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECF06E10E;
	Tue, 23 Mar 2021 12:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845FE6E059;
 Tue, 23 Mar 2021 12:21:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b16so23220424eds.7;
 Tue, 23 Mar 2021 05:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+l1FkHneCCxWHd7Lw55HE5rWouIsqHp49qYTvqtcL2k=;
 b=c8HZ4UuxI4tMpK3bfOLxR2mpo2MYKjvUiQ3fDpVE+daGCpuplamrRZQkT+MrcWUDbE
 5fyesazaC9swWYpVAsVh4bjZCtwWMyo/tYRDg8l+MScxBoss1amGb4MNmqBlxAzSsGPY
 gOG1OA3nzcmgdlOYVNV3GxkgtZojqXbIgReIqXgqpyfywJ5+hzVa7c24OFzgdgVYRkTY
 X8zseP4vAQZp4vxpZJollDELEll+ZMamuzK23/jJ7yRb7Ifi+XvjIer9ZwRemGYQ315T
 /DXnwlr8mzNHEe9AYR+J/Jv2FPEsCyxQ60Uf8yJ6Uv1DjSraOu2v18Vtd+YfcHVagmnn
 UdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+l1FkHneCCxWHd7Lw55HE5rWouIsqHp49qYTvqtcL2k=;
 b=Bn2y193fiD5ieUrv2o9vd5/qFcFlJkQjp4vDDrTa0PB9GUHwF9grJY5YdoYOUTsaJW
 Y+YiX+IBujcDQTHStRNneIUcT44VbxdIDofNTz/tEUqDnrecEisYyIk8eqkEHCpfPfb9
 eUtlPphBS6BrhS7vHmmu2brEbzeyRii5ws+A7T0raiBx/SCO7JaFXbJDXAh51/ur0hG0
 6xEnP4ddBNb7U0PkcczDPCAp4vEvcwO5vrAFuChrXltWJyot1mi3CJoSj/GWrm04eLjI
 U2rbUyGIXqmngk4+HXyJCdHwMbnKPIQl9tJk1x5OPHGh8tY1OlpkyzuWh2o52BZc809q
 JU2A==
X-Gm-Message-State: AOAM530LZjvFFYI3uMRTMn+kGHRrASmK3/55hYzNrwY40fP0h5zq0wvU
 R3clqD+86+5sA5k4qKmCUuE=
X-Google-Smtp-Source: ABdhPJzVRLqp4Hqmn/EMxIcWHlx0cmTl0G2L+0FrDyPfaGc6f7BT8Nm5ZnhhEkfP/NS62yrvo8DYwg==
X-Received: by 2002:aa7:c850:: with SMTP id g16mr4274306edt.324.1616502094239; 
 Tue, 23 Mar 2021 05:21:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec?
 ([2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec])
 by smtp.gmail.com with ESMTPSA id p24sm12790444edt.5.2021.03.23.05.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 05:21:33 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Michal Hocko <mhocko@suse.com>
References: <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz> <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
Date: Tue, 23 Mar 2021 13:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
Content-Language: en-US
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
Cc: Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDMuMjEgdW0gMTM6MDQgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gT24gVHVlIDIzLTAz
LTIxIDEyOjQ4OjU4LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyMy4wMy4yMSB1bSAx
MjoyOCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBUdWUsIE1hciAyMywgMjAyMSBhdCAw
ODozODozM0FNICswMTAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+Pj4gT24gTW9uIDIyLTAzLTIx
IDIwOjM0OjI1LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFsuLi5dCj4+Pj4+IE15IG9ubHkg
Y29uY2VybiBpcyB0aGF0IGlmIEkgY291bGQgcmVseSBvbiBtZW1hbGxvY19ubyogYmVpbmcgdXNl
ZCB3ZSBjb3VsZAo+Pj4+PiBvcHRpbWl6ZSB0aGlzIHF1aXRlIGEgYml0IGZ1cnRoZXIuCj4+Pj4g
WWVzIHlvdSBjYW4gdXNlIHRoZSBzY29wZSBBUEkgYW5kIHlvdSB3aWxsIGJlIGd1YXJhbnRlZWQg
dGhhdCBfYW55Xwo+Pj4+IGFsbG9jYXRpb24gZnJvbSB0aGUgZW5jbG9zZWQgY29udGV4dCB3aWxs
IGluaGVyaXQgR0ZQX05PKiBzZW1hbnRpYy4KPj4gVGhlIHF1ZXN0aW9uIGlzIGlmIHRoaXMgaXMg
YWxzbyBndWFyYW50ZWVkIHRoZSBvdGhlciB3YXkgYXJvdW5kPwo+Pgo+PiBJbiBvdGhlciB3b3Jk
cyBpZiBzb21lYm9keSBjYWxscyBnZXRfZnJlZV9wYWdlKEdGUF9OT0ZTKSBhcmUgdGhlIGNvbnRl
eHQKPj4gZmxhZ3Mgc2V0IGFzIHdlbGw/Cj4gZ2ZwIG1hc2sgaXMgYWx3YXlzIHJlc3RyaWN0ZWQg
aW4gdGhlIHBhZ2UgYWxsb2NhdG9yLiBTbyBzYXkgeW91IGhhdmUKPiBub2lvIHNjb3BlIGNvbnRl
eHQgYW5kIGNhbGwgZ2V0X2ZyZWVfcGFnZS9rbWFsbG9jKEdGUF9OT0ZTKSB0aGVuIHRoZQo+IHNj
b3BlIHdvdWxkIHJlc3RyaWN0IHRoZSBhbGxvY2F0aW9uIGZsYWdzIHRvIEdGUF9OT0lPIChha2Eg
ZHJvcAo+IF9fR0ZQX0lPKS4gRm9yIGZ1cnRoZXIgZGV0YWlscywgaGF2ZSBhIGxvb2sgYXQgY3Vy
cmVudF9nZnBfY29udGV4dAo+IGFuZCBpdHMgY2FsbGVycy4KPgo+IERvZXMgdGhpcyBhbnN3ZXIg
eW91ciBxdWVzdGlvbj8KCkJ1dCB3aGF0IGhhcHBlbnMgaWYgeW91IGRvbid0IGhhdmUgbm9pbyBz
Y29wZSBhbmQgc29tZWJvZHkgY2FsbHMgCmdldF9mcmVlX3BhZ2UoR0ZQX05PRlMpPwoKSXMgdGhl
biB0aGUgbm9pbyBzY29wZSBhZGRlZCBhdXRvbWF0aWNhbGx5PyBBbmQgaXMgaXQgcG9zc2libGUg
dGhhdCB0aGUgCnNocmlua2VyIGdldHMgY2FsbGVkIHdpdGhvdXQgbm9pbyBzY29wZSBldmVuIHdl
IHdvdWxkIG5lZWQgaXQ/Cgo+Pj4+IEkgdGhpbmsgdGhpcyBpcyB3aGVyZSBJIGRvbid0IGdldCB5
ZXQgd2hhdCBDaHJpc3RpYW4gdHJpZXMgdG8gZG86IFdlCj4+Pj4gcmVhbGx5IHNob3VsZG4ndCBk
byBkaWZmZXJlbnQgdHJpY2tzIGFuZCBjYWxsaW5nIGNvbnRleHRzIGJldHdlZW4gZGlyZWN0Cj4+
Pj4gcmVjbGFpbSBhbmQga3N3YXBkIHJlY2xhaW0uIE90aGVyd2lzZSB2ZXJ5IGhhcmQgdG8gdHJh
Y2sgZG93biBidWdzIGFyZQo+Pj4+IHByZXR0eSBtdWNoIGd1YXJhbnRlZWQuIFNvIHdoZXRoZXIg
d2UgdXNlIGV4cGxpY2l0IGdmcCBmbGFncyBvciB0aGUKPj4+PiBjb250ZXh0IGFwaXMsIHJlc3Vs
dCBpcyBleGFjdGx5IHRoZSBzYW1lLgo+PiBPayBsZXQgdXMgcmVjYXAgd2hhdCBUVE1zIFRUIHNo
cmlua2VyIGRvZXMgaGVyZToKPj4KPj4gMS4gV2UgZ290IG1lbW9yeSB3aGljaCBpcyBub3Qgc3dh
cGFibGUgYmVjYXVzZSBpdCBtaWdodCBiZSBhY2Nlc3NlZCBieSB0aGUKPj4gR1BVIGF0IGFueSB0
aW1lLgo+PiAyLiBNYWtlIHN1cmUgdGhlIG1lbW9yeSBpcyBub3QgYWNjZXNzZWQgYnkgdGhlIEdQ
VSBhbmQgZHJpdmVyIG5lZWQgdG8gZ3JhYiBhCj4+IGxvY2sgYmVmb3JlIHRoZXkgY2FuIG1ha2Ug
aXQgYWNjZXNzaWJsZSBhZ2Fpbi4KPj4gMy4gQWxsb2NhdGUgYSBzaG1lbSBmaWxlIGFuZCBjb3B5
IG92ZXIgdGhlIG5vdCBzd2FwYWJsZSBwYWdlcy4KPiBUaGlzIGlzIHF1aXRlIHRyaWNreSBiZWNh
dXNlIHRoZSBzaHJpbmtlciBvcGVyYXRlcyBpbiB0aGUgUEZfTUVNQUxMT0MKPiBjb250ZXh0IHNv
IHN1Y2ggYW4gYWxsb2NhdGlvbiB3b3VsZCBiZSBhbGxvd2VkIHRvIGNvbXBsZXRlbHkgZGVwbGV0
ZQo+IG1lbW9yeSB1bmxlc3MgeW91IGV4cGxpY2l0bHkgbWFyayB0aGF0IGNvbnRleHQgYXMgX19H
RlBfTk9NRU1BTExPQy4KClRoYW5rcywgZXhhY3RseSB0aGF0IHdhcyBvbmUgdGhpbmcgSSB3YXMg
YWJzb2x1dGVseSBub3Qgc3VyZSBhYm91dC4gQW5kIAp5ZXMgSSBhZ3JlZSB0aGF0IHRoaXMgaXMg
cmVhbGx5IHRyaWNreS4KCklkZWFsbHkgSSB3b3VsZCBsaWtlIHRvIGJlIGFibGUgdG8gdHJpZ2dl
ciBzd2FwcGluZyBvdXQgdGhlIHNobWVtIHBhZ2UgSSAKYWxsb2NhdGVkIGltbWVkaWF0ZWx5IGFm
dGVyIGRvaW5nIHRoZSBjb3B5LgoKVGhpcyB3YXkgSSB3b3VsZCBvbmx5IG5lZWQgYSBzaW5nbGUg
cGFnZSBmb3IgdGhlIHdob2xlIHNocmluayBvcGVyYXRpb24gCmF0IGFueSBnaXZlbiB0aW1lLgoK
PiBBbHNvIG5vdGUgdGhhdCBpZiB0aGUgYWxsb2NhdGlvbiBjYW5ub3Qgc3VjY2VlZCBpdCB3aWxs
IG5vdCB0cmlnZ2VyIHJlY2xhaW0KPiBhZ2FpbiBiZWNhdXNlIHlvdSBhcmUgYWxyZWFkeSBjYWxs
ZWQgZnJvbSB0aGUgcmVjbGFpbSBjb250ZXh0Lgo+Cj4+IDQuIEZyZWUgdGhlIG5vdCBzd2FwYWJs
ZS9yZWNsYWltYWJsZSBwYWdlcy4KPj4KPj4gVGhlIHBhZ2VzIHdlIGdvdCBmcm9tIHRoZSBzaG1l
bSBmaWxlIGFyZSBlYXNpbHkgc3dhcGFibGUgdG8gZGlzayBhZnRlciB0aGUKPj4gY29weSBpcyBj
b21wbGV0ZWQuIEJ1dCBvbmx5IGlmIElPIGlzIG5vdCBhbHJlYWR5IGJsb2NrZWQgYmVjYXVzZSB0
aGUKPj4gc2hyaW5rZXIgd2FzIGNhbGxlZCBmcm9tIGFuIGFsbG9jYXRpb24gcmVzdHJpY3RlZCBi
eSBHRlBfTk9GUyBvciBHRlBfTk9JTy4KPiBTb3JyeSBmb3IgYmVpbmcgZGVuc2UgaGVyZSBidXQg
SSBzdGlsbCBkbyBub3QgZm9sbG93IHRoZSBhY3R1YWwgcHJvYmxlbQo+ICh3ZWxsLCBleGNlcHQg
Zm9yIHRoZSBhYm92ZSBtZW50aW9uZWQgb25lKS4gSXMgdGhlIHNvbGUgcG9pbnQgb2YgdGhpcyB0
bwo+IGVtdWxhdGUgYSBHRlBfTk8qIGFsbG9jYXRpb24gY29udGV4dCBhbmQgc2VlIGhvdyBzaHJp
bmtlciBiZWhhdmVzPwoKUGxlYXNlIGJlIGFzIGRlbnNlIGFzIHlvdSBuZWVkIHRvIGJlIDopCgpJ
IHRoaW5rIERhbmllbCBhbmQgSSBvbmx5IGhhdmUgYSB2ZXJ5IHJvdWdoIHVuZGVyc3RhbmRpbmcg
b2YgdGhlIG1lbW9yeSAKbWFuYWdlbWVudCBkZXRhaWxzIGhlcmUsIGJ1dCB3ZSBuZWVkIGV4YWN0
bHkgdGhhdCBrbm93bGVkZ2UgdG8gZ2V0IHRoZSAKR1BVIG1lbW9yeSBtYW5hZ2VtZW50IGludG8g
dGhlIHNoYXBlIHdlIHdhbnQgaXQgdG8gYmUuCgpUaGFua3MsCkNocmlzdGlhbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
