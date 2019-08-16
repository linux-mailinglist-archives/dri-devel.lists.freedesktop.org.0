Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060179118E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0C36EB32;
	Sat, 17 Aug 2019 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509906E963
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:23:28 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s145so5311364qke.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pD8Tbdojb+tV/T42U7/Bt4fJei4dk6nxHPESNZBzUPg=;
 b=X6XkFcv5Siwa/6/xPqwQxSHpxlQ8rRWT/RfIP8GJQ0XPFxwVhWoX1+cbPqC70BRoCT
 sB7S7vJyKPE9EYatr0oBKZiuaT3wRhexAzkpztx3Up9g71CXDPv0Z5FvSgdtdjogdD/X
 CEgWJdb28qFS4GUyPe9Tpr/DPqobglai9PH7esYIm6zvvjB+RSIJ5Ih5ZhDxWlttIfVT
 I6iP9AdjxRhMNN8xliq3Ftbya8iYNt6ngBe1KK0jzwMEHugU/eNrcCGIhOFqnySATbTy
 MuhbV3pjJGsUZwwv7eYJD9dQzxBwgGqukH45nMNsRxa4LQFZNlg2v0fWZaQ2OvB5ISTL
 okeg==
X-Gm-Message-State: APjAAAVxCiG4wTwcQBtz1kG50YLYt6dfBYBqYbgoR8pRwYrAwleFQ4zy
 hzbLhv0jscrUch+r3h/x345EHw==
X-Google-Smtp-Source: APXvYqyAuZxMtBrIj2lrXbWPNUHVpEBKMq4p2dvILNeEBwhH8SLFMps9jaKCtPjbt9+U/fOmx5c77w==
X-Received: by 2002:a37:805:: with SMTP id 5mr9982722qki.351.1565976207466;
 Fri, 16 Aug 2019 10:23:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 23sm3185723qkk.121.2019.08.16.10.23.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 10:23:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyfwk-0000tb-MA; Fri, 16 Aug 2019 14:23:26 -0300
Date: Fri, 16 Aug 2019 14:23:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: turn hmm migrate_vma upside down v3
Message-ID: <20190816172326.GI5398@ziepe.ca>
References: <20190814075928.23766-1-hch@lst.de> <20190816065141.GA6996@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816065141.GA6996@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pD8Tbdojb+tV/T42U7/Bt4fJei4dk6nxHPESNZBzUPg=;
 b=PKOKEY8hGxaOdpj1T8hBrDGYtsUrnU0AObkNmorj7jn7hBXpX2Kp/ztvI9DGVCYTQE
 dc7AfGY5084FNsyK1iFgRwps/IMRwPx5SDeHZ6iG6Vx1Auh9Jiwqi8IwIFgmkC1IyaaP
 ZG/0N27IRdZCGF/hPvMRXRbsTrG+8jAJ2xVMkv6g6aeYSe5QxCHrQ2ZmirGBi7NhhAtL
 8LPoo597le/ShD9ep2nuha5j6xRqGlB/XWU5NWICIfVLLTfLX0mziYqsaSh3ZaTmUF0u
 cvAphTs2Z1DvPDJOzISG6/SYjf5j85EYdPNZa7ztM4aMs2xfCrXlpdbNpKuWGh1E+PLB
 PLqA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDg6NTE6NDFBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSmFzb24sCj4gCj4gYXJlIHlvdSBnb2luZyB0byBsb29rIGludG8gcGlja2lu
ZyB0aGlzIHVwPyAgVW5mb3J0dW5hdGVseSB0aGVyZSBpcwo+IGEgaG9sZSBwaWxlIGluIHRoaXMg
YXJlYSBzdGlsbCBwZW5kaW5nLCBpbmNsdWRpbmcgdGhlIGt2bXBwYyBzZWN1cmUKPiBtZW1vcnkg
ZHJpdmVyIGZyb20gQmhhcmF0YSB0aGF0IGRlcGVuZHMgb24gdGhlIHdvcmsuCgpEb25lLAoKTGV0
cyBzZWUgaWYgRGFuIHdpbGwgY29tbWVudCBvbiB0aGUgcGFnZW1hcCBwYXJ0IChsb29rcwpzdHJh
aWdodGZvcndhcmQgdG8gbWUpLCBhbmQgdGhlbiBhZnRlciB3ZSBncmFiIHRoYXQgSSB3aWxsIGRl
Y2xhcmUKaG1tLmdpdCBub24tcmViYXNpbmcgYW5kIEJoYXJhdGEgY2FuIGJ1aWxkIGhpcyBzZXJp
ZXMgdXBvbiBpdC4KCkFzIGEgcmVtaW5kZXIsIHBsZWFzZSBkbyBub3Qgc2VuZCBobW0uZ2l0IGlu
c2lkZSBhbm90aGVyIHB1bGwgcmVxdWVzdAp0byBMaW51cyB3aXRob3V0IG1ha2luZyBpdCB2ZXJ5
IGNsZWFyIGluIHRoYXQgY292ZXIgbGV0dGVyIGFuZCBDYydpbmcKbWUuIFRoYW5rcy4KClJlZ2Fy
ZHMsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
