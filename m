Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D7C9DF032
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 12:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E76510E010;
	Sat, 30 Nov 2024 11:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXba2dg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D96110E010
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:37:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU4ho00005829
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZvpAxmieEw473kwTlA9LztuKkMS27kGy1qIBHQ8Lng=; b=fXba2dg6B7uaj/8F
 I0Pd5UltCnJDKkvPA6mW6kOMXTA+eCTfLyJyPMZ/zsy5rJe11ZRK7GiwMYL4A8Ig
 kvSTPWpfwLbs3a0yFHyD+TAg3NJTSGhWPsLHOnHmipBhVCBbIbyuLKK2ZD9rNxRv
 KGCPB/ikg3boxGgj6yw6EhAMC1U2w3rj4uTmWefJsaHe0blB+sKyn4JabvOLhgpQ
 VMKHp9dzHBBJM9QTz7tiEkRo7B9Mm0ihC970sXN4ybiy+cTnl3P+jnxgIaNdtg06
 xcDS4HloFJwT65/sNt2Lcz+HLNssO1Lr8lu3MkgP69/0o+UWwDyWb2Ip0ISQrrhw
 OWoc9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1g8q4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:37:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4668a6d41a5so3473491cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732966645; x=1733571445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZvpAxmieEw473kwTlA9LztuKkMS27kGy1qIBHQ8Lng=;
 b=b13egmuzPmYwx1UGZBkuKvl2u0gzbenYaHw1xbZa9pztwMGDXxDNbLEXZjrP1c9QlK
 nEIuWgSg0XTCCikXtozRUQVwyCb7H2sRu2iz4jnN/uOQ/u8HCc/7me6N4TXpgHfNDU9z
 t6JCFlcfBUAe1Bhs5bzBNz7ac2EJh8HdF4FRd4syG74svxLIUGLHe82LID2MotdTEtsm
 YwVyrAepQZYnQILARBd/33FsuNtn7L3wRaBrVzUd1zbDSG3EO5QehHpaZpTUd8S0udtp
 EhP4Dr3cwjIDvtBWqh6cPoQPkt5gCWqAKoNdPbYTpb4sm6msj7QwE+b2SDexCeqc+fKo
 WjVg==
X-Gm-Message-State: AOJu0Yza5YXz8kzgWkYdTzwhg8OyvZqr4NqofyFuR2xGSXHdcRj6fHjb
 ADNPO+0pjeXj/mlm6g1RNPbqRZI1v9rtXVLqtonxbFnnS8p6DxW5H977K3Wddmi3URhoq73iP+i
 DnBLiUYs2y1zWP/n/vHGT3qt1gUgfbO+pvcmk/bE2C3pnojfa/j4XvlsgVvRH9TFrpOo=
X-Gm-Gg: ASbGncv9P9TUgpDFxLsermpd7QqcP/7NJCFv03vAD8kkox+Hd+sd4qBeX5zcJ0W3Zdv
 EYyNS5aPEqAh4aq4n1xakU9dz4RcYYMVuyUOq1H5zWin76W8I1XOWjN9AMhcTjWXPvLyAIqqjwu
 ZIreTQtMRwVnoEThLwSaMpbnFya8JJwqM8/k/O6MbYAzcYm8RFNS+EH6kzgNeWWhBQdycU2vmB/
 aUdmN0LNJEuGroS8GbKGDr8U5EDRHTKSs4LyMc46RHq6Tdgah2FKDFBdVnoFCChR1ZVlc8wQEiL
 Nh4hy+8qeuQStCSvbX0k1Iz8aFkbDLQ=
X-Received: by 2002:a05:622a:1a02:b0:463:5517:ffdf with SMTP id
 d75a77b69052e-466b36d27cbmr76067711cf.16.1732966645294; 
 Sat, 30 Nov 2024 03:37:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzT9ypsq48UF7x887wPpK3Ma8DeIIzsTE7qzn3zdK4jFniAGHsJbfgxS0eMI6V8wqi307QdQ==
X-Received: by 2002:a05:622a:1a02:b0:463:5517:ffdf with SMTP id
 d75a77b69052e-466b36d27cbmr76067521cf.16.1732966644925; 
 Sat, 30 Nov 2024 03:37:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0d1de7429sm195217a12.74.2024.11.30.03.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2024 03:37:24 -0800 (PST)
Message-ID: <6e01c2b4-2383-4c2c-b848-da3f3760ea98@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 12:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
To: maud_spierings@hotmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
 <20241125-asus_qcom_display-v4-1-61a4da162406@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125-asus_qcom_display-v4-1-61a4da162406@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9PShKLas2pkYXSCEd8Y-bsKKeYEM9Wvi
X-Proofpoint-ORIG-GUID: 9PShKLas2pkYXSCEd8Y-bsKKeYEM9Wvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=858 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300096
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

On 25.11.2024 8:11 PM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 uses the ATNA56AC03 panel.
> This panel is controlled by the atna33xc20 driver instead of the generic
> edp-panel driver
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
