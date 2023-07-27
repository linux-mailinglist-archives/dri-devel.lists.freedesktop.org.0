Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71E7648F0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B0010E4F8;
	Thu, 27 Jul 2023 07:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C6310E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:39:49 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-62fe3f0905aso1014096d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690443588; x=1691048388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipNBeFDXQLb9A1znYosrbZieOURgdNi9lQuyYfXalPg=;
 b=m8qhbyQ9FvjyLnloYPhg+K3E1Hc6ThIcirqYBPGa2Ry8kX04EczZMh9vHX5M2926m3
 KqZJb6m2VEHP6Z6FBUUFPiZ7i9Ogh/CT1HlMNhgH+cnpGV27DrWVuEftow1v2ab8+Rs6
 DBf/F7GR+Z/EqnT/xHmAhqwZhfVFSY7rAgDm0pEXUci9EUkJX9yAKFLyu9ABNLLV3Usk
 JuU+bSCchrfNmLToZlFg5Rm0uipASUpf/ZZ9T4J6Hxvb0K2msrsDYm+TaRLIVgJJ7fqP
 25A17eePmGNvYl9YpfcZ7bqP9pKzJd3QFQ6IEmwMu0DJWwGOKwD+zS3n2xs9QQykyrF0
 bvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690443588; x=1691048388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipNBeFDXQLb9A1znYosrbZieOURgdNi9lQuyYfXalPg=;
 b=LmFvBFouQiIHnrg770QqVow0OGQFYXzAHicRbeqTL+DXaxx7eBKxKTIk/wdSXVDWgs
 ZOB+kS+pNMOuNKPMEjSEeQCk4zi1rJxtv4LTYepLiHLLcuHiuhAfs5h6rPOvS/VXlZi/
 d8gsPVZMBUQalM0ucYndyZ94K4CFjeoqnvxUNe8avSTmp5aBX3q3pFY9jkmkJTBDJKg9
 /NWMb2uCKjnbBJrnj8DWlzFNNiiMfx2qM502xBj2JlD2HJXG6w/xH4egK8z4QBxcPayA
 DOlZWxV/emBLs7XfytK4jdVzKmBREnJs8FOHwVJT1Ds3IFC0T067pv9v0pM4Hm6Zu675
 TOqw==
X-Gm-Message-State: ABy/qLbsSt7g2gde+n4pOqG24LAmsHRPFEBMr7R5VbA3pyfrlMWw8NC1
 j6/CvW46pZkSQcu7CGeJpSn57v9WmoNF3iWOfMK+o92tK22J+NGg
X-Google-Smtp-Source: APBJJlH3bD2LlLILikY89MZhsbJ3AsLR7LWRr5GTzkliFiuOYB4e3kTu1+M4KMT6Uy3wee4suXZFDtjhyYW+MHX6uY8=
X-Received: by 2002:a05:6214:5289:b0:635:ec47:bfb0 with SMTP id
 kj9-20020a056214528900b00635ec47bfb0mr4978017qvb.5.1690443588460; Thu, 27 Jul
 2023 00:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230724024229.1118444-1-guchun.chen@amd.com>
 <CADnq5_Pfwyen7W6v9-MoT_S=owcRHbu-+TbwJ2KTN-iHcbEY5w@mail.gmail.com>
 <f401e8b1-d2c1-9837-7a0f-35fd9a4ac64d@amd.com>
 <DM5PR12MB2469A467CC44134886BD6F9EF101A@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2469A467CC44134886BD6F9EF101A@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 27 Jul 2023 12:39:37 +0500
Message-ID: <CABXGCsM_cLPLBJW4Kxk3RBn9UpsMDqLA8bhEOOVyDSERcO-WMw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: check null pointer before accessing when swapping
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 12:33=E2=80=AFPM Chen, Guchun <Guchun.Chen@amd.com>=
 wrote:
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > Has this already been pushed to drm-misc-next?
> >
> > Thanks,
> > Christian.
>
> Not yet, Christian, as I don't have push permission. I saw you were on va=
cation, so I would expect to ping you to push after you are back with full =
recharge.

I expect to see it in drm-fixes-6.5 cause the problem appeared during
the 6.5 release cycle.
And yes, I follow all pull requests. This patch was not included in
yesterday's pull request :(

--=20
Best Regards,
Mike Gavrilov.
