Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5BA6C1AB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 18:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403510E7F1;
	Fri, 21 Mar 2025 17:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vp4vO6c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD72A10E7F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 17:37:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATAUl022087
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 17:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5EPzIyilGqOZI5ta3x+QlI0t
 ANS6zHW/9qVjSLgS1/A=; b=Vp4vO6c73kU5bmNKyEmP09Krk5Pv61VWGOqeDNFb
 LmYIks7+mB2u+gNWcH1kBFBVPXA0Fl1JXqsM2ObXX3DLjh0BllYGJMr8TsD+IL8V
 RWHGJlARaIlCdwP1BicyOWvsLRnbpcFuginyUV1V+GYSr6K9AdpuqHqcu9+IjGsq
 9ZcNOFiG9L2lbdrojt0CH7ldJtdiIKRPn/98WNA6k3+KZffaQId3OgzEyky5ELnO
 uSjqdWQfC+IEgUNK1tQZCBLpz5VLzAPw4IOWQLs3+qne7KJH5h/IeDI1G4AxCRJ/
 M9e2oMooTPTRR0holz5WdSOormxc3Y2PZ35WNrHVLyzwig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wphf2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 17:37:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f9057432so42384466d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 10:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742578657; x=1743183457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EPzIyilGqOZI5ta3x+QlI0tANS6zHW/9qVjSLgS1/A=;
 b=m3CwnqJqhdwSkT++ntd8ZUB4FiSIuexaBqLP3PBlm3yZbQNfIswL4hJhamPyXJ+VX5
 +v8D86c85sC6pQOqF45WuTLVkz58tuVY8rsIqZD+JctxFe/TAr3u+chyR7oGWYbsgOa+
 lPZcWykTb9nAHyJHFx7sN3WYd+/izDBQTbqg4jXeHtkjSHIzu6QQl2hfEzJ04ZzCdaJl
 bMwplqge7YfVHV6g0OCR+RcaUzYOkxuUiaXc+H3HNJlgTA85JW7t7bZtZRd4tX69uES3
 20djMH3rlYFnVCB7Wak/WzKvDyZn/SaOf98f6qYE0vJFS7zm0FMcYpvNV7q0itaQ4Vpz
 t6eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWTahpTeQIIxWutor/yuVo0cmBU4VHPomaB8k0xKt9U7JKpLN6tsQMjUmJg1mYgm6dReo0bUt+QCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzinR6gSAO6HA1s3cx9cCKSIBqXG52TYwWzD5cbx3CxFIed+vXA
 DlqQ2tPa1ZfP78M7GwEJUC2tRNpjnsddij1OCWofvgmuSv3zfryadGZnVPY1AYF5PyClt2xjhT7
 HtG6+N1oYq6owZIbhmT+hOVSuYpWL+uMhVjQgiN1X3RcnUCTByjirU552f2CJ2n2o758=
X-Gm-Gg: ASbGnctLmXGp4if1UyGUxmR/oQr17ydJ7OGnJi17mw/J+EfCzo4V/4pguP+jYgaJ+HI
 wIJw93Aen9/1NBYQ9wU2tyFQ2hEqf4bUZQMs3k0eWJU0UwF6FMBDDmZp+ZgJ8xqCNK2/rjKRBxg
 8/9uKdKIB/rXEzsbCvcPRr0QajLdmh7V8Vi6cRlV4ZsmEyJIEamYJl4YAX57aL+q+yOFa6/KWtP
 iep9bBkSJNGbFOh8WVbr4Kt/eIguOJTnz6+R2UetQuIRevpn1bjGsm+ZknONo+WddZi+Mwi0SYX
 DaNeu1Am8M88MZvKCwAV076VVMlBnFXXzRvQPJlmpEkh+WMt8v3Ku6EEGKb3ut/7f8CRczKepeY
 5wg4=
X-Received: by 2002:a05:6214:cc8:b0:6e4:9b59:d9ce with SMTP id
 6a1803df08f44-6eb3f2858e2mr61754966d6.5.1742578656891; 
 Fri, 21 Mar 2025 10:37:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGADBjRs3rs94/YLnkpOq24pSnDwxMlG2hCY2p4qMNbSXk/dzNtWVVKJ5jRUhsoAdgTEJUHRQ==
X-Received: by 2002:a05:6214:cc8:b0:6e4:9b59:d9ce with SMTP id
 6a1803df08f44-6eb3f2858e2mr61754516d6.5.1742578656395; 
 Fri, 21 Mar 2025 10:37:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad6469104sm226950e87.20.2025.03.21.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 10:37:34 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:37:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 08/10] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <lkeezxmjs6qn36qzhmvmtngvrxuwng53rgcb75centx6ds5h4d@dx2iz4aqrcho>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-9-quic_amakhija@quicinc.com>
 <5hvpacx3qeqhjqemhqizws4esdhwg7reli77qey2nin2fggljp@ykgyayj2v3e6>
 <3abefb09-c1b6-4339-8cd9-cd86652c35d6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3abefb09-c1b6-4339-8cd9-cd86652c35d6@quicinc.com>
X-Proofpoint-ORIG-GUID: Nk6hlap4-A_IRCrQW3pn45akRBn4e26I
X-Proofpoint-GUID: Nk6hlap4-A_IRCrQW3pn45akRBn4e26I
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dda3e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=R25bk4NhV3WDM544LqcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=835 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210129
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

On Fri, Mar 21, 2025 at 02:36:21AM +0530, Ayushi Makhija wrote:
> On 3/11/2025 9:09 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 05:54:43PM +0530, Ayushi Makhija wrote:
> >> When device enters the suspend state, it prevents
> >> HPD interrupts from occurring. To address this,
> >> add an additional PM runtime vote in hpd_enable().
> >> This vote is removed in hpd_disable().
> > 
> > Is it really enough to toggle the HPD interrupts? Is there any kind of
> > programming that should be moved to .hpd_enable() too (so that by
> > default the bridge doesn't generate HPD interrupts)?
> > 
> 
> Hi Dmirty,
> 
> I couldn't find the ANX7625 bridge driver datasheet, where all the registers information are present.
> 
> As per my understanding, we have anx7625_hpd_timer_config(), where debounce timer registers are getting set, which help to manage the detection and stability of the HPD signal.
> 
> anx7625_hpd_timer_config() is getting called from anx7625_runtime_pm_resume().
> 
> anx7625_runtime_pm_resume
>    anx7625_power_on_init
>        anx7625_ocm_loading_check
>            anx7625_disable_pd_protocol
>               anx7625_hpd_timer_config
> 
> So, I think HPD programming is already taken care in anx7625_hpd_timer_config(). anx7625_runtime_pm_resume() is getting called for both eDP and DP configuration. 
> 
> If you suggest then, I can move the anx7625_hpd_timer_config() from anx7625_disable_pd_protocol() to anx7625_bridge_hpd_enable().

This might result in HPD signal being generated after invalid or
improper timings. If we can't get a feedback from Analogix on how to
control HPD generation, then it's better to leave it as is.

-- 
With best wishes
Dmitry
