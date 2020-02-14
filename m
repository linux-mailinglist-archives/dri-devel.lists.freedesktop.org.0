Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7715D1D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 06:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4466E43C;
	Fri, 14 Feb 2020 05:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B484D6E43C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 05:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgSGZnHuy9/VA1UMK1qEPEOGUZjRqQXiqq2TD/tNOtnQ+6/vJ34TnUtwvHDxx9Ji3/Mae8lCpgQ256QJU4s42gZkjxrzjBrLXq+aXuR1TGy/HmTmwSRZ8u6De6ahqNlRBakJ8Zbv0c3z/H+jzCgL6zYxhm0YO3EDlg2egUUQHhPITcJ7/zEKz8nFXtqWPOG5+xhNw6mNWNxeDphJkmv41FPuBv2CnL2DGn48l95AMHzsx022bz+82QDeAydQkAk0md6ep7XVB1x0UXtQ4kVjmHKz/+WDdVwy1DROh6QSPzRMyfSFfXjTHJ9jxMj+6rb9prRTKSLW5190mILDHfWb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlf1bP4eyCffN3PXKknj89ytbl4jj1uMmCKCm9+k2o4=;
 b=Ys+3s4QkyL7ZKwlByxj0BrfMmpq7+bDhHhudnZ+hqPx7QICtXMZLi9FNlWBIVf2NNLmWr2DMg+u1e5jQ8ZySYD3iONPaltwA2uBJw8HiJG1sewUgp9tMVnRpIpo0yVdqCdOLjtP5LupPWZBsy2ddA6e+AxNCdEpq4T3EsAKMxu2m3c9CrsrbsWe9VfS0I6uQNnbGRy46ji6/FGM/zFugII0rvoWQ+TFDZ4sekyeSonzipTWUbL1SggkZIVKXkQNhVEhgBzIUKcpLtqgO5/ciaGEeuZkiYRW7IlPZdsOKyVtQLIS2IvVjKRfsJjpZjLazXuTFJmefgyB0y7q31cUcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlf1bP4eyCffN3PXKknj89ytbl4jj1uMmCKCm9+k2o4=;
 b=XooK6SFxILSPDC/0Y5/6L5CMi8v23+oTiaUeHCaOWgDFhXidnZrZvHJkMDGdufuXjueqZFoe9vS6oHo3YCWbDwpkL1SfIFg1nDQQ/0Uaf/12f1xmATo4v78CIAcs1N7XCXvizODgvUFjaTgUJT9fxHE9BCtXgj1CCSjdT0wZidw=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3547.namprd12.prod.outlook.com (20.179.106.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Fri, 14 Feb 2020 05:58:00 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 05:57:59 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Sean Paul <sean@poorly.run>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Topic: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Thread-Index: AQHV4rLbhLzLHl03PECed9C7lxLVpqgaMF9w
Date: Fri, 14 Feb 2020 05:57:59 +0000
Message-ID: <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200213211523.156998-1-sean@poorly.run>
 <20200213211523.156998-4-sean@poorly.run>
In-Reply-To: <20200213211523.156998-4-sean@poorly.run>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-02-14T05:52:31Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=53df744d-bcdf-4c95-bb9f-00003ab1fa96;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-02-14T05:57:57Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: a29b73f3-a39b-489b-971c-00002691bda3
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.134.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1eaa425c-2a09-4fd0-15c7-08d7b112d8b0
x-ms-traffictypediagnostic: DM6PR12MB3547:
x-microsoft-antispam-prvs: <DM6PR12MB35471F884B85C558442E9F02FC150@DM6PR12MB3547.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(186003)(71200400001)(316002)(6506007)(53546011)(5660300002)(478600001)(8936002)(8676002)(26005)(54906003)(55016002)(52536014)(110136005)(2906002)(7696005)(86362001)(33656002)(76116006)(66446008)(64756008)(66556008)(66476007)(9686003)(66946007)(4326008)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3547;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ozuRi2ll5Ut4QRTA6v4KquoVem/U7Ah54zfHD/vihf1kPtsgSgrl0opmiYN4u0QKWFYyGwY9KaSZIa/oY0P2omZLampejRUw+REjJUZq9hmcPodB4ArGsFW9/BgyIsHWADE5Fd0CtRNynsbZ+EWSvPZiGkHBOQ2UWxQXKTMLoEg+9quAdtApyTAHtt2tA21vTPSFpOPqWw1RuFCyPzv8vDaNTiamVaH+LQq9tpWS9+JXf3c8lIJbnfdcQN3azktOovTEglKxANO4f3puEfGStSOzqzXWJd3i6Rg8nHnSCnjkX4U1pM1yziTEublJHnNAoAjbw0qLIwDdnyfiGuQFI0+h+e97JmWOVpX830zrIXHIHbgVSMzxQiE+7rI+E2LV1ovgb5ciCj5i/b8yF9KL5/N0IlrKkFuvNP3wNzC+IIMVkRMhInKVfa5x0o/pIjT
x-ms-exchange-antispam-messagedata: C1UNJf5Rk8YezlJYyQ5xcw7WIpJ3OQtdYx6wqXHhDlOTTTrcmLeNTOBBeFYV/TsMuXLWjzRmVM8yunoEqr3j3Kk2Xs5nmz20N8HtPnNk+AzTNSaUctgsI711JS7ZPbIiUogBJBl5sRG+dYlOVs5VfQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaa425c-2a09-4fd0-15c7-08d7b112d8b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 05:57:59.7229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESg/fSSIkKz0F+yQX6cxMrHGcReC8zA74p1+4Emd4zqWfDPRF98paRW79lhKfVQ3IAkQYXRCnXwHLd3Uskee3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3547
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
Cc: Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Hi Paul,

Thanks for the mail!

I tried to solve this problem by having restriction on sending one msg at a time due to hub/dock compatibility problems.
From my experience, some branch devices don't handle well on interleaved replies (Dock from HP I think)
As the result of that, correct me if I'm wrong, I remember most gpu vendors just send one down request at a time now in windows environment.
I would suggest the original solution :)

Thanks!
> -----Original Message-----
> From: Sean Paul <sean@poorly.run>
> Sent: Friday, February 14, 2020 5:15 AM
> To: dri-devel@lists.freedesktop.org
> Cc: lyude@redhat.com; Lin, Wayne <Wayne.Lin@amd.com>; Sean Paul
> <seanpaul@chromium.org>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> David Airlie <airlied@linux.ie>
> Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> 
> From: Sean Paul <seanpaul@chromium.org>
> 
> Now that we can support multiple simultaneous replies, remove the
> restrictions placed on sending new tx msgs.
> 
> This patch essentially just reverts commit
>   5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a time") now
> that the problem is solved in a different way.
> 
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
>  include/drm/drm_dp_mst_helper.h       |  6 ------
>  2 files changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 7e6a82efdfc02..cbf0bb0ddeb84 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1203,8 +1203,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
>  		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
>  			mstb->tx_slots[txmsg->seqno] = NULL;
>  		}
> -		mgr->is_waiting_for_dwn_reply = false;
> -
>  	}
>  out:
>  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) { @@
> -1214,7 +1212,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
>  	}
>  	mutex_unlock(&mgr->qlock);
> 
> -	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
> 
> @@ -2797,11 +2794,9 @@ static void process_single_down_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr)
>  	ret = process_single_tx_qlock(mgr, txmsg, false);
>  	if (ret == 1) {
>  		/* txmsg is sent it should be in the slots now */
> -		mgr->is_waiting_for_dwn_reply = true;
>  		list_del(&txmsg->next);
>  	} else if (ret) {
>  		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> -		mgr->is_waiting_for_dwn_reply = false;
>  		list_del(&txmsg->next);
>  		if (txmsg->seqno != -1)
>  			txmsg->dst->tx_slots[txmsg->seqno] = NULL; @@ -2841,8
> +2836,7 @@ static void drm_dp_queue_down_tx(struct
> drm_dp_mst_topology_mgr *mgr,
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
> 
> -	if (list_is_singular(&mgr->tx_msg_downq) &&
> -	    !mgr->is_waiting_for_dwn_reply)
> +	if (list_is_singular(&mgr->tx_msg_downq))
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> @@ -3822,7 +3816,6 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
>  	mutex_lock(&mgr->qlock);
>  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
>  	mstb->tx_slots[seqno] = NULL;
> -	mgr->is_waiting_for_dwn_reply = false;
>  	mutex_unlock(&mgr->qlock);
> 
>  	wake_up_all(&mgr->tx_waitq);
> @@ -3830,9 +3823,6 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
>  	return 0;
> 
>  out_clear_reply:
> -	mutex_lock(&mgr->qlock);
> -	mgr->is_waiting_for_dwn_reply = false;
> -	mutex_unlock(&mgr->qlock);
>  	if (msg)
>  		memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
>  out:
> @@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct work_struct
> *work)
>  	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct
> drm_dp_mst_topology_mgr, tx_work);
> 
>  	mutex_lock(&mgr->qlock);
> -	if (!list_empty(&mgr->tx_msg_downq)
> && !mgr->is_waiting_for_dwn_reply)
> +	if (!list_empty(&mgr->tx_msg_downq))
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h index 7d0341f94ce1b..fcc30e64c8e7e
> 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
>  	 * &drm_dp_sideband_msg_tx.state once they are queued
>  	 */
>  	struct mutex qlock;
> -
> -	/**
> -	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down
> reply
> -	 */
> -	bool is_waiting_for_dwn_reply;
> -
>  	/**
>  	 * @tx_msg_downq: List of pending down replies.
>  	 */
> --
> Sean Paul, Software Engineer, Google / Chromium OS
--
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
