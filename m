Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D57AAA3B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCE10E611;
	Mon,  5 May 2025 23:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy84eHsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAFF10E611
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 23:19:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTu3t016522
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 23:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 egliTNxrRWezR2u6nVEeNELYig/MxmMlQ01oFG+bL58=; b=oy84eHsyzw4cIS4t
 IbPIQBGACmEjACW5IsGawddvbVqI3FFn1seYPXHPptK9aK0cX84nidWwqwuonHVD
 yMve+Sosb0N8+Kfh2UNdHWK86ZhqRJj6oV9VqndrIEsP3x/GNOmkWWnAPMNzuH/M
 AL8M9xwo2k9cIRvghPBeEu7PVTNlMQxSfEwWTiNI2bCxvMvpwNuQPvNOvlYEyd/5
 cGSBjVDx1pdRIbUsQdwNKnTg5KCFk/BNC2V88A+4EvHfFb1QPy/4vEBaG/gFNYjz
 Bjm5J54h3/Jf3v/q59zx4SzPLVXtb9msx0BQ+irCq8F0p31wiIOXflDDOiJR/kDL
 D9rRGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsv0h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 23:19:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22650077995so74141075ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 16:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746487139; x=1747091939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=egliTNxrRWezR2u6nVEeNELYig/MxmMlQ01oFG+bL58=;
 b=ihgJEQuB5TiIjTe2EYuqiym34L+Q4VGkPh89TzaPOHwFH+IufRTV8yrN+HtK9iY/qo
 dX1vr1+EWitPO66Yo2Ur1VvNeMNG+zPwPRvkGLWytrTLgpHG2Wb02ggNEITubOGYpK/g
 9MSRPX7cYH+9+8/xDlfrpsQv5BvoQ7e0ge8BOWYdiH4TQdQBYavPHpV+ysLKW3lE3YWL
 k55g70vpfV868BSfBSG8/OWzOmk+QnehSUVR5TD6CGCSwNo7MpJGVbobYT8Ya/p+vMXl
 9ubTJI4GvJMfJUHY9lqZaUpS311prLpA3X+Fa11FwlJBtLdK8dc7LKAJRJO1Q0VZ7sJZ
 V3og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzW6n52XlD6v8RcA0T+k0f2xeW4cXeYdZ7lhVC3SsN6sbrx9OhDRqF50yx09qigqu1A7pKMwHXV6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuRoouuUJNIoknHqJiLNsl9WnhChfWanfXkcElKYlBCrOwWNXF
 /ND6LTNyjGUNe+J/v/Etet/F9QCZfKtWd1bADLf9fQAg7ixgk68iF+sumkMn9N5RE/XrAAlKGPP
 2SA7eyy8KdXI4w9It91iRN6QMrvkqhmvGnNEUVnIls3CnP/QYIIAr3Tlli43s3ntTQg==
X-Gm-Gg: ASbGnctWKR18q2q/Shya5keZQsjYuRj8XdwsWl+BMAu0z1K/AfffmoFys1W8HqTR+0y
 /6wuDHEh+cLBucSW0rrY8y5vQHSD0sSKgPI5XdNdGQyxSelQajlSlBCDiUT/ws8vjA4kGKWooMu
 ooLjct8pf2K2b4H3dnmQZykySnorVpFbhG7QUFM+I/+8nY5nTQ/tXah41TLYDF4GlGOhVh+y6NM
 QmBs6uwlihuhZro0uKs7FrkqgBDVcUa4Eps1Tfz00t3zIfm0pY3qrLzq8o/kxmsy0Ve/h1PVDL8
 F+Nsox5SdNEROdNQDcXmYCQxif7OHjelBrxbnxtYI2e6zf3EnrmVtDBYJwXHGkcYWxl7o6owjEv
 hjD5UbzvGyA==
X-Received: by 2002:a17:903:11ce:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22e35fa48edmr11374065ad.2.1746487138861; 
 Mon, 05 May 2025 16:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdqr8QmR5hHl03YHuIdiZ5XDPvQLzJ8NRfBgcXvm6h4rkFqPZiU9iHtAyIKS5UBK5d6Ay3DA==
X-Received: by 2002:a17:903:11ce:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22e35fa48edmr11373785ad.2.1746487138404; 
 Mon, 05 May 2025 16:18:58 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1521fb3esm60612335ad.121.2025.05.05.16.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 16:18:57 -0700 (PDT)
Message-ID: <2a0df02a-1657-4b59-8f31-791a8aff523e@oss.qualcomm.com>
Date: Tue, 6 May 2025 09:18:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
To: Kuldeep Singh <quic_kuldsing@quicinc.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
 <246da659-2add-4ccf-b914-f737fb93f3f2@quicinc.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <246da659-2add-4ccf-b914-f737fb93f3f2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DhiLGRFt-PJRxPScGUfi8PMJJNnj-nVX
X-Proofpoint-ORIG-GUID: DhiLGRFt-PJRxPScGUfi8PMJJNnj-nVX
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68194764 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=S5yCOARCkap2nlZrFcEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDIyMCBTYWx0ZWRfX1I0GE1A34Xw8
 Z/9vqC7YT8p5tUUUa+UA5NHjt+bZO5ELNP7r0XOl+nq84iPebs83B4PbFx/wHJl92c/PVVwc2Qt
 W938/pswkEi9mcT7gqq0RzYy+TEqSXDfMYKUS0b0uOMT8yI/+xp5FjB1dcKyeru0FHU2dSa+FPu
 jv1SetoUkugwFp2puG4XIQgeNLwZiQRLam6YXwaydsIF6BGYad2YRgn7foiu8to78yOoY4PnOWQ
 3nhvPfGtsiCPRtlwHhmHBwp8qvp0mG/0opeYxK+mA10HDnr5Tlx7Mh/VyB5/IM66UIa8vogE4mj
 24PFSz0sRnTTxbsSYCVNnJM0KZSLjYHY37iPZj6qp8h6cpFq3Uu/BxW6MIDQF4psTdUDhSOMyHW
 PwbxlniHT36Fv0kMZmw1pOpxs/6CzgfWpgObt9Twb0iH6OMmIOw6Nn0mEj3dJh8TAKvbcfJ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_10,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050220
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



On 5/5/2025 8:58 PM, Kuldeep Singh wrote:
> 
> 
> On 4/29/2025 11:36 AM, Amirreza Zarrabi wrote:
>> shm_bridge create/delete functions always use the scm device.
>> There is no need to pass it as an argument.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> 
> There are 2 type of APIs exposed by tzmem driver for pool creation.
> devm_qcom_tzmem_pool_new and qcom_tzmem_pool_new.
> 
> Device managed pool is created with devm_qcom_tzmem_pool_new but
> currently qcom_scm is using it's own dev to create/delete bridge which
> is problamatic here.
> 
> https://elixir.bootlin.com/linux/v6.14.5/source/drivers/firmware/qcom/qcom_scm.c#L1653
> 
> If pool is device managed, same dev should be used in qcom_scm to
> create/delete bridge rather than using qcom_scm dev.
> The dev passed as an argument to function should be used instead of
> __scm->dev.
> https://elixir.bootlin.com/linux/v6.14.5/source/drivers/firmware/qcom/qcom_scm.c#L1634
> 
> To summarize, I believe correct solution should be to pass corresponding
> dev to bridge create/delete APIs instead of always assuming to be
> qcom_scm dev for devm_qcom_tzmem_pool_new scenarios.
> For qcom_tzmem_pool_new, qcom_scm/qcom_tzmem_dev can be used.
> 
> Bartosz/Amirreza, please share your thoughts as well.
> 

It is not true.
Why should shmbridge need to have access to random devices, while the resources
are obtained from the scm device, if any?

- Amir
