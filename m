Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520578DC3E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326136E7AD;
	Wed, 14 Aug 2019 17:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E646E7AB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:49:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w20so29566edd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Hb464daFGycQhSgA9BEwjg8HNKIy+QMbts1XhF2KkhY=;
 b=B25pqagkdNPLHYatv9Yn2KJp6s8c1uHI76Vlt0QGWfdabFMEAq3TOW6aq+XZPmcshJ
 wMf+BcWdPehZRgzzRqYVKMHKSWZpH8b4bObdLDZx4XKHnFvJ0dFynuCqF03c6Dqsk1xV
 WBylM/t50A3h8U0R2Tv3g618y6ThXQZZKXXiFTBVoNM9qVAg7HHH/hlFLRBh6wUXSm4d
 bdj6VMfow3v7iiigvrhNND1m8P+k0KD0kuWFjPCbaTTxXyIhBsyJZXj4pttCHJVHs47W
 9d4SZdQfSJWabE4+CEF/Xvs/n3DtEPZjLMMZSV8YH+fKJZw1CEnQQhIeIaQ/iHNbhKty
 VJeg==
X-Gm-Message-State: APjAAAUsfRJe6mcdVRdo6EAs0xC5w704pgxkGqO2dB+E/jWtAUq4eLmm
 sKiYq9DTWfpKDLbU4fiMhi89hA==
X-Google-Smtp-Source: APXvYqwBl2F3g+zroJnkq4eZ/+bHbYQoVu/ZDXQOMXZayvH7IQw3wqGZbNdQii7iJcpfIK39yqAZTQ==
X-Received: by 2002:a17:906:7681:: with SMTP id
 o1mr710091ejm.207.1565804970147; 
 Wed, 14 Aug 2019 10:49:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b17sm81942edy.43.2019.08.14.10.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:49:29 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:49:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
Message-ID: <20190814174927.GT7444@phenom.ffwll.local>
Mail-Followup-To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 bskeggs@redhat.com, airlied@linux.ie, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
References: <20190814145033.GA11190@Red>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814145033.GA11190@Red>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hb464daFGycQhSgA9BEwjg8HNKIy+QMbts1XhF2KkhY=;
 b=XbdmfFcT3jnZqRlVTGuaAFo1OtCPLWFWljVro0mfCdbdxEefp8fNvLYheP9O/U9RZ5
 YWZ3imdFdL067IfOXnulKaXhUdDc+FcfNtu2hXsJNTM3bqKaa2YWSCA2NxFoIkrLyN7v
 daxCcz4A95TTfgIwKhFdy5WvEkqqbj31ATPN8=
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, bskeggs@redhat.com, robin.murphy@arm.com,
 hch@lst.de, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDQ6NTA6MzNQTSArMDIwMCwgQ29yZW50aW4gTGFiYmUg
d3JvdGU6Cj4gSGVsbG8KPiAKPiBTaW5jZSBsb3Qgb2YgcmVsZWFzZSAoYXQgbGVhc3Qgc2luY2Ug
NC4xOSksIEkgaGl0IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToKPiBETUEtQVBJOiBjYWNo
ZWxpbmUgdHJhY2tpbmcgRU5PTUVNLCBkbWEtZGVidWcgZGlzYWJsZWQKPiAKPiBBZnRlciBoaXR0
aW5nIHRoYXQsIEkgdHJ5IHRvIGNoZWNrIHdobyBpcyBjcmVhdGluZyBzbyBtYW55IERNQSBtYXBw
aW5nIGFuZCBzZWU6Cj4gY2F0IC9zeXMva2VybmVsL2RlYnVnL2RtYS1hcGkvZHVtcCB8IGN1dCAt
ZCcgJyAtZjIgfCBzb3J0IHwgdW5pcSAtYwo+ICAgICAgIDYgYWhjaQo+ICAgICAyNTcgZTEwMDBl
Cj4gICAgICAgNiBlaGNpLXBjaQo+ICAgIDU4OTEgbm91dmVhdQo+ICAgICAgMjQgdWhjaV9oY2QK
PiAKPiBEb2VzIG5vdXZlYXUgaGF2aW5nIHRoaXMgaGlnaCBudW1iZXIgb2YgRE1BIG1hcHBpbmcg
aXMgbm9ybWFsID8KClllYWggc2VlbXMgcGVyZmVjdGx5IGZpbmUgZm9yIGEgZ3B1LgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
