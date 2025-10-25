Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AAFC085EA
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 02:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670FA10E0B8;
	Sat, 25 Oct 2025 00:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEhTKRze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808C310E0B8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 00:07:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9Foa026903
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 00:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UxyvSi4QpSo8V/FgajmmnszDW4zbH8JRzeB/hvknSy8=; b=JEhTKRzeRgX5u8VZ
 aLZoC2grfy4mWvkIrHxm9Zn+NLYYcYYUUXVgSFYl4mBV2H6hpwjXZ5bJfZGn1nOo
 YEJOG2X03djFpnFhCTCckHtTcokHZarv/rjCM1KZybasMdtDwt+HkYv1k1UA09kM
 IhP5jDsT0aytwqbamjENBjNx6y7NCI6T1zVXJ7DQEQ3iLWvUBogTsmsI8NEiyNQJ
 utXVID3Un2Nej++byn8SwUHSwXswPfVH3B1sX1iKokgZJKw5i5CEvPVmeNBUQ4gC
 4KDcIQlcEtl5kSPkehUeNFE08hQQwMBULEc/xv+LHY9T9t0VvQql/zHpIBNJZ1nv
 A1CaGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0uhge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 00:07:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-290bd7c835dso27191065ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 17:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761350844; x=1761955644;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxyvSi4QpSo8V/FgajmmnszDW4zbH8JRzeB/hvknSy8=;
 b=bek85DIDla/DOY0ksc/M2uaNK43MTrWttZuBfXoLpdve1hx7ZjEZlxx+hvQ3RJ9/5/
 NGqxucqS5oyvTYMJNsQB9xMPTL/uKS+cR3wZHSyfLGbF5FmE912Jytq3HjfBUVYaCRXb
 WEkIwCuoyOgCGxVMBQ7Em9HOlemhzrtmSvD9/+HNbCa6089M2vkzjeYHdTvqtzK3Aqch
 LqFtThCfwGrMRCATl8xqmjg/7xMtUky+JonVp1uGTxHTVrpqJN2V5RtRghQ2Ljhgrwfb
 pWyq+1X2N1yRUO/7BFcV/4nADDmd12oWRCgiuvqjAEEroamY2rnXgO037HIDVknLjIAf
 ZQzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKr3/JS0cmSF14dRAlHkbmMw8kRYs6FMxK/ScQBSoj1KRUKK9yWvnuXvPKy0SUdMZYdvkFMDmkFJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykTSn3lhMQm0jWf0+1enAbNNzgATeJ5vMOEPaqTT/t5AeRyqHP
 /RPHIcaOLLKOR3dWyIote63nuHYClp89hOSoxDYYWgUEdCwfeFjQYO2Yfw65MYcIAcXGaYGaHZX
 fenPHAvaLGiUKghsjyvvB+NBkLISes7mDYnBWIIExlSi20bHgWb08qjEtKdTYy2PoPOL7FZE=
X-Gm-Gg: ASbGncu/3upuinhK6/u2Lsoca3UpBaQl5R//tFPs1LTVpMPv06utkBahATVT2VueQTq
 dpoucsbZ92oe5VdwtfYPq1i4AIN+8MjxxSI5A4EaO5o1g6OqIRRSOClY787NUAI+/aYAUqcCpP2
 JiK/L728p0L3leVLvVnTjSlllPNLuacix6YQw3t0Un+UbhGBp0ImATxRy27T5Owvf/p9AiOhyDQ
 3zVfMyQu19K2OajvkYvLc87VcCK6AQOpc2HpKpViB1SONnVcNxhjEFEOnmYB6pCx1ViCYQgy2LU
 jIrVJJNjZ7P2VIcqVtuuaRDO0IyhAuwMwWLlFbSlZo6riAAUZeAd/87c0bRLp2kQOFtYmRIrjGS
 MCXgkYqOAjnO/x0y7c0J/sIQSh9KZx/JOF6CkgOl7MsQAlUCe4zskWJuTzKOZeg==
X-Received: by 2002:a17:902:ce8d:b0:269:9a71:dc4a with SMTP id
 d9443c01a7336-290caf850a6mr375637605ad.41.1761350843920; 
 Fri, 24 Oct 2025 17:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoeC3hlRnAYs7LFyOMX2WlNknnmZsnRvIsHZ/Ntsi+EQK2pCxu96m+tEh/bZBQIS7atunLeQ==
X-Received: by 2002:a17:902:ce8d:b0:269:9a71:dc4a with SMTP id
 d9443c01a7336-290caf850a6mr375637305ad.41.1761350843413; 
 Fri, 24 Oct 2025 17:07:23 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d4287bsm4568455ad.80.2025.10.24.17.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 17:07:23 -0700 (PDT)
Message-ID: <0ba75ea8-3a06-45e6-9f31-49085826c112@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:07:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
 <20251024164630.816862-2-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251024164630.816862-2-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXx7qw6CcFWKqg
 +bvV3dbJqkpMOoIdtcmEeo/JE/P1lz9p6HwZestzpTL9SqAZaM4Uz2x/S/G/ifaiqUKNL3FqkDA
 UsAOdJqniutgYTRfnanUweuFLGKb2+dR/izLY+GEOMHHp1/gB/jlypPCvaqmN6YS4p25TCrNDft
 A8Uo+7pFilQTD5ynFQQ0QdZ984UaUaaG6OXHumRUm7aVuN6ESRAVz2GgUEx7Gg6elieB3M9SKwH
 X+jJ/lfVsXwHlxmBQrNY+PvLyIO34G18LkqX9qay0f7GqNtqIqq0XTZ0Qdqwi+tCluJDXr5cyiC
 cv6Y0fNNk3idMaYOmwoKzx5sgBS6q94o/uqa5r8Mg2I6AYsvSp86jSxXOmD/+drjZ0FWaT2DDgI
 PyacnitwBuqcEUHX6RIFo6FiD0El7Q==
X-Proofpoint-ORIG-GUID: 8PDTuIa5xRVf4GQ_R47LE05oJocRcaBV
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fc14bd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lH6b5Et66ViyYC0xzU8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8PDTuIa5xRVf4GQ_R47LE05oJocRcaBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

On 10/24/2025 9:46 AM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Expose sysfs files for each DBC representing the current state of that DBC.
> For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,
> 
> /sys/class/accel/accel0/dbc0_state
> 
> Following are the states and their corresponding values,
> DBC_STATE_IDLE (0)
> DBC_STATE_ASSIGNED (1)
> DBC_STATE_BEFORE_SHUTDOWN (2)
> DBC_STATE_AFTER_SHUTDOWN (3)
> DBC_STATE_BEFORE_POWER_UP (4)
> DBC_STATE_AFTER_POWER_UP (5)
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

wrt snprintf->scnprintf change - this feels like a hack around the gcc
check and not addressing the warning (i.e. check the return value of
s(c)nprintf).

While still hacky it seems like all that's needed to avoid the warning is
to have the return value written to a variable rather than just dropped.
If the value is being saved we might as well check it, especially if
userspace is expecting the full explicit name of the sysfs node. Nevermind
that the value should never be more than 16, if it's truncating something
is very wrong.

I could have missed if this is the Standard Way of resolving this warning,
but this didn't seem right.

-Carl V.
