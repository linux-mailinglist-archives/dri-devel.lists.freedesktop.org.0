Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3503021D7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 06:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDEC89DB2;
	Mon, 25 Jan 2021 05:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745D689D1D;
 Mon, 25 Jan 2021 05:28:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id f11so13760990ljm.8;
 Sun, 24 Jan 2021 21:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sz3SySkIkX6Vb8I4Q0a7jSbUCKhB1+secykTFRzzKtI=;
 b=Gj4snBeO76j2dDQRt28WI+I9dAXUMGYNe27LC7g6OG3HihpFaYych+IQ19UvXMe658
 p0B7r24G3/3GdEVoUVGmBQb1ZI3s+mhwEOKtCSAB0T2tM2C0627On3BOSNUTNpsmSWMP
 B7TVKauTd8DQYDPWtsVIsAc+eu2TARXwfE2czvPHLSHHWHY6GZ9+/1CZSKhw+tOK2Y2t
 4FrXScLkJH8AzCFMl7PMrRneGqw5W1m8a1gjPRbG61obTOvHSJ2VklfjB0DV4fmIGxuo
 PfDj8NG5FI7WQ9pJfthm3wPGzrVM4kKJoI9oP2vEeaJSq7steTor6eevTOeLDs6HJg5K
 SeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sz3SySkIkX6Vb8I4Q0a7jSbUCKhB1+secykTFRzzKtI=;
 b=SDrVUvOL4uUWb4ieWMxULD7xtkuDD4QLryWbUCUocCGWAed1RoCHMHnGwsbPDV+wF1
 h5ZeZV9bImXkI4/rzHeP264JaniiZB0ludcBX+IQbfwADvYZHnA4R0C7WHt+idz0Vedh
 x3ue3U8oatLI5ngauQ81ppM2HgktET32Ki4A5rvbMzOAtHoGVfZAJ0bF1pEoBWVC43Jz
 4nrpuW9s0pTvR0pqbpXqCb4KTFzk4TiqPnjIHjYMkJv0vxWPf3u6tLv30hxcElNPE1BD
 boBfz8VF6OYYSV6flqyxcHR3El/9oXzTFN67gwgX9xt5GRSRMiBTyZYudrP6+5m5Kel0
 3yGw==
X-Gm-Message-State: AOAM53102VXLuB9XTesoBueA2pst0/7BHIR9S/uDyIp/s1moMns1+39s
 9SD8Bs4Jc0yDjISj/sE+UFj2hy9aUoeAV0bvguHPE2m8Ig24hiB8
X-Google-Smtp-Source: ABdhPJysNmZ0/gm8z1KXdAG7NN3Zmd5z+IUCc/5XbMx2SgxNFc1Olkpu6mFbiKn2ht3KVU2FYwwcpzJEWUS3g1mfPrA=
X-Received: by 2002:a05:651c:282:: with SMTP id b2mr685564ljo.52.1611552526684; 
 Sun, 24 Jan 2021 21:28:46 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
 <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
 <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
 <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
 <CABXGCsOcBMT4rL-bb4K_TzK70YmQsgNX37sHEHiqp_1kK1_UEQ@mail.gmail.com>
 <5f9e7752-68e8-aa5f-80ff-bb1196ea458d@amd.com>
 <CABXGCsP4KFFeSMLovCPV2yw17Pm9ovzwV5gp3CaQ9vUwx=Y-TA@mail.gmail.com>
 <CABXGCsM85uYEM0fKs5fubj9Lf=xM8oa5QzteVbKJr1eDWsk0wA@mail.gmail.com>
 <bb671243-7031-31ff-c6c3-dc1e4192ef71@amd.com>
In-Reply-To: <bb671243-7031-31ff-c6c3-dc1e4192ef71@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 25 Jan 2021 10:28:35 +0500
Message-ID: <CABXGCsOhn_2xg=HcZ3b=nuWhmBGF5Xz7WuLHORVZ-DV=eZQTPQ@mail.gmail.com>
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBKYW4gMjAyMSBhdCAxODoyNywgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEkgc3RpbGwgaGF2ZSBubyBpZGVhIHdoYXQncyBn
b2luZyBvbiBoZXJlLgo+Cj4gVGhlIEtBU0FOIG1lc3NhZ2VzIGZyb20gdGhlIERDIGNvZGUgYXJl
IGNvbXBsZXRlbHkgdW5yZWxhdGVkLgo+Cj4gUGxlYXNlIGFkZCB0aGUgZnVsbCBkbWVzZyB0byB5
b3VyIGJ1ZyByZXBvcnQuCj4KCkkgZGlkIGl0LgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL2FtZC8tL2lzc3Vlcy8xNDM5I25vdGVfNzc2MjY3CgotLSAKQmVzdCBSZWdhcmRzLApN
aWtlIEdhdnJpbG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
