Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8404EEE10
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D45E10E35A;
	Fri,  1 Apr 2022 13:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E019C10E310;
 Fri,  1 Apr 2022 13:26:28 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so2648244fac.10; 
 Fri, 01 Apr 2022 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lSOTdsVE0ZLDEykC7YpcLsTm8m5xnJaxpsAzG7AskyA=;
 b=DPjOVqd6sczWiem7CVMNGNIsxfRmqaAw0T7Vr3T+7ra3ub8PliNU6apv5gb5/0VTaJ
 +VZWu9Zf61/miMv8qdkDDOQCEtQa7dn3DzGxPlfXFBLF94FCJkoPfzk5SrZMuF/JWAYO
 te2pEENMNzGA+l39vajx8HsOUy/kSQgIhQDAMVdGXyHzsnQ3qQF7bjcey2cZFMRlbZC6
 YCBjmJpal0oOr4yMVtwlzVuueWvUPxlbmi0f5syjcKawKtEVEPaUZ4ojGsr8Wn9isahV
 +upeEgosPhLb59qGTPXofzgjPbvwYsaA1G1ttCQzZnYnElTeXxDa6WYIq1reJqYyvaKW
 keYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lSOTdsVE0ZLDEykC7YpcLsTm8m5xnJaxpsAzG7AskyA=;
 b=Oa83gz6k/Ml3qnhQq+toL4k4K0LNbT1JeGGeiLinydzqgxafu5oGLzrdBAXvRMajj1
 qE3Oym1Y8+BsIMl88++XwwBoxbwjPrq99YKKm/BBLcnjvQQ7B/llKBC4/Jj/OCFjbD8x
 Yi3vzhEkqwZ0pmPqRkzHbcpLMkEv/kVGwkN9bhQzr4XWYfG9mBzULqKa0vdPvNfZz+ux
 pJINL2Kdi4aBBgsII/Kx0PmyW/fVjzzBU+vwav/YccKfnYJUbTBl0BgFooBFiO2sAfKp
 cUGproPoBsxVPTONnDBn4YUIps0jOGRavVMpdsOqmsRVA4fC+k5hvLFCuCy2Dp9DNd2A
 yYJg==
X-Gm-Message-State: AOAM533FJcy21mMY8hYjn7X0uk2caXfZz9IO+3AmANPH9A+SCyjRjFOb
 II23D4SV4Ko3EWYbO2TncqekWID0WJatpwnqlUU=
X-Google-Smtp-Source: ABdhPJxgN9DZ7VfGH4Ogv6rAyXbwrEE6/Fq4Zz5D3iZ1jysSTFxGBV4Q5s/n9B+qBB0Ua0dP70POnievRyeeTITMBVo=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr4721650oaa.200.1648819586647; Fri, 01
 Apr 2022 06:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <1648706190-4596-1-git-send-email-baihaowen@meizu.com>
 <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
In-Reply-To: <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Apr 2022 09:26:15 -0400
Message-ID: <CADnq5_Nc7BU7235ZGN6iBq9iV50UcjC6aUpGr2qBnAA1fwMpKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vcn: remove Unneeded semicolon
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Haowen Bai <baihaowen@meizu.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 1:54 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Haowen,
>
>
> Thank you for your patch.
>
> Am 31.03.22 um 07:56 schrieb Haowen Bai:
>
> In the commit message summary, please use:
>
> Remove unneeded semicolon
>
> > report by coccicheck:
> > drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1951:2-3: Unneeded semicolon
> >
> > fixed c543dcb ("drm/amdgpu/vcn: Add VCN ras error query support")
>
> Please use
>
> Fixes: =E2=80=A6
>
> and a commit hash length of 12 characters. (`scripts/checkpatch.pl =E2=80=
=A6`
> should tell you about this.)

I don't know that you need to add a fixes tag unless the patch is an
actual bug fix.  Coding style or spelling fixes are not really
critical for getting into stable trees.

Alex

>
>
> Kind regards,
>
> Paul
>
>
> > Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/am=
d/amdgpu/vcn_v2_5.c
> > index 3e1de8c..17d44be 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> > @@ -1948,7 +1948,7 @@ static uint32_t vcn_v2_6_query_poison_by_instance=
(struct amdgpu_device *adev,
> >               break;
> >       default:
> >               break;
> > -     };
> > +     }
> >
> >       if (poison_stat)
> >               dev_info(adev->dev, "Poison detected in VCN%d, sub_block%=
d\n",
