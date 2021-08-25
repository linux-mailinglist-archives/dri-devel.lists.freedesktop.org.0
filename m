Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FA3F824A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3B46E505;
	Thu, 26 Aug 2021 06:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06856E3F0;
 Wed, 25 Aug 2021 17:34:15 +0000 (UTC)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17PF6fDr017837;
 Wed, 25 Aug 2021 18:13:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=YXnAEFWbquKt14dSaU6kl7u8c9elGplzDvOg3WzNBxg=;
 b=K6xFTyTEkTMv0s2G9LS9qPgLn58In6L688tTq5dAVzFvoKyrIkUMR5nKnbb4Vqu8tbmH
 QWj+Xu905Gil2RafolO/MdXLs1ETdv74GM6abi+y3eIMgTyrS0GnMigqoPw+cFZaZhSz
 Nh00QmX4yb1u2nUDjM7ixdtIUxu5neYvRAZrfZZI6ooP99q3tlTpMkF+ctzL2JgALsCK
 5VFCZNcwgPO7xbcj0MMBfjwdJVdEe6vJaz+lRHRLpMumhZ0+GWhHiRpMdU5jHTVqvw4Z
 1rdXjpzrOl5S0zuyvUE9jedsyT9J4MI62Cyw8DzAiJ2+7LPC78POUFcRyYfvTePm8fop /w== 
Received: from prod-mail-ppoint2 (prod-mail-ppoint2.akamai.com [184.51.33.19]
 (may be forged))
 by mx0b-00190b01.pphosted.com with ESMTP id 3anhh8mmnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 18:13:00 +0100
Received: from pps.filterd (prod-mail-ppoint2.akamai.com [127.0.0.1])
 by prod-mail-ppoint2.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 17PH538P029405; Wed, 25 Aug 2021 13:12:59 -0400
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
 by prod-mail-ppoint2.akamai.com with ESMTP id 3an3u21rka-1;
 Wed, 25 Aug 2021 13:12:59 -0400
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 1023647300;
 Wed, 25 Aug 2021 17:12:58 +0000 (GMT)
Subject: Re: [PATCH v6 01/11] moduleparam: add data member to struct
 kernel_param
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 seanpaul@chromium.org, jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
 <20210822222009.2035788-2-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <c83b0814-b8e1-91f5-ba28-f9db3f363ce1@akamai.com>
Date: Wed, 25 Aug 2021 13:12:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822222009.2035788-2-jim.cromie@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_07:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250101
X-Proofpoint-GUID: d5yTm-Wha_RNPM4TBCAo1XVbzvDP6Kvc
X-Proofpoint-ORIG-GUID: d5yTm-Wha_RNPM4TBCAo1XVbzvDP6Kvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_07,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250102
X-Agari-Authentication-Results: mx.akamai.com;
 spf=${SPFResult} (sender IP is 184.51.33.19)
 smtp.mailfrom=jbaron@akamai.com smtp.helo=prod-mail-ppoint2
X-Mailman-Approved-At: Thu, 26 Aug 2021 06:17:16 +0000
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



On 8/22/21 6:19 PM, Jim Cromie wrote:
> Add a const void* data member to the struct, to allow attaching
> private data that will be used soon by a setter method (via kp->data)
> to perform more elaborate actions.
> 
> To attach the data at compile time, add new macros:
> 
> module_param_cb_data() derives from module_param_cb(), adding data
> param, and latter is redefined to use former.
> 
> It calls __module_param_call_with_data(), which accepts new data param
> and inits .data with it. Re-define __module_param_call() to use it.
> 
> Use of this new data member will be rare, it might be worth redoing
> this as a separate/sub-type to de-bloat the base case.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v6:
> . const void* data - <emil.l.velikov@gmail.com>
> . better macro names s/_cbd/_cb_data/, s/_wdata/_with_data/
> . more const, no cast - Willy
> ---
>  include/linux/moduleparam.h | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index eed280fae433..b8871e514de5 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -78,6 +78,7 @@ struct kernel_param {
>  		const struct kparam_string *str;
>  		const struct kparam_array *arr;
>  	};
> +	const void *data;
>  };
>  


I wonder if kp->arg can just be used for all this and avoid this patch entirely?

define something like:

struct dd_bitmap_param {
	int bitmap;
	struct dyndbg_bitdesc *bitmap_arr;
};

and then just pass a pointer to it as 'arg' for module_param_cb? And then in
the get/set callbacks you can use kp->bitmap and kp->bitmap_arr.

Thanks,

-Jason

>  extern const struct kernel_param __start___param[], __stop___param[];
> @@ -175,6 +176,9 @@ struct kparam_array
>  #define module_param_cb(name, ops, arg, perm)				      \
>  	__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
>  
> +#define module_param_cb_data(name, ops, arg, perm, data)			\
> +	__module_param_call_with_data(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0, data)
> +
>  #define module_param_cb_unsafe(name, ops, arg, perm)			      \
>  	__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
>  			    KERNEL_PARAM_FL_UNSAFE)
> @@ -284,14 +288,17 @@ struct kparam_array
>  
>  /* This is the fundamental function for registering boot/module
>     parameters. */
> -#define __module_param_call(prefix, name, ops, arg, perm, level, flags)	\
> +#define __module_param_call(prefix, name, ops, arg, perm, level, flags) \
> +	__module_param_call_with_data(prefix, name, ops, arg, perm, level, flags, NULL)
> +
> +#define __module_param_call_with_data(prefix, name, ops, arg, perm, level, flags, data) \
>  	/* Default value instead of permissions? */			\
>  	static const char __param_str_##name[] = prefix #name;		\
>  	static struct kernel_param __moduleparam_const __param_##name	\
>  	__used __section("__param")					\
>  	__aligned(__alignof__(struct kernel_param))			\
>  	= { __param_str_##name, THIS_MODULE, ops,			\
> -	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
> +	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg }, data }
>  
>  /* Obsolete - use module_param_cb() */
>  #define module_param_call(name, _set, _get, arg, perm)			\
> 
