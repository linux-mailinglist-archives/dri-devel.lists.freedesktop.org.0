Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4BC18183
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 03:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3254910E6D9;
	Wed, 29 Oct 2025 02:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut/oCb8h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac408D+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DAD10E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:49:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlcSQ2525478
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+IF6cvldBL9/Hg1NTLulnIyX
 YhW7ryKIv8gV0TonztQ=; b=Ut/oCb8hisq9FyFWEkT0jllUIZYdbai2V+ps1h0k
 aGtXDkRhVsBxB/mDmyd+tQmyp/nd1l7Xw5+DHlng12DW22mW/Xgay6H23BNq9Z1T
 dWsdAWrzIRHpR+CbZkIGphG34TDVgWKLU1ft3ibaaFgch1WGK3dW6Mz9O0f052wa
 ovT0GjPPO0wPK2AdRdGFKoBDSVmrXpc7KRbF4+tNE/lss+bl21Y4+vVG30cfo1qu
 RCmA0Rh+mkCC4Xz2nr1VB5RXFpbEMuU0iu1G8Y3uCHCl7ekbY7dsvjPBlQfRlGVM
 vGblmYFPjP6EoXsJk2xJCd5WZMeMjx1TgIBQGu+OE2gdhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rxeu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:49:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c1558a74aso259455856d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761706185; x=1762310985;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+IF6cvldBL9/Hg1NTLulnIyXYhW7ryKIv8gV0TonztQ=;
 b=Ac408D+wNQ2F8+/U406fIIev3+VMuOm9KcdZzRKqrP9TG8/B5LlaiqHfeJgbJYkPG2
 VAwlXTVvNvdlIvpHQNOrLvLtAAU5HXK4Qho6uc+ZOwA9I+Yklw02N2yNJkZ/VdhOsJsU
 Zk0lVMXLUnJc1oS1VxQd6w/7GVEDAvlIX32qOBpRFdk3wwFLA2zpZ/BsoGrLi8qen4rL
 C/Q3nUAnG8MsPOlKc9VcTt+U6gyS3HPRTSc/vRpJEiFZ7MJ6J2zJwvw4VeFW4ECxHha6
 9KDivtRTVkiImszdd60e2/Q9syKE9p3CpFyeV8uvBa4L0vLB0NmYA9rAfryOgjiZoAti
 s+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761706185; x=1762310985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IF6cvldBL9/Hg1NTLulnIyXYhW7ryKIv8gV0TonztQ=;
 b=cjzJtQltxORlUYInCuwPpXqsBMUa/664voYH9qQAq9l7nolKg4iv6CK4t9rT/ZNa/k
 9PxWj0p66RYmvMiXnDCHwry3uzRE50DCxky9VplLD/ZJ6Bkx5iwwUAXUOhSraTeC1Vs2
 gm/BtPRSNcefG577wAayzu2APamEiYeZPUKZxU9nYvWE5CsAYYmODxz+hNczJj2kuMac
 OiqRJfkb03vVMIkpQTMLrj4X5E+0GYjeZeXK2EOWhvI4++ii0bXxgL3y3DaSnqbPa6rQ
 pUAhZ8abVWchoxK+R3atmWeUu5s76HpKPaRAY78BcG7ol855tNsS7+CDRFUiavbQVpKk
 jWfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7NF6YFEIyU0+SWo3YlNaPjCjRfpLOm5JNgju/cznzRf/R3d8rnt00MPGC91hShDt23XgthQjQk0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd3zP5BEFGTc0pSxVSAKPmjpgzCBazItpYvYCFStDKRu2T+Tdh
 B6qO+HPbN1T0L/XW4GEAdgOLv1NUXzRRdiETsvUWNNwkyinmWru4p8X9rJVZ9eKAfivv9bExEI8
 msp/eEDpxxkNJPojXHFUdQezt/0tRRovIXBQV/+rMdQszRnXTOg4amwcr9V5YnOKlGluTdT0=
X-Gm-Gg: ASbGncuPD+UPcQalvUhlF3AzKkCyl0W7R3bWj44WkDYic21OBUHQtR9IXglWHTU6rPY
 dP1c/e2nT7TkPcC28rpVPNr+TK5FeCX2OICuav7nUGChAvDIekrA0VzDmdzxNFfaJOJa9jDpRdO
 apDbJGVEJi7RM+6pO2PT6xKCr0dFMo5XBoEyqa8kNPjgMZC5sTFI361p8I0mSFCJyki/T+3AYZL
 p5Xr13o7gFJtNkYC2reLmDql7KaFxzldJp9tIbuWdImkOPuCi38Ahuv0G9aREuzxuF9zsOueGgm
 tPcvI621k0pHN0nBj8gYtP+5l3pdTGH8hI2Md32O6jGNn49rcS3lx/0ji8PQzbBI8zZQYW4XuDe
 Dmjniu9EtppTWaPFNlEiAKTOoWhcV/DTLvJCazbNX5JY3rjVXkYNdsI3xVRS+W0oB
X-Received: by 2002:ad4:4ea8:0:b0:87c:2282:993e with SMTP id
 6a1803df08f44-88009aee75amr19409936d6.2.1761706185142; 
 Tue, 28 Oct 2025 19:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxLVn+gGv7wMn67kYf9uALNr3Oz46eoit5eH5w2JkzMEJGDyTOwUBUpSX+Ha8pY+Y9GCwLJg==
X-Received: by 2002:ad4:4ea8:0:b0:87c:2282:993e with SMTP id
 6a1803df08f44-88009aee75amr19409646d6.2.1761706184710; 
 Tue, 28 Oct 2025 19:49:44 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc48a8812sm93936406d6.11.2025.10.28.19.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 19:49:44 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:49:32 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
X-Proofpoint-ORIG-GUID: m9dssjTiLcw_Qo421IfoNeCI9clODP6j
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=690180ca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6MqEXzQhl84AYe3cEQYA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMSBTYWx0ZWRfX9aWZWSTpxTgH
 nQWQfEoA1aSHvs2/5rg+38JzSqxfyfPnnyEuWWdRYvxkd+3/sNMIik8mFOSqcKlA4qmmXYLnfeu
 fD0H0VnsgSXHNk4H2vXbZSrc9WoXakaCspLBsXpsM21u7PFsXmuowJwZmox+2/fKT/kB6+/Lzzb
 2jHWupJggUoqzZgO+3eXVw0cQD5NDsX3IypRQWZj4brHnLC8c/Zpm020uzndP6ICAvpjmkGgC9f
 Ac4gGcuNUXJuqGe9S2X2U1J0NEruty0eeW9kCi67MUVVa5YGm8jlJon9vFOViHhCHzB0mC/kEYR
 /zBHbuKNawQpD02JAIhILFjB2aQGKs7WCkHDkbHw0AqZzIOY999WsyoIFqT+RBRV/nH1FZDRsHp
 G/p00/R0V0oWdDAGRf9gCkV7RQ5Avg==
X-Proofpoint-GUID: m9dssjTiLcw_Qo421IfoNeCI9clODP6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290021
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

On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > DPU version 13 introduces changes to the interrupt register
> > > > layout. Update the driver to support these modifications for
> > > > proper interrupt handling.
> > > 
> > > So... Previous patch enabled support for the platform and it has been
> > > using wrong registers for interrupts? I think that's broken.
> > 
> > I want to express DPU 13 has different INTF register address, so need to add new
> > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> 
> Make sure that patches are structured logically. You can not enable
> support for the hardware if the interrupts are not (yet) handled.

Kaanapali Dpu interrupts: 
INTR_IDX_VSYNC,
INTR_IDX_PINGPONG,
INTR_IDX_UNDERRUN,
INTR_IDX_CTL_START,
INTR_IDX_RDPTR,
INTR_IDX_WB_DONE,

are handled by irq handler, so here enable dpu_intr_set_13xx. 


Thanks,
Yuanjie
 
> 
> -- 
> With best wishes
> Dmitry
