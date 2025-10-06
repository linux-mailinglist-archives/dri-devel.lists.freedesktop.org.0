Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DEBBF396
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB210E467;
	Mon,  6 Oct 2025 20:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLLUaDEX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4362710E467
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 20:40:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FBZVR024872
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 20:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YXNjTVX3iML/A/etm192jSri1pqvVbrOkDWSRs1g34w=; b=iLLUaDEXNrWKQ9PF
 n8vVBzJCySSTFAJI+q8ok31UoilP14t1Vz7UGesIUVUYcjdWNkCgliZCqVRYpR6W
 SVu8T0cF+xVuOB/Ix3gDFeYWwXwh8Z1LH+tR3jux1S2VUPUwnyAqsfVcV2aRcWoA
 NeUWxpiVkoW/30NcAzXFCjeyE3B2XzqeVLzDyBEJ9qGAszzmvcc40dnsgpnD+JLB
 7w4azO2LhkzB1xkPYFSvLuiUmp2hbMjx76Led7zhIItYb1/PZQVY9U3nQYVWgGqp
 E6pubtw/D4f9VNvORXH4TYd6Vd5ihhsVk2sEBh3NiIEyxg212xnahmr7uIgSvzB/
 jbdVkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6a8tv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 20:40:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-33826e101ecso6614156a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 13:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759783224; x=1760388024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXNjTVX3iML/A/etm192jSri1pqvVbrOkDWSRs1g34w=;
 b=ofWZtFnec8mh3KNMeNta0BmHnld1IMK0u/TgNAirROdOhjdKheoXAYjaD5EUZ35HNV
 NZWs6tiO0Vm73lSssXPKKPZ5uuXDnMDbac23DDcEJfLVXOzcnSvO38ANKKJOPCVyorwl
 o4be4fQX8hvIZZg/Zs+QIFzxjZY5ftZEpkTI1NJlpiaSmbXArhsiC/608Xok9O0Ey2SE
 FKA4qKbXBsUoWPy6xnfKxGuhgLq36emN6AkhM7VSv/FKe19pZrkoelrztsd5pJ0icNAg
 qSci9KWzpfwSFVJ2CzOKXRpfl+Xjfc9uDzZDgDRk+h42oAjJixadtM+iGGuVQrhEeWhw
 lEaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH+MbTuCT2WQpVJ2fDjbgpsOJ3N9z4qVDwL3SrAiIaTr9tbdWXAqYd1PF+v/OogbCqKKfreGTQl1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR8eW2oS3AT6AIlHZZ3gnfd5olV61NIPP9uWm2lHGeYJJa5ckb
 aoJjxkNXkk6VGbzsp/XBvKh69mBTGusN4BID13kVpvemy5aySmmNvhSv6ZPVe8g2QpCNQ6whCLJ
 jxobqve6M1IDs9IMKnBd0617TxJACzR2AI7/iJMD0k7ihSCDkfJeYx2j4J+59nBIoDhJd358=
X-Gm-Gg: ASbGnctFaKgJpDhcA0dWyeBHnY2q37GHiODoaDaJgKa8wKpCCvwmHjwwWQ0L3CLi1iQ
 fhYW14sch1SeD48CVArQlNGsmwB11RqNl1V0qWi/T346wvZagNCRujvOhhfGJfLDwLU9IGErqGo
 9U+6ow6CtP4eAXbZQCw+iN7ATUrLdJxQB9SdKznfnDATmoVF5QoxKXF3NGKC2cuLg3zrV+CmWlu
 mLM9cqXJt00d7Z1+5n7AeGQU74U2S+eZg8kj1W8ftrvSn9ueusk6MUZ4JNprq1QILgYl8P+dweO
 gY+Z/oXcyNyteS9L0rSLUo2LMGs8Hf52F9ALnM2HP4ReD4g1MCW/wNPncu7OgeiX3Znhk8UeMe9
 oZjBmnT6YNZmgztmkhx8=
X-Received: by 2002:a17:90b:1b0b:b0:32e:dcc6:cd3f with SMTP id
 98e67ed59e1d1-339edac58bemr1131989a91.14.1759783223713; 
 Mon, 06 Oct 2025 13:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHj3I/2pz11+BwXv4abtxSlZbMuekd5HZZX3dCh5I99qOPxLV3ZwEMUhPb47ehFB/qsHCnlw==
X-Received: by 2002:a17:90b:1b0b:b0:32e:dcc6:cd3f with SMTP id
 98e67ed59e1d1-339edac58bemr1131963a91.14.1759783223238; 
 Mon, 06 Oct 2025 13:40:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a19fe4sm11968468a91.8.2025.10.06.13.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 13:40:22 -0700 (PDT)
Message-ID: <3ba3216d-4dcd-459a-a3ec-2ef0567e75b9@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:40:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace snprintf() with sysfs_emit() in sysfs
 show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, ogabbay@kernel.org
Cc: quic_carlv@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250822112804.1726592-1-chelsyratnawat2001@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250822112804.1726592-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e42938 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=NpbQ6Uf7XBcvSWM2wFwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1qfVYiK_m8TME-mtyotkWQHeYqMgUzMn
X-Proofpoint-GUID: 1qfVYiK_m8TME-mtyotkWQHeYqMgUzMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfXwPac1/AW+UG7
 AlzCGncRgMM85spjzJrIyQALaAO20H8dqSJfG3GSDwOU64BuF/8bSJPmKykiZyacoLUknhce02J
 DjZ+f/yyTXRdb+UZ/0+/FBb7KUbXqVezsPSAGJ9eAE1NC//ImsRIuh/XKnIJBSThTFd+sNWP3AE
 FbUTCW7PlJeMXOyJKP+0c8rVjvV+6sI0VHPANrdGSeFsd2Uqp9FYpp94lJHL2tiuD/R4FQNgzre
 W6Ek4MEeKG+O03VYfNoIL+p/R/tvC5TxqH+HyGxiVqFhk63/rHhujWvu0BJlSXpbfkgoHNZWZap
 C6cEdgx3ckgaPX8azu826/mB0yfH+UXcnlwuzEU0vH8hiFHldMETkw8CngFb3b0g65Oypg5LqN9
 9zX5oXQM4ZhlzVAQZdpd7Rpw1BLLPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121
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

On 8/22/2025 5:28 AM, Chelsy Ratnawat wrote:
> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Applied to drm-misc-next.  I fixed two typos in the commit text when 
applying.

-Jeff
