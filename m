Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32947B51469
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929CA10E154;
	Wed, 10 Sep 2025 10:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="RjKkPKXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 491 seconds by postgrey-1.36 at gabe;
 Wed, 10 Sep 2025 10:49:43 UTC
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com
 [203.205.221.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50BA10E154;
 Wed, 10 Sep 2025 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1757501381; bh=fQ1h9HUB+Ut100trhCu7Onnw0GmRl4didOmZZGu6GXI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RjKkPKXsj9wTB7IEGB2ysqOPz1KovyM4vJytfhVuP1EuL1PMFx3IAhqfS+lj/DEeU
 9UzGupqupbQ0zXzZGcm5L0cg+RTcjv9ODymUZtTE7sjNSjZ+SI/iqgyOA9gaO26U/T
 3SFFdfSEkGZnyIWkQ9VN2VBY/J5saP/gbjR6Na9g=
Received: from [172.25.28.125] ([111.202.154.66])
 by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
 id A55094A5; Wed, 10 Sep 2025 18:41:21 +0800
X-QQ-mid: xmsmtpt1757500881t5jokrpel
Message-ID: <tencent_EA6C39EF0B78D46EA32051C7151E859A2F08@qq.com>
X-QQ-XMAILINFO: NFXAixuB2ToDbtFP8YQzIH2XsHdkxbBQsV3I0Iw3qhvdE3KZ1NsD/+ZCdrAWLT
 4cT9XZuzB62VMBOssX7XJIoO2eYPJQOQGqb8VRC8R5lbARaiKHTai5YmTf6ZBqqB9l53VZE183Gw
 wHYv/TeL+SHElG6pkOjZ5VG165R+LugIlagS9KFG6XAfFJA1/ZzfwZed/MyLq7Mq7J2L0AZLHf0R
 52q4CqR/kSbvW1VeqLpUGBiihVGy9TPBvNagUTj1N5szanIUVFfJyP5Ww9PTVr7rzZfWuQk18eY3
 OnR0LAVztxCCuuUv3eA7muSTApr48rPGVN2ZCY2+5Gsi2BYCgBI6li3c3+DjK5+9Z/gdR84rUQq+
 xHzv5MJvLlKms7ztzO7Pgx3w+LDSl8qaITILPOpJTngK4DyVzRMDx6WYHtJocv4TGHBfR2qW7JU3
 q+BEbmvad9CZ2lNqxqf8iriP/30Ae4HDCcVmvLwi45P/T9g21Xan44RY1JjRyAcxjEQ/kU2KK7p0
 G68dAIMGuQcSR60Gr5UMJKvaaVdW8GStyf3TkyQtMyyjKR3K1aTqmESrSmjZKcUXmLpKzyjhdum0
 OeMzTlLt0RfA2B+nQvJWjhCRpffJzQd4YRyW24thHEPRaPoCrRtDe5oc0f6eyZXQ57XanuZAmdmD
 5S7kbg87XzSuTJsCKEVckBQn8AoHyWx97JzOU2GegO/UwFdylBa7s1r1KnB73Q+/KyMW6q8v89Bq
 s3ir6oD/gO82jnpyobo39Quw0oVoqSMP673YHizJDUJ/VMdS94Jtpvlt35AGPQSaN+mHH51Gub5Y
 9ACYrMYuVNIk/z3YFC7MhWGxXa9TAXWEZMTJFfzcXlkt0V6jT4Kx6+UDk9vMaDnYHZQ7M+Z9JueB
 +ghviQVRP83QEJBG0HICS33HQ6jKmZQ4CQNU8fYn0SIpv4tJzgC/s9AqsXdBOaE6fJ/OfrdHqqbW
 3Gq/I3t4SC6th9jf68uXxsxTtORf2m3N4dFW4W3DkOIZMYqTg+n20tCJt5jgptltcAypqLee2Eg2
 i2dru0HGjBOx4Vl27x0nI00pP/cUFoDt1HJ920zAqoa8zKKpeIqVWlSBUwb1k=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-OQ-MSGID: <a950c00c-cc37-4a50-8521-6c37d06e4e3f@qq.com>
Date: Wed, 10 Sep 2025 18:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/i915: set O_LARGEFILE in __create_shmem()
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel test robot <oliver.sang@intel.com>,
 chentaotao <chentaotao@didiglobal.com>
References: <20250822030651.28099-1-chentaotao@didiglobal.com>
From: Taotao Chen <chentao325@qq.com>
In-Reply-To: <20250822030651.28099-1-chentaotao@didiglobal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


在 2025/8/22 11:06, 陈涛涛 Taotao Chen 写道:
> From: Taotao Chen <chentaotao@didiglobal.com>
>
> Without O_LARGEFILE, file->f_op->write_iter calls
> generic_write_check_limits(), which enforces a 2GB (MAX_NON_LFS) limit,
> causing -EFBIG on large writes.
>
> In shmem_pwrite(), this error is later masked as -EIO due to the error
> handling order, leading to igt failures like gen9_exec_parse(bb-large).
>
> Set O_LARGEFILE in __create_shmem() to prevent -EFBIG on large writes.
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202508081029.343192ec-lkp@intel.com
> Fixes: 048832a3f400 ("drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter")
> Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>
> ---
> v2:
>   - Add force_o_largefile() guard before setting O_LARGEFILE
>
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index e3d188455f67..b9dae15c1d16 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -514,6 +514,13 @@ static int __create_shmem(struct drm_i915_private *i915,
>   	if (IS_ERR(filp))
>   		return PTR_ERR(filp);
>   
> +	/*
> +	 * Prevent -EFBIG by allowing large writes beyond MAX_NON_LFS on shmem
> +	 * objects by setting O_LARGEFILE.
> +	 */
> +	if (force_o_largefile())
> +		filp->f_flags |= O_LARGEFILE;
> +
>   	obj->filp = filp;
>   	return 0;
>   }

Hi,

Just a gentle ping on this patch. Any further comments or plans to pick 
it up?

Thanks,
Taotao


