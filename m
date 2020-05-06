Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FD1C8306
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1DC6E924;
	Thu,  7 May 2020 07:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1496E8C7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 18:45:28 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k12so2413657qtm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 11:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Xp4PtIWSbFjNlCqFouJe0yrPGUY2LlWC8culMqw4W34=;
 b=R7lsSWur/AS2+mWO7IfggMu+O6gDIpHb5fsBvc2LXsH3PmDGNjMK0zpysOcb4Eb+cz
 mf1+TNibVmiOreGgMt3vNl0KRwbfkShNrsiJbn/DxYcbSmXH5gNZ2gXIH9fCOUIYt2rx
 uufl1oq3YEnO5fNw5YpjjaxL6Z++oij1nCST3wT/cti8pRbhvx/M4SzbZD4RgxRFb8j/
 a+zbity4CLj+uAm+lxJ1UlFhn4tfneJczLNr2kYjP8d52NCpunCB2utDdguPKw1NtyIw
 xRCnoJJk0pa86wmw4nQiE5mnB14UQ13vcfrECf72UWGBC29459PJrqkAuJYkcOi1aUv5
 XJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Xp4PtIWSbFjNlCqFouJe0yrPGUY2LlWC8culMqw4W34=;
 b=QNjCrFd0XtZjG3TtwkcFZjcNgWB5RXY3kzQNjpEDxLMZ6WCKvR2vJMqDK/aH2p+Nur
 OV7hZloyOBdM/cDn9ZZfsaowgdcl2Q5OqJU0pPtEIZ31RHKj8nzYh4PpbgOaN4XsPlY+
 RTcJGlvtcCIljnmbpE+Hsb5x2bXt0roI3/g+bOHsx3zqNPFd5phj621541DNybwdTS+Z
 JuXZWbQXfvNcz4raMbLb60flkGR1v2KoeJU9/0Mnz6m+vz9hjoifFPNzu0ndWdsijY3Y
 TSR+2CR2aBYORb9Ea96DNMubDx2+7eF/0D3S12SmvDSmCu/0zQw4DUS4zi+SZTM5U/I5
 tBQA==
X-Gm-Message-State: AGi0PubbtFA6qIVqrqfIK2TvcPvTzJ3b4S7Cs66101CJ0Sp8sUuD6cXQ
 BNB/BwVctaElapkYt/jPsgMX7A==
X-Google-Smtp-Source: APiQypL616xxVLy7sIJ2gUjjzq8FfTN3eeP1TOOdrppMGZHDTaCWu7Efs5+lgJDGx3ZLUW9Bw/3rtw==
X-Received: by 2002:ac8:4d06:: with SMTP id w6mr9559957qtv.180.1588790727109; 
 Wed, 06 May 2020 11:45:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x5sm715097qtx.35.2020.05.06.11.45.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 May 2020 11:45:26 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jWP2s-0002GJ-3V; Wed, 06 May 2020 15:45:26 -0300
Date: Wed, 6 May 2020 15:45:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH hmm v2 0/5] Adjust hmm_range_fault() API
Message-ID: <20200506184526.GA8668@ziepe.ca>
References: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDEsIDIwMjAgYXQgMDM6MjA6NDNQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBU
aGUgQVBJIGlzIGEgYml0IGNvbXBsaWNhdGVkIGZvciB0aGUgdXNlcyB3ZSBhY3R1YWxseSBoYXZl
LCBhbmQKPiBkaXN1Y3NzaW9ucyBmb3Igc2ltcGxpZnlpbmcgaGF2ZSBjb21lIHVwIGEgbnVtYmVy
IG9mIHRpbWVzLgo+IAo+IFRoaXMgc21hbGwgc2VyaWVzIHJlbW92ZXMgdGhlIGN1c3RvbWl6YWJs
ZSBwZm4gZm9ybWF0IGFuZCBzaW1wbGlmaWVzIHRoZQo+IHJldHVybiBjb2RlIG9mIGhtbV9yYW5n
ZV9mYXVsdCgpCj4gCj4gQWxsIHRoZSBkcml2ZXJzIGFyZSBhZGp1c3RlZCB0byBwcm9jZXNzIGlu
IHRoZSBzaW1wbGlmaWVkIGZvcm1hdC4KPiBJIHdvdWxkIGFwcHJlY2lhdGVkIHRlc3RlZC1ieSdz
IGZvciB0aGUgdHdvIGRyaXZlcnMsIHRoYW5rcyEKPiAKPiB2MjoKPiAgLSBNb3ZlIGNhbGwgY2hh
aW4gdG8gY29tbWl0IG1lc3NhZ2UKPiAgLSBGaXggdHlwbyBvZiBITU1fUEZOX1JFUV9GQVVMVAo+
ICAtIE1vdmUgbm91dmVhdV9obW1fY29udmVydF9wZm4oKSB0byBub3V2ZWF1X3N2bS5jCj4gIC0g
QWRkIGFja3MgYW5kIHRlc3RlZC1ieXMKPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8w
LXYxLTRlYjcyNjg2ZGUzYys1MDYyLWhtbV9ub19mbGFnc19qZ2dAbWVsbGFub3guY29tCj4gCj4g
Q2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBKb2huIEh1YmJhcmQgPGpo
dWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4gVG86IFJhbHBoIENh
bXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBDYzogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3
YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogIkt1ZWhsaW5nLCBGZWxpeCIgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6ICJEYXZpZCAoQ2h1bk1p
bmcpIFpob3UiIDxEYXZpZDEuWmhvdUBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogIllhbmcsIFBoaWxpcCIgPFBoaWxpcC5Z
YW5nQGFtZC5jb20+Cj4gVG86IGxpbnV4LW1tQGt2YWNrLm9yZwo+IAo+IEphc29uIEd1bnRob3Jw
ZSAoNSk6Cj4gICBtbS9obW06IG1ha2UgQ09ORklHX0RFVklDRV9QUklWQVRFIGludG8gYSBzZWxl
Y3QKPiAgIG1tL2htbTogbWFrZSBobW1fcmFuZ2VfZmF1bHQgcmV0dXJuIDAgb3IgLTEKPiAgIGRy
bS9hbWRncHU6IHJlbW92ZSBkZWFkIGNvZGUgYWZ0ZXIgaG1tX3JhbmdlX2ZhdWx0KCkKPiAgIG1t
L2htbTogcmVtb3ZlIEhNTV9QRk5fU1BFQ0lBTAo+ICAgbW0vaG1tOiByZW1vdmUgdGhlIGN1c3Rv
bWl6YWJsZSBwZm4gZm9ybWF0IGZyb20gaG1tX3JhbmdlX2ZhdWx0CgpBcHBsaWVkIHRvIGhtbS5n
aXQsIHRoYW5rcwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
