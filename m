Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49375973F08
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 19:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BD610E7C5;
	Tue, 10 Sep 2024 17:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.b="MYo1X4XB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 419 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 17:20:25 UTC
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210010E7C5;
 Tue, 10 Sep 2024 17:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4X39Jk3hpPz6ClY9D;
 Tue, 10 Sep 2024 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1725988399; x=1728580400; bh=VhmV9oFSRsxf1YqVbemrPn92
 eKvNnqMS4KCaVT2K6OM=; b=MYo1X4XBYoXLUfKyol0i8lFTKOk2NaIWDRTxGCNG
 uKoOnMI5w0U/6b5FFZd7UDUCiRVlwq3oiJI1zW7xRRP9uh6nBg+9sKN2B77TnJlD
 bK/HawOGs8m00YgCnYQArT/y/BXi0U3IF9GyHWceEUD4s7nvcfCoTduzTohYzQd1
 T5zxUZJzoANEJAm5mOx4eOC1GzXwU2EPY/98crXPajt9SMVhFG6BlrjSLBNXDaBL
 fQB2LsOA4sytKDzRLjEV2g0NCquB8k+r9wdP1omWTldl+WHfRRwrP7Snlo6Cfdoc
 jD3Yx88NwPaTj5WXKdkwZwp7VMrPnTzVXqyqTshgUDsmaQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tJodp6nfa-sQ; Tue, 10 Sep 2024 17:13:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X39JZ1wvqz6ClY97;
 Tue, 10 Sep 2024 17:13:18 +0000 (UTC)
Message-ID: <7ea6ad5b-a569-4f0a-8fc2-fd66bff19387@acm.org>
Date: Tue, 10 Sep 2024 10:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 08/19] scsi: libfcoe: Include <linux/prandom.h>
 instead of <linux/random.h>
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
 linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org,
 linux-scsi@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Cc: Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-9-ubizjak@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240909075641.258968-9-ubizjak@gmail.com>
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

On 9/9/24 12:53 AM, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Hannes Reinecke <hare@suse.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> ---
>   include/scsi/libfcoe.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/scsi/libfcoe.h b/include/scsi/libfcoe.h
> index 3c5899290aed..6616348e59b9 100644
> --- a/include/scsi/libfcoe.h
> +++ b/include/scsi/libfcoe.h
> @@ -15,7 +15,7 @@
>   #include <linux/skbuff.h>
>   #include <linux/workqueue.h>
>   #include <linux/local_lock.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>   #include <scsi/fc/fc_fcoe.h>
>   #include <scsi/libfc.h>
>   #include <scsi/fcoe_sysfs.h>

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
