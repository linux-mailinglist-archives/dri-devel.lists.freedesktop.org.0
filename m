Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09692B9E68A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ECF10E8AD;
	Thu, 25 Sep 2025 09:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="USvucVEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D5710E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:37:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P93hNJ027919
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zeVa0WZkgGit33CQLVzL5GAxI4BelhXE8gH2cuvDak4=; b=USvucVEwWX5vGxBE
 LVg5Xvi7Fx4WN8BKLqsVOWdNAE/TH+j+AAY6a0N3hJ6B48VvYBi5YQxG+slFxWCk
 +q6x5cQ/BVELtr46VFsWKY0szkEVY42G4QaLF5avDysrH+8ukM3os+BqKS9OMEY+
 qy91E90w4tAHlW7nbSAOZsOOt7/2VHcVMes+nhVa6YUAToMTnZfgi435xk2lrKWc
 ANrhFdO2vg4T2QdlnXrKhIm/JtbkKYYjauYCX5wV8ow2JRQidVJXrvrWfEaYPuGK
 Kxfg8zg9Lip8NfNdR23vAmM1f1ECL+iRg9kL8qAPZzYWLSHEY5aKf8KeQfklB/PA
 BgKUqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnyybb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:37:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e8707701f2so26882285a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758793030; x=1759397830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zeVa0WZkgGit33CQLVzL5GAxI4BelhXE8gH2cuvDak4=;
 b=t+E+PjVbaPiCqPmkaT1QL7TK4jUPhVLL9ldlpRVQn43uRcvy++pRSZKTg1P/RazjEz
 ZYJU7a5STnSTjPJ3UV2bF51yTT7RcVEu6UgsJCRCiYg2nWC5vuHci7TthsP0JO8+Nslj
 isP6BeIFOaKQBZT/tIpIFHCz32eCpSwEdUXHw/iSs7SV7da8z/1E/UN7dF7JVVxQPUOr
 S9wbejtyUj2sZXZd6kut1LUlFMubiMusXfV14w0hLjBbFyLcDIEEP+tUR1v8E/LYXmlC
 MCaJPWYxKd6NjH3hI3mqoeOg+fFK22QKGVuPnkEZqaRGWkpsxE58543BGJ3rZ51uA8lW
 jbtA==
X-Gm-Message-State: AOJu0YzUyF/l9tGgyHVG690Ppcs2+zw3Li86Ifd0THGLPpVR6F3iIyZg
 cuCWT1u+9sqlARH5PiAMiVDWKMCVm36tV92xznOAGOZz0i+cD/b7A4bVAkMglZGS6s5xf9L1Qn+
 85YP41CASBXDLCB6OKO/54szqGjzYq5jEILkLYolrh8ozaxC5MWchctJXlmK/mVhbPBmxS/s=
X-Gm-Gg: ASbGnctKhcFk0TVIqFU4/qkwIHXoCbjmxxz9lMA/juezVLQF9vxolh8oWBXFRd5HEVZ
 xfSsehqtg+9LCCcMi8N9v9iGXsrDMxdI/GABAA/XZ8Pq3jcut8EQxCc8FwfF7cA8bxvFcdgkTtp
 VOu0+6Yi3c5zxy7Y1svRLgRoboC+jWuOHudE7n0dd39d/HYQ/U4NWuLj0qPYrCfA1/+CvtnnBW9
 q0KvG6oM0sz5kjCtiQVTHqGdn2vX8W1r8hNbNW9ea7VjUH9OP/uFEoYRavmc9bBFH0zkvInZZ+Q
 1p/jxqLUQlrSkwnIyJhX4Om2NSOVLNr+24ZgP0DdyLr7WdlylpW13b64aMSKS+HnwrgaLL1oPop
 Yj0RkuVLDsyR1s+z0/KuiHQ==
X-Received: by 2002:a05:622a:7616:b0:4dc:15a4:60ae with SMTP id
 d75a77b69052e-4dc15a462d0mr1290761cf.4.1758793029501; 
 Thu, 25 Sep 2025 02:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhWYbhiie+DtdNK2tQZ+Tuc65d9LphLjEc6TZpsNJ8FCEHPxhcyKa4Sn3ApENdJ4f9vHV2Lw==
X-Received: by 2002:a05:622a:7616:b0:4dc:15a4:60ae with SMTP id
 d75a77b69052e-4dc15a462d0mr1290631cf.4.1758793028998; 
 Thu, 25 Sep 2025 02:37:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35458950edsm128031966b.90.2025.09.25.02.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:37:08 -0700 (PDT)
Message-ID: <a078c6a0-5a54-4ad5-8e3a-c676783e68a3@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC with
 AMS641RW panel)
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d50d46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=CYF1pGrXqkiHziMhkFIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xYGrhG7eVAKPsDJ5P7Y1lcCSmB-Rb7-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX2T8wihgTrOKi
 TLecodI+tU3WXfoy0L34UyPwKaMODyjnTqve/N7lax4ScBL++FTIkHDEmac7r/3/UTokyqDJxeH
 +qZAOyjTuMg6CeTXGmxpPDWauPsBMkjUyc3ASF38uN5O4bRPM2EVuv7yNXE+FZIPQ2DCkiqS7BT
 v+mokW1mzSDTzvWgM+LTbBt/PLdF0ACOEmCRM3Kio9COmv827MlBA6mIDSMO7qbdiIn4pphGUys
 Kit7Ef9aYfZeKp3ALAUd2wcotrX9nqfsMyMlsDzP9ilCLutN30c+d3Czaah0QrASCFpcO6NY4bU
 Yi5SVHJ3xzA7ZeoAmFWrrYai9jWn5ThNQFqDj9AMIFvDeXh8ytM94uFL6r+PcNLca28h2B0+6pU
 a3Ihun7A
X-Proofpoint-GUID: xYGrhG7eVAKPsDJ5P7Y1lcCSmB-Rb7-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> This patchset enables display on the OnePlus 6T smartphone.
> 
> Minor adjust to the device-tree of OnePlus 6 had to be done
> to properly document reset GPIO used. Also same adjustments
> had been done to the sofef00 panel driver (used by OnePlus 6).
> 
> In the last step new DDIC driver is introduced together with AMS641RW
> panel sequences.

I think you skipped the elephant in the room - some of these patches
break panel for the phone intermittently..

Konrad
