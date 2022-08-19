Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4D599714
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 10:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1810F17C;
	Fri, 19 Aug 2022 08:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3129F10F172
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 08:24:43 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3375488624aso74314407b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GridmYqKIl9YhRzWxWOzxfd24n2YkgbOm/HqzMAUhEQ=;
 b=bwNIyABVmu81M7BGPfjuHZ6PjIx00blv/MpdYbhXPXackmXOce8DP2CjV/tCB/03Si
 /FmDOotUt4VGGVOPk7no9TMR+TuGC7n73wb594mU54kKQ+XCvHraCCmCzIVrPJbhPpsm
 jjdZZSO942VUB/CVHr+wodkZPIzhIaTwLheZDB0+BeLUGC1Rmzi+4CYlvzHf9VIlSsaj
 ggHRRVyYDnrW6QmjXK1pmuYAURpmrYSbNORQBd7Hna4JgukZcEaIdFcLAGzLz+g3JBos
 GeCdgmv1eq8LW+Iz3ANUpnfGua4NLHGX62ulRSTOHK0XLfbaRoLxVSMBgzs6JBPA4OgR
 WDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GridmYqKIl9YhRzWxWOzxfd24n2YkgbOm/HqzMAUhEQ=;
 b=XoeZuX5QVzcyX2ExPpQGvm1i46BiNXJn+mTqKl7JkGnuYjzbqoLPNfRMv/yYNhwnkJ
 UQQ8CIpjDDa/Qew2nCWFMMMMXUkNZYEzXJKoQjfBx8dHC9bYU+JdD4Ugw3txVa1iA962
 9h3CXuR1e+AKzY95v+3Bc+/YAIG8g4fXQb+WFSWOBXispPzq3jzHZaKBWtN2lGcanzW0
 F3YjBg2b648y25AZsUZNs02/ce/36kndhq3TP+FiyjeH3N2+huEW/QJXD6LjV6sILtHh
 8gy29D9ZrSl1IepQ/M5lKLwpswr0AjH3KqHUzsnXaNeDceFdvzKt492PJzhrW0rIEfSx
 ZjOg==
X-Gm-Message-State: ACgBeo0809redYpriQyvikQcuZ1IGbvRA+Zql6m8k7RhalF5I1J7QcFx
 pwXylykOooLSo+VuvZlugXsHDmjRrVdIkazUyAozFQ==
X-Google-Smtp-Source: AA6agR5Xeeq2XXdslKqjNOEIt8ha4tkJ3suR0T/hScDsfaXCZ/KwX1otEr27K/Qwm11NBboU15GFBLmyI/AXH0D6BfA=
X-Received: by 2002:a81:d543:0:b0:325:2240:ce5 with SMTP id
 l3-20020a81d543000000b0032522400ce5mr6410102ywj.210.1660897482275; Fri, 19
 Aug 2022 01:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
In-Reply-To: <20220812143055.12938-1-olivier.masse@nxp.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 19 Aug 2022 13:54:31 +0530
Message-ID: <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To: Olivier Masse <olivier.masse@nxp.com>
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
Cc: clement.faure@nxp.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jens.wiklander@linaro.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 etienne.carriere@linaro.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> shared memory from a dmabuf file descriptor.
> This new ioctl will allow the Linux Kernel to register a buffer
> to be used by the Secure Data Path OPTEE OS feature.
>
> Please find more information here:
> https://static.linaro.org/connect/san19/presentations/san19-107.pdf
>
> Patch tested on Hikey 6220.
>

AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
heap driver for allocating secure buffers through exposed chardev:
"/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
as I can't find it upstream? Also, do you plan to push that upstream
as well?

BTW, please add a changelog while sending newer patch-set versions.

-Sumit

> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
>  drivers/tee/tee_core.c   | 38 +++++++++++++++
>  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_drv.h  | 11 +++++
>  include/uapi/linux/tee.h | 29 ++++++++++++
>  4 files changed, 175 insertions(+), 2 deletions(-)
>
> --
> 2.25.0
>
