Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC75932CE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 18:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A039C3BF6;
	Mon, 15 Aug 2022 16:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C762B10E1B8;
 Mon, 15 Aug 2022 16:12:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BF8895C00ED;
 Mon, 15 Aug 2022 12:12:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 15 Aug 2022 12:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1660579929; x=1660666329; bh=rLRqhVPz0h
 hQSREG0KQPS/nirdZJabRaj8W098mmp6M=; b=0FTKcOkFtzuOjeemBBTaEzhrya
 RIAg0nko8kLNdqeiI0aMLMDbahNLctu/aMg65P1+ARi5z609hMokBOunDc9YTiKl
 C6gXoSGsXKY5YJAssH96skJ/VAPMnGdi70JXN2P9A9bYnJhSKl6Mfm5QcgqvZvmy
 yC1+OMu3Ke/AClIvjXWN079RHefo8eLCeA4XxhBdTHtKmpjasHijh7uaogV3Cx/M
 ixwxo6s39pCUU9V+ORyOzh5Hpy4pUHjXKES/ID4DIb8uGghEBOCDtNaGTTDeB2Sd
 6mPd5Ui8GKTDGDCpd3EN8JXUDBOfBOIL8l9wvZSw9Cl7LVVHQzJrcMz78AYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660579929; x=1660666329; bh=rLRqhVPz0hhQSREG0KQPS/nirdZJ
 abRaj8W098mmp6M=; b=Hf40hsSlIzpjbwJfoFz7iCWzy0PmguLzmLOeuoEetc3l
 fvV8qHnybM9fqQTTKFys3VCQx0EpCdpK8MYu9eo7TIYuO3Zga3nV9MBFCXdSEDX7
 CEytZxtG0DIMlnXmXpWJzrBFAqXUcC1gwbVwg1LRdUN8WNXNcThoyc+5l8TwPife
 9/BI2YdgSCgQh7BgH6RXsyDNOB1w2o0Z1pll/BCcYiaYz5LKSrGQBG3zhqSNgxNe
 NYRIB0s+VEhdarleLfmnEEpT4mYUbmjvKz/TA6vhfVOOuW1smVhYsNEw0Sm/V8Uj
 7LXIn2iM6JpPiLOcOmQAqDFN04a5wgriU0tVQGMjQw==
X-ME-Sender: <xms:WXD6YuFS5jDCNC9OKynEUERYHvPsXtTslB8li59GGdtycy8WWHIkAQ>
 <xme:WXD6YvWL6Y2iBuWDfbDhnt1L8t018rw9Z5XugYO_fkg1Ggb6i0PTf9XDjEvD0ctgg
 mrK6DLC-xEwvw>
X-ME-Received: <xmr:WXD6YoINa7P_fm0eYrplAKSSG_yg6IWBRu6_WUgtj9aVkB23y84ih32mcMQux-KCxIyqCteXJyWkLNh9AWaVCQA6YpnrHPIp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:WXD6YoH4cgfXOnEy0Q-zHA_qvakWexNQf7HWeOHtwZvnZ-vyOa4ArQ>
 <xmx:WXD6YkV5Z6iufp6rwF51P3Pu-Vph4utlVtlnOe_99u1kMCXUCx1vIA>
 <xmx:WXD6YrM8hc13iZXKRaSwnj18whtLw21ivWvJwWnSB2o4EYrmpsSpBw>
 <xmx:WXD6YmhHNMCNUuZOTkm95SNKMNVQ5vRgze0uaOTfIKZ_HBNg41GTAQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 12:12:08 -0400 (EDT)
Date: Mon, 15 Aug 2022 18:12:06 +0200
From: Greg KH <greg@kroah.com>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Message-ID: <YvpwVh359EMGa5kO@kroah.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "Zhu, James" <James.Zhu@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 09:11:18PM +0600, Khalid Masum wrote:
> On 8/15/22 20:15, Dong, Ruijing wrote:
> > [AMD Official Use Only - General]
> > 
> > Sorry, which "r" value was overwritten?  I didn't see the point of making this change.
> > 
> > Thanks
> > Ruijing
> > 
> > -----Original Message-----
> > From: Khalid Masum <khalid.masum.92@gmail.com>
> > Sent: Monday, August 15, 2022 3:01 AM
> > To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing <Ruijing.Dong@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>; Khalid Masum <khalid.masum.92@gmail.com>
> > Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn_v4_0_stop
> > 
> > The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before it can be used. Remove this assignment.
> > 
> > Addresses-Coverity: 1504988 ("Unused value")
> > Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> > index ca14c3ef742e..80b8a2c66b36 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> > @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
> >                  fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
> > 
> >                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
> > -                       r = vcn_v4_0_stop_dpg_mode(adev, i);
> > +                       vcn_v4_0_stop_dpg_mode(adev, i);
> >                          continue;
> >                  }
> > 
> > --
> > 2.37.1
> > 
> 
> After value is overwritten soon right after the diff.
> 
> See:
> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> 
> static int vcn_v4_0_stop(struct amdgpu_device *adev)
> {
>         volatile struct amdgpu_vcn4_fw_shared *fw_shared;
> ...
> 
>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>                 fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>                 fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
> 
>                 if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>                         r = vcn_v4_0_stop_dpg_mode(adev, i);
>                         continue;
>                 }
> 
>                 /* wait for vcn idle */
>                 r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS,
> UVD_STATUS__IDLE, 0x7);
> 
> Here, any value assigned to r is overwritten before it could
> be used. So the assignment in the true branch of the if statement
> here can be removed.

Why not fix vcn_v4_0_stop_dpg_mode() to not return anything, as it does
not, and then remove this assignment as well, which would fix up
everything at once to be more obvious what is happening and why.

thanks,

greg k-h
