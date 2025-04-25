Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0EA9CF23
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B362210E129;
	Fri, 25 Apr 2025 17:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPr3/3SK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B752010E129
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:09:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqPY003997
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SNLXvLbbpTqBFTNrbbCRYuJ3NMrzd7CEVCz/JN/Qj1I=; b=WPr3/3SKmQO5tUCH
 DZrcVmn391fGOy14p3URxwSckn/7VjQ0fCGkhHKsAg6xLfF/6IHj/imbEpYMyr6F
 1rc2fWeJVXlar2PeuQ//ms531J6YkWPSQ7H0CJxrGbYWOIQfmeOYTHdn8OO/lVmr
 xL3bvr/hngqYKkzc94dj/qtCuiHDNPwSohFe3gGonRdyDHgnwjy6VE8s6MfRkIaA
 DQWL4l8Ge0s1gAktx2rJmX3C3lAR44WcY9R2ZrXmlOCg+8bnjlm4t5xODQQtXL6D
 J4O2BEvD5TKK39AvoRt8UiWm1DiTUv36mxybf5Usy0LF6uk5ZO2hgH1J3cq/bCkC
 +3BhDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh29v1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:09:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b078af4b07dso1424536a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745600962; x=1746205762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SNLXvLbbpTqBFTNrbbCRYuJ3NMrzd7CEVCz/JN/Qj1I=;
 b=TR9MyvsqHicZtkwVyGd3D3hbS2357yU1QFzsYEDk4hdOwZhRwatEY72AAYNAKByRIp
 orkqXzbzPuU3/ZIT8sTqenuJGZkxOYAjhUHvj3AeKmtlfg26/VqEz8nxUAOHBtTvo616
 L0QJuCz9oJG1CASSX5at3s+KtAfAwQYU+RvZkpuSWNKWdizfe0xs0qq+FCfR3Y/zBnB2
 7R2BrnisnQyCbO9FitMJFhylX6rTQ8lP2WvYUR6bDPGQx3+1CgL4oSN9KOnTonfsgoYF
 esYddT0gycvyAaWu2cGGtDk0iHCMBP2widrh8DcxGS25jg8RlrmcylFXgFMUF6OvjCgi
 RfdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpus+LkK+gKqEMKGBHkf2Bij9ukUTsArJXy/zYMcVpu1BNIX2A/Ywi476NpO1XP6OSq6YXJXNsqbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMNp7JKonRBRq12lKX61OJbeC/B3/Fu2L6BmYxhAakZe9+GR58
 b3URKEy7fmdmjqcUbZEBoWmRYt+CbHKXCyjuXZmM3E7VsHS3enkyGoufOPujoFH28MaMcvrjDWF
 Q1qIu5CmdxmITyft0PltFgyo2UFIq5/4mjq9OESdlPQ48zruMf+Edu1m037myD28rbjk=
X-Gm-Gg: ASbGnctXhJWC9NXlYx4L1AQuTizqGVOEwLDsNwAkVJ2W1ouV4ocdf9MzDZ7Zfm+S78H
 jpvvon5UcLyHA8/LmMpDrIgCC5XUVVbkpBg2BGOaNjy4gu4SHBUlDjidezq5kc5NyL2ow7cUkZq
 vOodXb6Zg+6Z16N1dhAGsuEXCWmGCjiqMKskwW/33wHWE8Do5X8N5QxRDMIfWRqqpA+NZusw9HS
 /ijF9nzE9B4HkZsjGgnOGx5UBWhOZaWvmdEyU4ZXpfCjHVeQdiS3otGi2dReXNUlaRMdAi0UvMN
 NOadojX4mdcOu83demuD29+NWDhUIWWN0/843+VMv4lbidzo2RVjGUG/lVnn2A==
X-Received: by 2002:a05:6a20:d70b:b0:1f3:418d:91b5 with SMTP id
 adf61e73a8af0-2046a5a9d2fmr68328637.24.1745600962145; 
 Fri, 25 Apr 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM9HokRCyBhJ15lR9DwESI9IeJZojuQyt/SqQBpUGC27jSIlqVaVyxmI7Z2IF0snSSH+wOiQ==
X-Received: by 2002:a05:6a20:d70b:b0:1f3:418d:91b5 with SMTP id
 adf61e73a8af0-2046a5a9d2fmr68297637.24.1745600961761; 
 Fri, 25 Apr 2025 10:09:21 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9a8e7sm3395150b3a.121.2025.04.25.10.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 10:09:21 -0700 (PDT)
Message-ID: <38a0739b-4b27-4619-80d0-1926876cf19b@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:09:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Increase state dump msg timeout
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250425092822.2194465-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250425092822.2194465-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bc1c2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=_zbj01uBmePObPNM0bIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _OHO95ea8rLHx66PphABXiY7NnpUoX0Y
X-Proofpoint-ORIG-GUID: _OHO95ea8rLHx66PphABXiY7NnpUoX0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMSBTYWx0ZWRfX9RjhuHbe32nm
 VgZ1oVcdpD9Vgqk5MmbPE0wttkUll0nE63+Z5rcCY3rtEANe5xARh8qdEnuX6uaUedoj+K9HUv/
 wpKt9GptvSCaSROvwmkTEGiTNUlDb5YiUvrJqgNmZkSg4SJ9qVakVyaM49kI4zC92JH+zLK7mCW
 79cKm1j7CGBOFgnu7ZKXBgMEyJNjXzj7CoTThu0m/n4FyY/NSerb7ByAVNzqRXdIgmNhE6Slm8N
 uZLdCb5uRxGD178VLGWUrR40ngWJHNGoFZ79v1dmneA0Q1x3joVXpQpTqetjVYHK6yDy9K4ooI8
 0S4NI8hn1Sw/YOZjPkIZZ/XuDArI799VQctkRzsHyKrlkey/Ah7ywuCFBUwv8TZ7zi90PAplOS/
 kzIgMYGEJADxnijdaetN6Noc3yaMmYhpAcP+ln+lKsbeoPW1jp3kMAeChAL0M0rQa/60kn0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250121
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

On 4/25/2025 3:28 AM, Jacek Lawrynowicz wrote:
> Increase JMS message state dump command timeout to 100 ms. On some
> platforms, the FW may take a bit longer than 50 ms to dump its state
> to the log buffer and we don't want to miss any debug info during TDR.
> 
> Fixes: 5e162f872d7a ("accel/ivpu: Add FW state dump on TDR")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

As a side note, my email address changed a little bit ago, but I suspect 
you are not aware as I'm still getting patches addressed to my old 
address.  While I still have access to the old address, I'm not entirely 
sure how long that will last and I'd like to avoid missing anything.
