Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E683A30045C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032989CCB;
	Fri, 22 Jan 2021 13:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C1E89CCB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:40:23 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ke15so7660232ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Dv7/+/NyO0aDXINqIUmwCPejHTrvrHEAZ2oKeoHKz00=;
 b=B8Uzht5O+sytkMMyGFt6RB/eoKBx4NZ9wnFtWUfDmbh9dXpdusvzx4xAQsutYvZe/l
 vdvaWutIB3OEFjByjwhGLXd3ZfD8IA34CZ7f9o/0ntXc3qSnTwEKXj6Of3xl+sUDlhAG
 OkVvw41IcjzjMYrS2IvAwVEpzJAsPnIwYhLKYrTCDjLK/BGChoBBkAlIyTsPl0MiyFbi
 mMMHe6lA4Fpqj1oEP0qlM0diCQ7YKPx9dQ8FlfgZTKIv9Ndys1R0voP4Oadv82i++yY+
 YKXBNLhZZhl2UlLQFAzm/HGKHyj8zFBJy35vPA/Qb49R5NsPXOHSAirwiGCX/cLtk+ic
 g/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Dv7/+/NyO0aDXINqIUmwCPejHTrvrHEAZ2oKeoHKz00=;
 b=Y5nVFjWU98OXxd3BgnQ37W7mHQw/bPF6NAMypu2DoICf/321GyhKcxfRGf6El26EIk
 rgrNCxp1uxzmZ/MRM2gVMBhkAIf6EX1KvIlCiJIyc8JBwgn7fjQcPvkNxgp0y2wwhPU1
 8CJkM7y2YpOZBNyFrH9ZL60G3DXL+//3BS5PU3d5BiCw4LpaBTTzgLWg2D+VdH+2FgaN
 5r1vxuUZsad4aV6/ECw6tjAF+iBUaml8z4PUDIcewGkUzPnMRIiTvnJ/owR/SO4AUK3b
 5xabXraNoTKIILOMbfpB+eqfmxFHP2GsfqrSVSsyWrK6tmQl3frAxjd9l7s54tMRGzO5
 MPTg==
X-Gm-Message-State: AOAM530f95Qg0qG+cM2EcM7bWxr3K+KtKhMhpPXWau2SZ/Cxy2flMpLB
 FEfJWTBbMjpghKIoeREg6Vk=
X-Google-Smtp-Source: ABdhPJxdFyRIc4cBsYcdHDLtkQZHcOZqQEMWll5DSib2bySsdmIbq2Iw49GkoOEk5IcMal5pOZ/qQw==
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr2965096eja.172.1611322821816; 
 Fri, 22 Jan 2021 05:40:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a10sm4505138ejk.75.2021.01.22.05.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:40:21 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH] drm/todo: Add entry for moving to
 dma_resv_lock
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2282a592-8e19-b5ae-68ba-cf1ad6dda768@gmail.com>
Date: Fri, 22 Jan 2021 14:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
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
Reply-To: christian.koenig@amd.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDEuMjEgdW0gMTQ6MzYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFJlcXVlc3RlZCBi
eSBUaG9tYXMuIEkgdGhpbmsgaXQganVzdGlmaWVzIGEgbmV3IGxldmVsLCBzaW5jZSBJIHRyaWVk
Cj4gdG8gbWFrZSBzb21lIGZvcndhcmQgcHJvZ3Jlc3Mgb24gdGhpcyBsYXN0IHN1bW1lciwgYW5k
IGdhdmUgdXAgKGZvcgo+IG5vdykuIFRoaXMgaXMgdmVyeSB0cmlja3kuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gLS0tCj4gICBEb2N1bWVudGF0
aW9uL2dwdS90b2RvLnJzdCB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUv
dG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IGluZGV4IGRlYTkwODJjMGU1
Zi4uZjg3MmQzZDMzMjE4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiBAQCAtMjMsNiArMjMsOSBAQCBB
ZHZhbmNlZDogVHJpY2t5IHRhc2tzIHRoYXQgbmVlZCBmYWlybHkgZ29vZCB1bmRlcnN0YW5kaW5n
IG9mIHRoZSBEUk0gc3Vic3lzdGVtCj4gICBhbmQgZ3JhcGhpY3MgdG9waWNzLiBHZW5lcmFsbHkg
bmVlZCB0aGUgcmVsZXZhbnQgaGFyZHdhcmUgZm9yIGRldmVsb3BtZW50IGFuZAo+ICAgdGVzdGlu
Zy4KPiAgIAo+ICtFeHBlcnQ6IE9ubHkgYXR0ZW1wdCB0aGVzZSBpZiB5b3UndmUgc3VjY2Vzc2Z1
bGx5IGNvbXBsZXRlZCBzb21lIHRyaWNreQo+ICtyZWZhY3RvcmluZ3MgYWxyZWFkeSBhbmQgYXJl
IGFuIGV4cGVydCBpbiB0aGUgc3BlY2lmaWMgYXJlYQo+ICsKPiAgIFN1YnN5c3RlbS13aWRlIHJl
ZmFjdG9yaW5ncwo+ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gICAKPiBAQCAtMTY4
LDYgKzE3MSwyMiBAQCBDb250YWN0OiBEYW5pZWwgVmV0dGVyLCByZXNwZWN0aXZlIGRyaXZlciBt
YWludGFpbmVycwo+ICAgCj4gICBMZXZlbDogQWR2YW5jZWQKPiAgIAo+ICtNb3ZlIEJ1ZmZlciBP
YmplY3QgTG9ja2luZyB0byBkbWFfcmVzdl9sb2NrKCkKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtNYW55IGRyaXZlcnMgaGF2ZSB0aGVpciBv
d24gcGVyLW9iamVjdCBsb2NraW5nIHNjaGVtZSwgdXN1YWxseSB1c2luZwo+ICttdXRleF9sb2Nr
KCkuIFRoaXMgY2F1c2VzIGFsbCBraW5kcyBvZiB0cm91YmxlIGZvciBidWZmZXIgc2hhcmluZywg
c2luY2UKPiArZGVwZW5kaW5nIHdoaWNoIGRyaXZlciBpcyB0aGUgZXhwb3J0ZXIgYW5kIGltcG9y
dGVyLCB0aGUgbG9ja2luZyBoaWVyYXJjaHkgaXMKPiArcmV2ZXJzZWQuCj4gKwo+ICtUbyBzb2x2
ZSB0aGlzIHdlIG5lZWQgb25lIHN0YW5kYXJkIHBlci1vYmplY3QgbG9ja2luZyBtZWNoYW5pc20s
IHdoaWNoIGlzCj4gK2RtYV9yZXN2X2xvY2soKS4gVGhpcyBsb2NrIG5lZWRzIHRvIGJlIGNhbGxl
ZCBhcyB0aGUgb3V0ZXJtb3N0IGxvY2ssIHdpdGggYWxsCj4gK290aGVyIGRyaXZlciBzcGVjaWZp
YyBwZXItb2JqZWN0IGxvY2tzIHJlbW92ZWQuIFRoZSBwcm9ibGVtIGlzIHRoYSByb2xsaW5nIG91
dAo+ICt0aGUgYWN0dWFsIGNoYW5nZSB0byB0aGUgbG9ja2luZyBjb250cmFjdCBpcyBhIGZsYWcg
ZGF5LCBkdWUgdG8gc3RydWN0IGRtYV9idWYKPiArYnVmZmVyIHNoYXJpbmcuCj4gKwo+ICtMZXZl
bDogRXhwZXJ0Cj4gKwoKQ291bGQgeW91IG5hbWUgc29tZSBleGFtcGxlcyBvZiBkcml2ZXIgbG9j
a3MgaGVyZT8gSSdtIG5vdCBhd2FyZSBpbiAKYW55dGhpbmcgbGlrZSB0aGlzIGluIGFtZGdwdSwg
cmFkZW9uIG9yIG5ldmVhdS4KCkFuZCB5ZXMgc291bmRzIGxpa2UgYSBqb2IgZm9yIHRoZSBhcHBy
b3ByaWF0ZSBkcml2ZXIgbWFpbnRhaW5lci4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiAgIENvbnZl
cnQgbG9nZ2luZyB0byBkcm1fKiBmdW5jdGlvbnMgd2l0aCBkcm1fZGV2aWNlIHBhcmFtYXRlcgo+
ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
