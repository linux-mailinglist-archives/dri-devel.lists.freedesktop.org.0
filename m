Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6CBC1E6C
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC7310E6DB;
	Tue,  7 Oct 2025 15:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPHUri4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12A10E6DB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:21:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETJGn016478
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0iWmS6lQW7nrNfAJ3oL/Wk5t1P1Ffsn1nlDPeOvhMDs=; b=oPHUri4kXtf7+GBY
 mXmBNWcOFME67KOtWsMTCxZnjQAO2qYBph8+cwyFMRhUwPVjN+kbClxXGM/cZqkf
 Z7xeIRmvF5kHxt2dePovX6Niv7T3gNIa6GXMKone81AdaNxzwo2Q11yqVy3Dafc8
 w5OECZhZhy/HsqdFfjcHxYcHENb8aQSug5Tu0EdxefN3egQAwxUEWNj+pUK9QSh+
 9SBjI4Gt/yfZnNolL/u0F8QuQGN2zpIRtyZjRbBhQg1cA5pxhZXD5MvQuNnHM1eu
 0ysFJOalm/lSEkDQlGKB85jbzCGbFXRjQ/5PoAJ7qqXAHrPUtjVx/5jUGDi6Hwha
 rO5eNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6abcnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:21:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-28bd8b3fa67so57268855ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759850459; x=1760455259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iWmS6lQW7nrNfAJ3oL/Wk5t1P1Ffsn1nlDPeOvhMDs=;
 b=k5Eh3YvuT6A6j1xGxdgL0J2YMOkLBe4QlO6Ews6RPLeUzKp6rQpwYH44x8yPpeqMp9
 tMGbHDpYU2u2yeNQe+psdWETI/IENlS+dZ0ighDk7S4okPB8Hy6JIWR73NrtWXZYjEkk
 ksOx2m229F3OU8gJBzRkapAWoNzjc4Xd3VwNCN5/vy3EAIu+Bnzg0lLJqhCqKJak6qlh
 l2FNKlGEs0klotsbeqrY/2dA6v9Cxz4b6IL2X5zDXMB7Kqq12HWlig+vA+rOB4u5L8mn
 QCbM6MPivVpDUPRBb3d6S2is2guXLrE+mYRIS+wMtDJzu9N+a5hRJXI7gDQEkmwJgexk
 gD5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbvDXa1fyWAL9ZPXy/ExgmU9fF1GVWkuuZS+UMWhZe5UDzo7Ul7CFOqSnZD+FsI+cHrJWIT3Wl8MA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx3DMdz76GrQZLfr/V1Cysses4dx4CkO/vUkOcIOk0xTdNKNow
 wI+rTDgLxsEpJ8m844eGgO8WO7UlSc7PZAyPphQQdn/AOzFUqg1SPfRAUBnvzKtKAtDLIU1iX6S
 XYlQHbkx3cZI5NNwdGI7pYyh9ESoP0Fje4hrZ4u7HnB8Pj//u3xQF4xNwIZ27odKjR6Qok4W939
 oANx0=
X-Gm-Gg: ASbGnct90dQLUeo+sr0h98RyMLFJ9hrm28OSRZoxjfzx1++AJwPZPGenCIMEeEYDpxA
 WvXkB4fR7fWAcJzj77wMF7cRMGvD6MTcqnFzqFTTPxr5Mmb3ZpXmZSdaF445Bfi+nLFmZ6kbnFe
 ZXoLHPd9/SWRY8n0dAYx0aRJn7Nh/+E/wITjhjzhga07N+GAUAgkjy1m+Wi3Pc0+Lvg7PsuJamE
 +/04p+ii6Yv4MZNHkMC8sWDT4E1VyRRUp0VSGvWAnm625dphbydqQgagJJvCuqFsb5UDI+DnzPr
 4/Evy3OJZTi7TSEh6tpjJS9pdPSFlZ2yJcCMsWaB21FUYdc2POP22pJI7MohdpNaDquz6xboLS8
 d933+zPrB3WZmfoX0fDY=
X-Received: by 2002:a17:903:388c:b0:269:a4ed:13c3 with SMTP id
 d9443c01a7336-290272161edmr2236925ad.5.1759850459407; 
 Tue, 07 Oct 2025 08:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvtqCZgIqPAZF1VGaqwpoCFs09dOwY6K4MD8ALYKP9O+yrxMmdbHcIeQr/kqofot5UmriisA==
X-Received: by 2002:a17:903:388c:b0:269:a4ed:13c3 with SMTP id
 d9443c01a7336-290272161edmr2236485ad.5.1759850458968; 
 Tue, 07 Oct 2025 08:20:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d112797sm167816485ad.22.2025.10.07.08.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:20:58 -0700 (PDT)
Message-ID: <28aafc68-4dcf-4a55-9762-c2c3e1ddfe98@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:20:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add support to export dmabuf fd
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e52fdc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qTQW5CXGkwUWSGTXi8sA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: u438o0V6bX4CdPB3slYEIWhttWpOWJPV
X-Proofpoint-GUID: u438o0V6bX4CdPB3slYEIWhttWpOWJPV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfXylTdpmzp9XAC
 shE9h835CZopdQzTBY+cBEqW0eGpA3OvlghxTGQC/Un+Rn69l9R3sFYt1StnGIXvX9sLzfZsTvQ
 0ahF5BQoMvCCpyYMxZFDVanhsecE+MdcALX9SGgsm9Q/el9EN5kFHTl2XZSdIeGko60c9RvyoEF
 m8quhbR4l7dz7tkajNzwSGa+fNDR8ZwshV6+6Bu8y86Ht+4c7i1hLFKAhIztxwCs+kFftOHWM/h
 MBMBvb24/beEonZYfqrdZKxn0qs8XI3AMBxvXEg9KjGVdU0d0gK9qSVaXBwFxRuEOOwRZXOaWIQ
 aAaEqY3Lnc4Us5tIW6tJB7naoCyHdx8u+OG3xn2qVGAQpSvnOPw/FerwNUdTTv1c1WPNXHqnHxt
 xtSPOYtcQ/GuWxbBqBTH2RDqaUDcpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121
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

On 10/6/2025 11:38 PM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Add support to export BO as DMABUF to enable userspace to reuse buffers
> and reduce number of copy.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
