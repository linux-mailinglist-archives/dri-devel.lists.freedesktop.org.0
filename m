Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37238B2EBE0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45910E85D;
	Thu, 21 Aug 2025 03:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="yoGmijxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BC610E85D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=VMXZvWdTxmpFtlVQ9jlbQoJIR5oaIbYtP1S8SHubNqQ=; b=yoGmijxhHu+wEGIhK6HrD097at
 6cMBFlz8C8WVswT3oLGSdlC5KkEc0GJEgqJwbV8yzsQpRCMqZWEH7cYmoXwKbA9+97QaXBfzNzVVA
 rPsxXlHDomjMQsPBHw57yLen1Wa6o9YiIhAGdncGVYxeRxwyKMeyaYqd6WJ23oX0YvMLIDlWDw6FH
 /c1Hx7P/HcqKDcDf068VRYtA+YALxUoTHnHjXbOkO+vJ3SrLCBi4CqU8nRMMKu5JCDwJxkgxnc3A3
 OhVJJo3UNzlzAs8juRI10/qO5MWvTRtl8REiq3Pt9PVi9WzraKdDI4GqpO3hfo8qqdOV9Qtl6U1qQ
 Qwr6krsQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uovt7-0000000FcTp-3v7h; Thu, 21 Aug 2025 03:22:53 +0000
Message-ID: <74ba8f4e-1ccd-4962-bb5e-48a9157da952@infradead.org>
Date: Wed, 20 Aug 2025 20:22:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
 <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-4-7066680f138a@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-4-7066680f138a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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



On 8/20/25 4:38 PM, Amirreza Zarrabi wrote:
> +/**
> + * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
> + * @id:		[in] Object id
> + * @op:		[in] Object operation, specific to the object
> + * @ret:	[out] return value
> + * @num_params	[in] number of parameters following this struct

Missing colon (':') above:
    * @num_params:

> + */
> +struct tee_ioctl_object_invoke_arg {
> +	__u64 id;
> +	__u32 op;
> +	__u32 ret;
> +	__u32 num_params;
> +	/* num_params tells the actual number of element in params */
> +	struct tee_ioctl_param params[];
> +};

-- 
~Randy

