Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41B3436C7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 03:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DCC89D4A;
	Mon, 22 Mar 2021 02:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF3789D4A;
 Mon, 22 Mar 2021 02:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=mpHndGB3+9Mow3KD4ja1xykikgNIMh47D/6m5Cx+egM=; b=K4J0rMOlNv9PE36E8mk1JaonoL
 zh7ennjhaP+qR6NWnXeKPloDapPI9qvuDrOpW2PxkT53e33/1BM0ORKpZxCCLPU31K5EIx/c/NIRy
 kyneZ0TF1xQOFZKioxXWi+T2AjRV4I0cjiDcpSZP2+kWDu4id/6Tx5dMVWZy5jW6xHtix3C0W/zIM
 4UtKWg64NrQ1lPwfJr0qgZskbR9GA1p8ErTYroj/q52FeCL+R4KoCRHzxCsXabfetCMUBSPv3pMgI
 /m+XuSnmtz9433yRKSqjFzx+hDb88gHJb0XZdYffeklJJuchezoLSuNrLxC6iCH+awqUvTwxWv/f4
 lMdr8a4A==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOAdZ-00AjN6-Jh; Mon, 22 Mar 2021 02:50:01 +0000
Subject: Re: [PATCH] dt-bindings: display: Fix a typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, dt@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210322022953.40901-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7dcd0f8d-0337-e557-492d-973f89ffde14@infradead.org>
Date: Sun, 21 Mar 2021 19:49:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322022953.40901-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/21/21 7:29 PM, Bhaskar Chowdhury wrote:
> 
> s/Subsytem/Subsystem/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> index 43d11279c925..4b335baa3fd2 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> @@ -2,7 +2,7 @@ Qualcomm adreno/snapdragon MDP5 display controller
> 
>  Description:
> 
> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> +This is the bindings documentation for the Mobile Display Subsystem(MDSS) that

add a space:                                                 Subsystem (MDSS) that

>  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
>  controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
> 
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
