Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C1A9CF6B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 19:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED410E2AF;
	Fri, 25 Apr 2025 17:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYBAMyMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5350410E2AF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:20:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKcX3009746
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YTeHkgZgOCF6SJvz3Er3ALmpPXt0cI3Cdu8si+b0zo0=; b=eYBAMyMKVzJ5DBOv
 uxrO8JjaZFRY1M1sCbxaNWSYjFmpwditB3iMqTRBSE4vNHHvvim3HelA5QXhgkzA
 Sz1KskY9xoQTVL3KEiQ4LZTcIxsun5Xs7dA/m4zVkOHRp6dCqGQP5WIO6cF9iOig
 J9nobN9YCG7OZ8vnw8u0l+OXn2pvmWALnv+5+jJ3qPZKEkepQRA11RBy6po1+QdF
 EhC42m+yaRt2+GF8qwGan6ZHcpn+76Y7FQpk4njiYIIIagJ249k6/YGEKCpEqdAo
 5ejaJ4jA3h9HwnEtMJR91Whtc+yagQoqEIY+T4ta1BW6pMEcJXexp6/4CwIU+lZI
 KIWTtg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2hvgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:20:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-af5a8c67707so1556340a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745601649; x=1746206449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTeHkgZgOCF6SJvz3Er3ALmpPXt0cI3Cdu8si+b0zo0=;
 b=Hh1XFEfv1BCd9T7dG011hLkaprWoB1UEA4bDBB/EqKQkoJdlY79po3qIn7L8D5JkE5
 cT851/kIwjzYWpWR1optf8zzLXxWoGNrpgWS1VLIllQSbW99dUcfkNR7pkh/gDlxrGfT
 S6phXZz2J6tBnBNAWfUo4IYeekWxQouqVHUqRa746l5yK+WjjkqvqFFDu4Y31S2KJ20u
 Z6xss7vTTuAk7K/qZvMZzrtiIpRKnZewKKhJCagEBwyACBsYRyzdr5bNZjX7aJ8ZXurO
 wOgGTeQ5o89H0O69MsjzL0cQjCOlOjF/5SjS7CIWJbowCfM2Fu41MC7cMbrUmw0OcC8Y
 L2AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0sNbAwOlBjs2LU7XJy/e3Lp6Y9Pyv6mZ62nWMDo3+OO0zLoiWNm2avJlF46QQumHtjN+H8DJOdM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsw0dPmpXqLFOiA3tEWbxb/Ytv+JakgvGlPS/2Irm892YRX1+q
 crVWWzaOWkcl+rLu8iMTghoKe4EMAO7Ul3Tw0QJw/ZuNq+y/XpYBNlpgK6kOvC/CUAuuy40Ta8x
 f0TrXjHWwfdRPaJBi6iRBlc1/KCSTqplc1Njdmu7VoXQTsWa34JVytFl13D5DCoicNRU=
X-Gm-Gg: ASbGncubBYvsNmF29g/4BuhyPK0643I3a5Hr4EF24k4ZHny/H/EZ4oBtgnIwBtAw3yc
 LmQGX8pKS24cjmqaV5Gq/+sIXyLpn6+F2uBM+ucQZSXDHpF7dDQDKlM49mPFYUmPSu8FyrrAm7r
 CQx1QO+RJYVlt/X9Z8j/QRgEkY213PQ50vcz+zPvKyZfnDRFV6ze4Vfc6hEYushlGS5Hn46OAbb
 WkA4GpAHsrFrvAQ15RDDgeRk9/MQ3l+41Hp7iQlfi43j+ZrD9E8+cW3fKvgEUs305/lJ0G1yE45
 YMkl/8aCSV1UpT5XBU90S0YZHftcyd3roWle/ia7RyZymlmrG7K5WdZm6DLVwQ==
X-Received: by 2002:a17:90b:5647:b0:305:5f32:d9f5 with SMTP id
 98e67ed59e1d1-309f7d87dbcmr5611392a91.7.1745601648717; 
 Fri, 25 Apr 2025 10:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP18GRsbsf5WQgGUOixgKswPE01TenzpW85pnq+XMgSwz5YM/NoxvoXGWMnBgFoK586R0X2A==
X-Received: by 2002:a17:90b:5647:b0:305:5f32:d9f5 with SMTP id
 98e67ed59e1d1-309f7d87dbcmr5611336a91.7.1745601648152; 
 Fri, 25 Apr 2025 10:20:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309ef09985asm4115128a91.28.2025.04.25.10.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 10:20:47 -0700 (PDT)
Message-ID: <5cabfeec-0c28-4149-a58e-791923011868@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:20:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix pm related deadlocks in cmdq ioctls
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com
References: <20250425093341.2202895-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250425093341.2202895-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VLlYMULendtJ3yR4jVMEMOqB-DVztxHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX3kPB6pufJC/R
 o+LNQbcL7mLRPGEvdpap+ySrenH7OXoLy/IG0sOohCu3WFaP4zgXrUo27vt1Af1Ilb1rWt/C7UI
 VeCZ2xcia5/iFSsjAwwP0uPGNtN6dTbwqFBwT/9pXZQuyyGK2VmeXjuBWkiVEilLoyOxSCqxSs0
 l3ljAfMMuN8JLfpaHdgDX3VcZrXj+lvPYYnbz819UpG6GVZz8kJjZypw3ilnjA37N9tmzxSNzBT
 FFaqrG9AfScNq5uvz9J/B6qLkPG4juaKQFddph0Ab04g22jp3DgelHRahxTW41CIorx92X492S4
 nIfzQK/raCgFI4CiaVPdbuMWYjqXKh9s6xUDMQSyiLNS+aLWqF6DtBOM+T/vMBL873pqS3C3fMw
 eqJaaQM0K/1nujmk8KJkA65R35owmYLhcqKbvv6yJzX8WNcPNNLBL9sAhxpxFWSkv6Epo33G
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bc471 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=FvBLyhy7-R9T1-zSW44A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: VLlYMULendtJ3yR4jVMEMOqB-DVztxHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123
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

On 4/25/2025 3:33 AM, Jacek Lawrynowicz wrote:
> Fix deadlocks in ivpu_cmdq_create_ioctl() and ivpu_cmdq_destroy_ioctl()
> related to runtime suspend.
> 
> Runtime suspend acquires file_priv->lock mutex by calling
> ivpu_cmdq_reset_all_contexts(). The same lock is acquired in the cmdq
> ioctls. If one of the cmdq ioctls is called while runtime suspend is in
> progress, it can lead to a deadlock.
> 
> Call stacks from example deadlock below.
> 
> Runtime suspend thread:
> [ 3443.179717] Call Trace:
> [ 3443.179724]  __schedule+0x4b6/0x16b0
> [ 3443.179732]  ? __mod_timer+0x27d/0x3a0
> [ 3443.179738]  schedule+0x2f/0x140
> [ 3443.179741]  schedule_preempt_disabled+0x19/0x30
> [ 3443.179743]  __mutex_lock.constprop.0+0x335/0x7d0
> [ 3443.179745]  ? xas_find+0x1ed/0x260
> [ 3443.179747]  ? xa_find+0x8e/0xf0
> [ 3443.179749]  __mutex_lock_slowpath+0x13/0x20
> [ 3443.179751]  mutex_lock+0x41/0x60
> [ 3443.179757]  ivpu_cmdq_reset_all_contexts+0x82/0x150 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.179786]  ivpu_pm_runtime_suspend_cb+0x1f1/0x3f0 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.179850]  pci_pm_runtime_suspend+0x6e/0x1f0
> [ 3443.179870]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [ 3443.179886]  __rpm_callback+0x48/0x130
> [ 3443.179899]  rpm_callback+0x64/0x70
> [ 3443.179911]  rpm_suspend+0x12c/0x630
> [ 3443.179922]  ? __schedule+0x4be/0x16b0
> [ 3443.179941]  pm_runtime_work+0xca/0xf0
> [ 3443.179955]  process_one_work+0x188/0x3d0
> [ 3443.179971]  worker_thread+0x2b9/0x3c0
> [ 3443.179984]  kthread+0xfb/0x220
> [ 3443.180001]  ? __pfx_worker_thread+0x10/0x10
> [ 3443.180013]  ? __pfx_kthread+0x10/0x10
> [ 3443.180029]  ret_from_fork+0x47/0x70
> [ 3443.180044]  ? __pfx_kthread+0x10/0x10
> [ 3443.180059]  ret_from_fork_asm+0x1a/0x30
> 
> User space thread:
> [ 3443.180128] Call Trace:
> [ 3443.180138]  __schedule+0x4b6/0x16b0
> [ 3443.180159]  schedule+0x2f/0x140
> [ 3443.180163]  rpm_resume+0x1a7/0x6a0
> [ 3443.180165]  ? __pfx_autoremove_wake_function+0x10/0x10
> [ 3443.180169]  __pm_runtime_resume+0x56/0x90
> [ 3443.180171]  ivpu_rpm_get+0x28/0xb0 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180181]  ivpu_ipc_send_receive+0x6d/0x120 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180193]  ? free_frozen_pages+0x395/0x670
> [ 3443.180199]  ? __free_pages+0xa7/0xc0
> [ 3443.180202]  ivpu_jsm_hws_destroy_cmdq+0x76/0xf0 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180213]  ? locks_dispose_list+0x6c/0xa0
> [ 3443.180219]  ? kmem_cache_free+0x342/0x470
> [ 3443.180222]  ? vm_area_free+0x19/0x30
> [ 3443.180225]  ? xas_load+0x17/0xf0
> [ 3443.180229]  ? xa_load+0x72/0xb0
> [ 3443.180230]  ivpu_cmdq_unregister.isra.0+0xb1/0x100 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180241]  ivpu_cmdq_destroy_ioctl+0x8d/0x130 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180251]  ? __pfx_ivpu_cmdq_destroy_ioctl+0x10/0x10 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180260]  drm_ioctl_kernel+0xb3/0x110
> [ 3443.180265]  drm_ioctl+0x2ca/0x580
> [ 3443.180266]  ? __pfx_ivpu_cmdq_destroy_ioctl+0x10/0x10 [intel_vpu a9bd091a97f28f0235f161316b29f8234f437295]
> [ 3443.180275]  ? __fput+0x1ae/0x2f0
> [ 3443.180279]  ? kmem_cache_free+0x342/0x470
> [ 3443.180282]  __x64_sys_ioctl+0xa9/0xe0
> [ 3443.180286]  x64_sys_call+0x13b7/0x26f0
> [ 3443.180289]  do_syscall_64+0x62/0x180
> [ 3443.180291]  entry_SYSCALL_64_after_hwframe+0x71/0x79
> 
> Fixes: 465a3914b254 ("accel/ivpu: Add API for command queue create/destroy/submit")
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
