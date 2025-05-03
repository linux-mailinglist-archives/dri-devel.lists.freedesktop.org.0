Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3141AA7E42
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 05:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5965C10E1F2;
	Sat,  3 May 2025 03:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqNimg8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E9D10E1F2
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 03:24:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433GXHE030672
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 03:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HNn11L6/OJdqL1KxlXTIOqrP
 MSyd/4d85l4dZRszfNE=; b=mqNimg8FgKNPkxiVarAAUTad7ddxgTRQAYpKfGG6
 sXGc0i203ddz+WMgaLCFslK9m0A6rZrgnKmebT86cvlZxQzAZQWHJYtG5uCQFNBm
 7pOuqW9VXfvsmR74jnKhOMr5a1nvjVzZDHTmYtGTIVAOWqkCCh1/mIEFIpEdToOY
 6zOWhw8ejDWM6TFYiayelzkzmtrapr3Fwp4oAUEiVgEO5JG+zNvYEWCHp2zJrFoV
 cVukF5AU5O8dCQdzhqLyzB4tK4gmULwGFtsJy7aVIfiCexma6J4LWntq4kzFDTHS
 3WEsIE1HmirLiuWqXB8N1klupAEOFU7Q5q33a9qUBKIRoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9c6g4xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 03:24:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so249553985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 20:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746242656; x=1746847456;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNn11L6/OJdqL1KxlXTIOqrPMSyd/4d85l4dZRszfNE=;
 b=D5ZtHsVS+4np1zzNspwzwPAJTKh8PC1hr1RwwLl4E9hPEy54kEaImNJkEvwcMhIabo
 sM7r7/arXBq5jWe8mZNrQcYzhc5HEcN/vuoXeFfEyzHo9sB00UiSXy09rSlDlcTgxnRc
 P7AaKfFLdfmnWShi9t3x22WeffsOyMNWtl0hTvrOohrjyL+kVWxaWL/fvHPX0C87Skg+
 H5kF3RCqKJMIQmx18PfL21D45McSLAknPTpmpPdeaMnxbi8dgyuuSqrpqAABACfen/Rg
 ShcWZ2GoXEdawXBcHs6O6cJduXsV4AXAVmXApdXQkCNqpPGYNxBrZQIC4gWxtC1qQU16
 viJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmri29NLLO6TbL8nJ6oHb4/PD8gvJRUmQqXKuNgk2uiF1oiy20WowjxxkCacVJERa3ck5qkLjopnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw02F1RkHLJgSXn5I37any+v8D3ZkIBvs/WzK+IoHUuMD0HXPHn
 vZ+Q61ZezpDOut+Vz4XT2Vam7AFexO00ZuFeOiIA3SNCq5VBvuUbptqJzHt0VMVEhU+ygdVa1DL
 QC/9M2otXRBzbLe1AypruX8ItQn2XjPCs7AhW1BS2OZfWbfQ+zZx6U7JilqqtMfHmnWk=
X-Gm-Gg: ASbGncvlOipLWCCtxn1X4LFD8OMMumXt6GUUrfMvAfAwAw/W1Q3T78NK2lXBQKXMtfS
 Kxdp4EA4UB9FAnHZW153+YvXbO0wWsPRV8fOsOaGejYWetep7XkD97RK877l5tADuQXRwbUk/pp
 9z+nxBLFVRrU2yxnzJqtlvt3IIR6/GdesMV4ssqmCJABVdF8FCRIZPGNF7WrkOxWeXzpYQiwHhw
 +6A3l2Euf3ay5d2ZgHWbPj5nbo486FmHmtYJLiBMY1i6JFdPKXfLfnjTeVIbRzDlJs5WKUVyQkG
 9zLRYmJFV+qIQKVpW9huAHmk7vk+raTpADVc8wu8qxuo7/LAQsQly3Wnoe1Znz1bPY78BO2lWSM
 =
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id
 d75a77b69052e-48c30d80333mr98285501cf.4.1746242656388; 
 Fri, 02 May 2025 20:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4Nh9w5WVGC3RST0VkgGNMJID+vfLETSNmPjq/gLaq5uaPvrEtf8fnY9OXH5/qZ29zeu9ZRg==
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id
 d75a77b69052e-48c30d80333mr98285261cf.4.1746242655974; 
 Fri, 02 May 2025 20:24:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f6a9fsm605856e87.234.2025.05.02.20.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 20:24:13 -0700 (PDT)
Date: Sat, 3 May 2025 06:24:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <nxft5c4fi3pmm3r6y46cx7nigto75g3j74qmtcyyaysebegvh7@vseouireocc3>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
 <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
 <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAyNSBTYWx0ZWRfX9YuuvtxxS0i7
 Y29yogOFSKdvOfMrmCXnBYL0egna4xzzEaX9gZ6gSM0ZwdZh0QVz5b14LutzNFjWL7RRLuot471
 qVvhyG9WGrrWOD++ZjZJuIcvUGslQKYxP/a76qWPNq6H5OFuvoQVEw2vCjr6EK7zTZQpQ/adylz
 GYBn1tIa6Ycay5y1kphu1L9gwOUcwGWgCgGJXRSAV3yCpEWgZnioet1yQFSUwrgO6e4zbOI+B+6
 FSnAyIvb5BgABOw5mjomcawl4w0jWR0Kl3EMuYJKMzMTajgcA2mpZ62bIQBZQ36nO5Z+WdaLWBR
 aNGOwlCFzUx6iTBqomwrZI+/InqmsgKMz1coCkycksEwbNnf2ILItV/G6dBxGB1XfhlHPBwLSsn
 uY8/XtAms7AfQn3KmH++ecX5ftRQCfL7bFn5/Dhnb9Og9QF3HxWaI2yicMlV2rQ4FPSxGWoW
X-Proofpoint-GUID: 4F2oe1F3Of-vxPcxsqKhiNTXxetNlGAd
X-Proofpoint-ORIG-GUID: 4F2oe1F3Of-vxPcxsqKhiNTXxetNlGAd
X-Authority-Analysis: v=2.4 cv=BYzY0qt2 c=1 sm=1 tr=0 ts=68158c61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=H_hWaF1uyuAelWpSFMAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030025
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

On Fri, May 02, 2025 at 04:01:35PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/2/2025 2:54 PM, Dmitry Baryshkov wrote:
> > On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> > > 
> > > 
> > > On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > > > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > > > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > > > Section 3.6.7.6.1.
> > > > 
> > > > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > 
> > > Hi Aleksandrs,
> > > 
> > > For this patch and the rest of the series:
> > > 
> > > Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
> > 
> > Were you testing in a setup with LTTPRs?
> 
> Hi Dmitry,
> 
> No, I have a setup with MST so I re-verified SST and MST with these changes.

Ack, thank you. I was hoping that you have some interesting dock setup.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> 

-- 
With best wishes
Dmitry
