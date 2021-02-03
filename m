Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A330D738
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4D6EA44;
	Wed,  3 Feb 2021 10:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6D26EA44
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:18:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d16so23466905wro.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=U7wzFPqPJjRnSnevKVluik0v7yG0WQ43COq8Iej7GJk=;
 b=Et1vQSKj1b5A5vPhuXS6Jv72x4mhNh+mqm6wWyMVijzpn7Sgr3TS7RXh1ftWuA9HpM
 z0H/E4Omf9Y0mwUJsiiBbyDyK9lpKh7r+NlhP17/ZSp/aDTcTh7/zAvo4HspBNCSy/+8
 lOmCzPDG/9A7iZeHl8T0M79MmVUUhEAzZOJL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U7wzFPqPJjRnSnevKVluik0v7yG0WQ43COq8Iej7GJk=;
 b=Yrpq1NvLQoFDR4C3Z0zouEg7ljyLMFTwelwpj/uJxJ2lvPsDPFYUB6bA4s6E3DYT9v
 LOo7tvy3j4pGmtgKD/gXepbWdfmP/Brz3Wmj61edQCVbcAM8Nh7cbh003KnKdmXPEl3s
 9WPChHaWJTQQUZIBcdz0MioS/DBNHzjadwj2rF9kCNcuES4V0st0X30Ny7PqjAqUysnk
 Bl9A2yXRhc+3Dfic2YF4qOKwilHvqIYfr+T3/lCqcdVpnP9E1f3ivzJHeItz8TlCAHXi
 h7C58Vheyk1l+fq+7Jmt+GR7xQdoktB1nnvpzdc3iUznw3aRtCBK5axTQUIFcCj+X/HG
 BneQ==
X-Gm-Message-State: AOAM531u7igVQhAILwShuLmYpYVEoWBbPRIEp35hCL7T5seqzKTERCFx
 Pv4ExSZNct7A4l/c6lq4sdVHUQ==
X-Google-Smtp-Source: ABdhPJylqqOyinK/5J7t9b+SAZ0aHn7UPyHib4aKoH84mXamrsQuG2ImfDPhWxz/7EGcR5r/87OuYQ==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr2613707wrw.120.1612347501535; 
 Wed, 03 Feb 2021 02:18:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm2962189wru.70.2021.02.03.02.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:18:20 -0800 (PST)
Date: Wed, 3 Feb 2021 11:18:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [RFC PATCH 0/9] cgroup support for GPU devices
Message-ID: <YBp4ap+1l2KWbqEJ@phenom.ffwll.local>
References: <20210126214626.16260-1-brian.welty@intel.com>
 <84b79978-84c9-52aa-b761-3f4be929064e@rockwork.org>
 <5307d21b-7494-858c-30f0-cb5fe1d86004@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5307d21b-7494-858c-30f0-cb5fe1d86004@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 Xingyou Chen <rockrush@rockwork.org>, Kenny Ho <Kenny.Ho@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, amd-gfx@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDM6MjE6MzVQTSAtMDgwMCwgQnJpYW4gV2VsdHkgd3Jv
dGU6Cj4gCj4gT24gMS8yOC8yMDIxIDc6MDAgUE0sIFhpbmd5b3UgQ2hlbiB3cm90ZToKPiA+IE9u
IDIwMjEvMS8yNyDkuIrljYg1OjQ2LCBCcmlhbiBXZWx0eSB3cm90ZToKPiA+IAo+ID4+IFdlJ2Qg
bGlrZSB0byByZXZpc2l0IHRoZSBwcm9wb3NhbCBvZiBhIEdQVSBjZ3JvdXAgY29udHJvbGxlciBm
b3IgbWFuYWdpbmcKPiA+PiBHUFUgZGV2aWNlcyBidXQgd2l0aCBqdXN0IGEgYmFzaWMgc2V0IG9m
IGNvbnRyb2xzLiAgVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gCj4gPj4gdGhlIHByaW9yIHBhdGNo
IHNlcmllcyBmcm9tIEtlbm55IEhvIFsxXS4gIFdlIHRha2UgS2VubnkncyBiYXNlIHBhdGNoZXMK
PiA+PiB3aGljaCBpbXBsZW1lbnQgdGhlIGJhc2ljIGZyYW1ld29yayBmb3IgdGhlIGNvbnRyb2xs
ZXIsIGJ1dCB3ZSBwcm9wb3NlIGFuCj4gPj4gYWx0ZXJuYXRlIHNldCBvZiBjb250cm9sIGZpbGVz
LiAgSGVyZSB3ZSd2ZSB0YWtlbiBhIHN1YnNldCBvZiB0aGUgY29udHJvbHMKPiA+PiBwcm9wb3Nl
ZCBpbiBlYXJsaWVyIGRpc2N1c3Npb24gb24gTUwgaGVyZSBbMl0uIAo+ID4+Cj4gPj4gVGhpcyBz
ZXJpZXMgcHJvcG9zZXMgYSBzZXQgb2YgZGV2aWNlIG1lbW9yeSBjb250cm9scyAoZ3B1Lm1lbW9y
eS5jdXJyZW50LAo+ID4+IGdwdS5tZW1vcnkubWF4LCBhbmQgZ3B1Lm1lbW9yeS50b3RhbCkgYW5k
IGFjY291bnRpbmcgb2YgR1BVIHRpbWUgdXNhZ2UKPiA+PiAoZ3B1LnNjaGVkLnJ1bnRpbWUpLiAg
R1BVIHRpbWUgc2hhcmluZyBjb250cm9scyBhcmUgbGVmdCBhcyBmdXR1cmUgd29yay4KPiA+PiBU
aGVzZSBhcmUgaW1wbGVtZW50ZWQgd2l0aGluIHRoZSBHUFUgY29udHJvbGxlciBhbG9uZyB3aXRo
IGludGVncmF0aW9uL3VzYWdlCj4gPj4gb2YgdGhlIGRldmljZSBtZW1vcnkgY29udHJvbHMgYnkg
dGhlIGk5MTUgZGV2aWNlIGRyaXZlci4KPiA+Pgo+ID4+IEFzIGFuIGFjY2VsZXJhdG9yIG9yIEdQ
VSBkZXZpY2UgaXMgc2ltaWxhciBpbiBtYW55IHJlc3BlY3RzIHRvIGEgQ1BVIHdpdGgKPiA+PiAo
b3Igd2l0aG91dCkgYXR0YWNoZWQgc3lzdGVtIG1lbW9yeSwgdGhlIGJhc2ljIHByaW5jaXBsZSBo
ZXJlIGlzIHRyeSB0bwo+ID4+IGNvcHkgdGhlIHNlbWFudGljcyBvZiBleGlzdGluZyBjb250cm9s
cyBmcm9tIG90aGVyIGNvbnRyb2xsZXJzIHdoZW4gcG9zc2libGUKPiA+PiBhbmQgd2hlcmUgdGhl
c2UgY29udHJvbHMgc2VydmUgdGhlIHNhbWUgdW5kZXJseWluZyBwdXJwb3NlLgo+ID4+IEZvciBl
eGFtcGxlLCB0aGUgbWVtb3J5Lm1heCBhbmQgbWVtb3J5LmN1cnJlbnQgY29udHJvbHMgYXJlIGJh
c2VkIG9uCj4gPj4gc2FtZSBjb250cm9scyBmcm9tIE1FTUNHIGNvbnRyb2xsZXIuCj4gPiAKPiA+
IEl0IHNlZW1zIG5vdCB0byBiZSBEUk0gc3BlY2lmaWMsIG9yIGV2ZW4gR1BVIHNwZWNpZmljLiBX
b3VsZCB3ZSBoYXZlIGFuIHVuaXZlcnNhbAo+ID4gY29udHJvbCBncm91cCBmb3IgYW55IGFjY2Vs
ZXJhdG9yLCBHUEdQVSBkZXZpY2UgZXRjLCB0aGF0IGhvbGQgc2hhcmFibGUgcmVzb3VyY2VzCj4g
PiBsaWtlIGRldmljZSBtZW1vcnksIGNvbXB1dGUgdXRpbGl0eSwgYmFuZHdpZHRoLCB3aXRoIGV4
dHJhIGNvbnRyb2wgZmlsZSB0byBzZWxlY3QKPiA+IGJldHdlZW4gZGV2aWNlcyhvciB2ZW5kb3Jz
KT8KPiA+IAo+ID4gZS5nLiAvY2duYW1lLmRldmljZSB0aGF0IHN0b3JlcyBQQ0kgQkRG77yMIG9y
IGVudW0oaW50ZWwsIGFtZGdwdSwgbnZpZGlhLCAuLi4pLAo+ID4gZGVmYXVsdHMgdG8gbm9uZSwg
bWVhbnMgbm90IGVuYWJsZWQuCj4gPiAKPiAKPiBIaSwgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2su
ICBZZXMsIEkgdGVuZCB0byBhZ3JlZS4gIEkndmUgYXNrZWQgYWJvdXQgdGhpcyBpbgo+IGVhcmxp
ZXIgd29yazsgbXkgc3VnZ2VzdGlvbiBpcyB0byBuYW1lIHRoZSBjb250cm9sbGVyIHNvbWV0aGlu
ZyBsaWtlICdYUFUnIHRvCj4gYmUgY2xlYXIgdGhhdCB0aGVzZSBjb250cm9scyBjb3VsZCBhcHBs
eSB0byBtb3JlIHRoYW4gR1BVLgo+IAo+IEJ1dCBhdCBsZWFzdCBmb3Igbm93LCBiYXNlZCBvbiBU
ZWp1bidzIHJlcGx5IFsxXSwgdGhlIGZlZWRiYWNrIGlzIHRvIHRyeSBhbmQga2VlcAo+IHRoaXMg
Y29udHJvbGxlciBhcyBzbWFsbCBhbmQgZm9jdXNlZCBhcyBwb3NzaWJsZSBvbiBqdXN0IEdQVS4g
IEF0IGxlYXN0IHVudGlsCj4gd2UgZ2V0IHNvbWUgY29uc2Vuc3VzIG9uIHNldCBvZiBjb250cm9s
cyBmb3IgR1BVLi4uLi4gIGJ1dCBmb3IgdGhpcyB3ZSBuZWVkIG1vcmUKPiBhY3RpdmUgaW5wdXQg
ZnJvbSBjb21tdW5pdHkuLi4uLi4KClRoZXJlJ3MgYWxzbyBub3RoaW5nIHN0b3BwaW5nIGFueW9u
ZSBmcm9tIGV4cG9zaW5nIGFueSBraW5kIG9mIFhQVSBhcwpkcml2ZXJzL2dwdSBkZXZpY2UuIEFz
aWRlIGZyb20gdGhlICJmdWxsIHN0YWNrIG11c3QgYmUgb3BlbiByZXF1aXJlbWVudCB3ZQpoYXZl
IiBpbiBkcm0uIEFuZCBmcmFua2x5IHdpdGggZHJtIGJlaW5nIHZlcnkgY29uZnVzaW5nIGFjcm9u
eW0gd2UgY291bGQKYWxzbyByZW5hbWUgR1BVIHRvIGJlIHRoZSAiZ2VuZXJhbCBwcm9jZXNzaW5n
IHVuaXQiIHN1YnN5dGVtIDotKQotRGFuaWVsCgo+IAo+IC1Ccmlhbgo+IAo+IFsxXSBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1Ob3ZlbWJlci8y
NDMxNjcuaHRtbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
