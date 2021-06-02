Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1218397E4D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 03:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4BD6EB4B;
	Wed,  2 Jun 2021 01:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B9B6EB45;
 Wed,  2 Jun 2021 01:57:46 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id h9so1265832oih.4;
 Tue, 01 Jun 2021 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SU3VNhIHP4qFfMS6BHdB+T/4wdfQUGXE54wCPeu58gQ=;
 b=QQO75cNDTpDKr0tOdLOk5vG9ysCKgZa/phRsAdD89jlR+TT9Wjgl3mHuc1yXOnZu9L
 xsRhHTI9U8g5BYgBihgDXw6SikyKy9uI+vcBR/0GRLeuZPZPL/sZ+Q8NyhCrFi6h/8Rq
 ZEOkfNeRAWeAfwfI/4mLVNOdfpqIvjsk/+BgiSUjprCSv3xhbHyQZJvd23gxCfFk6QKD
 QOImaejnjZGYi3c+IWhtKD14pHWKC11iaZ1fLPcXIYgwoFVMWYOv7mN3EYxOAP7W4T9/
 yHHTxTAYdLhrWVepaPX/WcM0IxKK2z1R8oLv3rcFrSmis3GkxABc1obOY4Yh0u0nmFw4
 Ckkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SU3VNhIHP4qFfMS6BHdB+T/4wdfQUGXE54wCPeu58gQ=;
 b=lLXCuB+djC/lRxyr1ylcoW2FeCAoLbNFPW28QlS0Ueq2Q7fIFhXovaDUHwBu8NDK6i
 mCf5LqVHdY/TcVVxw5zONqFDfzNmdu0aHxxfxWB7+IG9WU0A9jC81ymvzia1JVk5pehH
 DTjnM7toDbhmImRegm4X29F+2FZStf6W/16qBDnQanWR1hDQHaixJcvyntt6Zxww0dvW
 QNAeOAh3AKfWpvgiaP2VD9qJeselx6EckhVhNZvTee3yBC47lvi+d7YTf5QM1JmyMi7G
 dUNDbFVYifmj6xRpF5VUq3aE8zMiFWI/4XNnH4BVto0jnPU6Xb67vVZPoQLAeg74fOk9
 ODQw==
X-Gm-Message-State: AOAM532739sYzXFBsS+Nj5ahW19xv3fuRpvjwdrY+/n3sLu2V1Z62j23
 FEEOrzHg4uZjsZ5e7WVMfXrjDcD2tz2NSwr9d04=
X-Google-Smtp-Source: ABdhPJz1oJcj/TIW7IPXKfUGMx+mKb7O5I8+KY9nNPCZgngt3Y0TTxSNjp3R9qmQkBVU/dtI0mfS9UGxQ14qdDZsEFg=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr19903224oiw.123.1622599066060; 
 Tue, 01 Jun 2021 18:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1622194158-70898-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <37a4f0bf-4acb-3961-699b-8335e194e315@amd.com>
In-Reply-To: <37a4f0bf-4acb-3961-699b-8335e194e315@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jun 2021 21:57:35 -0400
Message-ID: <CADnq5_NY_uWzB6QjsM0_+xcbQkMfy1wm2gQx3v7xW_eHQ804YA@mail.gmail.com>
Subject: Re: [PATCH v3] amdgpu: remove unreachable code
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, May 28, 2021 at 8:18 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 28.05.21 um 11:29 schrieb Jiapeng Chong:
> > In the function amdgpu_uvd_cs_msg(), every branch in the switch
> > statement will have a return, so the code below the switch statement
> > will not be executed.
> >
> > Eliminate the follow smatch warning:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> > ignoring unreachable code.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Changes in v2:
> >    -For the follow advice: https://lore.kernel.org/patchwork/patch/1435=
968/
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_uvd.c
> > index c6dbc08..35f6874 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > @@ -829,9 +829,8 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_c=
tx *ctx,
> >
> >       default:
> >               DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> > -             return -EINVAL;
> >       }
> > -     BUG();
> > +
> >       return -EINVAL;
> >   }
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
