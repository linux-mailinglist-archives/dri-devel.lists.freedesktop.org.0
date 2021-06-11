Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB93A4693
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 18:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C4B6F389;
	Fri, 11 Jun 2021 16:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23A6F389;
 Fri, 11 Jun 2021 16:34:32 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c124so31565378qkd.8;
 Fri, 11 Jun 2021 09:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m57wpdr8TWkeWwx/nynR/3LHtZYg/uiz58M2l2eeaXY=;
 b=eQYGJt9LRZ6POHf+sn7TAJbi6RL+JdYreMj8rAEN3V1xwYK3PnwH5CdEktYsDTkJDa
 tsd/To/20MBR5ZYHOirzQReYUlqyEXlwpnJktzWKlssnOfvHQmpbFKCt+p9mKEVZi77k
 pToMNshbMjUUWcXrB1h1KlzvtBobt66K+4HOMzk94Qhti24PWAQ9rUqELGMz2F2UMk+R
 vGj/shuLS01zwP2ENRayZAQKxoQl/akSwNofPjoXS3GgdIjzdhcSoP55soRkTWlZW6n7
 93PBzBkBmmg8HDWpBqAvluBv8Qz7gEiLa9tkp0VApEFZ1cxM5X4GePGsBAEjKyMAu8ut
 SXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m57wpdr8TWkeWwx/nynR/3LHtZYg/uiz58M2l2eeaXY=;
 b=Qb0O5k5m43QdgQhXtCCyYO+nvIbTC4JKF3aFtp/Nty6lSbbRnWchcLHn7WN/XaQADU
 stkJHSGTKDceatq+vRJB18FsjZyoAfV+6PoLBT1qFiO2WTBypD/1w0dLGGh2AFKpaUYL
 zorUWh1JhKgJ/uGbO2+0WcPnETfB/QxRoUeFUTXIY7cJydUIq0ccFtlaWdGwItLWpnEX
 kjtKvJv0IBM6gx5Z+jXyA8rTBjmJdu8iIRYDW2M9H78LtcAodbJew0Ac2hsUMQVsvBcw
 Tzo89WfHiwuTmc7Qw/8y05Tp6hyfrJ0fLe2q58I5wL1CwyCyRl3Li1Lj/UWnv0Rm4gYq
 O0rA==
X-Gm-Message-State: AOAM532haaZbEpF+lC5Vac4UENOD5028C7JDXDOkIWBIbopWw4TFlARb
 BblYycTo73FwfwrerSNUC5uvRu+8GPiOIoAzJMnrNonbaz9SyQ==
X-Google-Smtp-Source: ABdhPJzz+/LNojokFgUJqFSiixE+cQSoAezTJzzPcIGF+TpXFumYA/7ou8YfzU0pjLGX41i02FBHTjNYgAD91jH7saA=
X-Received: by 2002:a37:9a0b:: with SMTP id c11mr4440716qke.327.1623429272221; 
 Fri, 11 Jun 2021 09:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210611145459.8576-1-thomas.hellstrom@linux.intel.com>
 <20210611145459.8576-5-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210611145459.8576-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Jun 2021 17:34:05 +0100
Message-ID: <CAM0jSHPZCDSWyfvYta4hQxDQi9oR=1CqHg1xD6aDrmz4bGXHiQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/4] drm/i915/ttm: Use TTM for system memory
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

On Fri, 11 Jun 2021 at 15:55, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> For discrete, use TTM for both cached and WC system memory. That means
> we currently rely on the TTM memory accounting / shrinker. For cached
> system memory we should consider remaining shmem-backed, which can be
> implemented from our ttm_tt_populate calback. We can then also reuse our
> own very elaborate shrinker for that memory.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
