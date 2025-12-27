Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCBCE02FA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 00:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109B910E036;
	Sat, 27 Dec 2025 23:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/iWcOfl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QiShI9gQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0147F10E036
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 23:24:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRMe2RM471650
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 23:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6CjiYXPrKtqb59Vsb62XoJU/
 b2MptT7N0bil41waJJw=; b=f/iWcOflbFtMH6x8euatBMwkQJabbI2Gf9bxX2s3
 bzoBMLFh6x7wCuGzseTOb7/F3wp/Tjp/TeE5fpYoomk88gn4ohhAeEJJ6MTLJRG+
 kktf9xC5/SmKv2aUMNCtQbSHHmZsGw9XiBep3alqZL8ylHqCJTz/EW2+oSJNW8yV
 5skQF4i5UJHkbE0HtAWPJ6qxOS/zDu+gcjRmmtKCncbMFi0uh40Ra7W/lOPOyRQA
 zzS3uFjyB9/bfHVk8ZT98TsM/YFOz9FeyUQPFlPZt4mPlGyQRmDZKutunsQKWvPi
 Ucdzy6kP/vzxNLd8XvSGG60/VsF8n26HRk3ze6j4p9P7aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnsesr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 23:24:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1dea13d34so194281371cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 15:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766877880; x=1767482680;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6CjiYXPrKtqb59Vsb62XoJU/b2MptT7N0bil41waJJw=;
 b=QiShI9gQxRdg++ZL0LsqnqT4BMDrbhw75id17zuWxq+kObNC4Sg1S74lPSArsA5yZX
 PN3fhQ1ZyZtfaKcbXOr6zFMo1oXWVYGR0kTmQwO5VyzYKm8R9hVChhkX3kgfbFSdzz9O
 fVu4HtzZ5ZmZOKZwF98/WgUO56mFxEK3XlZ0StMb3nn8lFE59i/WwWlkYP90Elj1Iaw0
 5O1Sj+WuFww+zScl3Pua0RE0PbzZFWnEE8RySjJWzwdS+svPVxmw974B7K4Q08lCCiBj
 s6S0OWc9ZS72STOjNA9hHCx8T1Hz+EsCwje1bpj9bdC3Y5Px4liMEQbltu4unDaF5kEJ
 xASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766877880; x=1767482680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CjiYXPrKtqb59Vsb62XoJU/b2MptT7N0bil41waJJw=;
 b=S/8S4Nlo20yFISLXgWhVErJo+UTLUiWZLbpnxCO8AlWZifh14lz5jrrSQLifCKPusF
 qF6PBUKO0THJJfg0o6lFkdcKvHYElcAssJCdU1WXjLNi95MaXdWocM/GBWsv6IYP7RgF
 IwaQUkFecPmnUB3/t5JuuZ5M0ZpxRbUYN23SILFBgG3WZhKR6ATdUPsSLeRaR3ASGlTP
 1UjYybY1j7E2kUXFIjytu1DGEHOR4Ldr3Wt6NaPNKl/9+wS+0FNmpUCwvWcP48HGp2r1
 nGyFEezxHT3hbRNx5TbSrsiGv3NzX4jb9+9D0ruiLFCWCUZVIlVNfdeiR4DYu0eiAvUO
 O4EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxPcbAFb5mlQyGjA01YzNM6NjO3SQ8j0t41udM41+egf5k3U72Dpe4FOP6DaqAIjD7mgyHNVIpaog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYLXOtuBS7pDMqvBUY1WaAACSH6fmvE+9EAydvFzHcKFDXo3Ke
 PCAD7jGbz5IbDiyGtiwT7NuQx8x35Q4AxS7JJxupkFygIvsmYabntWM1OMbRTFEnRyIiBu6MQ7R
 vkjtIh/1bq7gsAMeGqgN6qSm+QtGRIeP9zZkrudMHLf3VZ5DsjgE/SSzjSEQLpgqEwRaMU68=
X-Gm-Gg: AY/fxX5be7uhmpBWePXZ40Wu+n6d5af0wTzke+QIWvVepnX+RmjqDYSHFJIuu7Asq0e
 u9N3iXAKOnVX7dFBcISAy+eyE0y3VWA0UpEDysCWGetF5LW+ZaLy/1QW/EvUw62eYJPJkwNlY5I
 w1zAAtvLZN4wRxCi6CSu2n6Bt20i0Val4UyUs2SXXTCXZdLcvdfe8vRksNi0kjJkFgmgPH0Qy8v
 U9ihvY5o32suDNrMXaQh3OAC7pgWlqo78ncaRr/pZ7TXNKhoZNIXykd7t1UMK8dtKsFyHNqrX1d
 S8LkjXsNgR/X1/E0/YzX41GXCYONnXR8HxKUo88F5TMUjN2GDBl5CnULZo2ukH1auiouWL9mPrJ
 tgZ9BT2IX/FGWpBsS64xUvOWJw3cZvvkw8SVSU9dLlupbtaWsHKxgZLxwgfW3f9bz54gwq5YpDF
 /NhpfU1OvxmbN5e+/1/Rohlvg=
X-Received: by 2002:ac8:59c1:0:b0:4ed:b0fe:6e67 with SMTP id
 d75a77b69052e-4f4abdb25b5mr369480971cf.69.1766877880259; 
 Sat, 27 Dec 2025 15:24:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGq4sszRVz+cR+XKY7cwM2oTqASKbeUZdXL4s+7Hsssumzgwtd3DSQx5SHvP+tFFQiWDO1uA==
X-Received: by 2002:ac8:59c1:0:b0:4ed:b0fe:6e67 with SMTP id
 d75a77b69052e-4f4abdb25b5mr369480731cf.69.1766877879779; 
 Sat, 27 Dec 2025 15:24:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f09fsm7816633e87.67.2025.12.27.15.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 15:24:39 -0800 (PST)
Date: Sun, 28 Dec 2025 01:24:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <inqtsuiwvbcplhvssn5fs3n4giekcrj3eljkmogko73tgbfzaz@iuvn2h2ezcxn>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-5-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-5-kumari.pallavi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69506ab8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IFhsdl8TXimEBemdgfkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: fFd_L_7yhDDhhSI50YW0XAd10d6Dd1Y0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIyMyBTYWx0ZWRfX9y7Xf+Dtf7C6
 ZN4rTe3llhh+QSB5yCwrlodFe887GkYGaLQDP8C7OrPZ23jbQu+1VdcBOg12HQZS7HYJ8z2AL+C
 CzS0WMF4qY+CTcVnYfEMr3YpMPrIl0A0qM432Inr07LtiP2zSV9/j5iy5aKabonSFBFtE8HVBP7
 4Y5M7xQwaFYQFPx0DbGvYHZaIHQoF1qWgzsRfGldWvvJ62/sOjC0GSkQq62PoZ+lKQcv4XRVKqK
 uo/O3Xbx1E7Cld89/wILm1gOQ64YUjxxN+TxVd8FgSIitgCXOU3GL/5hrIChbiMeki3YMq/Mplx
 HwZxTZ5j+3iCJKwQXJ1BfkPHJi5VZMxRIkJs4xXap5l/He4tjl+vTleVObmqeZEDVOg/+xq0MA1
 t0jqiEVPjw0W87MzWUNIG1HsT7ucKF4YuN/2wEsL6gDk9e5i4S7Ki44pLUgir/fPgtGcvLafyyn
 5KQrGPLknd5ig5zeRXw==
X-Proofpoint-ORIG-GUID: fFd_L_7yhDDhhSI50YW0XAd10d6Dd1Y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270223
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

On Fri, Dec 26, 2025 at 12:35:34PM +0530, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA bits configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> it to 34-bit based on CDSP and OF matching on the fastrpc node.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
