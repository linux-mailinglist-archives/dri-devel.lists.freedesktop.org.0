Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464918421D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25CF6EB97;
	Fri, 13 Mar 2020 08:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C666EAFB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 16:19:33 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id r15so2904784qve.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=2pBw5NHij8N3HJpajFNPowoAaCy8Dhl2IuKbDIhiU44=;
 b=GSXMOg8u4rz3Q17cfu0KqadQLC7wfggLdfWHGmZHzhi89s12eCFewau2YcieZ+/Ugb
 Fz+aWTHi27R8osOi9eAHqp2A9NCEYEytHqOPrCHCo/1WBwMJGJQge3tpBFfidUuAytrI
 MVbLnu0+USXs0LNA0DlqyHvjTM1qADv/+uilmTTwW0nmU5EpQ7N/Z6I33ILnNY6jIqNr
 jCpOETLbCQ9GzyzQMY3/NYUvMXZEMyboJU/OajO0dZxv2TYDUMfZndKEf9ayTANWEk7j
 49KrHIO5Le/rh5z2+GhpYmsNB0f3Fde5xnW439+E/Yud341o3DSD65dGrghYTyKDMy+9
 tp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2pBw5NHij8N3HJpajFNPowoAaCy8Dhl2IuKbDIhiU44=;
 b=EYcSuQHxTKbQMR0yN01RP5ULOivbntcz7XjPeOcKKPMBGCzKpBGzAd+Alpe1+f0wHu
 3U951KQYvC7ZY8/CSUZ75rGtRTChGY7sOQXKzLLWYR8zdcNFnKyGRDjyMW7C4DbhZPJd
 pCh4F7qLnU6XaJroe20NT47uU4+clfBPkY16McxZ/EuzJoqZ1ejgq/ZUupMMabjSXqUb
 UX9W1BXQI5sfYIEvcMKeewN0yQfUkn4Gejkeqk/0jnJjzGaUyBxNJcXnicy0QIyT2lD/
 VFvE7ex4LMXxs3FKnAcVRi6m/1YElOQiZgwWHqLqLjQ4+Xh1zEzLE6svmZ4JgypkmHxK
 le8w==
X-Gm-Message-State: ANhLgQ1foNUWTlq46NeZmsTgNyIXBYdt7wJGDV4Wg6FWzfaBxQGpnH8y
 51ebuJR2XKqmEPgvfbfFv4RolQ==
X-Google-Smtp-Source: ADFU+vsmQ/FsmpeRJiVtuUFT93ljDpyB7+aErB9kxbpf0WybzT6k0L+1tJ88lRmkuiqknEqAJzQGmw==
X-Received: by 2002:ad4:40c7:: with SMTP id x7mr8281046qvp.176.1584029972649; 
 Thu, 12 Mar 2020 09:19:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x203sm13973376qkb.44.2020.03.12.09.19.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 09:19:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCQYV-0008Fw-Lk; Thu, 12 Mar 2020 13:19:31 -0300
Date: Thu, 12 Mar 2020 13:19:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200312161931.GQ31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <5383c8de-4e2c-dc8c-363d-a35d671abfc3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5383c8de-4e2c-dc8c-363d-a35d671abfc3@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
Cc: Logan Gunthorpe <logang@deltatee.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDQ6Mzk6MDJQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiA+ID4gVGhlIHN0cnVjdHVyZSBmb3IgaG9sZGluZyBkbWEgYWRkcmVzc2VzIGRv
ZXNuJ3QgcmVhbGx5IGV4aXN0Cj4gPiA+IGluIGEgZ2VuZXJpYyBmb3JtLCBidXQgd291bGQgYmUg
YW4gYXJyYXkgb2YgdGhlc2Ugc3RydWN0dXJlczoKPiA+ID4gCj4gPiA+IHN0cnVjdCBkbWFfc2cg
ewo+ID4gPiAJZG1hX2FkZHJfdAlhZGRyOwo+ID4gPiAJdTMyCQlsZW47Cj4gPiA+IH07Cj4gPiBT
YW1lIHF1ZXN0aW9uLCBSRE1BIG5lZWRzIHRvIHJlcHJlc2VudCBnaWdhYnl0ZXMgb2YgcGFnZXMg
aW4gYSBETUEKPiA+IGxpc3QsIHdlIHdpbGwgbmVlZCBzb21lIGdlbmVyaWMgd2F5IHRvIGhhbmRs
ZSB0aGF0LiBJIHN1c3BlY3QgR1BVIGhhcwo+ID4gYSBzaW1pbGFyIG5lZWQ/IENhbiBpdCBiZSBh
Y2NvbWlkYXRlZCBpbiBzb21lIGdlbmVyaWMgZG1hX3NnPwo+IAo+IFllcywgd2UgZWFzaWx5IGhh
dmUgcmFuZ2VzIG9mID4xR0IuIFNvIEkgd291bGQgY2VydGFpbmx5IHNheSB1NjQgZm9yIHRoZSBs
ZW4KPiBoZXJlLgoKVG8gYmUgY2xlYXIsIEkgbWVhbiBzcGVjaWZpY2FsbHkgMUdCIG9mIGRtYSBt
YXAgY29tcG9zZWQgb2YgMjYyawpwYWdlcywgbWFwcGVkIGludG8gMjYyayBkbWFfc2cncyB0aGF0
IHRha2UgYXJvdW5kIHNvbWUgNE0gb2YgbWVtb3J5IHRvCnJlcHJlc2VudCBhcyBzdHJ1Y3QgZG1h
X2RnLgoKUmVhbGx5IHByZWZlciBzb21lIHNjaGVtZSB0aGF0IGRvZXNuJ3QgcmVseSBvbiB2bWFs
bG9jLi4KClNvbWUgYXBwcm9hY2ggdG8gaGF2ZSBhIHNpbmdsZSBkbWFfc2cgPiA0RyBzZWVtcyBs
ZXNzIGNvbW1vbmx5IG5lZWRlZD8KSSBkb24ndCB0aGluayBhbnkgUkRNQSBIVyB0b2RheSBjYW4g
aGFuZGxlIGEgc2luZ2xlIFNHTCB0aGF0IGxhcmdlIGF0CmxlYXN0LgoKPiA+ICAgLSBBZGQgc29t
ZSBnZW5lcmljIGRtYV9zZyBkYXRhIHN0cnVjdHVyZSBhbmQgaGVscGVyCj4gPiAgIC0gQWRkIGRt
YSBtYXBwaW5nIGNvZGUgdG8gZ28gZnJvbSBwYWdlcyB0byBkbWFfc2cKPiA+ICAgLSBSZXdvcmsg
UkRNQSB0byB1c2UgZG1hX3NnIGFuZCB0aGUgbmV3IGRtYSBtYXBwaW5nIGNvZGUKPiA+ICAgLSBS
ZXdvcmsgZG1hYnVmIHRvIHN1cHBvcnQgZG1hIG1hcHBpbmcgdG8gYSBkbWFfc2cKPiA+ICAgLSBS
ZXdvcmsgR1BVIGRyaXZlcnMgdG8gdXNlIGRtYV9zZwo+ID4gICAtIFRlYWNoIHAycGRtYSB0byBn
ZW5lcmF0ZSBhIGRtYV9zZyBmcm9tIGEgQkFSIHBhZ2UgbGlzdAo+ID4gICAtIFRoaXMgc2VyaWVz
Cj4gPiAKPiA+ID8KPiAKPiBTb3VuZHMgcHJldHR5IG11Y2ggbGlrZSBhIHBsYW4gdG8gbWUsIGJ1
dCB1bmZvcnR1bmF0ZWx5IGxpa2UgYSByYXRoZXIgaHVnZQo+IG9uZS4KCkkga25vdyBwYXJ0cyBv
ZiB0aGlzIGhhdmUgYmVlbiBhZHZhbmNpbmcuLiBDSCBoYXMgYmVlbiB3b3JraW5nIG9uCmZpeGlu
ZyB1cCB0aGUgRE1BIGxheWVyIGVub3VnaCB0byBkbyAjMSBhbmQgIzIsIEkgdGhpbmsuCgo+IEJl
Y2F1c2Ugb2YgdGhpcyBhbmQgY2F1c2UgSSBkb24ndCBrbm93IGlmIGFsbCBkcml2ZXJzIGNhbiBs
aXZlIHdpdGggZG1hX3NnCj4gSSdtIG5vdCBzdXJlIGlmIHdlIHNob3VsZG4ndCBoYXZlIHRoZSBz
d2l0Y2ggZnJvbSBzY2F0dGVybGlzdCB0byBkbWFfc2cKPiBzZXBhcmF0ZWx5IHRvIHRoaXMgcGVl
cjJwZWVyIHdvcmsuCgpTbyBmYXIgYW55IGF0dGVtcHRzIHRvIG1ha2Ugc2dscyB3aXRob3V0IHN0
cnVjdCBwYWdlIGhhdmUgZmFpbGVkIGZvcgp2YXJpb3VzIHJlYXNvbnMuIFRvbyBvZnRlbiBvYnNj
dXJlIHN0dWZmIGRvZXMgYWN0dWFsbHkgd2FudCB0aGUgc3RydWN0CnBhZ2UuCgpTdHVmZmluZyBC
QVIgbWVtb3J5IHBhZ2VzIGludG8gdGhlIFNHTCBpcyBiYWQgZW5vdWdoIGFscmVhZHkuIDooCgpP
bmUgcHJhZ21hdGljIHBhdGggbWlnaHQgYmUgdG8gZGVmaW5lIHRoaXMgbmV3ICdkbWFfc2cnIGlu
IGEgd2F5IHdoZXJlCml0IHdvdWxkIGhhdmUgdGhlIHNhbWUgbWVtb3J5IGxheW91dCBhcyBhICdz
dHJ1Y3Qgc2NhdHRlcmxpc3QnCgpTb21ldGhpbmcgbGlrZQoKc3RydWN0IGRtYV9zY2F0dGVybGlz
dCB7CiAgICAgICAgdW5zaWduZWQgbG9uZyAgIGxpbms7CiAgICAgICAgdW5zaWduZWQgaW50ICAg
IHJlc2VydmVkMTsKI2lmbmRlZiBDT05GSUdfTkVFRF9TR19ETUFfTEVOR1RICiAgICAgICAgdW5z
aWduZWQgaW50ICAgIGRtYV9sZW5ndGg7CiNlbHNlCiAgICAgICAgdW5zaWduZWQgaW50ICAgIHJl
c2VydmVkMjsKI2VuZGlmCiAgICAgICAgZG1hX2FkZHJfdCAgICAgIGRtYV9hZGRyZXNzOwojaWZk
ZWYgQ09ORklHX05FRURfU0dfRE1BX0xFTkdUSAogICAgICAgIHVuc2lnbmVkIGludCAgICBkbWFf
bGVuZ3RoOwojZW5kaWYKfTsKCnN0cnVjdCBkbWFfc2dfdGFibGUgewogICAgIHVuaW9uIHsKICAg
ICAgICAgc3RydWN0IGRtYV9zY2F0dGVybGlzdCAqZG1hX3NnbDsKICAgICAgICAgc3RydWN0IGZ1
dHVyZV9tb3JlX2VmZmljaWVudF9zdHJ1Y3R1cmUgKmZ1dHVyZTsKICAgICB9CiAgICAgdW5zaWdu
ZWQgaW50IG5lbnRzOwp9OwoKVGhlbiBhIGRtYV9tYXBfc2cgY291bGQgYmUgCgpzdHJ1Y3QgZG1h
X3NnX3RhYmxlICpkbWFfbWFwX3NnX2F0dHJzX3RvX2RtYSgKICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywKICAgICAgIGludCBuZW50cywgZW51bSBkbWFf
ZGF0YV9kaXJlY3Rpb24gZGlyLAogICAgICAgdW5zaWduZWQgbG9uZyBhdHRycykKewogICByZXQg
PSBkbWFfbWFwX3NnX2F0dHJzKGRldiwgc2csIG5lbnRzLCBkaXIsIGF0dHJzKTsKICAgcmVzID0g
a21hbGxvYyhzaXplb2YoZG1hX3NnX3RhYmxlKSk7CiAgIHJlcy0+ZG1hX3NnbCA9IHNnOwogICBy
ZXR1cm4gcmVzOwp9CgpUaGVuIGF0IGxlYXN0IHRoZSB3b3JrIGNhbiBnZXQgZ2V0cyBzcGxpdCB1
cCwgSSBjYW4gc3dpdGNoIFJETUEKZHJpdmVycyB0byB1c2UgZG1hX3NnX3RhYmxlLCB0aGVuIEkg
Y2FuIHN3aXRjaCB0aGUgc3Vic3lzdGVtIHRvIGNhbGwKZG1hX21hcF9zZ19hdHRyc190b19kbWEs
IHRoZW4gd2hlbiB3ZSBnZXQgZG1hX21hcF9iaW92ZWNfYXR0cnMoKSBJIGNhbgp3b3JrIG9uIHN3
aXRjaGluZyB0aGUgaW5wdXQgc2dsIHRvIGEgYmlvdmVjIHdpdGhvdXQgY2hhbmdpbmcgdGhlCmRy
aXZlcnMuCgpBZnRlciBlbm91Z2ggY29udmVyc2lvbnMgYXJlIGRvbmUgd2UgY2FuIG9wdGltaXpl
IHRoZSBtZW1vcnkgbGF5b3V0Cmluc2lkZSBkbWFfc2dfdGFibGUsIGFmdGVyIGV2ZXJ5dGhpbmcg
aXMgZG9uZSB3ZSBjYW4gZHJvcCBzdXBwb3J0IGZvcgonZG1hX3NjYXR0ZXJsaXN0JwoKSXQgZG9l
c24ndCBmZWVsIG9iamVjdGlvbmFibGUgdG8gYnVpbGQgYSAnZG1hX3NnX3RhYmxlJyB3aXRob3V0
IGEKc3RydWN0IHBhZ2UuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
