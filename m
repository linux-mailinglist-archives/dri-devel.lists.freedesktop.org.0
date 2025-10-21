Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C7BF57CE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE4010E270;
	Tue, 21 Oct 2025 09:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES1sGkVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4078610E270
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:25:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8CBJX020555
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7nW2A2/Sdl+uA+0oNeIno2lzJVyfIo1jiDtXonqrUVg=; b=ES1sGkVmOXmoUqoZ
 BOuZXLEhjrmlGaBzUy8AfJwTkfgGwKDnyMlKODA5J+pPwIq6ttrAnb+efE9FZnyl
 AbVrs5C4+eWw/NoYx07MwKlhX9jeYCyR2n9eF9OVUEDyLeC2uWphjjC5EX8iUqi6
 ousMS/JP8RgDJgA19wWwd/aTAi3ghIwwyNyN+Aaz9aciUp5tIjxeqe6VyJEygfY3
 xpFrMyA2irDJMX7PbcTrW8D88xapHmuaVcizKtxcrIa/DifJMDplaWczqRX1G2T1
 H+es4mfT37LmDV75bV9Oww1vYS5wQtm76vnq3DSfHfJ/0LsIoj8dpsNmeF2JKR4X
 yaIfbQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v34405k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:25:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87c1d388a94so18654016d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761038712; x=1761643512;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7nW2A2/Sdl+uA+0oNeIno2lzJVyfIo1jiDtXonqrUVg=;
 b=BD9dJU5koWhJVMNKa4C42GA+p+CtRAuQvE5x/4HdM7ZZMJ5qtwfG1kGT69MRuThZEm
 Xk0c1uMB57aIzzL4vPi5qINXbAt/LNIw0PNwoyMZK1LF+8VhHFJZcfZ0t7OUfK44ykAp
 sq0SiAQNclqtUZsd6F+LcZIoz+V5AL6+HePE7OdsJiQkJnptmyjd7VLtddXCzyrQsePG
 Cbrc4iIvrfIRaxOifUN/euKFmhAe30O/Rx1KjLMrF0FLP8LTb+KM2ZRsgxT9YPEGvpTi
 XTRdtWdRQFE/Yn+cTWUTqn42Pc4/7sG9Be4GVMdOcGj7EuJVoTgRHT8toVcsGu8Z/s2H
 DwSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAFd3m1kDuUqTr6XGvIjEIOW94i+J+Yp/7YZwnhQQ9wLTSx7oRTdT9a3AHV6MCS2t8mlA915yIl0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFcxkJ9oV/iEpqUEQ5lS8CuZNs9BCiYUD/MU0mT6wV7cqARSlP
 9es8su1xCbTz39OE4BjIUA8Lu0LV4Rls92h50U5Fkah6knou6Ic047OAdoYmvHEzJ7NoamRoFFu
 GPz8R9EoznHk4XXvknsgLPfWXd4yyVjk2KyBDAAWPWmxXbbaxrLG3GF7kNCrAZOhqO7ivNjU=
X-Gm-Gg: ASbGncsF1VkA8BuQmU9BH4Ctx7aWt58tqfZKKLqbC7S5vu/jiqJO+ei/SUYN5t7Goau
 B9ppT7y7V+hYYgHc70k/+pGJI9tds3Dbj1iQh0VXHr2TXOxkfAqUMqdYqZaNNvccmlMQ9udOxez
 Q55usg4Xb4sIRsLE9TOkomm+K7FqLu2H/1Acg+M6wsleBP7h9/WEaox6Po6/3JFb7iDa3ReXK0x
 YIGY9nLyU33cGCNYahAwis0Z9wAE3cNA5qCgiymFpsEtjG9CRL8o1N1M/pwjbaySjCmWgpi/jRf
 V0z577WHCzFPkChr6TkJ82k83JrgIHel2t7X4ozeJ0+SwX5Hx/7YMd5YuJFHX5tcikmpiIcjTk0
 wsTCjcuoGaGHcWrL+9Gte46LOqNiOZejykauMkOigrReEZFpwQOvXeqMP
X-Received: by 2002:a05:622a:4c7:b0:4e8:9bf5:5ecd with SMTP id
 d75a77b69052e-4ea1168541bmr18751971cf.1.1761038711965; 
 Tue, 21 Oct 2025 02:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk59Wq45eSmY+tGWqEQNxDk//11cZC7q1beswb65jhbWLCg1ETbu+zF69qDRXnYYMyGb4j9A==
X-Received: by 2002:a05:622a:4c7:b0:4e8:9bf5:5ecd with SMTP id
 d75a77b69052e-4ea1168541bmr18751761cf.1.1761038711453; 
 Tue, 21 Oct 2025 02:25:11 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb03671csm1014961166b.38.2025.10.21.02.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:25:10 -0700 (PDT)
Message-ID: <5569198e-5548-48f7-b64e-b7574ea59691@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: qcom-wled: fix unbalanced ovp irq enable
To: foss@joelselvaraj.com, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v1-1-edd304d165a5@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v1-1-edd304d165a5@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t5bhTcRcX7UOas6YFBpHWNLzCmTK0juW
X-Proofpoint-ORIG-GUID: t5bhTcRcX7UOas6YFBpHWNLzCmTK0juW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX+o0HjPys8CVQ
 /jgaJU2nBqXW7/zKAMiFxBKDH59ZMiAF3PEaAGQW+Jn49MCx09hn2EKcR+8w/NnXH8J6NjatNUB
 mFrlnoDQd/cx0WaxH29X1lOLi+BLJElY+1+Jroui99Sdt8CWrEjOlgxOF48DNxgvxPnblHTxwFY
 dOMgswE9RSumit1CyqcbmwNzaqzOd086gDK8VwDe44aQdDv7xZlIKQdYmv6gVoA4YcQp7P6F5By
 JX76WfQHvz0mRCPgzM//MXxRXCArU6eMbC6ot2pqjhjOSjTFI+tkSq6f4tOhwFd2wwNvv7uWvwl
 4FPGtQN4UeYDmJcVFNyvugSjOOZAlygF01tBe8+1n7yXdobaLA1qAfoarpv8qWHl7KUhpDTlPwk
 myW51g/IEqPidVVfkyVkikN4qdo/5w==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f75186 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=6r-yMKpJyw27a2n3RXYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On 10/21/25 9:33 AM, Joel Selvaraj via B4 Relay wrote:
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
> I am not entirely sure if this is the ideal fix. But this patch provides
> an okayish stopgap solution till we can properly fix it. I am open to 
> try a different approach if there is any suggestion.
> ---
>  drivers/video/backlight/qcom-wled.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index a63bb42c8f8b0333cd6d0ddc5bda93916da3fef3..36e2fe5c5fa37cfb8750254a75eff612741983c8 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -197,6 +197,7 @@ struct wled {
>  	bool disabled_by_short;
>  	bool has_short_detect;
>  	bool cabc_disabled;
> +	bool ovp_irq_disabled;

This is generally "..irq_enabled"

>  	int short_irq;
>  	int ovp_irq;
>  
> @@ -294,7 +295,10 @@ static void wled_ovp_work(struct work_struct *work)
>  {
>  	struct wled *wled = container_of(work,
>  					 struct wled, ovp_work.work);
> -	enable_irq(wled->ovp_irq);
> +	if (wled->ovp_irq_disabled) {
> +		enable_irq(wled->ovp_irq);
> +		wled->ovp_irq_disabled = false;

You can also create a short wrapper like ovp_irq_enable() that would do
it internally (making it harder to overlook assigning this variable)

Konrad
