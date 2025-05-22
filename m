Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A1AC0397
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE41710F003;
	Thu, 22 May 2025 04:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cO+IVJE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138AA10F003
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:54:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIuQdh027636
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l6FkrG6k+W3zvxIqBxpSgV4iSEkIee+9ZdOjiXIup3Q=; b=cO+IVJE2MSI/Wo1U
 32RInUR/RfurUJstEi482umF9c/vx0ttvQnRI1eSLCaLVFdu5wyY2GLuG5+6FPLL
 u+uFpCekfXDY7ZYhO1YZ6kg0A0vH2x3HMEVU7h4QfdVQwAcGHM+j3jqYRw241wHF
 8wboaCmz2Qky0RNNUZ5GGJTDGtGrZusmquf6+NPt54GjFixVYKYiWTgt1nhQU8d6
 sEqGQZYoXCnyfLcyP1LGA7y0HJR7LgHEkSSe57fmCvQ8VEeL9lL/00lRSfDkNVpY
 Y7Fa6Vzf5iY223z+cIF5C/R/JxrEWqut29DnDj8BzDV3LSjSlbUBh14+rFRgVb4Q
 kX91BA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9cyvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:54:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-742c03c0272so6268002b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 21:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747889655; x=1748494455;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l6FkrG6k+W3zvxIqBxpSgV4iSEkIee+9ZdOjiXIup3Q=;
 b=iv++rxqL39MHg0gHiFB5MVzfp0b4hwN/lyTrxvj97RUscr84C8wrab/dFTahEk2Dpe
 5r45NQ+S1yLUkTyH928URNCnbll+YMtI+NsASsHhkkw6jRYOWbA7qV6Iv+sAtTMH03RZ
 a1sh9Ri9VW62svMaOAikXnoJRg4xMoJz69Ewm1lHzd/qzXMSdkxT5DjpNnNOiZSva+Y8
 o7t8Ppcq4SBfObHDN+otOZkkf+oJWawtrlye3qGC8x97IPHu7Xj7b1QsE5ZRutqLr77J
 ojGHIJCkW19MNOendYiEjdcMbD1lGPHE3aI5OSTUs8VLE3eNqYcTSVKQfRThqvI//kVJ
 crNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuK2enh85cc7fZ4V0XkSh1lNcRV3psWdub/zmgfE128kZdjkTMD6JRdoBuQziIoFs9wPYMg8xGQsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZOqgo3KQxAVcT6XGaOKgDnhGpd3SS6Io5CW5+F9hyoo6/T02z
 +2QXUH6ksANu5D+y/O8ki01TXQ+dyxZZhgtH628cJCrek6gV9O8fkvet7SSq1uEjkGkfradtwWP
 YoumzFGseM9w/LinAcbgLK3SUNIGDjqNSkDstAhcMe4A78DDZJsQBP17aLw1DX5P/AyUd67A=
X-Gm-Gg: ASbGncvhyLzyeyk7ZibCBFKdIsjCQ1c/cboZgWu4XAdyZ6heYeUUtXYG1Ui4iDsA0GP
 cQkQaq07sd0/WmYbn5vS7iHYBdWvgxU7v3O2s480ivNw/HnliYMYIVkovDG9e4AlbliibK9xUDC
 8KFeEb64DwzIO2/Y2bHuoUBMMJj7O+jSiJJ6O7aCAyI1YkA/rOMXJQWUSp2Pe+zzmqdTF73ZOba
 M15M8KT1QV2/8LeKx27IqiGpRxz2P9cdqJcycFTDlbLQ5ByoTPF82OteJ70de4D1FPuYrNh5V4x
 uRiyCxXxBmGYC/325kIn+QS7/1eelcxTp5nWmgA=
X-Received: by 2002:a05:6a00:6f57:b0:73d:b1ff:c758 with SMTP id
 d2e1a72fcca58-742a98abbecmr32297532b3a.18.1747889655253; 
 Wed, 21 May 2025 21:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNsAtOqnn/3MNLht/RQCO5hiIii6DVVYiv8/dJ7UbVtfGi7DlO2EHF+VK4i/Xwj9WHK8z73A==
X-Received: by 2002:a05:6a00:6f57:b0:73d:b1ff:c758 with SMTP id
 d2e1a72fcca58-742a98abbecmr32297502b3a.18.1747889654846; 
 Wed, 21 May 2025 21:54:14 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96defa1sm10754798b3a.12.2025.05.21.21.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 21:54:14 -0700 (PDT)
Message-ID: <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:24:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
 <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3X_5Izm-O99VFsE3lCmGJiiwxNC4jwu_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NiBTYWx0ZWRfX8pG1i3figuGG
 Zd/HbVPQub0CE/Z3Hc9zHatP/P6t7SiZeWqruRzF2mtrjfJEdxkrnmObEml8wBbQRm2Np4vxHZE
 kKhV+WPBVF5kbQjNm3yPiyIJJ73B78c83cXiz84+GR8dLflE1Gf4o1nj76IxShegYHz6WBtY9eb
 3JOhiXCzlo1rbRaM5r3ruOw27RD/UlqW4mPLJdDYmyy4mruoYDd8mjcjLKTPCUcVresyCKbAvCv
 5VIPYA0ZPDo7SJHe8HYWXr9PjjHHDnjYauTUg37jWzuWpBgTrBzR9T229fSAbYw9ju0aBVuh3Vw
 OWN1GYqwz3kg1fM1b5p9CFGDELWFTCIHN29QDk4SxSpDcAEH/1TAwcf6MxYcEBDZdBehcwoEbRK
 NoJWKaU/PMgHXLiSR6VY0zUXOY8hEOYEf0JTLzZ+Mo3AOapMihWf9q4qqine9nb+aBSvlOk/
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682eadf8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QGv7k4z_AMq7-X7-KaQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3X_5Izm-O99VFsE3lCmGJiiwxNC4jwu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=971 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220046
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



On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>>>> Remote heap allocations are not organized in a maintainable manner,
>>>> leading to potential issues with memory management. As the remote
>>> Which issues? I think I have been asking this question previously.
>>> Please expand the commit message here.
>> This is mostly related to the memory clean-up and the other patch where
>> unmap request was added, I'll try to pull more details about the issue
>> scenario.
> Thanks.
>
>>>> heap allocations are maintained in fl mmaps list, the allocations
>>>> will go away if the audio daemon process is killed but there are
>>> What is audio daemon process?
>> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
>> attach to audio PD to fulfill it's memory and file operation requirements.
>>
>> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
>> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
>> daemon as it is required to take additional information and resources to audio PD
>> while attaching.
> I find it a little bit strange to see 'required' here, while we have
> working audio setup on all up platforms up to and including SM8750
> without any additional daemons. This is the primary reason for my
> question: what is it, why is it necessary, when is it necessary, etc.

This daemon is critical to facilitate dynamic loading and memory
requirement for audio PD(running on DSP for audio processing). Even
for audio testing on SM8750, I believe Alexey was enabling this daemon.

What is it?
- HLOS process to attached to audio PD to fulfill the requirements that
cannot be met by DSP alone(like file operations, memory etc.)

Why is it necessary?
- There are limitation on DSP for which the PD requirements needs to be
taken to HLOS. For example, DSP does not have it's own file system, so
any file operation request it PD(say for dynamic loading) needs to be
taken to HLOS(using listener/reverse calls) and is fulfilled there.
Similarly memory requirement is another example.

When is it necessary?
- When audio PD needs to perform any task that requires HLOS relying
operations like dynamic loading etc.

>

