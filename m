Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F11B516C2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AA210E90F;
	Wed, 10 Sep 2025 12:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bt7UpaHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F7610E90F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:22:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFdFV000528
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s/bVuPEBsh2YXnfDsGyxWB+08ksXo2EZydxB1awYjm0=; b=bt7UpaHGoUvYS6iI
 /kAJ7Vjm5Yv6vlIbQeUcsBwNhWBmag7+obJUyCmpk7nNR95wdy9m2VvSgbB7oPoK
 Jmoop+10eNEyCouFT4LIPZWnumIL3MSWl+m8M2QItjaIeQOyMqZS8VFluEIcFH1X
 FLVO4ymeorHcc1uTNUEvmJH18WU/ZFnmogLLXu8csy4OeTrjvreO+5v4IvlQt0x+
 Wpw26rRj/Aets/VA3fI+D7biJlIBTs0O6ej0RgEVELnjI59Dke1iMyeBjF5gA/Cq
 I7QQkquc4n+EdCYCwXe6RRLqYdsPraFyXJvvb7Lx0zjJOJPUDgdMNcEFJdolwnxM
 JE1jfg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3njj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:22:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5eb710c8eso14300541cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 05:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757506966; x=1758111766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/bVuPEBsh2YXnfDsGyxWB+08ksXo2EZydxB1awYjm0=;
 b=g9D8/3EI3YFcj+i0qS5fy7q1mgNU3bJ2hQh/1hj+nY5nepIO3Y+0SHTKwYZ2dEUFeu
 +mt3/S/JHl4ugczvhTUAteqdOM9kNBgxm5qHjrSFQ8EyhQvB7BLPykDgkxvW3KUWb0WU
 x3hcNoLfZGovqK+bSJ77e0SNprkns59v/4s0dcG9G41cJ0FKFv7BsVxl+ciIb/fQxLQ8
 pMW5SgrdqewnbKmWEt18EmZi8ZeMC5Fl9PegDpPL58iads6vEpR/OHh9nxLdpfcQN14j
 TMbuOFVKlmp/81/cjieyVuNfqoDhJP4MQan9DK+FEKu8wNk4bYwb1J+BAVG++35GkPIA
 WMog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnueqzqC/XFcyyN4O6Cyia5fr2wGHlCaA0eRGYcYx7HAHl6UMN/miRCrrr7GUX5H6ogxvQXl5nCJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlM43Sdl4u7eutuuwMTQR6wWH5TQeMrIrAdtmM+h1cecZ4ei3P
 ee2YQGlP86a+Lf6KDbRe58hIVU/vxgotzFztJma6VPFnxlLhunpUu5IEOqBQNJtTgzWkXYMtwaF
 s2bjJg5j8PKvT8nPm6rV5BUX6V4m4unPa3T75yqBiSCuDaJdFHX2NdsbXrMk/UYC9x6fPTX0=
X-Gm-Gg: ASbGncsgNzI6FwqffIFDQBhrSTAK/6smnFhCgqHMupcy8CoIMab0jY5dtQ32ucSju1A
 WgFCUZBQeXkho5kMlXm+MSHl6Bmg2oNrzMJ6a415BMSG4SItSRLOz7EdnfKX5Gl62DQt+hTLRAp
 bp8I7souUOPzu0zwsYOhBxJDbA9ZIPGNylNkX0W0btT4in2KroM/qoL7FERvda5nPBIOqKXwtDL
 qF3JeC9EsVerMu36pTOof1cJzJupxYLaJDZM0M4/D5XcX13U86lB9M7M/54nqndi+IY7Jy8FHjH
 udWjVgKB/ZTnlWOTSPfhcqIx4TE/JUkYg8YG1yZ8Q2/VphWuty5tw9cEeC/Vb5tvDC5DyY1ctFT
 gckRlprFM5DFLmq9Ap02x0A==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id
 d75a77b69052e-4b5f856938fmr104411481cf.12.1757506965756; 
 Wed, 10 Sep 2025 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK96mIjsi7BIczF8k3Y4/aamKeJ97m8Mi+OeD++eGrVhR+uItPR0oN5U4hm/goOgUc9ybqVw==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id
 d75a77b69052e-4b5f856938fmr104409021cf.12.1757506964359; 
 Wed, 10 Sep 2025 05:22:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783411a3csm159621866b.100.2025.09.10.05.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 05:22:43 -0700 (PDT)
Message-ID: <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXwp4wy8pL/y50
 kgjf1PVc/EP09cfPWG9J7L8TRVNmuGytsAGLgFY7bGRD1eOXgrzqJzlbHDaofR7F3FBxSlzW5cX
 BIW4j6GtvR+q6zZExVaWVZ15Ugkt05R2+Co1491yJVURRxbCt47ftWqe1NF0GQDhsT0HFCpQyIb
 LpDcC7V2lVm3ICdPwOwp7aAeRU+ZiLjAUpBtEZlethKWC65kauo9HbCa0i07gvVA6uq2tawooQv
 HgsiSRhRUvX7GnXi/FHi8c3xiiJtXXlREEC9FoQdvybqilw54K6/1t5IIWcdecqe7hZBFcdyfkg
 DC2b64is0Uyj4+GcUz5qg+EnsPWie7hV32Eh+SWn+eGfvRMaNrh0UvXoLa5XA9ysKykvl59zW2t
 sujbKIe2
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c16d98 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=I76Qk8w-AAAA:8 a=hKb3k0M6aziuvKwtClIA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: 3eUwplGOlAN4cF_a9fyO_xNqwrw21Jn8
X-Proofpoint-ORIG-GUID: 3eUwplGOlAN4cF_a9fyO_xNqwrw21Jn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
> From: Hans de Goede <hansg@kernel.org>
> 
> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> devicetree by either name or index.
> 
> And use this modified function to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
> 
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Lee Jones <lee@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

I was thinking, perhaps we should introduce some sort of an exclusive
access mechanism, so that the e.g. user (or malware) can't listen to
uevents and immediately shut down the LED over sysfs

Konrad
