Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE204402BCC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50989F85;
	Tue,  7 Sep 2021 15:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A3F89F85
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:29:33 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r26so13274621oij.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VU4MqafwDk+0i++JDzd5+A9aTMDqU4Al1n8Y+GWCsls=;
 b=PUuUs/66sZ++rBSl+mn0UKxwmNRdo/4fZk26OOgvIGtnyYLYRIDidmJoC2orYLKiBa
 eG4KzmnGaPTNJ/IMSzzFnsnv7qGEp7LPxFx17Pof2M+rwFODHmNKKRgL3PdR2VJwA3zo
 +bh6tTtQZ6mHfd8VSnJcbKiwu1BOzzfILZ3WA3d9Vt3lAYA80Y4eoYT7PhN7NCiC9M4B
 8PJPxB92Gs9LeG4LO/CZvbmMYTy3gh+zKAs0LS+KFGiP2Ohg4oJ4/xK5+vNjRCukIm6S
 VVOidWIqVC/k7z+ULf3QItJIix6sYuxPDJdKwcv540j5EGhn+RKJBXj17MLroB1/oMF3
 +r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VU4MqafwDk+0i++JDzd5+A9aTMDqU4Al1n8Y+GWCsls=;
 b=yQs91qeyIvpSuvZb1uzCMGDVcEpwN38DabH6q33mWYEj5sOYhAFRv4zSRa/4Qwq65M
 TSJonsMsNmkBHiHdcFA2vT1fyOBT6pXHQxSq0Y1ebtg35QaGa4yoPrOxBgD8oVsnZoBd
 So+p1omL6k15EErQFW3A0KKLReIYCavOCfVyU3vsoiG1VIW5Q5zyAB1SxpSB8IXHgnDD
 ULLeHYTRKyWU455dSBz1KQYhG3M/H6pDc/Kkqzx0JwNo8Magt8WiD6+NInvY6CmzRS4k
 jBlRwzV17eHzJKRKdby6cWIRCNdNLsKuKEJ7ahc2JPcvzBfSWNm9snayVw3vLBzjkd8H
 PCEA==
X-Gm-Message-State: AOAM530EhHVYvbywI8Q+iWJB9POiL+fKdKmg/3LWQ02qWhLyyA+HsBfm
 nVb+kWbB39bs+nae0XBbjB7+sa4YzWzRE6iqJjdz74sNP6w=
X-Google-Smtp-Source: ABdhPJyZGW5UJL65a6irJsB2GLjdgyyiDFby8Un5dklHNowIk7iCtFNfSWV6+KlhlrpBg2RfJT4VjUlks+p7Eei2Vas=
X-Received: by 2002:a05:6808:483:: with SMTP id z3mr3277125oid.5.1631028572446; 
 Tue, 07 Sep 2021 08:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-6-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-6-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:29:21 -0400
Message-ID: <CADnq5_PRc+yry6PPopjai6x-_x7JeBad2=bZq1cLdWhfe5PbAQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/ttm: enable TTM placement kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 7, 2021 at 4:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Fix the last remaining warning and finally enable this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/drm-mm.rst    | 6 ++++++
>  include/drm/ttm/ttm_placement.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 66d24b745c62..1c9930fb5e7d 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -43,6 +43,12 @@ TTM device object reference
>  .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
>     :export:
>
> +TTM resource placement reference
> +--------------------------------
> +
> +.. kernel-doc:: include/drm/ttm/ttm_placement.h
> +   :internal:
> +
>  TTM resource object reference
>  -----------------------------
>
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placem=
ent.h
> index 8995c9e4ec1b..76d1b9119a2b 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -58,6 +58,7 @@
>   *
>   * @fpfn:      first valid page frame number to put the object
>   * @lpfn:      last valid page frame number to put the object
> + * @mem_type:  One of TTM_PL_* where the resource should be allocated fr=
om.
>   * @flags:     memory domain and caching flags for the object
>   *
>   * Structure indicating a possible place to put an object.
> --
> 2.25.1
>
