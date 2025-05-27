Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FECAC5B42
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 22:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370A010E1B9;
	Tue, 27 May 2025 20:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="emjaZ2SZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66410E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:14:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RG1YMI029195
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vkccecuaRKgv8kkDZISo1PP6sVbQ0hZj5Is76ku+l08=; b=emjaZ2SZIK+iYEBP
 xT4FrqM3kEnGFUqa9w/+VYyqPvQIZpuor8iI8oLi7iQqLhfFReXC7wNOlNd+E/vf
 657JrvA/O5gwdfHGPTJB5LQtyKn4euO6e1zfD7EsZKWmrcYdvGbUqzI8X3ivitNw
 AEFxqKjFvs8vla36j46NE/P0CwfixZkrHNkvKvwTQ5sGGfZ7wB3tn4fVufw+9YqF
 PWQ8Cxa+l+dMaZ+ygTvTr08r/90yuJXWhxXkLD9fmy2rntTnddjQ7Nt/eDxm9VIE
 Khxgy1kuGU3Sup8hfK2zkE6Zj0gAnR62pomuQljNFo4HOeeGAe1K1D+kA/PTn0fd
 ozznFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992j5gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:14:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caee990715so1327603385a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748376855; x=1748981655;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkccecuaRKgv8kkDZISo1PP6sVbQ0hZj5Is76ku+l08=;
 b=Rcu3B8aW1rAAF9Jj2jF7m4JOziZlAds0p0UcaPFeMft+Q4vrCb6plnWrA6CGr87QUU
 NCYiDPxt7fVuur9vjPRylfO9zMVySMJomBdNOGXtK1z/MLJCd/Y/2uzukkHWzZgn15Cc
 c3V770KjkpnYJIS0qTchrSA5fKgnCv4WITP1DhHpqZo4TKDuOxGfphcQkZdxXxw2svm0
 uLsPkqTQDyGEPoK+NefUisyct3Y0zYbnuiXzy89e/GYqB+WGkgdE//Iv6VCPbxMrUtTE
 G3p8T3mNxKd3mrEkLpSfzFmq6x7jeK1gJrRZvw/b6FU3iIp7344Ttwuzijzp0ruA433s
 Kbiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhkFziol58dCc3WucjFsHRfAd7dS4Dd8AzaKdn/IHQ7q741yL/1MEM4V3M7cuRu+PK4qvfZ9b6wcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTO13e1lTzBipjkIkhQMvq/fsLrUTecJs+Mj7YPF1eR8f3ZNn+
 5JgrXSCaXf8rb57uWtS9uFgcGyfVwPz4CP1cTaGWDkCEhXHF/F2HsGQuDbUvP8xGFDbz8kWlyXm
 NjQZVRIp1TKg8KOwssE7QBv+PQXbf4XF0rXmh+7qj7yf49/BLre5xVCOHsEE3E0Wwv0h1Yz0=
X-Gm-Gg: ASbGncuvlJKHdQf6J1CnKMMOJPswmPd/hx/bxeD/H12DTaW3WW8Oz9yTTIxrcicJYYk
 r3669Nm7Qi7WlizzCaTyOT4A7UBGIH0mZ5gbVs/gA8ie0W+o7UcXt8IavUFvpbSS6V/sQOnUY23
 98BZBtsJXO4Wq+Q/h58jlyp7y+uye8to5nMrhECwmWHLdUOhaJJU8VFjTjtBdop6RgjXo0419JE
 nOK/PZmoAd/jIE+Bf5WbCSun0Bny9Hg4q9/+uHmgNSqsEMY1EHmQ0B8zN72wav+ajG6e1X91L1c
 2RGuhhoAM8QysiXzuTkoPrxC01REyenA0FcjOv2pMi9U7vKbJJYAbX3NGE0iC12au5n/I/SJoaQ
 =
X-Received: by 2002:a05:6214:194c:b0:6ed:12b0:f182 with SMTP id
 6a1803df08f44-6fa9d01b9f2mr205039366d6.11.1748376854750; 
 Tue, 27 May 2025 13:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3lomDjMQq5VV0rwLalx9S8jqjHkY+CtzDMclEG0zM/y1gsKelTqyg3WWsE9/Ce6+y2K5T6g==
X-Received: by 2002:a05:6214:194c:b0:6ed:12b0:f182 with SMTP id
 6a1803df08f44-6fa9d01b9f2mr205038886d6.11.1748376854201; 
 Tue, 27 May 2025 13:14:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532ee57483sm10349e87.113.2025.05.27.13.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 13:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250302083043.3197235-1-damon.ding@rock-chips.com>
References: <20250302083043.3197235-1-damon.ding@rock-chips.com>
Subject: Re: [PATCH v8] drm/bridge: analogix_dp: Remove the unnecessary
 calls to clk_disable_unprepare() during probing
Message-Id: <174837685066.608167.1736594704385365312.b4-ty@oss.qualcomm.com>
Date: Tue, 27 May 2025 23:14:10 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3MCBTYWx0ZWRfX4VdjeZ1lsc00
 KP+4MCLYxQLsf8ZXEN6WUDdssrgBNOdqMYtpgFXeUvkNO1hwLws0yZQJrQY4514B4jZQlY5kJnY
 dmROMWpLFryGcIUZp29aaPJtP6FmdcFUkE03uxTN7eKoPBDdLTxI5pobKie/RGHnVlRLc+6ktzQ
 likd6+zLB/kBH2Dbvu47IFCl+J789lZH5WGLcx1d++npVZa8DER+q5eOO9qvQ5xUQBmXPeVp9vY
 YKzBAld5s9+/NZGVlWmzDBQolhFXRYY8tI4K+XRhqBCSMVvVJzpYgzOMx8shJLQly8F83zGRmCg
 AHup4GLQNmxGLFqIggyQf8OIXRBjAhGmHjCEH/4gYUTrRYB5iIoWcuH38EhEZJRapvk+yQG4IJ+
 rNaDuyaTtuWHFgVwLvF7i5ShzS1A6hOp6KuszPzVh1bDgJI+prIjcHBSRp1AY5bMiwF5MRCd
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68361d18 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=gbcPiYo1f4mhb5Ahg4QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -1SNXQgO0HR3lcJaAANbrWB5jtL1mkxf
X-Proofpoint-ORIG-GUID: -1SNXQgO0HR3lcJaAANbrWB5jtL1mkxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270170
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

On Sun, 02 Mar 2025 16:30:43 +0800, Damon Ding wrote:
> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"), the PM operations can help enable/disable the clock. The
> err_disable_clk label and clk_disable_unprepare() operations are no
> longer necessary because the analogix_dp_resume() will not be called
> during probing.
> 
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing
      commit: 6579a03e68ffa5feb2d2823dea16ca7466f6de16

Best regards,
-- 
With best wishes
Dmitry


