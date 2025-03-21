Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189AA6BC8E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 15:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9810E7DD;
	Fri, 21 Mar 2025 14:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z//dnnHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5034110E7DC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:07:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCS52X025347
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6Lj3Z0nr75RSpAKjWGnP9fZL
 3PNA1cnRFr4d9rHGNsk=; b=Z//dnnHjV1USlmiQGf37yOyUhg4DIQvaFXtWQLtN
 cE4i/0Pb+XDOU34kh0XgAUjpTq0GIJWtaWay1mOMl/ylIa68msrs31se6HztnLPg
 qlcm1TxEMgth9pWvv54Sq4WpVwDB3LN5lS0zgIBpWNxR5JMZf3aB77JGErg4331z
 3Bc+OXn5U75ajxjSiiPcsCamTNbguOU2DVrFuLdNaqMmHljWoFAaF3EOzG2g8z3m
 4nv9AZED2dGPI9Syh6XvOom+HXqERexyuSp4HXtc5ShHx091J1B/LYlsNFgghlnd
 ZeUvRMVhqXpF+7aBnXlvQ82+7o5g3ztbC0C7H/UPinNENw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854g974-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:07:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54767e507so349592185a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 07:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742566060; x=1743170860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Lj3Z0nr75RSpAKjWGnP9fZL3PNA1cnRFr4d9rHGNsk=;
 b=gcQZqLzBGe8LtAxbe6oBiYAocxXxcSxNNdGOtYhwNglMTNdXcA1SLovPqqOXHsb70K
 Ey+CEquLNnA7ljKdow/hO0Yja6INNb1lSlXp2YXcz3hTgvo6tsgdvX0+PrFF1AAjX4zE
 W7Gg3L1Q+en7HGvQE/2XiQ6XxfWY8iNLjs+doq0dAX25ASuOG6WyT0PoQKvDFNN8FS5Y
 3nyHaTD0lBcpoqZPC3Ds+dqoi/2MNI87uZ7YuBY2ehS9ulHMVQKg6EZIOoqg7+oW2FCr
 uS30LDWZY595P3xwarnKfhh8puP2NRWB7X9A+scxMKCsKuTdoCahiHjTIiyLfOpxc19D
 yN0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT4G7nAv6Hj+TdGtdgPbRC+04li+jHuXYIQmJTbd6ydwqbdqE8SQxXaid9DszmnW/JzXRv0MHS80A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycWbYE8bTvQIpZKrq/Tb8+DHHyBp96XHf+WZj9vEakfUuKc7mJ
 QNU5LGCMic4Y4BJh6degnLTjs/jtZxcNaUlRwKUUERxBrFbwSLi6sEFqQMY0rsxZBdqgaPFvryD
 hbq2Vnoc0b6B0Ssitaml3ffxFkeztTXm+2QtLvqvNhkWdBc4tGgYIlvh0RyHP5Jabhes=
X-Gm-Gg: ASbGncvdDOxfk/7FK9HH75X5Tzg+mgcAH0c2IqtkgyXJt1Q2F4d1/MB1regLyacgqvX
 j71BfS+X/VUUlzDJIz84Wp7bI4wmMLQqElrnD4EMWvv1rkGQEV9Uxy0XYogSBC0YraQeqol2sON
 StbiXhkynHD7eLIxme06+RO6s9K/s2738UAkDCWbNE8rYv/vsNV+RxaSYtTtIUZ+G+YTcyOUI/v
 tLpndvQFKd1GhDXqawxUmwc+wYq8wPZG3L6dc7K10zyrQ16Plj53KnJtpUSttfk27aHl+F2bTry
 IL7tQPR8n1+kDJNPpkzYFWumgV59cyGeyzdJ6FM3Jn1JkyozC60pSBZFOD+YMQURUmy27PpaZ2B
 XeGA=
X-Received: by 2002:a05:620a:4051:b0:7c5:9a4f:adf0 with SMTP id
 af79cd13be357-7c5ba1846e8mr427732485a.33.1742566060338; 
 Fri, 21 Mar 2025 07:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN2Hi2Iq/wisLHL4FDbRqBoRtFKfhIdoGegXlkIOLj6uMrHc7E55BfjIOutxbvmBBa/wCXtQ==
X-Received: by 2002:a05:620a:4051:b0:7c5:9a4f:adf0 with SMTP id
 af79cd13be357-7c5ba1846e8mr427724885a.33.1742566059734; 
 Fri, 21 Mar 2025 07:07:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad647b8dbsm188937e87.61.2025.03.21.07.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 07:07:39 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:07:37 +0200
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
Message-ID: <rjfccsym3sziidac5l4ecxsjy3rdulbf5ewhfksdqp35oxcimi@brvgpgme5wpf>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
X-Proofpoint-ORIG-GUID: DEH5z4a14R8QYLWc1ZAJ1_0pckF2vM7Q
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd72ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=d_F73D8V8anS-nGMN7cA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DEH5z4a14R8QYLWc1ZAJ1_0pckF2vM7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210103
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

On Fri, Mar 21, 2025 at 12:23:15PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
> > On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 20/03/2025 09:14, Ling Xu wrote:
> > > > The fastrpc driver has support for 5 types of remoteprocs. There are
> > > > some products which support GPDSP remoteprocs. Add changes to support
> > > > GPDSP remoteprocs.
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> > > > ---
> > > >    drivers/misc/fastrpc.c | 10 ++++++++--
> > > >    1 file changed, 8 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > index 7b7a22c91fe4..80aa554b3042 100644
> > > > --- a/drivers/misc/fastrpc.c
> > > > +++ b/drivers/misc/fastrpc.c
> > > > @@ -28,7 +28,9 @@
> > > >    #define SDSP_DOMAIN_ID (2)
> > > >    #define CDSP_DOMAIN_ID (3)
> > > >    #define CDSP1_DOMAIN_ID (4)
> > > > -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> > > > +#define GDSP0_DOMAIN_ID (5)
> > > > +#define GDSP1_DOMAIN_ID (6)
> > > 
> > > We have already made the driver look silly here, Lets not add domain ids for
> > > each instance, which is not a scalable.
> > > 
> > > Domain ids are strictly for a domain not each instance.
> > 
> > Then CDSP1 should also be gone, correct?
> Its already gone as part of the patch that I shared in this discussion.
> 
> I will send a proper patch to list once Ling/Ekansh has agree with it.

I see. For some reason mobile gmail decided that your patch is a quoted
message and ignored it.

-- 
With best wishes
Dmitry
