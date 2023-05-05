Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C46F890B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECD410E65B;
	Fri,  5 May 2023 18:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C4110E65B;
 Fri,  5 May 2023 18:52:31 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1929818d7faso19366758fac.0; 
 Fri, 05 May 2023 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683312751; x=1685904751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQlh7hwy8Rr71ndzr8IXQ2O4Z+8GiQ3wjDKifhmGZKk=;
 b=E8J9EkJmCdiaIbLv9WeS4FyBHdjAGW1ivVH922O6IG/KHQ+GWABODvcLsbrsOjlX+8
 jmz8FucV+1MjreVT7ePMPY4TPRmFVSUMdil40ELN5pFNuKGcOPMGfmylPneeSXFMgGlJ
 Sc0MqwKXM6O2gt7cuKfeCzJF8rgxG/o5MHjaWql39tLUC76hdIl3ixhJJcegbXJsMBPr
 MqhTHdbTiFZ/bDFYcI5avxssz1+OREpwhkUzsw3YXZo83yCikWNWKoyGQ2NCOENdvxNk
 wHOuj2/TLQOu1ujieikwh2oMlaCisM5kXuce7/4NcgaucFclyfLV49abP5f5fg5sK1e2
 wBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683312751; x=1685904751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQlh7hwy8Rr71ndzr8IXQ2O4Z+8GiQ3wjDKifhmGZKk=;
 b=Ky+mY1Htq2mMpB52CM/ZCY69zak06In1BunTBmdu22j99Ia8RKtKCgMjLzZ70Nhy7L
 7I+ybBHnmT+imS15fLYC4Oh4As9PU3a3uG8os8qH0UrZirQJKbpkZbEHbgnviI/Ofgcz
 r/JM5aabKRAo0E3+3p8vFLgZsmJLFd2rVbQRIcNBKb562GDDNBhnIqCYGDgdvpiioJWv
 JX2H+omK2bI4w0bBcz/+BZAPTfUiK7FBn4P4NE+HoqONmV2gg6pvFayuBsktFrmTLNtj
 xE6egQMIcjgFGaEjOMVQtgOkx6Ioo7IuGw8rgCq/VIBzsGVv4gyrQNhhq7wlLnZtHGAX
 1mAQ==
X-Gm-Message-State: AC+VfDyacv3Zrbq74jtGQyFFcdCwFyC60rU0eyTS+GivswekVLsBhkJT
 uc+my7F84LfPyhPGfgp6faa6iG7GrNvOQAqvY5au4N42
X-Google-Smtp-Source: ACHHUZ4KSAMKrpB7g3tdha8+8kCikJkc+x2QDoGbrD2V+fMbOCekB2puciNwrRCx5znIv93cIN0qfUOUl0POUWAqZmE=
X-Received: by 2002:a05:6871:809:b0:192:6deb:f704 with SMTP id
 q9-20020a056871080900b001926debf704mr3329406oap.18.1683312730700; Fri, 05 May
 2023 11:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230505073731.5348-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230505073731.5348-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 May 2023 14:51:59 -0400
Message-ID: <CADnq5_OoAwf1-+2BaTPt8y_RJLbzTTZ+D7=tpeQx-Mf9XGgvAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, May 5, 2023 at 3:43=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> ./drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c:146:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4871
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c b/drivers/gpu/drm/amd=
/amdgpu/nbio_v7_9.c
> index 24d12075ca3a..a331a59c49e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> @@ -143,7 +143,7 @@ static void nbio_v7_9_sdma_doorbell_range(struct amdg=
pu_device *adev, int instan
>                 break;
>         default:
>                 break;
> -       };
> +       }
>
>         return;
>  }
> --
> 2.20.1.7.g153144c
>
