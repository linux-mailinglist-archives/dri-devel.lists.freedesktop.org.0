Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5466CC9A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F2010E2C0;
	Mon, 16 Jan 2023 17:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD4710E2C0;
 Mon, 16 Jan 2023 17:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673890063; bh=ZyzsRjTmVNU34HpfEFF3F1fi30gjsrT8NlXEoNiFzG4=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=PskIGupYHsGySGydCWwj1g6yvoe89GrVo1J6lUcbEdAlmlpXsiwKynoXxu0xygDCN
 7ZDx0R5BUcYsPFq7324OzfOYBwUgo8G9w6lTeDrLzztQrao3EbplYErmkaCX0gDkMS
 DBiaJOY9aoHmlb4Bq+m91fkk5TGAlbx9iblybMGk=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 16 Jan 2023 18:27:43 +0100 (CET)
X-EA-Auth: IrlmOA9GkcWFjpgqVsRSCrnsr/BoN4diJ2pZJNgdxcByJCYAEs5/BOMSTUZ1YPxEeVEJcrhzwYjn3i/AIFr9btK1svqTmKBB
Date: Mon, 16 Jan 2023 22:57:33 +0530
From: Deepak R Varma <drv@mailo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: nvkm_devinit_func.disable() to be made void
Message-ID: <Y8WJBc/tOyGDxe8b@ubun2204.myguest.virtualbox.org>
References: <Y8K+61ZOag5fXu8M@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8K+61ZOag5fXu8M@ubun2204.myguest.virtualbox.org>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 14, 2023 at 08:10:43PM +0530, Deepak R Varma wrote:
> Hello,
> It appears that the callback function disable() of struct nvkm_devinit_func does
> not need return U64 and can be transformed to be a void. This will impact a few
> drivers that have currently implementation of this callback since those always
> return 0ULL. So,
> 
> Change from
> 	  8 struct nvkm_devinit_func {
> 		... ...
> 	15          u64  (*disable)(struct nvkm_devinit *);
> 	  1 };
> 
> Change to
> 	  8 struct nvkm_devinit_func {
> 		... ...
> 	15          void  (*disable)(struct nvkm_devinit *);
> 	  1 };
> 
> 
> I am unsure if this change will have any UAPI impact. Hence wanted to confirm
> with you if you think this transformation is useful. If yes, I will be happy to
> submit a patch for your consideration.

Hello,
May I request a response on my query? Shall I proceed with submitting a patch
proposal for consideration?

Thank you,
./drv

> 
> Please let me know.
> 
> Thank you,
> ./drv
> 
> 


