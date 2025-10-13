Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E51BD68B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 00:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7A610E4F8;
	Mon, 13 Oct 2025 22:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="chMFoqvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AB610E4F8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:06:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBVj031317
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KUtnEqm9W0AyDzcUPO+4X4YtSXgTOf5YN5ccynW0JeU=; b=chMFoqvHOSxAgFbh
 v09Isy3HxUYjlQO8BwP3VJHHYB83fhKWchBnkEVB0NUIPt79DHBbPIx/E4EUkBhH
 NZ9ZkUB2TydWwyfBew9EKO3n6wLo19tsvLS9cDHnq0dYlsa18i4maba2DjSgeZlM
 CADW1UQHRnT/AJ7FTN6F/3M+ez96ckkZCE0bdrKIMF3AR5AAwos3L1u6SMjbXr7h
 NQH5DPsqDAbBNsBgklTxN7z1xUuYcAn7oE7+qK6ksODNPXhfXSE8smwSY8qki/KL
 G7WFGzsT76OixeOmrUxalyMxB3tiykV4+LI3aH44psJYzURwMUOZ/VqQOeT+t/iT
 snxizQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfx6p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:06:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-28bd8b3fa67so76205315ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760393193; x=1760997993;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUtnEqm9W0AyDzcUPO+4X4YtSXgTOf5YN5ccynW0JeU=;
 b=hTlqCXPY5qB9nukgLck5NafERrmB3valQFeuiPzCDkoIuTeH684uS3P+2re0Mmk4nf
 qfjEksDYQdrvbDeWHY6QKALb7wMEsEEvykQsqhYhqWL3FU70HqDeqvBF33dsSnU+s2Ed
 05xDVLFQ75YUgHwOnA24cyqRq/lYRgXVJsnpbAA7VO0zBnZNYZqVe3nha7mLN3PFxucI
 eBK3KYhztOFqCn6NpZz2PqsutxOUQUustxmiazequUAnQY4xLwxWjcpDp8Hud1IMj2b/
 2y3+wpe53RL62oGSJAuUVDPSAwXK5QE9pT3gVqtDsigKubBBq641Ci9d5yJQbl957gFE
 fgyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGRne9bY62/Fsf8QDIfe5tbVxAObscUk/wQu/b5DDqfGrZUoSfHyn3+y42HT6g074gZzCJVo+9atk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3UxW4z8iCXSN3bmZ1R95mkeV0+5lhZaRetwTUZxHt5vfJdzVq
 dmrK3rSA4oSOmb8y0iE2+OLaPRcomHVM67xH8uI4KR6RYflgCWkIQBd93lnMey/UjEaqNXAieUy
 T1DLl1cycmMpP0UymD9TcPPu69/vnpWDxBg0q7hrkzukcb6cse8CzIymo1FrdVzdZuz+0Rt0=
X-Gm-Gg: ASbGncux+w0vlw+3sQPoCR1ZJhcTXaUu0AJzy7R2B2fYtgbsloVbRKJi2UCCMLVMwIG
 rBFFBZGuRKyf6VK+KCkRbcivOkO98XoHajRS72nn+SQ++Syl7UIucn7xy6KjbSKz5hwwYQ7Ht3D
 F8kOxEE07r6Tp0p3RsheyAI3YZnjAaUaWYLVdp6MaWeVmgeDG4hAXjwxQVJEuZod4IwhgnOY+O2
 GXJCav77laY7LumEpSc3G1l8rigIhfIu1LUHATuEa5l0ZSN9ranbPAyRd4l50cb2Ev+HNdBjbIX
 z0kLfy3DqLqQ+YzDlb+JE5hxPb3wCaIbII76YLrvgvbrghQ9atYelpSEF+y5YyzXyWrxn6yWTd0
 yXEemq8RZ8GfljmrsdaY67OmUoJs=
X-Received: by 2002:a17:902:f64f:b0:28e:a70f:e882 with SMTP id
 d9443c01a7336-29027215bc9mr286186795ad.11.1760393192978; 
 Mon, 13 Oct 2025 15:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSxHdfBPn27c2WBgKTgU3BvadNjo70hod4ZuZVnZ6a0D5VESPMyyEHsceDdwpDA0twPuzhFQ==
X-Received: by 2002:a17:902:f64f:b0:28e:a70f:e882 with SMTP id
 d9443c01a7336-29027215bc9mr286186475ad.11.1760393192538; 
 Mon, 13 Oct 2025 15:06:32 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f08ddasm142163185ad.65.2025.10.13.15.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 15:06:31 -0700 (PDT)
Message-ID: <62a54b46-aa4d-4e45-8be6-f2697bbc924c@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:06:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix bootlog initialization ordering
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX56mOcSVhc+xU
 0WZtS6gXJyOv6zMIQXod5J8S6hegJQHXlFr2mvpRylYL2KgElJ9p6n1d+Wzyo2MeO9TgiipU+vh
 /osznUgzTCaVRIJ2sCTnGdz8v5fEvNCtsoxQGU3h/qxK5p0YgBjH89LZops0DvErmxdgVYdvVkL
 q5yxTdOTV9XWfcBoCxICd+PJ12MnNH4NK9yuAN3ORhbonIMhnkzCUuJP5yS2MUB/LSXMbCr/Vl1
 3oHI6JsX20Y4JqfayEVKzskir4IDFyBMCHIj9yH0Ty7duwCkpF1K2noR6t0tQLuNqOOYk3KY9Y8
 yLM10LfynWPBYtZV5nM1TFj6TKYxgnD689kF6UU7vrjAOc05CVWSH6AnSa2ufu0hjm5XukPn0xk
 amNRqWC1zZ9lTrWEefvY0vWyhDhc7w==
X-Proofpoint-GUID: ft4JzJYsBrX90j1ckn6lh8mnuZrLuILp
X-Proofpoint-ORIG-GUID: ft4JzJYsBrX90j1ckn6lh8mnuZrLuILp
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ed77e9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=haWFd_X1g-iGgqmt7XIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On 10/7/2025 4:57 AM, Youssef Samir wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> As soon as we queue MHI buffers to receive the bootlog from the device,
> we could be receiving data. Therefore all the resources needed to
> process that data need to be setup prior to queuing the buffers.
> 
> We currently initialize some of the resources after queuing the buffers
> which creates a race between the probe() and any data that comes back
> from the device. If the uninitialized resources are accessed, we could
> see page faults.
> 
> Fix the init ordering to close the race.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
