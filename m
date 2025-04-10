Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEAA84D10
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6710EA56;
	Thu, 10 Apr 2025 19:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJPX7vmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28210EA56
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:31:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFe64C018659
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ds9TtaCY5KQ6iV/Yaj6mG8zs
 RfUBvQFElU18gYT4+UY=; b=gJPX7vmiC/oS5ak4DBfWZE9ixd9+ysY8osoaEgj7
 61edvL7XVE34WQiPGOVw+HlwLzPZqN6Ovu/+GgcvyuIN5Fou8pCocDn5TO2+FidD
 Wz7LXd8COtugpdgTP6aan5mqKNwcaw6Eaf0GjmzDVgUxfoe+yUUEubsrKbMfhYqk
 clzFgiIVJUr3IQAmlTsx1vUQb+nmnE3+Z1hwaqRorXlUl16NxUFATWerVOK25eip
 ptaCjZPDZISJHQ3BhWQxySQSOkRyV0ikTUYkHsCESJy+dyEnlfFiSozQDZaSREcy
 dRWjFRFSY60uxcOGQ30oHZ8nfQ0U31bSL2qbKsBirUC5Dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgra7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:31:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so341880185a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744313496; x=1744918296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ds9TtaCY5KQ6iV/Yaj6mG8zsRfUBvQFElU18gYT4+UY=;
 b=NqztEb2X961g/Z2KxzmQKyWnfWQY+A+ueOa1+XJPhd/GqqmeLhL7C2Ssy6K7z3AfUY
 KVaP/d8ObEUJc91KbsK2XWzPNntTSIqfggsam9FkZsBC8Y1OMDrkjVnNIpiZfwtKynGq
 uo6YJEy9zuavCWALxJYExiWk0ZKfm4LtohiZaS0YDNxd4xH4yxbbiB/9idpHdc2as5XR
 V8cjMuwMFKgPSPsP1EVtDAD4Zu9SdzGRQ0qO9wrx4FdYPYUvUhETHKCcRbk/xrc+ki+O
 1JHbwvPwDlRf0oymYmmgjRKD+vlkHEnFXjDthBJPwLJhJ8BLWjGejuKzGy/SlsNZnAtI
 fCQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9635YJzzM5Q7mUlX6Fqtclb4DSyM8PP5d9OTGq7OBL6w+ZKipa3ke7vORrqESm/atfYdGHvFzUqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIN9+KwvgSHfE4gU4bdkOCl5l4VkW5X19yCXkVDTB37r4eeXfW
 O7wCCWl5LnEqfToeg2B0i2RSvz3ufUBnnpa8zGqWVoyeHvDvnSaMTMT/lgDFVxmnX9HCQtBQiWj
 mSLny0jOGdTUkZRQK4NpTgti5lMN4KJd26cAei/dmXo91qjAvQ4JhF+yLTAU7yW6f2lw=
X-Gm-Gg: ASbGnct8GTLXYTNLH3vsAhJRXhMkxilayLXvBhKP+5YaG+zg9dQEeqAQAKVITpoRQ4W
 mKG/WHvVLJe/HhoeoLwVCAeoKr2jIRLupRxu3XwJ5tAS+DMZYRgpZ5UC0yWTj5vFpQ1Xfw6vuho
 hNjWwFbHtqe0nq9LpbQ1+s0S9fJ44LdPdEIb0oomWB4/H1SL27QyIH3/V3aGD2gZ+GGexhPFjF/
 YhY0kxNuD6weCMtWJO7aNUr5xTHVjhDkk20qCHPOCZ4Tn0R5Iwnnz5kwwHJjyWx/RiB5K1t53bU
 EIIR/9QIJqN+0IGXpQ7XfQLGCtAxuJffCke15Q2EAEOqLAEA5K2Xhj9kOkmDtI7QsI2GCbHusKM
 =
X-Received: by 2002:a05:620a:439c:b0:7c5:5e69:4450 with SMTP id
 af79cd13be357-7c7af0d6384mr32376785a.17.1744313496251; 
 Thu, 10 Apr 2025 12:31:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqctDDvkKrw5rP7GZctwMAOW52noXSrb/QQM/7LagYwEhTOr3WvKjQ5q57zE/X4Pbf9fAxcQ==
X-Received: by 2002:a05:620a:439c:b0:7c5:5e69:4450 with SMTP id
 af79cd13be357-7c7af0d6384mr32373885a.17.1744313495965; 
 Thu, 10 Apr 2025 12:31:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d123d84sm228105e87.23.2025.04.10.12.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:31:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:31:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anthony Ruhier <aruhier@mailbox.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
Message-ID: <zns3xlyeajvxxpubzzsls5tnr7tnp4ws2dwfx4s7klzn4nslte@gpgdfjzm2s7p>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
 <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
 <dmzoooujjb4zojjlgovjt6lccxilnnc3yr4j24vj4hwpzf5ouf@e6qkdlekcsnm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dmzoooujjb4zojjlgovjt6lccxilnnc3yr4j24vj4hwpzf5ouf@e6qkdlekcsnm>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f81c98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=ZR51km1V383oZAxlFiMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _RdsZOipZarlLZYDV87WdlwB_6AVpuXy
X-Proofpoint-GUID: _RdsZOipZarlLZYDV87WdlwB_6AVpuXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141
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

On Thu, Apr 10, 2025 at 05:51:38PM +0200, Anthony Ruhier wrote:
> Hi,
> 
> Sorry I should have gave an update on this: I don't think the lockups are
> related to this patch series, the same problem happens without applying these
> patches. It seems to increase by a lot the chances that a GPU lockup happens at
> start, however, so I could use that to debug the real problem.
> 
> > What firmware files are you using? ZAP surely comes from the Windows
> > package, but what about GMU and SQE? Linux-firmware?
> >
> > Specifically, please provide the GMU version which is printed to dmesg
> > on first GPU open
> 
> I'm using the firmwares imported from Windows, the Yoga Slim 7x is not in
> linux-firmware. I understood that the firmware files used by the Slim 7x are
> quite old, maybe it could be the problem.

Recently firmware for Yoga Slim 7x was merged to linux-firmware. Could
you please check if this helps or not?

> 
> The GMU version:
> 
> > [drm] Loaded GMU firmware v4.3.17
> 
> Thanks
> 
> --
> Anthony Ruhier

-- 
With best wishes
Dmitry
