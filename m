Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE2A6AD35
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B09110E294;
	Thu, 20 Mar 2025 18:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXuv9jgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C48410E294
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 18:43:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KESSHK004882
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 18:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+ONx5//4UtMuIj9b1Txh1pQb
 rcyKh3E5jAL4BLqN58w=; b=ZXuv9jgVgoDsC5ZU/SvLq5mJ/aS08aIE7x3Zn3Pw
 xIeU5FTc0FymB9NBjJcdnNJAhwIiIZJt0EfvfiR6YVSiNytJcIXwaPZ8znu8e4No
 AwmlBpvDTxpfDDWUeiWRyDGBoUNbzPpOl1WtzwsUqrmimu5pWfzCGChzd4g7qa91
 ZJ2rADlL4xtDjl9ciSD8zmQ/1EShl8BkykG/o4iqyjED8Dx85/CeyJ2rHt5wQaFf
 iNDe6gQSGx+7xVIg6IKxlvIRHmAqyd42VhsxeN2i7bI9w2HPhI17Dv/kObkstrok
 uWBzHerSNNNKMkFzSbo7lqT0kWnr0VraKU92q+fOfY/Odw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1adp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 18:43:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54e8ad9b3so351390685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496216; x=1743101016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ONx5//4UtMuIj9b1Txh1pQbrcyKh3E5jAL4BLqN58w=;
 b=VyoCGGVyTV+xdJWTZhwujhwgUJ2gcesfn3FfwIW3uZxFKjcFs90PpE+3bqpdWld3Ec
 H51NSWHldXRD5TV/yd2qBF/syOuAXreiWpB+U4qbumF30Fw3QmMwWQFOA6Y0EX0ZYEe9
 zJZO5rke3DU01SzxzFeY62cZ5tkjAiXvcQBfBpbiCc9u8DAgwyyQog0biZv/LNa4QH9p
 NGgb03YcPlHIjzQHNU51CuK33jCWmvtBpoMy3/zQWwVyrTDRFxKYOigN0mFLr5Jpe1BK
 qBufWtUEgMclUt/+PBF/DuTEqgcqRLYonRgNyBcWxekWFNxCfO1iLleH8zUrvEupN5Mi
 pgTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBngeGptjCQNGGvJdvpKZ8V1ExncQyoYR1aoyqilqkpNBTPe23brSNBPRKPmxliJIi8K6Rd/A1fVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7R+4Oqwr9yT7dcLcmFRElEp9RIJrfmNq/XfSSWLwV/bS1tg91
 XaykpSHRJ6ZNhJchQw0cLNPP3xw5RqOOHyuWKrol8VbV1+K8e8/FW1jCONy5IzgZN71Kf+lFIuy
 EVvhJOyR7bw3E5ZVnr4LFzb8XJxdpNHgcilWkPMK2s5H53FNyESYPFdXFaoBChexs1sQ=
X-Gm-Gg: ASbGncssUNtHiR3tLJL+moGfjs34Tb/W5Hig+lFypqaswDKtvWltvW11E1XhaB4o0fM
 4BRpDBA8eDXlHfKmteRfeV6QtUEVK78W6XIf+XRRe9IvjRW/Pdh+GZ+HHkuUmWejI9CLY1j/XjR
 A5MzHIdrYBhPNezcr3J7pMmVifqPqOQvi6Rg17akG1I14lrqCd6BS7Egw+iF/47/kPzdpK0ZuXt
 oT2X8nALdCYn3A1ZfQUGxkRX1fANXjp1wpC1N2Fou8JZUE3twm1fgyuInymyguox7l8KH6D9DVn
 ryoJoZR7WtLwn/iipvWs3l0XpdnbQgxh+KvjHttOT5OYdNSwU/8ytz1dvi5zUAD1sqUhrSjgU6B
 IS84=
X-Received: by 2002:a05:620a:2846:b0:7c5:93ad:d2d4 with SMTP id
 af79cd13be357-7c5b0505fb7mr790742985a.9.1742496216636; 
 Thu, 20 Mar 2025 11:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIOpxyiAffu/h19LyVC1go0TlaRx2On3Hti1oWXPswumXindR9aN6vgdysZcfnA+vAuG/pvQ==
X-Received: by 2002:a05:620a:2846:b0:7c5:93ad:d2d4 with SMTP id
 af79cd13be357-7c5b0505fb7mr790739385a.9.1742496216221; 
 Thu, 20 Mar 2025 11:43:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad63eedf2sm20268e87.0.2025.03.20.11.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:43:34 -0700 (PDT)
Date: Thu, 20 Mar 2025 20:43:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dc61d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QMmaw6yphwjc_7Rvn6EA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2wFr8Rl1OYSObVLa_DnhsZB-jT1E1zRA
X-Proofpoint-ORIG-GUID: 2wFr8Rl1OYSObVLa_DnhsZB-jT1E1zRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200121
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

On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2025 09:14, Ling Xu wrote:
> > The fastrpc driver has support for 5 types of remoteprocs. There are
> > some products which support GPDSP remoteprocs. Add changes to support
> > GPDSP remoteprocs.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > ---
> >   drivers/misc/fastrpc.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..80aa554b3042 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -28,7 +28,9 @@
> >   #define SDSP_DOMAIN_ID (2)
> >   #define CDSP_DOMAIN_ID (3)
> >   #define CDSP1_DOMAIN_ID (4)
> > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > +#define GDSP0_DOMAIN_ID (5)
> > +#define GDSP1_DOMAIN_ID (6)
> 
> We have already made the driver look silly here, Lets not add domain ids for
> each instance, which is not a scalable.
> 
> Domain ids are strictly for a domain not each instance.

Then CDSP1 should also be gone, correct?

-- 
With best wishes
Dmitry
