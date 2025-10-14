Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87515BDAA7D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA7810E662;
	Tue, 14 Oct 2025 16:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7XdHwuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D047810E662
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:40:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFWcXD008937
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L0X1wr4PjdOz54wdsgFu8dLkgUPA09PDK9CSgb0qWFI=; b=D7XdHwuzS68pqpMZ
 JzOzK+bJMyzCDMY3CBNEzntm68T55QiLofSuOcOoslL55iw0WQxYs0p5VFQp90Bt
 SW/hLSyF9hWKISWgPHj07KUmFFzlY40m3KPF0J65EMJyQwooScRn6cKQT+MOhVty
 Vk7QmddLqCH1gtOTOrCZzflJcRYgg9Ah5oeggTaNnglNIvL97CycWmpseRdX9KVh
 CxSrzo99hcl1ruGq7chWIvktE0DpOTA4PGMH9UQBWO12WrhzChPDHnc3jfNkQGaJ
 CJOb5Zb+tPK3WIoJVIo9E6G8Xn0ZFFrCXcOUizs2gLTfizHCY5CFbq4s/jhjDlZu
 Y9psoQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5hafe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:40:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-78102ba5966so8960451b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760460050; x=1761064850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L0X1wr4PjdOz54wdsgFu8dLkgUPA09PDK9CSgb0qWFI=;
 b=H6FaSg7Cm4LI3GG3ty/toICYcBjS9I5tmnyZ/CLa8QzjD/roIxeM/KM7P6AE+YyPAc
 x7Vc3iT4hEoyCSgrdqyQlInZBKdVfVse9unu1TQMPYb7vSSha4Eskir1UBRHBaHsdYxr
 4lanuYt8Hnn1Q6XgCp3ZjsCjDjJeXsU7DF5VFiSW21LN4Vuftz6YvVNQWIlg4L4J2Kv2
 4pMnCo4dfNMkKd7PFcbcet8IRXkzqtfxDVvQX5s3BpBtE5HIdk9AsZgwBGw64tLI2nzQ
 FNeENZX+OfMHYE4H4QraE957IpaHBigKQlvvNKLrXH1fCV2ueyXCuQvhYIlTdJWuIj1h
 P64w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSPj3GrMz4cE5qQeJXAfpQpglndrv3Tj2JI0jLUYLOMQOojxXjwYmo3UO3XFrxpRrv3A3VyEPsujA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjnvW6t+FX2MEGYLYCkypyr98/qZbWv9pI0NjdSmiQfQBbo7c3
 1cJhqq4+nUf1jVsFOuJzjnbyfeZU8Svv9ZNy+3LipKZ8fW22fTM8zWL5vVZ4GDdZSQLKMGwRAs1
 qj2Y7PSThpJ7O+br2DonTTia1EZq3gIg04V2LoWB7p9U0sXYJbpEoOe3+5YfsDQRVOSdzv3Y=
X-Gm-Gg: ASbGnctf7dRzvQO1O80UpV+sDzFajv9ExZR+WJbYYH05f4dNN1HluDqAs2EvvA9jBFE
 uCwNmEC0Ph8Ep6OAk5bEhDZAXdgJg5jiZ5MUWQ3HVAgDS4/zWg3lQ2bvvBGQwzQ4K1FqM5JPOrM
 aJWbBKOwmYV+Bie7PA0zeGxxyJ2idKmd2XmCPwivtAAPsjequxyXQIhQjMnug7B6cjB6m/cu7jH
 uyvxAmgMN+Z5aGB1v/02020FGAyU4dPHNMqigb9W+daebdSVYh/i8RLcIgJ3vIb6xNZZYzpcgUS
 XBcTEMCmKN6BIFcTAjfuApEmB39ZkKktUh/Is/9RKr3c02Cazf9e+5dJHeMDvrEI9dt8zbo9nyM
 /cbDsuRhJgfRW3A==
X-Received: by 2002:a05:6a00:c81:b0:781:c54:4d12 with SMTP id
 d2e1a72fcca58-79385703dd2mr30866776b3a.13.1760460049718; 
 Tue, 14 Oct 2025 09:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcyetGzL2Yb4joNdd3PSdMQfwJVPnWXMS4KLKelxJP4P+NUY2iNTrVM8cMUWX9Bru0mzVxBA==
X-Received: by 2002:a05:6a00:c81:b0:781:c54:4d12 with SMTP id
 d2e1a72fcca58-79385703dd2mr30866725b3a.13.1760460049111; 
 Tue, 14 Oct 2025 09:40:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d9992ddsm15568576b3a.80.2025.10.14.09.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 09:40:48 -0700 (PDT)
Message-ID: <a92dd15b-2423-4b08-a08f-757e30cc9ba2@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:40:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wpL1J0wrj9E0-a_Iw3SSMMwCZqo-Wrhc
X-Proofpoint-ORIG-GUID: wpL1J0wrj9E0-a_Iw3SSMMwCZqo-Wrhc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXyv+kWwNxLMi9
 ljkLCKc2MeIohfqUHP+w3GEVlQ1MVo6vUxRmrnwsD/A/dEHzkU9TR+kJu9mkdNkJE8qBnnzTz7V
 s1sEBNZERvplEhzNgnBUhumDSzoEAGFd++aQIF7r4NRNNWlO54LrPsKX3O8FsdsoLEn3VOvjyI7
 eiSO9yDP8G4J/GEHageDObZz4oIOLxqffxjbOPuZ+h4z7Yih8643+/avD9RZkReVVkS3cAfVwzB
 E387xV1HGIcKfHO9vbfQuruBJuw3cDWklIfrMzmDSCP7lnheMtLg5lmJT4r1MiZZO002rV9alV6
 MCHNQtb+DkMYiRQWX8U+D0kuwYsXa7bJ8ajxEjrbTWI63Nbd9yNNsl9iyUQifFf3edyP6ed2o9n
 ilpbM4slxxIL0kk42Pjp5QlrKgolTQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee7d12 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
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

On 10/7/2025 4:40 PM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.
> 
> Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
