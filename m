Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D14D3BB86
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 00:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5EC10E0B1;
	Mon, 19 Jan 2026 23:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="myg/cbjP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijr9BBX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6446310E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 23:09:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JKJVEt2789483
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 23:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=y7pTPfUH6iVzqZGYdTEFNi2K
 I6ZRLfJ8c6TQ1mSDQ68=; b=myg/cbjPvoXM6VUgMkCT6HnLHMrhpB5Z096hKCnQ
 P+LihECyI+10WkWLhns7DQP5Ctnfivr7GBZn7ZGmaebgZ6kqarQGjBYHz41HGfWt
 1nfoIHg721ELeXWhg7v3mXPT2gKhrD1mRFvvhJ4OV3+wdbRxKNWbtc2IkOOt4g/V
 6tkvhZWzvUQf6J2mAGab/7P0gszsTDXUQxjYi04sIHhP67GsPsYBOHEkuOXZ8w7E
 G0ntrrCOlws3JegwM3SgtuRjagHqNTd4NMmUXgpo3Rb8i0EP0sTE+s8xuLPJzBYs
 XbboYxkqn74CQ8F+lasKY6HSyxnnG4098Y+CXKycliW3Bw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxsuej-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 23:09:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8824d5b11easo112826806d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 15:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768864179; x=1769468979;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y7pTPfUH6iVzqZGYdTEFNi2KI6ZRLfJ8c6TQ1mSDQ68=;
 b=ijr9BBX6rigZn7eIRvSFFclIXazNrtrqeqXnhg9IBw5TXIzOG+tVMB4oa00mEJZvMh
 uZCgccupm2vDkbVguE+/mGAc6kjmqM1DzBzX0t+iKeG9cxEgCZJDLIDsDMYX8HpPACsH
 +wA3DztvMjRGQieYtyspDL80pD8R7dxulZ9bCwuX9xyL+rjyYpOsfobMClo2EOA05ArX
 vIHMO6GeV3ABpPmyjlJXDyjTqN+/j+rmRm0K7tqGzGpM/kJw/BFMWJj352boVnRbGv0a
 NJ/uy1KjKuG01npNAraXUNjRGNxve4S7wDKgoZraoiq3BmLoPw7GxXSfS8lbFwjuC7CY
 ms3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768864179; x=1769468979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y7pTPfUH6iVzqZGYdTEFNi2KI6ZRLfJ8c6TQ1mSDQ68=;
 b=t2/hgOVgj1hjhuShszjs+M205otJIM3GhWd9drFqeUEIRH8URpHZISA4tpvmg0iNsK
 MnBq+Vb0eDFVjMW/a3yHPY9xSgrmb7LjwhoYWTsGoqsfOWfDQjHGp5hP9ojX4L6rGj9T
 1gg/dojdM8Ze5c9n6yCfP9qXwZry704iKt9sQu8FYMy3QBCyAz/STWKqsuuMSNAe+8L1
 zSEWKULkA0LdCyqgVNsOoJEhyAf9DpXzePp7zq5NkRkx5PYSyYuAvQQH0M3wn3zQUVff
 P+Lc2FIiigpAXXQ+STLUuUQG/yZEezn6cSs9vBwxSo5hBGFpElG8yEdXColR5YC01/IA
 i7Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpEDd9dWOqOV3j9zNVt4uZVo/dgDTCTpyunU/jNgTCyJ3A++cZctekWVok5Y0YSVrVTXUHol3ItOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCIKVvf5/62MlPhNJfLYW14FT+lz/MeHho02ksy/4U89z2fB0j
 hvaW/iD7DL4fN2An5G5ENzWh/ASMaWfh+7cB4fGRvlekD6UaWVlNvnD1V5zW6qXX86I9MXxWJA2
 +0PA8WJjEqy6BXgr0xKzRsrU/kGOn/K2efV1L7o6O7mlgeKImneOXTt6sv7NMt1IzaFKd/hs=
X-Gm-Gg: AZuq6aLWkf7Wg7936mo3gKFCv40FZT14r+8h3qLfQmfAsyrzylLJGMK3z7lJokP6f/j
 b3iE0hAaSh2YzhKq8WZellk0b6nYhynHgfIjraIHylISj2jE2cfCJA1xHhlRavaQ892yvh//bHH
 kqNCjwTVaSRWCthpk8FHCtwMmyc7juZXiD1V1EN81lMnKtQl2dgNqPgVL0CwjYaaTYl1ytADMxn
 aud7nryHPSw9AQHmNro9VPFRmHSBj+whut/KDsqMXCWagZwY/ib+TaOcC6GHT4u9gPu1gyINIhh
 Vg33omYtZc+6gB2XV2FtjGb8BG1hr4XCAhJ+ATEzOKoNfvQ/gVB6wv5GOGz3aIXFGkD4omrslbm
 bh7/U2nWP9DhgikrD1BztZfw0OuEG8JsN8Bn4CaC+DHckY3PjsVlQVl5sYGA5qp/IlIn2qbMW52
 tTSKM4/UJS7dAmmEsdHWUGpFk=
X-Received: by 2002:ad4:596f:0:b0:880:5193:1102 with SMTP id
 6a1803df08f44-8942e4ca766mr189035676d6.56.1768864179400; 
 Mon, 19 Jan 2026 15:09:39 -0800 (PST)
X-Received: by 2002:ad4:596f:0:b0:880:5193:1102 with SMTP id
 6a1803df08f44-8942e4ca766mr189035436d6.56.1768864178937; 
 Mon, 19 Jan 2026 15:09:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17dcsm3686254e87.89.2026.01.19.15.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 15:09:36 -0800 (PST)
Date: Tue, 20 Jan 2026 01:09:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <g6tcsjmc27jafnfwbyltlq7lhbldcdlfbf4qiqwrnp6iyndk3o@lrcnxz5ud27b>
References: <aW5r7NzicgqvpaUj@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5r7NzicgqvpaUj@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE5NCBTYWx0ZWRfXzeElVGTwqa2h
 zzScNJUbC0MOWgWNHE43MSvGoC2njXBmeMfP7tRWsKm5tgVr20dKwSOX6ul0PGA0GswFFOL7s64
 gxr+AA8kEhVP09RlydT7/VDyB04P+aNdsYg8kD9b641xvgW9C8NazsmNlQ7mskNREuU+fD52REH
 ORHa4hIfuOAgZsaABPiK5mHg3CQ6/m72JDnic1XcLKY/rwYmHLsgw3JDvuXmyumLwB19FDxn47u
 uqE5fr6CQQnAxtW0TfHwrYd3G61JIKaGgb7UiTV/vQfmYR9mtWjscBevvri4PZaOm+Sub8iy/1o
 Ebji8plnds9EgePPt5MoLBJrAJO6VTCCOUQCEUawOA5iBxXowoHY8Do4vmtc6qXQ4dGbaurdfVS
 k3XeLMnzLUOiOCEs3c3f/ik8tukpRzWnLthAU25iWMkSKDL0x2Uvgd4PyY4nSzew0a7OPGogBde
 k0KDZpSFCGZhEINnYTg==
X-Proofpoint-GUID: SUhTdue7T0BenD5cjlDwRwVCS1En4Ito
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696eb9b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=grscYz08w_xL7T5cvToA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: SUhTdue7T0BenD5cjlDwRwVCS1En4Ito
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_06,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190194
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

On Mon, Jan 19, 2026 at 05:37:48PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c: In function 'drm_test_check_reject_hdr_infoframe_bpc_10':
> /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2926:49: error: passing argument 6 of 'drm_property_replace_blob_from_id' makes integer from pointer without a cast [-Wint-conversion]
>  2926 |                                                 &replaced);
>       |                                                 ^~~~~~~~~
>       |                                                 |
>       |                                                 bool * {aka _Bool *}
> In file included from /tmp/next/build/include/drm/drm_connector.h:33,
>                  from /tmp/next/build/include/drm/drm_modes.h:33,
>                  from /tmp/next/build/include/drm/drm_crtc.h:32,
>                  from /tmp/next/build/include/drm/drm_atomic.h:31,
>                  from /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:7:
> /tmp/next/build/include/drm/drm_property.h:287:47: note: expected 'ssize_t' {aka 'long int'} but argument is of type 'bool *' {aka '_Bool *'}
>   287 |                                       ssize_t max_size,
>       |                                       ~~~~~~~~^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2922:15: error: too few arguments to function 'drm_property_replace_blob_from_id'
>  2922 |         ret = drm_property_replace_blob_from_id(drm,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/drm/drm_property.h:282:5: note: declared here
>   282 | int drm_property_replace_blob_from_id(struct drm_device *dev,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    7436a87db99d5 (drm/tests: hdmi: check the infoframes behaviour)
> 
> interacting with
> 
>    ca59e33f5a1f6 (drm/atomic: add max_size check to drm_property_replace_blob_from_id())
> 
> I have applied a fixup:

This fixup is correct. I've sent a formal patch,

https://lore.kernel.org/all/20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com/

> 

-- 
With best wishes
Dmitry
