Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F660D0D4EA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 11:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F149B10E133;
	Sat, 10 Jan 2026 10:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGWMeufR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGtbdPOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA2710E00C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 10:45:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AAJTvm3986973
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 10:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dYQJmxLtA6YlVQI11wziCwTn
 +OgvteNvmNWULyo3Ies=; b=dGWMeufRm4yyPfvTyTzGV+kIfLckaUM9vLN7tZh3
 wHVwDOZsxMK+Pxdh12nnInNl+Lt3SSmccoeMtZz7XSNm/1ss/z1qryPA6szdZeLe
 1HOQeUrf3EKEIF76ukVtOg+U+dRpjX5h5TuLN9sMozZjG+KEZY051HcqJQXqeKs9
 8n1hQM1240sGCO0SULZ86kTsNAl/CPv+JVJTJ0i7/tqxtuw6yjQmFKaReWG4jiOP
 kCUyLyonVVVO6w0ogN46xVT/poR05brmY+jHrNNSioWuVMJThjplWaJ87Mf1Qj34
 11R/E7I3U1oNsgIeKJOWEYczRb97ft3ZB2v2/hZgV5HxEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhagf63-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 10:45:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso1051568485a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 02:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768041958; x=1768646758;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dYQJmxLtA6YlVQI11wziCwTn+OgvteNvmNWULyo3Ies=;
 b=VGtbdPOzmJ432dKUxcJIWv0hag5S9ceXHE6D3HkCamTcD4Nrh2yLyG65TMenKT11Lz
 OtWIsbZMnWBMxEl9FZ9tBHVxyV2ArzU9jtb5dD86btYxsu00xBorz1WgNKvLqJ2T2BP5
 5XSDaEaH2f9zsP2hz+orIKRIV7E32Q6Aj9OSNLpvKLnhXdni0LYAtUjVWbcqW/gfZmwp
 3RlQNkwBSMX5vbCBFotSoITuO/2CPTpAqcA26+O/lte/u/BEuS3aat7+odeyAf8RtjPO
 NGRqRdTZO2tdONeATVmW3lr7tMlkAWE/3nQvWsJwq45pb1q4CtTruQ5I89osUbLiCiB5
 IZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768041958; x=1768646758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dYQJmxLtA6YlVQI11wziCwTn+OgvteNvmNWULyo3Ies=;
 b=ePqINHi1lyLCMtO2YdPCtkCeodUklo0ReA2K7Mo48+MohwGszMflti7rCcB5z8p5M+
 f4RMGymTWMbO5DfVJs/Q4ctOm+pt/QNm9bWkWWC58yBArx4DEfLMh1bpdnk05xzKM7Dq
 fI7/M0sXtbRGILQ836k4GwMa3cCiESY2urWbM7K1Ts8tr94FCl02FRJFPJh3XV0xtEpw
 cEwANySY3s4K4y5a+I09+QmWRJrflHfF7zRR0P3emKxHn5JncHTgHqGGpp/0cq7JeTYI
 sL2mD8Skhzw3Ztp3n7Bc8LOG5lt5r48JXAOaX4oAymyt6bjtfrCQK0p61uoJTUsMNPkb
 23HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdMGOnJQVZurRZXivNbCBUqZeHu6P8vGMJ8qC00qKfOg4ycl1WLzf51PbCZWKxUV9ici+K6ZxDYoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUkuogw5J9qCFgSeClF/xC6d/aMXEuJuSf3ITaEhNJ+B2M/3uX
 K1xv7KYQ4NwgyDC82PF9iomzBqmZvtANSxqJ+LIavbG5r8Vv+TrM3sJwgaR4hAeEZKcoHgCCuw4
 XUOxNA7kFXwg+/2zJ9kOz44HCPlkbJUho74GbY5osuVclxKWnmMB9q2viTAGnfjtchFflzLw=
X-Gm-Gg: AY/fxX5QJsR5EVtC9cwerBNYN7RxBUd0l+mmX1mbY1HCXLr0yLPieTA1y0D/V+KMOio
 mj2ZVSX5q6kA1Fv4m5OuY4wPfbILX3H0n+9Ll/lBLtY+2l40tk8IDHlyB9mlPm+Sji+kzXEbQYP
 D2doF6C6I77A30hsHKtXXBu/0KWO0yNgFzT/LVfBViKKBga/j6HO+QznxthdHtw/MnamnckpZyh
 2SiBMfD+zVvToKHtBuw8pIkshbRPc5ioZAiDaH9qpRJXwof4U6xmDuNceMenrHEqD/N3sMiqiFZ
 LnhRYgzTAbg9jhUDZkFjzP22MyOfxpUhoCwRZJv3/h0zdSNzsNiCdH93+PNG7+RserM41TUsqZg
 T6YxScvze+PWokJKUxp3nax7xHDStvY7kkZhDhAMvLZyUPHb0V3Cvt3hIKLxjhICUMjT+cWKnbC
 /IToXqZRlvmatB2jG8hKAAC2c=
X-Received: by 2002:a05:620a:44c6:b0:8b2:dd78:9288 with SMTP id
 af79cd13be357-8c37f4d6fc3mr2194443485a.13.1768041957816; 
 Sat, 10 Jan 2026 02:45:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQEsXHEtrN4Tbqm72kgYTDVw1nykFc9S+KxE6Bnu6jdH0gUp/tS6qLlXb4fD0qTZS54Q94mA==
X-Received: by 2002:a05:620a:44c6:b0:8b2:dd78:9288 with SMTP id
 af79cd13be357-8c37f4d6fc3mr2194440185a.13.1768041957303; 
 Sat, 10 Jan 2026 02:45:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6e821fbfsm2697924e87.35.2026.01.10.02.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 02:45:56 -0800 (PST)
Date: Sat, 10 Jan 2026 12:45:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
X-Proofpoint-ORIG-GUID: _t3u3H8uMtn6SXTyB8kOCbDYH_7Uokip
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=69622de6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KLUUaQERiW0IIiXZ-soA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _t3u3H8uMtn6SXTyB8kOCbDYH_7Uokip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDA5MCBTYWx0ZWRfX//eIgwMso93M
 vEHYp32wgFu2EhWjeE2vNNHj/CeoLf91C7bz84ioJQHTf+vQNcCsmloHUYMQcN8KS9gF1RkbNNb
 Mn3isfaY7ORaihG25hqxkbHRhZBInC36TCn/wNIgUU9qIjWOtYlWTwmFjyntkEUBKeN5WvMR8fO
 kt8Iv2tsWR+6lySZpDMnXwi52VGHELXbG04boGQs6LwNka6ofyDLr3iPbdqH6qcX8CTy1cCZ9fN
 uduhfQW+caQB1GgX56BtGZU1nppf+1Q+rbYe1q+UzyoRP+sIZhOjfKdZ7sInvGmvuBtYccFgmXA
 bNZVQ5kYRQhO+2c1ZVeuhHFW/UMPegPBvh8VXZvM9Rd4gYq2GCCjA7H15qbtSyrI59hmbrndTs7
 8T15y08cHFnj/G1g032gJ/kF1DrGqV08wIHNUuNRIrYrocNs+o0qQmsc3CB1H0PhaYfIAMuXwzS
 58rhS/pnnhAZFtUTPVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100090
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

On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> > > On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > > > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > 
> > > > > To make sure the correct settings for a given DRAM configuration get
> > > > > applied, attempt to retrieve that data from SMEM (which happens to be
> > > > > what the BSP kernel does, albeit with through convoluted means of the
> > > > > bootloader altering the DT with this data).
> > > > > 
> > > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > 
> > > > > ---
> > > > > I'm not sure about this approach - perhaps a global variable storing
> > > > > the selected config, which would then be non-const would be better?
> > > > 
> > > > I'd prefer if const data was const, split HBB to a separate API.
> > > > 
> > > 
> > > I agree, but I'd prefer to avoid a separate API for it.
> > > 
> > > Instead I'd like to either return the struct by value (after updating
> > > the hbb), but we then loose the ability to return errors, or by changing
> > > the signature to:
> > > 
> > > int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> > > 
> > > This costs us an additional 16 bytes in each client (as the pointer is
> > > replaced with the data), but I think it's a cleaner API.
> > 
> > What about:
> > 
> > const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> > 
> > I really want to keep the data as const and, as important, use it as a
> > const pointer.
> > 
> 
> I guess the question is what are you actually trying to achive; my goal
> was to keep the base data constant, but I'm guessing that you also want
> to retain the "const" classifier in the client's context struct (e.g.
> the "mdss" member in struct dpu_kms)
> 
> If we're returning the data by value, there's no way for you to mark
> it as "const" in the calling code's context object (as by definition you
> shouldn't be able to change the value after initializing the object).

And I, of course, misssed one star:

const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)

This leaks the knowledge that HBB is slightly different kind of property
than the rest of UBWC data.

> 
> You also can't return the data by value and then track it by reference -
> as that value lives on the stack. This has the benefit of making the
> lifecycle of that object clear (it lives in each client) - but perhaps
> not a goal of ours... 
> 
> How come the ubwc config is const but the hbb isn't?
> 
> 
> If we want both the per-target data to remain const and data in the
> client's context to be carrying the const qualifier, the one solution I
> can see is:
> 
> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> {
>         const struct qcom_ubwc_cfg_data *data;
>         static struct qcom_ubwc_cfg_data cfg;
>         int hbb;
> 
>         ...
> 
>         data = of_machine_get_match_data(qcom_ubwc_configs);
>         ...
> 
>         hbb = qcom_smem_dram_get_hbb();
> 	...
> 
>         cfg = *data;
>         cfg.highest_bank_bit = hbb;
> 
>         return &cfg;
> }
> 
> But we'd need to deal with the race in cfg assignment...

static struct qcom_ubwc_cfg_data *cfg;
static DEFINE_MUTEX(cfg_mutex);
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
        const struct qcom_ubwc_cfg_data *data;
        int hbb;

	guard(mutex)(&cfg_mutex);

	if (cfg)
		return cfg;

        data = of_machine_get_match_data(qcom_ubwc_configs);
	if (!data)
		return ERR_PTR(-ENOMEM);

        hbb = qcom_smem_dram_get_hbb();
	if (hbb = -ENODATA)
		hbb = 15; /* I think it was default */
	else if (hbb < 0)
		return ERR_PTR(hbb);

        cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
	if (!cfg)
		return ERR_PTR(-ENOMEM);

        cfg->highest_bank_bit = hbb;

	return cfg;
}

This potentially leaks sizeof(*data) memory if the module gets removed.
Granted that all users also use qcom_ubwc_config_get_data() symbol, it
should be safe to kfree(cfg) on module removal.

-- 
With best wishes
Dmitry
