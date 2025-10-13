Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6275BD57D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4110E12A;
	Mon, 13 Oct 2025 17:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJyMEN6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBFE10E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 17:28:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDDqF008155
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 17:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v7UV7Izd9gdjy03mbMGcctiqtINEtc3rR0Cr9fYXcQQ=; b=jJyMEN6tlJ5JyqpH
 qHo3Z/zgux+tPHLClKQPFuVvcnathoVisY+TxO2BcnBBSruHCs8BKw3EwYMbQcLK
 dpF1Y17oKcXpD9Vl7C920eu7mD508p+9UnHgKkqRJKw2Lr1ayXyGVW9GVO9qNu84
 4vsHEPLWsAooL9nNy36FTHn7WI0GXi3c6gH1N0rkXL5pBmktYHSFWUXv41dcSeXx
 k/IR2YxSiYYVeIMsFML50t1iv7NCCyri9P/if9WDPehi/URjUf8gNyQJtMq2Od/0
 b+dd++iMcomWNx7bZ1jKbW5nAoPFupnPyrlKvOZPmYdEtyHVoV03dJnl9olchG/G
 X6j4oQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt2a0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 17:28:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-267fa90a2fbso112331715ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760376520; x=1760981320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7UV7Izd9gdjy03mbMGcctiqtINEtc3rR0Cr9fYXcQQ=;
 b=ao1I/gIBkVX02cEII0Z3Tx00QEDrfsTurpqYQHGluHTlqEvKl+t6UP5ziceQVubKZD
 jsuiVbucymwbUjpDymkgh0iSSeXfxRm9ZbRMAWvSjt2QDfSkNa8PqIFk2RaL53e50lfj
 32o/Df8uZZLJfeedvyXeAtt0i4EU6Kuel/iJJN/8uBjvXQXYEZ+jiwiMnvnbUknQGytX
 TqALZj9XsnrUT/1w1jCJfxGvj5V2jXhm3DW9R/690VWYnlCkzc/M7MoFZ+x/GXIgcFw3
 8KUq8paTg5UwAf73GHBhzIoj+/QI2YiTxaOmwESClnpRKy43yN1VefTtJVy4BysaUDc7
 eLkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1ynPt0YBqbHJ21rcJSP/Pqb7yI1Yw6K+NXXbr7ECKeb923vsXHmqw8ISYyo4+ez85TcFoUf+geeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA2wAQyjjEXPkYZTl26Wl26nRB0/R8o5YGpQIJSLz8LRKx7mTb
 PWwHO9+msol6aVirPgF5n60sHIEAIG6qRU/dnBH8Tftoni4D1pYAj0vC53fkFa6DS9i5UrJ5LQe
 j4pRBZyBulw3GeD7HIajzICnX199kJDXMuaOQfScql21S7tX8VG6DhIEzxTuhIoxcIPKVmx0=
X-Gm-Gg: ASbGncty6UCZykOrLT1pZNZwL66TTBb96lZzq/EJ4eG8QkgfuqsUUVY5vw8mpCiyX5E
 5QFJ2UeEWOqq+P7HpOPUTJ5fgaoJLMDeq8kvuI3WPt5yk05pFWLMnaebobwZOey95XFnPVV+ICK
 dLvZ0LKA+B8tQkV622cKIjxw72FEXZURn3xcDMzlYDuyk+1n8bCmFJ8HTMgUajY+abJJLVWIZTu
 s8OlBtzj1MIP2nJKwqsZuDPFaq3PoYx1eW9B5fqsSvl140+1sDfHaMAsm7DYHieMxn8OHKzqL8o
 dbcy+xPLeFetx4XXWjpU6RF8RJc6A4wIF6+FNfWaeJJNTZK9VEYKZY8vL8+jYMQOOwaQyy2HXlh
 4q2qzb42R1nFZgQ==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id
 d9443c01a7336-29027f43af0mr273065155ad.30.1760376520190; 
 Mon, 13 Oct 2025 10:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQnGs37X51iAdKD905FEiBr68lZ0ZmtwBGMTgR+akXMI0OHEezC7vorYmKbjrEJEau1vmRFA==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id
 d9443c01a7336-29027f43af0mr273064935ad.30.1760376519765; 
 Mon, 13 Oct 2025 10:28:39 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f9cf7csm139233615ad.125.2025.10.13.10.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 10:28:39 -0700 (PDT)
Message-ID: <cf63523f-dfc1-4aa4-b5ac-9f2fa258d9f9@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 11:28:37 -0600
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
X-Proofpoint-ORIG-GUID: Q3iocS61E4-iu-IXhMsrClpLy3qsoGJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXzdFx47IQ8456
 bUeK2oA52DM8POkcVNec40Bqu6NFFozuP2TR0l6GzEqSXuq6D2tcyAe6N8fy9w3SpHJnZtJXpY6
 3lj0RHJwvYfIvJo+KRFMQ2dR++UUEKA34F+8Vw9cQvI0JoUb9lgzSrHGPNaDX/stRjYj5F0RUtO
 ez6Ash60hckuFNEgD/j930v4ccWZRxDLGA/Ukrr15brBgv+Iu5WJJOlbVRKvqOl+LESfRgjsuMl
 teyFx3EcmhYzIW85bUulEK+dO+qTHRBkkjnHq/3KhXhWTy9SEGlvs6//qjXGYkOMsPof7gUM17K
 vsBBJzJS4S2Od+887FhtAaVF+jA3rcsUic5b7+XQD8J9h7pkTl7HM5VfRqP5i8x84vUVQcSJcj8
 uYUnairVZ8TIDOd+e8gE6YsAuMzokQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ed36c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qTQW5CXGkwUWSGTXi8sA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q3iocS61E4-iu-IXhMsrClpLy3qsoGJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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

Applied to drm-misc-next.

-Jeff
