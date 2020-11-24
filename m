Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2A2C31E8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 21:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A736E2D7;
	Tue, 24 Nov 2020 20:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0B6E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 20:27:09 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbd6c9f0000>; Tue, 24 Nov 2020 12:27:11 -0800
Received: from [10.2.51.94] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 20:26:59 +0000
Subject: Re: [PATCH rdma-core 5/5] tests: Bug fix for get_access_flags()
To: Jianxin Xiong <jianxin.xiong@intel.com>, <linux-rdma@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-6-git-send-email-jianxin.xiong@intel.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b2365ae5-25c4-2e06-51ac-e94fffc3b6fe@nvidia.com>
Date: Tue, 24 Nov 2020 12:26:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101
 Thunderbird/83.0
MIME-Version: 1.0
In-Reply-To: <1606153984-104583-6-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606249631; bh=qa8LeVoIpKhbpCRzUIv/BMxsjcRjvgDjDP7iZ9jI1e0=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=NF2NDSk+14BaeA4F9zs2CfgEyLyUHJnf+3n4C8TdhnMuQ31Y98t8+dvUXm9cVBrxZ
 78pCvEfgz0vSxEGPhI6o+P7oBoab0OmbiPNiSnT83rhmjeFwMTIedU6k3dSp9eOMu9
 KL377M92Or44ZmtrVwYqCQHmhvOIyYYkY/A5VMZj8gF5K6PDHsDcMBj7kcLDSogBEs
 MJaKlHKnLSuX08ouLn/ZaI4DHTHSw1Q0feP08L3NqYCAoe+XhoQA7aXHcrbFblahhE
 O0dNdD0XS6Uop1frIWohAV84ynyFxEgZTZLVKeFshltykMAlk4ebMGbf7zshUVjHTu
 n/qrXYn29Fxpw==
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
Cc: Leon
 Romanovsky <leon@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just some silly nits I stumbled across while trying to understand the tests.

On 11/23/20 9:53 AM, Jianxin Xiong wrote:
> The filter defintion is wrong and causes get_access_flags() always

              definition

> returning empty list. As the result the MR tests using this function
> are effectively skipped (but report success).
> 
> Also fix a typo in the comments.

Was there another typo somewhere? All I see is an *added* typo...

> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> ---
>   tests/utils.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/utils.py b/tests/utils.py
> index 0ad7110..eee44b4 100644
> --- a/tests/utils.py
> +++ b/tests/utils.py
> @@ -55,8 +55,8 @@ def filter_illegal_access_flags(element):
>       :param element: A list of access flags to check
>       :return: True if this list is legal, else False
>       """
> -    if e.IBV_ACCESS_REMOTE_ATOMIC in element or e.IBV_ACCESS_REMOTE_WRITE:
> -        if e.IBV_ACCESS_LOCAL_WRITE:
> +    if e.IBV_ACCESS_REMOTE_ATOMIC in element or e.IBV_ACCESS_REMOTE_WRITE in element:
> +        if not e.IBV_ACCESS_LOCAL_WRITE in element:
>               return False
>       return True
>   
> @@ -69,7 +69,7 @@ def get_access_flags(ctx):
>       added as well.
>       After verifying that the flags selection is legal, it is appended to an
>       array, assuming it wasn't previously appended.
> -    :param ctx: Device Context to check capabilities
> +    :param ctx: Device Coyyntext to check capabilities

I liked the old spelling. "Coyyntext" just doesn't sound as good. :)

>       :param num: Size of initial collection
>       :return: A random legal value for MR flags
>       """
> 

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
