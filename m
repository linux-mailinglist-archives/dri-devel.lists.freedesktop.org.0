Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2F19D372
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 11:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0845C6EB49;
	Fri,  3 Apr 2020 09:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Fri, 03 Apr 2020 09:23:16 UTC
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8799D6EB42
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 09:23:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2532264C;
 Fri,  3 Apr 2020 05:16:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 03 Apr 2020 05:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+vCRer2tBJ+2uqECiyHrHv9GUPx
 3lpVNNvA4oxiT2TM=; b=S3oW3k4IQKifAEIXO6a7zxeJvC38/ZdHgeZv5OAtiIk
 tCzAv0q2ql+qkFUaYTXcPLVLP0BVRoZZCjxIapk6sFpNEFhirYXA0Cxx64sdYLUj
 t9U9zM9zmYBk+BuWBaSUJXqLyqyDgipxYis+BJeJ4ymBpASJjlcqx1626X4D+A+4
 HrrSbZR7RrH/ROKXEDuZng7Fm17GJVkOryUiY/LhE66aSm/2Ebo1puULjJEY8z5T
 ptZH9BZXGvI9e5cC2OucEtB6fOCupTWRsg8xSzS25wAl4ClIwOtkHkihDclURZLI
 Bqe2qU3wkBuuzYBs3YC3UIk9kHxbkYCojoCMk50tqMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+vCRer
 2tBJ+2uqECiyHrHv9GUPx3lpVNNvA4oxiT2TM=; b=CONOz7b6rNkZTR78Ry7DwU
 3l49bqn1vymWigoGUMOXAfufDm06aSdb8J2JZLi3SbuTPOOJsSfFbsb0IJMTWug0
 eHht68UlXT4OUn0nqXSeTpoVTXJAxEDO6xmMcNjxm9zjRdgDkjTYEVa/vegNZ/OY
 4HVFcfv1mRnbv+DJpY5sa5isYIXoPtHl537TkIFdqiwyZvdkpXPHJJ/YxFm5SGBl
 Tb+a7RRJGLjXIH8CuiBkHzwkg7UN7uVNrQjsAm0d49RS2GztzjP0C08dp+gCe/1k
 4IvJk5aX0RHYDeaTokxDep3WBGYyV7MQ7E5F1yihv26IIt+ANFuGpKLfambHC2Hw
 ==
X-ME-Sender: <xms:B_-GXkAHISz4ybNPJe62-mKYzpEmFrUwghjcn1U6ix0yF_4LoSh4UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtje
 enucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
 gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:B_-GXv3CRthpvXwgbXg-8fhUmO6U1nCg0F1PyTPYrFc3e8ZH9QAiBA>
 <xmx:B_-GXmWeCT9aGokOJpb7n7uLYQDeUGxKbadODarCE21VI9ZCzmb-aw>
 <xmx:B_-GXlx_YBR971siDDMvI4AetL_T8QXEGQb13HjKJSGPG0SsPi4ulA>
 <xmx:CP-GXq8-x2PJ4VMa-QC3Jlv4aI9RRfMI72UVKAkP27STMkblQ5W2wQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40ECE328005A;
 Fri,  3 Apr 2020 05:16:55 -0400 (EDT)
Date: Fri, 3 Apr 2020 11:16:52 +0200
From: Greg KH <greg@kroah.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v4.19.y, v4.14.y, v4.9.y] drm/etnaviv: Backport fix for
 mmu flushing
Message-ID: <20200403091652.GB3740897@kroah.com>
References: <20200402170758.8315-1-bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402170758.8315-1-bob.beckett@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 06:07:55PM +0100, Robert Beckett wrote:
> commit 4900dda90af2cb13bc1d4c12ce94b98acc8fe64e upstream
> 
> Due to async need_flush updating via other buffer mapping, checking
> gpu->need_flush in 3 places within etnaviv_buffer_queue can cause GPU
> hangs.
> 
> This occurs due to need_flush being false for the first 2 checks in that
> function, so that the extra dword does not get accounted for, but by the
> time we come to check for the third time, gpu->mmu->need_flish is true,
> which outputs the flush instruction. This causes the prefetch during the
> final link to be off by 1. This causes GPU hangs.
> 
> It causes the ring to contain patterns like this:
> 
> 0x40000005, /* LINK (8) PREFETCH=0x5,OP=LINK */                                                      
> 0x70040010, /*   ADDRESS *0x70040010 */                                                              
> 0x40000002, /* LINK (8) PREFETCH=0x2,OP=LINK */                                                      
> 0x70040000, /*   ADDRESS *0x70040000 */                                                              
> 0x08010e04, /* LOAD_STATE (1) Base: 0x03810 Size: 1 Fixp: 0 */                                       
> 0x0000001f, /*   GL.FLUSH_MMU := FLUSH_FEMMU=1,FLUSH_UNK1=1,FLUSH_UNK2=1,FLUSH_PEMMU=1,FLUSH_UNK4=1 */
> 0x08010e03, /* LOAD_STATE (1) Base: 0x0380C Size: 1 Fixp: 0 */                                       
> 0x00000000, /*   GL.FLUSH_CACHE := DEPTH=0,COLOR=0,TEXTURE=0,PE2D=0,TEXTUREVS=0,SHADER_L1=0,SHADER_L2=0,UNK10=0,UNK11=0,DESCRIPTOR_UNK12=0,DESCRIPTOR_UNK13=0 */
> 0x08010e02, /* LOAD_STATE (1) Base: 0x03808 Size: 1 Fixp: 0 */                                       
> 0x00000701, /*   GL.SEMAPHORE_TOKEN := FROM=FE,TO=PE,UNK28=0x0 */                                    
> 0x48000000, /* STALL (9) OP=STALL */                                                                 
> 0x00000701, /*   TOKEN FROM=FE,TO=PE,UNK28=0x0 */                                                    
> 0x08010e00, /* LOAD_STATE (1) Base: 0x03800 Size: 1 Fixp: 0 */                                       
> 0x00000000, /*   GL.PIPE_SELECT := PIPE=PIPE_3D */                                                   
> 0x40000035, /* LINK (8) PREFETCH=0x35,OP=LINK */                                                     
> 0x70041000, /*   ADDRESS *0x70041000 */
> 
> Here we see a link with prefetch of 5 dwords starting with the 3rd
> instruction. It only loads the 5 dwords up and including the final
> LOAD_STATE. It needs to include the final LINK instruction.
> 
> This was seen on imx6q, and the fix is confirmed to stop the GPU hangs.
> 
> The commit referenced inadvertently fixed this issue by checking
> gpu->mmu->need_flush once at the start of the function.
> Given that this commit is independant, and useful for all version, it
> seems sensible to backport it to the stable branches.
> 
> 

All now queued up, thanks for the backports.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
