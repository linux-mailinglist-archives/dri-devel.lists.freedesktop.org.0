Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB6145CFD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 21:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490CA6F60D;
	Wed, 22 Jan 2020 20:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B8A6F8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579724309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZFB953qV+gIBO5olx5LNPvRiXJZ0yhjDpEkk+yDmPc=;
 b=IZRVeLq7fM5lh6xULM+kXmsBLgahnUctQ4ofEWDQgfbufUcMCA77TSzm5uUmRhiaLOfpwL
 ao8ujf5YqdtihnSFxO1NTgoxxAiJnrn1EKPw/bUQPZLjBm6/+Aufo5Rcs3xgZEU/AT9X3T
 iEVEhFsjL+CCEndpH/+MoGhj4dqSZg8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-57B9E6_kMBaRvlfWxOVMcw-1; Wed, 22 Jan 2020 15:18:25 -0500
Received: by mail-qv1-f69.google.com with SMTP id n11so601538qvp.15
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 12:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CZFB953qV+gIBO5olx5LNPvRiXJZ0yhjDpEkk+yDmPc=;
 b=rr+bjiXybxok4NRJdrwoeAdENPS2QTwdpJG0KaR0dAu1nFFb1BZFTBZ6Fjnhlx2s2/
 xa8xTm3L+g68k+AizXunUxizfKuwZPLlVU++FABbYTMM8y5W+XIhdZnk1dymnXJTEpTm
 FmnSpwl65nA+cY92F0NRWED47yDH1VZisoona0cgSe2hSTLlOQBnmz6nf3eH4m1eQHIp
 ejMtyublrVef4WtRY9bO1XEynEpHs2dbIR2lmtK+5eiozmYHNXnOk6aSxgBhqIgS+Xjz
 Kke5zp2GRA5hSooUv0uaFp8sC9Gxav8n7secYfJhfY3klxSOB7n5Mo1uiDNj6gD4Df+A
 PrFQ==
X-Gm-Message-State: APjAAAU1GJU+GsUEicfjrX9EdIQV9QUcMjW4cF/TOGSg1UUYs8eszxTb
 4WP2frak/XhaD5veftrK9iYpNGQv2DPCs2C6JahxK8iPizLB8Vxmyke+7lFwYv1DPv7ElXi5e23
 j7upCANbm1wVx1zm6IIF5O87yuCnF
X-Received: by 2002:a05:620a:56f:: with SMTP id
 p15mr10557835qkp.160.1579724305538; 
 Wed, 22 Jan 2020 12:18:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJt7eLOsdHLJ4QKtTD3EU7lXYZhiFee2cOwokWCRVaccEWePb8GAyHZ6oAM374sdLYV1zyoA==
X-Received: by 2002:a05:620a:56f:: with SMTP id
 p15mr10557814qkp.160.1579724305308; 
 Wed, 22 Jan 2020 12:18:25 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id m8sm21978682qtk.60.2020.01.22.12.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:18:24 -0800 (PST)
Message-ID: <696e7d77904ecbe86878169efa18f49d7cb1a4ec.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, Sean Paul <sean@poorly.run>
Date: Wed, 22 Jan 2020 15:18:23 -0500
In-Reply-To: <DM6PR12MB4137A84B694D85E26F8050D8FC0C0@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
 <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
 <ec3e020798d99ce638c05b0f3eb00ebf53c3bd7c.camel@redhat.com>
 <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQK+pS40SQibFuirjLAmjmy8NbOcXWvNsFP8PanS6dEcXWw@mail.gmail.com>
 <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
 <CAMavQK+pOtQ62mp4DSRDW7nHDz4doW3LA5AV1NML-wFa3s3cQA@mail.gmail.com>
 <cfae7fec779bd8fa4da0ad0e7664cf797a1700ab.camel@redhat.com>
 <DM6PR12MB4137A84B694D85E26F8050D8FC0C0@DM6PR12MB4137.namprd12.prod.outlook.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: 57B9E6_kMBaRvlfWxOVMcw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-01-22 at 04:48 +0000, Lin, Wayne wrote:
> [AMD Public Use]
> 
> Sorry for any inconvenience I brought.

Nothing to be sorry about! This happens from time to time, it's my fault for
not noticing it in the first place anyway :P. Ville from Intel is able to
review it, so there's no rush

> Thank you so much Lyude, I will have a look on that fix patch later.
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Saturday, January 18, 2020 4:45 AM
> > To: Sean Paul <sean@poorly.run>
> > Cc: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > amd-gfx@lists.freedesktop.org; Zuo, Jerry <Jerry.Zuo@amd.com>; Kazlauskas,
> > Nicholas <Nicholas.Kazlauskas@amd.com>; stable@vger.kernel.org
> > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology
> > mgr
> > 
> > Yeah that's fine with me, I'll send out a revert for this in just a moment
> > 
> > On Fri, 2020-01-17 at 15:43 -0500, Sean Paul wrote:
> > > On Fri, Jan 17, 2020 at 3:27 PM Lyude Paul <lyude@redhat.com> wrote:
> > > > On Fri, 2020-01-17 at 11:19 -0500, Sean Paul wrote:
> > > > > On Mon, Dec 9, 2019 at 12:56 AM Lin, Wayne <Wayne.Lin@amd.com>
> > wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > Sent: Saturday, December 7, 2019 3:57 AM
> > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>;
> > > > > > > dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > > > > > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>;
> > > > > > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > > > > > <Jerry.Zuo@amd.com>; stable@vger.kernel.org
> > > > > > > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while
> > > > > > > disabling topology mgr
> > > > > > > 
> > > > > > > On Fri, 2019-12-06 at 14:24 -0500, Lyude Paul wrote:
> > > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > > > 
> > > > > > > > I'll go ahead and push this to drm-misc-next-fixes right
> > > > > > > > now, thanks!
> > > > > > > 
> > > > > > > Whoops-meant to say drm-misc-next here, anyway, pushed!
> > > > > > Thanks for your time!
> > > > > > 
> > > > > 
> > > > > I'm getting the following warning on unplug with this patch:
> > > > > 
> > > 
> > > \snip
> > > 
> > > > I think I've got a better fix for this that should avoid that
> > > > problem, I'll write up a patch and send it out in a bit
> > > 
> > > Thanks Lyude! Should we revert this patch for the time being?
> > > 
> > > > --
> > > > Cheers,
> > > >         Lyude Paul
> > > > 
> > --
> > Cheers,
> > 	Lyude Paul
> --
> Best regards,
> Wayne
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
