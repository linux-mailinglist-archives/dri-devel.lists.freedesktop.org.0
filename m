Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85205BDA255
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F3110E62F;
	Tue, 14 Oct 2025 14:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSePEpHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5004E10E62F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:50:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Hxw005383
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qhXnSPGit+112GJEwZoQx6wccumTbJbB5TJl7XMtPAs=; b=MSePEpHjbJt0/l8f
 BDX9UEw3RAwelpea5nIx1jktZmcGQRzYqmrs3PsuTTFsGb4j1/WCl6TnITGjaAlF
 8YnRkK4ojTwP/KXrplkls8Yfs6wDxM5uYpFPK82AeBN7hsB6D4X0wq4ud274naWQ
 y2c8zggI6MRNyn+rUB13GmiYV/dBkfzQV3nDdT2RpzNo66MlowbAKjMgsg0yqo87
 AYXibXuaUTDKHXT5of1ubWR8Bs6XUzR3u8fm7g0N2pv8PQLBoGucCtFy9qi/CfpQ
 tJI7lMQiiuDK8HK2cP6RjwDuiAK+5FA80a7STY/2GdeUsJSD8CV+k7zrKJ7p4l0L
 Qw6cuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj0w0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:50:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29085106b99so857115ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760453443; x=1761058243;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qhXnSPGit+112GJEwZoQx6wccumTbJbB5TJl7XMtPAs=;
 b=rEE08J25Mpl4QJ2vE3cstxBTveP7A+gjYr40IszNpPKLD5WHrypGKx3r3xpaVMkCI8
 /vR21eSL8YyKHDWfm4gzlaOveY721ou2X70UQ059sh4HjMY4dBD++0x6aJ3QuQXrHACa
 rWulobeqsu8amWgX+mpFcDLChcbbPrPOqLIOe3wOvRpVHtYO38QBEAsHgNy3vr4UApd5
 IJC0A4F6VulpLubRYkuG6Q3vqK0gAuxJ0cgAu3VkcmL7xK6ywehw//kCrvPYCNNcfPse
 y1kQNuCnqhyYFzkdcTQbnpLlB0I3qz8OKtkytFeDnoduxkr3rS4ZTJTurG1rzUiaFKuW
 2b/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUb21fEjilcgjnixaM6iHhLg/J3KcFU3XBd6DRo9dN8FVX/NxcC85fdtw2P6Cx/BxjEH7OgcCz3VA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Lh7RKOKTFcRnSx4mzpvzXPApYm75IpIZYWc5nvW8dLN6WtU3
 QVmfY27OzWT4pc+47CaJnJxjw7iTRqpWBtXFRW8HURgJHMH+BQAmf8XqcPwa+6nic0RMfrwRIpY
 1LqCVkMbwmHysXEyetw4Esiw3yypGL0LhzQy7rfitQntejF2Tw4nrLywtUJZrFpfPLQ4V7Tc=
X-Gm-Gg: ASbGncu494PLK6H3NgcXEtWOvBeC6Sj1ICVuzjKVAbwVLlL5spRighAqxJ2tNNdR69W
 wINMg2hjCXG2yo9YJkYt3hVT2mUiCTt7lTdijngMxqj0+WCDGbZc+m01E6pyaK9YxxEES7tjZAt
 XOix3xHR11NCZ/XmaTRDvoSrs/cVmNSR3XM4FhYNOhvTzfHmht17DWuqeR8rWMSlrmRDXEytQ2M
 pCZMCW+HITgJMONc6Ykc6QXc1mLmqi25udmBk4EDg/rm0LhFksytKUiOM2Np3U8eGmlwYew03fb
 bD66cPaquf96eYkggV/9Ur5iQHqKz80JpWr4QdOnwVQlJnHJL+yPsso2AAb1iSqooVExJiDoO1r
 Es4+2yyMKN0R7uQ==
X-Received: by 2002:a17:902:ecc9:b0:262:2ae8:2517 with SMTP id
 d9443c01a7336-290272135e0mr360425925ad.5.1760453443058; 
 Tue, 14 Oct 2025 07:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhkdCLYsNsOsOUVInOfZGz3fqKKFhPTKgYTrxsxL+iwuLjEd7V9hpHOYpbkzzJXOHlFjT7hQ==
X-Received: by 2002:a17:902:ecc9:b0:262:2ae8:2517 with SMTP id
 d9443c01a7336-290272135e0mr360425655ad.5.1760453442638; 
 Tue, 14 Oct 2025 07:50:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df4ba7fsm12000959a12.32.2025.10.14.07.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:50:42 -0700 (PDT)
Message-ID: <31623bb8-2dd9-4382-9d8e-19441d06dbc3@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:50:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Include signal.h in qaic_control.c
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7FArO0nxY/5i
 V1vFrmL+LcFoo6Z/ssYluAOF1yC7xq4xr/njhkrwfeo5VkzYqehr3eO7wtBI44l8bQSj2461asN
 HzOS9popxp75nYfOZbjpcnaE5LZeafK2cukPl4dR+MQa8B4ej/OoEpUHYgPYZgUG9ZCF84TjIKd
 wiiopHFw7JWb/OE/B6cjdbm2vWxG2RMGicFZ7fThUWljxpkwIuqdrt/YEiyGb4inLbhv4fSmIbF
 uJd93eCEuhQlvIRkXji4QZlsdAPSwHqCjy1EWU5PHaKFs4qBBliMt/WRX9WECjleT/Rm+lsyNuG
 QakVRSIRivS/IPdYQWvS03zm/uNys3EfGO09fn0sRObP/6qZE59TAv1NMm8vTpD3EVKfa9ZPBdX
 IX8EkaeC5Y1/Q8iyRGOc6E83mOGpLA==
X-Proofpoint-ORIG-GUID: XZLYMHErs16iXPUs1l3oq338NvmGMh7_
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee6344 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2vv6iFeKVT2olVQFumUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XZLYMHErs16iXPUs1l3oq338NvmGMh7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On 10/7/2025 9:45 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Include linux/sched/signal.h in qaic_control.c
> to avoid implicit inclusion of signal_pending().
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
