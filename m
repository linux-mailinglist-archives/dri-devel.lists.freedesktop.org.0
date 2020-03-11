Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821C182A7F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6806E6EA3C;
	Thu, 12 Mar 2020 08:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D8289B95
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:39:50 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c145so2239244qke.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=rhjsFMTJYLZ3mn2Gjz5gdtKztjIbQQxRnlgYYaHk1wc=;
 b=jq1nLd7N0ZM7NLCRPAfd79/3lp7JoXaQKyCjdib2YXuex017Paog9Cb1gSTi52LaeU
 LD1ju8rshUvB9zkWef0PdPNO4Udw8+V7isXoZuvpyXa3Tx7jTX90pbf6ULYJ329QC+NK
 wurlo3b/MMssorlcwSLZj79N4GJnzXsr4ICiDM8lsMCuJ/s4Mq2uL9dzHxoJ9rThUt+G
 0M43++rvscWef+QYZ2eNhZrNiGqlrGzYxZdDEuHrFWPa1huhFSMbPlS/F/RD8Lxqb/Yt
 mM38TQUVgne/tXy4ELehYJrpPYdpSf4SvLUhu1xVPU7Nl9Y2F0cZoCDvYVvQ0XCHD7Y8
 Ellg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rhjsFMTJYLZ3mn2Gjz5gdtKztjIbQQxRnlgYYaHk1wc=;
 b=HK5W50Zfvtnh6q6HPtYd7l65d1HsZLM3h7TAKe4WDlu018JPoTA/0mLgjvj3U+LeYN
 4D4spMRZuUdQDB2QC+C5IRLBfhiiDdn/vCUX7133aqVIbzOPIDp23KVqHWMRdI1YmqQ4
 WMXaeGNMhkq9ul8JCgBey/q2OWEeTRX/ZX49nxFtbLwRTacQbFsbBEJuLt03UpVLhcoO
 w/Gvlp7iK286vNTYlcgaS06xQs5joZnVz/CLJDOODh/Tu0GJ27iV+CEaswctCcKkF5yT
 JMjPyb3BXKTLO3H251VmFEvo7rztUym0m/X8BQJJM8EOGQGNGkXHnoPamtVQjQUZ40ZW
 BwqQ==
X-Gm-Message-State: ANhLgQ0NDFbSYx0I0OVhWo2fi6wBIcGq6vi+lhWG7oUyURboSOBp3NsY
 c0CT51yoiDjswNdMeAULBNgWaA==
X-Google-Smtp-Source: ADFU+vtKWKPXCGB7JIWxuZf1mxQBulTGgF3UEE8ZRkf2YrVumDjwnXJioMKq580TmzzqD9l1/42wwQ==
X-Received: by 2002:a37:5d86:: with SMTP id r128mr3206003qkb.177.1583937589992; 
 Wed, 11 Mar 2020 07:39:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id p22sm2113247qki.124.2020.03.11.07.39.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:39:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC2WT-0004rq-56; Wed, 11 Mar 2020 11:39:49 -0300
Date: Wed, 11 Mar 2020 11:39:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/6] drm/amdgpu: add support for exporting VRAM using
 DMA-buf v2
Message-ID: <20200311143949.GE31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311135158.3310-6-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
 hch@infradead.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDI6NTE6NTdQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKCj4gKy8qKgo+ICsgKiBhbWRncHVfdnJhbV9tZ3JfYWxsb2Nfc2d0IC0gYWxsb2Nh
dGUgYW5kIGZpbGwgYSBzZyB0YWJsZQo+ICsgKgo+ICsgKiBAYWRldjogYW1kZ3B1IGRldmljZSBw
b2ludGVyCj4gKyAqIEBzZ3Q6IHNnIHRhYmxlIHRvIGZyZWUKCgpXcm9uZyBrZG9jIGluIG1hbnkg
d2F5cwoKPiArICogRnJlZSBhIHByZXZpb3VzbHkgYWxsb2NhdGUgc2cgdGFibGUuCj4gKyAqLwo+
ICt2b2lkIGFtZGdwdV92cmFtX21ncl9mcmVlX3NndChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKPiArCQkJICAgICAgc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCQkgICAgICBlbnVtIGRtYV9k
YXRhX2RpcmVjdGlvbiBkaXIsCj4gKwkJCSAgICAgIHN0cnVjdCBzZ190YWJsZSAqc2d0KQo+ICt7
CgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
