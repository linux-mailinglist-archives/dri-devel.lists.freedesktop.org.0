Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3873AC93AE
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF210E7D4;
	Fri, 30 May 2025 16:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hS1NY1XC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8610E7D4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:36:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UB7ht5010107
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=; b=hS1NY1XCWJaI/L0a
 dJatO4IlRpSEMzQwwY6c+SNFZcYQnB/2uVSktsWPY/evcTwsqeyAoC8RlpC3jRT5
 PwBJxfWcS17aLFb3MyLV2CuDAdNs1tTCeaxyyHtzHnyQLmbFeJdD9x5lNa50Q63o
 tK5NWCrkoAz3Vd+a0iuaQBZe/GiJczyWL5VGp56jwk5No9co1fSOJzDRGdkezfD3
 Fmua1tTrWJBWsx97/dseKpjIUR4Egok5O8OUgpIBEPv+Zyzv0KGRUXjXIuwejRjs
 D13y+FQ5Tm0r0DiJGB+WMLhkIhJWdzZ69i6suJJNMWJ6ViZ9ISgdlRQMbWenOjmT
 +ru2/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691mcv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:36:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31202bbaafaso2344538a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748622959; x=1749227759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=;
 b=hlFk4tRWSw5MdYjiAmp38fbSVAnYI3pmP6aQ+gUqE/ZeuPytR99vLVge+Sl71UGDzj
 JOzRixPvnXPOvlb1ZxCrVShqq3Rctq9KdcYeQ+7q6FZLux2GrS7p0BH7+ZG4NHYBhcsW
 ccwEFdLhgnc/JF1M0iYOANQF23So/vywf5Nvdn6grTr9UB+h+RuY7AQZR5+mS8lqNHsz
 ZdftLspfDNyQvf9LnHwOXPS+GZI0w37D59yyOeOTNXBnjXsnriuc0U1YW+qMKLKXGFFF
 0HHPj+ooId985E1AzsWfBuuJ0W/L7+iBuasIdwu3nGjhrnuG85AC/4AC+M9h2nZDin1w
 lATw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHSrNYJw17Rp+b/1ctut7W1jccBevCd57q52I3J1mdK9HqaFRy2k0BkkrkBYeNhPMiJp1TCuoc5bM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLvXNtp5k5hSyYgKaq2x50CQgqg2MIsD+Cn0Jmm3xhkHkdKAbb
 Lh/An1IBQQLddMfdFrkT8hQuSFoZKjZXtjH5wlgaXUYoB5pkkig3ktwm+xKnnZmWV0MOlRvFI2G
 /gI2SzB0QLgj8o+Z/4Travg4xL4vWZXWO4q99iVv3Ph/5fjT9aoBe15Q+0tLt2h37RBqSiV8=
X-Gm-Gg: ASbGncuoF6DozCMgqmCNhv5QhbRlaAlfuG7LA+b3pOg5TprzE9XDq5WkQ/IC50QIPae
 Iz3xBuwsxlWKPQbVv+GnrC71EkKBvzzrlJu1jhadF9i9NzsbakR/Sglain2s5eV37G3510kF8Z7
 f+BCMpY343ME67xne/9swAeZltgszhXPE+lsXpMD2/KTQWPO+RsruECgBy5q/HU89N62cgKkkgC
 l2gQKZzGluP+9YF/N7bgwcflhAmc6nTNmVFkJPQg2ZvPrnDIHA3QDwTKMaJERAldEsaeHU+HkBc
 +i9QYE7l09jYyAwrAgToUye8vt2tcZ0rY3IgnS3lfrGhp/mf6uCfWDoO794J7A==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-31241e8cb1dmr6395379a91.24.1748622959259; 
 Fri, 30 May 2025 09:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gZlETTzuM/nB9i8V58eslnhzSbt76+bQeUPi+dwYMc6LXYsmcqrpPQXpymgaj7IkyAYV1Q==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-31241e8cb1dmr6395344a91.24.1748622958819; 
 Fri, 30 May 2025 09:35:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e3c1358sm1544883a91.37.2025.05.30.09.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 09:35:58 -0700 (PDT)
Message-ID: <bf24ba20-dad5-410a-934c-f5963a2769ec@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:35:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] accel/rocket: Add IOCTLs for synchronizing
 memory accesses
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6839de70 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=CskBsiFdeBhsZAe0Fc8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: 1h3aPa3HejwOwIxZz95owemYRPLvtni1
X-Proofpoint-ORIG-GUID: 1h3aPa3HejwOwIxZz95owemYRPLvtni1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX2t4aaA4HKRsX
 /TiGm4a3IFj1oCyzSrfx1BdBn+fTMKHDihdaxwrQ6UpbnP7T7J+kdq1YPPfJEeJQslvkH/qQ8kT
 zptMwmT0bC9mMj0DJfFgA0PKRFso0DOwdp3kUMvYEn1NHtiMVeQLg7KsaKG3+qF+0wVBCH9Csuz
 ml1vLFRvglUoZK9PTJfhjHd0iwQi4Hcfc9N815TabWAhPX6Nsj5vmtOicIa7uYt5MGJPqFa3eYM
 sAAFEc/ZRLkqxdLwf34Gmzzur3vezgYn2qV/SWqNbs7KTmtmTZaU0b+ooESDkXL5aqEPfSS/t/G
 N4+1wnpg3khhbUbRtaD1kG31Ps1MZdkeiiTVw19QOjb26Y47/T1OI3Ueg4FXcUkkl3PCBnYv+Y5
 7x7YR2ZvCFx06dwyRWfwgwgDZ3orULvpJ2JV6d4taIpFXcCBNVI7esfR5XTuJ5nXam37A02L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147
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

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
> 
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
> 
> Initially based on the same IOCTLs from the Etnaviv driver.
> 
> v2:
> - Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)
> 
> v3:
> - Check that padding fields in IOCTLs are zero (Jeff Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Assuming what Lucas pointed out is addressed,

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
