Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB5CDBCA2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F7010E9A3;
	Wed, 24 Dec 2025 09:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ok9KKlV4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eit4/Nwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBA110E9A3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO6iGSk678327
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=; b=ok9KKlV4XJpKq17N
 JYsY1Fr9t9IJ04vSV89xh91SV6+VicJiRj7PpygLUVl8nro9knv+3sJFCt2QKIyG
 Zr+QLv7q/1+IHQJAWxz8w6KLvO8stQ6y7XJWei4sjGbSR3/AM9kAkwuJ+8BMFU/E
 L6XI+7VmjhDPd2HRl53Q2SoyLpfn4dD6kcOA+jkfR+1+GXQC0Y2SQgi/WUnEtgl+
 iaCpArVRavfKJqPh15sOTsYi5BPddmKJY2a8B713qOjONSI5TjuKcynp3G/PYGac
 EKmJ2vyhJ8J0xZBUltsXXfLw6vUxatmxOHdphtHGvMfCqdPQpPok0TnTENS4bzLR
 bgpv4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq26d4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed7591799eso139202571cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568471; x=1767173271;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=;
 b=eit4/NwxRXSmVztFfiTYo8Coxuva7VH7WKNpMcivIvZdbQSMKPBa3ShMBM6UQSKAig
 UQk+PpmdDwLu9BymDK9RL2VKLGElt5M8iIBpbiJdKOrYNI8a58/u5Iw+nGHMzvKwUOai
 Gk8isBzgVO2nrJp0b6n/UtkO0r80vRuNUd92uYoP2I1H2752nUKMSWEt55NjA8+hl+/l
 r2PIgvSNhoxfqy5Bgv3eaP5h0pZBSyMYBGvc6Yw9mKEuA4vNowzVjIIT6BQOKcCORWXg
 puYCM5DNg1yCkBFBawkC2RgB2Gz0Hi5XsclCAOk3NLB4AP+bcJQQt//fxVprKjD9Robt
 tdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568471; x=1767173271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=;
 b=kyhUALg6V3yr/xFu/clf44CWK0gphMZzV/GxjFDNH+i0wYi2fbXCF+q8Rehp81D3OO
 lf4GAPvB1+pHaMtiiFaX7F7gwoG8OELabEO0YBtT83BhxB97wQ41J4/O9luucGNWKAiF
 8MhQxlHZEhT/8TKzU/z9gD7KvBJlUCq4K57SMG9wTvpHRo9tD3MnVRNnvqrG9YMHCCJX
 HCv+42DhxAHX78GFPsWVMA+ys2Lxs6jutxcsZMiH1Vrw2+QY8I4QyU5TytEREKu9u5k8
 aq0TFTPpY5BwDlSBzj/FwoC4lopQVIIZN3fdBPizdKcXIVItQRmOL79MAmdzSfMpDEVK
 W1OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYlWBp5ciy/MFj2MuxTW2/oMKtlXTxpGa1B7iRPJ+SIKUBijoi2/u259K3VC4mjdm8sp1ZdoqoJDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5HWKxmMvzdzaj0k16L4EyQtLk65uHRbckIjqhQJ7kwJ177oxW
 i07LcRasBLJgN7yKHDJCLnDWH6NmfcHnFXlcIKQIIeKhnVVbDOs5+S63yN2rsuZ/7PWs07tar6R
 YvSZxFOXQI9z55LGq2X7JyduDRVkEqynX4TeI6lhhcyRDe7yK4g31ibbkJ18xbYpLe63qH4M=
X-Gm-Gg: AY/fxX5n4Q7y/mH+nidWq3YLlUe95O4O1Lm5pI0OPm73HpfJqqCBrZtMiQOc7oSU+zk
 wqjSWwZNtkHUfDe/IjwKAtpjwHbXmex27p1s7uaVSffZC/qVTWL2oAqebmqiPgpjdBkag1pmOk/
 cm+XHevQivUoQRv0Sb3uzfAhhrwDE1I7k5BecpLokjcrVFU99hc/ALNhpVDEIvermlSAMX4wYte
 szM6ePrgM6ZRKkaTO+yt7mImzKX/9zXmqH3YoiKhsOiGsCWQp8ibYyuEB+L8Hjg3/1d1+GxpQtV
 bbPK9NcAFp1hhjBDnk/KNu2pyNrH7l4inHYYFTRZ1RkaDagCfanlUkHYTHiqI/o8Kr3UPfPSlzg
 Kpd2YzBgL7Dd1I4NbbTPmlEjd8bkCW1W4KqGDCWwKwXhK6u0FjoR+HpzDxOlrrdvCZxkLXtXCpn
 p8c1szT2s1JXoBPDBStTTRW/s=
X-Received: by 2002:a05:622a:8e10:b0:4f4:c0ac:6666 with SMTP id
 d75a77b69052e-4f4c0ac7d89mr120700901cf.77.1766568471097; 
 Wed, 24 Dec 2025 01:27:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnEB1jS6cRWODDStA4PaW92yVJbmN21zNKm1NrRAJ2+26mthUzC2q0CzqbuPSiUBH5J4EUXQ==
X-Received: by 2002:a05:622a:8e10:b0:4f4:c0ac:6666 with SMTP id
 d75a77b69052e-4f4c0ac7d89mr120700791cf.77.1766568470698; 
 Wed, 24 Dec 2025 01:27:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Nikolay Kuratov <kniv@yandex-team.ru>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Date: Wed, 24 Dec 2025 11:27:44 +0200
Message-ID: <176656845705.3796981.3831136316758674761.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3AVpKgP66PPApg3JCGGsx9dB0YSmXk2m
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bb218 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 3AVpKgP66PPApg3JCGGsx9dB0YSmXk2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX9j+Or+sKfltE
 keFDxcEkVmn5Cr5ILBqUNbmTGtcj8JrboDN1icBiGI+QLzDonTMicU2Anx4aM9LaIYmrQXCu5NB
 VUO2vMtSV2S8CsrNUAP1bfI/l0wcq5LUq+hTprh69cMgkamWzbygMSNvTyK1nL/0gAnyVy8yTTy
 V6QWpT/bMhQ5i6+sDH+fdyI7MaGyfaUl9yVQUUafd5FDO37V5cXkXlVkwatqnAbTcyZ4+3CaM0H
 VwAKFNgiOygby7l6Eu2Lo042oKDL/BraLTKQqbTEf4/wu1XKMlKf9cf0LjZkn2QfCISrnhA35WM
 FNzovh4qUHe299EsIgvPLggwu9N0BY0kvvd/Ji6wrTpr032zBqZMUc5NBpniz/fAswfvIzcY+rG
 7WsFyFYgCt/c0NYqNSAbUwVjlje+9BobZflte1SEE02UECjdf4PYg+52pC5XcDxftaOkNkM+GA7
 n0IByf9sRTvGeof248A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240080
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

On Thu, 11 Dec 2025 12:36:30 +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Add missing NULL pointer check for pingpong interface
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88733a0b6487

Best regards,
-- 
With best wishes
Dmitry


