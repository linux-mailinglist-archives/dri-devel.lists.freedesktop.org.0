Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC951D289DD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9D910E7C8;
	Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZflvEuH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAvyZ7PF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6310E7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYD642174490
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=; b=nZflvEuHnG3T/s8T
 25OY9rH7AXRGDVbq+yx3liJ/bat1DYItFGnvnUEEJ5mtA0EVo3ynsavQ3X/LNwuL
 UWV3kwuOyGfp2Y/57O9ZUlulPsmuvZ3BGDcbOX/5I2h9HUxeorUaYcfJgzUxktJI
 vUg0hhRt8LFTKbdePz2hrjtq5oeGTLuOVaSvMc95jot1PMMhM0UcMc91rTaeG6IT
 IVAaqLNiPLgsYOsDW65mz3vJq4XLt06u25AvPeL3VZyb9qy+TL27An2c8iEtsXms
 hcMc8e8b9ngsKLsgwxNTkMBr+YJW/4UMg+2hlVgHYq1ogD/xXMsjXSD0cJPOyQb0
 To8/ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97mm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6a4c50fe5so220355185a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511156; x=1769115956;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=;
 b=NAvyZ7PFzjgAbEbMQ6FJkTq6oFGFuClqWYEcHrPSIETEjFvsN2HM4f+MXg1JTSUsCH
 guu6jJHjHFMqRFKFfcemHRKTtDy+qtTnPdCjFmNxgC/Cd3u36/deLsAlI4m00umvqoeS
 gTps8lULrWoJNWKtlsgX8xUe6QxYccPdgdlu0jIb6mq6RtGTR1AvvAU5MmGdE8TR/KfJ
 8W0zQuWpWkBVOZmtHeCZpqct/irdeEzxSa3IBCuDc/iYPmXI0IQsCiNiRJStp+IUEPjf
 FvPACWyoJGLI+Hp2hyuL4EY97y+W8N4UH4O90LlVpdwYoy/nhqP96NdbrGztCMXzCqnW
 hJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511156; x=1769115956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=;
 b=MPN9LZE4RX7TNPDnr6JZT7qktPJVC+aqGyDzm1/N5V8tBo3JIQFK5lx7ytvaKA7xTs
 Rt7Iotn0D5lp/mc1QBW2x5aBrn3t1uwB3P83aaDdN1QrvBc+GVS8fnNcFbL0OpzpKVee
 4SePpeVF/6Tz7xyD48HX0MevMQpZEcIS6OVAKeOQTUz0enbJGoB0mRQ8BcmzCSZH7eJZ
 oDhKQ0hUD0m6DqSK18YFQERP17aHWo15DpYO0TceJao4yFrKMtJaYzfVavtq6ybLsv4H
 WSY9xeHDznjck5EvRtAkKMpsPnicj15VVpEqznn+6/j//bplMSwXJKP003zRtWgRX8fF
 b/BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXLvtQrf7l12R4K1BA/QWV+enl13oxHAg4qkp/PV0tcYyQhh4gpzdMNcSnSQRSc6tqAdCHhvbiscM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYwZQkVSpoHz9yDzJ/9Ug2MSdiTp8IWt6mM0hJITn6B6lm+9Ju
 OrTzoilJcHtc0dE3xTM76GkPd3UWhzot/rhXGsD0Hh37950iwGiGsXfgPdDhPJNWbMr6sRNbQDG
 2irrWqwKVW40l2EQm/7UQV9AYONugvDM6sYB68ROeYKNJb+tqUFxyatmuTDQk/81OXA6PYt8=
X-Gm-Gg: AY/fxX6WFQdBlePnH0ibmXJnrGVyqmLAoA6xJunJOn3yUxk6U+g5WGxhDYuRJtfu25G
 Dzb2R00t17T7rxEtEfZUk/YEYJuULQ8zc5ZdwT4X32mpRlh6T9pmER7BXXaVRIXtJVifk9TuCGA
 TXbKf+csu9VhZ8qdgsTvXEkrZgxgZCIoYj/2EVSkUsetRrPzM/pY0580eCne58BaX1knC7NxLjL
 G/p4hcROjh5MCORFmwRHEBoZdIkrvPr76gV7Y5JDE6e+1w8Apj6V98fmbiKKcq6zvcDQ+E4OPzA
 /pLus5QwnLDQ+wDRra6x0kvu5i1tpsdQXau1FLKQ/Jz1sLq1s68vebmxE/FNtrk+e4Wo1tX1BrP
 TSPakVZQuferrZnQIVvUNNG05WgTqkjPHUo/ztwXzoutBTiAPsAv2055njd5MJA9cf89ksSo07q
 mTBffmcOHwvDVbm7XtYjg+lpk=
X-Received: by 2002:a05:620a:414d:b0:8b2:efe7:d82b with SMTP id
 af79cd13be357-8c6a68ec7e1mr102704685a.30.1768511155845; 
 Thu, 15 Jan 2026 13:05:55 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8b2:efe7:d82b with SMTP id
 af79cd13be357-8c6a68ec7e1mr102699785a.30.1768511155382; 
 Thu, 15 Jan 2026 13:05:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Thu, 15 Jan 2026 23:05:52 +0200
Message-ID: <176851027322.3933285.5551205562887648299.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e10bjtC0iUxDqshiB0laAAo_u-9LqbTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX7gFp7OeJ1ry2
 oyLnjFuAdlvu6hqrz2UP7EU+oQoWZnq0GY+7YpRRyzKKIrtGvhk2h5BJR0wCgCYVo+ZwOY1EajK
 q0yETt1zOWsX3vDRj5S1HFcm4Edc88UYwgmhP7sK3aVrn9iX64T3l2i6ZvsQ0/UccNDqtW+rSJc
 a6lnKGOf2x7DiqQeLz/zfDIlqrKj6CwL5vhcjWHpGjkxpJuDdtDvRlmSMuhp5oFnNFoHOqYCh75
 scHSeNDDZMPGvA2pYqDrlqWkolBqavx98uadkOCwZ59BomgwyzS5mgnIsggFWnHYaoEnzffCbFn
 EBc7EwC4OJWGjaDkr2cGkGdG6jRH+E3uOf5bm/pHJrBGoLPVF1c8iVKK94Hkz5P8/FB9dcrXEki
 Gtl4laT81b1ejb/VBhzxJq4sKRYrlY+XQPpG8ZuZfJI63vx/74z3u8IJxJBi7yaatQmGYvJgBbb
 c2X/OK4qrbGJCnhfEgA==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=MOX2AFg_143LD5mekm8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: e10bjtC0iUxDqshiB0laAAo_u-9LqbTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Sun, 28 Dec 2025 06:02:26 +0200, Dmitry Baryshkov wrote:
> Fix commands pannels support on DPU 3.x platforms and drop support for
> those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> 
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4a8e3a34ea4
[2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59ca3d11f531
[3/3] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23c39217d933

Best regards,
-- 
With best wishes
Dmitry


