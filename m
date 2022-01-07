Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05582487E02
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 22:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8288310EEF7;
	Fri,  7 Jan 2022 21:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF6810EEEF;
 Fri,  7 Jan 2022 21:08:56 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v124so2693795oie.0;
 Fri, 07 Jan 2022 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O7pvSOfIkV4dqbPfuv/2HOh0xU+VB9JiCav0R4FD6b4=;
 b=pr418NVHAUExpVkYCuuatPAeH6dxKsAdEKvI0rruXEbnOAk1Lj5AVEaq989nHFeUP8
 xFXlhLn9+/zsAiLiBpNCuk/bu+LDmSXRqEUKrwmXopsHTlWrM/g8pmJFPlTb2UktTcWr
 JqGGSfdJ4qMpZSig3S1uwVD4RBOfLcbRmilmvSlg5EPM6SHY3VdPHEicCzSZm027pzuz
 XLfEmyV48472KMtvVCa6qRclsTAKT4HXpNFmqqkk0eMFXEoA3U3sWRMBSaPFCqAzlujY
 5uNx2OIq8a4bjewwDKJ2rZNWs0eRbtYpB98v/XGOckHWULrSUB+AhAgj0MmZbvmCXgG2
 YXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O7pvSOfIkV4dqbPfuv/2HOh0xU+VB9JiCav0R4FD6b4=;
 b=eHbb7TnpJ9rTcoKxLRP5RQvMnMkHyDMCECrTZ0YFXP9Vwhi6y+rvFCbqsvvdfi4LF+
 Baz5EkGW7r9Op5+FsT539kLbHT44vWJPRgaTJi0LqdNjmE42vFT7/HV2Sq9m5a1uHJTq
 IdNS6mUn1A3Q6acn94GoWHhTsYuK6Fr+SMpHt8t1MgRPEXx6IW4T+3F3jxrpX9nHwFRb
 odpCFbDUt8GvE1uRnJ6tB54IxiOp9Pw8lcGWDWtu7b0wpJP5HyaJKgmnHODXqmJZIZTR
 ISzvZ3r+KTntp1MMlarwoZyQbfcreAJ5nqHrmvQEJPjBdwO3OQ2eWtbsc3Vkei+PQzK4
 8O1Q==
X-Gm-Message-State: AOAM532S276BuM+GMJo92TpAFEMYMyX5QhXt82RVi+kpUzxxgnHDETRn
 gxGzCt6s7fUB3dCoA1Vmt0HqR2ypCGLiDn8q2lU=
X-Google-Smtp-Source: ABdhPJz/BW/3gQ7COMiFX5lVTDRtnXMjaMVu4RoviTgP8z3CUc0YhYzZKKZOXmlZyqFiTsL0pwvkpb21SPSJvzf4f90=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr10755798oig.5.1641589736048; 
 Fri, 07 Jan 2022 13:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20220106095610.3275631-1-gregkh@linuxfoundation.org>
In-Reply-To: <20220106095610.3275631-1-gregkh@linuxfoundation.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jan 2022 16:08:45 -0500
Message-ID: <CADnq5_Mwxto+cp3MLmkWchzos8yeXaLqtJPFkZkyvWHR4_e+ug@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use default_groups in kobj_type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 4:56 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the amdgpu sysfs code to use default_groups field which has
> been the preferred way since aa30f47cf666 ("kobject: Add support for
> default attribute groups to kobj_type") so that we can soon get rid of
> the obsolete default_attrs field.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: John Clements <john.clements@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Jonathan Kim <jonathan.kim@amd.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: shaoyunl <shaoyun.liu@amd.com>
> Cc: Tao Zhou <tao.zhou1@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_xgmi.c
> index 567df2db23ac..94dcb004988d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -208,6 +208,7 @@ static struct attribute *amdgpu_xgmi_hive_attrs[] =3D=
 {
>         &amdgpu_xgmi_hive_id,
>         NULL
>  };
> +ATTRIBUTE_GROUPS(amdgpu_xgmi_hive);
>
>  static ssize_t amdgpu_xgmi_show_attrs(struct kobject *kobj,
>         struct attribute *attr, char *buf)
> @@ -237,7 +238,7 @@ static const struct sysfs_ops amdgpu_xgmi_hive_ops =
=3D {
>  struct kobj_type amdgpu_xgmi_hive_type =3D {
>         .release =3D amdgpu_xgmi_hive_release,
>         .sysfs_ops =3D &amdgpu_xgmi_hive_ops,
> -       .default_attrs =3D amdgpu_xgmi_hive_attrs,
> +       .default_groups =3D amdgpu_xgmi_hive_groups,
>  };
>
>  static ssize_t amdgpu_xgmi_show_device_id(struct device *dev,
> --
> 2.34.1
>
