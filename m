Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB99EB5BA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721CA10E0C9;
	Tue, 10 Dec 2024 16:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tNyKLcLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B4610E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:12:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C1825C5486;
 Tue, 10 Dec 2024 16:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D41C4CED6;
 Tue, 10 Dec 2024 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733847152;
 bh=aeFcHfhyyi6Hrc1ORc56BM7zT3V7KDTDRrWatg2IVuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNyKLcLf9TBPZY/+magH1b8HAo631nln+OPc5sR6f4ayS8hvBfvwQPECC9oIm9ag5
 LCeTAGJ8duFEitSd1+oL2LJp9rHp5BH4DocBeF2Bv8BdcJtdCaHyWooP0i2kXRRUvq
 ZcLqGR+StgEpRHOLLCIw3mPcZElRJNRJuN6fbGm39WIn5xZ55aptvWyx9tlGVKz24c
 KMF8WTpz3g1u0nx65+IjO2ma/Pj0w759l4H3HgL3Uh0tj4dNNLLMonbl4+8bAZYCu6
 FTJJv/kq4mgaYBi6sPjghLxgc3fEXCou7AiLit1XNSNqte8p5C7RIE05x9BJ4RVNgS
 xlERbS1/Oj/2g==
Date: Tue, 10 Dec 2024 11:12:30 -0500
From: Sasha Levin <sashal@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <treding@nvidia.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net,
 sumit.garg@linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus
 devices
Message-ID: <Z1hobuvz2S03L9TF@sashalap>
References: <20241204221726.2247988-1-sashal@kernel.org>
 <20241204221726.2247988-8-sashal@kernel.org>
 <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
 <CAGETcx-6yHV5xr1j7krY8LShCF5JATX0NSwjeRUL9+3TLCMq9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx-6yHV5xr1j7krY8LShCF5JATX0NSwjeRUL9+3TLCMq9w@mail.gmail.com>
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

On Thu, Dec 05, 2024 at 04:07:45PM -0800, Saravana Kannan wrote:
>On Thu, Dec 5, 2024 at 4:06 PM Saravana Kannan <saravanak@google.com> wrote:
>>
>> On Wed, Dec 4, 2024 at 3:29 PM Sasha Levin <sashal@kernel.org> wrote:
>> >
>> > From: Saravana Kannan <saravanak@google.com>
>> >
>> > [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>> >
>> > fwnode needs to be set for a device for fw_devlink to be able to
>> > track/enforce its dependencies correctly. Without this, you'll see error
>> > messages like this when the supplier has probed and tries to make sure
>> > all its fwnode consumers are linked to it using device links:
>> >
>> > mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
>> >
>> > Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
>> > Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > Reviewed-by: Thierry Reding <treding@nvidia.com>
>> > Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> > Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google.com
>> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> As mentioned in the original cover letter:
>>
>> PSA: Do not pull any of these patches into stable kernels. fw_devlink
>> had a lot of changes that landed in the last year. It's hard to ensure
>> cherry-picks have picked up all the dependencies correctly. If any of
>> these really need to get cherry-picked into stable kernels, cc me and
>> wait for my explicit Ack.
>>
>> Is there a pressing need for this in 4.19?
>
>I copy pasted this into several replies. In all those cases I meant
>the kernel version mentioned in the subject.

I'll drop this and the other patch you've pointed out, thanks!

-- 
Thanks,
Sasha
