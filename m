Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAFC3516C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B67110E280;
	Wed,  5 Nov 2025 10:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="prQuvqIY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jc+f1/LH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA59510E280
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 10:28:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A58F3gh3089614
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 10:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=; b=prQuvqIY2Amv7BYe
 cVEn7aZ5txx5vMjo3H/OZ/QYLOQJ2/BvymOuzcAhAesQg0BHcCGsi+dwuKsaQEoQ
 Cw2/QjIyobAfPE1576rdNBI3vH80JpvwLnh/MbqSFlNezHVsM49NhGfxqY0ILA0R
 vq/lGyY5bKiJAhO7d7ZhcXzuePYzfFN6ItFouYOAWskDar0pK7WMSu5CUUrfYTXx
 ouZfweq0n+i0bBRooAwE6KKrakOgnJmryOeMjZhVRLi/d9b3N+ivB72jD3BK3Tjk
 1up7kXC4a9WZK4t10QVgChHcl7jXXLSItX7jY8tgN4ZyVMGKVngGOMrodpi72iNl
 kFK+1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5ea0x5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 10:28:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3418ad76063so1702722a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762338515; x=1762943315;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=;
 b=jc+f1/LHXje7rBvLwelK0L5w46YszHUmYrIbWVZq6PvME8zs0Hr6EG8d1YyZEEjsJA
 Ubczwp3L26Y0DhJAmdYm+Ri5qZirHPBpRYQYAR8ia7p851uMSpl30KGWolTq/Y89MZvd
 lBX/Vtoh5QvqMPXSYmjJ4mLgNgZITiMkTpV32rPbxL7LlagYOfabYCN3PxU+jv+Tm5Uf
 9sdd6xJaE29HuZ+hQJqxZdogMOFcCjASDHqEwPkfBTgVbbVC0FmzjRiWPWtlkOZmKSZC
 xYw53+m4S9SVmSAckX0fIRCuMsFBaX7eJk6RmTg+y9n0i+3Rxj3l8SKL1fiKVn8tEodU
 8gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762338515; x=1762943315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=;
 b=pF3ANYLeMGDniZKgvucD0UZw+2rMwRFeawsjK75S2TQYr3N/dsWmF6rOGehbCPw9F7
 ZrZ6ikZ7zTreVIGckAXD+S3ujXNguDSiyKx99HTU2c24yDOB0yRsW3zfcUCaI29g2cZ9
 6Kco+QkbNcfsPvzpN8lZAOVysdR6/gE9QAHmQHrNLLK0K6k9hzIWr2BaepPPFRtBa2Gj
 4ijugJsTv8mzz0wChf8YbMSoQQCWeS9Ilbfoed9FdTTR3nA9epIoucs5o24GYEGABr4b
 +n2WyOYAwS3BaT0WSf91/Ymhaaw6Oas2FflpHKMGvYa7P5kHVG3AWF9uD4YNfUFkjPYF
 9j5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwTpZWN+ASbKPYuXypijhMIgVci9ALywXuNqS/237WPI/0f84qaQsutqePehG85tKeya9mBy5QRA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzem6jvYnCsveG2+tc2VV95jkP9+Sjs6iBhIOwJMtnatkJl8JUF
 bQqTABXskVDLbX2pPfAiSbkVTousnVeDXUlVQDlelePtGneYtZa4fxi88qzadZgKuiEzT/Q7iFE
 LrSjLPpjdbxUFd3QyVtapU+rb9GQJvU9Q9UoSbT99dWgMrVyAAkMaaVZTqEymipQ82e/g2VY=
X-Gm-Gg: ASbGncvTunxeOpp3MBYYE3li/hU5J8CrHDT5YuefskYOkEaqcgl/BJYQC1AhmWfRENb
 SnHfq9xbOse4wqBIFGLEDg8jHjAbMaBluuPqoDsZBstIGNmeL1tEcHP9ggM3ugLLF9PQWj8Nfoj
 TTNIsz68IH3WS0U1nlIFB4teNp8kADt49eRsBi+oqOTq0C4QCc8jMWG3jdaTT4c6X9Ij5yoDv4Y
 +4L5Ez1IRWZB2vn7ths94Iz22mcNyIQPpZtpwncIV2Z3/DvPygXwnIYGdCGWdY75sI/J1vTFNjC
 PfDCTLp05LEjDlmAJXUIxiBAJJnUWnNMuXg9aMSZOHPogDhWGngwHYQ0O85uL2M0pS3g7DOX1UJ
 5DJSr9/GFFqX5zd1fjU8AjDDEuEQ9ejqN/Q==
X-Received: by 2002:a17:90b:2e04:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-341a6bfbc5cmr2752083a91.3.1762338515043; 
 Wed, 05 Nov 2025 02:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0nab8d2/HqREAsJ22farB7T8O/NtwdkVq1ttqTloYL9Mn4A21uAb5ZKhKlMroMgSfVGcy9g==
X-Received: by 2002:a17:90b:2e04:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-341a6bfbc5cmr2752065a91.3.1762338514552; 
 Wed, 05 Nov 2025 02:28:34 -0800 (PST)
Received: from [10.217.219.207] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd324680asm5909209b3a.1.2025.11.05.02.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 02:28:34 -0800 (PST)
Message-ID: <77031db5-a94e-49c3-b48f-5f7a5569d1a2@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:58:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
 <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -byi2t5hqT6gw472H7qhrY1PqG2ryq-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NyBTYWx0ZWRfX0mQiF+quhn8s
 wLcj/V4/idnlMpiAS91EX+k4RqheiQnZ9DIK+E6DPgNq21vULw6fHI76ZT1UJJuZTBDcJ3ejZ8c
 JKFclc6xzr0/y/RU/STpN7zWSPl3Eepw6brENdgDhF6jGpWb0bZgtzXcx1AMWM/lIJLDbjTTuQ7
 9BjOj/JGVbeYyjswL7V1RWeyxN4GLyLBJMqC+OQ4rJCxabIx1QBwIzz9uHcX+z9o/ekviojuBBr
 aytqMAfdZdaU0VMdOKmBI90x+pzqMB5t1ALlaiisjvyNgpaXB5KLVFhRPZ0K5FkvkwonnILlR+4
 VoYoYevYRIEWxAt+BiX9zZhoeZ8WBnT71JFMYnFuR7yTeErNePpcwWKelWiNekEZ9tbHwO9iHSX
 8iTHrKphby6UkzYXcUfC7mWQONHMNw==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b26d4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wCNI2q6YBtXYwDTL9A4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -byi2t5hqT6gw472H7qhrY1PqG2ryq-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050077
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



On 10/30/2025 2:56 PM, Konrad Dybcio wrote:
> On 10/29/25 7:07 PM, Neil Armstrong wrote:
>> The I2C Hub controller is a simpler GENI I2C variant that doesn't
>> support DMA at all, add a no_dma flag to make sure it nevers selects
>> the SE DMA mode with mappable 32bytes long transfers.
>>
>> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 43fdd89b8beb..bfb352b04902 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>>   	dma_addr_t dma_addr;
>>   	struct dma_chan *tx_c;
>>   	struct dma_chan *rx_c;
>> +	bool no_dma;
>>   	bool gpi_mode;
>>   	bool abort_done;
>>   };
>> @@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	size_t len = msg->len;
>>   	struct i2c_msg *cur;
>>   
>> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> +	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
> 
> Not a huge fan of putting the ternary operator here, but I don't
> mind that much either
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>>
> Konrad

