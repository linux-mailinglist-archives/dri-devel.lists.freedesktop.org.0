Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F5B0A8F2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEA510EA17;
	Fri, 18 Jul 2025 16:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MT33T1UE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B4310EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:53:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEbksf022268
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m1zCD0dfghAVW4/iCikI1Mzy4E0jkoMJk9ypegKSOwQ=; b=MT33T1UEHYC6YVkh
 xssZayZWI3HS9jTCahfMVvQEQoKilwVkz1JDIhdTWrr4fS2s0bFRtxtea1tSz0cx
 WvCNn89b9XbKFUWvy6JOzg8z9k0pDLm7fTdPcpsfrG9CsK7EbrbZhsQP7pwVM8w5
 dhFWVEnhlBAWK3K5ERCzbGmCe3HsEwoOaaln7zV7ZWLEaThH+tVSpffHKWuRfTzK
 e0mUY7unvjQaE/RrPs7Tow3QPlwL6d9HfPpq/Ltwe3CCoZtcvp8935E6BXZHVjWo
 gx/UHuloGVJyE1k90Gixf1pB/v3W/YqPVPFFDXsrUPlD4rBg6S8NVsUuIkC3+ABz
 xfDK0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsycbgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:53:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2363bb41664so19412295ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752857616; x=1753462416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m1zCD0dfghAVW4/iCikI1Mzy4E0jkoMJk9ypegKSOwQ=;
 b=BTeSI4JnTNP2sYjpbLFgtNIhYWjAnB0x/3P3o3VlfuEVrXcRVDuoXarhq9P77AtPqb
 8YxYIL+5QgujJ4m0vROXopwP3CgNgBRb+KY71f3Af/g4nPyhaPFBGCkyECocl+hdBUdV
 6XJlMZOdZswVzE3GMxC0xTkXGaHSXHhCMWpc3WowZtRVIfOilCBNXrI/BDSqgCKCT9aO
 SNEj6FyAaZNxU4pUNh9ftu7tenBw4InKiTI03KkGQHvAGEsQtbYN1i/hEyaGXeMkO/zb
 8n1OtgRgxfiwJhri+vA1MTCtYZ6BPwIfRJvd4HxhuW6VjO1Bpad0xQOST3OugcYGq+Tq
 WLPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKzfeMMAEptAXSLOEjLWxeNwXCAUsqkp+nX27mgQp3rWnL1RHfIn/CYr54OnFMC6WrwStft5GwtV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YystGi82/kwTmvU75CkZkSD2MqcKTj6N++cfqTvxHVwos/A/Xz4
 s5/tmOo4piAVpdQrWRxmjFCdSVfXC9qr3Xkl6tyea2BzgbaONhx0C5IGuuk0s5WL8dpanDPN4SN
 /bXF8zF3TnTRKoFdi/iQT+HzhT8GKDKRumuVwa8nCdo5NOdAKG/lQ7Ey70fcGN1x/U2CsrMc=
X-Gm-Gg: ASbGncuZMogv2oVJCj+sX8MZe7VJFTPYV5dY2tRrNhTJ60NP7m2j2Fqw9iiJRlhqfve
 5iHzTJs2xLS1TyDcaj4nJmISlvsk3yn0PFjQB3Q68OSx/y9AYmOjzq9cBPWXoMK3jN4M+BmgNwo
 p9Ver/IAAVwCv60vaGvDwrkECuhW93CrbUgOAAIVRnI5bBZBOmXT5k3meOLKVfSY58inPI1UzGZ
 PxgK9XZM3VFwqDiw0so2fvDAzGoljfaoB3w9iGjHab4Dc3UFYQaeBsxsXu39KkHgmW1FWY2pZWS
 Z+Laizzi7UkDSmM58TkfbGXQUS31fNC1OK+zR4eYYCcWy0L4ELRwQ3MfJRBBWt0SMl84NZJvhJU
 Ilnank4kVE+xnSA==
X-Received: by 2002:a17:903:186:b0:215:6c5f:d142 with SMTP id
 d9443c01a7336-23e2f744c24mr114646205ad.20.1752857615750; 
 Fri, 18 Jul 2025 09:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuWrniCXSDlgPowFyHtxd19vZI/IqgnQedWoC58cRaes2308e8m8bmwseHhboSm6uY1fQsWw==
X-Received: by 2002:a17:903:186:b0:215:6c5f:d142 with SMTP id
 d9443c01a7336-23e2f744c24mr114645715ad.20.1752857615304; 
 Fri, 18 Jul 2025 09:53:35 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b490fsm15812805ad.112.2025.07.18.09.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:53:34 -0700 (PDT)
Message-ID: <515c3aae-13f7-47d4-91e4-d2d54fc8e2f3@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 10:53:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250704075548.1549849-1-sunil.khatri@amd.com>
 <20250704075548.1549849-3-sunil.khatri@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250704075548.1549849-3-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMyBTYWx0ZWRfX+xjLbafUsIWh
 JxsRNpupmyFnJtoHb9ggfuH9o7UXdpH2AFx2mxTu7tMy6LeQDJv5VWzZtnjLhBFHMRdCMGi3BEJ
 /bpfO+29vo1Wm3WIFseQl3794JzNsOsEMDxFa+gv/gZIhcE0yg0ARH10WeYIvR0+wEKxukdVBsR
 pza0n+lTVdzfazjsb8MS9DCyGf1dhg3+LKjrwrN+oQbSt3/jG0ayu3zx9r3rzGY+ArVgslTYqK2
 Esu1L85X3AG//suP176q52ZVnNeSXgNmSoVjlz3usX+YyESqFy+SiGXAFw2ygumnIdC2dROLq2Q
 LRGsIGRuYfQyFdoP9IoAbK83IuDIrIRxsSfzLUbOSW8wATHOWIQQ6WdoaW0magkbz2I3HYFDk+Y
 rsuUw2ZgC1obuVI4jIF+GRbEa9V8jJUXfsyMrRQYxl9bpREG4rQRkpSFHJv20Tcn2vWZ/5WN
X-Proofpoint-GUID: Gv8MBBJKWCRJXmwx-6NwTo-KNFQ0J3Zd
X-Proofpoint-ORIG-GUID: Gv8MBBJKWCRJXmwx-6NwTo-KNFQ0J3Zd
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a7c10 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KjCdSd8fyryEu2hfdkEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=847 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180133
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

On 7/4/2025 1:55 AM, Sunil Khatri wrote:
> add support to add a directory for each client-id

Nitpick.  This is the start of a sentence, and therefore proper grammar 
would have the first letter capitalized.  So, "add support" should be 
"Add support".

-Jeff
