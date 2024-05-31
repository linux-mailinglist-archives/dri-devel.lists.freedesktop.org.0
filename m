Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F278D6453
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AA410E002;
	Fri, 31 May 2024 14:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ik4OvtyV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1710E002
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 14:20:36 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7e95d1a6c9fso11048539f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1717165235; x=1717770035;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7+VibLQtwZz7JsVuJcW09ZTb85DGOzOVeX9MBCZ9kfg=;
 b=ik4OvtyVP+izc+X9ZCh6XR/FXXiE6kgW+4xAV0+pb1d/m0My+5IYTrP+cjXxhfBgxL
 NmMtpLaI9MIM69otV5W3UoJAelC6s7ejC1tqXfxFHTyUyeiUgOAWCgCIH0viCxWvQGYl
 nGwm8NIjA/eqrghjTnmViHHjJxuQLZmSKoPAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717165235; x=1717770035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7+VibLQtwZz7JsVuJcW09ZTb85DGOzOVeX9MBCZ9kfg=;
 b=aEyM6pHjCyQosyWcJi6LgxzoWsW6WghdKQz7uajJqGYoRkzb6UUtlWxlLQhtkVPlt4
 iNiNqPMEpikjdfq1Ckl0ahqNN7gVdWcE4r/Py+t9WdX7yt5Rcl+HuDW4B4pX/J1CzwiP
 9XEnHDCrywNoqOU3o2j+IvQ0FslsnW63hcZlIEX8+XOxXlLWwlA30HBXZ6c22l2Nh7Yp
 C7vdj0Y2tfEati37rDWNxv8LDsTzSXisiCIg7fHDcvK4av0c2H+M/2PUV5FxeNzKfbZE
 GUQDrn/k5VqFnzX18XMWbxJlzJ51ZgVfDHDkCB4u8aeiAFEoOrd8R0D9N7fwE04XxUVO
 XJxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjJ6LGrejCpGagSJBicaifwUWPWQYtIdNIMF6IzmWoPgVGUR49eJ0jTWvsoPlBHNsQllaF7L3UkhlRqagQnCwc8OV6OLeFfv0J9nW9whF/
X-Gm-Message-State: AOJu0YxaquEO2Oe0kfENxrmrdB/y5gif7aLGS0R2A8CFO/eA7D8jeKcf
 tqTCG0y53bu/8qehh24HB3ye6Nlh55JdXi8GAqIP37UerWg2Q5uXMURhaMyZyJ8=
X-Google-Smtp-Source: AGHT+IFucIP1XY+8lNyDc497JR3Cn/S9ZLDLxEWsA4aPUq5KWN7j+jKcMbBK72UCzEokx4RbxnQdFA==
X-Received: by 2002:a5e:8b09:0:b0:7e1:8829:51f6 with SMTP id
 ca18e2360f4ac-7eafff1f512mr226430539f.1.1717165235070; 
 Fri, 31 May 2024 07:20:35 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b4881d64a1sm500136173.43.2024.05.31.07.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 07:20:34 -0700 (PDT)
Message-ID: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
Date: Fri, 31 May 2024 08:20:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/accel/qaic: Fix typo 'phsyical'
To: Danish Prakash <contact@danishpraka.sh>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:QUALCOMM CLOUD AI (QAIC) DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240531060929.5281-1-contact@danishpraka.sh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240531060929.5281-1-contact@danishpraka.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/31/24 00:09, Danish Prakash wrote:
> (as part of LFX Linux Mentorship program)
> 

Please add proper commit log for this change.

> Signed-off-by: Danish Prakash <contact@danishpraka.sh>

> ---
>   Documentation/accel/qaic/qaic.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
> index efb7771273bb..628bf2f7a416 100644
> --- a/Documentation/accel/qaic/qaic.rst
> +++ b/Documentation/accel/qaic/qaic.rst
> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>   uAPI
>   ====
>   
> -QAIC creates an accel device per phsyical PCIe device. This accel device exists
> +QAIC creates an accel device per physical PCIe device. This accel device exists
>   for as long as the PCIe device is known to Linux.
>   
>   The PCIe device may not be in the state to accept requests from userspace at

thanks,
-- Shuah
