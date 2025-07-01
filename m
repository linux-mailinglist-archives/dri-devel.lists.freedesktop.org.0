Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9F3AEEF97
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 09:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8510E50C;
	Tue,  1 Jul 2025 07:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQXTx0s2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8751410E50C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 07:16:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612rf1n000438
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 07:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7bePMCNo6s9CWEn8nZAib32fStGxAXvblHwxacgH9h0=; b=YQXTx0s2gmRoRRTu
 /1t/pdWyE2Xs9QQDcY5YDNwCtHzQHla6S6W2qfhvvK0lqxe2cOaHoIDMKRDLjtWz
 o5SivkPCM9bhz1U6LjXi3RheObxzWYUv7oQ4sGkPDcwCwX3B8Ij3UMOiuAReypMb
 UpOf7OAu8syH3yv8TEA5vnTzvG1g3n8pY0lAC3rCXOSsNHvExdBwROYd3lm1FYZ5
 5hwbl74IPhXbmlCfXo62yWJCWRA7jqduzMUqLgJieRUb+DEuZUjEjPXki7mlN4IW
 rOm8j+d+7agM06WVFTrP4pql/N6Da1Pq0FJY1xdS6ZTDwBoEjjiiwegffMlqXPwU
 2XVKLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm7g9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 07:16:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d4576e83cdso582842585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 00:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751354208; x=1751959008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7bePMCNo6s9CWEn8nZAib32fStGxAXvblHwxacgH9h0=;
 b=jMwsIUCLQQ1+xx2y4ozFBV2vCZ5UfUt7dK6gmON8D7kpCYkPQvIetKwyIlVwi6uUHy
 zMLhKW/MC/UVTHobfbV24pXwtwuVLLQicdlWNDCyipabR82XMG3dIEVOo7XmNSKn5K3s
 NOnzOQcjb+e1PPtbhxb34PNvY7zvU3BnQat3mXVlJgqrh4ul/U+WLQA0G6GztgOmPdxg
 tqbF2yZoHBS/sOEvRJ9RRAX11AMvG+C5ZkmKkPzLl6hX/HJgAExCPkO9wx3NGWS8RlnK
 84DriqYVXTyqKn0f7ldGWwQJ7ZyQa0O82oQ8IiYq+dLUqtW4BrtruikHu0abgYZYuz6Y
 6HHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmcvvCNz8mia8KkQABsBJSF7Wi21D+EQg2R5AKiVURd0CZpeogOG2k4WVlsw55kdMpnJerDbYFBl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9SkIMjsBi3rnKwHM/IgSB6XrHprHZN4GFR6Q9IqB5t1PFfA/E
 rCQ4uVDCo/YBFnokhUC8+AvgFGgt2jM+3zKGuEs8XjKp1voBdynFNDz6IQ0uUgr0+Ljjr+nc+VU
 IWx1y3sY2Hqzv8oj/3JPLqwK0qh+dRbA5l40NHTYNANzkuUDnH1B50m2iyDOof5qvVyoe5n8=
X-Gm-Gg: ASbGnctqkd+W3iH8HMtW7rtHf5gqGXG1Ztepu0xYidhmISeZwPApQPvwTYC7tRyG9iG
 yBN6UP7oxKwikpy2KmhohFDXBgAfTUBBwmnDG1JdAVQFqYicfy9/zpxWxVh8hkz9Se9QqbA9Ekl
 2ozGxa+Kqrzeo5PV7N1cM+Q2qFHys8RwOX7zuiS6DVBaO73HTVtw/b7KVfJxC6aAu9vk6Atat62
 ZW4exb4/dJG6WJLU3+Qsr009hSyPtzRtDgx9SyOIcCss0VU1R+acpI14pMsWWG1+yIz4oYPnRd4
 8GnarH9/MVw2McQsXRyDmuSP5pNdsuyElM/bukXzvQSlIMxQYq95QWHTlCdj/LNSX65FXClZmv3
 JLV4fWYjvBmI52Tx0zFpDVj1vQA==
X-Received: by 2002:a05:620a:2905:b0:7d3:c6b0:1d91 with SMTP id
 af79cd13be357-7d4439381f7mr2124838685a.16.1751354208577; 
 Tue, 01 Jul 2025 00:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeqXswStv+U/Onv2RDcDW1Mi4IfFKQEKv8cqdvaojVe4eihQkdJYBwt8K3nhFjea4N83Gxyw==
X-Received: by 2002:a05:620a:2905:b0:7d3:c6b0:1d91 with SMTP id
 af79cd13be357-7d4439381f7mr2124836585a.16.1751354208233; 
 Tue, 01 Jul 2025 00:16:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f?
 (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2dd7b3sm1703993e87.228.2025.07.01.00.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 00:16:47 -0700 (PDT)
Message-ID: <958a0e70-9cbe-4362-b7b6-94ddd3acc240@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:16:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup connector
 by encoder
To: Andy Yan <andyshrk@163.com>, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
 <20250318-active-giraffe-of-memory-e0c66d@houat>
 <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
 <20250321-majestic-cicada-of-argument-15b2d0@houat>
 <vw2ncdomx3rwltb2xlo6nf3rapgcdtcjcodofgmecrzzabf7ji@pybsfv27jkq2>
 <mdwhn4wml3qpoqgzegiczintfs6geuuet54bip3uxlpc2a4bfl@c6momnue7z7y>
 <20250619-polar-aromatic-agama-1d46f7@houat>
 <6a46190b.5467.197c4a63530.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <6a46190b.5467.197c4a63530.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68638b61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=kFPgMliZRkh9n9dvXI0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TmKfc1uT1oedZklNaw3SxYeb96dW_3TL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MCBTYWx0ZWRfX+axC2MmP4AQ6
 jAb2qJumq1ALhhjrkzrkZfmr7wZ4+4K9XJqMkaMYQBw/xD+XM3SnT8Di74r8DCjQ6tU2fGF8fLZ
 s1A/JycXiuebFVg8FZzq76K/i19rtDRH6zFmFBySOD/pfJR+smCFSgdPxjaMTFzPrBJDlYmo0Tc
 rFMN7zjR92MlIuEK8hhh/cNUbHKXpDB25g6+X1l1aqZdXquJkPZJfnPMdg053dlWYzmXg1MdJ28
 9dog36u9O4C4bcpMfEXiEcbgnr88qPS0NpOto34SB20YqipwJhCNMo42inrZAFEf15byYwhM0/7
 S2p4DvzgLOTd+pnW2DB3ZXleJaj2kisDuh1T77T0kmWaU2MS5ASH5MLwjpjL0um6OjcLwSQ+TgR
 F54P7SpVQ/WImL9GW6af3mxKII9syQJBuBwZ9an8XFo9gc8zEEOFpwC5PJBzDnFNLZ2/mArK
X-Proofpoint-GUID: TmKfc1uT1oedZklNaw3SxYeb96dW_3TL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010040
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

On 01/07/2025 09:21, Andy Yan wrote:
> Hello all，
> 
> At 2025-06-19 21:09:09, "Maxime Ripard" <mripard@kernel.org> wrote:
>> hdmi_audio_* have the reversed order compared to get_modes and
>> edid_read. Could you make sure the audio callbacks are using the same
>> order doing so?
> 
> And for the parameters order,  Dmitry, if you agree, I can send a patch
> to make them consistent.

Yes, please.

-- 
With best wishes
Dmitry
