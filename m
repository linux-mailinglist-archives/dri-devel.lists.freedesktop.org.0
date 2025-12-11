Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A7CB60D4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 14:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC4E10E80A;
	Thu, 11 Dec 2025 13:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZC9wF7r";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTcpDgpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EBD10E80A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:38:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBAXruu1597500
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1txFr79AtXs5zaKWsK7avjrh
 Np91Cmv9tciNTCP/ZI0=; b=FZC9wF7r0xzWVHjIpIVdT065fJR4/8LbJPEW2wmu
 IEXZtro8wxT5zSsYAOb2Q6lwreeJMuCvlurFpz9OVQhG8oGzRNfanp1rs+k8Pugt
 jk/gLNDSsMVp5DOStu3Xm8/SQZnSms0C7pCEllcrTtSip1ioXAsuZ/YUQ7c6eyHm
 GBHdMgcxfrHjpnfpHL5tmLZDX3owkMTmFlGY+boebKuVP9KY059+r6+khAOy3IzE
 8d055rxlDlBmjBNWIEBFGxPh8Lvn1d+JzoPyO5a4DM7xUrIgoW/Z2smMxp+jHOkL
 et8okZs2kdgDJNUSiY26uREEIBddM4YRboHyVnAPmEs2vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpbtpd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:38:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b30b6abb7bso20809685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765460315; x=1766065115;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1txFr79AtXs5zaKWsK7avjrhNp91Cmv9tciNTCP/ZI0=;
 b=NTcpDgpaKLD+N7MQ7bhODGRfAKBgsp6Ekxj2C9Y1/H6fEHI0g6qOtS9/4e8VvaVqQ/
 YeSjogJcE3cWK/R7grvYD3BL48adQej8HSEmjlsP/jy8/wD+/GS5mPTvyRvpkc4sv0nj
 AUfZ1fN1n+gPOClInwcIhklHGCpDEFufPFFsSvDSP+73MciIuLXEkFk0rZnhmCTte753
 3j9Oc4MWwOeEKYaW1AM/dhucWJnprxJq85ah5tcoGPDO0vtlTrXMoxo9vxyHOFBkCGW9
 gLov9v1euYhZO0fmeHmKMCJf++WwY5TrBza5Hi0F00pvMr05RDNJ0GatPDsu9UXFh7b5
 FcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765460315; x=1766065115;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1txFr79AtXs5zaKWsK7avjrhNp91Cmv9tciNTCP/ZI0=;
 b=Z9ahN+S/yCtioGF1akS/+x1gS9n57QIeP3sVwsodNmKK5DRrP7jijwk2roiIXHaMFr
 x3Us6a8V3BvyQ/NfTRk8ix6fyKPNKb89w3cjN370g8WHDgjoTM+RAglw1rwSkhluiyH1
 /dl6i85DRgShyLq1bHobROGDBhuu/xVbHu09Cb1bnvCCBlkiodtA/6wZj2OWhedcy6kE
 KgTQ1B/NUpORbMFYAyd/VvvhGKi9VWLbYW4ULhPNqS0AuyRsA77lB24S3Xa0IcbxxvLU
 Van2BSudIXo6ps889mFTS0+lF9UICAU2CAkoNfGsCZZ9Xq8SwCkcDnycKTuoXTjQ/dor
 2cWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB/nXiiCLLn1hFAXaW415oDo6bTcHbYUOWAonu0FEicp/kv0ZtvVox4lP6Pkxwkk3IiqosOpqP5y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDWmDRPEM+T1uRh+9j6JzjlEuopu69ZRXMF4uljdfwE0Zx5l0h
 W/CsPPPTmcrRmf9fPBW5CeLR+4dIzYdiZUfbuoVxNm/XxEAhC9q9OnW3DZe6KyjJTXwHqzoIFan
 E6mZf7iGHCMw5Yw6jjLwSOWNekg2ZfvRbpYB0l8bzv/YEI4ia9MNl82shO6tjDWXMAQndQC8=
X-Gm-Gg: AY/fxX6L+X/ay0dEx5PmpH6xlA0U0Q6q6w2g43nMd9MfnBUQ+pHDJB33Vfu01x3qAf1
 8XoGj9pku3sSog+8zHT71rNZRmU6kdjZUwedmh1uoT55k8IYpGq1ntdU2dLv8+5bXdzTNPbx414
 AaB4yuf136GatZhSx91hVBcoW36QzSYTMkUze+urk06g2vYk13gzA2NlWzuXU3tp5MmdEn19CjV
 ONRdmgw2vEM8uArXQ/1yeIWTQbJW/wP6CppSa0zyO8Pe07ig0OQfefkFMYCVf7Y6kWsao22JUGE
 T2am2cL/vdTNKnyWQ1kXoW4oQuJ+k4ClCGtP9YtklOCzeOA8I91iVQWYHi57eSV4QXm9Rn+fTyV
 AiZMCJAicF7xSGzmoogTNlEsz3Utc8uT6IhheyeORnoyC+1mGRMVOWDg6k7PTGyDCWdbs87KHsT
 TpwC2Pp1lALjJVSdsUOWCcEcM=
X-Received: by 2002:a05:622a:5a91:b0:4ee:1a54:d2bd with SMTP id
 d75a77b69052e-4f1b19d3c6dmr88158901cf.29.1765460315435; 
 Thu, 11 Dec 2025 05:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2TUScDpmeBa5M3MVeCZVAKKT2iORqa8I+l1ZWfWExOlbD0U/32mQsYXJLNemDvwTLUvDdqw==
X-Received: by 2002:a05:622a:5a91:b0:4ee:1a54:d2bd with SMTP id
 d75a77b69052e-4f1b19d3c6dmr88158371cf.29.1765460314996; 
 Thu, 11 Dec 2025 05:38:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2fa7fe0sm871983e87.72.2025.12.11.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 05:38:34 -0800 (PST)
Date: Thu, 11 Dec 2025 15:38:32 +0200
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
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <e3kkj7fjovs7gd5vqmyrgkojkodmmaqur7tzuq4oq52zb264xs@x6opdbm65k5i>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-5-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211100933.1285093-5-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNiBTYWx0ZWRfX3b3TdIMFIwhj
 b0Yh00i6gCRNq+F+UkhXQ4Rhr8+qaKeMeTt+HuD8rt5F5fV1t6iZugb+CFJM2fU6+DVRN7/E26b
 IyFkcaNR32ttKED+V9g6ao14e6m4p0wgDk0BnfqEHoWpMCPfT3ZJdaWhDZI47K19Udn7AHxyDOM
 4QBhijBLaGFLmNztWzTMk7zJoXW807cnS5ZLWL1heMhynbik2J0SQo868U+8FaGH8t2xVZGpqx/
 i6T/wragUsmNl8wGqZ1dYFoJ9yNVZQ64dH6xh3gCnN3+RgNcZ8Uh7wJJCrK5uvz1oRsIa52Wp+C
 Ym++oqXVUJEVzeJtgeqopj4W8q1RtTkznyFWgRi8RBTXe7yHJIHLCNJkS0v6EReZALdKLZpacl3
 B7Edj7XR4bDFmBfCN2VHvW9OU4OPDQ==
X-Proofpoint-ORIG-GUID: aKB-aKxmKbfeFuRNO18eaAW41F0YCfwA
X-Proofpoint-GUID: aKB-aKxmKbfeFuRNO18eaAW41F0YCfwA
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693ac95c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IFhsdl8TXimEBemdgfkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110106
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

On Thu, Dec 11, 2025 at 03:39:33PM +0530, Kumari Pallavi wrote:
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
