Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538B4F9690
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 15:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0E210F177;
	Fri,  8 Apr 2022 13:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5710F177;
 Fri,  8 Apr 2022 13:21:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bg10so17351358ejb.4;
 Fri, 08 Apr 2022 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YPyUmvWPJhClpiPWaffqsk3VwK+C7LO2AiimuAuL1Ro=;
 b=aEjngbWMuGEjH4EmejJTL8nfW0MPlu5EnEsysirIWeHL6wcIbqM/rsJpoG6/zo3m2C
 KNjMkZlpU+uOua8w7roVr1e7kiu2wEe60HwJD3IJuXNbsg5kY5wrqOi1uFQj6bjhmAQU
 H5Od0tMND3SzzYECenAG+5rIcMxRtG9HF1bpWrabqGSeA/T0jholG7YCwSYzokS+szVA
 Us9sBu+b33kGR5i63A2vc3u7BrE0+o9V8+Tf0PhtmpFIGUnL9VlR175cPjKTAJxClp3F
 CspHFKflvB2bdfOJJe73Rx1J1kBFRMxr7WQjFQCj4Aj295d1LL7Z12/4gzpG8DXxzcp7
 Lx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YPyUmvWPJhClpiPWaffqsk3VwK+C7LO2AiimuAuL1Ro=;
 b=DKdiq+fq6s3X/EP5v02U615AAwWEIhMe1CKCCzt1iM+HS7eI+cYUXoJShvk9i1USg9
 WODAxFO3PKrR5lA7o3fybglCfLF9cV7kKrwYL+fgnd45fIlqnVCA0slQ0QIYG/V9/1nm
 R/t4m/6GEHe5uyoqhYjhPx1zP3CHvOwfzxLPDymCI7ypUvviuTPiev+hQcxZ3arIuax+
 u6nMlNobGjbSWJBYpF5fztFuaDxyl+tjkmSATYkVFCXeRwEAgQamZCxQRObIF5+e8Jat
 yU9vIUIvrRo5EgUbhwz4xzafiVtaVdHSDHiRyDv3q+db/n/STfekF/YvGGbgdHM6bZRL
 0l3w==
X-Gm-Message-State: AOAM531sXCKVlL5HNCu1IuYPeVgnlxdWxveSE2KXh5S3szu3tqM8l80N
 f83Ai52f65WTIi5A75R95HSp6HGPizaqWzq3NLV0z7DvVuCF0g==
X-Google-Smtp-Source: ABdhPJz5+siwf2gqw3X2rRzoJIanYM41NMCYQCryCJRCwC2NONx2btw2hzLJPUuBprtMbGxfMaoG02PJ8uEuLtKbtJ0=
X-Received: by 2002:a17:907:9485:b0:6db:331:591e with SMTP id
 dm5-20020a170907948500b006db0331591emr18204422ejc.478.1649424066578; Fri, 08
 Apr 2022 06:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220408092803.3188-1-h0tc0d3@gmail.com>
 <4o2YD5id7zhK5g__CUK3Yf-6Dj459XQ0qsydW6wKHdco3YYtl78BqGUfXvQ9UO0AZoAsMPfhFB0jw1BFldiFDcbZXmGgsobuAoTMWmoDqmE=@emersion.fr>
 <CAP+8YyED70CSqVRaB7JgrAtK-yvBx5EsvrrdR7EpvOG2AVhskQ@mail.gmail.com>
 <QfKpxmkE_cy9wt5VJruw_TSdnl5KceKM8BxJGmZSBs-KiaRwIYfgc8h_-5h7Wmj6G-NtUJ3A88V5pzPvZuLlpkK-oRO5pSjeTxwHcZWlogs=@emersion.fr>
In-Reply-To: <QfKpxmkE_cy9wt5VJruw_TSdnl5KceKM8BxJGmZSBs-KiaRwIYfgc8h_-5h7Wmj6G-NtUJ3A88V5pzPvZuLlpkK-oRO5pSjeTxwHcZWlogs=@emersion.fr>
From: Grigory Vasilyev <h0tc0d3@gmail.com>
Date: Fri, 8 Apr 2022 16:21:04 +0300
Message-ID: <CAD5ugGD6QzCUqk7_EVwH9Cc6PQtx_VfjVRWzzP9uKR5tkGh1RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix NULL pointer dereference
To: Simon Ser <contact@emersion.fr>
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
Cc: David Airlie <airlied@linux.ie>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simon Ser and Bas Nieuwenhuizen, do you understand that you are
proposing to make the code less safe in the future? In the future,
someone might rewrite the code and we'll get an error.

=D0=BF=D1=82, 8 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 14:48, Simon Ser <c=
ontact@emersion.fr>:
>
> On Friday, April 8th, 2022 at 13:28, Bas Nieuwenhuizen <bas@basnieuwenhui=
zen.nl> wrote:
>
> > On Fri, Apr 8, 2022 at 12:01 PM Simon Ser contact@emersion.fr wrote:
> >
> > > Is amdgpu_display_get_fb_info ever called with NULL tiling_flags/tmz_=
surface?
> > > If not, there's no point in adding NULL checks.
> >
> > It isn't called with NULL anywhere, the NULL checks that already exist
> > seem redundant.
>
> Grigory, would be be willing to submit a v2 which removes the unnecessary
> NULL checks?
