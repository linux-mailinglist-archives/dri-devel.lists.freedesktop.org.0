Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B641138C01E
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 08:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825616F5BC;
	Fri, 21 May 2021 06:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0C789AB6;
 Thu, 20 May 2021 14:18:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id s7so664861iov.2;
 Thu, 20 May 2021 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBoE8uvg4daA6egY5B3E868eCtOCNrp/JoVxhqABrd8=;
 b=nDC85/OdQRNds+ZL2seJ8UZhD8mFSlufxaUYXOTO+uTnLzyG2vAjGK/d/CiIYGKrsd
 ebNIuwBF748IXzmjbYF+YvYz+JvfV1CoVd7W/QKmKOnHEntY5Be7XdylC1p0cbS4UyIv
 ibUF2s8L2Oy5MoK9ZTtdFsJIwbCy20TJcrbQMxZcQdDevnMi8ZO38LYKC04QFePPgRfN
 seZBWNhmzHEijMqtPGj+80HiJGKBFiaF/K3zR3sWHjfqE9JQZWFHoIO4FFlFZ2XciGdb
 gL44cqmZxYHnMsH1Fhaa/kJoBgxijigKi/AjPU2Le6tfZFcpqiZkCM0MhsDOuqr75xlF
 I/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBoE8uvg4daA6egY5B3E868eCtOCNrp/JoVxhqABrd8=;
 b=GWONsK/LtT9ODEXmqAOmgm3WKanmJHCMVcTmL161bYSTPUE/Xx/amWRKby+uIP7y61
 0NHcFGLQB/EzniqZHrS8745uSZ//0dyr//DuKGCbZNplhvCTtiSo+kOsQU53jZ66xoUG
 LDOgUsGvIgB3dvcLJoqmZKk9i3s38aM4Yh/nqMOY7nT4mnt/marioYwJN8mWyDoJzH4k
 hrSDoWWNbevhl0ie7qJkRt+lWrr2RzwNDPJTrZeIjrbu4a8FCdA8+GN3oG+lkbLFDTVn
 chQDs16tkZH0v+fpubJMPZqYwaR/HMbMUNawTbGxJOqllbJojx9CDMSgzHLGWBkwe0rT
 iC8Q==
X-Gm-Message-State: AOAM532LoLbL1Ax99WycyjOJC8pTM22O67nDjy3fWzPAHRW7cyVdGXbN
 j0SeO+cNNB9DXc7PFrG74E+JvWACZy/jBGmXKsY=
X-Google-Smtp-Source: ABdhPJxErgeRZBKGIlugn72wxzzF2d6U1bfQQzBUwXW0KqJDYOM6bQaKNq9JS1g+leNaKHufjyGbMF+2sTOkOerjiBo=
X-Received: by 2002:a6b:e91a:: with SMTP id u26mr5293102iof.83.1621520310394; 
 Thu, 20 May 2021 07:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
 <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
 <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
 <c22608a4-b84c-a3a4-0df1-448312b1292e@linux.intel.com>
 <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
 <BYAPR12MB28404674622BAB65A9257D1FF42B9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <YKZt+x6as7ix6TPy@phenom.ffwll.local>
 <e086fbd7-5d37-c8e2-0a49-c6c646faf309@amd.com>
In-Reply-To: <e086fbd7-5d37-c8e2-0a49-c6c646faf309@amd.com>
From: arabek <arabek@gmail.com>
Date: Thu, 20 May 2021 16:17:54 +0200
Message-ID: <CAOBfEJCFGCj54Hgr_-v9EH074teECmDh_9K+0HBksNgkZzu_Kg@mail.gmail.com>
Subject: Re: [Nouveau] [Intel-gfx] [PATCH 0/7] Per client engine busyness
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 May 2021 06:56:34 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Well if it becomes a problem fixing the debugfs "clients" file and
> making it sysfs shouldn't be much of a problem later on.

Why not to try using something in terms of perf / opensnoop or bpf
to do the work. Should be optimal enough.

ie.
http://www.brendangregg.com/blog/2014-07-25/opensnoop-for-linux.html
https://man7.org/linux/man-pages/man2/bpf.2.html
