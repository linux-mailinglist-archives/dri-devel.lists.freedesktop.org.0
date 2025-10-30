Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D4C1DDFB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 01:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0283D10E060;
	Thu, 30 Oct 2025 00:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jy3Ktocq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxXvMy7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182010E060
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:12:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TEdAsI811145
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=; b=Jy3KtocqdD5BKvb/
 uSvsMseZSvEDh6Mk3hdbKAkARftkNcBLbPtjXIxJGTPJ4ScOS0SgMWZGvLSKJkqZ
 VYbIOslbYkCSiL+gyHRiDhs1H4sCIHL0XlWKVvVEYSDaQYksJcKubOxHPCBp0ppS
 ELciUmERhtM7AdvvRUhph6GJopohAPQwSpBRlFAPB8pahUiNOtGbnoorLCCPBmR1
 3fik4T98EukcUS6RSomBkUTYrjZC2/G4pcwZy8yCVPmNkssSW5HtaBxfhXGNrSIh
 dxIU5CuMKqhYo/MIH8Z+iVbgUeDrC6IVnlnFM2poLoMGbcR8pm1D1l2lkNGED7dj
 2IpqJA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvg9nms-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 00:12:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a3d0fb09so5259971cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 17:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761783145; x=1762387945;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=;
 b=HxXvMy7mFJrYxxB9MtUs87OysStcvk8pIll0SeMLf/4Q33LWTeOmCJih/U9La/a6uC
 Mf70we9/7ckJ61xsnU8xYmbrb4QjLUJLjcEZmSX8u40yZnwXZHv2iZH9ivE6WmMZ/Lm4
 820Cdd4lhEoO4TO0svatnGgiXhsWwPimbm4igNTayUI0DL29pC8PuZY0pjc7zcsCxeiT
 UEE8bsPOJUghRCIM579eFThmMDlPBbmmkSmmwzixDWk0Yt4eKCm7ZjD/V7YOoNUTRVDw
 VI1E6e1zrSQI3ot0NXr4Qr+O8S/aHVxJGNC7bwZS7ECjGJzkh6tbDSer4CNG3NJrt0OJ
 uhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761783145; x=1762387945;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=;
 b=unKe0lbyfB37F04RaJ+g0tKskndfkLZR0dWPUG+QfL8+vaibLCAKRNIWZ+V7cBSqtz
 XvVF4QEShZVEklbP7KBXJqJYO+4zHaRi5FXiyXmFlbPsefTbMHPnxPy3awERiI/yomts
 SHCBqsT5+IulL4+7Rrv094x+g07f4p9HxjTs04CiYKwbYgzZvO8iE5sTn4AQQduMSpHP
 jTWADUG2sVTxp+3Q0VoL8wNbLbj8ekjQ+9wNxvx4FgNdr386Ocux+odnuhGXrBbqVGG+
 ZDXTNCWxPvZKkWatpqutOeWmdPP0IaNQcpT5jGWXtUK1D8G5zOtClyVmFX6b0103RuGB
 EqwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNhado+qsPUdWJlk4SaHNYGh2jx7yZ6Kw+h3t+ggSlBdoMEV0ftqAoLyJu5yoNzC3r7Rho18TJtc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyOFsXwY6/x3Z0EW8WL6VspRtM9F2bKkRct5h3AtK1C8TvJsFi
 O4NSghmXx7mSzszYpXANZLuBUSLDbbWJB8qEz6h1ffvg/Xw1kZp5mo1wG52lZ3X9sZI86PR917G
 RvJDq9eOKYmG2TEZbCTrFqTAL4a4tFtMg1nXaIbNbNfxJF4Ce/6RQId0lnEqCaGGsabw1Sxc=
X-Gm-Gg: ASbGnctooYDMhav/LgsXHRciD8xsluM/eyVqfZiGpHpERiYD5ZtEui1Ps++9BtYblUS
 126kNqoJ40Gna49bv2rtP9VkL/zKll2EkNUPBzXsusUydUSoQPG8YPXnoFTByfsDr5TWwmPDIF+
 eQJ85zkCvcSMJVRMeI2jnnvCC8ck7tvr3BMa2d1m4WWVK45nLEtFmS1Gn+YhNEe4p/yKcPAWOQ0
 NNVqMnZJUTXJrs9AhhNRuzHX4c0rVebHAZ/tFfULX4NzBVIzW6QvN0HF1cL1fBi+r+6YmsA9eS9
 /ydhmfX6l3KrcpnHmXmIL1eFVpLhv0ZdX4crZvW/1/Zkg7IfISH4mZ9EpRvEYGOVvLUsjZmyXfZ
 DAp+/cbg+mivhmlS8q6XZXCyRQ07luFhcbFqRJ2OFp5jxv4r1me2R1jxegCx+ZZEmt80flBAmWM
 8vuiYmllI4mWRf
X-Received: by 2002:a05:622a:355:b0:4e5:6c5e:430a with SMTP id
 d75a77b69052e-4ed22b201demr15246351cf.64.1761783144880; 
 Wed, 29 Oct 2025 17:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTTPJzQ4pPAdhaocWtdADne4C/nq9/kxzm5f9yI/Y1cbenNeHY/sD8/KOO3LAKlfuZ51CL3w==
X-Received: by 2002:a05:622a:355:b0:4e5:6c5e:430a with SMTP id
 d75a77b69052e-4ed22b201demr15246121cf.64.1761783144399; 
 Wed, 29 Oct 2025 17:12:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f8471csm4163592e87.106.2025.10.29.17.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 17:12:23 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:12:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "lumag@kernel.org" <lumag@kernel.org>, "sean@poorly.run" <sean@poorly.run>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Message-ID: <75lb7tqpoxvvf72iv3ag23yw32xce6ifxaxq4sghb2jhwxbr5c@wbjnp44tgkm3>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
 <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwMCBTYWx0ZWRfX6W2jooRs2ooV
 I25gCcY70yjNojnUpC8XaZl8KVVJ8zZwLdw8BLSbfoCjOV9vEjxHCNQcuLIj59uO7kAQK+NHE+0
 UAW3hM98+XOxpLUL3gEVCIP+5TdoMxJvDrX1baya2edAqi5eZPIVYBSNNrI+wEHn2cjiFs4nxsU
 7sXJYit9j2y2SPOuLNKefkEUkFnrsLkO75Za3Oxk03heuerghVFgifccczaE8PC1M04jsS7X1+r
 rJe/W0pI8MPqQ7t1avYq7dAYON85oywq44UF19FzsWXzv07odIt5S0fnbPotJm+EN8UDT9P5Xo6
 +1oelHKYcwaoAT8Hq4VyjpW12AZK8jJmrSckuAWZM9us5pNip+erS6LgWMxWBiEdi9ZWwCRYl+w
 2+3r5Xe6z8Pktq0z4sEH7YsQMxMUXg==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=6902ad69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IdroE-pjToVxfVGS2yYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aZrhzxPuqvlM7I6aQRYN0OcxqjkZMLOl
X-Proofpoint-ORIG-GUID: aZrhzxPuqvlM7I6aQRYN0OcxqjkZMLOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300000
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

On Wed, Oct 29, 2025 at 09:43:45PM +0000, Almahallawy, Khaled wrote:
> On Wed, 2025-10-29 at 10:57 +0200, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 03:28:17PM -0700, Khaled Almahallawy wrote:
> > > The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3
> > > spec.
> > > Update its name to align with the DP 2.1 definition and reflect its
> > > actual use in the code. No functional changes.
> > > 
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Cc: Dmitry Baryshkov <lumag@kernel.org>
> > > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
> > >  include/drm/display/drm_dp.h     | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Would you prefer to merge this through drm-misc-next or through msm-
> > next?
> 
> Thank you for your review. 
> it would be great if you can merge to drm-misc-next after I address
> Konrad input.

Yes, please send v2 once it's ready.

-- 
With best wishes
Dmitry
