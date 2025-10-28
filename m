Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A21C16AEE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ED610E653;
	Tue, 28 Oct 2025 19:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtrDBg+z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHrc+n4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E59510E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlesP2503485
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=; b=PtrDBg+z1RJoSGZw
 ngQn86Waw+T2U8zDWNrDutSLoe8j2rGOU4ErW+W7tYqptFgesimHadUVZrlht1ng
 CmUKNwb7ereJCI5Q4e/KyV2GRswAopZAku1w5o5l4np9fDq5tIY4CfPbmpZRWH63
 uA1o7cSLf7Fq7TbmIiSeq0pR7CGoHjqgD5H4SttoWiB5yd5o7x4ElY5GVsDiN8+T
 BOZtA5o+WBjmIKIvr1/jXlM5oAajD8efbYjRmeinshLqFUGNz2KNfzhu2IrHFyxI
 dvrhDN3guCj5uHHPZytfGhC2ApcnimbGGdEFEXC+2Haci447ir0uEEI7XhUhjehI
 M2Lj6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g0g0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e884663b25so165228201cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681272; x=1762286072;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
 b=YHrc+n4k2Zs2POjUDpEwGd1MbKTZBmKxl0LQ8XcnLr5evfFM3xhJIY9TZGpNzyCVCZ
 S7my0a2Qc8W8SEEIsJNmb/yu3UWnK8hNWRvDMFqIFKwULpQs9QhqUzTK6QpSC2VQ5o3l
 JSP6r2Jqj6W49yJQmiLW+aQ49PElMkkQhohU9Rt1gJ2AQmYz+ac+2UEhy3RFHUhy7Fhl
 kXNKva2zaHa/G9zs8I8CyLAYr+lbFeVxfYL2EWAsYPLyOFjnMtpXQXHmOxK/24IpD9DE
 O8TpsFo8JagyC8Fjul5EZLDdo96ZEPeGOU7M1fnzf8rpUclHP/VeVr7jeNX4O7WDotft
 cqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681272; x=1762286072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
 b=oQum4ziuqdf2c+wKxYKbqxMkiWhUryY9Lt5XTrRwostTKGYXvVzyoIjxHq1YJH1lbq
 KOCnUMC8GY2skEA7P8pkQrfLvVYqU07uAJH3BQ3pi/v+UCgtKbki5VZkwjp2CiWTE9ZF
 9oF2NKa+J5eihnoB0fXEWEM2g2hv6g4UnFA8Ft82EOA/wqes8PxNbhN3xdQHLW2c6r+s
 h7OZUXmgnqsh3W/RMKrDVW4G4YVaFK7oG8vTnBtELSc/Usnmcqw8+EVHMJ/D3M9SGqF5
 +Iik9xyOO4jVJGECwcedu39Ai4rg4O57l+7oGc9F/2PkBC8BVdG9xnVXSwftQLxxcaSS
 CbkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbVDLvNHR4IJKY6YdmZcgp5smdGu2gGZayQGWjo4f+yu30Q2FdBTh/gePKOEduk7ibAur7jBQvOnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWgC7H5ejJuJ/+XBmsUACWSVjcvCL+OWXnMeNn9xkve3g8kVRj
 z6xgtINhf1ANDIkLDdAhA58yzO+yCxiSZfuE997SwJlLuGmfHHpCL5e1uEXFHfl9It1LyL1+I7O
 buEh3Z/Pi4LD9EFladw6ElT4mQyoDQrhrW9DhF0I0dUoAzshKMC0y+BCvYZWlpsfs+wGKt2w=
X-Gm-Gg: ASbGnctaUL18cVPEdhW8WIcs4qD9thN68EBG7zx4dk1/0FTqjmvcp0fiKDcj54tlugg
 A9MPcZPbfV7Jue3VfWkF3f/nI09s8S1fFpxskJEOtst3PsbzmWF4OkPVje58KMPRrvE9dS+HLrX
 tIH1h6sqv/lgA1OIQSpy1GgzgKneUicEit/61gDHO08PXrDBSWukGhO9N7Ag+zWt9JNhXOecCAz
 rw6WFImkA2Bnxb3WIQX+P0q2kvZD45Ktz/AKH3uGPiw09oUtuO0T/j2Nfrb905N2eziXxHFgu/3
 28+DuGCCglWjD5HQZ/7LZIaAQ7q37RCqzX+i57TleaiiOBjx8sdJuEBc3Saw5s/2lcVG0cL2KpL
 JfZQOWF7kpQi2Wp6DI1uOEP0183a/ieQMW7C8Gso7G31iia3hwPKQaXLhNHlcLTlRw+aMjSV1wX
 hwJDHeOOYgyV2H
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id
 d75a77b69052e-4ed15bb30c4mr5992951cf.17.1761681271922; 
 Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp30l/mxiO0/x28DsAYuBVAOl6GnYN2VrIZ7Onq+dUKIoHEjlqng8hPS5TJz3djMSRii/+MQ==
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id
 d75a77b69052e-4ed15bb30c4mr5992331cf.17.1761681271214; 
 Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f87f14sm3312685e87.112.2025.10.28.12.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:54:30 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:54:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
 alexander.deucher@amd.com, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <dlvkkogiueskk4emkwdkpst4pvqk54ordyuqobh3hzqckuzz3f@gguhnqagpvwj>
References: <20251027081245.80262-1-tzimmermann@suse.de>
 <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=69011f78 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=G-TusFqAXxKo-7y7638A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: G0y32RoIzLztol4Lu0yMDV31506Pld85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX9g5eaUUPuo/0
 zzUnGAku08X2N2JDZDdKcqGJniQ+YbiE1A64ryTb+BAPcWxpQ0OLibpvoyQDwtjvus92c9XYURi
 7xBGo2lnDQmOaw/he5CV3OHXAjW1CdvYzjZbdoOAjx4q4ci5FBpVWQvzn9HV4cQKrxk4IFfGLC9
 Mc/cS40N9RsfLgWq6+SvqMUi33+dvj1e53i2K8sM9xdiaaHVZBGAm47gercItx+BSACm31dhz49
 bxjA//G7JXdu7P9GmRhLP4LAmuyu9ccdYiUpE58j6U6WnJxxpXkZz2c2rnznOIIHWsZyJpxLpmw
 1o2ONuTO2LCzltFWzoPBqvGIoLfX9h1Z09bzquYymzms+IgU0U89ziSjNToM6xPONeXE/TTTFK2
 cz6eQZdiRC8bGs0nei6veVeRzViGaQ==
X-Proofpoint-GUID: G0y32RoIzLztol4Lu0yMDV31506Pld85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167
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

On Tue, Oct 28, 2025 at 08:58:10AM +0100, Christian König wrote:
> On 10/27/25 09:12, Thomas Zimmermann wrote:
> > Move the calls to drm_fb_helper_alloc_info() from drivers into a
> > single place in fbdev helpers. Allocates struct fb_info for a new
> > framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> > create an fbdev screen buffer. Also release the instance on errors
> > by calling drm_fb_helper_release_info().
> > 
> > Simplifies the code and fixes the error cleanup for some of the
> > drivers.
> > 
> > Regular release of the struct fb_info instance still happens in
> > drm_fb_helper_fini() as before.
> > 
> > v2:
> > - remove error rollback in driver implementations (kernel test robot)
> > - initialize info in TTM implementation (kernel test robot)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Acked-by: Christian König <christian.koenig@amd.com> for the radeon changes.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry
