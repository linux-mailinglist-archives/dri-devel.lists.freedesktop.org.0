Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8653BBF29F
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3501610E45E;
	Mon,  6 Oct 2025 20:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/+Njtc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACBA10E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 20:14:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596F1Piw031750
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 20:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vEyKAN1vZzuHQohePa8sXUurcflNDuWo3yDRiLif28w=; b=O/+Njtc2P3rF6Ro1
 O406W+XGTHFJwHmHdNpSGhjKBHf1frLRiPyMtceZ+TeIhiDbjbHd2rQYs3daCyb7
 VOcF4McaQLwak02K05GWj/tZGA5fqvTBSxGZP2c+pE/pjaqSVG2ZDJYBXETN9wGC
 sK3765dpMRvPmTJDiN7XsJ52juo7pK7jg+tnv6V5CaeunaAM2x3vlVcZ4xEeJ8Mp
 lA5XNpN+kC8HIufn8PdnZ09pWqEp23zxv8cnMiGcgCSYDssZdZcWhVZKpk8385KM
 OJLG9zPtrbeOP0VyUfFnmuwPLA5pry0iYeHAkDCO3DEFWUHNjcq9C9sTUlKLQePl
 nb5ttw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7mv56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 20:14:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-277f0ea6ee6so68574535ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 13:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759781692; x=1760386492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEyKAN1vZzuHQohePa8sXUurcflNDuWo3yDRiLif28w=;
 b=kJQCaey6JHjKZg+6bzI/Ay+KmyqvmXJBeCMfUOHZWG6FmDstl8T4E2B7W0+Yx44EJV
 85XKwfVLqj56O1YJ4nkmG64dSZEfm19bePFiDdQhtagwZ5hFIchLq5keLu+Kf/sYxznV
 +boUzEp8SJLNRrnx6XDjM/qGR4rbBV9si0W2dbZvR2oNykBOuAZDKVb2E9DAqb760ojv
 eDfi2VgsctIhKiKzX94ElG1VmT9p+DXhK46RAooOKgo7tffK9i3uxAUZhqxhqsNH2BCu
 Fm+p8gLKs0cNtPCSh/nSRcDEaU+1pvF/XHZh7FTNN3zunOsWzxZH1C/XCFlSiTuDXbbm
 e7BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDGdiO92GJwAxyPpzXu+Atm9b8KChkrKu19hU+llG1+A6mQw4jbUkmI2/A7LbsxGvASVycFn6vW0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywKvIgH4O4Uz20I2VtmS+6jMpV51kKDjlrBot7+F1deggRr9XX
 5qJt0cnGnt9oc+yesdrX4lvZLQACZMCiWPwwDzZkBL7f69PbDqeJs/SWZol/8ZZ9+0CniPoKDoJ
 xmr0Oj6uTuecE2MJejX5ZpnQeNI+x1LQ4dxuQ0nvm25MDBx/7EGQ2kUVYEPbN/iIanDhW/mU=
X-Gm-Gg: ASbGnctdVyPDP7yr5I6O7X6gOa+YFzrmooFPeif+GRjAkbq+VBqO+Z4IPnhL1QCt5PZ
 n3pRhRfhN8ZEme6p1rN1CBFV88ND3b+J9tpaX+uDHdEcm9gv0WOyJK3ejE52A9QIZAAwTdxM2SW
 aJNrhuKEJQoj9bPHhUMQ6mv8MnnXsjBmWNn4odt7RKF7M8q6SiORpTxMFAsPergiqEJayJoGxNO
 06C41YHl/yQigh3DTAQHs989TZLLIeICaKm3aPA2N8zRRF0GPxAJblBKcYFXiYgm/+1vWCTxGNe
 DaxZg7NMrdbhAk+JueFKzdBFLeM7pAboEBFZgEGcyYdVrsrEb9h7IN6KxuWOGS6Kot1tIncrKCT
 Ag/WCH1IPIBVeBoykano=
X-Received: by 2002:a17:902:e785:b0:24c:cc32:788b with SMTP id
 d9443c01a7336-28e9a5462aemr167629615ad.3.1759781692104; 
 Mon, 06 Oct 2025 13:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyuhuX8XSBXFG1NNSSZ4gnA7eVmFPYvb/qOVtcgIaGnkKWe/CMWBH2rUUBP8WFesCSxm/CbQ==
X-Received: by 2002:a17:902:e785:b0:24c:cc32:788b with SMTP id
 d9443c01a7336-28e9a5462aemr167629375ad.3.1759781691660; 
 Mon, 06 Oct 2025 13:14:51 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1b9e4fsm141410375ad.73.2025.10.06.13.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 13:14:51 -0700 (PDT)
Message-ID: <6b91d49a-37ee-4847-81af-a1e5b0b0d4f4@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:14:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Replace kcalloc + copy_from_user with
 memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
 <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfXwMo5ZlIBeCr/
 Yu4XSVWEss39ChTaJsJpQhTQm4Ew+BrJ8eHD8fT2jJBMM0qCZNprxyCwAzZizTgLv8Bs2Ks0xF9
 N+LTrboIh2DNFDbM7ncZbb4wWFHpFB3UsC+BweIWtrfYm8UObmC1jNk/JXy/kfZijh8MIgq6ycj
 41n9OdLBlS5DNb0KyE2dEvuodJ96+zsYnb47qfe0LxUCaJWYnexy1ff2BaqqZ443nISxgUGRthV
 /y9YjS/fwfqDZCEzBSv8F7+YzQpfDy/4QVMn7GqHO4HRDa+fR9tnHashTp3efy9iAEYxuu9F1GU
 v8KTElNH747jgJDi5zWN1qTITO08Ptyos9sAsmedgZvCmPvMd8EMURPAE5uAuJSipSu1XMFxzKm
 dw9tK9lDGy4F2yboDKxmK9cOoC0T7Q==
X-Proofpoint-ORIG-GUID: 5yB__Llx6U-vdGQnS0lTPO4a2DnrpWNl
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e4233c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=MFX6GGzU5ss6K9bJXPMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5yB__Llx6U-vdGQnS0lTPO4a2DnrpWNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kcalloc() followed by copy_from_user() with memdup_array_user()
> to improve and simplify both __qaic_execute_bo_ioctl() and
> qaic_perf_stats_bo_ioctl().
> 
> In __qaic_execute_bo_ioctl(), return early if an error occurs and remove
> the obsolete 'free_exec' label.
> 
> Since memdup_array_user() already checks for multiplication overflow,
> remove the manual check in __qaic_execute_bo_ioctl(). Remove any unused
> local variables accordingly.
> 
> Since 'ret = copy_from_user()' has been removed, initialize 'ret = 0' to
> preserve the same return value on success.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied to drm-misc-next.

-Jeff
