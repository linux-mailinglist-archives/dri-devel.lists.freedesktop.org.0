Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A45AC2B7B
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 23:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF2210E09F;
	Fri, 23 May 2025 21:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL1jbfw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F55310E09F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:46:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NClsE9011349
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YG4viRd+J1gzU3tCz8abXTyB
 kGIHyRuIeHUgXDp7eMs=; b=PL1jbfw+LKLtOs2zzBvEF0XU/8hYi6C0bic4cTPv
 U+qDupbcgkokUUiF8pxbx1BBk957jn/MITWdwvjI1/oA4IniBzKpxovm1cXkJL6H
 o0+ilAqG3AqauWdDUZxp7DdBcC6sl6qBgWR+J1eArlUYvpGPegiffFYffSL+vDi6
 sFsaMCunWn8rxAGSTR1Kx+VbWWtp6bJFdc2QZFHDcYhCYBpDYbLMhzSjnuFsM/Ef
 lZFg8aSCWJz84DpGq9/jpWIz4Q6wRKRY5TE3+CeavRpZhX+r9j2XcORnaoMzP3Qx
 +y1E09AozHyVH1GJOHyO7DVyj8UYwMZVwJcNsXlj2TmsMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0ud8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:46:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so81051685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 14:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748036766; x=1748641566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YG4viRd+J1gzU3tCz8abXTyBkGIHyRuIeHUgXDp7eMs=;
 b=mVtE5b5D3YvIYjZPD6o0C9DtGKCllY96fZAEujZHupwXXpunlBjUiCkiwEt8FoC6w+
 /mNxhUBL38/EHhwbKHJc7rLQe8Rpam5XlqDkUVeuIhRDymlj7554Rfk6W8qeO521BB4i
 wGrn0n7FhfWvGoBVoLw9N0N1xGp3w93Kea//hjkHe7rzwlQUMHKh2eV1/oAEOkDcfQzJ
 lUXf3BK/9OJ+OthAPj1vh9+WGIvBOr3F1YpQWctfN+NqKzf6B0gr7zE9ytbYuFBV1uuu
 mjVow7wl1crkS+CdQScfdiKhRpZskO1gaiF67Tmn5r/0tZES7wtj2MhVP0+a+HoTBdXZ
 wjOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAYhBFijEZ2CMlZEZgEdX28thG9IP7t5SxU4SpgRxhiqTGuJ+r35xqazinfFQekYpzpCzOk96pKx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/xIcVFV0cad8KdH9jhEVR1RfJyy3TPyahgySWzGh7Nu6dLwSO
 ELCarKUDJ+7TEsXSBctwIpQjDNOuTSN6kOzl5xuDxyMf7D+oQyy8wWgBNeQ6h5X2356dDYPGRs0
 OiAt5Isbv6OPSRJ60Vgna4evXKXGFbrAr0j5nuia+ZNGqPBhq3P27nUosZ4j4m7BJOmSuEQs=
X-Gm-Gg: ASbGncvcymlVgBKWirTFpyQM/USM53egUfh0tv2ldmB8nZl/3BZl34itq8wIVJSKaq0
 NdDwnEqb2aTh/VhaGWg9dviEJmWRkjDN3F8O8XfC3xzWJLOFU6P2vno2bAM/I+so6gGG/0gkesh
 7RDScnQSTflZ5eXWFJJf045phod9s9J/rugbt+SPmkLYR9alplRVEdOBYLOixVjAxlKpT7kvcd8
 qea88xqAojiKKSITK3yXzU++Be+/Etcc52uqrvYQEmF7CNqi0yydqml2x6kB8B+z9+dSt5pjsTJ
 PrW7tnlye+a3n77cCyzSYtTCtCqgThYtP8kDlsWSVvCh/GqzsaCjA4TH/GQNHioRcz+exBDO8N0
 =
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id
 af79cd13be357-7ceecc166b2mr146502285a.41.1748036766400; 
 Fri, 23 May 2025 14:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtKjp4VMExAhHDbSXwWDUa9R+2e6ssRs7xky+iVHD5hTNFkKSYPwh2y5Pdk3RKrIoEHeQZ1A==
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id
 af79cd13be357-7ceecc166b2mr146499685a.41.1748036766120; 
 Fri, 23 May 2025 14:46:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f34d56sm3971854e87.80.2025.05.23.14.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 14:46:05 -0700 (PDT)
Date: Sat, 24 May 2025 00:46:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/plane: Fix error pointer vs NULL bug in
 create_in_format_blob()
Message-ID: <r3rars6vn5wubijcixmpb753dv7vrg7h6yukbpsgl2svn5pudq@xbnkzn6euh3u>
References: <aDCdRKZHmCPwaJWp@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDCdRKZHmCPwaJWp@stanley.mountain>
X-Proofpoint-GUID: is4pt9R3_Ov7Onjp4XfockoxdnQkBAqw
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830ec9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2C2ebHZnuNSfagipGo4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: is4pt9R3_Ov7Onjp4XfockoxdnQkBAqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5OSBTYWx0ZWRfXx1UFxiCQ29UD
 v/LFKSXMG7b3RfVpkfIIEG9TAGY+OKLcwlI/LiwoAxGHavJZu+sG3N0nEBZnWCvUsYzoEng9l8q
 cOaKRl1XT7attc5SsAqaxbW+rk8Pl4yPRiDRtLuYavtxn5Z/yGvQAFGhYWp7+uz8JGagn3T66HZ
 XeftOSodQhm6xSue3E3wpIWC0XVPqxbK0LjMI3sEjGKVPzEYQQnsV65RRrPeJN0vLSkqfoklJVk
 mJXITDMtdhGIe2laWfa4tSVA3v2ZhsUYZ2K797Qm2EwrBl6cVV8hMpGwWa4eHxOBPE0jCf0TuWP
 oQxifUjcuXCl12pgDuW6nVTN+ViAGcvl/6DAcI9bzP3iY50J2oHiTywXOl6wAhUsmRfegE4Fe5w
 eEnRZ/nvQLuc1K7BUKLkxAKCT39K0NkIW2nmRzddUW0IV0LJgw19XjP64djYYBod3SuF7Zip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=904 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230199
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

On Fri, May 23, 2025 at 07:07:32PM +0300, Dan Carpenter wrote:
> The callers expect to receive error pointers on error but
> create_in_format_blob() returns NULL.  Change it to return error
> pointers.
> 
> Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
