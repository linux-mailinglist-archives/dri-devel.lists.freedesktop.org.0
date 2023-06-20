Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79911736576
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5E910E27F;
	Tue, 20 Jun 2023 07:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.tom.com (smtprz25.163.net [106.38.219.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9AD10E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 07:57:33 +0000 (UTC)
Received: from my-app02.tom.com (my-app02.tom.com [127.0.0.1])
 by freemail02.tom.com (Postfix) with ESMTP id 64325B00D3D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:57:28 +0800 (CST)
Received: from my-app02.tom.com (HELO smtp.tom.com) ([127.0.0.1])
 by my-app02 (TOM SMTP Server) with SMTP ID -1703999025
 for <dri-devel@lists.freedesktop.org>;
 Tue, 20 Jun 2023 15:57:28 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
 by freemail02.tom.com (Postfix) with ESMTP id 31324B00D33
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:57:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tom.com; s=201807;
 t=1687247848; bh=fe2gbNBOimrCNd/Vj8kpZhrYgncj1cjN6H+eAQuu4MY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xlg98piG1s6bLBhNbXo7UBieV60r1wHPRuUNk7mBSncadT5C1LDiUEt+ERH1ZlZ4v
 sPBIdHPT0N4B0m3KavXQL9d7eRznnDDxDo2eEhstuuP6RvFTmWddN7DkXKh/qh7UxE
 Lcn6leovUXh2QV5XP9BoY42LSK3PSJ+rsDl1C8IU=
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
 by antispam1.tom.com (Postfix) with ESMTP id 97F32D41AF3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:57:26 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
 by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVNRXlgCc0ai for <dri-devel@lists.freedesktop.org>;
 Tue, 20 Jun 2023 15:57:25 +0800 (CST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by antispam1.tom.com (Postfix) with ESMTPA id D096BD4140C;
 Tue, 20 Jun 2023 15:57:22 +0800 (CST)
Message-ID: <c12c4031-52fb-25a2-b411-e668eb9baaa2@tom.com>
Date: Tue, 20 Jun 2023 15:57:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Su Hui <suhui@nfschina.com>
References: <20230620045919.492128-1-suhui@nfschina.com>
 <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
From: Longsuhui <Jack_sun@tom.com>
In-Reply-To: <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
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
Cc: Jane.Jian@amd.com, Bokun.Zhang@amd.com, David.Francis@amd.com,
 Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/6/20 15:37, Dan Carpenter wrote:
> On Tue, Jun 20, 2023 at 12:59:19PM +0800, Su Hui wrote:
>> Smatch error:
>>      gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: error:
>>      static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>>      static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>>
> I doubt that moving the struct members around is safe.  This looks like
> it's in a very specific order.  So I don't think this patch is correct.
>
> The reason for this false positive this code uses a #pragma to pack the
> struct.
>
> #pragma pack(push, 1) // PF2VF / VF2PF data areas are byte packed

Oh, Sorry, I didn't see this code.

This patch is error, and sorry for the noise.

> Sparse does not support this and Smatch uses Sparse as a parser.  The
> main reason why Sparse doesn't support this pragma is because Linus
> thinks it's gross.  You probably didn't even see the #pragma did you?
> And anything you can't see is unreadable by definition.
>
> "Mark the associated types properly packed individually, rather than
> use the disgusting "pragma pack()" that should never be used."
>
> https://lore.kernel.org/linux-sparse/CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com/
>
> regards,
> dan carpenter
