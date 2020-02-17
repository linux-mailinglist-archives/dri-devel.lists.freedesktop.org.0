Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D7160B6B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 08:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581AF6E4EC;
	Mon, 17 Feb 2020 07:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FBA6E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 07:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAnIVTOA56Sdf+2GFn7xB/iBLY1TXIIi+u/rMPQreoDWwIgGgP2+3Ni5lippHn0CD9Fb5RlaZsVKnjJCJQ26dbM8Fe7AWCY3ayy0wGdOgc1chozRHQP2tmoZ15qUPA3KOfGL0Oc6qv003IBPBGupXkvZO47wgzEPe5jBOPhyTFF1EW9b4/S2XSB0SGYZQ57IOu0PsSmNw+Wuza/mAIKPr65V09ZQBSoeo9N2iZhPAJZMNHFA5X8rcWMEc0aSWw8ynKIK771MmVE1Zg3/iuChOSYNXXGXlMSpzmCIBriT+VLHojuM85VN2LHkUSISwB421NjOH3MesUMKx80tt0b8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnyTW+8opRi6J9Oz+6nxo2v9ZJFYuZbTxTuuxdthbUw=;
 b=oZHA8H8qyX0PfU0vYxCn6AyEJoTkTmYx66x84bCYT1pK6PfrVOltpHdhi+lFZ0C6s5bp3UESqfhjT51QDS3eNm9ovFWO5VDRV37PIsCdRCTb8nwhcjT5eEx/h2dcKJ1Ww8hv9+M7QEF30xh7z+hnEcVIPWvzq6psLTTdQLEzcNfuck4XNvAUzm6qkGhws54ZjDMZO9NdD5qTaA6487ILnm3wbjY7MHfCJ40Zr4JQq2F2dF3F/WyeGnnB2wySiIqH8mIes6IsS3+27E6KbBN+8CpB5/eCwNeYbj0p59pz1eYiMbVNDTIHrl6N5fIqCYxzR6HfSLv1Q+eSkh/WI6nuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnyTW+8opRi6J9Oz+6nxo2v9ZJFYuZbTxTuuxdthbUw=;
 b=SN3EqG7b4BBLP1OAcpG4fkw8YG+mTokExmlZNOb0b1LJ38Sy79vDp1wLZaNAPsy8Z2kLl4P1YVZLV1yvbhVV5VDkFQCUsVqGF7Z72PYavHL2o0dMMvqwiGE40QLthJACMRyX/Xdk7yzM1Dav/lQ/HndChMYk3+U1b1JAdfGd17A=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB4482.namprd12.prod.outlook.com (20.180.254.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Mon, 17 Feb 2020 07:08:38 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 07:08:37 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Sean Paul <sean@poorly.run>
Subject: RE: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Topic: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Index: AQHV4rLbhLzLHl03PECed9C7lxLVpqgaMF9wgACsQoCABA22sA==
Date: Mon, 17 Feb 2020 07:08:37 +0000
Message-ID: <DM6PR12MB41370AABE5D8D994E75D5F7AFC160@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200213211523.156998-1-sean@poorly.run>
 <20200213211523.156998-4-sean@poorly.run>
 <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQKL25TUtnZUKh0aFBqAg+CCo9keEw-Zg0atdjZUFKKtM9A@mail.gmail.com>
In-Reply-To: <CAMavQKL25TUtnZUKh0aFBqAg+CCo9keEw-Zg0atdjZUFKKtM9A@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-02-17T06:02:46Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=e0555e72-ec0d-4339-b9df-0000d925ed72;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-02-17T07:08:35Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: a0ed8035-9555-422f-9a6b-0000b4e4931b
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.134.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e73c62c-44e5-4ba4-fa11-08d7b37835e7
x-ms-traffictypediagnostic: DM6PR12MB4482:
x-microsoft-antispam-prvs: <DM6PR12MB44823988A4B3A2C4779F7A39FC160@DM6PR12MB4482.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(71200400001)(9686003)(2906002)(5660300002)(86362001)(55016002)(316002)(478600001)(66446008)(66946007)(186003)(64756008)(66476007)(66556008)(81156014)(7696005)(33656002)(26005)(76116006)(53546011)(6506007)(4326008)(52536014)(6916009)(54906003)(8676002)(81166006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4482;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avOXUcC2qhk7VtjcX87nNtKNYd06qFKaYn/KkOulQCMryw4TBayeSwKZ/LmZgc5rlkFaQUJCxCEyvqkDGZWDp3ZdH2yb1xKCouoIiixZcF63FL1JwnKhoBBGp0YcEulq0SGfldyfOSGD0TAw6Z8Kliyn+LJOuQAjaCBSC4VBDZFrfwb+1D+hc9sNrKsOBwAh66260S3C/UFcR9hc3ceuiRvoIdALSqjuJQ0OcW1+gzLKCMHeCdIu1egXso0x3pFJPVEByoN1M4baJ6Yep1EZBaQ7YEnk4Wh2Z6pNes+rV7r+JSRco+xTXLxjmA4EHeAUTkSUxn77apQWcZxgrRq0qkKfj0rsdL+a9BQ9D55HkeUg3aYDqOYR25BVaXD1TO8bnusaaxT6IUOGT9WV0YPUw8t1TTl9wAQHd457SmhA6gNgkWE7Czt02Bn8SztvW5aF
x-ms-exchange-antispam-messagedata: YqsqVabhd0NX0qJL5BlTxPbt0jSYBMYO1v8m987AxmNVNDHyitYK7wUAiMeD9sLuUKoC9KqtRVQfU9wWur9bK+DZn1og8t8hu+ZBRzqM2lRw8cXWHZbqMHnNX0jKtR/dRT1pWbVmNc1rCLUI2Z5zmw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e73c62c-44e5-4ba4-fa11-08d7b37835e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 07:08:37.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VODQFG9x5hMTyk2TzdBxbzQIyiz1KEqWIEvWa6k/Aw+a0sCy9hS35WVzGQSlG5sp6umDh3yEYEcNxqG39YU4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
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
> Sent: Saturday, February 15, 2020 12:09 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; lyude@redhat.com; Sean Paul
> <seanpaul@chromium.org>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> David Airlie <airlied@linux.ie>
> Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> 
> On Fri, Feb 14, 2020 at 12:58 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
> >
> > [AMD Public Use]
> >
> > Hi Paul,
> >
> > Thanks for the mail!
> >
> > I tried to solve this problem by having restriction on sending one msg at a
> time due to hub/dock compatibility problems.
> > From my experience, some branch devices don't handle well on
> > interleaved replies (Dock from HP I think)
> 
> Hi Wayne,
> Hmm, that's interesting, do you have a part number of the failing dock so I can
> test it?
> 
Hi Paul,

Sorry but it's been quite a while. I can't exactly tell the part number. 
If I remember correctly, when the specific branch device receives interleaved replies,
it just doesn't reply to any requests.

> > As the result of that, correct me if I'm wrong, I remember most gpu vendors
> just send one down request at a time now in windows environment.
> > I would suggest the original solution :)
> 
> I can't really say what happens on the Windows side of the world, but I suppose
> that makes sense if this is a widespread issue with docks. I do worry about the
> performance hit.
> 
> If indeed this is a problem, could we ratelimit per branch device instead of
> globally? Even that would be better than serializing everything.
> 
Since the problem was because some branch devices can't simultaneously handle 
two replies, I'm afraid that we might still encounter the same problem?
 
Thanks!
> Sean
> 
> >
> > Thanks!
> > > -----Original Message-----
> > > From: Sean Paul <sean@poorly.run>
> > > Sent: Friday, February 14, 2020 5:15 AM
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: lyude@redhat.com; Lin, Wayne <Wayne.Lin@amd.com>; Sean Paul
> > > <seanpaul@chromium.org>; Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > >
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > Now that we can support multiple simultaneous replies, remove the
> > > restrictions placed on sending new tx msgs.
> > >
> > > This patch essentially just reverts commit
> > >   5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a time")
> now
> > > that the problem is solved in a different way.
> > >
> > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
> > >  include/drm/drm_dp_mst_helper.h       |  6 ------
> > >  2 files changed, 2 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 7e6a82efdfc02..cbf0bb0ddeb84 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -1203,8 +1203,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > > drm_dp_mst_branch *mstb,
> > >                   txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
> > >                       mstb->tx_slots[txmsg->seqno] = NULL;
> > >               }
> > > -             mgr->is_waiting_for_dwn_reply = false;
> > > -
> > >       }
> > >  out:
> > >       if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
> > > @@
> > > -1214,7 +1212,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > > drm_dp_mst_branch *mstb,
> > >       }
> > >       mutex_unlock(&mgr->qlock);
> > >
> > > -     drm_dp_mst_kick_tx(mgr);
> > >       return ret;
> > >  }
> > >
> > > @@ -2797,11 +2794,9 @@ static void
> > > process_single_down_tx_qlock(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >       ret = process_single_tx_qlock(mgr, txmsg, false);
> > >       if (ret == 1) {
> > >               /* txmsg is sent it should be in the slots now */
> > > -             mgr->is_waiting_for_dwn_reply = true;
> > >               list_del(&txmsg->next);
> > >       } else if (ret) {
> > >               DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> > > -             mgr->is_waiting_for_dwn_reply = false;
> > >               list_del(&txmsg->next);
> > >               if (txmsg->seqno != -1)
> > >                       txmsg->dst->tx_slots[txmsg->seqno] = NULL;
> @@
> > > -2841,8
> > > +2836,7 @@ static void drm_dp_queue_down_tx(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > >       }
> > >
> > > -     if (list_is_singular(&mgr->tx_msg_downq) &&
> > > -         !mgr->is_waiting_for_dwn_reply)
> > > +     if (list_is_singular(&mgr->tx_msg_downq))
> > >               process_single_down_tx_qlock(mgr);
> > >       mutex_unlock(&mgr->qlock);
> > >  }
> > > @@ -3822,7 +3816,6 @@ static int drm_dp_mst_handle_down_rep(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >       mutex_lock(&mgr->qlock);
> > >       txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> > >       mstb->tx_slots[seqno] = NULL;
> > > -     mgr->is_waiting_for_dwn_reply = false;
> > >       mutex_unlock(&mgr->qlock);
> > >
> > >       wake_up_all(&mgr->tx_waitq);
> > > @@ -3830,9 +3823,6 @@ static int drm_dp_mst_handle_down_rep(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >       return 0;
> > >
> > >  out_clear_reply:
> > > -     mutex_lock(&mgr->qlock);
> > > -     mgr->is_waiting_for_dwn_reply = false;
> > > -     mutex_unlock(&mgr->qlock);
> > >       if (msg)
> > >               memset(msg, 0, sizeof(struct
> drm_dp_sideband_msg_rx));
> > >  out:
> > > @@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct work_struct
> > > *work)
> > >       struct drm_dp_mst_topology_mgr *mgr = container_of(work,
> > > struct drm_dp_mst_topology_mgr, tx_work);
> > >
> > >       mutex_lock(&mgr->qlock);
> > > -     if (!list_empty(&mgr->tx_msg_downq)
> > > && !mgr->is_waiting_for_dwn_reply)
> > > +     if (!list_empty(&mgr->tx_msg_downq))
> > >               process_single_down_tx_qlock(mgr);
> > >       mutex_unlock(&mgr->qlock);
> > >  }
> > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > b/include/drm/drm_dp_mst_helper.h index
> 7d0341f94ce1b..fcc30e64c8e7e
> > > 100644
> > > --- a/include/drm/drm_dp_mst_helper.h
> > > +++ b/include/drm/drm_dp_mst_helper.h
> > > @@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
> > >        * &drm_dp_sideband_msg_tx.state once they are queued
> > >        */
> > >       struct mutex qlock;
> > > -
> > > -     /**
> > > -      * @is_waiting_for_dwn_reply: indicate whether is waiting for
> down
> > > reply
> > > -      */
> > > -     bool is_waiting_for_dwn_reply;
> > > -
> > >       /**
> > >        * @tx_msg_downq: List of pending down replies.
> > >        */
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
> > --
> > Wayne Lin
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
