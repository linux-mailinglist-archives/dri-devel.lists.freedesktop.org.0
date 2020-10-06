Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39A284FEC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 18:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBA889A32;
	Tue,  6 Oct 2020 16:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011F89A32
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 16:34:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n18so6404151wrs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IQwIiSBu/shWVWC8XNTOg4imG3CzBYBvVpGZ06fvFrE=;
 b=h+NTcOH7LE548gMVTKxDrCvbnM0gjCsoOxsQq8EnBOPN2FjBjvvPnp82HvizwAMI4M
 HJXDXzqDcKAcuIOSzCvRkRHz1hhbZ9Og4jhEqTMKT3MxMZcjLjQpfCXLShF4zrho90H8
 otyo8ifaNvpe/ZXsWLwBv+bWzcXtnNtuzBHHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IQwIiSBu/shWVWC8XNTOg4imG3CzBYBvVpGZ06fvFrE=;
 b=b399wRNdVqH5aFr83A3qisXsAbktFHF8n1/vpA1ghS8i8s93HxrkshTh6QQgCBElFL
 YQr2/LzKSb4EFaziIBTc79svgUj33frEYsFwe6AOAwFxx1QUDmX2Zp51gBEbndnfqp+f
 1GZVUSMhpK4a1ziDsACancGfzy1g+mDXghY7fD/9T3cbb2hMcY1pFRhgXb7rp8MGuA7n
 Qd42hBWU2lOCjnBspxr7GbLEggFdJxCTLlCyRejCV2nqD5xYSJyawRRo3IDnVr+pghF8
 m8e9UgLoxKEyfu8hQwevPEtVslGbOEey0vVCLX3AjI4rtzvPmawEywzfQ8kaWT713c+o
 jQnw==
X-Gm-Message-State: AOAM5301feUgQqB9lsJWFRYZTrFRsxib53B7tXGM8QXJHhsdSw+/931U
 6lECVrrxU2gGaIWeDfIg0MJFYQ==
X-Google-Smtp-Source: ABdhPJwAEbTRD/Tl8B9cQZ5yWXIli073oDxajpejyexueSRaOy4JEy50WWRW8eAr9Alox57L3Vibig==
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr6494980wrm.0.1602002063675;
 Tue, 06 Oct 2020 09:34:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm3586777wrm.51.2020.10.06.09.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 09:34:22 -0700 (PDT)
Date: Tue, 6 Oct 2020 18:34:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201006163420.GB438822@phenom.ffwll.local>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local>
 <20201006154956.GI5177@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006154956.GI5177@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 12:49:56PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 06, 2020 at 11:22:14AM +0200, Daniel Vetter wrote:
> > 
> > For reinstanting the pages you need:
> > 
> > - dma_resv_lock, this prevents anyone else from issuing new moves or
> >   anything like that
> > - dma_resv_get_excl + dma_fence_wait to wait for any pending moves to
> >   finish. gpus generally don't wait on the cpu, but block the dependent
> >   dma operations from being scheduled until that fence fired. But for rdma
> >   odp I think you need the cpu wait in your worker here.
> 
> Reinstating is not really any different that the first insertion, so
> then all this should be needed in every case?

Yes. Without move_notify we pin the dma-buf into system memory, so it
can't move, and hence you also don't have to chase it. But with
move_notify this all becomes possible.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
