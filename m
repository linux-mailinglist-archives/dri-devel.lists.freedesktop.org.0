Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D141CAF995A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4695910E35D;
	Fri,  4 Jul 2025 16:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7mDgnjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572BB10EA49
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 16:55:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648lR0O025172
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 16:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uGJsilyKHH4Uj2b3teA8OQnh
 5JhrzwNB6QZ7/ifZqDk=; b=e7mDgnjY9p6v+RF8+fdZG7rJKnTa3Rd/pugvpJa0
 H/sNW/r5qaebMSIf5akCMH+2/w6vTi3YCP1Pv1NzSWuN3Qu4uzIg64PiFZOsYpMo
 j4c3RU+/rQraBeOmHp6bhLgmzwECWXO3/bxE/Fsfdbnz2Q3idtTKLlNRAR45OUXs
 C3Lw1TgpAfSVKp4KNl2/MGCBA6ydVcIK0fmq2P015qdDkOl8ZWFHJowvuBm5zawJ
 h0QJv5KZRQWkn3yVT+lTsyZd55kRHE2T0/OfRrPCvp5XdKv0ptqAD2TBrTnHXm0z
 QoQylJqZnvaWkDbVUsNhgVTlvkhNqlhfN92gpAIo3bgW0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd651kct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 16:55:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d099c1779dso164498585a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 09:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751648144; x=1752252944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGJsilyKHH4Uj2b3teA8OQnh5JhrzwNB6QZ7/ifZqDk=;
 b=exRxZEZFhBWGUoMRUMZhE+lPLQN8+OW7SG0ndTXrupM7CUFfdv6JttJoAEYwo1XlWC
 qRBa6tCd0iTiTykjnrOrWv8seIPTEElVt+wT2KmbmZjaJ0qhZZKN+EYCxFJBoQNXoHby
 dKKeRKiv/Z6e79QR6sioqV28/PnPRy0LwMRvdsaP1ulbE9NNh8uH/ACvYFaJ6CccJ+RX
 /cK30EzF09pJ9GHC1ugjgFisJRVtGIatzdDv/50B5Ix1nsVbccG+IVA4nn3q0MyN4V7l
 VNz6uV/9FcZ9Sk84ZoqDsNmEuiDTuQuSyD4brqqADco2mzoHA4iV3lTO6z5BswOwzoFT
 qKDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcHb0gXcBS/6//CzyX4pHjPZlM8CnSWW/F38W0al3LeoEVWqLcPzyszasnitgBHgaJM/FrZjEtJrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhTfJ4SYWhGbp6tWEY0g7M7i+pqWggnbVbu6dMJMv83uABNPXe
 UALi59UDILMN754BmfTtuLAMsfOusqiHg5lt/Df/p48eMoJyPCo5AyNt8mwzsrAC70CSBUy/mzG
 B7/Mu24jVkV6DnCWN8yY3n41ZyATkKz0dseioPJlYTB7MAoiuZ8pR4jClojeRy975KQnkElg=
X-Gm-Gg: ASbGnctyRdUZ9LNtLAIlYo3icbWEcFSWTO/O/PmaDRaW6gQAR7F+6OMeerK7ldhgCj2
 uH3PTp4gQaFaBso78r5m3GbRkDOXt9vpLVU1TSB0cLeN5pztIq5KuonShVDYYwXjohfWJWeNc5J
 n1HCnk8yHiGjBeCEnfuxwwCOwTG4xriDwncyDHOeT6uyQZ5Csowauke4J+YluB+6lKNvo4vsyob
 SuVK+0fVE1YNP2+lXkmIxTi9aMNBHE3Fpo/4GOdbiFdqbOqOwExBa7inUQ7iZQnwuiO4DCPDvoQ
 ZL+eJzwbZZSbfWD8uqmjr2DG+mIaPHdavNPALYjjdyZRlb0FMbQhTcmcJuECqg4M3aNTNAao5Qf
 gV8nGkbP0E2bTtdJk+AlVAeB4ledI5IiPNi0=
X-Received: by 2002:a05:620a:7014:b0:7d3:8dc9:f438 with SMTP id
 af79cd13be357-7d5dcc9df6amr531552585a.17.1751648144291; 
 Fri, 04 Jul 2025 09:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaVzA4IiTDSX6gXdnqwfBeXXk8lV7lfbEhBooGVKmi3HCndngb+lBjt9BZPHjHEi0TGBN+EQ==
X-Received: by 2002:a05:620a:7014:b0:7d3:8dc9:f438 with SMTP id
 af79cd13be357-7d5dcc9df6amr531549385a.17.1751648143880; 
 Fri, 04 Jul 2025 09:55:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d924asm304261e87.87.2025.07.04.09.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:55:43 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:55:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <dw57fgjv667bxde72vim34263ak4flkb5z6lfqzhtwuorm76iw@h4lmizln4rzc>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702025341.1473332-5-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68680791 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=GMwvZ8BIopSWxJjz0OgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyOCBTYWx0ZWRfXyEFcA0wl3btj
 yEE8fPAt+/ddISWqj/qlB8EmpAurNbePY5Y1U7ysZn1BpIT8E+UI4jA4mpq13+ymELH3dbSnte7
 twSrAb+2GUJ0kLgtleX65V0M8Fa1mJyQUPIb8XQi8BFh9+S1Hc8UqaoKQqwoqSvHQJPhRU7J2vD
 KpKzQmRYJspyXzIkdMYPDS9X3wKC170pQKcXAsqTyptMqT0+hvJa0Sn1t+OtUpnvjMwenBmp9OD
 U9r7X/co0OkMopQ+tV+KAihZ0a7fTth8suSaU7lCLVyNVIS48EEQNE80MRJ6dXD1vvyVHWBFrlP
 YUWdlZ2Pte61RMYKo9KDTLtCQv6gQSDavN+tiPUG1Y4tUjzgs/wRJfx/glQeJHSxSS5+8utUEkQ
 lClvdmvl/XpvMLUF4luk+bkdjLPRNjHnVyh/GFa8CP2hce55I0spQWHwA1WQu3iDMK3MprHN
X-Proofpoint-GUID: TO-U1KkSghRnUZf6Cqi01bi2vMUyW8Pz
X-Proofpoint-ORIG-GUID: TO-U1KkSghRnUZf6Cqi01bi2vMUyW8Pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=857
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040128
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

On Wed, Jul 02, 2025 at 08:23:41AM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.

Please read Documentation/process/submitting-patches.rst, look for "This
patch".

The patch looks good to me.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
