Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B481D1BE19
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A471510E56A;
	Wed, 14 Jan 2026 01:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD9yqTFR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdB4LxsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5443B10E56A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:02:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DNIZUt1964096
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h18ZqtLLvGt/Pa+wG27Y9TqJ
 rGVZgx2iCCkSzGerT+0=; b=VD9yqTFR4gXnt3n/FZpIJQX4gpBL0ktXG9WZhk4I
 yY4RP+jB+88nfH8GbeMS3CYOmrUAGd6f5r6QDFSKo2QJYbxcAzDy2ncylVXPV5Ai
 Bi5HQfHbT4B2zCMSiD9oNI4P+c5fWJYNmHsgEAr7S2+a0c7vaom+JUfPR8YzKGm5
 HQiTvZaoRfw7JD0d/eXnVqh2iqtwxGqyXuxrhF4uyMZxtkxXiKFO43FHJ9eWLGiU
 AkNKR3aAdeux3ByK5/j4R1deWK9zdYewlq58tzEOHwMVkOSxFKtMZoYcORTJsws6
 ZVcSNJhWeNIr/jZJkmrAALiSwD0RyK5O7/6RQpgDtHNJAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89g92e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:02:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso100543485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768352550; x=1768957350;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h18ZqtLLvGt/Pa+wG27Y9TqJrGVZgx2iCCkSzGerT+0=;
 b=YdB4LxsBAp0JP4PViJskXVrI9rxw3fIXGnjwBrDETMOmNm+PGtAOBdfpwMoeO8UySy
 1q6er7R7zPqIYP162gWBeJ2Kctv+vuhvaM2sKZ0JbOMcjeRUt79CY9K2lGCWokobgdch
 aMEnZDRQmsEeYucI3UwrTHtgjM7oYmrgmqCVVFlxzXK0DrxAjgcBBhU0hJza+HojnAY8
 th+716aIvbZ8M6AMlQls0sOrKwLMgBaNEGX3kZzvXnp9dr7R1Vy6nPzVMfs9t3JC9YC6
 YikNoZT7QYFOJnFqEydqptY4k6wbumasJtcfVjAwIZgXVpPIPkjB50Kla+rookVnINJk
 BWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768352550; x=1768957350;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h18ZqtLLvGt/Pa+wG27Y9TqJrGVZgx2iCCkSzGerT+0=;
 b=RsqvmTe1SJSu5ugVKDTXp1AaXAG5uPG3WLhr0Z1sDxeEAts7KCBFVAMsRV5E+ubdxF
 VMHaZCzZxb/o2OWctB8DQ1Y3NaR06u2rYkhKQp8+Ia5rSqmm/lNaF0BiVfYyMmsTFxyP
 8Y+/ijCxDidaEzvDowvIchOQWJLKVu+shiyEwFDzmrqkzP8LujweTvo6P25Wz9Pem/YR
 g0taNPaLqh6YMTPXezmdP2IJ4gY5ZFGuxriezBbiFHuEJLMkz5kgYMGjxoncmMEwUM6c
 zf3twqbWrl2Azz7GIieDni3h2F+FD65mmW35jm7Cn7GuEYfvZ7IWn00mCauZ34TT3Hat
 1s4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFNKZnqXrQl9P5n/oVPHfr6zbOquNiGwO7ZK+WkfXDF08g6QQnqQWSbFiW0axr9M4FC8PCvii3kUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo7X9ZD5O3+skXXYYw0lD9OhlxVbXtFsDs71oCbal3cR85VA7B
 loxzvAQdY6ALkD0+56rlnYNDhcTtPyQExyvpt8tPz++Y67QgfkJO5NiSjB9ea+/flyH+2ASKkNS
 oViJb8bbJVP81B3np6WDFq8ox8yMgWGp+YB74/gDXu6buH68zcyiWpkuIkonWKhJlncyZNYQ=
X-Gm-Gg: AY/fxX7uW5B9t+VBKBF+U3lq6rbiXaQcWOpxOuovuVVqjhP51dxTwGE1WoUiOZBrmB3
 EF6Rk2Q4zahfro9Ha+z3i7QRk6x0CgElQDxI+RG/YenqbfbpGV0HrVQXxjCbIXMrLJv1VMhmLFW
 QF3dNgoFAgOVYu8luDPA3w+kd5QpMWwDSC1HOl3I1bSEd+TlnV+hWCbGA6BxQ76CAtnTuzAN+cx
 U+8LLdRaKyBguZ4oM8RzwmGVUNVlfu+P1duq/96OVt0FeAuJiuPXw6fNbqDJGdFcP1dY0ViRPuj
 94+HRGBvdN6N0N/eH2ZdRT+pkA4ALwhgiNdt/lJfRHdY3f1D7ub65L+VMdaoPyS21eCJE1DjWY0
 bEBT4mceiU7RzQr8av4gWmlp3hr02/rsK6z8EGcZBLBbWNAGo84AEB2kElid8OLGOSc0leRDheK
 0RX8DtXtLaTQv7rUWnVmdRaiw=
X-Received: by 2002:a05:620a:31a6:b0:8a2:595f:657 with SMTP id
 af79cd13be357-8c5208a4cc6mr654200385a.21.1768352550483; 
 Tue, 13 Jan 2026 17:02:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:8a2:595f:657 with SMTP id
 af79cd13be357-8c5208a4cc6mr654194785a.21.1768352549807; 
 Tue, 13 Jan 2026 17:02:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b464fsm48970681fa.20.2026.01.13.17.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:02:27 -0800 (PST)
Date: Wed, 14 Jan 2026 03:02:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <5e64ih6c4abydpjto2asvd2dev2bu3wlqp7rbryr75vzcf4ubo@ky6t7rkbf6wr>
References: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwNCBTYWx0ZWRfX4d+o38LaY8Dc
 KDoNknRojjIEE+We2R25hZtZCrcoq+uhR0xQtenWatbBvismjbY4dprh1jbTFbnJVZTeaEQ1oin
 /d9fRv3BSyMFW2CSCGruPYS+dG4DqHF+qp/4xW3DQKYV2v/AV35vupQUvdRaglOFZrchdX1cRXT
 b5dcqBL8jBpmpQZTOl0Ctv6v0Qx5iEYjg/Rrqka9D/MgaSzLszcoAmMv/CPA1VS5LF1TpMniuIE
 tvcQtmcSe3CfnB1Y1MBWM7TgDX/53hrWUYurkJM1cKhrpOTm1iBC+6LTyQ0cXKttzA3kLFXl6k4
 a3Leb7rZ/EotKhzl3lDx1Q3vLlK3rMnz1a18DUvN1oUr8VdYZCzvjWjECLagml4/tXHTJoz9Orn
 kfc+81LRSfLFLEHaCZGKAc1rR/jnWZvb0kB3Fuhdt6CgXBXk/R6k+JBMUhMUZxFe0VMB5uGi1xz
 zW8Hn60JVFQj3R9rW0w==
X-Proofpoint-ORIG-GUID: JvIBGF5-Zz9CxVp_nVbW4IyymbxzWMDh
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=6966eb27 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=oHda18c8P31K-R3mfaIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JvIBGF5-Zz9CxVp_nVbW4IyymbxzWMDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140004
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

On Tue, Jan 13, 2026 at 05:00:31PM -0700, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> 
> Transform the if statements into a switch statement with a default case
> with the existing error print and an early return to avoid the invalid
> division. Add a comment to note this helps the compiler, even though the
> case is known to be unreachable. With this, pixel_dev's default zero
> initialization can be dropped, as it is dead with this change.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Transform existing if statement structure into a switch case with a
>   default case that early returns, avoiding the invalid division
>   (Konrad, Dmitry). Add a commment about the reachability of the default
>   case.
> - Drop the default zero initialization of pixel_div, as it is no longer
>   used due to the new switch statement.
> - Link to v1: https://patch.msgid.link/20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
