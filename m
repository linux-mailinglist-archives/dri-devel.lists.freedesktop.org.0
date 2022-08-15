Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FA4593158
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926C1CB56C;
	Mon, 15 Aug 2022 15:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C254CB2FF;
 Mon, 15 Aug 2022 15:11:27 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so14767367pjo.0; 
 Mon, 15 Aug 2022 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc; bh=4pmq2cDtg0ydyuU0PpZLDkBCJ0OouWioIf1c6XMyXOk=;
 b=UZ9096jjWqCBf17hXnyVKDrCNj3DJVCItRZWHpeEILmz8aWMZ0dNOD5lz0V5HMWICJ
 51N0i+/iG09bmULlptqybK9Y8WQGz5LvrYsgCPDphgf2sFGpDQui0AonT3eqjI6ff1Mi
 eFa8s26yVIJhSbjAkVhy+wtasrXDwuhQ221yGjmLJPUJ/edPvy7WmC79UsZ+oZYnZNJr
 cMMumf6dA0h7OTPHoqd0mZphf1NX1LcFbNr2b5WvB7itW0anhNODt5wyI1AGfJNimNV7
 4ynQJ7dwM0P6RyIfGLFSpBPFuHy+m2SVp0FbWvLw51w/GhsvGER/dtgU2yekRKDOyoDV
 aq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4pmq2cDtg0ydyuU0PpZLDkBCJ0OouWioIf1c6XMyXOk=;
 b=fXQM53FrH6MueRROOjPCHvjhbEQWuMM5JUI7+GPxMK3pqcEMYdQBTR6RqmJ/rvD01r
 M5xVObVx4nAZQ+++bgCm2+o1Tj9NUg7Z11zmugMqxeNfwi1jpLG37rXR0H3uktdo1dcy
 OYmCXkWhyG19N1WdcJq5aR2A2aA/4NgkQdkT4TSgmV4sVEk6tPvAFZ6lWhQgDcfk3pfn
 smFkoWX4yi8QxwuL8cFDL7SmHtihEQmaOWyVnTBaj7Yl1l7xmZSDwHycndTHGf+ZvGyb
 JxHPh+Bv2as5eVy6M2qF45nyzaAz07M1I+GdxADU7njzFUKVTZOOsWn91Wa0N+Sm702C
 0kXA==
X-Gm-Message-State: ACgBeo1ON87frKeqPTJhD/6xSXeUMVaO3rihQbwL29Knfr8knM8D8AMP
 07fL3TRxHkI9myJvyscc+cs=
X-Google-Smtp-Source: AA6agR7zDZWmDimewQ5T+cgTmvM9ZGGWIVm6LAiRhL7a4FKt7o56LofqV71sHQV80sOx2nI/9Pswvw==
X-Received: by 2002:a17:902:c94c:b0:16e:ce7d:1fe with SMTP id
 i12-20020a170902c94c00b0016ece7d01femr17690162pla.168.1660576286635; 
 Mon, 15 Aug 2022 08:11:26 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.156])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902b94c00b0016ef87334aesm7096733pls.162.2022.08.15.08.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 08:11:26 -0700 (PDT)
Message-ID: <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
Date: Mon, 15 Aug 2022 21:11:18 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
To: "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
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

On 8/15/22 20:15, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
> 
> Sorry, which "r" value was overwritten?  I didn't see the point of making this change.
> 
> Thanks
> Ruijing
> 
> -----Original Message-----
> From: Khalid Masum <khalid.masum.92@gmail.com>
> Sent: Monday, August 15, 2022 3:01 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing <Ruijing.Dong@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>; Khalid Masum <khalid.masum.92@gmail.com>
> Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn_v4_0_stop
> 
> The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before it can be used. Remove this assignment.
> 
> Addresses-Coverity: 1504988 ("Unused value")
> Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index ca14c3ef742e..80b8a2c66b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
>                  fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
> 
>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
> -                       r = vcn_v4_0_stop_dpg_mode(adev, i);
> +                       vcn_v4_0_stop_dpg_mode(adev, i);
>                          continue;
>                  }
> 
> --
> 2.37.1
> 

After value is overwritten soon right after the diff.

See:
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

static int vcn_v4_0_stop(struct amdgpu_device *adev)
{
         volatile struct amdgpu_vcn4_fw_shared *fw_shared;
...

         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
                 fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
                 fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;

                 if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
                         r = vcn_v4_0_stop_dpg_mode(adev, i);
                         continue;
                 }

                 /* wait for vcn idle */
                 r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, 
UVD_STATUS__IDLE, 0x7);

Here, any value assigned to r is overwritten before it could
be used. So the assignment in the true branch of the if statement
here can be removed.

Thanks,
   -- Khalid Masum
