Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E062F3C08F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F3189144;
	Tue, 11 Jun 2019 00:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B109788F1E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:09:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 33so2271898qtr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 06:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4F5p4XvqxWD0TPhx038sRdW6UkfS+pQjYQgLxUjnBMI=;
 b=Q7tt6WuyqZEt2JgG/6Tm/SNE3X5VLbYuuSp6X4l/QC+/eS1HNbmaUagVs6VLRwdG8q
 Fd5//nwSubb0SZSMkrHv84Vf9m2QEqn4aj3YFTFYu8czV51zgCZxB6m0KLpCs2wKmlb/
 4g8NkNAB1xeCspiRzVfzema9haluX8NkiGAcw8aI3/88wHCsIp/cE1ZyxYwIhrlptDST
 JLBbtBSREdUnm+5EZ10YkUUI/uuim4L4UJ0g+3XP/A7K2vQHU4YMrfSqiWbm4MwYvbSq
 xDktRSp6uHum/GWYArBa0ua8dRSIzcjkjAbTbSp5SXC9XWLusY7O0dC3khToxxmRg9pU
 Ce0w==
X-Gm-Message-State: APjAAAWba9F6Ss/0YquMxOTd7PeJBSmg2e7knZUdVVTMYkdSWr50+xcy
 53GllHTh80o8WMAnR5rwzaenow==
X-Google-Smtp-Source: APXvYqyfdzwD7zPoXm7GvJhg1KqfurFKZJX3W/vApYwm27bMvAhRfi5kk7rnbLbo+akkzc5tVyXK/g==
X-Received: by 2002:ac8:1af4:: with SMTP id h49mr51085239qtk.183.1560172156644; 
 Mon, 10 Jun 2019 06:09:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id v30sm1245889qtk.45.2019.06.10.06.09.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Jun 2019 06:09:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1haK31-0006cK-Gt; Mon, 10 Jun 2019 10:09:15 -0300
Date: Mon, 10 Jun 2019 10:09:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an
 argument for hmm_range_register
Message-ID: <20190610130915.GA18468@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
 <4a391bd4-287c-5f13-3bca-c6a46ff8d08c@nvidia.com>
 <e460ddf5-9ed3-7f3b-98ce-526c12fdb8b1@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e460ddf5-9ed3-7f3b-98ce-526c12fdb8b1@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=4F5p4XvqxWD0TPhx038sRdW6UkfS+pQjYQgLxUjnBMI=;
 b=BhIIjcgOeQFdpsXOGxWnmGvjoyeGrIjjevpQNRl/I2/FM8ihdN5hXQobSh95XYjgPy
 BcVai4r/g1HxBTsXAlAV0qer0KY857kzqTHnHg2h6eEGGmmeCl7I6rNfu1lMP1j2s+65
 HMCq4j4xGVfZGz9FHAfQJXTacr+yVjc2YESaxykFfinvyANrOti3zkztW1T11pGgbt+m
 ogx8XVpNVzdJsodX6ozViM6hnDCL71wrSt/am17+Hfd0sGLK4ljxB0UQChBHCVSbWxea
 5/soEI9XcHDofveKfkWMk8uTfUv0yVeOC28YGBJDNyrnMAdm6q1bApQkogtXbzNnCf+V
 garw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDM6Mzk6MDZQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gPiA+ICvCoMKgwqAgcmFuZ2UtPmhtbSA9IGhtbTsKPiA+ID4gK8KgwqDCoCBrcmVm
X2dldCgmaG1tLT5rcmVmKTsKPiA+ID4gwqDCoMKgwqDCoCAvKiBJbml0aWFsaXplIHJhbmdlIHRv
IHRyYWNrIENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMuICovCj4gPiA+IMKgwqDCoMKgwqAgbXV0ZXhf
bG9jaygmaG1tLT5sb2NrKTsKPiA+ID4gCj4gCj4gSSBmb3Jnb3QgdG8gYWRkIHRoYXQgSSB0aGlu
ayB5b3UgY2FuIGRlbGV0ZSB0aGUgZHVwbGljYXRlCj4gICAgICJyYW5nZS0+aG1tID0gaG1tOyIK
PiBoZXJlIGJldHdlZW4gdGhlIG11dGV4X2xvY2svdW5sb2NrLgoKRG9uZSwgdGhhbmtzCgpKYXNv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
