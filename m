Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05EC514B3A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 15:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040CD10EC9B;
	Fri, 29 Apr 2022 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F46E10EC9B;
 Fri, 29 Apr 2022 13:52:10 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id y3so5782789qtn.8;
 Fri, 29 Apr 2022 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qqmh4QicnWPaJCJC7c88rxJhni8pNLr/gnKY6HjMk8A=;
 b=i5fIr3cePj+cTj9SbN9xwnGYEAJ2an2z+oBClMzCZFrn/n5tewtHlZKxWwn0AFPzQ6
 GA66hZU7t6t7hIwdV9XLtTsIDsRfcXAv5oEZ1qYB3sH9rKnjkVRgt4+E0qv+cljZQyU7
 awvO27agZ8rjQxHfD/Q9/pShKQN1OfwnD8udJSzq/BoFNy7O94e5z4GAXd+usRu6Alkc
 Aw3laLxXLc7c22HbtSean9BqI6Gbyco7PEzsDYnw+nCdqeHfWtzPfVL9TRMov5DW1MQ/
 p0ha0jVFbxe8jCqffvt53Z2eOaSqmtVGGJ//lY/0bWVB0MfNhDA+L7BEXuWDnbNz8K+A
 h+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qqmh4QicnWPaJCJC7c88rxJhni8pNLr/gnKY6HjMk8A=;
 b=DQr1eyFliEm7525d6mzj5grU4Jz77OqSjRWJkNvctYbLaNVdzGU132O1EYzN43QgiR
 VhkWt+G6M6sbJ7yZIa7VS8be0D5mwKIrfMptbFH4Gl0+HgTno0QmMKp0dcKaRtl4rro8
 qItwH56luBTGROVVld+Zd2hq6+n3eLq90E62MlYghwyM3/dUCKG/jBT+kThcHNyoBZDI
 aNfTZcvyChazhuo6CdZmAFEkkhgBcCJ9xmiduG0RHPr9jDue/scfvIHYwYQ/K3gZgPE0
 abKyMh5gc6wF91xIRMZGJUCEL+8QcuEx1LGYo/gJ2L5eSwTUpTXBwHvoQRWcsk+2q8KA
 OHWg==
X-Gm-Message-State: AOAM530Cfv+KQoNzKmRDsxQqokqQZhLEflN4ooKFS17VPeYhk0BOxKMS
 sys4cAH7XBCr+W5iGxxouQzGl6XbguoiB6JnEUUeOYliD1U=
X-Google-Smtp-Source: ABdhPJwa5yJIzbTjva35jH/1X3nJ7ehTFRtH4t2+aU/TjOrvcRzlyOcoXELjq3LAfBBBj2jOoQZZ5Y/AgTlVHE3m0Ds=
X-Received: by 2002:a05:622a:6115:b0:2f1:d8fa:84aa with SMTP id
 hg21-20020a05622a611500b002f1d8fa84aamr27670309qtb.689.1651240329189; Fri, 29
 Apr 2022 06:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220425152317.4275-1-ramalingam.c@intel.com>
 <20220425152317.4275-4-ramalingam.c@intel.com>
In-Reply-To: <20220425152317.4275-4-ramalingam.c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 29 Apr 2022 14:51:42 +0100
Message-ID: <CAM0jSHOvfE5i-ET2OmC926p59jLL0=vg_vxanFFG41H-aVhADQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/gt: Clear SET_PREDICATE_RESULT
 prior to executing the ring
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022 at 16:22, Ramalingam C <ramalingam.c@intel.com> wrote:
>
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> Userspace may leave predication enabled upon return from the batch
> buffer, which has the consequent of preventing all operation from the
> ring from being executed, including all the synchronisation, coherency
> control, arbitration and user signaling. This is more than just a local
> gpu hang in one client, as the user has the ability to prevent the
> kernel from applying critical workarounds and can cause a full GT reset.
>
> We could simply execute MI_SET_PREDICATE upon return from the user
> batch, but this has the repercussion of modifying the user's context
> state. Instead, we opt to execute a fixup batch which by mixing
> predicated operations can determine the state of the
> SET_PREDICATE_RESULT register and restore it prior to the next userspace
> batch. This allows us to protect the kernel's ring without changing the
> uABI.
>
> Suggested-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
