Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E8D0D4FF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 11:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F4E10E146;
	Sat, 10 Jan 2026 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZOwtVvl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OR5dsbg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883310E146
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 10:49:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A6eej13888476
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 10:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qmyd2kMKM3XJIp9vc9VyDMDqUbQI+3X1Vq4gSHKjf34=; b=YZOwtVvlufhUUSlz
 GScp+O4/+2G+NC67m3sAXuUnvQEBKJ9aDSR3XkAJeumVG8fXvtK9P6o6tJr02XtR
 gvGKqvz+p7DW+MXPiNZUtQQDbgj37GWJsJyHNY0JhEHfgKbEkw2H9l3h3GbVh81l
 eWgkfrybbgfy07E6+yeDPFSMEelEk9vlv72jbezfK164e/bR95g140K/Ihp0Wxw9
 34l1W8B+QpW0hThYk5N0jbijV6O3tSRk9Z7XZ9hrRJ5zSoLqTc/P62c6fbvGIQtF
 U0MljPG4j3Tf8kX912Es+/pBQ3iJ1A1FwRvSUE0GiHaAqnQIkFBrCWGoa24IXe+r
 QVmXGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkds58n3e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 10:49:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b51db8ebd9so1601199785a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768042163; x=1768646963;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qmyd2kMKM3XJIp9vc9VyDMDqUbQI+3X1Vq4gSHKjf34=;
 b=OR5dsbg7MPQyVp/RkR+b41It9rbPIMsa5ulhEaD1XOGj4uX+Qnm4xkmFiX5Vt7pxL7
 dbI0dQdDmjkacFepg2FrHEaSKlrRHSlx0J/Y/0B98G4SLFRIFecpUt0pL8a50Eaut1cH
 i65+4m2EoxK6AZQuB23BrrjxOinn6TqCUIjSvvMilmXIMe91tI2gb24Ke77uiOadKKJW
 iQC7tIuXotBYobsjeFKfz2Gx3SHLDs1SOgXQw83LSmbEx4NW8Qd3wW6h2GgQ15BqLzKn
 dkx8O5n/IBoqTFnG4nEoC80WuUIiN4akvPkuir1E2wmGmX87DsEf+CVVkd+dRgRsUPSi
 X2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768042163; x=1768646963;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qmyd2kMKM3XJIp9vc9VyDMDqUbQI+3X1Vq4gSHKjf34=;
 b=XZ32C7ymYtoEibOYLS8n64SLxa+1yw6R4oXOnU+Rmq2Copd2P3oQ8PpAQTRS9GtyMT
 jzjsbpC3JGVXZv05G9xzZMRF6mdX4/FJQ4kNpkTwv4YZTrAXL8bvUL80gnJxEV8BFYdM
 dg6Zk6J3jFf1LXz8WpNk9Lq9KMjhHGM36jWk/JDFQ/YkgXUUSDk50j9IWVN1LBdPMVv1
 Krw0MDZowFaTqt03ejoN7M7nHZl3tw2XWnW9rTuvaXenm7C4zPwtp7ahKFhISy2bsoa9
 qsmY2uSL5uhhPQVi4cC/gs+NenW9xdurKJCBihl+29x8xYzxh0OyEtTzf1AH+JaygIW2
 saow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAcWFoMNaDbdMJTeXUnC1xUeaY8Sm+d3xfm+rlkX5qEwdxkXRxFxK12o7Ii/5Y6A+ZtJYWfveQkjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxstTRflgWKVTdhEdXBj9YY1u29HE9QbGKbhBLOw+jkeNY/yJnD
 /iYcvRDwrsxHdF/xDapM/QkvSlRgyda37tN2b1wnYhl8j5XIk1RREk0GtDsrLsFZrzRZWX0n1PT
 mAXLqV7KTTEoy3R7esJVNI529Cs1/TtX+BSTpCXNmXt2ojZmV9Qcb7lVrMjVWBsXuQQyeBjY=
X-Gm-Gg: AY/fxX4YsIsbdwxbli5k7yO2RZCAzxvrtvoKCcEp0sxXEKjGF0NkUG9gu2HOvKw9Xg0
 24vJxA84E1vgPjwDT0tC8i1DEbpMWCtdgT1Fa9NyRFMiNaY0bBO8V8Bq6iSwUrxiPAMQkBgNb7c
 sbrPVWz2Ftx1X4IbuzUKQvE7nW26MO+cIr9EM+Wij7u/AEgHSSL9N8wJPqkXL9jAouGlxY6zsnp
 Dzgbnuy1HNACoFBA/2jAwa7YcD8tgclAd/tXe9VXtXhqn9NGcxAyJyKCXzqV6qET7TtDhGJHibc
 nWVi9RqzD49FxMMK2HJp8E5SUojORXr2thTGCBMnEqdop7RYFh3k/d2cvFfC2OHxFakmcFg+XIM
 G1+OTnj6Sk1bHcU5bFMylpEx/d2o1OG/YJrOURj4z89Nt3cHaofuRa7tZdM5DNxCjj2cC+Y2bXW
 VOT4w2BKEFjf8NZSNDwL2eLko=
X-Received: by 2002:a05:620a:bcd:b0:84a:5f9d:a30c with SMTP id
 af79cd13be357-8c38940a543mr1820904485a.63.1768042163088; 
 Sat, 10 Jan 2026 02:49:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfeYlGLK0NEw/OBCDV4qXGiGbgGdvJV7eookMNOuUyzTILnGIZP4lkEf6FU0K3A0WoIhxGqw==
X-Received: by 2002:a05:620a:bcd:b0:84a:5f9d:a30c with SMTP id
 af79cd13be357-8c38940a543mr1820901785a.63.1768042162681; 
 Sat, 10 Jan 2026 02:49:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6ae8a169sm2967859e87.24.2026.01.10.02.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 02:49:22 -0800 (PST)
Date: Sat, 10 Jan 2026 12:49:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
Message-ID: <osefa4qfbezj6vxdjtlbnw2fhkt6ahbewt5xrpg7qeeapgwohr@xm2d6ati66nt>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
X-Proofpoint-GUID: fesLJceZO31I2xDck9t5xT0oUlTVAEI2
X-Authority-Analysis: v=2.4 cv=c76mgB9l c=1 sm=1 tr=0 ts=69622eb3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=9BbF6PmzOO6rjHPDYboA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fesLJceZO31I2xDck9t5xT0oUlTVAEI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDA5MCBTYWx0ZWRfX0HYQWg+Vl8wg
 zd2jG4Zc4iOpThbXgjPridAe5FKCpEBcaTJrnPns/A4GMfmYL3tOxcnM1Bf1m7cA1YBtwC/2c4X
 iL/oV5G50sNs5gimFs2rNgXWwyFdXcZOQed0vVlPKr5K0EHh3YbB/SzGOL4iFl2v1SOpdbH/VPl
 WUHRJC9xHpnJVoU+7zTjlDYPgsQwQj1rsGoIrK72NQcReiGgS+4hbGLP3pIXw5tig+OUyBy8b9W
 Or+JynbuNnoc8yyB4dI83E0XHruvFwX3R2W9tXyo/i3yg/CvPOCkHy1ownmsmdvDTutITSwT3ZH
 gwt0RPiZr3xjuDxHocft7TSA3qKBGZoBapEpC6XxHogzWQTTLrBW7E1Dao6es7puLwbcpfAqfgn
 4T7TNVeWB3MPzdmGPzx7dvDWT6/Rbpw9A6gGKJ7d0+Nq+Yj0k6cfFSatOFYoSO0pydihPLFfbhy
 27VCHXWv2bSsxC6c4FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100090
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

On Fri, Jan 09, 2026 at 02:11:19PM -0500, Connor Abbott wrote:
> On Thu, Jan 8, 2026 at 9:22 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >
> > SMEM allows the OS to retrieve information about the DDR memory.
> > Among that information, is a semi-magic value called 'HBB', or Highest
> > Bank address Bit, which multimedia drivers (for hardware like Adreno
> > and MDSS) must retrieve in order to program the IP blocks correctly.
> >
> > This series introduces an API to retrieve that value, uses it in the
> > aforementioned programming sequences and exposes available DDR
> > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > information can be exposed in the future, as needed.
> >
> > Patch 3 should really be merged after 1&2
> 
> No. The HBB value currently returned by the bootloader is *not* always
> the same as what we use currently, because some SoCs (like SM8250)
> with the same DT ship with multiple different DRAM configurations and
> we've been using a sub-optimal value the whole time. After all, that's
> the whole point of using the bootloader value. But patches 1&2 will
> only make the DPU use the bootloader value for HBB, not the GPU. So on
> one of the affected SoCs, it will introduce a mismatch. You can't
> change anything until the GPU side uses the new ubwc config as its
> source of truth.

Which, unfortunately, also means that Iris / Venus must also start using
the UBWC config API beforehand.

-- 
With best wishes
Dmitry
