Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62973BC1E23
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BA410E1B9;
	Tue,  7 Oct 2025 15:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbOMTFOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90D810E6D5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:16:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETCFc006820
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HR6W3PNgXeuo+1X26mr5w2I1dLqYNB+kRJz4U7kFt3Y=; b=pbOMTFOF3BD+kd4O
 Dk5s2hJB/cdEkQsQjiGlSIuE9THLLjFGpnSg6mcng2ZSlwxXqv2n3v0pNkTadvf2
 MH0etp07j9h4k0vkxTTWEDBtHZxFsn+7XNVxfbN7hqFF93ETGmpnRHKvSXCfFWFX
 XdwWekWyVE0mW3OnYDWD5j2CSpKhq8WXKSapAI0luBz7lVJt1ken0cQZWEU04cm5
 Pe4IdFPr5FzDsWBphr5OxnsXtFUvFUm7P1x/dZOPU95t1OYGeMp5aeDcCbYfngLX
 Co/Dzr4RVru5sHMJaDNPu393ac7CtPmsc8M4flvBRpUe43q25P/lfDCGW5VWq5bb
 HfERpw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1qkmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:16:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77b73bddbdcso5983141b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759850208; x=1760455008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HR6W3PNgXeuo+1X26mr5w2I1dLqYNB+kRJz4U7kFt3Y=;
 b=lwpbrGhLoxP91/EMHtNxPkLnfEySHsKfV58Rkh7GnMMhKR8l4dvL3O2qpOZx4DaJup
 1mraj84wfDkrAz+iZ2Zef6LPHEmRKmmm0vuDKPJwUfvoryBzxtDPrESfwjufSF/GwByK
 /tMA1DM1tIuGmTn/KfPR+xbzzDvDayR+dKy5oGPhFGDboQlhwwsehsfW+fxkFHZlG4CA
 LMlbVmAvsqjAB+Z5uusVSgVZ9nPeYufQW3c0KIL5yEKfFNLIPlHrfwO71it/7qjuAHOF
 61Tlo+oQES4FknCxtbupkBNKqQmH0XrP1GdAH0Rh8w4HHRvdUyC0zOi9EBR78COH14Ip
 JU4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSBV9OxCDPjsAXpE0ZGaawMMKztCYasSPhBLX2q8wDE2DAcPXjiG2S7AsGbZ3Ca/WtPGXw0e17ipc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSZpHGalObo1yYGoMEpu5VdsvfO95DDuiBZfTWcQh59wQw4Qk0
 ELXtNF8V1oHMLNzeG730WscFipPIdXKznC+vi3V+wcK27gka/8dhxa0C/H3n1kFkU5EL2+XsvPO
 Abg+O9uwltlJYX3sckgkH99U1370leGmPiz78H5Skqu6k7aK/hDIdN7+CVFAwmIHkMS5gpD4=
X-Gm-Gg: ASbGnct6Kgz9LHEZRDjK/9B7YONln2BqzcAEbkm4m9VgywK3HsjcAy9dPIGU8SIs3KS
 RLXkL+y3J+d4tTv569hnHRFUaaYbsspDCHPBHuczPz99VhHwH0pdvD1FZHfoGLRhZTenU5QF8Lw
 828S3N4rbkV5ZilEi12FW3Y0hao2jhwH92vIMnwyOeX0uzIOqR8xPgi/PqFqmCHMi1CB84J4P5L
 zcBsOZOFVE+rRh3I61xS9r3i0Anf5/mrIGH2bmrwJNwHoBynoKPXmp5SXnw1En5ll2d6JmEgrxr
 u40FR45pp/1gcGVqraSGVdYuzBlqr5TFKvIkbKKtQHEJIF1dcfijwBCiRW9GlI6V3MNxAmeIRjn
 G2zM9nN1Lyuof3tUIpd8=
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id
 d2e1a72fcca58-79230757802mr4520396b3a.5.1759850208081; 
 Tue, 07 Oct 2025 08:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvJqFvW5buhCRtmfrhGok+KqzqcDk0Wk8TcAaqtN/kQq9czL3L/pKYGzmNx91UF/+tiKO0wQ==
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id
 d2e1a72fcca58-79230757802mr4520351b3a.5.1759850207501; 
 Tue, 07 Oct 2025 08:16:47 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b01fb16d9sm15910593b3a.22.2025.10.07.08.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:16:47 -0700 (PDT)
Message-ID: <3a210ae1-2c3b-4bdd-9e13-abcd0cb312c6@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:16:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nC24AiyIBUD-q-vQkdFGzE4TZddQ7XCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX+zOYjSCuZJwK
 YLJz7TxOQnF2l+FQuIr1isIo+FSpsxGp2nYCg59hi/Q/ljt0dxzOll9dDvmyuWICVcPGEVu3dYY
 MM3k5YFrSdb0vDttq9enxxPK8bEOfwIa6qY+O7FAXqoGw426iMYEPnYe2juz8Vs4NFGSwTqyCLo
 RDd69SKnMwyv0MSiFysw8X99jcj+JNZsshMUtJnSREmrd07EzfMCjsTwUso5QKzdzzGrx+ockhr
 aaR0cVB4XziYxtakpCguxXDTQ0QIgHNgVeKhjAfwerCYXbGy25T5WZDQbEL+6cTAY6qNjbOySX2
 eIsxuTxaXpHMqsp9IjkM5fLGo8qXvRNhpD5FJBgOVs7Xo46+4NHrPwxBEkLCJqjQ3yHVKkVZ3Ww
 Q86pqxVfckQriZDUCLonxabMoO1EGQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e52ee1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mizEDCQyCps1tdB_wZQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nC24AiyIBUD-q-vQkdFGzE4TZddQ7XCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

On 10/7/2025 6:23 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Currently, if find_and_map_user_pages() takes a DMA xfer request from the
> user with a length field set to 0, or in a rare case, the host receives
> QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
> is equal to the requested transaction size, the function will return 0
> before allocating an sgt or setting the fields of the dma_xfer struct.
> In that case, encode_addr_size_pairs() will try to access the sgt which
> will lead to a general protection fault.
> 
> Return an EINVAL in case the user provides a zero-sized ALP, or the device
> requests continuation after all of the bytes have been transferred.
> 
> Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
