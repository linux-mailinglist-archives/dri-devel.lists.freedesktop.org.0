Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6417BF55
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 14:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A966ED1E;
	Fri,  6 Mar 2020 13:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53226ED1E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 13:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By/c8e3RAaYycMIXC/6WNWMWmN3uRdkA1RlOihZZCxBGvzkRHmNHYkQPnj0Mqen5XYDr9IKdsQnlBeXqUMrcqdjJrad34oq1moN91DatpTtSUeluoPL/3tTz4gO9QSSY7sZcp0WAl5gUKdoA+wAUQ11V3FevB2mfM1NAnZBZ8R3KaW709C5EClfv1BjWTAug6/0pLnBDiYdiJNFyFLCK1gTwxEOejp4KUpwS5QXZ9/71LR2j9A9sdlfQI46PnEfPqV/3xCzQs1E0WletJxBt502X05oJqVGzP0vxjQbv1G3Ebgs22nRcRoo6Kq0ciMSRhgzRGJfH5yBc+mWOr4kQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwvDo/IOvb0O8f5SV8KBLM8obpmdNeypM2YxNL4G7IU=;
 b=jl1uIFLq+aNeCSbi05/1jXFbPg6mlLCWKcWgYUWf2crXEVwXi9wnlrefYcwe/7TlJdM6QAfT9TrVCoz3R/yt6XEm/wYnVMsvxXRsUWd8OGQoSuRK11PLbi2KbX/emtd3eD/3hG/LWUPK+rfeXi+YRPUT0a7G8sU7twJ0GJl6obNh1nUCU/6Iq2P0aai0KIvWF011313/2a5+q+xSS/0vKzmANa4BbaBMAOxdBn66aUf/6jO30fKQC20VLQbqLvfRAn8+HyUfjCTVbc15f92KTSaLSYJ8nWuNy0WPKqMj1M4QZ1b5r4k+G6Dg04E+8S+M25xWG/gvRzSVh/W6SxXngA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwvDo/IOvb0O8f5SV8KBLM8obpmdNeypM2YxNL4G7IU=;
 b=xy7XUldZusLckBB1NK8fqx5K8ojRS9JCiXjYXdP/Ep1SJpLWXkLu/JXPtPAI9pzQn6y4RwHCVg05Z4lJQ2/jni2wnt9UmqNoX9MYOWTKPCuYExWlqjtfQPElEtYoFsBl1nj0E12smfbbdvXRUcyPyU3HF9m3Mi4xryCHudh3WQk=
Received: from CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 by CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Fri, 6 Mar
 2020 13:41:21 +0000
Received: from CH2PR12MB4136.namprd12.prod.outlook.com
 ([fe80::3d09:9329:6e73:7c2e]) by CH2PR12MB4136.namprd12.prod.outlook.com
 ([fe80::3d09:9329:6e73:7c2e%7]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 13:41:21 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Sean Paul <sean@poorly.run>
Subject: RE: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Topic: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Index: AQHV4rLbhLzLHl03PECed9C7lxLVpqgaMF9wgACsQoCABA22sIACNwAAgAAXRACAASf8QIAX/loAgAFMRUA=
Date: Fri, 6 Mar 2020 13:41:20 +0000
Message-ID: <CH2PR12MB4136148069AEA8C20E0D1F87FCE30@CH2PR12MB4136.namprd12.prod.outlook.com>
References: <20200213211523.156998-1-sean@poorly.run>
 <20200213211523.156998-4-sean@poorly.run>
 <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQKL25TUtnZUKh0aFBqAg+CCo9keEw-Zg0atdjZUFKKtM9A@mail.gmail.com>
 <DM6PR12MB41370AABE5D8D994E75D5F7AFC160@DM6PR12MB4137.namprd12.prod.outlook.com>
 <20200218155206.GD253734@art_vandelay> <20200218171522.GF253734@art_vandelay>
 <DM6PR12MB413789981059B29ABA3039BAFC100@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQKJ_4jV=Lf=TgB3nQrON_cQvQ85-Ti06PRZ_fwWagJaFMw@mail.gmail.com>
In-Reply-To: <CAMavQKJ_4jV=Lf=TgB3nQrON_cQvQ85-Ti06PRZ_fwWagJaFMw@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-03-06T13:08:23Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=a2a9ff43-6179-43d5-b059-0000328a02e3;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-03-06T13:41:18Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 6a6f9f03-fd6b-4c4b-ba9e-00000c8641e4
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [207.61.4.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8b715f9a-a04e-4851-2e0f-08d7c1d40e2a
x-ms-traffictypediagnostic: CH2PR12MB4215:
x-microsoft-antispam-prvs: <CH2PR12MB4215674A3E4CF03AC4378968FCE30@CH2PR12MB4215.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(71200400001)(86362001)(8676002)(7696005)(478600001)(2906002)(4326008)(30864003)(186003)(9686003)(26005)(8936002)(54906003)(316002)(55016002)(33656002)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(52536014)(6506007)(53546011)(5660300002)(6916009)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4215;
 H:CH2PR12MB4136.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:3; A:3; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: apueGi2CiVFDO5xH3neQvQ9wG7AdWiYuEuZhMxxpsPlxJ17/3pqF2NaxkIZRFFOP8+Yo15iYOdPub2jJDgqmfS30nvf5IH0tfPI+cGbyyNlJiD4ccpR8xe0mYuxPmw5qQBk5Wo7UYT5vT59FZze7/BIRvPUoQEsbbcm0EcNrzzSGQl6Qb+1vCLkUlnjk85gNMpoDB2+KZJc0tg1qc8+oXAIFdiqS/pQ7cZme9VlkZFr9Hh6LlFBh6GNSjLtNzwKFytM0H+X6fBkC4RkSS/KNRdmTXjK637HDZSVUDPL/P/QhJ+GWLaYzxAScHOCoFvsi3/gbhDh544ew7w5u/qvNWQjCM7Ud4iEAsdepIrjI0Q7R/Ox8hW7hwTWm+jLmqJMoqOJM8E1O3OLv3h0T/PIr5mzcKfY8+NCsmiawX0AoyK8/8RvEX5nBAlCX+p+Lgjii
x-ms-exchange-antispam-messagedata: WoNlk1Bor/+CS84LOWrTBoLeZIy7GTAZ3hRhb5wbqekw5V0GBgA2jLFzZi7rvPuloFCXupnK1ciLH3k5vMQH5qA/SOiTXrKHs05PTnfcEXzOJW7EQ2tJrbeKUqkdk9P7IE3sVNzcLJjEnyuya1Qwew==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b715f9a-a04e-4851-2e0f-08d7c1d40e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 13:41:20.9564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqHUIkq/OVW6+E/zqw+E5dm70RrTk6INuER2KQNIeVLWwu/wzteXR9UtWGLVXpQZNu5/KxSCh0RzWVBmELO/iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]


> -----Original Message-----
> From: Sean Paul <sean@poorly.run> 
> Sent: Friday, March 6, 2020 1:19 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; lyude@redhat.com; Sean Paul <seanpaul@chromium.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> 
> On Wed, Feb 19, 2020 at 6:00 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
> >
> > [AMD Public Use]
> >
> >
> >
> > > -----Original Message-----
> > > From: Sean Paul <sean@poorly.run>
> > > Sent: Wednesday, February 19, 2020 1:15 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: Sean Paul <sean@poorly.run>; dri-devel@lists.freedesktop.org; 
> > > lyude@redhat.com; Sean Paul <seanpaul@chromium.org>; Maarten 
> > > Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard 
> > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > >
> > > On Tue, Feb 18, 2020 at 10:52:06AM -0500, Sean Paul wrote:
> > > > On Mon, Feb 17, 2020 at 07:08:37AM +0000, Lin, Wayne wrote:
> > > > > [AMD Public Use]
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Sean Paul <sean@poorly.run>
> > > > > > Sent: Saturday, February 15, 2020 12:09 AM
> > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > Cc: dri-devel@lists.freedesktop.org; lyude@redhat.com; Sean 
> > > > > > Paul <seanpaul@chromium.org>; Maarten Lankhorst 
> > > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard 
> > > > > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > > > > Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > > > > >
> > > > > > On Fri, Feb 14, 2020 at 12:58 AM Lin, Wayne 
> > > > > > <Wayne.Lin@amd.com>
> > > wrote:
> > > > > > >
> > > > > > > [AMD Public Use]
> > > > > > >
> > > > > > > Hi Paul,
> > > > > > >
> > > > > > > Thanks for the mail!
> > > > > > >
> > > > > > > I tried to solve this problem by having restriction on 
> > > > > > > sending one msg at a
> > > > > > time due to hub/dock compatibility problems.
> > > > > > > From my experience, some branch devices don't handle well on 
> > > > > > > interleaved replies (Dock from HP I think)
> > > > > >
> > > > > > Hi Wayne,
> > > > > > Hmm, that's interesting, do you have a part number of the 
> > > > > > failing dock so I can test it?
> > > > > >
> > > > > Hi Paul,
> > > > >
> > > > > Sorry but it's been quite a while. I can't exactly tell the part number.
> > > > > If I remember correctly, when the specific branch device 
> > > > > receives interleaved replies, it just doesn't reply to any requests.
> > > > >
> > > > > > > As the result of that, correct me if I'm wrong, I remember 
> > > > > > > most gpu vendors
> > > > > > just send one down request at a time now in windows environment.
> > > > > > > I would suggest the original solution :)
> > > > > >
> > > > > > I can't really say what happens on the Windows side of the 
> > > > > > world, but I suppose that makes sense if this is a widespread 
> > > > > > issue with docks. I do worry about the performance hit.
> > > > > >
> > > > > > If indeed this is a problem, could we ratelimit per branch 
> > > > > > device instead of globally? Even that would be better than serializing everything.
> > > > > >
> > > > > Since the problem was because some branch devices can't 
> > > > > simultaneously handle two replies, I'm afraid that we might 
> > > > > still encounter
> > > the same problem?
> > > > >
> > > >
> > > > Hi Wayne,
> > > > Thanks for clarifying. I'm a bit hesitant to scrap this idea 
> > > > without solid evidence that this is a common problem. Do you have 
> > > > any hubs around AMD that you could try my patchset with?
> > Hi Paul,
> > Sure! I will see what I have at hand and try your patch set. It might 
> > take me some time but I will update this as soon as possible. :)
> >
> 
> Hi Wayne,
> I'm seeing spurious timeouts even with your serialization patch on mainline. Have you had a chance to test this set? At least on my machines it seems to be working better.
> 
> Sean
>
 
Hi Paul,

Sorry for late reply.
I was also concerning about the workload at the 1st branch device when all replies come back.
But at least these patches work on hubs I have at hand now.

Whole series are reviewed.
Reviewed-by: Wayne Lin <waynelin@amd.com> 

Thanks for your time and help!

> > Thanks!
> > >
> > > Oh, if you can test the set, you'll also need this patch as well :-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -3814,7 +3814,9 @@ static bool drm_dp_get_one_sb_msg(struct 
> > > drm_dp_mst_topology_mgr *mgr, bool up,
> > >         int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
> > >                            DP_SIDEBAND_MSG_DOWN_REP_BASE;
> > >
> > > -       *mstb = NULL;
> > > +       if (mstb)
> > > +               *mstb = NULL;
> > > +
> > >         *seqno = -1;
> > >
> > >         len = min(mgr->max_dpcd_transaction_bytes, 16);
> > >
> > >
> > > > Perhaps we could get some hard data? I'm happy to test things on 
> > > > my end, but I probably shouldn't just start buying a bunch of 
> > > > random HP docks in hopes one of them exhibits the issue :)
> > > >
> > > > To add anecdote to anecdote, everything on my desk seems to work 
> > > > with interleaved replies.
> > > >
> > > > Since HDCP spec requires the host to verify each channel's 
> > > > encryption every <2s, we're going to be increasing the amount of 
> > > > sideband traffic a fair amount, so I would like to ensure we're 
> > > > doing everything possible to maximize our sideband bandwidth.
> > > >
> > > > Sean
> > > >
> > > > > Thanks!
> > > > > > Sean
> > > > > >
> > > > > > >
> > > > > > > Thanks!
> > > > > > > > -----Original Message-----
> > > > > > > > From: Sean Paul <sean@poorly.run>
> > > > > > > > Sent: Friday, February 14, 2020 5:15 AM
> > > > > > > > To: dri-devel@lists.freedesktop.org
> > > > > > > > Cc: lyude@redhat.com; Lin, Wayne <Wayne.Lin@amd.com>; Sean 
> > > > > > > > Paul <seanpaul@chromium.org>; Maarten Lankhorst 
> > > > > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard 
> > > > > > > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > > > > > > Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > > > > > > >
> > > > > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > > > > >
> > > > > > > > Now that we can support multiple simultaneous replies, 
> > > > > > > > remove the restrictions placed on sending new tx msgs.
> > > > > > > >
> > > > > > > > This patch essentially just reverts commit
> > > > > > > >   5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a
> > > > > > > > time")
> > > > > > now
> > > > > > > > that the problem is solved in a different way.
> > > > > > > >
> > > > > > > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > > > > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
> > > > > > > >  include/drm/drm_dp_mst_helper.h       |  6 ------
> > > > > > > >  2 files changed, 2 insertions(+), 18 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > index 7e6a82efdfc02..cbf0bb0ddeb84 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > @@ -1203,8 +1203,6 @@ static int 
> > > > > > > > drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
> > > > > > > >                   txmsg->state ==
> > > DRM_DP_SIDEBAND_TX_SENT) {
> > > > > > > >                       mstb->tx_slots[txmsg->seqno] = NULL;
> > > > > > > >               }
> > > > > > > > -             mgr->is_waiting_for_dwn_reply = false;
> > > > > > > > -
> > > > > > > >       }
> > > > > > > >  out:
> > > > > > > >       if (unlikely(ret == -EIO) &&
> > > > > > > > drm_debug_enabled(DRM_UT_DP)) { @@
> > > > > > > > -1214,7 +1212,6 @@ static int 
> > > > > > > > drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
> > > > > > > >       }
> > > > > > > >       mutex_unlock(&mgr->qlock);
> > > > > > > >
> > > > > > > > -     drm_dp_mst_kick_tx(mgr);
> > > > > > > >       return ret;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -2797,11 +2794,9 @@ static void 
> > > > > > > > process_single_down_tx_qlock(struct
> > > > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > > > >       ret = process_single_tx_qlock(mgr, txmsg, false);
> > > > > > > >       if (ret == 1) {
> > > > > > > >               /* txmsg is sent it should be in the slots now */
> > > > > > > > -             mgr->is_waiting_for_dwn_reply = true;
> > > > > > > >               list_del(&txmsg->next);
> > > > > > > >       } else if (ret) {
> > > > > > > >               DRM_DEBUG_KMS("failed to send msg in q 
> > > > > > > > %d\n",
> > > ret);
> > > > > > > > -             mgr->is_waiting_for_dwn_reply = false;
> > > > > > > >               list_del(&txmsg->next);
> > > > > > > >               if (txmsg->seqno != -1)
> > > > > > > >                       txmsg->dst->tx_slots[txmsg->seqno] = 
> > > > > > > > NULL;
> > > > > > @@
> > > > > > > > -2841,8
> > > > > > > > +2836,7 @@ static void drm_dp_queue_down_tx(struct
> > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > >               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > > > > > > >       }
> > > > > > > >
> > > > > > > > -     if (list_is_singular(&mgr->tx_msg_downq) &&
> > > > > > > > -         !mgr->is_waiting_for_dwn_reply)
> > > > > > > > +     if (list_is_singular(&mgr->tx_msg_downq))
> > > > > > > >               process_single_down_tx_qlock(mgr);
> > > > > > > >       mutex_unlock(&mgr->qlock);  } @@ -3822,7 +3816,6 @@ 
> > > > > > > > static int drm_dp_mst_handle_down_rep(struct 
> > > > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > > > >       mutex_lock(&mgr->qlock);
> > > > > > > >       txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> > > > > > > >       mstb->tx_slots[seqno] = NULL;
> > > > > > > > -     mgr->is_waiting_for_dwn_reply = false;
> > > > > > > >       mutex_unlock(&mgr->qlock);
> > > > > > > >
> > > > > > > >       wake_up_all(&mgr->tx_waitq); @@ -3830,9 +3823,6 @@ 
> > > > > > > > static int drm_dp_mst_handle_down_rep(struct 
> > > > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > > > >       return 0;
> > > > > > > >
> > > > > > > >  out_clear_reply:
> > > > > > > > -     mutex_lock(&mgr->qlock);
> > > > > > > > -     mgr->is_waiting_for_dwn_reply = false;
> > > > > > > > -     mutex_unlock(&mgr->qlock);
> > > > > > > >       if (msg)
> > > > > > > >               memset(msg, 0, sizeof(struct
> > > > > > drm_dp_sideband_msg_rx));
> > > > > > > >  out:
> > > > > > > > @@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct 
> > > > > > > > work_struct
> > > > > > > > *work)
> > > > > > > >       struct drm_dp_mst_topology_mgr *mgr =
> > > container_of(work,
> > > > > > > > struct drm_dp_mst_topology_mgr, tx_work);
> > > > > > > >
> > > > > > > >       mutex_lock(&mgr->qlock);
> > > > > > > > -     if (!list_empty(&mgr->tx_msg_downq)
> > > > > > > > && !mgr->is_waiting_for_dwn_reply)
> > > > > > > > +     if (!list_empty(&mgr->tx_msg_downq))
> > > > > > > >               process_single_down_tx_qlock(mgr);
> > > > > > > >       mutex_unlock(&mgr->qlock);  } diff --git 
> > > > > > > > a/include/drm/drm_dp_mst_helper.h 
> > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > 7d0341f94ce1b..fcc30e64c8e7e
> > > > > > > > 100644
> > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > @@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
> > > > > > > >        * &drm_dp_sideband_msg_tx.state once they are queued
> > > > > > > >        */
> > > > > > > >       struct mutex qlock;
> > > > > > > > -
> > > > > > > > -     /**
> > > > > > > > -      * @is_waiting_for_dwn_reply: indicate whether is waiting
> > > for
> > > > > > down
> > > > > > > > reply
> > > > > > > > -      */
> > > > > > > > -     bool is_waiting_for_dwn_reply;
> > > > > > > > -
> > > > > > > >       /**
> > > > > > > >        * @tx_msg_downq: List of pending down replies.
> > > > > > > >        */
> > > > > > > > --
> > > > > > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > > > > > --
> > > > > > > Wayne Lin
> > > > > --
> > > > > Best regards,
> > > > > Wayne Lin
> > > >
> > > > --
> > > > Sean Paul, Software Engineer, Google / Chromium OS
> > >
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
> > --
> > Wayne Lin
--
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
