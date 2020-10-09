Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384F289FBC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624026EE74;
	Sat, 10 Oct 2020 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9344F6ED0A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:14:20 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id b10so2685865qvf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d5tRJ9PpcVIuucKEk9PjSNEdnKeyXjPzYCqe74ejgpM=;
 b=Zn8X4w0/OSkhz1OuZv5cn9hAzblt5Hz2mscK1C8WJ1JcDT5nIpUMpSMLResc3MFIeJ
 GYAwP5W+J0Fxn2Md7iAQTDLSGl8qafxyhc+wXW+psUrtfS5wngK5J1ar+PSV3qeK2Nj5
 0m6G/dAXHeQgo5p2oWl5wszCZy8X++skWa3fLZ38pZcn+TFZhh2cIuqy4at1AIMSl2Rj
 sRITU+dZXxiE1XajWjAvISGvD4aFphoRP21auU1OzDipxnqXLk9pmk/qYrzNztspn4bq
 ia3DCQaNq81q+PGYCObzRoeKRHiP/S327EfmURD1pAthONNzdj/rwgMutzPgFDspy8uM
 keMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d5tRJ9PpcVIuucKEk9PjSNEdnKeyXjPzYCqe74ejgpM=;
 b=QA4pZzxETGx/4iYdSyFv/17byZwjNzdZxhgzWosruITPSqvTxJ7igia/i3c6Sa37nE
 ePVcgP2wIj3wYR+TwHc8QR6l44OMmqvqr42PBBFHqSlCz6bQMnTMq4jQgpfRiqzVCmD6
 8jKhmTpJYe2970lRm8boochv9mgUeIJeZa8nT1X6eq+Twe21e+c9S3A906CSpaxA5W7c
 qVjkeyvXUOXTbkYL+8Dz/qsXNwZY48q4/d/kqYZYbzhHMPPsEu2rH8LuIRlk/TPbML+f
 6hjW1ayffUFhK+HkI55W2AaTyQSu+EJbkA88R84ePsELw/jjxlsmMcsjiYlgkpEWrleV
 YzWw==
X-Gm-Message-State: AOAM5313aj3Kl3RGom7AgKCszttk8utsyd/Mp6A+CsDe9OjU4ovWkL3W
 pMigL2CORngEeehBDsqxQH+Dcg==
X-Google-Smtp-Source: ABdhPJxKiahJdvTtsQaQo417yOupHNeidai5L3YpYKdnVDmVTqBZN9rm1cv4o5Miumg1ehkWBKEPgQ==
X-Received: by 2002:a0c:cd0e:: with SMTP id b14mr13194813qvm.3.1602256459739; 
 Fri, 09 Oct 2020 08:14:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id s15sm6329516qkj.21.2020.10.09.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:14:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQu66-0020X4-DL; Fri, 09 Oct 2020 12:14:18 -0300
Date: Fri, 9 Oct 2020 12:14:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/6] mm: introduce vma_set_file function v3
Message-ID: <20201009151418.GW5177@ziepe.ca>
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150342.1979-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009150342.1979-2-christian.koenig@amd.com>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, willy@infradead.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDksIDIwMjAgYXQgMDU6MDM6MzhQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiArLyoKPiArICogQ2hhbmdlIGJhY2tpbmcgZmlsZSwgb25seSB2YWxpZCB0byB1
c2UgZHVyaW5nIGluaXRpYWwgVk1BIHNldHVwLgo+ICsgKi8KPiArdm9pZCB2bWFfc2V0X2ZpbGUo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBmaWxlICpmaWxlKQo+ICt7Cj4gKwlp
ZiAoZmlsZSkKPiArCSAgICAgICAgZ2V0X2ZpbGUoZmlsZSk7Cj4gKwo+ICsJc3dhcCh2bWEtPnZt
X2ZpbGUsIGZpbGUpOwo+ICsKPiArCWlmIChmaWxlKQo+ICsJCWZwdXQoZmlsZSk7Cj4gK30KCmZw
dXQgY3Jhc2hlcyB3aGVuIGZpbGUgaXMgTlVMTCBzbyB0aGUgZXJyb3IgaGFuZGxpbmcgYWZ0ZXIK
dW5tYXBfYW5kX2ZyZWVfdm1hOiBjYW4ndCBoYW5kbGUgdGhpcyBjYXNlLCBzaW1pbGFybHkgdm1f
ZmlsZSBjYW4ndCBiZQpOVUxMIGVpdGhlci4KClNvIGp1c3Qgc2ltcGx5OgoKIHN3YXAodm1hLT52
bV9maWxlLCBmaWxlKTsKIGdldF9maWxlKHZtYS0+dm1fZmlsZSk7CiBmcHV0KGZpbGUpOwogCldp
bGwgZG8/CgpKdXN0IGxldCBpdCBjcmFzaCBpZiBhbnkgb2YgdGhlbSBhcmUgd3JvbmdseSBOVUxM
LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
