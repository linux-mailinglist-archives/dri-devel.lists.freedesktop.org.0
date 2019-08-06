Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66843845C8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFA76E655;
	Wed,  7 Aug 2019 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53D89A56
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 18:00:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y26so85487994qto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 11:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bxAi2AWxQLWDF2luvIMl7f/UII4L9fAd8kmJBO8r+QM=;
 b=Ehow1xAs4jLWMdtL2Tf4mvgT1VJbrS7v7SkbyCKgzQov4UMc7eP3IUi8XX8+ryemNH
 D24QzcCObesAoO16HXtOj0TBOfUlfs6/jEa/OEkvDWeslUQ8S0p7i+dcocVD0Vjx3Spz
 ixmXyx8qgtV2pesvLhT/EqCi95pVLM+Us7sMagzelusERuwQDNS9tqVxyV/sPq0p+XvL
 P1PnHAicJqarttDfVUYfGW4HiE/K5mt0Ow/D9DENAO7A3QkkbNRAq7Av+JBo3htTQSVP
 3U94ruIx061RkWs2KgPW5f2l/1trT1WcetV7hSEbRF0UttvK2ZkA/dZvIdaDmACmNpiD
 XJoQ==
X-Gm-Message-State: APjAAAVMzP/gTexgZUUyLEPrDMSj6evqt5aV7Pii7HUTAHiX7SQh2i3X
 i5V2LS6awR3ernTUOD1VFXvmdg==
X-Google-Smtp-Source: APXvYqwCmY0NZ93DbaUKqBGemthRcu66UNlk2zMQT2HujC+QqBl8bAE/pDy0q9npLsbnQ5I+0N19GQ==
X-Received: by 2002:a0c:c107:: with SMTP id f7mr4227804qvh.150.1565114428225; 
 Tue, 06 Aug 2019 11:00:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o12sm36309954qkg.99.2019.08.06.11.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:00:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3l5-0000Eu-8Q; Tue, 06 Aug 2019 15:00:27 -0300
Date: Tue, 6 Aug 2019 15:00:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/15] mm: cleanup the hmm_vma_handle_pmd stub
Message-ID: <20190806180027.GM11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-12-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bxAi2AWxQLWDF2luvIMl7f/UII4L9fAd8kmJBO8r+QM=;
 b=BTdL1q7uIftWEibqtpJ2qBvmgEl0z+WwHsvtywklotBDG0PpIzsdOkQu2MzqaTeVMo
 J8yB+abqQuKUfiuWe/VFhxZeK+LmVGsRDJrUW0pAsCMH6f998wxdNClpsRBWqGB3q9lb
 DIpOye+uQcyUXo3ondmYhnMZVp8o4EzhV4Jc5CR26nszzO7s8uyzHULN5JfFJg0w74zH
 z8baH6w71w2QWD+OqIA5XxvbMLZRSmwRHv4BH8MQpHSlnp9Rj+9dezQk76GZ8Y6Ui0Zs
 IOpf4eY2syFgOUh+A2Lc1gcx6oZthg+JUv4GWxh92CjWmzVf23Jl3OmhSvoxCjauSNqR
 3A3w==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDlQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3R1YiBvdXQgdGhlIHdob2xlIGZ1bmN0aW9uIHdoZW4gQ09ORklHX1RSQU5T
UEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBzZXQKPiB0byBtYWtlIHRoZSBmdW5jdGlvbiBlYXNpZXIg
dG8gcmVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiAgbW0vaG1tLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFz
b24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
