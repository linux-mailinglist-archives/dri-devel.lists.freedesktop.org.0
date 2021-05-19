Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436AF388B54
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EEA6ED06;
	Wed, 19 May 2021 10:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001646ED06;
 Wed, 19 May 2021 10:04:59 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c20so12149770qkm.3;
 Wed, 19 May 2021 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q6AhIlHXtoAPfKqu+C+DQcNp+lArg/8TRgoMnbB77NM=;
 b=PzViQNTT8GJFI0ecnCXnh2zpc/TlDYgoM/gSWEpk61PxZfFBy7di9WiWCbHRozhSHk
 +4makTNynp8iD4ixdmZjavB2p6pykHNiWf29J+9MJhv/2Fe3WN5OnkFHldTviCvE33uy
 beMNAWzdoJqjFUy/+VgR1byOW9ZC1IsIJFk1HSlpdQgpRfvEYdprtcbpFiQshLLmTpsu
 txRfXmM5bqSRqDcZPw+UyacadNAYuKMuaTkmoP2rfKDRqnFHObpyP2snaaXs4lID5oZu
 QHQr+dg5+K5GTr38/iCpT+L5DT9qHcn4PW7aFKnyXJOEy1Pu/mkjT/z7IVpZdkp6DzdD
 5I1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q6AhIlHXtoAPfKqu+C+DQcNp+lArg/8TRgoMnbB77NM=;
 b=C3c6vbrU+EH0fQboM1kTtCx8796SWlRt8fk4w6GEpYh/3tr33g9rXaV3O0mK4p/iW7
 dJJ+sOOrqPcynJLnig1SSUWiPDyAeMJ+mJGPNad6ZReb/FlEyPBIcT5SJAauhYijcq0P
 qduCXqfOKyCD4vyuv10BpXyk518EKbY4TnYfhyUAXf/UAjzg9t7xZgpYBeE2YoIcdPea
 0rFVqHjv5gv6L6c1cYHIZnr1V86mva8tg1zVQbLEfujILy3nutpzh1an0NCOYkWSrg99
 A2IPA7QSkR8OBDwQLPmwggan0JnUu/27GJzEArb/bRApShhWy8OGucp1Qvo0UWNwgtzI
 NemQ==
X-Gm-Message-State: AOAM532GQ3zdJ3Bm+QThsGp6DK1xJp/0ay37kNKNO9G6nyrMuAZNxfKq
 HPf90C981oJtLKL0o9jQ+srJbiLiBlqkF7cb9eL4YYrbR9s9LVfD
X-Google-Smtp-Source: ABdhPJzsy+5qW7UWhaOs6CzfNWzO0kjk3Ug+USwlVFHXs90Mmvng/QHxdkw27t6YLL1d1KNLV/GENGWyqayV1OVmcGA=
X-Received: by 2002:a37:9d58:: with SMTP id g85mr11016816qke.426.1621418699146; 
 Wed, 19 May 2021 03:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-12-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210518082701.997251-12-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 19 May 2021 11:04:33 +0100
Message-ID: <CAM0jSHPnY38kuoQMfi3fNK0fUqotu9QzAGO+wZ4_jqLqVvsLmg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 11/15] drm/i915/lmem: Verify checks for
 lmem residency
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 09:28, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Since objects can be migrated or evicted when not pinned or locked,
> update the checks for lmem residency or future residency so that
> the value returned is not immediately stale.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
