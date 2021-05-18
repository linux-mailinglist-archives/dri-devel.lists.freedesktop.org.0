Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280E3874E3
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57726E855;
	Tue, 18 May 2021 09:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505896E853
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 09:17:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z17so9346486wrq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9eTPO/t6NCx/uQxkUlEH7zQPG+VNu47KdFOPfaH3erE=;
 b=K0J9+LUeBjKpfAq1eso85FwLWG/fzU/3gAs1+laTEAsGsadH4ShCeT1i/mRXGIb4A0
 dbEfer8uNPkFJB0IPEwS1v7fS29yW8JEUV27ePNg6MLa2FCThJan6FNhiKrf3QmcZ+tp
 GUa7D3d+Ay3IJBcuJGszjLzj/7q6ItNFNQHLyfomlcAUaz9jDOlMNUayZ7395NVTr1Ff
 6aZ/pFA1ZqEHWDOS9M+GWDwYXIZVQ39mbDG6FdBIG4+SdQpHZfcOBdpFRUH4Vj9TFwe1
 nlcGU3H9udX6PY8LB4AxngCmzlfyJVnMZpOZEs/2ISFuAD+i4jn4lVXYiWCZ1HntLN/I
 earA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eTPO/t6NCx/uQxkUlEH7zQPG+VNu47KdFOPfaH3erE=;
 b=aMMklKpfrZ45nmAsu1t1pa5IGqsbIkq9TeL28LHakKdsIPPWqGXQ281+Q5sn/PZsB3
 m2GqadAkW7UEVOm3EHiUU7/ocVVc0V9pKXcMFG0+Me+JhOgc9BcRC8fMXP6GJqO5t6kz
 X+eal0Y2P57qdIuiWdh5MV4WCcXJD0juSQFA4TKl+a1WTq53CGsY5X/3LfguFccLNN9u
 g/azMb5pFE8CRkvxrZFs2pILDgHGZvfFgUTzG/0nccmbKPyxkEifFvAii8lfTfH7PAA+
 uoCFYA/ZsUYL9BYVe7EhX9571qsR47EKRoOgH+4jqT71ESZD6sDpHaLfzg4fhvAL4krE
 WH9Q==
X-Gm-Message-State: AOAM531l2nuXFePInPMPnN3Xpk+QJeGIqFEsb4nZOJ+BjNGGXdM/P3aW
 boa8Y2/5gt6hDdMmmzMkZFZE2V95I5VyWQtDNzdKmQ==
X-Google-Smtp-Source: ABdhPJxN4k+wHiN+IopkT08sjmzmaYf2pZO0ZVnrzgFQ2RRcF6ozwlW5KmeBRhHPEiXC5UP8hW2E/0py4TRuOBk/3S0=
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr5496119wrz.256.1621329423850; 
 Tue, 18 May 2021 02:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
In-Reply-To: <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 May 2021 10:16:52 +0100
Message-ID: <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> I was just wondering if stat(2) and a chrdev major check would be a
> solid criteria to more efficiently (compared to parsing the text
> content) detect drm files while walking procfs.

Maybe I'm missing something, but is the per-PID walk actually a
measurable performance issue rather than just a bit unpleasant?

Cheers,
Daniel
