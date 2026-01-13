Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9418FD1A415
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E6E10E345;
	Tue, 13 Jan 2026 16:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6MtjU47";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blJvBBkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724F910E345
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:29:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DEjKiC4080708
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cIn5H/EXHlleEAeuN1rT2GBX
 pPo6fP2DFr4Mp6yQNT0=; b=h6MtjU47w1PHnUFq0KDb/GRAfBi1JEHu2lTMIpyc
 cqAD+bc1LGy8/TG/gfUjoEiqzQmuk+kyMYsqOX6aqMyevJPuhwCkJUFBj3Rt8aVG
 +ufCmNSUcu+UF5tCQSOyhiPWfUC4Kn0Wa5H23HJdxo72W0y6hF5B8xdfnvsYdi2W
 ipinFNeNUHPEZnaabab9G93Qcw9UdAI8Zaa+c6cbmoGJRFLcfkx3Y0pp5I+Ujoe8
 GNlxjYt69KuxsvIiz2/W3J6fNXVd/LXNyHBlosiUcMffL4FX2PoPw2okX7CUh2Mq
 it8SOOvW2CCXVHDJFUqdg+DIgO4SiK2RZDGAlLEcFDFeSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e8ctp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:29:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b51396f3efso1493579685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768321748; x=1768926548;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cIn5H/EXHlleEAeuN1rT2GBXpPo6fP2DFr4Mp6yQNT0=;
 b=blJvBBkBVVATdmbm4apfwWIlG6uVK6xiN9JGz2F1yVbySN6BGDhzFplIjfzvYzcfcA
 XoIr2gFSbW3b5uNeRqlSILuXEcgNxcJiIt78y08j82QNJxAmCqKO2xedDdT24pNgjBwc
 yGBFr0fnIBRofB3gVuD64LL9vMyqwXvbOroHcDU/rexWwkbF5bVhPcEW5FMwWnkMuwMf
 eIbjintjr2gbxaCNR73AulephJolnJGPKXBF+/ijSUNJIKdWNPGbxsVCtT0xYP2WcHgk
 JJBjpZJy2TCxoJlNnPu78Le5qBgf7cbjxFFOJ/n7ZVGxHG0wCbTzp8i+Bsvo2ehB9Yda
 RGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768321748; x=1768926548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIn5H/EXHlleEAeuN1rT2GBXpPo6fP2DFr4Mp6yQNT0=;
 b=ex6n1YxFeA3AT18JDbFY12Hl5fBDT/EEP9OZ3YqR0Js06AKuzoRvY7213cY7eoIHD6
 2Zg6vhZuzFwuQ5uHCFBzrUtl6FDLmnhOQ0dX2eK0lI1brpCEVhnh8/zoMIiQ9Gpo3+mX
 EEzGiepESkH//F9exTk5jQltrltF3fz/Ck2Ma9a0k9KaGAiZ0j8ytc4MfGwi9FvH/P+e
 yBh6BNbXnKLYr1MzPxeET8yq1yP9xFjdSn2o7nOXXnC33JvbmOajb5XWiOILb2IvThmn
 9T7YFhaR+KzkAv3BfOlCzce967ZDoBcCLBjebECWRfTDdGMjMtyrLB+tym269JKLcw/w
 +2/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVf2W7RW54HEvUre5M7x+F6hl6dMkFAwj09/80BCF/ddwpf3mkxtcGYy1DQ1yM3X9rkZac8pjy0+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxUicrqJne6QQCwrjliuWTAf3Hu/063kp5Rd5WgYcF8OS7M+q0
 x0OI8KvFIe/RQgZbssJmcl0uqUXmooW/6qsG9l168YAFwMb0ypMOJdp6y99CyWDfEhsqdOJdgN/
 KwtJLcgrIM9Hj1IKAWsVnEuOUAI8ImaIrGbK/RXIibUyNmQ1BLgVKsplst4mOV6lgy8+bakU=
X-Gm-Gg: AY/fxX6ehr87w+2Eezl2mv4EoW1sPYcqCkR69BePTvOEvMjrZsO2IZe4hdgrR8PK6pw
 MC1qQzFZbUgmuyKW5fiBm/nAzTkZpbMNBS7WYDTHpfaTs/A7pfs2kNDUNp7UrGfUg0YPTedZzNM
 eOvXND5JwjoXqkz/AW0tCvFPRPRaAt8Ufzqd3qNT5CN6P5ccSo0b4M6v2vjWSpavhrH5O09/ml0
 QD8smyZksd5hxsEHTw8JHUaf42F2911qNoe+oUSiJhnJS7iKRfbPJeHCvqhJVTenTAC0iP59m3F
 qxhj09M2ho7j+0HFUIgD8fcaR9Dh+cxR62R6BsSW2k12L87DMoPpewOKkGFprx1EXSknYCdgj1m
 I7ep4684KHjrNcX2nk1XjX7F5MJHOwdSsfvlVJHojMVt6jjWHrA581aCXi58pdFXLJ1tWUr2Kl7
 gs9O8aApr/Bx7b7/lc48aC9cI=
X-Received: by 2002:a05:620a:1a97:b0:8a3:8a0:a4fe with SMTP id
 af79cd13be357-8c3893840f2mr2997452085a.32.1768321747700; 
 Tue, 13 Jan 2026 08:29:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVkPsQcxQkr+cU1eJ0h1aQeUhC2BF2dJvRQ4lN+2W+Xk0GRhFMTy0HCKzKnUPMS0T43c+GdQ==
X-Received: by 2002:a05:620a:1a97:b0:8a3:8a0:a4fe with SMTP id
 af79cd13be357-8c3893840f2mr2997446685a.32.1768321747192; 
 Tue, 13 Jan 2026 08:29:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b9fc41011sm71902e87.69.2026.01.13.08.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:29:06 -0800 (PST)
Date: Tue, 13 Jan 2026 18:29:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
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
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=696672d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yH33JR1JA9jB6mUk05kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzNyBTYWx0ZWRfX0Ymk3kUaWBnI
 jfk9+Vj/fXAzJfWmoUtd/Nct+IbttbXDfqBUTgAs7RYtjngjLDDNLPyoBfweXBqdsh5FmT3cKcs
 CR0908Vl8F+SmnQTN2Iuv9mM05Ts6yuLCXj1fnM3ThpQWkYm5W9KQhRUHtKaoWfyYXYyHkUTEja
 6zGdL+OnTgSwgAiVlPEIAgHE39cJXRFC9e3GBXYnD2sU7noaQZXlp3yIKWOGGOM6j4ihPbOLr1n
 i1AEOXrmdI335/CWNjF/pLSOi5DsF5nj4y4iMRTphPQOHdJS+9esabIgzqWnk/XBFyYx6q1sa5c
 W0zPQImOigq2rjjzCYZLLIiiqTW//mvy3mGuXvVFDSHemP/WCB07SOyH6oRsEptS6GWHmLmR003
 ScSoAMV+uj8BXoSt6jB7bpwNKuSldey70nfDJEGrXRbIf/U+Ur6YxngFt+9ABWHpT59FAN52v7o
 vtyvxS8yk9lnw5JadUg==
X-Proofpoint-GUID: ObFhAaE1AkecXSfM3tngJ2K6LLinu7wv
X-Proofpoint-ORIG-GUID: ObFhAaE1AkecXSfM3tngJ2K6LLinu7wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130137
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

On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> >> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> >>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> To make sure the correct settings for a given DRAM configuration get
> >>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
> >>>>>> what the BSP kernel does, albeit with through convoluted means of the
> >>>>>> bootloader altering the DT with this data).
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> ---
> >>>>>> I'm not sure about this approach - perhaps a global variable storing
> >>>>>> the selected config, which would then be non-const would be better?
> >>>>>
> >>>>> I'd prefer if const data was const, split HBB to a separate API.
> >>>>>
> >>>>
> >>>> I agree, but I'd prefer to avoid a separate API for it.
> >>>>
> >>>> Instead I'd like to either return the struct by value (after updating
> >>>> the hbb), but we then loose the ability to return errors, or by changing
> >>>> the signature to:
> >>>>
> >>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >>>>
> >>>> This costs us an additional 16 bytes in each client (as the pointer is
> >>>> replaced with the data), but I think it's a cleaner API.
> >>>
> >>> What about:
> >>>
> >>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> >>>
> >>> I really want to keep the data as const and, as important, use it as a
> >>> const pointer.
> >>>
> >>
> >> I guess the question is what are you actually trying to achive; my goal
> >> was to keep the base data constant, but I'm guessing that you also want
> >> to retain the "const" classifier in the client's context struct (e.g.
> >> the "mdss" member in struct dpu_kms)
> >>
> >> If we're returning the data by value, there's no way for you to mark
> >> it as "const" in the calling code's context object (as by definition you
> >> shouldn't be able to change the value after initializing the object).
> > 
> > And I, of course, misssed one star:
> > 
> > const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> > 
> > This leaks the knowledge that HBB is slightly different kind of property
> > than the rest of UBWC data.
> > 
> >>
> >> You also can't return the data by value and then track it by reference -
> >> as that value lives on the stack. This has the benefit of making the
> >> lifecycle of that object clear (it lives in each client) - but perhaps
> >> not a goal of ours... 
> >>
> >> How come the ubwc config is const but the hbb isn't?
> >>
> >>
> >> If we want both the per-target data to remain const and data in the
> >> client's context to be carrying the const qualifier, the one solution I
> >> can see is:
> >>
> >> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >> {
> >>         const struct qcom_ubwc_cfg_data *data;
> >>         static struct qcom_ubwc_cfg_data cfg;
> >>         int hbb;
> >>
> >>         ...
> >>
> >>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>         ...
> >>
> >>         hbb = qcom_smem_dram_get_hbb();
> >> 	...
> >>
> >>         cfg = *data;
> >>         cfg.highest_bank_bit = hbb;
> >>
> >>         return &cfg;
> >> }
> >>
> >> But we'd need to deal with the race in cfg assignment...
> > 
> > static struct qcom_ubwc_cfg_data *cfg;
> > static DEFINE_MUTEX(cfg_mutex);
> > const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > {
> >         const struct qcom_ubwc_cfg_data *data;
> >         int hbb;
> > 
> > 	guard(mutex)(&cfg_mutex);
> > 
> > 	if (cfg)
> > 		return cfg;
> > 
> >         data = of_machine_get_match_data(qcom_ubwc_configs);
> > 	if (!data)
> > 		return ERR_PTR(-ENOMEM);
> > 
> >         hbb = qcom_smem_dram_get_hbb();
> > 	if (hbb = -ENODATA)
> > 		hbb = 15; /* I think it was default */
> > 	else if (hbb < 0)
> > 		return ERR_PTR(hbb);
> > 
> >         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> > 	if (!cfg)
> > 		return ERR_PTR(-ENOMEM);
> > 
> >         cfg->highest_bank_bit = hbb;
> > 
> > 	return cfg;
> > }
> > 
> > This potentially leaks sizeof(*data) memory if the module gets removed.
> > Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> > should be safe to kfree(cfg) on module removal.
> 
> I really don't understand why you'd want a separate API for hbb, if
> hbb is already available from the larger struct *and* if a driver needs
> to know about the value of hbb, it really needs to know about all the
> other values as well

Please take another look, qcom_ubwc_config_get_data() is the only public
API, qcom_smem_dram_get_hbb() is an internal API.

My goal is to keep having UBWC db which keeps const data and which which
also returns a const pointer.

-- 
With best wishes
Dmitry
