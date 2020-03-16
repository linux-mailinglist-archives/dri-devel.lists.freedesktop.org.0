Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC7188733
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7EF6E18E;
	Tue, 17 Mar 2020 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA62C89EA3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:38:01 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j4so9202132qkc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MPn5IAw3djWwAyz1kz+XKbBrYIDHFtPILHod+O3PgbQ=;
 b=aIKbt6gvuiAhWyACI49w9p3qYDWetIUw69TZkvSfFYqabNj45UFmhTmKNRHgQnTnkR
 IFxzsGzim4MNiBCWvgYX5FoIWiPm5WgtqdBMX5MADHe3jnAChBh32LnebALzQLpMO2rf
 IqC3WtBKRzD/hlzJqzBb2M95um5CgJ+SMXQIw12UioE99Z5jF48BLiklGfqxAuO4/QHS
 n1I3tMGpkalsddB6Z2jDzcO4NARtswgfs7Hqyl84SqJh0mNZl7IGKTzb6ibaxlVP1s5v
 Yo55SsyhAfHLBuy9n9GKk/R0w7Nt356odOOdO0QYnIMNN6fUAO6Hm3WSCH05dpGbNojS
 7Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MPn5IAw3djWwAyz1kz+XKbBrYIDHFtPILHod+O3PgbQ=;
 b=qpPocm7vT0pofpwB4M6GQ0pYmy+Eo3L5B7xOWeZEvChIuVMCepm11ir0WLN0qnvVrs
 Rm44R+rU0ghF4C6H/yh9PNBjItCzh6F4WcP6IDI7zzZ3I/e1VDGELbGOOHAT60CKeA9R
 Qdz1k/HQ81/1OEjgh+H0QTN2nQz49HTIGwla6S7VSNyZ41KhthrR3xbzbajfOfKTSjSL
 awGHjIOPILfUoO5mdmXKI0HHoYz9QWbDRb/hZVLEfpPsU3y8kCbyjmq3d8+h8aoNOe05
 vVvPNSQSql0rhX5gwCm1zCzUIO1pCqw26REXIONFDNfigRB+JEga7dHbJ24iwNbcb8D9
 phpw==
X-Gm-Message-State: ANhLgQ3NrsKNDRZKMHNH1bShuEDBStf7ZD1eJwW6Wjsf7BAmgmR/8Dgt
 ipYW4ZBdPt4//cjsIdPTGTC0qQ==
X-Google-Smtp-Source: ADFU+vsR/lHlA/aPYgy1rbDsRY5qjupHbAxemY9eG19DwFYbj9qOlM9R13lB9zyGeNbrRAqnDTSwxw==
X-Received: by 2002:a37:b886:: with SMTP id
 i128mr26473316qkf.410.1584362280987; 
 Mon, 16 Mar 2020 05:38:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id r15sm18535564qtr.40.2020.03.16.05.38.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 05:38:00 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDp0J-0003bq-Mn; Mon, 16 Mar 2020 09:37:59 -0300
Date: Mon, 16 Mar 2020 09:37:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200316123759.GC20941@ziepe.ca>
References: <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org>
 <20200313121742.GZ31668@ziepe.ca>
 <20200316085642.GC1831@infradead.org>
 <eb567569-426a-0845-b443-a20155897705@amd.com>
 <20200316095213.GA29212@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316095213.GA29212@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Logan Gunthorpe <logang@deltatee.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMDI6NTI6MTNBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMTA6NDE6NDJBTSArMDEwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IFdlbGwgSSB3b3VsZCBwcmVmZXIgaWYgdGhlIGRyaXZl
cnMgY2FuIHNvbWVob3cgZXhwcmVzcyB0aGVpciByZXF1aXJlbWVudHMKPiA+IGFuZCBnZXQgSU9W
QSBzdHJ1Y3R1cmVzIGFscmVhZHkgaW4gdGhlIGZvcm0gdGhleSBuZWVkLgo+ID4gCj4gPiBDb252
ZXJ0aW5nIHRoZSBJT1ZBIGRhdGEgZnJvbSBvbmUgZm9ybSB0byBhbm90aGVyIGlzIHNvbWV0aW1l
cyBxdWl0ZSBjb3N0bHkuCj4gPiBFc3BlY2lhbGx5IHdoZW4gaXQgaXMgb25seSB0ZW1wb3Jhcmls
eSBuZWVkZWQuCj4gCj4gV2UgYmFzaWNhbGx5IGhhdmUgdHdvIHdheXMgdG8gZ2VuZXJhdGUgdGhl
IElPVkE6Cj4gCj4gICAtIGEgbGluZWFyIHRyYW5zbGF0aW9uIGZvciB0aGUgZGlyZWN0IG1hcHBp
bmcgY2FzZSBvciBzb21lIGR1bWIgSU9NTVUKPiAgICAgZHJpdmVycyAtIGluIHRoYXQgY2FzZSBj
YXNlIHRoZXJlIGlzIGEgMToxIG1hcHBpbmcgYmV0d2VlbiBpbnB1dAo+ICAgICBzZWdtZW50cyBh
bmQgb3V0cHV0IHNlZ21lbnRzIGluIERNQSBtYXBwaW5nCj4gICAtIGEgbm9uLXRyaXZpYWwgSU9N
TVUgd2hlcmUgYWxsIGFsaWduZWQgc2VnbWVudHMgYXJlIG1lcmdlZCBpbnRvCj4gICAgIGEgc2lu
Z2xlIElPVkEgcmFuZ2UKPiAKPiBTbyBJIGRvbid0IHJlYWxseSBzZWUgaG93IHRoZSBkbWEgbGF5
ZXIgY291bGQgaGVscCBtdWNoIHdpdGggYW55Cj4gbGltaXRhdGlvbiBiZXlvbmQgZXhpc3Rpbmcg
bWF4IHNpemUgYW5kIGRtYSBib3VuZGFyeSBvbmVzLgoKQ2hyaXN0aWFuIGFyZSB5b3UgdGhpbmtp
bmcgb2Ygc29tZXRoaW5nIGxpa2UgdGhlIGNvbnRyb2xsYWJsZQphZGRyZXNzJmZsYWdzIHNjaGVt
ZSBpbiBobW1fcmFuZ2VfZmF1bHQoKSBzbyB0aGF0IHRoZSBkbWFfbWFwIHByb2Nlc3MKY2FuIHdy
aXRlIERNQSBhZGRyZXNzIHBhZ2VzIGRpcmVjdGx5IHRvIHNvbWUgSFcgZm9ybWF0dGVkIHN0cnVj
dHVyZT8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
