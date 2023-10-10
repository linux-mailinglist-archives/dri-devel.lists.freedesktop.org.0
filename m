Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842287C4115
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A4110E3D7;
	Tue, 10 Oct 2023 20:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA71810E3D7;
 Tue, 10 Oct 2023 20:23:30 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53b962f09e0so5565117a12.0; 
 Tue, 10 Oct 2023 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696969409; x=1697574209; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9K/39pYVDB63ZN/U40w9C502En4aUTJoZoW8PKDMTc=;
 b=flT6kBIMJK1sCskugNg6/szqXf7r3hNjli+2gbs5TqJHnl6eQINcfIMLfzK++Hxe2j
 Xl/xCTwhBDvjXlY8UQlFrL7yaHOcw9UU6Wox7T5RjjWLLisQVkHZ/BkJDulmDh4a+rwh
 tsfYMqxdtuOvT1P3B9IDnn7CEGTdNkU1aSyEux3jsaYfz63+zwNummsu7RYXF06fNV+c
 Xv9g8ZBKhXgbR8EnubgG04fHXt05gJTa7VjckJBXiq/bKc9TMLWVOZja9wr/Wka9qL4U
 6sPKEy6DFehshqgf64WDAp4IV4is6H6UfYDFq23e2rXHmJ4yYMTc4WapZ+GaPjdCwVMW
 srWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696969409; x=1697574209;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9K/39pYVDB63ZN/U40w9C502En4aUTJoZoW8PKDMTc=;
 b=SSTT03Zb5PxOfTIh8cCLzlNauD2r/glnNi+ejxEned1SjUO1hDf+C31JCdu3F8ssVU
 8XEyYOgS575w8yTpQ8WaIWaDfI1mh7hj4qwFWFBBnH/tLxSHGjJRLpumxNrWhCcxAyDk
 14OQvc0Rg8rbWPFQYReIH/Rp50DVHL8pULxDkXmPI0TvM2TlLhkRDoKhmgiAQ13UlWdc
 z3sQbQQkxJpaiUCQr+KBWmP6NYf5TKvPI+JPU2AjGx3ElBxh09Nj3GRme6ewy8xWywdj
 fooi6ghMLcW1dhjFBP9Gv4/6SvrULrUxXRIwK/fPMbAFBDuelJNtwlrLRUflzU73OIck
 gwAA==
X-Gm-Message-State: AOJu0YwGy4VbCJSW8a4YFADwWe76y/3uHWPw2BdWqd3ptVwPjPKVCVyv
 KPvIPYT0Nnr7Vf4HfNX6SuU/+gAgzCxBAnUVz40=
X-Google-Smtp-Source: AGHT+IGllDkDZOXntggqqiPf3dVIEhRfn/puLAvLIPz+t1Q0k06Gc6OysEHoI/3TNpo+v9866aIG21AyO2mZjaS6mW4=
X-Received: by 2002:a17:906:7398:b0:9b1:aa5d:5d1f with SMTP id
 f24-20020a170906739800b009b1aa5d5d1fmr15193521ejl.73.1696969408945; Tue, 10
 Oct 2023 13:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
 <0c50ff22-0f11-1e27-c32e-694ce2b1e6c5@shipmail.org> <ZO864yp3UyVEfEjz@pollux>
 <88c45fe6-0942-707c-9ea7-8486c177fcd7@shipmail.org> <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
In-Reply-To: <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 11 Oct 2023 06:23:16 +1000
Message-ID: <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, boris.brezillon@collabora.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I think we're then optimizing for different scenarios. Our compute
> driver will use mostly external objects only, and if shared, I don't
> forsee them bound to many VMs. What saves us currently here is that in
> compute mode we only really traverse the extobj list after a preempt
> fence wait, or when a vm is using a new context for the first time. So
> vm's extobj list is pretty large. Each bo's vma list will typically be
> pretty small.

Can I ask why we are optimising for this userspace, this seems
incredibly broken.

We've has this sort of problem in the past with Intel letting the tail
wag the horse, does anyone remember optimising relocations for a
userspace that didn't actually need to use relocations?

We need to ask why this userspace is doing this, can we get some
pointers to it? compute driver should have no reason to use mostly
external objects, the OpenCL and level0 APIs should be good enough to
figure this out.

Dave.
