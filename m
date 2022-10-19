Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D26605201
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 23:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A6610E0BC;
	Wed, 19 Oct 2022 21:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C93410E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666215135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRo8z7I39TZ2xgzmOs0IkUPyEriKByUvdIr0+xvZt3Y=;
 b=TnzEz5O7TBF/cuQchHjTG+IkTf/ga3y20rJ0WhJ5oZthmYA6JiDwjruCKHsVO7/U32NVY9
 lPLkyQ+A923zsY0jdXSK+uyxMiV5pznmIaB98EoMiVih+pQszXZ9Ch/bovHuTuaTas5/eh
 IhQgsCtYVBnTRkmR6pLMQ5iWk4GOprs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-6gpdAzOHM-Wq5DZqD8HYrQ-1; Wed, 19 Oct 2022 17:32:14 -0400
X-MC-Unique: 6gpdAzOHM-Wq5DZqD8HYrQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 s14-20020a05622a1a8e00b00397eacd9c1aso13906230qtc.21
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRo8z7I39TZ2xgzmOs0IkUPyEriKByUvdIr0+xvZt3Y=;
 b=JOLz+5RkeX4nj//OLVJ8NoKSW7H8fr12G+/C9GlkHuni1JgMO8op0WIvizGoqmrpZI
 gLqLMqa7re6QsQqU9MLeM2jjRBHvKXNYqFpzYdPNBk07OpvuENaHtnyWwsaQXarY5iS0
 EewoFo0Apph07Vl/YsNx0JUyV8VWvbkuEcwwlUvD7eCgLXSi/5sYynBjjEC9xC9g9BCL
 Abatc+nMRC1grD73A7HDv/23TkWAf4eymuLqmRPom406M6k3j5e06Zgmkbc2OKFNBwiN
 4RukqO60c0vVpAGwb5g5tt8cpt0PE59MB3wFo3hF58xG03SKm6Y7ESL1NxMcT0CEcg7d
 CZ+A==
X-Gm-Message-State: ACrzQf1NcGmr8TWuchV5FrQF2ENLNA/mm+IhzQwp2bpvELvBCfXUoIGH
 fMrhxqhy4+ke9oBBytHZZYPdXTmkmDopRmWM1U4xlep0Sjh/Q0AtTV1OWhOjff45/jVegtv+PSN
 Hn50RQ0CwW0K1vhnO0wRiZEhVH4rQ
X-Received: by 2002:ac8:7e84:0:b0:35b:a902:57c3 with SMTP id
 w4-20020ac87e84000000b0035ba90257c3mr8244616qtj.37.1666215133689; 
 Wed, 19 Oct 2022 14:32:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n9BznDrKP2dQk6tJ1JIOGufLUsAqZJjny42w86LkBTeAVBcYMkps5A9DvXTIjQgO1LQYTSA==
X-Received: by 2002:ac8:7e84:0:b0:35b:a902:57c3 with SMTP id
 w4-20020ac87e84000000b0035ba90257c3mr8244601qtj.37.1666215133472; 
 Wed, 19 Oct 2022 14:32:13 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300:fdba:af4a:bbcd:7e28?
 ([2600:4040:5c68:4300:fdba:af4a:bbcd:7e28])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac81184000000b00359961365f1sm4675476qtj.68.2022.10.19.14.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:32:12 -0700 (PDT)
Message-ID: <41ffe32931a21961a3f368b30bd4335faa5ac6a4.camel@redhat.com>
Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
 drm_dp_add_payload_part2()
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Wed, 19 Oct 2022 17:32:11 -0400
In-Reply-To: <CO6PR12MB548939841653ABD0EAA95DCAFC299@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20221004202429.124422-1-lyude@redhat.com>
 <d3b272e1-3b5d-c843-e8ac-57dc5e3a7ced@amd.com>
 <128762cfb6524d17e6ee7308aa7e859dd350fa63.camel@redhat.com>
 <CO6PR12MB548939841653ABD0EAA95DCAFC299@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Chen, Ian" <Ian.Chen@amd.com>, "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 Claudio Suarez <cssk@net-c.es>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gotcha, I'll take another look at this tomorrow

On Mon, 2022-10-17 at 03:09 +0000, Lin, Wayne wrote:
> [Public]
> 
> 
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Thursday, October 6, 2022 3:37 AM
> > To: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; dri-
> > devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> > <Sunpeng.Li@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Chen, Ian
> > <Ian.Chen@amd.com>; Mikita Lipski <mikita.lipski@amd.com>; Mahfooz,
> > Hamza <Hamza.Mahfooz@amd.com>; Claudio Suarez <cssk@net-c.es>; Colin
> > Ian King <colin.i.king@gmail.com>; Jani Nikula <jani.nikula@intel.com>; open
> > list <linux-kernel@vger.kernel.org>
> > Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
> > drm_dp_add_payload_part2()
> > 
> > On Tue, 2022-10-04 at 16:46 -0400, Rodrigo Siqueira Jordao wrote:
> > > 
> > > On 2022-10-04 16:24, Lyude Paul wrote:
> > > > Yikes, it appears somehow I totally made a mistake here. We're
> > > > currently checking to see if drm_dp_add_payload_part2() returns a
> > > > non-zero value to indicate success. That's totally wrong though, as
> > > > this function only returns a zero value on success - not the other way
> > around.
> > > > 
> > > > So, fix that.
> > > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Issue:
> > > > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgi
> > > > tlab.freedesktop.org%2Fdrm%2Famd%2F-
> > %2Fissues%2F2171&amp;data=05%7C0
> > > > 
> > 1%7Cwayne.lin%40amd.com%7Ccd5a63120e064f4bb6aa08daa7090baf%7C3d
> > d8961
> > > > 
> > fe4884e608e11a82d994e183d%7C0%7C0%7C638005954559719396%7CUnkno
> > wn%7CT
> > > > 
> > WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> > JXV
> > > > 
> > CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=nMIGnUKS6EDrdKJ0rR%2BAh
> > FRa4ST0%2
> > > > BYr9bILmXv40yv0%3D&amp;reserved=0
> > > > Fixes: 4d07b0bc4034 ("drm/display/dp_mst: Move all payload info into
> > > > the atomic state")
> > > > ---
> > > >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2
> > +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git
> > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > index b8077fcd4651..00598def5b39 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > +++
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > @@ -297,7 +297,7 @@ bool
> > dm_helpers_dp_mst_send_payload_allocation(
> > > >   		clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
> > > >   	}
> > > > 
> > > > -	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state-
> > > base.state, payload)) {
> > > > +	if (enable && drm_dp_add_payload_part2(mst_mgr,
> > > > +mst_state->base.state, payload) == 0) {
> 
> Hi Lyude,
> 
> This line changes the original logic a bit. The 'if' case was trying to catch failure 
> while sending ALLOCATE_PAYLOAD. If the msg fails, set the set_flag to false.
> If succeed, set the set_flag to true and clear the clr_flag. 
> 
> Sorry if the code wording misleading. Thanks!
> 
> > > >   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
> > > >   			set_flag, false);
> > > >   	} else {
> > > 
> > > Hi Lyude,
> > > 
> > > Maybe I'm missing something, but I can't find the
> > > drm_dp_add_payload_part2() function on amd-staging-drm-next. Which
> > > repo are you using?
> > 
> > If it's not on amd-staging-drm-next then it likely hasn't gotten backported to
> > amd's branch yet and is in drm-misc-next
> > 
> > > 
> > > Thanks
> > > Siqueira
> > > 
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> --
> Regards,
> Wayne Lin
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

