Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07D1642C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 12:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8886EB70;
	Wed, 19 Feb 2020 11:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5953E6EB70
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 11:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCekmM3iLQtpTyiuUWXJLFQrRukSwfK5PaLpJW0zEcZM0UkPRTyGawwyPuqvl4WgScJho0KjAHwokDTkotGwcySscWlg3yCibvJDOJzWT6cwHHN9uIqI2xjPBIcFotYuhdzeuR2gja9ySzMWSxqydmegunt6uQrmSwg9ycLgk1iYokb427ZVSaVcxWkKE5Q7xHLGpDxE6bSHI3Q8jHRtJGhaSkOgOm5QyrCjnJJKRygBB60qaF4qq+QKNu/wdX6YLMSdBD331mM4fL5iqGDFhEWNkFT3IF26cg6mZa6RFzxOt57yNhfWyiHu1UvZPbuuh7ePYnoqpAsIgDIE1owFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08GyEmGPrG4TbTYeuXZ4tqAGNIFnKakubFR5bmwdW+8=;
 b=CzB+9azfNJDVVsg3vhwh24vIRTZKYS0bTMlN/mWTJPBrsE0Ynq5SL1x7QEkj+ItgIKonmh2HcXV8w61vYXvWsviqgA3FMXOLZ5zTfWLbVvySax7g1lRRabrRU9NmWx8pB6vsS8o5xQ4WU0mc/INXpIQQ3kytSNNMatMmN14t7KI8ruOTj1DolraapBLF42D0Pk67JJGtwr9NeNiTybmoTKj0hyhWXbrbZjObJ/X01uIEh/hRhaYqDAy15ISUPaanklMe4uXO1iIUC6lEWHiGnXtsRSegBFniugpP73/Sz+J6OpdvhyODklRyQdBS0QxJDdjzw3Ru49TPZe1WptA3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08GyEmGPrG4TbTYeuXZ4tqAGNIFnKakubFR5bmwdW+8=;
 b=WHU6kUmRguucx7QG3ENP6fAY20RRMQZBSoJPnUTpiwQN5hUH+8OtXEeMiu9DGaPDprdqIgiCcne482ELJYZ5ts+oQO3IcJDpO6ir3M36QhdH0FQjySyMQz2Eb6ulkEckpEp0x6hhilrWaT6VGNmSxSN1Vo6BGc9xe34x+mH9Qos=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3961.namprd12.prod.outlook.com (10.255.174.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.27; Wed, 19 Feb 2020 11:00:18 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 11:00:18 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Sean Paul <sean@poorly.run>
Subject: RE: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Topic: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Index: AQHV4rLbhLzLHl03PECed9C7lxLVpqgaMF9wgACsQoCABA22sIACNwAAgAAXRACAASf8QA==
Date: Wed, 19 Feb 2020 11:00:18 +0000
Message-ID: <DM6PR12MB413789981059B29ABA3039BAFC100@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200213211523.156998-1-sean@poorly.run>
 <20200213211523.156998-4-sean@poorly.run>
 <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQKL25TUtnZUKh0aFBqAg+CCo9keEw-Zg0atdjZUFKKtM9A@mail.gmail.com>
 <DM6PR12MB41370AABE5D8D994E75D5F7AFC160@DM6PR12MB4137.namprd12.prod.outlook.com>
 <20200218155206.GD253734@art_vandelay> <20200218171522.GF253734@art_vandelay>
In-Reply-To: <20200218171522.GF253734@art_vandelay>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-02-19T10:54:47Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=ab11cd2a-cd0a-4a36-a95c-00008669e027;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-02-19T11:00:15Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 3e51588d-3d18-40b6-939c-000083602a64
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.134.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66965a02-effc-4973-bb63-08d7b52ae812
x-ms-traffictypediagnostic: DM6PR12MB3961:
x-microsoft-antispam-prvs: <DM6PR12MB39618C911C9BA47674A05AC9FC100@DM6PR12MB3961.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(199004)(189003)(71200400001)(7696005)(53546011)(6506007)(26005)(186003)(86362001)(33656002)(478600001)(6916009)(4326008)(81166006)(64756008)(66476007)(81156014)(8676002)(2906002)(316002)(9686003)(55016002)(76116006)(66556008)(66446008)(8936002)(66946007)(5660300002)(52536014)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3961;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5YRw8bBdNee6qs2WjfQzFiX3OtXDsBaaYHe2RJcelX4/Czcw2hxALGmP/AhjKw2mYMP3fM+XzYp2Xmmtldpw/QzmY2giNhIUDw5ouxe2+7iLfO2Mm1utsXQlBGo7egZt374iOi0mG0Hd89yfbNT//lZzmjr0R2KMbC3EitXxx9tKaDYcJtSfMpl590KXLdNput9+hvaoV+rkPFYZpx3ZUkLvAuBmlO4+BTtslUE9cbDsijmKliHmqgstrbrUQjkLrj8zjTrffa1KJwaLf+31D3VzOXa4NambO2W1/uYyRnWVxq9ZOpvlAtFuYJX25SEAk/mBuRAY02m5s8lpXJm8KvbP1UhaJvpVvmSghkloO04ODU8JhmFSfxUCsyqyFRUZ+O8QcSnbCFBeyTsx1Nuypx9Yu7c87F60hyT+Ci5CvbmCIGOPdu/sSX7TlFWZyy6+
x-ms-exchange-antispam-messagedata: vK8fzUL0XsgG2+aW+V6vcAHiHi0o4Mtvok00PDEtnHTgshMPdD9BdSEPOv6R8N39jURgeK6Ptf5NaRxvvVmFKy/xGC0tGwsgzp/sb6PU+vlh14ZHPBx/PFprKP749loUVPF+Ql90WHwlp9VQ+te+mA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66965a02-effc-4973-bb63-08d7b52ae812
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 11:00:18.1247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhNSqvrm2K8F39YFfvgkGKMiN9sAlnRHQ8ggr3rIbpC5mUIFMHzjIuBw4Rvpq4wZLuN9oQDaFtKY/ZCaHBlhSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3961
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
> Sent: Wednesday, February 19, 2020 1:15 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: Sean Paul <sean@poorly.run>; dri-devel@lists.freedesktop.org;
> lyude@redhat.com; Sean Paul <seanpaul@chromium.org>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> David Airlie <airlied@linux.ie>
> Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> 
> On Tue, Feb 18, 2020 at 10:52:06AM -0500, Sean Paul wrote:
> > On Mon, Feb 17, 2020 at 07:08:37AM +0000, Lin, Wayne wrote:
> > > [AMD Public Use]
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Sean Paul <sean@poorly.run>
> > > > Sent: Saturday, February 15, 2020 12:09 AM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org; lyude@redhat.com; Sean Paul
> > > > <seanpaul@chromium.org>; Maarten Lankhorst
> > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > > Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > > >
> > > > On Fri, Feb 14, 2020 at 12:58 AM Lin, Wayne <Wayne.Lin@amd.com>
> wrote:
> > > > >
> > > > > [AMD Public Use]
> > > > >
> > > > > Hi Paul,
> > > > >
> > > > > Thanks for the mail!
> > > > >
> > > > > I tried to solve this problem by having restriction on sending
> > > > > one msg at a
> > > > time due to hub/dock compatibility problems.
> > > > > From my experience, some branch devices don't handle well on
> > > > > interleaved replies (Dock from HP I think)
> > > >
> > > > Hi Wayne,
> > > > Hmm, that's interesting, do you have a part number of the failing
> > > > dock so I can test it?
> > > >
> > > Hi Paul,
> > >
> > > Sorry but it's been quite a while. I can't exactly tell the part number.
> > > If I remember correctly, when the specific branch device receives
> > > interleaved replies, it just doesn't reply to any requests.
> > >
> > > > > As the result of that, correct me if I'm wrong, I remember most
> > > > > gpu vendors
> > > > just send one down request at a time now in windows environment.
> > > > > I would suggest the original solution :)
> > > >
> > > > I can't really say what happens on the Windows side of the world,
> > > > but I suppose that makes sense if this is a widespread issue with
> > > > docks. I do worry about the performance hit.
> > > >
> > > > If indeed this is a problem, could we ratelimit per branch device
> > > > instead of globally? Even that would be better than serializing everything.
> > > >
> > > Since the problem was because some branch devices can't
> > > simultaneously handle two replies, I'm afraid that we might still encounter
> the same problem?
> > >
> >
> > Hi Wayne,
> > Thanks for clarifying. I'm a bit hesitant to scrap this idea without
> > solid evidence that this is a common problem. Do you have any hubs
> > around AMD that you could try my patchset with?
Hi Paul,
Sure! I will see what I have at hand and try your patch set. It might take
me some time but I will update this as soon as possible. :)

Thanks!
> 
> Oh, if you can test the set, you'll also need this patch as well :-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3814,7 +3814,9 @@ static bool drm_dp_get_one_sb_msg(struct
> drm_dp_mst_topology_mgr *mgr, bool up,
>         int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
>                            DP_SIDEBAND_MSG_DOWN_REP_BASE;
> 
> -       *mstb = NULL;
> +       if (mstb)
> +               *mstb = NULL;
> +
>         *seqno = -1;
> 
>         len = min(mgr->max_dpcd_transaction_bytes, 16);
> 
> 
> > Perhaps we could get some hard data? I'm happy to test things on my
> > end, but I probably shouldn't just start buying a bunch of random HP
> > docks in hopes one of them exhibits the issue :)
> >
> > To add anecdote to anecdote, everything on my desk seems to work with
> > interleaved replies.
> >
> > Since HDCP spec requires the host to verify each channel's encryption
> > every <2s, we're going to be increasing the amount of sideband traffic
> > a fair amount, so I would like to ensure we're doing everything
> > possible to maximize our sideband bandwidth.
> >
> > Sean
> >
> > > Thanks!
> > > > Sean
> > > >
> > > > >
> > > > > Thanks!
> > > > > > -----Original Message-----
> > > > > > From: Sean Paul <sean@poorly.run>
> > > > > > Sent: Friday, February 14, 2020 5:15 AM
> > > > > > To: dri-devel@lists.freedesktop.org
> > > > > > Cc: lyude@redhat.com; Lin, Wayne <Wayne.Lin@amd.com>; Sean
> > > > > > Paul <seanpaul@chromium.org>; Maarten Lankhorst
> > > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > > > > Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > > > > >
> > > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > > >
> > > > > > Now that we can support multiple simultaneous replies, remove
> > > > > > the restrictions placed on sending new tx msgs.
> > > > > >
> > > > > > This patch essentially just reverts commit
> > > > > >   5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a
> > > > > > time")
> > > > now
> > > > > > that the problem is solved in a different way.
> > > > > >
> > > > > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
> > > > > >  include/drm/drm_dp_mst_helper.h       |  6 ------
> > > > > >  2 files changed, 2 insertions(+), 18 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > index 7e6a82efdfc02..cbf0bb0ddeb84 100644
> > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > @@ -1203,8 +1203,6 @@ static int
> > > > > > drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
> > > > > >                   txmsg->state ==
> DRM_DP_SIDEBAND_TX_SENT) {
> > > > > >                       mstb->tx_slots[txmsg->seqno] = NULL;
> > > > > >               }
> > > > > > -             mgr->is_waiting_for_dwn_reply = false;
> > > > > > -
> > > > > >       }
> > > > > >  out:
> > > > > >       if (unlikely(ret == -EIO) &&
> > > > > > drm_debug_enabled(DRM_UT_DP)) { @@
> > > > > > -1214,7 +1212,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > > > > > drm_dp_mst_branch *mstb,
> > > > > >       }
> > > > > >       mutex_unlock(&mgr->qlock);
> > > > > >
> > > > > > -     drm_dp_mst_kick_tx(mgr);
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > @@ -2797,11 +2794,9 @@ static void
> > > > > > process_single_down_tx_qlock(struct
> > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > >       ret = process_single_tx_qlock(mgr, txmsg, false);
> > > > > >       if (ret == 1) {
> > > > > >               /* txmsg is sent it should be in the slots now */
> > > > > > -             mgr->is_waiting_for_dwn_reply = true;
> > > > > >               list_del(&txmsg->next);
> > > > > >       } else if (ret) {
> > > > > >               DRM_DEBUG_KMS("failed to send msg in q %d\n",
> ret);
> > > > > > -             mgr->is_waiting_for_dwn_reply = false;
> > > > > >               list_del(&txmsg->next);
> > > > > >               if (txmsg->seqno != -1)
> > > > > >                       txmsg->dst->tx_slots[txmsg->seqno] =
> > > > > > NULL;
> > > > @@
> > > > > > -2841,8
> > > > > > +2836,7 @@ static void drm_dp_queue_down_tx(struct
> > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > >               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > > > > >       }
> > > > > >
> > > > > > -     if (list_is_singular(&mgr->tx_msg_downq) &&
> > > > > > -         !mgr->is_waiting_for_dwn_reply)
> > > > > > +     if (list_is_singular(&mgr->tx_msg_downq))
> > > > > >               process_single_down_tx_qlock(mgr);
> > > > > >       mutex_unlock(&mgr->qlock);  } @@ -3822,7 +3816,6 @@
> > > > > > static int drm_dp_mst_handle_down_rep(struct
> > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > >       mutex_lock(&mgr->qlock);
> > > > > >       txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> > > > > >       mstb->tx_slots[seqno] = NULL;
> > > > > > -     mgr->is_waiting_for_dwn_reply = false;
> > > > > >       mutex_unlock(&mgr->qlock);
> > > > > >
> > > > > >       wake_up_all(&mgr->tx_waitq); @@ -3830,9 +3823,6 @@
> > > > > > static int drm_dp_mst_handle_down_rep(struct
> > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > >       return 0;
> > > > > >
> > > > > >  out_clear_reply:
> > > > > > -     mutex_lock(&mgr->qlock);
> > > > > > -     mgr->is_waiting_for_dwn_reply = false;
> > > > > > -     mutex_unlock(&mgr->qlock);
> > > > > >       if (msg)
> > > > > >               memset(msg, 0, sizeof(struct
> > > > drm_dp_sideband_msg_rx));
> > > > > >  out:
> > > > > > @@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct
> > > > > > work_struct
> > > > > > *work)
> > > > > >       struct drm_dp_mst_topology_mgr *mgr =
> container_of(work,
> > > > > > struct drm_dp_mst_topology_mgr, tx_work);
> > > > > >
> > > > > >       mutex_lock(&mgr->qlock);
> > > > > > -     if (!list_empty(&mgr->tx_msg_downq)
> > > > > > && !mgr->is_waiting_for_dwn_reply)
> > > > > > +     if (!list_empty(&mgr->tx_msg_downq))
> > > > > >               process_single_down_tx_qlock(mgr);
> > > > > >       mutex_unlock(&mgr->qlock);  } diff --git
> > > > > > a/include/drm/drm_dp_mst_helper.h
> > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > 7d0341f94ce1b..fcc30e64c8e7e
> > > > > > 100644
> > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > @@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
> > > > > >        * &drm_dp_sideband_msg_tx.state once they are queued
> > > > > >        */
> > > > > >       struct mutex qlock;
> > > > > > -
> > > > > > -     /**
> > > > > > -      * @is_waiting_for_dwn_reply: indicate whether is waiting
> for
> > > > down
> > > > > > reply
> > > > > > -      */
> > > > > > -     bool is_waiting_for_dwn_reply;
> > > > > > -
> > > > > >       /**
> > > > > >        * @tx_msg_downq: List of pending down replies.
> > > > > >        */
> > > > > > --
> > > > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > > > --
> > > > > Wayne Lin
> > > --
> > > Best regards,
> > > Wayne Lin
> >
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> 
> --
> Sean Paul, Software Engineer, Google / Chromium OS
--
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
