Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2759328C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E837CD137;
	Mon, 15 Aug 2022 15:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48644C9148;
 Mon, 15 Aug 2022 15:54:06 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id y1so6695689plb.2;
 Mon, 15 Aug 2022 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=rsucpEsc5D3CWajO1pTl308RBgWxNbG9t1oS7UmiC60=;
 b=c9IES/GUi/YRTnq8ntFq9iy84T/2qbs+aIfYv0AyQOVaTtypUcAHdLJICt2zAB4X/B
 4dYwLy7OnU1nSzGDcBqno4X26p9T2Rg3umFQoxDVNUxYdxj86i442PX0qvGtXBZBJT5O
 3sQ5JTHhnGZBS32J/RkD8vUQ6rKmI+qWTjOgzPlT90vKfz4HJTgGYUiLH6LhUxHnPRWg
 M503lWMUUWF75jkVCwy+h4wAHiI/g8EqkepRunM5afsGvgMLb76BvDnja1k0sJtz48N1
 KfPpIcLxyCXHahCV+A1E+VmS4mGWbTJ5B6r4dj8WQC7yHITiP6iEfPkTD4I+ua+M2mn4
 ob2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rsucpEsc5D3CWajO1pTl308RBgWxNbG9t1oS7UmiC60=;
 b=U4o860sd0UWzeLbI/ajrSdSxE14zfgaDAbWhtuKktVqABhPcHYwAashrFYshsNkQAF
 QP5A7+3DKNgB/sWclLgtbntQJPqzFNQDYJ5cFlXnsa1kFqiAUFWD5Hcc+5UekYQZqE9d
 gOjIDA5gZMl37HhZb1iv5F3BFQ2xOkETwbF558LacKBSlKIzRJZBryuzZQTRR/EaHnuV
 YTcq3uwxVPdi5ickJgSbg2Ki5gb10oMlAyLQ5r4YQ1NTVoHo6wApNb/AMOf29/Ks9Ny+
 BycSx0+5ofq+nFDOzt44Jfqp/vOiivBXV/b08i5rLRPcFnN2f9YQYVtBS6gKwdxINfnc
 j1dQ==
X-Gm-Message-State: ACgBeo3qOQjzxWLpGiaR0ar0d8FGaDVZL12yAH09W3HsqZ2coOQGbSaE
 DO9t6QzF5cBKxDZCFGDlQBg=
X-Google-Smtp-Source: AA6agR7rXwMmQoFFhV9guzX50xC2Hx5lxc/ntTUb9/whlW1Pw7vwVN3TsUywF9bJ3hq6crg1K1/dIA==
X-Received: by 2002:a17:90a:c38f:b0:1f3:2f26:e7c4 with SMTP id
 h15-20020a17090ac38f00b001f32f26e7c4mr28048030pjt.124.1660578845751; 
 Mon, 15 Aug 2022 08:54:05 -0700 (PDT)
Received: from [192.168.141.45] ([103.230.106.6])
 by smtp.gmail.com with ESMTPSA id
 p67-20020a62d046000000b0052ddaffbcc1sm6719244pfg.30.2022.08.15.08.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 08:54:05 -0700 (PDT)
Message-ID: <f8734af1-6e31-75c9-9556-9519709284f1@gmail.com>
Date: Mon, 15 Aug 2022 21:53:54 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Content-Language: en-US
To: "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
 <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 21:17, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
> 
> If the condition was met and it came to execute vcn_4_0_stop_dpg_mode, then it would never have a chance to go for /*wait for vcn idle*/, isn't it?

Hypothetically, some other thread might set adev->pg_flags NULL and in 
that case it will get the chance to go for /* wait for vcn idle */.


> I still didn't see obvious purpose of this change.
> 
>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>       ==>              r = vcn_v4_0_stop_dpg_mode(adev, i);

Regardless of that, this assignment to r is unnecessary. Because this 
value of r is never used. This patch simply removes this unnecessary
assignment.

>                           continue;
>                   }
> 
>                   /* wait for vcn idle */
>                   r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
> 
> Thanks
> Ruijing
> 

Thanks,
   -- Khalid Masum
