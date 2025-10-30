Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E012C21A11
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D0B10E2B0;
	Thu, 30 Oct 2025 18:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C75Z2qjU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a445YgKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA4610E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:02:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UFHF2f102648
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RheHgo5pVuvCVdocn9ENbXAi
 PLiZAdlGRP3oP5F0h2E=; b=C75Z2qjUoMsGdoIq+At1x0n8FOS3Hrzy2R6drmju
 eNqHssKq+SuqRZeOGqSu57BLljrDLuBxYjeKsmD0dFqwlNSvzfdkfX8W9+tdbsEW
 ouK6mQDYttHoYvDvx0yx7T3sSLLXPhplvhCrPcKWuIhLLFPYjt7fpZrFHVepawsB
 omVIbrXJeqvvdJ4BV0H683ffQ1TuNJmdIoSNdmeBJcoDatyfP6lx+w47fZ76RrLI
 Hhs1GZA4zelYxuuM3xs7oS92TSNgIUWtXzVbrbI/9P+HKz/oP9nNcYPLRcNrPRk1
 Vkhc9RM9nf0ocH9ooR3sK5flM4VC/Q18+0v1vVohntiouQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdgg05-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:02:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-556cd166749so2514019e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847337; x=1762452137;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RheHgo5pVuvCVdocn9ENbXAiPLiZAdlGRP3oP5F0h2E=;
 b=a445YgKFgMl0weUfV7KrnCmGnpniHOt6OSU0ss3dlZtzMrXE9e8GWq5H/6IJBROaBS
 72y/vBspL/E0HrwyblaHoxNX81VbzWIFHvepF5EpCtYQs/AuW8otz3raSifUMK69bgLd
 BK494LRMRvYUfwnLArB/7+Hj5UY13RDSyF1lJ96mbxZ7tftZh0tkteuRb4OItxsU+mwt
 I4K4gtmHTad4APOH1B0NfiR6eZ6rXW9srM70MZuC3x0qG6rX51yREAyrYirZwjwVCmGs
 fpS41Ke+KJeXyEUHDmzHx0Qp/Jb2RU2Q2MRkeXxw4KlyGpD7/Rmf2Xj4jm+ccrrI5Sms
 6QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847337; x=1762452137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RheHgo5pVuvCVdocn9ENbXAiPLiZAdlGRP3oP5F0h2E=;
 b=Ukk8+Wt/xQNEEQX/FTfFx8U3ok4JR34R7k55J010Qw9rimtSVU1B1QP6NpotA4fE7Y
 gDKBaMRsxLvjgTdK8lOA4VcYyUcMLWuNzR0dbSXF2zFuHEDGjG0//rDXaG4Con2fFdZc
 XB5I6MgGQXTG+YLcB9/wai6xjrrjA+ytFPKgA0Xg+nStD93ok/HHqP1Onb+ozDJIfqU6
 kTlLLD3/VLfoezWZJzHfyHSSprm/FtYE8/xDWen6SawSC/V0E455HPOJfQ/DGF+zRWRg
 IW86HFeTkTa9YrkG9X8RP8qi5zl090/Ha+OPS/7PHDnRuJ6Elau58ZUnEOCDk4v5vjUA
 B5sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF2+sS4EcP6fDia0r7iaZb6pXK/7lxa6k8OrLPW34x80U3xwqKisSpU+Ay5EHdeq7YwyO9ORS7OqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+AeP2Wvttpl4uh9RqubSghc6RMLA9+96Ysjm0mwcMJ/x2eblO
 3hj7T2p+b5xs4S8wtHCjQqkEPNqkiYI4WEtfg1WMU8YRnSgKbQFe1prbUXJ6KlPR1iDRYCiYwml
 NIJl975DUeaoX3rvrJr5ngOjmCp0t7Q1t8R1QcFLC43NEZG6KeTOFfS4fYJ9JOSCsLX8o/3E=
X-Gm-Gg: ASbGnctIe3SJvdAT8uuCniCoZxAwwplUBej2N5wnqV0pYLlzu910OBgc9eFZsvycmuI
 TZxUS2Fl7NWtpUpQv3H1xK+dHAsgWdZOxs7zplXbLKPvpghPUijRsjELsdtmh0J843uGTGNzLdS
 ZXvh1Y+LNWENCbJjMe9IJS5/tnLPRHHKiQ7G1TPkUXcGsrhg5tS9IkgsNjOOtuUBQ7+PsefqYZe
 1lXFlmcGL14kVXUmbV4tuWZAbReDa2TBrTRp2aAHFqSKYE7ET/6Xtlnak/uGaM2DN+8QRoCsoVf
 a2q3esSh1EmTTj2fAyjVrgSd0lEMt062eggOxr3hSOpUCgQnIBcd8hr2UNIU7LybibMSS5Klb6t
 AxTNeMR0wL+g5OmeXv86h+ga5hYshjdWdvjQcKNXaWE5DCq0CxApp23rP06Hji9ILk/H2ACpNDp
 HCA3pF4OHzz1fg
X-Received: by 2002:a05:6122:1b8f:b0:541:bf69:17ac with SMTP id
 71dfb90a1353d-5593e47e35cmr384144e0c.16.1761847336555; 
 Thu, 30 Oct 2025 11:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTUInpRsTJOc8SKFIzEahxJdQTKBRduSeEFhBOHHqnWR1cf+EOntfXk2b22CcXF3blRRpO5Q==
X-Received: by 2002:a05:6122:1b8f:b0:541:bf69:17ac with SMTP id
 71dfb90a1353d-5593e47e35cmr384016e0c.16.1761847335762; 
 Thu, 30 Oct 2025 11:02:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092282sm44025471fa.5.2025.10.30.11.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:02:15 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:02:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MCBTYWx0ZWRfX3+D2prXqnnFh
 j3hiOs1VBQhQdnyIDtenWF6qXlr3TMNwc71cNmfOB6HLm9BWCmBCWbtzPE4HWWIRQY/p1gjLJoa
 FnITxRhlBIITST5h+B5RiWWnm/i51N2SZzw3wqWroyMZith9ZCpAkhlaQ35crP2smhR6ZTuvUB4
 4zrs7oaEjsau/DR94YxO0VRkRgu51gikKRMi+PZdqGOVt8UU2hrbv1Gsn9kk+zXUE1PiskNix81
 Y3wF0nIMTn1qnxfgimoXLZWiHwTPkoFo8/W6hX1K23JZKJNIxz/migmbFkzIsqeKT3N15uMrdXb
 e3fPqlmieF8R8okYbbQEniT41fmG+oizE2GMENvVPQKOSQmpoe/Nfz/eWwFiCDZLxDjTRMrPgXf
 Wn8qK5BQH8g66/SaMFwMTj1OoTKxqA==
X-Proofpoint-GUID: I7-0rIAXyYZYtUNPwcEI6CFxO9NXXUsJ
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6903a829 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4LvRZMndKBpg9nUHPPEA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: I7-0rIAXyYZYtUNPwcEI6CFxO9NXXUsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300150
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

On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > 
> > > > > DPU version 13 introduces changes to the interrupt register
> > > > > layout. Update the driver to support these modifications for
> > > > > proper interrupt handling.
> > > > 
> > > > So... Previous patch enabled support for the platform and it has been
> > > > using wrong registers for interrupts? I think that's broken.
> > > 
> > > I want to express DPU 13 has different INTF register address, so need to add new
> > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > 
> > Make sure that patches are structured logically. You can not enable
> > support for the hardware if the interrupts are not (yet) handled.
> 
> Kaanapali Dpu interrupts: 
> INTR_IDX_VSYNC,
> INTR_IDX_PINGPONG,
> INTR_IDX_UNDERRUN,
> INTR_IDX_CTL_START,
> INTR_IDX_RDPTR,
> INTR_IDX_WB_DONE,
> 
> are handled by irq handler, so here enable dpu_intr_set_13xx. 

You have enabled DPU 13 in the previous commit. And only now you are
adding support for interrupt registers on DPU 13.x. No, that's not good.

-- 
With best wishes
Dmitry
