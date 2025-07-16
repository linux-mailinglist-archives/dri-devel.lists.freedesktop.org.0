Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF8BB079E1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC8610E754;
	Wed, 16 Jul 2025 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkXgvXc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF8010E2BF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:31:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1VE8031307
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WtJnIzqB+3SesANnG8pILja+
 egjdW8sjzapaUNf64Bw=; b=LkXgvXc0cWraNAW0XpxyqSgIAgFm4bNdFCbjtBuc
 OEHfT9UlCX89bvmSQGI7Do+V86qG/G1aZoSgaYRfK1sqUPafcfklNqAdryVzl5t6
 ZankvEAdlKLtLDg91s6T6BjUhoXSOCi8Yrf3ePbke0KK5zH2ULuvyfFeDPI6YF4J
 tEExAxtByeNqRk20E+g96BfW/TdhU5dXIgupneJTlannFT1xvw7ZKRmiJ3LB/EL2
 ypa4CMrNMCToIl/asi9sjZcx4SMBSbT7pyKv8Fc903ADV6n2UGPIm0tiFtj2+Bpp
 U4tzAkjmzeBk9Uf6GMt+u1xnBPaIjqHwGPTheeEZStkCTQ==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h9q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:31:05 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-8760733a107so747779839f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752679864; x=1753284664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtJnIzqB+3SesANnG8pILja+egjdW8sjzapaUNf64Bw=;
 b=MajMuR8h9ugWkgF6g8dG74VnKpALoayLVKnyQC8LvogLtdBFmXx9mCmn2jQUEHKUB0
 CHgf+q0IJ8hKOr6jC8yBmHQd47DMqfpIrjjGVnZJZUu2qXAn1NAF+EjUPmpleNLDZbLn
 S0/7JufBVB40GR5EjcTRBOEaPOTpCz1ObQbkm7qJ0lqp0K5x/rlR6y62nwZWrnceCFAL
 Q4uocCyu4sRjGgn4J6AS88LiNh3ZZPZOi+Jdr66VS/KQcs7r9eVWUFA2+Iq7iplBx35/
 I2/F9nLpRmAkH3S1sQfJBQL2hFqbgl3MeQiblSQusjL5hryss9xZYSaWXE/BQfg+qW6O
 0uoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpHgnolQlxNQ03OSez76CESxerc/7XC94xnKY1dLGRRb/R9wiSz6a7zAy1IjNXvP8IVvgotYtBdJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhWeCs4lPDKCmY8Gtl4Kvf2Pr/uaL6gv7tuPKmsBhoOHn4VSat
 RicasHhw+VFsgKkWmbxtf4+U8jWFbVxtWC/V+6jUjSjvI3jW9qXaWSl6p25qX0owNZT8XHAQghJ
 pOY7KZWDILQpwDV+0aqKjW0A1BcwVMiJLlLdL5VcNBb/LN++WZxaKYo/gb39JSEl7C4S5uEY=
X-Gm-Gg: ASbGncsQfbaq4TNf1CnO49Xx+B6ZjJhk0dEddyRPOkKld3S39knSVBVC7174YryltV3
 WeJAOuYUwJ8AS+SLQqJ9OovK3VKP2ecf7T36185bJYEplWOxgv5NsilXevoFRAYwPJ7ylGNI1IB
 Fc8U45blvpdw7WF882QaikQXGGMeyytaeG0tUXOoXUS2kxrhab3DASfNcf6ndjaZFiKYEMd5PUE
 k9HRKiAYrV0WkrU17IYRLwzYbybURle6v+HkC4FYDoZVRSZPw5Y8e87Ta4CAWvgkUgDkSctJv8r
 1vzed1RY6dX5l8o4ZuT0ykGLThPjSLm83yu7+GdRhMUsibOdMBynhcrhwGT/DIVlqa0sFXDmFSi
 TJW1747JkzPv3MSbN3i/HmVubBBmD3rdJOwdCnVduxBojI97hOt3v
X-Received: by 2002:a05:6e02:4701:b0:3e1:5f8c:10e6 with SMTP id
 e9e14a558f8ab-3e2824455b8mr27612275ab.13.1752679864485; 
 Wed, 16 Jul 2025 08:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUoHT+PB8kn2rb6kYrtzuZSZX2s+9VLncmPQvqc9jUsjfQu+TJIFGcQodWcjaEgjwNacwprQ==
X-Received: by 2002:a05:6e02:4701:b0:3e1:5f8c:10e6 with SMTP id
 e9e14a558f8ab-3e2824455b8mr27611855ab.13.1752679863975; 
 Wed, 16 Jul 2025 08:31:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7bcd76sm2667601e87.35.2025.07.16.08.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 08:31:02 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:31:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
Message-ID: <b7xjjlrn2clktozk5uwipt7tdv7clwipmq4wono25ts2csrsil@wcsl3wfippcz>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
 <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
 <9075ba23-cf47-411a-a6a2-96f89114b14f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9075ba23-cf47-411a-a6a2-96f89114b14f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfXwjZnW7y8iQDf
 wiX8HjAlw7EFJPDpt6cIlxciI1x8TxMekPFWSvGyy9UZ1a7z8qYs9Km6uN4XSRLDu95zf5kGbgK
 38i/gSjew7b9dOXPjRtdbKbc3tGX9GqnBEdnzNGgp69SM6HrYqKL2aYPT+wJXFpWErIhV1lwXPR
 L5DmAjumJql0oXINqWM+qNbI/j1csChc7xJNkLOquUUWFFHm4t/MeyvyUupTl3hrPCCEe4WLtmM
 QDQx7/KuSIRmhP3goUlS2o7iLCfw42QKPWr8AHoahvJWT8PCZSRb2k43zv4zZcYDbiyPDhxKzNZ
 LGaNpbqjqyd9LW5q7sRyqk1sEXf4VT6jp0dKkLxTj7og2NYvCOVXVj2RXu4AhWs70242cyZVTL/
 tXQXq5ifLHM23+N3cfavsjF79CDxrYRYOsZYw0LRxc2BK3IZpJgrCDPBDogpTJAP5fLN2btP
X-Proofpoint-GUID: XnDy1spIBuucaLnEmUN46z3DbEZJ_d00
X-Proofpoint-ORIG-GUID: XnDy1spIBuucaLnEmUN46z3DbEZJ_d00
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c5b9 cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=SawCyeuA4rNlEbsMlaYA:9
 a=CjuIK1q_8ugA:10 a=TsFzuV67ciA61D7d30EA:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=802 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160140
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

On Wed, Jul 16, 2025 at 05:21:20PM +0200, Konrad Dybcio wrote:
> On 7/16/25 5:00 PM, Dmitry Baryshkov wrote:
> > On Wed, Jul 16, 2025 at 06:58:34PM +0530, Ling Xu wrote:
> >> Domain ID in the uAPI is misleading. Remove checks and log messages
> >> related to 'domain' field in capability structure. Update UAPI to
> >> mark the field as unused.
> >>
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c      | 14 +-------------
> >>  include/uapi/misc/fastrpc.h |  2 +-
> >>  2 files changed, 2 insertions(+), 14 deletions(-)
> >>
> > 
> 
> Dmitry, your message is missing

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
