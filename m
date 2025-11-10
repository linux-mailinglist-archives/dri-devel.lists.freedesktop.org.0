Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1EBC4975D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 22:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24810E09F;
	Mon, 10 Nov 2025 21:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSyFxxxQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kk9SK4xd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F14610E09F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 21:56:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFPw724071288
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 21:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HVzpJnOu8qlzWxb31lw2UdzGclobAcdGiMa8rZnaHHQ=; b=FSyFxxxQfo5UZvu+
 O7AxvEKICwnx1g/06XMJyfT8LqJLC7nDuBBmgBmd1K+aebpnihAAWy3wm37VVvcY
 2Y08fPZUA7OKLnkD5SjX9VZ60Y5Ip4Yhdvv5XXqpBgs10FmLgkzST6GgoUMUZLkC
 GDqNI9nCv6+7skSt7xA9MlZvdusz29Q/gxvHXJFs83107wUt/egJ1o0mHZJvTyhn
 jWp4nIiegh+yU1gGm5LMHOumIublRcA2dP7zvsXAYzJ3dKZoJ5EdgwUPujG0cvAy
 wv4Q+3PCfoFeoGJQsAxJcvI0Eao0zMh1epnC6FiEvI67LLbp1wpKVW6/nonunMeJ
 sOmOJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgs4wh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 21:56:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-297b35951b7so59375975ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 13:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762811773; x=1763416573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HVzpJnOu8qlzWxb31lw2UdzGclobAcdGiMa8rZnaHHQ=;
 b=kk9SK4xdtymL/fvTHuyZVbmopijedEhDEu6lQFqWIU3Ny8vru9ATOZNYeVM78pkQ+4
 KoA9/mSCO9VE0DLQ3iwAQvyodmClf0H/h/LKG419kVUwcu8JLgRofiJTgNf9Z30J8m4C
 gHNUQx9CfOnM+YBZue/f08vgWNB1lWBG9JqqkURXjH9N9M4YcMLW4m4kna66EnrCX7GN
 OrhztipQYdGAoQRN1HiB7FFkr8EziExic+QgwY2XhxXOkob43kTd7TwXhy154pWPA4nT
 gJAE10oZGX/JrcB1+T3B7G+yF7E5CRmPKJ7TAskAJJl4tw/lv/bWuSj/tg/uutMv0IzE
 ofJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762811773; x=1763416573;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HVzpJnOu8qlzWxb31lw2UdzGclobAcdGiMa8rZnaHHQ=;
 b=u+d7U7JrbCjY/HN1yiTDWqf64UJclqceamRXF3XMcSid1dug88Mb9rJnxlXD43e4Yg
 5XF7IBC9cs2kkfUthYGQqCMV00zq3DC6uAktRPwh6I97wMNxBFazampxoVfuxNEdosS+
 fCyZVmW+8T/jTS9Vl6gVfMNz5wd3z5t+ZOdzQzd92r6XsIbh1l128v2g5O/HPQJWJ8B/
 UFlYJaxY2CxeehxAWsBrYI3RzBlI9hw+TE8KxJaVjmsuIfDObL8iE6DVDF2jH/QqcNj/
 02lqi+7AQm5p6dgEiIM7/Kl484biAJTcM7K+mPSOpd2RqAY2VYm6IfhDfzli9PMNAAz0
 CBXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4amYC69cr3V754Ez3XkubZMKcriwdA89+6L7D+xYWVyCSMTsVBypUcuzjtvHMcsGd6oNVKlxh8KU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOIut2lA5yCSoOrcDmIU1kNqlnrjZOvj4O1bulI/HLDyY4QP+e
 DsPzsywpVM+a7Q6mHWqvVInvHUQRDoDO9auOOxw5wgIwksWHUFr6CLwtk3iLA1ZgX4tQrCl7oLJ
 QPwkIQA+7HzZzclEw90tP1sGVKWOyKNKa+Cuk7kVrtPWApFwicrLJ1IJxMb6ByXROim2lZA8=
X-Gm-Gg: ASbGnctVzP1drzB2jOj399ueqcqubgYwAbl7GPfiZY/Z3AQPvNedEz9fOthmYc56IhR
 tYhFZasSTF0YHO3RSFqBuxlqcYWPEJJJn85ryjtU9HmoD7Vpa6y4xfsJr8wfA118uAOxjzSs2X9
 sMy1GqaGTTnaj8mf1TrZoa7ydIOpzZAf2WOFGQIcULG3YUJYpanebfjwxZ7nOgNJWNzPOvCnIyb
 K4f9uMJf25Cbex22IXRj9zUEyKndZcfTfLyJbBllu2a6ToxrrkjvLl1vjzEntd683hWL0a8BQiO
 FbLtedUjgBTmwsHdDqBITlDYS2oRW9cXiIJPla1bOi/lt138Y4u5TIk0s4ZDdF0E6eUlLJuN8jc
 /wuhO2kdAADdyfQv5fdC+fUp5sk8SrF/hIxrxmSCRlcXwjOoiR+Vz
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id
 d9443c01a7336-297e540dbf8mr119018695ad.6.1762811773291; 
 Mon, 10 Nov 2025 13:56:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJz1FxgkaYCgwsCACY9rd9PpdJD5YgwnReoVj/md8159Dmv3H/XV3LqN2vti//V++K3E5rsA==
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id
 d9443c01a7336-297e540dbf8mr119018315ad.6.1762811772804; 
 Mon, 10 Nov 2025 13:56:12 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc866319sm12832672b3a.54.2025.11.10.13.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 13:56:12 -0800 (PST)
Message-ID: <e6c4eaf8-1484-41ab-a37b-047ef2484e30@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 14:56:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE4NiBTYWx0ZWRfXyWAatp+G8r/4
 zv5Up9zCIOkAIRBfeWZfCkh1MWXiBh1Qy9CaaqD6OOUfLpgZ7h4ucJAOfCIUaDRfW6eyajwPYOB
 kjKBfYd+HLQg/30kWxQtqrHXTfqAb8hkYKjzb+0nPQmJMsfpuibAEZrZSMjXdpfp7cPKEg/MWWw
 GVb0fD72WwEu9THaauDpdFhiAeV2LlCBAnTaudVvZZ4D/L9opwUfqT9jFTcI9xDiGKQbw5yBfh9
 TuCKRWnqQKTeoJ/D3mW4GFSUlxEzGm0P1DbRihk3e4rY/hGgnYs4+6PX0fYydrGC77dVmo54jV5
 4evjbZ/ER15PYhBlk8K8a2gVqkEOdIcuDyjNVOM+FeJ0nj7DQ2BFEjPh4Jw59zYPSLs9us+Ur8Y
 1jvWDNhFUTP5da+bWf2j+0qpojm7rw==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=69125f7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=wQdz1tM6fslYZEmrDPIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: e3zOys59e_9NKPYFQPl2oEU_8r9p-pbA
X-Proofpoint-ORIG-GUID: e3zOys59e_9NKPYFQPl2oEU_8r9p-pbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100186
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

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are two documentation (indentation) fixes for accel/qaic as reported in
> linux-next ([1], [2]).
> 
> Enjoy!
> 
> [1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> [2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>    accel/qaic: Separate DBC_STATE_* definition list
>    accel/qaic: Format DBC states table in sysfs ABI documentation
> 
>   Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
>   Documentation/accel/qaic/aic100.rst        |  1 +
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> 
> base-commit: a2b0c33e9423cd06133304e2f81c713849059b10

Pushed to drm-misc-next.

-Jeff
