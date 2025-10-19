Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCFBEE4A0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 14:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3EA10E1E0;
	Sun, 19 Oct 2025 12:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="En65Ngbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9438610E1E0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 12:14:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J5sp4G003527
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 12:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 puNPrhTEXrfqnZblxaqGqUil1ruzTr+zCkgmrxJ5Bek=; b=En65NgblGY8NIrNy
 BjKP5KUK4ujMB3MNse92ose8la5TWB9nGsRowsVSqd47vWUpN1okqFrwbLRbe/Pe
 FNXx2CSQ1X00JbGgoIsnH6KHLWY1Qolrujvn/NYfSUhBI4uBbBj3taB/vAEKIjMg
 G+LNq+UP+2K3EqrMaLSzL+a9/fwmXBc2Vc95pgWrtnRnurCCfm6AZnlgQNC/gZv1
 RIiZAK7ux1qSlEfc63GcdYqlW9InQamQsiC4mUnRhK9etJjKT0GL+cHeJx6Kjb/s
 cRb/ARXhJ2FMsgtGx0SoulEaH3RtZW1rxb22UtmhV6SMakH6axSzxO6MljqW6bs8
 EtMyZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3982a91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 12:14:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-88d842aa73aso405032385a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 05:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760876068; x=1761480868;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=puNPrhTEXrfqnZblxaqGqUil1ruzTr+zCkgmrxJ5Bek=;
 b=GnroiNxthIzNw8+D4R3PEYTjk9hZ7Zo9ydDld8FnCCSW1RVPgVNhCvfaOA8rG0doNF
 T/R+qxAit3RYHU+Jxka3OMBa+9uRrfsnpKghtzoXmpnnlcqowTBaLL8QhvavecawT3RZ
 n7ZZrPOMp6EbCrQQVXh9NMG7oqZzrNBV4/8d42fdaMmSJqnUefBVmeLdm+ERT7hZiOlt
 uBHeYea/mxxWd6SXH+e6+o+vLilvQ4NjxnuPpmHtYQV97TDUSAamlnn7HfD9sk0IB3Kf
 GiJdS3vt9hQE7WpsMTmu4KuZiqWLnr0ErqN5Ph8dJfvapM/vopXG1y+TqN67xVCu5GUV
 ViNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2lZl+vRvocxPs/f7+MTfT6ewa+L7+yERNmAfogNmvz/OsxXYX11WpYXiKHFoC6BDcjkV1LbZCF7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXS8uPmfEZIZvxXJd3WhIe0NJnd4uw77uWNRq2t5IKRhAuNHcc
 nqlAbNX+UvQQ/oPLVPfyG/KJA2X87mU50DSIkcWsD+/d1EOxfl+eC2iWfAPOQ+YuCqGMinDC8GK
 sPrkQ90B13Bq1HJbID9xA4WyQgnjsu5+X+pNBudta2ralc6Jq5tsmhHSEyrzsni+n+xK4A8M=
X-Gm-Gg: ASbGncuQ4gr6PUUVdYaflg8aMbL55eTACZdWcIIBMXzZ0yxdY5+WV9IwppThuYXPHM6
 LQMv43XUSzv0EyQPaVZCep0IvaKoCNn4S7FAE/c2gLRJsc7TUOPiAAkrvxSIFlabK+ob2eo8A+Z
 Weq+wPJUh+OXDhQmEmMUucLXEJE/uRaRO66jSBSA2PV0kSZR8IEDNChxVrZfZTtgQA3b7bxpRml
 kgR5RV39J/lualYF6DBpsZvTn89YO1SZT+ahozQtXrYZ/WTLy8All5NlSBQ16uglRnZZhpM1R/Z
 iYXHTrOVgfv6nARg6g48tRo7w71/Ti5u8gGowryc8p8mA1okBrbdQpmXlqkp8jM6+kBP2heIVvD
 CEwFuGRfT064JKRERIaPx/MnsVMtRvtR5oytAjD0he2m338mSxeoNQdT5Xyue4If7z5k0SwRX0U
 znmBkEeaDFSWo=
X-Received: by 2002:ac8:5985:0:b0:4e8:911a:2af1 with SMTP id
 d75a77b69052e-4e89d3625e2mr152707191cf.46.1760876067812; 
 Sun, 19 Oct 2025 05:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8+CZ0NJ9bBoZZ1GZiXuCbYiL/YP/qmggrLH+uJV7bA2b9ganhGBoaFnRrleOl3gY/Yk+zFA==
X-Received: by 2002:ac8:5985:0:b0:4e8:911a:2af1 with SMTP id
 d75a77b69052e-4e89d3625e2mr152706601cf.46.1760876067319; 
 Sun, 19 Oct 2025 05:14:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deec0b98sm1528227e87.40.2025.10.19.05.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 05:14:26 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 0/3] Add edp reference clock for lemans
Message-ID: <ql5ps7cv7x6hz3otzz45uv6pbr64x2hdapa66vq2jtnt6l536h@kbktvupxpf4y>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <7jmk3txdrnit6zn7ufra7davmomggd3graizdu6wqonp3lljza@mfnxt2owpknq>
 <4bd619e7-e9ca-44a8-9d36-10c18d7a8157@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd619e7-e9ca-44a8-9d36-10c18d7a8157@quicinc.com>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f4d624 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=FYAu2dUYg65mSESSDlUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX+wEzo/bI73jG
 9/2l1v8V2oZUv4JjPI+oVrqKuHPCYDY+uC132jh9nUfEbCfNXCMTsxZi2nxoE39aTn9rmdoUGG/
 uWPouU2mAgZZ2sbZ6F5m2Kcmz601QZmgz7S6ENURUuE6fjlZaoxm8+bVyOmV7UCVrXGGYlIcIzc
 RCQWHXqI0LF8xw+ETwzngmxt+SYT8lqWhr6lvUH+nfEuF8EktSNoG1kVnE1YcsTQtI6ikj9iKrD
 Iax5M0oZq5NYPPRgSPGqNFCohEof8iXpfIVbrLotrFdTmz6CVoYZC9AONwtmmcGWKSSquULbL8w
 dwLGUq58NdLRUIW+PMDLwDvsjUc0LYaiUfHWmR6YFhWkskvJRYkE9UJuHvYqQGTIRVEPrvWa0dl
 7Bvo7ZfUD2zDZZNq/hRyLoQPM0U1Zw==
X-Proofpoint-GUID: Co8lrbS1YZcwV-rsaHxXSNIpxCwdE7Fk
X-Proofpoint-ORIG-GUID: Co8lrbS1YZcwV-rsaHxXSNIpxCwdE7Fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025
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

On Wed, Oct 15, 2025 at 02:49:08PM +0530, Ritesh Kumar wrote:
> 
> On 10/13/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 13, 2025 at 04:18:03PM +0530, Ritesh Kumar wrote:
> > > On lemans chipset, edp reference clock is being voted by ufs mem phy
> > > (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a9457
> > > ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> > > clock is getting turned off, leading to below phy poweron failure on
> > > lemans edp phy.
> > 
> > How does UFS turn on eDP reference clock?
> 
> In lemans, GCC_EDP_REF_CLKREF_EN is voted as qref clock in ufs_mem_phy.
> 

Ack, please fix other comments.

> 
> ufs_mem_phy: phy@1d87000 {
>     compatible = "qcom,sa8775p-qmp-ufs-phy";
>     reg = <0x0 0x01d87000 0x0 0xe10>;
>     /*
>      * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
>      * enables the CXO clock to eDP *and* UFS PHY.
>      */
>     clocks = <&rpmhcc RPMH_CXO_CLK>,
>              <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>              <&gcc GCC_EDP_REF_CLKREF_EN>;
>     clock-names = "ref", "ref_aux", "qref";
> 
> > 
> > 

-- 
With best wishes
Dmitry
