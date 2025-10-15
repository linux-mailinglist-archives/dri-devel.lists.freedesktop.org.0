Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0110BDFD75
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 19:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3C310E2B1;
	Wed, 15 Oct 2025 17:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnjuUHpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAB110E2B1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 17:27:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FHMwQk003544
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 17:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KTf2fO5KRH7KVrGnVrFxPrc4+WMg+22pOx6tu+ulMNU=; b=bnjuUHpi0B+IpYSB
 4KpbUART/cgQfvAwCFGlhIaJ1dmqzg19pS1LFpelDnzWGsumUWILD6I8gUGgm+Sd
 9z1TbRRfdQfckiK9jhsM7ywTYoo9x9Xe/Nn2POjKPAGIR8SNOmAaq82C9ISZRFoJ
 8xBq1eRauNbjfjpBBJc7QGZmniCe6mVroXBDhEjTOVGwU+onVb3e8ugFONsSQOli
 uQsjWN59PebIAv20oQhB894dpsaS9ErJlKNarrd9H706u9Bmyic07d5GJYYvUXed
 qYCBK56wWWBX/N7lwrfIVoAWOam4Wkn/aYbfMO90uoO8okT1YhGfTaraKW5jkd2r
 +wm2bA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8m0c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 17:27:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2909a67aed4so231345ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760549228; x=1761154028;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTf2fO5KRH7KVrGnVrFxPrc4+WMg+22pOx6tu+ulMNU=;
 b=l3NqQkhjagqbS5YaxX5spXDn/mxv3455dXL0/CMeeT+KjRgJA5xIeojIZ/y0JNm3/q
 1K40PdGBzan9Zh1prZ53m2Ig8sH9uXYChMZVOnSCogHjBhplsjs8tmT2cmtYZFiZ76+n
 mQ/0Su7Tbiay6qHLg3YTdBqWjzI84gvV69FBSzLsCWXXsDVXIbIkAbtxtQnFYXvWtIKP
 OPd8RI56XTfNUESYzXIUaxGa3bORtZonEJfA5kkynTt3OS6W0warwsc17bpj5rypU1Pa
 xVojl0hbheQaWoEBYWj585oaAXl9A9BXNx+/qYgbJfMUv/JeWkP3qBWjxHyDNS8VB/YD
 Oq0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe7kZ1MjCt7gBE/YpQjP6U9DzDcNytJfHeJtDmd6Mz4zGksAJwVDBHw7xItyTM+bjYdI9axj+rG18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt7kPyPUlmaYxE2PlcqI2CZaRYrNvuCvtp9k06M5xh2SU8Nezr
 gfuwWpWL2oiLTjdezZyIaFyDOFkiWqPnV0MFcANjhComFNpQ5qoIVVyeygw2gp8JPcDr6y+ULYp
 byJHA9YsVrArTfIhy20+S8k8vALk0IyAepw8pZgK1lZoZK1EMhScWCHZTQ9IG/pZ0Pekurac=
X-Gm-Gg: ASbGnctU2yekCVCoBtNNpsud9x4YhJNJmnYky+0TJRRRkJx3v6z5WRx6bqXwbeVtPJw
 M/78dzL5tPXmWszdZsVwbm/Fpd6r0A4JoBFIyGfsIyM1aYCB4U9ok62l19rm7WAuhXFhtrZint5
 uqarn+W75/hs3awYtruScjoerpfO+g71oAIdbfW34b3YDDqrwzj1oKHhUCaTFj1SRJXquBKcPT4
 3Vx78DJSaYW5D9SBHgUEwSuG6ek6OjbsbjDwpk9+Ot0F+ICv9hIB8CEtvqQzkQZVUrBuKsUBW8p
 UjFpW93TVtpQDeDVx2+SavFK23HYD/FSBsQV+3a9ticpoFh91GheDNf0FgFNA5W+cH1ZvNbwjPJ
 t0X2oEbGUMrk=
X-Received: by 2002:a17:902:f644:b0:267:8049:7c87 with SMTP id
 d9443c01a7336-29091b02b2emr8957485ad.14.1760549228042; 
 Wed, 15 Oct 2025 10:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3tuSh0KK5oaxfpqjUBx5mED7fEp7VjVJWxeGeZUoFaEtc/KDa09QQGlqXf32X6jSlMQwlfw==
X-Received: by 2002:a17:902:f644:b0:267:8049:7c87 with SMTP id
 d9443c01a7336-29091b02b2emr8957225ad.14.1760549227553; 
 Wed, 15 Oct 2025 10:27:07 -0700 (PDT)
Received: from [10.73.85.4] (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099a7c255sm2042235ad.70.2025.10.15.10.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 10:27:07 -0700 (PDT)
Message-ID: <0e034840-37d6-4492-92e9-61a9eadbf794@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:27:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DKzKyVJYDBeTwZe5yXPlLk0owFW6IRsU
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68efd96d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GWqr9FCoMw_Da9qovAsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX/3WnYaNim0rM
 OyhI7f5dGe6VF0jeecfzHqootJX1YUsuf7kjjXBjonU6ObmY3SYxVze6p9Djy35/ui9jKVABgy5
 hvF7ug6e76nCBgt5NA2PndGUXfNAHx6O3q/Os2lHBMkktE47YqpbRHS8tDb2RLPWcGX9daQOZiW
 sRnQ+5+9Emy0O1YNzi8XLQHLy/160EuZpBHd29UjqJFcZ1mVmBLx5gr2MgG5vvXWEoOputOAK5P
 Ry9Q1NYckrrm1BcUVbhDYwPPX7n2OtwFDF9pBAtLesXTxCmskmPiJ1P/3DQMWEX68whzWgGESxR
 9FOxs+cNzT0TpP7hApyk0pMz4HgkUKwPXYf8yCj9laocCJG5lFvZO0l2VgpJSdqFQw1dQ/yPkTd
 wIm6piRXqp5ZXovafOjUt+Wz+Y+Oow==
X-Proofpoint-ORIG-GUID: DKzKyVJYDBeTwZe5yXPlLk0owFW6IRsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
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

On 10/15/2025 9:54 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
> Changes in V3:
> - Remove the min() to min_t() changes
> - Link to V2: https://lore.kernel.org/all/20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com
> 
> Changes in V2:
> - Use explicit casts with check_*_overflow() calls
> - Replace min() with min_t()
> - Link to V1: https://lore.kernel.org/all/20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
