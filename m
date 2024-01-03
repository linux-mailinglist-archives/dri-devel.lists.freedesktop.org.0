Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 638B58230B8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 16:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B629310E153;
	Wed,  3 Jan 2024 15:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4303710E153
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 15:42:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 84E94601D5;
 Wed,  3 Jan 2024 15:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63891C433C8;
 Wed,  3 Jan 2024 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704296576;
 bh=GarURSTcP+YnofkLmtfNQMJqwx2ZzQwSNEcqtEu05iI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n5wYjywNLObbEFcWJCkbDmq0GycIVVA2zmUKE6BMPjyLA7wF61ye8oRhCVGRyWi3I
 p1PNIDK93u53bwXvUyylrYbcYwkYf09KAsU9sx11eyWc/KqTlaSxE2mX7N/qT5dxhg
 fzwKqRPQHddMEHZ0JamWiDLdHeACgB9fzQ4OuVbhmI5tErXQdVmEoin/zs4xNufnpA
 TvWhnpEE/vqFiJLP6z7tthgFFLyuHt2PONPRgSOAOQtj71MIbcMgAUSzQItYiqhti+
 3kg8V1R90l71wGYjFLqMGfOEVbtFAPbR7xOz0mVSRV6ETq13TVrpIdzQ1V/CCwonxP
 boshpWWnySp1w==
Message-ID: <b3732d2b-f6cf-4bf7-af1d-3ee7c4acfd3a@kernel.org>
Date: Wed, 3 Jan 2024 17:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/accel/habanalabs: Remove unnecessary braces from
 if statement
Content-Language: en-US
To: Malkoot Khan <engr.mkhan1990@gmail.com>
References: <20231228210858.114111-1-engr.mkhan1990@gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
In-Reply-To: <20231228210858.114111-1-engr.mkhan1990@gmail.com>
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
Cc: kelbaz@habana.ai, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stanislaw.gruszka@linux.intel.com,
 ttayar@habana.ai, fkassabri@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/12/2023 23:08, Malkoot Khan wrote:
> The coding style in the Linux kernel prefers not to use
> braces for single-statement if conditions.
> This patch removes the unnecessary braces from an if statement
> in the file drivers/accel/habanalabs/common/command_submission.c,
> which also resolves a coding style warning.
> 
> Signed-off-by: Malkoot Khan <engr.mkhan1990@gmail.com>
> ---
>   drivers/accel/habanalabs/common/command_submission.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
> index 3aa6eeef443b..39e23d625a3c 100644
> --- a/drivers/accel/habanalabs/common/command_submission.c
> +++ b/drivers/accel/habanalabs/common/command_submission.c
> @@ -1360,9 +1360,8 @@ static int hl_cs_sanity_checks(struct hl_fpriv *hpriv, union hl_cs_args *args)
>   			return -EINVAL;
>   		}
>   
> -	if (!hl_device_operational(hdev, &status)) {
> +	if (!hl_device_operational(hdev, &status))
>   		return -EBUSY;
> -	}
>   
>   	if ((args->in.cs_flags & HL_CS_FLAGS_STAGED_SUBMISSION) &&
>   			!hdev->supports_staged_submission) {

Thanks for the patch.
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Oded
