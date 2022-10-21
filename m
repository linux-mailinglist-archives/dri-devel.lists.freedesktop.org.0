Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA538607105
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F374510E5F0;
	Fri, 21 Oct 2022 07:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA0810E5F0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:26:16 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id h13so1815142pfr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 00:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oho4T8KvJIjSpaugRF+B/Is+vVZKCFQfLfYhEKd4WZw=;
 b=ExwGbzgONFsvKAwtGpv2UAZxZwISwrhgG+tfP8eP60o8ZkAE++oPUARDKes3BnO54N
 YeGIs41P8Cjpt+mBkNVgosFW0cBz8vvE9dVLtKEHAWuvQ0YeG+SpZEzaNSvlc8bZGoXu
 x2A90LgMBBxd8XZSraPp38z5qUs1E7EG956Pz03vG223bLr4lNtOFUnOyCmm/8tufKl3
 kSfeor3l3LHCb/C8gcVKNg5YgXfYkQwUrPBbh8jE4q1UcMtnibxRyAPANm14PCgpQB7R
 O+kYCbWV/o/S+TbMO/nlCGyumwpqF0Z6w52ET0GhYI85JRiC12mZpU6FhWiWkTNm4bnq
 qVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oho4T8KvJIjSpaugRF+B/Is+vVZKCFQfLfYhEKd4WZw=;
 b=v1jWB1jYLPibDS4kG8JUfwHUWrrje65fyzXlDLuIlYR0Fh5KgSqxZ4aJ/YNji9rls5
 dAVpyBFzbetacAx/5R86NAufM6e+Z0uFCHGpN9t85GIu/Gqae9/iOdI670XbSl3ftBL5
 C3OQDvsumdLtMwBNRluAPJ1JUfGd8I086c9Y/NZW0gJ8c01EHkpsvFnRSBM+GPUBXU/i
 jxf/3N8jzrv4Y5nTKS3GfWpykpWMAc+p2NnOt1Ws/N1ILGUL1/BQHIHiaayr0ue5vb4H
 EJEQ4IGN/DSfK2Ej72TovBjIrj3ZGoXoGTjFhDWhbl8F0UitGyd/QWxORGFdhA9zDnSe
 KvIw==
X-Gm-Message-State: ACrzQf0h4hDaqLyoRVizrewDAlHdnkSUpV7QgMOk2MonfkjBCkrfOwz9
 PUoyc5KPEqFAlHHG2kFwI8pkfIGOxOam+DOee82BdrXATt0=
X-Google-Smtp-Source: AMsMyM4UlejbcImYTnVQGsy6uqAW50o5RYpgubK2sku7Q06ZknY6cxGWcfct5rJlTFnF4yFy9HNn/O1ThJIIulUJ564=
X-Received: by 2002:a17:903:40d1:b0:17f:4e94:b747 with SMTP id
 t17-20020a17090340d100b0017f4e94b747mr17329742pld.44.1666337165042; Fri, 21
 Oct 2022 00:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221018131754.351957-1-zack@kde.org>
 <27c535fe-6dfe-43a0-f915-324878798c36@suse.de>
 <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
 <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
 <Y0/at6dIEzMIhTsO@smile.fi.intel.com>
In-Reply-To: <Y0/at6dIEzMIhTsO@smile.fi.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 21 Oct 2022 09:25:53 +0200
Message-ID: <CAMeQTsam4Fg2CkTmDViJV-o53MEew=WdY74Mzwbh7GOBBSuv2g@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp" <etom@igel.co.jp>,
 "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run" <sean@poorly.run>,
 "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 1:11 PM andriy.shevchenko@linux.intel.com
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 19, 2022 at 09:32:26AM +0200, Thomas Zimmermann wrote:
> > Am 18.10.22 um 17:52 schrieb Zack Rusin:
>
> > IIRC PSB hardware is only available in 32-bit systems.
>
> Dunno about deep details, but IIUC the Intel Tangier and Intel Annioedale
> are 64-bit SoCs that have Imagination + Intel IPs, the latter from this
> GMA5xx/GMA6xx family.

I believe those are Merrifield and Moorefield. gma500 doesn't support
them. However 64-bit Cedarview is supported. The register PSB_BSM is
the base of stolen memory which is set by BIOS. IIRC the SGX only
supports 32-bit addresses so I would be surprised if PSB_BSM would
ever be longer than 32-bits.

-Patrik


>
> --
> With Best Regards,
> Andy Shevchenko
>
>
