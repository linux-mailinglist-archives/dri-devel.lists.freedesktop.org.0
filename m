Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74C637655
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BFD10E6D8;
	Thu, 24 Nov 2022 10:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B7C10E6DB;
 Thu, 24 Nov 2022 10:26:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b3so1898417lfv.2;
 Thu, 24 Nov 2022 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wbl1eJ6x56OjHapjM0KOvFX/ez00SCPS1SAA8nd+My8=;
 b=oK0RAC3iwvoFXabnpEyuM97uN7f34lLVXa/vQWMkyd5hta9r1OMKFtx6en683lz2x+
 dvi+4Qc4TYTLxAbieVPj7/un9xoSqYScsZgvckYICBEbBjycLU9NNVKBp1IfmuAgaSdr
 tIPM3SB9mscJ8pVdJJ1BLuLsroMoeIPaCkzFsKbJAwkwXsPwYFcZJFMMc9U4Jmkbe7oI
 YLIMOoQm1QD4lL7H1anKekOIWBwbySmBgZNk9TDCHl9VLzjbXQ+2wk/3IxJeFN7VFfQ+
 rMv4Sgx1jgpiqgKFU+bA1DnSafLoqkiguVoB0I/6PzHVHl42eY9f6ZLi7cXhNmLtRWEa
 v9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wbl1eJ6x56OjHapjM0KOvFX/ez00SCPS1SAA8nd+My8=;
 b=Wj2C+/nSy2R3YN1ZORBgZPWLNLwJNbV5rADRYV+0k8hnMHdL1XvgCvOsGahHgplti1
 dhDq9FRF4oOjjwPBJd2T24nkBLFK3ReKF++n26ME5Mn6D/GWWj794JnIyOebIWtNr59B
 Gz6kpna+MMlwWbVp7ndiaZnv+ZsqXXMUTxpOfKfE2OO7OFim25NNwgQPYqnM4j8QE5Dz
 Xh2igket0CDKAMMp9YpNM+f/3tDFu+rqSKt6NO4a45yyghSaq6Z9nVf4P0gzx0Bbb+Vu
 UJmYfEN0+oR5txW2+jZGjfgcI3VA5p5IhmzGClrvrX/zIXjGyBOTfgm3vg660eG9j6jC
 BZJQ==
X-Gm-Message-State: ANoB5pnK452Q5HlZvdanjx57C9O4v/T2lQgyfAcMqt/TwR0qA4pFPOVA
 PU7uLPC32ij2vyo2+Djij1Uzp++/uzmeSL5AIsX8xgjM+Ic=
X-Google-Smtp-Source: AA0mqf6Z3J9S7TPFygapkWaWFkugZMj+lRMl1BM40ymXiWW/0WW8F/mKQ5sLV48Bf3wdUvilmR+voGf3DMinqXLfUI0=
X-Received: by 2002:a19:4f52:0:b0:4a6:2ff5:ddd2 with SMTP id
 a18-20020a194f52000000b004a62ff5ddd2mr11883075lfk.166.1669285589451; Thu, 24
 Nov 2022 02:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20221124100252.2744-1-christian.koenig@amd.com>
In-Reply-To: <20221124100252.2744-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 24 Nov 2022 10:26:01 +0000
Message-ID: <CAM0jSHOYs-LniNd5s_3=Gz8YfspBzJiVOe3xYFcSQ41tuABpaw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Arunpravin.PaneerSelvam@amd.com, Marek.Olsak@amd.com,
 Amaranath.Somalapuram@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Nov 2022 at 10:03, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Those functions never worked correctly since it is still perfectly
> possible that a buffer object is released and the background worker
> restarted even after calling them.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

I know you usually do, but just a friendly reminder to Cc: intel-gfx
on the next revision or before merging, just so our CI can give the
series a quick test. Thanks.
