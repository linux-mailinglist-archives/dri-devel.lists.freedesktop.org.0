Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FCFA63651
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 16:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC10210E1A1;
	Sun, 16 Mar 2025 15:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBfyneZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAC510E195
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:43:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GFN6mH031976
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nTKnVV8zpjbA9rOF3XkcFyf8
 84J/ODhN0CmXOd3fWGQ=; b=hBfyneZaM9Oub1KLXo2JPnUlVMFfzqGOt1fDcZR3
 mFQvVu78ux7JwwMTWdVpOOSecdYOnkuXqyF3QlFocnk8Ds4gJSfl+7wwOT0wGmg/
 3k2wBrYJVeuNZlNobVyxubQjgvxuzbMOMSFGgjUnDitQ2+9ZGs0D6m8oNdKyuW0I
 UfnCQQs1NTToOdbZo3lk4WzTUuIlefF1U9vaDZo5cmivjKIDeqKnSXGBr3axhCE6
 M+YX9FQ2WpdJhwi7LBrt5XUflm/VKDXguvKuQIKtxmAChQURIgsIV3fFNJ5MS7Z2
 KEkIhv7UvK1P6HIlEiMeO0Mw7HMue+LWQQ31EBPrbn6alQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uttcv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:43:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e91f6bb296so72165056d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 08:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742139795; x=1742744595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTKnVV8zpjbA9rOF3XkcFyf884J/ODhN0CmXOd3fWGQ=;
 b=n6ruwiN7WlFAEiiQe3plisq4n+ZKOzwSdsHH82XLsBtRBpFI8Ow8sVPo0mAduGnQ8D
 k/1FU6rIwibnr9Z015vyFMpnRjXuVnSfHLnDcYr+13kc+WlI2rOJB79xpgSLMUQFV+R7
 7G/Iev2TH2f4OmuR63Rf97y7pAY/7kmAGB+AL3QUQJM0W20N862qbyHAds1QJNEVzYgp
 a8rtYaj4/mKSxnYP4WjYHTxQz4KUiP8y4jtC6n14NnessxI17v/EZb/Tuw+WwDg+fUAf
 eQCLRhPQx+PPy/0/owVk4pc78f9hC9zeygKkp8wy7bXfDusVOgU1oBGmGvBRKjWX/D54
 wkQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNQYN1DvTyl7pOjKPj9AWGOEHTMhdZxaJHWAkWz8U7lUS3eRc+WNOgipUctBsmlEGTxzuacY2hV8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxObkejwUD1WSBoTKpvQREQ7FA3RYgxe6OqZDYBxyZys8+lnTE
 ykWj9qAqO2kbfuqZh51iJhutkkUUbbZI8Dx9/y8cAwFG9mGiiXoGRdM0YJtbc3dcskOQuVy6u1h
 FwvoQbxvEF7ryAuPBkVypDdwVXpL66tKPn+V12uuLVoJCR6l2ML8/3Atsqy+yxzPcZlA=
X-Gm-Gg: ASbGncuw/gYcuV88RlaDwkrSEXChahtX8PRI/Dkp6illfKXnCHKfD7SCf1YRmsxW+xH
 A6h2CtNEGXJRrHdab9ny3cgY5squJ+zfVZFUo4cEGFzKoTsnWRHcLaRjEZLZEYy7/KU3kQ7kvdS
 lQ8vI3qza3C4aJ7jWu1xqvDQNCtT6UsWlXtoZb2AAUswlaxtehvruX8EKoiTsxfi5gDhjXlJ59F
 TL6qiHtdtrr3TIxiAmoGcJDpf1cPtLjxPGi/gy7pL9TJkQLtXF/0tr84CG4H5aWMGSN2aEvXBPk
 KbBSuIccOzoZbkrk9sB19lyxebrGkTSGjztEXBg/NipSe1Hb7XXpeVwY5qhpBPn6lZOtDkbN0IS
 PU5E=
X-Received: by 2002:a05:6214:20c1:b0:6e4:269f:60fd with SMTP id
 6a1803df08f44-6eaeaa8dbcfmr169377426d6.23.1742139794786; 
 Sun, 16 Mar 2025 08:43:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVicho57Y1BnXkMY5rcn5kz+aTOc5CkCnSLuY7XVtUqHQzAeN8zk7y/0byzpjmwxoqpvC9vA==
X-Received: by 2002:a05:6214:20c1:b0:6e4:269f:60fd with SMTP id
 6a1803df08f44-6eaeaa8dbcfmr169377116d6.23.1742139794442; 
 Sun, 16 Mar 2025 08:43:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7befe4sm1098326e87.55.2025.03.16.08.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 08:43:12 -0700 (PDT)
Date: Sun, 16 Mar 2025 17:43:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <u767di6jhx2ufl77d5zo2eg7rjqq7cladstsggvncophzerhbi@kr2vjer2bfby>
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro> <Z9Z5S7ES8d7mjTsJ@shikoro>
 <20250316094042.GB29719@pendragon.ideasonboard.com>
 <Z9asKLWKyrDXDwjh@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9asKLWKyrDXDwjh@shikoro>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d6f193 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=bOCYWOrEvSxgmqsQ7gIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: g_hfm_e45MTruVBdZsSzf7OvYVhycvl8
X-Proofpoint-ORIG-GUID: g_hfm_e45MTruVBdZsSzf7OvYVhycvl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=796
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503160114
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

On Sun, Mar 16, 2025 at 11:47:04AM +0100, Wolfram Sang wrote:
> 
> > > Just to make sure: there can only be one bridge, right? Because the
> > > suggested name is not unique.
> > 
> > Bridges can be chained. It's highly unlikely that a chain would contain
> > multiple bridges of the same model, as that would be quite pointless,
> > but in theory it could happen.
> 
> Thanks for the input, Laurent. I suggest to keep the unique name then.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
