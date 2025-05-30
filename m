Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2FAC9637
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 21:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6391510E206;
	Fri, 30 May 2025 19:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bggFS6HF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A3610E206
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 19:52:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJTwRC008028
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 19:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5wtVXZefvNGmABNozAAxXAeSLf81avwgpSKrWz3+VYI=; b=bggFS6HFxyWgdYrV
 DmwFHIlRT4dKCPvJuG/hUs+oudCoZn1I1CPwM+0zjmJ4VHuEK2HvOIjhiMs+XxXz
 7tRlzvxxr/pljLndpr0J5hb6G4UVvKBU5/PL7fFVTP1GxU9Edlu43u0NYuyUcQDJ
 mxYSFTrbwpMsXwVXuGcfBYItqQHQWmyFNIegOFGsZuM3FuKGl21L2EBoUkYrOwGQ
 DBawuOqLl0dBzt/vtBE9Fs+wmB8yq9s7ReEDnvBzF4GxQnxJ24MCL0R3c3lzOSoF
 cUBLrNp0b+7CBMDE71z3XykysYguolj9QqiC6c45QMpuT8ZA0cMxojYlZeyB5ata
 HbXQ9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vgb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 19:52:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311c5d9307eso2772924a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 12:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748634737; x=1749239537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5wtVXZefvNGmABNozAAxXAeSLf81avwgpSKrWz3+VYI=;
 b=NuS4hhgXCdbknohMuO5qFZ3dvfT7S+0XaSnUGwVZ7r5JCNSQlxHH9mpJkywRz/IC7y
 AyRwLwsUUgExB0UxN0Nzx2zpIfAzogaEUP1BXpyrXUncsojIERFo0FgqbZvDaI8dOTif
 ilxsp/AKuyu6mxkO5ByND7d+rR9xD+W/UHtQrEuNQ2uuL2EZ4/dhRCCtJ56fBx6+OmG2
 /P5HPMHgfIEqGXLFNtLV1Wd8nKTaWZTOL5MaZkMvJILgQcAgAAuqkpMXMKQQth53T/lV
 H4+iq9lPleOcZTBhXYQ+z94NHpQ0aPaldvGZYDiMmOdINkmU/9WG3UthwSfCf0dQWulo
 dm5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXICJAkSPVgSaU61sFTTG/Y3q2cxGcnRbPIixoS5MokJQ/jbQHtg3Ez2JDHcAQh39/symIUTrwiGBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjvLIE0H3xRlvpG02oY74G/oMpQtOEiuqN0atxZ0+alNwnFln6
 taMSmKS3cENQk9oae5hvRb09WqyVEoG6ZBgmycjMITUvghP/0YluNNhcZQ21U1XATYOjMVm7LvO
 9yiDWb8iM2u8PW4TECqsPvB3f8zMsc4NFfPqFnHX4vy8WmFIWn47iOgQq44aQDWMuhlhdlc8=
X-Gm-Gg: ASbGncvzBhBwNKn0SQzXBxjj626BzEiozEFgZ9Dl7RXI/HblcjQi+zp7L5nqzERn4Wj
 dlLVDkJczLE6DB5ykOWqmD5/WpJ+cpmeu/g/ZslDIkxamcYImX18HNtSHf3CmsvM6qX0Xv3nCv0
 IWr5+Pe0J4q7iPsyZEw0nuH475wxTyLF8upGdkMjClXmVQ34yUKQ9iKl112MTmWvngzzdAYAqAo
 tzFzeBOS4YWMqsRa5I0nPdaea05z5v6pck/q5M1Yrn1KdaTuJ9zccp4n8Pdmhl330HOYYBcr1pa
 eJ2d7td2Z5S4nrqylVe8wlpJncyhKuelN1A6TtHAd0DqbpixP1EaDLxDdK+New==
X-Received: by 2002:a17:90b:3d89:b0:311:ffe8:20e2 with SMTP id
 98e67ed59e1d1-312413f6036mr7124941a91.4.1748634737367; 
 Fri, 30 May 2025 12:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3Z+FIqczFKtKeO5xYxp46pRCGdTc+LvOtstwBKAV9Rw7VYl85NP/udPc4+d8q1IAOBOTiIQ==
X-Received: by 2002:a17:90b:3d89:b0:311:ffe8:20e2 with SMTP id
 98e67ed59e1d1-312413f6036mr7124920a91.4.1748634736959; 
 Fri, 30 May 2025 12:52:16 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b3bsm1570703a91.31.2025.05.30.12.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 12:52:16 -0700 (PDT)
Message-ID: <fe868840-5718-468b-8539-105362914e75@oss.qualcomm.com>
Date: Fri, 30 May 2025 13:52:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Fix warning in ivpu_gem_bo_free()
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE3NiBTYWx0ZWRfXwrNhlouVqlMm
 GmrM2XZzLMNfqxAXskSQE5bTpqdj+wwRwAzEDWcx2iJ2Q0o4XsYJ0V6DhWnO3WObzRmnMsur7la
 ttqhwbBkHQ2+mIEcaMLfx9iP74hRCbjO1+7pKoh+B6kvjZ4w8fu3ODr9bK/mNs0pSRM4fFBmbIT
 rdow1mZkZb66J5aS7YltTu9jkbzvLjglwIm8wW/IGAQNy01ENA3c+W6VJty8mDGJDvuEMSja6au
 NZPVERWsRYQKzCuXT7NJTEvuGCSBMvWm0mlrfOEvmSSfzW3iPKNBT12igC4bKDd187uwm8fN6tJ
 7SNYc5EFy9AbOFdJzPcGhDfowFmXCJaPHYAQ/Dw7I5phBhASfiwwTB5qwMtFujrEqh8EkauAGZR
 1msy8Gr3JoUSzLmhQokQka7jCUy4fi+x38qN4Fp0Lxdi2KJ1N0wC/JOWea1sEkp3ODWcGBtw
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a0c72 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=xq6Wz9kLQhcqlbLk8JsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: OBY0DdqQUtHD_VgZbMbC9XQOpUw_VZgh
X-Proofpoint-ORIG-GUID: OBY0DdqQUtHD_VgZbMbC9XQOpUw_VZgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=899 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300176
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

On 5/28/2025 11:12 AM, Jacek Lawrynowicz wrote:
> Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
> can be indeed used in the original context/driver.
> 
> Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
> Cc: stable@vger.kernel.org # v6.3
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
