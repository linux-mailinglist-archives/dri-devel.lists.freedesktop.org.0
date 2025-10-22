Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BECFBFD80C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066F810E80E;
	Wed, 22 Oct 2025 17:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcfC7PHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FF510E80E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:14:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB1evs026868
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3n7GuKanrjFBNn+S6EEEj55UDKDMqVUCfv5KZTHI70M=; b=dcfC7PHnQ57SVoYy
 5d1E8fYZT5HTzt8RzOBJJnKF8vDcrQ7Az7FqhBpcmiN9++w6o6jpWN202ZEPKQvX
 px/aEbaUC2xuV+9jl25QCCp1xq3+/xN1GxA5TkiUwsYtjadptpbvu09aLxJai31Q
 ZQJK0ijKHwRvgtrfPByQvk1ypRK/nGw7/OgUKU8Hv24IdZiRO8HCfUdG+96tgS1w
 1YGptPzr5X/OWZz7iejg0kiLzIJky5sx2KV5XC1iEPybkjJhJn6Nq5iy0z2Z7X8x
 3wHfMo7DU6VicCs8kndTmKr9Daanju4X+P20sD47KoszzHnP3wTKDP6tOaT/7R43
 KwJ+gA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pnqq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:14:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8b86d977fso4827191cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761153275; x=1761758075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3n7GuKanrjFBNn+S6EEEj55UDKDMqVUCfv5KZTHI70M=;
 b=sgy3K+f5CZNiW/JJ+o5oHF2jFBHxzWHdy9ePLZYWYCTjHNQLmvjKrz82gxTVTEcVwl
 /FqNVLBz9lErbY8VU2Oyk5kxRBErBRZmkdVuJ2XJKq0PV50E+u2vM05luZwd9bq2MFs1
 p0LNqgFlcT677cyUZGGDQv+Nk4t5rTzknSHKyq2va7HZRa++62kIafXW3Quq87I/+tWa
 udGbdhMbHRAJKlKdVRIL+qY1RPkeCMxv9pOxUfBEBdUIJCFscDan4xdH8e2pBGeJaRKp
 IH67NXFTvt6IuG5Y1anBAM8cLOlP73eAdWuZlFK9kJe1KAC0SjpjVbZczUhNNyDglVoL
 RwiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpCHdJqdi67yzO7j1eJd0J+z7t+136ekFiJBelCdfRGpPzg533+hpMQDq70oAa2KxEJ3XsQ3s9cvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9CaVIocfk8W4trAkDxgbFmDtS8MM5s4Rs5IH7ZVIos4/B44du
 r+9snz7QwNzY55vOKKvI/9JN8RXIRh4Oh81ETAVleh6LfXkuDDutLdFkrCwh5sKbjsPNdmL5Clb
 XKHfTEol75rwwvMZNAEa3P009X+PKeox4fTWEF2HRuNK7hYn97kc9BvW91QbhZIGq2SSsfGg=
X-Gm-Gg: ASbGncvwymp/8LKiBR4JdMiOC1dz2XDicvD9PQkgWgt5vqdNwb21lnaL07dZQ0/L18E
 FbqRpx1YPvHWroCsKm8I+9GQ02XFiUbpNr+xbZPcyN4FS0OLhuYG2m1iFCOuR+EKYpMGeGkCkrA
 MIiYG8b10+feDFyZ8NUygRgE1ag3S/NT9cs89Q0wAZowFd9k0IvspQbJ7zMBbgPgSTosy2B2uGW
 TMp4f8OU/WtGcjGB3TuOzEhR/O8Qz9GK4mqcGXnYKTtyNgYIUURG0VEhjViFuNVxs8xm8Hyneu8
 Uksa0h67zsox9LHzOJrXX1dopYuMBUh6Qz2hka01I8gAqQwTnWAhZgN8p6YmwayGF2Ks7Zzs/cm
 I3+NEWgRI9pAhYoIHmyrES9BJMlpqOuhApZL9Zwg6QZGHD9r3APMw91Gr
X-Received: by 2002:a05:622a:1492:b0:4b7:94af:2998 with SMTP id
 d75a77b69052e-4e89d2cb636mr181110621cf.6.1761153275299; 
 Wed, 22 Oct 2025 10:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElUs2ccLws+09dJCicur/nb+FwFaszJn1D/TePDNT/7C+eYSqLSDOVvQDTj/XCFdnCKCnLTw==
X-Received: by 2002:a05:622a:1492:b0:4b7:94af:2998 with SMTP id
 d75a77b69052e-4e89d2cb636mr181110211cf.6.1761153274818; 
 Wed, 22 Oct 2025 10:14:34 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb0365e1sm1394344166b.48.2025.10.22.10.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 10:14:34 -0700 (PDT)
Message-ID: <280f1e92-36a1-450b-b6df-b36c3aed3c1c@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] backlight: qcom-wled: fix unbalanced ovp irq enable
To: foss@joelselvaraj.com, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v2-1-7ff115b4ffe7@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v2-1-7ff115b4ffe7@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX5oxLMxyaTIb6
 5J2nnHgCOikbBx7lIQ/h7VeWNJC7n2+KvJRQ8dVIWGNgpeMB8GtoiDMo0KDLqtVKuQ6RVzq0gmg
 +phStCP6747mcV2JLncO7myMVUkz/4Jraf4aZWwYvHun98Bz9OCxwU38xo8bfVNHzuHUa6yirVY
 QPNLpf87SJzHrIDS29MKlVMfU2qTniP+P9646Vg93rmGn324+2ECh0S8lB4M6ifv7d+Jlsi/JaC
 udC7pMAFMQA466v/cRGdPwRSKwE7LuuU4IRVJTwnIK1qtGNdx6DG98iaj3S6OyzgVnqeyvyq4Oe
 lfBx55OOmtwSSx4HaTpCe5JE4sjoyHQbkDi636JXsEl5giwIdJ5JdmibylPjNQj2bSmySUBPFHQ
 KP/twNv7bQu/wMUwd2lo3ZvLKzbojg==
X-Proofpoint-GUID: uVKGu4bnISZ_UJc5lpQLUy0IZVRPMSjv
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f910fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=pW9aVPEJbd2O5lHr0_EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-ORIG-GUID: uVKGu4bnISZ_UJc5lpQLUy0IZVRPMSjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

On 10/21/25 8:53 PM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> In Xiaomi Poco F1 and at least few other devices, the qcom wled driver
> triggers unbalanced ovp irq enable warning like the following during
> boot up.
> 
> [    1.151677] ------------[ cut here ]------------
> [    1.151680] Unbalanced enable for IRQ 176
> [    1.151693] WARNING: CPU: 0 PID: 160 at kernel/irq/manage.c:774 __enable_irq+0x50/0x80
> [    1.151710] Modules linked in:
> [    1.151717] CPU: 0 PID: 160 Comm: kworker/0:11 Not tainted 5.17.0-sdm845 #4
> [    1.151724] Hardware name: Xiaomi Pocophone F1 (DT)
> [    1.151728] Workqueue: events wled_ovp_work
> ...<snip>...
> [    1.151833] Call trace:
> [    1.151836]  __enable_irq+0x50/0x80
> [    1.151841]  enable_irq+0x48/0xa0
> [    1.151846]  wled_ovp_work+0x18/0x24
> [    1.151850]  process_one_work+0x1d0/0x350
> [    1.151858]  worker_thread+0x13c/0x460
> [    1.151862]  kthread+0x110/0x114
> [    1.151868]  ret_from_fork+0x10/0x20
> [    1.151876] ---[ end trace 0000000000000000 ]---
> 
> Fix it by storing and checking the state of ovp irq before enabling and
> disabling it.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
> I was able to debug the issue a little further. This happens mainly because
> devm_request_threaded_irq already enables the ovp irq during probe. Then ovp
> work gets scheduled when update_status happens and in turn enables the irq again.
> Tracking the status makes it easy to avoid the double irq enable. But I am
> open to try a different approach if there is any suggestion.

Would reverting this change and adding (| IRQF_NO_AUTOEN) to that call
fix it?

Konrad
