Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A286CCDB85B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 07:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD110E349;
	Wed, 24 Dec 2025 06:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ei40aiV4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ba5hebha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1267510E338
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:37:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNJCsw81056227
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KeX5BfcX6vNByzVdG2gumkgs
 oVp1IkdZbk816xn3kj0=; b=Ei40aiV4UwtrEMsNMl4mHo2xpKBlXKccPSZDFMa+
 I1LzYWIq1GkHLezukjJyHX3XDUMhDT13hthskw2QHDQ25Iz+dCSKf4z6UtDkRv00
 vkW/q0cAI/c9tCIuiHWk1JRC++G3Gw5mXUFNKo1xqHmmoJ0+zaJEy6hOW+/0WhIx
 OFbXEQpqLhv/HPtPxPYmFW3Ueov0bl6ddTAPMMkcyuh5FsiQG+lFaY00zSLG56X+
 L1Pw2LUx/cfN8NuwI2HVozGDDhVcU2ZKktoQt8rlgQL6DWd5YHUnFFZjn+A3Ekkc
 vb9t06A/I7NKqPg4Mzl25qf57ga2KgFKhN8pif8ggsS3JQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1jyp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:37:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6855557aso143226861cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766558221; x=1767163021;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KeX5BfcX6vNByzVdG2gumkgsoVp1IkdZbk816xn3kj0=;
 b=ba5hebhaw/+nHmlQTI91VlZeNI3Q/dVV/GA4ELiQjrqhZdl1HZBWDe0mHa6jtDkzPy
 EIbyhYGUdFzaEoJMMk71FM/tUNupMl/OH1mSHVzKC+5apJrzSKoVNSg8Hi2ZJTHW/+Wn
 3tnOBPDkU86Qgr+m64y3jGPnw0j7Efbh+EpoCUL+Wko1mLrlOUv2ISx3uCb3rw6lgRWv
 hmEIxb9cNCtXQm9Q8RiNWG0BJLnbW+sS2a0V4OK5+F/2/5btEeEcLtzAVEFLi9NeFd85
 Gm2G6UUMMH2lnFwTfRRD6zo4RRxZHlaakKmDJmxXYDWEmS6zjVntLCg1EPEw4FZ4Y8hm
 6fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766558221; x=1767163021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KeX5BfcX6vNByzVdG2gumkgsoVp1IkdZbk816xn3kj0=;
 b=KYIU6wBl/FGyBPntMjEhODJ/RBu1qjmNsNW1nqcDDci5LMWNW5aWIvMFnVraCRG70A
 jq+DwdGD9XjYD9xAAsGGxuoeMvdPDHAKMJLCJ7AGFuzdTOcVqKI/RVbtIt7ziYIJmS0S
 z6Qi6Vnefj+8REdYHmQ2OhxZNixxWlDCHzWP1L7MgtbAcsqWz4F9fh7HT6tT8BkNuyXG
 0lyZMhE6J9tjm7zLQJ0yYUTu8A42yIUyZN8Bo6OFEzpxTJkLEFydxADmQGTfOXAxcsIJ
 T+//8gW0feh98lSaBeTdxAE3UMbuZVnLGeeqQRiRo/xhc9LGQJqGe77Zuch0Vvoi7/Am
 2zkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqyx0280AWlM6+TVjssxCKpOYr/ZGs7f7Wd/8TbQGDQplkkQpW9UrLPvJYgbu9m83oF1DOCaPnoAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWGpUrjr0z51/C2ZYofXHRvpxeqimoT+2FVp8tk2HQheU/jdWw
 GtxBypl0Zlf7kHDqTsf+/7YGUWGZEAbMQ/T4oqE4F86iVRBchzRnoRdrTqvuwa8h5eHe4sEWTpV
 ZCJqxm2XyGHbkeBE9p6mQvEzGEH1+NbZ0iNDQD3kkIrSxcTdT1PGWNHiRzvtS5BRooWr/CPE=
X-Gm-Gg: AY/fxX7r9WgW6SvhAed94KMOQTppgqsFHTjDx35M/WRATvn6hLz16uXTqa934jEws12
 6sXdhUJpfMXjpt32YA0QTK7D6LvtFYoD3Q6zEgOMD/6w9cmZZ52yiwj5p7pinpDNkQIUJvzqTBf
 L4rBHa63D3cfFJq8Pz7n1E2i950rjDjjWHm2F9O0Kdk/cjgXuTCCqgxiZF8WTC3x0iLHQ6AsH9j
 fkijzjWqUMkUPLj/jjK59Wth0UKlnXcEYEkKBcLP83xvWuKVIuQEui9S7PIC/eeyBmUhqLAdStm
 q3X/pRytczy2NXkXX8iO9klU+40qp3PqKQhqzQ0d0I3XUcA8eO4352N6ccCIg/YEFs1NdO/fIOR
 5eZD9TRMcz94qAQPjTk0Q/OdETsxkOxt6I4j46I/vD98e6LfDYP+jLJ4BXtMULSemnzbBjtB7ht
 Ueqw+vLbV+oytkWMftTmXFmIE=
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id
 d75a77b69052e-4f35f3b7549mr296548041cf.14.1766558221388; 
 Tue, 23 Dec 2025 22:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfpClwcc9VlLbybjSbaNc7rAMagT1DfPo4Txy+E3PjiFL8vV/x6N/mNkuPkqXE1VP6sSd9Dw==
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id
 d75a77b69052e-4f35f3b7549mr296547861cf.14.1766558221023; 
 Tue, 23 Dec 2025 22:37:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618d85sm4591957e87.48.2025.12.23.22.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:37:00 -0800 (PST)
Date: Wed, 24 Dec 2025 08:36:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <bfuds7xrlgril2r2y3hysmvrboobietm5garm5q6t4gy36jvuq@qyosxqib3nv3>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-2-quic_amakhija@quicinc.com>
 <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NSBTYWx0ZWRfX7GZiziFvUquZ
 ks6ghZ1FPkYTh6QQOo5Df7hAunfEMbez6tp9I6j5G2lU4GZMpSkRiUrfQLGgD0b32sGYkJHdBDT
 +3sFmJaENicTo1Gg7xyFCjrvConXW6JlGzRnZuyHmUWbGtFsZNGmzF2ChvsQHMxudwLY4EpVsoB
 Ele4u8x/81/Ms08FervcfhFURI+TuXtKqYnvR7yjgURyGaGPGQdKibpwxvLYQnSLlHp+IxvT9BV
 7N0TGjRkqcqBYZwkzhacIagO/toALHBcZqsXk/VEr7RBxYG3gEDNTLA+yEdT6rnlqrpHAh5GY/O
 VfyjtkxJ/8ialCtyv4BBAqz9/rY+5NuN5d1YnlLeVKV5OSMhrmOZ0iBPDn0priCFby0bNK51DHQ
 qJlW76qCM6xUutjWxHt81CEUllzkpAGUA3zeHiuDeyeWpFX2EDQLzo5OfhdJOlkTpRPVVGasNpC
 uW2FMpHu29Y3CCypl6w==
X-Proofpoint-ORIG-GUID: -upsXW8VbAvZ3AJ7SSpUWzL-jrn3dqD8
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b8a0e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=n9dR2hj5eY1oDD93YXEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -upsXW8VbAvZ3AJ7SSpUWzL-jrn3dqD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240055
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

On Tue, Nov 25, 2025 at 10:31:42AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 07:02:58AM +0530, Ayushi Makhija wrote:
> > Document the DSI PHY on the QCS8300 Platform.
> 
> Explain the hardware, so your diff would be justified. Instead of
> stating obvious or copying the subject, say something useful. Why this
> is compatible with different platforms?

Ayushi, any updates?

-- 
With best wishes
Dmitry
