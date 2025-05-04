Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CFAA87C5
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FC210E2DA;
	Sun,  4 May 2025 16:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6XVvHgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D82110E2E1
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5448P1kI010647
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=N6XVvHgGqVq3Z7nF
 Dp/qgyhEEixJjIPcyfF/FVcF3tF8iAb0lPBL4wN7eUcHf/9BPKZmPls3EXW7Ow8+
 DmXSjGiJXrvY8HkXyCLb4uXat8Jqaf88jwMilaK7aKcT/qH583+aO4h5U9h/R2Ra
 Drb0QYDMSb4YjcrUn93uJLVkpE8RoiEc3ow7FMXxFPkPeBckF2VmDi+V85hvuyiO
 fhqs4fRsyrVjmnCPB2GlLA8HnKzqAhFN3ZjfnhDeeI0G2Gl/WrgJ+EbgJ9uxoJh1
 r5Ys0wic3+ERFACI7yTsdSPwaUfOztpsF9r8KQRf7iehupnxHC5CaFLSp9o59ELu
 zARDPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg26st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47689968650so40537431cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375234; x=1746980034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
 b=SYxygdEnDyPJSNMNuAlvozPea2FUukuacmR89+glUf8iJcTm8nCZytbNVubog5bZwr
 7QhlZuwEYRStR31knZ7ed7awBS7lfDaERnrZps/smNMO0ekznqzLGDatnQoef6PI6QhG
 AP9aUGyuHHbV0VSvW8W9NHu1Jgyfn3iV/S2w/CRgtwgriLv0lG/SYSF2B/z56Vq162mt
 ZceLmAyrb+mMzQ86V9L3SYfY2SrcwLGvhBl0a74B3s6yEAJhMBi/Ezt/Q+3LOSllKYp3
 w76UFoqYvuekTYnwFowAQD6xvIDvyqDASpzyVXMxeb1YpB6FwGDQEQ7jH9rOlrGScExh
 MwBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaOdJABiSfx6UdSTxSyB2vA815R+t9yW0mS4P5bKg5hDV2VqU2Gl7zlcmozD8qDdK3Hd2boKpdGC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSFclQ9Aqtw4rVqih3f+jkfDldB86/Mw+f8tBuRSpYT9+gigQU
 DczCU98bz1bE77EmMahVm9zUy+7VcjKIDhJYuXvKhf/qLoUCtHdI44nz/Wlt2RJbAxbxOua4NWK
 OmmnRsftWoviSj2pN5mgo7NDCVuA6NaMMsVRwrUzzpmz5E7+kUPXK58P8OAcPVd9JB1E=
X-Gm-Gg: ASbGncvnuwQwgMZnsgug3p6TWSmRoKunuIBi429+ImqNMXhmKxWB7utVQpoOsIBgB2h
 hdiftqIjpYzdT+jngAR/ZDbM5+2LRPis/qI58K9XKNeFw9gmmC62LWrzMydWpMICsV14vtWLH7A
 1gKdYIk6Ai6SQuykBLAlNwLlXQJ6HCCdLfdEYDSZ2TyFTnPraXkrc9DgG/lb6rByK/2EmgyM/vL
 OC5yTSRtSXWxJ3ozMLVWrBCgO1JDO+AuR0zFo9gf+LobrhBQnwPe8q3PoD4IXPei9sH0BLjcvOn
 Bb3HPmhGMmS00IiUYigIBB8Z9MEWFmqS+RwTlmsDcubuRc+VWI/woKpOZAwnbDqGfIBliCfix5X
 /GoWImgx3aJJeWL4A4B7ChzCO
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id
 d75a77b69052e-48e01552584mr75445951cf.50.1746375234608; 
 Sun, 04 May 2025 09:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEOxFwHYPaRivE5KuBUUSrIQdtLUQdGkwtMO2jrXIxKo/JL2oOjaGV22aEcp+VehZmah9tA==
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id
 d75a77b69052e-48e01552584mr75445631cf.50.1746375234338; 
 Sun, 04 May 2025 09:13:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Sun,  4 May 2025 19:13:30 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xqf21WP0HLxsl8XsqVBpGI_9VnV9Sd5m
X-Proofpoint-ORIG-GUID: Xqf21WP0HLxsl8XsqVBpGI_9VnV9Sd5m
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68179243 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX7c7TZLZc+WRq
 5twZbu4DHAGbGuTbB0pwP0ErsdOC/2JaYJhgXR+RHQ30uA12CKIKwIF8HdxjLW8l2Nr1sc51EqG
 hgiRKK4u8SNs3N6OhgwsaDCzcb/IaCbGAv9Nz+Thw+r48XWbCBwTWnREZ50TIAlk/np6rsu7CTO
 g4+hZN4gfZiB/RzaJrPK5bP2OnBaang7IaDOXBq+FxSaY7OIZ1RsNsid0t4GAMPFVfY7qp6b5qG
 hBFDMCvAh6L8nPy+yD8VHlOxALYSZI2zFdWMvKzpg33eoDGz3LxnfbZdWysxWiBqIxZGZPesyeR
 jiaBbj022x1B3/Ku6X+wtduwuQaC0wsnj2fo3uGPky2oDc8jSGAfjpoCP2qxMSCpEIeDv1EPZXG
 zPgLbQ/miKf9hIUEJBu5KEWrgXVXTzvB0H9eOrWomp1zMztsiVAsNK1vqef/suEg73CHMn1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=871 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
