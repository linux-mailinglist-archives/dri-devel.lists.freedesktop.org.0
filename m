Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DF94A5FC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F1910E497;
	Wed,  7 Aug 2024 10:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L8TI01zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973D10E49A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 10:44:18 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-1fc56fd4de1so5646455ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723027457; x=1723632257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F3o02Xw7ezzA14Pd+Lgc2BLB9SvalP82R9YVWF/sDxk=;
 b=L8TI01zdxwBumFpGOfeQ5NGXNPy0tQ5K0W/y3a4p2RI9b/veA4hYi5yLkaWORFue/V
 H7jFIeM4+z5sXIDvGOhiHqw2z2MVR1jUzHMLCeZhcQppu/ovNxU/LuDYOX/Lw0zak1VP
 HYhJzYKfKCg+8Hs6f41ZB4Vy/tpZHXKNxvfhtxTiXFOdtWPTyOX5xeooy80vUTlQ/0YT
 rFNygO9ZL8GVzaRk2IK70g1hGRJQ+HPD03P93UGW8ctroziHdubc5er+08oKACFvmd+Q
 yBpTz5XRCXTCXiLb4PreG76D1B9fxePGBtouacyrAMg7U2uuHBZtimG6OnsRNECQwvwR
 iFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723027457; x=1723632257;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F3o02Xw7ezzA14Pd+Lgc2BLB9SvalP82R9YVWF/sDxk=;
 b=MY7FRkmv/7mjuM4P4RYLwy0QXL9KkFVv4YxMPwmer1Zloh3ESgBUGfOIreXeSHa1Jr
 OgYlR4pgCgJj4rzPhPYGr0WDrhKeP+72MHV7NufVvqjKJYPkMfrlz0FihP0Y4mcwGEGw
 Y/+H1pzGfe533jVH341PHzFGYGpV76vz+M9E7As4CGShvGp4fnEL1a0RyVR/LAqOicPN
 WuAuet8HXCeSG/67yMsKXTYrX/zoFk5H5ThV4oy5qnOnjSQxu9Nkd3bkMuZD2+QDGUQn
 pJgoa8SVJIdceZPIAMRT2vpCVxPKItcykGe2jpK6s4FiW8FqhaWXcYEBuQH86LUkfjvP
 YlyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/fjnK5yX4v4xMyagz8fr9PFiBP++ni8HHT+f/Usyd3A5SyKNTVo4JlKtc0uVfWOFK0WMAA9TqbMlMywxQlfnduBvXFIR1arDyVCOFmD1e
X-Gm-Message-State: AOJu0YxA96Wyx6GNU29hR5kywZDAtHoTOqjNu3XOTsvVk2BkOCdRbrfG
 FM/ifKOgua20AEM2K4cefQ2ZQGmwn6DAdd9ERGuvzQCrCyRhN+fnHqsSYrXTjX0=
X-Google-Smtp-Source: AGHT+IFoNLrt1GaF+yeaFvmCHadWYdmm/RDr/6D/Md5qSi81mcUQk94i8uHGUfoK6lIe9cztu7TiAg==
X-Received: by 2002:a17:903:a88:b0:1f9:ad91:f8d0 with SMTP id
 d9443c01a7336-200853de85cmr23075065ad.8.1723027457532; 
 Wed, 07 Aug 2024 03:44:17 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.168.81]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff5905e58fsm103268695ad.177.2024.08.07.03.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 03:44:17 -0700 (PDT)
Date: Wed, 07 Aug 2024 17:44:12 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Leonard Lausen <leonard@lausen.nl>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_drm/msm/dpu1=3A_don=27t_c?=
 =?US-ASCII?Q?hoke_on_disabling_the_writeback_connector?=
User-Agent: K-9 Mail for Android
In-Reply-To: <57cdac1a-1c4d-4299-8fde-92ae054fc6c0@lausen.nl>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <57cdac1a-1c4d-4299-8fde-92ae054fc6c0@lausen.nl>
Message-ID: <61D52432-DD30-4C43-BD5E-1CC9F84DF5B9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On August 5, 2024 9:27:39 AM GMT+07:00, Leonard Lausen <leonard@lausen=2Enl=
> wrote:
>Dear Dmitry,
>
>Thank you for the patch=2E Unfortunately, the patch triggers a regression=
 with
>respect to DRM CRTC state handling=2E With the patch applied, suspending =
and
>resuming a lazor sc7180 with external display connected, looses CRTC stat=
e on
>resume and prevents applying a new CRTC state=2E Without the patch, CRTC =
state is
>preserved across suspend and resume and it remains possible to change CRT=
C
>settings after resume=2E This means the patch regresses the user experien=
ce,
>preventing "Night Light" mode to work as expected=2E I've validated this =
on
>v6=2E10=2E2 vs=2E v6=2E10=2E2 with this patch applied=2E
>

Could you please clarify, I was under the impression that currently whole =
suspend/resume is broken, so it's more than a dmesg message=2E

>While the cause for the bug uncovered by this change is likely separate, =
given
>it's impact, would it be prudent to delay the application of this patch u=
ntil
>the related bug is identified and fixed? Otherwise we would be fixing a d=
mesg
>error message "[dpu error]connector not connected 3" that appears to do n=
o harm
>but thereby break more critical user visible behavior=2E
>
>Best regards
>Leonard
>
>On 8/2/24 15:47, Dmitry Baryshkov wrote:
>> During suspend/resume process all connectors are explicitly disabled an=
d
>> then reenabled=2E However resume fails because of the connector_status =
check:
>>=20
>> [ 1185=2E831970] [dpu error]connector not connected 3
>>=20
>> It doesn't make sense to check for the Writeback connected status (and
>> other drivers don't perform such check), so drop the check=2E
>>=20
>> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu=
_writeback=2Ec")
>> Cc: stable@vger=2Ekernel=2Eorg
>> Reported-by: Leonard Lausen <leonard@lausen=2Enl>
>> Closes: https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/issues/57
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec | 3 ---
>>  1 file changed, 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> index 16f144cbc0c9=2E=2E8ff496082902 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connec=
tor *connector,
>>  	if (!conn_state || !conn_state->connector) {
>>  		DPU_ERROR("invalid connector state\n");
>>  		return -EINVAL;
>> -	} else if (conn_state->connector->status !=3D connector_status_connec=
ted) {
>> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->sta=
tus);
>> -		return -EINVAL;
>>  	}
>> =20
>>  	crtc =3D conn_state->crtc;
>>=20
>


--=20
With best wishes
Dmitry
