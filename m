Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB911C6C9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BAD6EC7E;
	Thu, 12 Dec 2019 08:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681056EC67;
 Thu, 12 Dec 2019 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu1YOSTQks6jo5UQ+KTVaFjlXKVAfPjyHK5x1s3Bw1k=;
 b=dUjhcHyPkUsOFRGKArbuIKzZRobd2vkyZCvUW9IEIMJlau2ExwEdXnxXt6dxKWNwEhYtFr0vSxXi5loN8tMt4OeG9TwulSYW9V+fqoIkKwy9GxPflHfUdu0qfl04yFmdRPNQ7w6+TpFY09vk++dMi0us4u9ujLOm/j6hddE+Vgs=
Received: from VI1PR08CA0118.eurprd08.prod.outlook.com (2603:10a6:800:d4::20)
 by AM0PR08MB3506.eurprd08.prod.outlook.com (2603:10a6:208:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17; Thu, 12 Dec
 2019 08:07:23 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0118.outlook.office365.com
 (2603:10a6:800:d4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Thu, 12 Dec 2019 08:07:22 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 12 Dec 2019 08:07:21 +0000
Received: ("Tessian outbound 45a30426f8e4:v37");
 Thu, 12 Dec 2019 08:07:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0bd13607b18e190
X-CR-MTA-TID: 64aa7808
Received: from 74f596649c84.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E8851C5-D5C5-4916-98B7-20C7CD1A620B.1; 
 Thu, 12 Dec 2019 08:07:16 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74f596649c84.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Dec 2019 08:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9rO5TL5jouYnd0/zag3tzqk+Gi6X6T4aJsDCq/xN9oh9gq7XIg0VNV0J2PjQNHkBheN24+B2/slfSqhQRyyJQdG6+pzX5MmqYj8r+xkfve177BIyBOoQCii+kVAlJMtMu1WanF2veDcpRgDh1SGofEYdl1+Xj4jX0icR79I8XUP55Ss3n+YgN74UY1N92F1g8S4pNdP3gtk4nt9Crq/VKVy6VPHIKEQ2uyOKWkSbFOVPK3AGPdpwAfbXscAHkerYdwqmcBhut7T9IIlitgyyHkoyb8Jgm0g6Nk6UGMmjCDeInhRe/bp8vdsvwI/3qIszFRpTW353QUiCgyjpNDLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu1YOSTQks6jo5UQ+KTVaFjlXKVAfPjyHK5x1s3Bw1k=;
 b=Rk34QY+fC2l2q+yp2GaXmER8zETXPQR0kz9dDQAUy4SneAnFLo+Amo2U3anbxyVyFbJVEhlwbQcb8W0tjihvcWkO/CHJ4y3BNMfW6FmY5On2aZbUUI0SOVnnWqSHQH8G4iA45beWZhq+d9lqypJgwzm8AZq6l5rv3757/FAf0LkE7E2w83jHOSt3kpwGmxqrvt2IrJCaML6jNTY29uy++oLSkYrOxzSxRSv3xPTIwlIKscctqnak/YeDZK1l3oFiCQbf+SOX/12YgP5q28/UZh1Z6lTLzE+zJqEzPCyXIEXqi0I5ojJ9/vdLeq1KiLGtLWjntonT9bA9PC1k/ELfpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu1YOSTQks6jo5UQ+KTVaFjlXKVAfPjyHK5x1s3Bw1k=;
 b=dUjhcHyPkUsOFRGKArbuIKzZRobd2vkyZCvUW9IEIMJlau2ExwEdXnxXt6dxKWNwEhYtFr0vSxXi5loN8tMt4OeG9TwulSYW9V+fqoIkKwy9GxPflHfUdu0qfl04yFmdRPNQ7w6+TpFY09vk++dMi0us4u9ujLOm/j6hddE+Vgs=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4800.eurprd08.prod.outlook.com (10.255.114.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Thu, 12 Dec 2019 08:07:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 08:07:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [6/8] drm/atomic: convert to drm device based logging
Thread-Topic: [6/8] drm/atomic: convert to drm device based logging
Thread-Index: AQHVsMMpB7r+kRwlM0yYloFnaPd0Gg==
Date: Thu, 12 Dec 2019 08:07:13 +0000
Message-ID: <20191212080707.GA14875@jamwan02-TSP300>
References: <20191210123050.8799-6-jani.nikula@intel.com>
In-Reply-To: <20191210123050.8799-6-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa450f59-61c2-4b91-aef8-08d77eda50bf
X-MS-TrafficTypeDiagnostic: VE1PR08MB4800:|AM0PR08MB3506:
X-Microsoft-Antispam-PRVS: <AM0PR08MB350637377F53FFD0688D27C4B3550@AM0PR08MB3506.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:175;OLM:175;
x-forefront-prvs: 0249EFCB0B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(66946007)(66446008)(54906003)(66476007)(66556008)(64756008)(478600001)(6512007)(316002)(52116002)(81166006)(81156014)(30864003)(8676002)(33716001)(1076003)(8936002)(9686003)(5660300002)(4326008)(86362001)(6506007)(6486002)(33656002)(71200400001)(186003)(2906002)(26005)(6916009)(55236004)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4800;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v7MqtrMrVsSPkH4kw3x8CuQl6TqoFQyE6tl8wtXRZS14Z68bufWCLMOWcsEkcy1RbK/IDyEKqTJZmntvdpw4Lue0CvEwFuk82GSfQ6gg/lgg6ZxU1CjfzOxzjZqUReA4xZBZDOZR3t0bUfmX5nGLCOwXXI3I37TfkYtE8mBrC8OwMDb9RjTyJfKK6FAnw6OtOpWNKlXAOR1aHtqicartRgf7Bqc7Telemjcsz8KchyLHEZ2mEPWaxhhKnVllYgKUwagyAb9Gv+ALZJXTxooT8tAG9UWwLhP4wSboFds0l3YNrxCL/dhWoW6vVcd7zDzUsRgvdwJbxDUdg8HulDswTif0diIl3bODgrg4KqIfvatcYf++EabSkvo7Pphy4MNp6IZL2fO6HVMFUJYaRPmXu9F8lt0et5bGsIunGeIpCbBPme5s7FamayZ8iMEAaoh7
x-ms-exchange-transport-forked: True
Content-ID: <B925C96131B3C74CB1704C68FA7EE546@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4800
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39860400002)(136003)(346002)(376002)(189003)(199004)(186003)(81156014)(1076003)(26005)(86362001)(81166006)(6506007)(336012)(5660300002)(4326008)(450100002)(8676002)(76130400001)(6486002)(2906002)(70206006)(70586007)(54906003)(316002)(6862004)(6512007)(33656002)(8936002)(9686003)(30864003)(26826003)(478600001)(356004)(33716001)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3506;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 51887f3d-12e2-421e-6ab0-08d77eda4ba0
NoDisclaimer: True
X-Forefront-PRVS: 0249EFCB0B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSPWnfF/qx0Yr6/By14GV9S1VoWOnb1F4tP2Ks1a893jLjL9YfUnbtgzwtaynXePvfhHZNNion79KtTn0tRjcMp81jkclLaMm7vC4q21S6LBjdJgcMesFV61dO7nREBTRA/F35Vy3DP6FxAVFLJThdK9huxu9P+lz3jYBimMc/IKnk/R8G0BrJ0Fnm3NubTS5BnGIsRyqAe1C6OOv2kGKLdtB/aYSijMlt/LwDRy4j155yhGJMWfQNcySM8JoCH2e42e8/jsrB124eH2c2U1w2Io6fgRfJ/O8JymGJWkxuTmT/zg/s3WUgtHpfRMJjD8I6fllzrnoOlViSJmH8MUFtDrc7CFlot1ANRKYXacdyYZWu1DgVpdW58AQ+pZBnzFUlEbn9HYYyMthxImkduKyr39V5CPe8YpLi11yl2WtjBsHEC5yAX99iNAPhliWY6R
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2019 08:07:21.7913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa450f59-61c2-4b91-aef8-08d77eda50bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3506
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 02:30:48PM +0200, Jani Nikula wrote:
> Prefer drm_dbg_atomic().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_agpsupport.c |   4 +-
>  drivers/gpu/drm/drm_atomic.c     | 187 +++++++++++++++++--------------
>  2 files changed, 102 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
> index 4c7ad46fdd21..cd675e58de50 100644
> --- a/drivers/gpu/drm/drm_agpsupport.c
> +++ b/drivers/gpu/drm/drm_agpsupport.c
> @@ -330,8 +330,8 @@ int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
>  	if (retcode)
>  		return retcode;
>  	entry->bound = dev->agp->base + (page << PAGE_SHIFT);
> -	DRM_DEBUG("base = 0x%lx entry->bound = 0x%lx\n",
> -		  dev->agp->base, entry->bound);
> +	drm_dbg_core(dev, "base = 0x%lx entry->bound = 0x%lx\n",
> +		     dev->agp->base, entry->bound);
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_agp_bind);
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 14aeaf736321..8494b1c29bf0 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -99,7 +99,7 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
>  
>  	state->dev = dev;
>  
> -	DRM_DEBUG_ATOMIC("Allocated atomic state %p\n", state);
> +	drm_dbg_atomic(dev, "Allocated atomic state %p\n", state);
>  
>  	return 0;
>  fail:
> @@ -150,7 +150,7 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int i;
>  
> -	DRM_DEBUG_ATOMIC("Clearing atomic state %p\n", state);
> +	drm_dbg_atomic(dev, "Clearing atomic state %p\n", state);
>  
>  	for (i = 0; i < state->num_connector; i++) {
>  		struct drm_connector *connector = state->connectors[i].ptr;
> @@ -256,11 +256,12 @@ EXPORT_SYMBOL(drm_atomic_state_clear);
>  void __drm_atomic_state_free(struct kref *ref)
>  {
>  	struct drm_atomic_state *state = container_of(ref, typeof(*state), ref);
> -	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_device *dev = state->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
>  
>  	drm_atomic_state_clear(state);
>  
> -	DRM_DEBUG_ATOMIC("Freeing atomic state %p\n", state);
> +	drm_dbg_atomic(dev, "Freeing atomic state %p\n", state);
>  
>  	if (config->funcs->atomic_state_free) {
>  		config->funcs->atomic_state_free(state);
> @@ -290,8 +291,9 @@ struct drm_crtc_state *
>  drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>  			  struct drm_crtc *crtc)
>  {
> -	int ret, index = drm_crtc_index(crtc);
> +	struct drm_device *dev = state->dev;
>  	struct drm_crtc_state *crtc_state;
> +	int ret, index = drm_crtc_index(crtc);
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> @@ -313,8 +315,8 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>  	state->crtcs[index].ptr = crtc;
>  	crtc_state->state = state;
>  
> -	DRM_DEBUG_ATOMIC("Added [CRTC:%d:%s] %p state to %p\n",
> -			 crtc->base.id, crtc->name, crtc_state, state);
> +	drm_dbg_atomic(dev, "Added [CRTC:%d:%s] %p state to %p\n",
> +		       crtc->base.id, crtc->name, crtc_state, state);
>  
>  	return crtc_state;
>  }
> @@ -324,6 +326,7 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
>  				 const struct drm_crtc_state *new_crtc_state)
>  {
>  	struct drm_crtc *crtc = new_crtc_state->crtc;
> +	struct drm_device *dev = crtc->dev;
>  
>  	/* NOTE: we explicitly don't enforce constraints such as primary
>  	 * layer covering entire screen, since that is something we want
> @@ -334,25 +337,25 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
>  	 */
>  
>  	if (new_crtc_state->active && !new_crtc_state->enable) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] active without enabled\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(dev, "[CRTC:%d:%s] active without enabled\n",
> +			       crtc->base.id, crtc->name);

Can we add a new dedicated print level for these atomic check error msg,
In practice we more care about the atomic check errors, it is annoy to
pick it out from (so many) DRM_DEBUG_ATOMIC() msgs.

Thanks
James

>  		return -EINVAL;
>  	}
>  
>  	/* The state->enable vs. state->mode_blob checks can be WARN_ON,
>  	 * as this is a kernel-internal detail that userspace should never
>  	 * be able to trigger. */
> -	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
> +	if (drm_core_check_feature(dev, DRIVER_ATOMIC) &&
>  	    WARN_ON(new_crtc_state->enable && !new_crtc_state->mode_blob)) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] enabled without mode blob\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled without mode blob\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> -	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
> +	if (drm_core_check_feature(dev, DRIVER_ATOMIC) &&
>  	    WARN_ON(!new_crtc_state->enable && new_crtc_state->mode_blob)) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] disabled with mode blob\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(dev, "[CRTC:%d:%s] disabled with mode blob\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> @@ -368,8 +371,8 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
>  	 */
>  	if (new_crtc_state->event &&
>  	    !new_crtc_state->active && !old_crtc_state->active) {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] requesting event but off\n",
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(dev, "[CRTC:%d:%s] requesting event but off\n",
> +			       crtc->base.id, crtc->name);
>  		return -EINVAL;
>  	}
>  
> @@ -402,6 +405,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>  static int drm_atomic_connector_check(struct drm_connector *connector,
>  		struct drm_connector_state *state)
>  {
> +	struct drm_device *dev = connector->dev;
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_writeback_job *writeback_job = state->writeback_job;
>  	const struct drm_display_info *info = &connector->display_info;
> @@ -414,8 +418,8 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
>  		return 0;
>  
>  	if (writeback_job->fb && !state->crtc) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] framebuffer without CRTC\n",
> -				 connector->base.id, connector->name);
> +		drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] framebuffer without CRTC\n",
> +			       connector->base.id, connector->name);
>  		return -EINVAL;
>  	}
>  
> @@ -424,16 +428,16 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
>  								state->crtc);
>  
>  	if (writeback_job->fb && !crtc_state->active) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
> -				 connector->base.id, connector->name,
> -				 state->crtc->base.id);
> +		drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
> +			       connector->base.id, connector->name,
> +			       state->crtc->base.id);
>  		return -EINVAL;
>  	}
>  
>  	if (!writeback_job->fb) {
>  		if (writeback_job->out_fence) {
> -			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
> -					 connector->base.id, connector->name);
> +			drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
> +				       connector->base.id, connector->name);
>  			return -EINVAL;
>  		}
>  
> @@ -463,8 +467,9 @@ struct drm_plane_state *
>  drm_atomic_get_plane_state(struct drm_atomic_state *state,
>  			  struct drm_plane *plane)
>  {
> -	int ret, index = drm_plane_index(plane);
> +	struct drm_device *dev = state->dev;
>  	struct drm_plane_state *plane_state;
> +	int ret, index = drm_plane_index(plane);
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> @@ -491,8 +496,8 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>  	state->planes[index].new_state = plane_state;
>  	plane_state->state = state;
>  
> -	DRM_DEBUG_ATOMIC("Added [PLANE:%d:%s] %p state to %p\n",
> -			 plane->base.id, plane->name, plane_state, state);
> +	drm_dbg_atomic(dev, "Added [PLANE:%d:%s] %p state to %p\n",
> +		       plane->base.id, plane->name, plane_state, state);
>  
>  	if (plane_state->crtc) {
>  		struct drm_crtc_state *crtc_state;
> @@ -539,6 +544,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  				  const struct drm_plane_state *new_plane_state)
>  {
>  	struct drm_plane *plane = new_plane_state->plane;
> +	struct drm_device *dev = plane->dev;
>  	struct drm_crtc *crtc = new_plane_state->crtc;
>  	const struct drm_framebuffer *fb = new_plane_state->fb;
>  	unsigned int fb_width, fb_height;
> @@ -548,12 +554,12 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  
>  	/* either *both* CRTC and FB must be set, or neither */
>  	if (crtc && !fb) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] CRTC set but no FB\n",
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] CRTC set but no FB\n",
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	} else if (fb && !crtc) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] FB set but no CRTC\n",
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] FB set but no CRTC\n",
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	}
>  
> @@ -563,9 +569,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  
>  	/* Check whether this plane is usable on this CRTC */
>  	if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
> -		DRM_DEBUG_ATOMIC("Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
> -				 crtc->base.id, crtc->name,
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(dev, "Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
> +			       crtc->base.id, crtc->name,
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	}
>  
> @@ -574,11 +580,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  					   fb->modifier);
>  	if (ret) {
>  		struct drm_format_name_buf format_name;
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %s, modifier 0x%llx\n",
> -				 plane->base.id, plane->name,
> -				 drm_get_format_name(fb->format->format,
> -						     &format_name),
> -				 fb->modifier);
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid pixel format %s, modifier 0x%llx\n",
> +			       plane->base.id, plane->name,
> +			       drm_get_format_name(fb->format->format,
> +						   &format_name),
> +			       fb->modifier);
>  		return ret;
>  	}
>  
> @@ -587,10 +593,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
>  	    new_plane_state->crtc_h > INT_MAX ||
>  	    new_plane_state->crtc_y > INT_MAX - (int32_t) new_plane_state->crtc_h) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
> -				 plane->base.id, plane->name,
> -				 new_plane_state->crtc_w, new_plane_state->crtc_h,
> -				 new_plane_state->crtc_x, new_plane_state->crtc_y);
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
> +			       plane->base.id, plane->name,
> +			       new_plane_state->crtc_w, new_plane_state->crtc_h,
> +			       new_plane_state->crtc_x, new_plane_state->crtc_y);
>  		return -ERANGE;
>  	}
>  
> @@ -602,18 +608,18 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
>  	    new_plane_state->src_h > fb_height ||
>  	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid source coordinates "
> -				 "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> -				 plane->base.id, plane->name,
> -				 new_plane_state->src_w >> 16,
> -				 ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> -				 new_plane_state->src_h >> 16,
> -				 ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> -				 new_plane_state->src_x >> 16,
> -				 ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> -				 new_plane_state->src_y >> 16,
> -				 ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> -				 fb->width, fb->height);
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid source coordinates "
> +			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> +			       plane->base.id, plane->name,
> +			       new_plane_state->src_w >> 16,
> +			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> +			       new_plane_state->src_h >> 16,
> +			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> +			       new_plane_state->src_x >> 16,
> +			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> +			       new_plane_state->src_y >> 16,
> +			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> +			       fb->width, fb->height);
>  		return -ENOSPC;
>  	}
>  
> @@ -628,9 +634,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  		    clips->y1 < 0 ||
>  		    clips->x2 > fb_width ||
>  		    clips->y2 > fb_height) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> -					 plane->base.id, plane->name, clips->x1,
> -					 clips->y1, clips->x2, clips->y2);
> +			drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> +				       plane->base.id, plane->name, clips->x1,
> +				       clips->y1, clips->x2, clips->y2);
>  			return -EINVAL;
>  		}
>  		clips++;
> @@ -638,8 +644,8 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  	}
>  
>  	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] switching CRTC directly\n",
> -				 plane->base.id, plane->name);
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] switching CRTC directly\n",
> +			       plane->base.id, plane->name);
>  		return -EINVAL;
>  	}
>  
> @@ -766,6 +772,7 @@ struct drm_private_state *
>  drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
>  				 struct drm_private_obj *obj)
>  {
> +	struct drm_device *dev = state->dev;
>  	int index, num_objs, i, ret;
>  	size_t size;
>  	struct __drm_private_objs_state *arr;
> @@ -801,8 +808,8 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
>  
>  	state->num_private_objs = num_objs;
>  
> -	DRM_DEBUG_ATOMIC("Added new private object %p state %p to %p\n",
> -			 obj, obj_state, state);
> +	drm_dbg_atomic(dev, "Added new private object %p state %p to %p\n",
> +		       obj, obj_state, state);
>  
>  	return obj_state;
>  }
> @@ -940,6 +947,7 @@ struct drm_connector_state *
>  drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  			  struct drm_connector *connector)
>  {
> +	struct drm_device *dev = state->dev;
>  	int ret, index;
>  	struct drm_mode_config *config = &connector->dev->mode_config;
>  	struct drm_connector_state *connector_state;
> @@ -981,9 +989,9 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	state->connectors[index].ptr = connector;
>  	connector_state->state = state;
>  
> -	DRM_DEBUG_ATOMIC("Added [CONNECTOR:%d:%s] %p state to %p\n",
> -			 connector->base.id, connector->name,
> -			 connector_state, state);
> +	drm_dbg_atomic(dev, "Added [CONNECTOR:%d:%s] %p state to %p\n",
> +		       connector->base.id, connector->name,
> +		       connector_state, state);
>  
>  	if (connector_state->crtc) {
>  		struct drm_crtc_state *crtc_state;
> @@ -1036,7 +1044,8 @@ int
>  drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
>  				   struct drm_crtc *crtc)
>  {
> -	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_device *dev = state->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_connector *connector;
>  	struct drm_connector_state *conn_state;
>  	struct drm_connector_list_iter conn_iter;
> @@ -1051,8 +1060,8 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
>  	if (ret)
>  		return ret;
>  
> -	DRM_DEBUG_ATOMIC("Adding all current connectors for [CRTC:%d:%s] to %p\n",
> -			 crtc->base.id, crtc->name, state);
> +	drm_dbg_atomic(dev, "Adding all current connectors for [CRTC:%d:%s] to %p\n",
> +		       crtc->base.id, crtc->name, state);
>  
>  	/*
>  	 * Changed connectors are already in @state, so only need to look
> @@ -1099,14 +1108,15 @@ int
>  drm_atomic_add_affected_planes(struct drm_atomic_state *state,
>  			       struct drm_crtc *crtc)
>  {
> +	struct drm_device *dev = state->dev;
>  	const struct drm_crtc_state *old_crtc_state =
>  		drm_atomic_get_old_crtc_state(state, crtc);
>  	struct drm_plane *plane;
>  
>  	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
>  
> -	DRM_DEBUG_ATOMIC("Adding all current planes for [CRTC:%d:%s] to %p\n",
> -			 crtc->base.id, crtc->name, state);
> +	drm_dbg_atomic(dev, "Adding all current planes for [CRTC:%d:%s] to %p\n",
> +		       crtc->base.id, crtc->name, state);
>  
>  	drm_for_each_plane_mask(plane, state->dev, old_crtc_state->plane_mask) {
>  		struct drm_plane_state *plane_state =
> @@ -1144,13 +1154,13 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	struct drm_connector_state *conn_state;
>  	int i, ret = 0;
>  
> -	DRM_DEBUG_ATOMIC("checking %p\n", state);
> +	drm_dbg_atomic(dev, "checking %p\n", state);
>  
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] atomic core check failed\n",
> -					 plane->base.id, plane->name);
> +			drm_dbg_atomic(dev, "[PLANE:%d:%s] atomic core check failed\n",
> +				       plane->base.id, plane->name);
>  			return ret;
>  		}
>  	}
> @@ -1158,8 +1168,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  		ret = drm_atomic_crtc_check(old_crtc_state, new_crtc_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] atomic core check failed\n",
> -					 crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] atomic core check failed\n",
> +				       crtc->base.id, crtc->name);
>  			return ret;
>  		}
>  	}
> @@ -1167,8 +1177,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	for_each_new_connector_in_state(state, conn, conn_state, i) {
>  		ret = drm_atomic_connector_check(conn, conn_state);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] atomic core check failed\n",
> -					 conn->base.id, conn->name);
> +			drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] atomic core check failed\n",
> +				       conn->base.id, conn->name);
>  			return ret;
>  		}
>  	}
> @@ -1177,8 +1187,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  		ret = config->funcs->atomic_check(state->dev, state);
>  
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("atomic driver check for %p failed: %d\n",
> -					 state, ret);
> +			drm_dbg_atomic(dev, "atomic driver check for %p failed: %d\n",
> +				       state, ret);
>  			return ret;
>  		}
>  	}
> @@ -1186,8 +1196,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	if (!state->allow_modeset) {
>  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> -				DRM_DEBUG_ATOMIC("[CRTC:%d:%s] requires full modeset\n",
> -						 crtc->base.id, crtc->name);
> +				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
> +					       crtc->base.id, crtc->name);
>  				return -EINVAL;
>  			}
>  		}
> @@ -1213,14 +1223,15 @@ EXPORT_SYMBOL(drm_atomic_check_only);
>   */
>  int drm_atomic_commit(struct drm_atomic_state *state)
>  {
> -	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_device *dev = state->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
>  	int ret;
>  
>  	ret = drm_atomic_check_only(state);
>  	if (ret)
>  		return ret;
>  
> -	DRM_DEBUG_ATOMIC("committing %p\n", state);
> +	drm_dbg_atomic(dev, "committing %p\n", state);
>  
>  	return config->funcs->atomic_commit(state->dev, state, false);
>  }
> @@ -1242,14 +1253,15 @@ EXPORT_SYMBOL(drm_atomic_commit);
>   */
>  int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
>  {
> -	struct drm_mode_config *config = &state->dev->mode_config;
> +	struct drm_device *dev = state->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
>  	int ret;
>  
>  	ret = drm_atomic_check_only(state);
>  	if (ret)
>  		return ret;
>  
> -	DRM_DEBUG_ATOMIC("committing %p nonblocking\n", state);
> +	drm_dbg_atomic(dev, "committing %p nonblocking\n", state);
>  
>  	return config->funcs->atomic_commit(state->dev, state, true);
>  }
> @@ -1425,7 +1437,8 @@ EXPORT_SYMBOL(__drm_atomic_helper_set_config);
>  
>  void drm_atomic_print_state(const struct drm_atomic_state *state)
>  {
> -	struct drm_printer p = drm_info_printer(state->dev->dev);
> +	struct drm_device *dev = state->dev;
> +	struct drm_printer p = drm_info_printer(dev->dev);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
>  	struct drm_crtc *crtc;
> @@ -1434,7 +1447,7 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
>  	struct drm_connector_state *connector_state;
>  	int i;
>  
> -	DRM_DEBUG_ATOMIC("checking %p\n", state);
> +	drm_dbg_atomic(dev, "checking %p\n", state);
>  
>  	for_each_new_plane_in_state(state, plane, plane_state, i)
>  		drm_atomic_plane_print_state(&p, plane_state);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
