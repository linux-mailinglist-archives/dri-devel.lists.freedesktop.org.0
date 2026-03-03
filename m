Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE/YF9H9pmkKcAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:27:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B01F296D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0410510E05D;
	Tue,  3 Mar 2026 15:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Rqodd+ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13110E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPkP76k5KzUYufHIZ36bux0lmSBBjF2SHirv9vPz+sZtHpESv3mn8UcHzAP0jFG+m/X6u2bBsH8XLpX4Y+GpsflHzQD8YIjRzYEGydo5GtrPpU/Ys+CoOSCUKjFZGlDz+Q/ECTXcmytLD7t5Ud3fOAqRCCE7h+uPe2st63VbCbu0VsGjUUG11fSOD5d9JyI1uUZRwR3TTwGoPXaVjZIiuz9FSu0xm5vv11qEL0hPQu6nTlurSxWf1GvaiByInwiI5REY6Du/rFCPSE0uidpXuVs8ziiGVZYjgg5qSxdm9R8SR8YoKBf+e/XwC35O8rzX6B+rTbUc/jyzAowA4pTBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9UkXbsPuCxZIUt+NOCBoC09QzYiAeat/kX/zDGbm44=;
 b=dp2w8iEgZKJWrIgRVdTQhc1fhjtxcvZcvkHAViATB9uYS8h59BvsrC9sUiRwu6cevY8lFdxY0Fq1H19m3g5rhjq4njyT3QzPR6Agv9XTEBb3uj4hezX9hsVO/zbd6Ndp5RE3e1axu10tfXRPsckoFhTELsNu8Atr2e8t3Y6qoSI6Vn8PIWv3H/5SFkvnnraebuIM1e3pt/l+kCQNjPWnXQEGACt13issDoDg/XHH5L7ZRpo62Hy5rL3b/P8ZUSSEKiabdJBpIhkyi5fWSzvamIXdIGb0BHn3SRJYll3EceSHgDFRxYY0ZbY1vtxXWxr1FENpPRK5KyssrblbtIzBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9UkXbsPuCxZIUt+NOCBoC09QzYiAeat/kX/zDGbm44=;
 b=Rqodd+ihT3kYcRN56ZJak3mRKo2d/nwbd1G+U1P308K4w7ACZJdpU4g9vqiIeJ4q71maTA1giQLsE7Q/CoM/aeEC31l/N6EyXE934OajDAidxB4geTNLZ4LQ+JD7HmzjpIjc0Jh6ipqvpTDDQyFtHCbfAqZJXKhiJsVxYHAe06DU6sCYd6Hg5D3rIghA1xkMheU1KCxQphJLwZNHaZaoRX5y/u1BwH+4GCiOywpeq9NmtGpdUoDQMkoUNaZmel8ft/LbaPChRDwmQThtkwc3oqQ/lHi5mBc1AYt4JDWqdGUG5gB7tGSpst76aNNrt5JHNu3aeQRMdtJt+5Xv/2nHkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB8031.eurprd04.prod.outlook.com (2603:10a6:102:bb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:27:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:27:02 +0000
Date: Tue, 3 Mar 2026 10:26:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com,
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 09/14] ARM: dts: imx6ul-var-som: add proper Wifi and
 Bluetooth support
Message-ID: <aab9uWjgzg4-ScFg@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-10-hugo@hugovil.com>
 <aaX6P_ulJTq_pipa@lizhi-Precision-Tower-5810>
 <20260302164231.616bd69c106cbcdd107d9cbb@hugovil.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302164231.616bd69c106cbcdd107d9cbb@hugovil.com>
X-ClientProxiedBy: PH7P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c500a9-1d37-40c1-5135-08de79395150
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 0Tj03s5cjF7hwyMLIYi00x7kddsr803ghuXJWNPLbtybmWPwjQ+9S30Wo2cKlbG37781onEM7s+H/n+PYsSG6ujW0FwrLX6TYIVw8HGE95nO93+SIRKiCTpctHoGPQIaqQumBpPTjxxSeLDWdQ7YkI6yUIjlrP9i0gx1yduOKzmpVseP0trINTaTz15bZ2TYy/d8iSaE+L/0153B57wsmwQZsr8OV0isb1E2VmhHaBDfp7WBIHHHlkW0ehLfsuAtzY2/JcBdRXl6AhmvNteJ184bmqRRIfT4OOduge59PyBYoBa8mdqLpE++X3LGkWdFgFz/TwpSLs+keQJD+y7knqqACYMJU3LCsNsCbKyTi8FXK41fvb+dWpiHUfEbwJ6JufTOQyO2nxaukJT1E9qY8vTcQS02GeJXRjbymVTwWcYqBjS4Uq69iiWOdaqHC0wgWjcWWqb+1BOyQC5qspnC5iCuiEdhgrjakSC4kss29X9TqDDJ4Qp63fLfwbQ5v7aHSPckYlfcd5ajaEOjTP+IrQ5ssowiKhascSD24R8ggJFa/oLDdD0Z3OMcdxgY5BNqSiTiYg1qmwwMIv0RAO04dhydsyjWcza6jK/3awp4l6gL708blTzUSEZ8WsVAI85/H8gq9v17v9Rcy6N7rsfq6KefCOhg5rfO1Jc5kznHdtSnrXnPNF1oLC8Gfucgw8hvWHF27AiPS8DLxw0iBf1c5NJp1TVoxeLVjWY4/9K0AIHLy9ZetzX3vtWeaVoTwKCvpG3DwMplIal/hSeJ2ojYhn5NGWwQJj3SmXVmTynM6Yo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OTDDmrFvSMPslYvo5ql1ng7ljjV3BmhTmo0GWCsCIYSV3zL+/T0LSeHDcKNJ?=
 =?us-ascii?Q?jQVmPCoKY1878hOQOiORcLlQ0EGSpbbov6nfvmiVSYEOwYWKim77BtXis/y2?=
 =?us-ascii?Q?1VBobQR+l5vy2kWpcgpLMAJXj7LYRLLn9S8T1WbJIb88qPBqiYgOprc1vI+e?=
 =?us-ascii?Q?Q3/My+UYOzAGHMCBkJdLzukfOT/UbsPJWwKU8Pjo7IZ8Yu8DlGeG8FngVgY3?=
 =?us-ascii?Q?XfpUEO8Iya3CzrsjPgBIM7WjHxfackdtrccVXI/T/iZKIqXxgd4fIqxjp4Y+?=
 =?us-ascii?Q?vxX2Y9eOa2uxdWZOgiiRKGVwpKCkhKDcF9UkXuJom56XAH7h/r1Jny2ej0Nz?=
 =?us-ascii?Q?S+oxOgLlnQx6Sqk/gRRJqDfqB4VY/eO45fQLkTL+Dg+zBDx8N5EEGerdelui?=
 =?us-ascii?Q?+fxSzoMfpNWkC9LLr+vBKGvUpSxDBcHlJc49EboJGhufE7eYuI+mctfwuDNx?=
 =?us-ascii?Q?0HrYq1XrOv4yOAfDawiWIikQt3MQtion0cgL6QylcpwwnhhjDnFPTUsPa+b8?=
 =?us-ascii?Q?BHoYATMPlrVX5VoFVIyZcyVaLWOox54RcMZe/3rml2wo3pyx5BJhN8u5TpD0?=
 =?us-ascii?Q?R7/DU86i8nesXeJo+1NBekPgBpsiujsH1Hv+6M2UT2X5JjLyyexLMHs8M4XA?=
 =?us-ascii?Q?ZsMvTOSdlnMz0yGGQjaCQshYS7khLShbfMt5qAgYBtKZTRYKm65S0ZfmZyWe?=
 =?us-ascii?Q?JJzIBqmsVNiGagPYUeXbCd+8CQ9TmTBhnRx8Rr9uVs2C7rQq3mbZ0U/ooV8u?=
 =?us-ascii?Q?oMZKFqlWtD+uCfmj6T+rQ/NvJBA4cJ+sUN+1aXzDlYMADSdZPtI/yYBaH9ni?=
 =?us-ascii?Q?xYNXwosSgWfGPqqcJjS1FCovj1loreQoUDCJeSkY5dg5JOQfVf3oX66Tpf+N?=
 =?us-ascii?Q?l/Li3gGp5BcAmdv6kyjxCFs64HemC6CE7GbMpfHbRDI+9fRNi6SCLCKYY5fO?=
 =?us-ascii?Q?fH2GoCtQPXcFDddyyYOsSL8iOtjK/ojhuyoW579yJTHqAXCElSJRObotRBCa?=
 =?us-ascii?Q?1o4ybTYtufXVRfXViSoXMgBrvaC5auHSdLSM0nHR9i+e7aMqosYzzdA2fJ2Y?=
 =?us-ascii?Q?S8ssrddL4HlMmQofTy6x+KobcDnEkUwM8LS/RB6bAEaVXAgMDmRA0KgMgP7D?=
 =?us-ascii?Q?yBEI0YUIObv3daIWgy6z2iI7s9QaXGjTMKYJCfQ6t7PBAfOhk4UDtLGE4FVn?=
 =?us-ascii?Q?INWAkA4QcuYwoP9XB7XSTob0fI03BjzFYNL5NWU4fz6mb2To3LeCvOdZrg7n?=
 =?us-ascii?Q?Bwb5E8zvObE0hl2yp0ayQ21sydnVpHnq1vqidgdTaLDfldS4cd9vkTV0+9d8?=
 =?us-ascii?Q?qqZtDd5Tmn9nDuM6CgEhucil1up19HYbbdbr1BBSEVpZNBbRkE23ORt2eQ/S?=
 =?us-ascii?Q?//yUAyJpmUXFlK4oBB0DQHqpo7bF9LM8PtyqgkRGuDTyT3ohnaxiHxvWlcsQ?=
 =?us-ascii?Q?ywE+ZuaqcXYqhQGA2bESgGoXE+wGr2vrOXRoe8A/obLsMu+ZoKBXdRxXlndO?=
 =?us-ascii?Q?OBYz35DVE6/9R4T+Z14C9QBdj5KzKA6konTbJNIMQdftDe2gJrg9Kpgb8Rn5?=
 =?us-ascii?Q?vDEFpkSGl0PzGdW2g5IcrPjjY1XKxZNxF66ic6tKNu/zEW2uanUMFbzEt1Ua?=
 =?us-ascii?Q?nCD0COSU5WMKtUQksBUuGaCwavggRUpFABUEkMcsKfXlrHKNt7qJ4k2MqCyR?=
 =?us-ascii?Q?XCkjQM7GuQGdzF6kSm2wBz8yVilD3I7tdYiyTNx8mI7VS/XD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c500a9-1d37-40c1-5135-08de79395150
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:27:02.0673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUbeEGn8MyVrAiRVxhETgwwOjxkhvATJWymtZ3vYNFq6ATQM/JU6NTpRfFVW0HicDURVdUdfth1B0UABz2Uhbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8031
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 8C7B01F296D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hugo@hugovil.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[4.196.180.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.1:email,dimonoff.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:42:31PM -0500, Hugo Villeneuve wrote:
> On Mon, 2 Mar 2026 15:59:43 -0500
> Frank Li <Frank.li@nxp.com> wrote:
>
> > On Mon, Mar 02, 2026 at 02:03:45PM -0500, Hugo Villeneuve wrote:
> > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > >
> > > The existing configuration of the optional Wifi/Bluetooth module was
> > > copied from the original Variscite kernel tree, and requires custom
> > > scripts to properly configure the Wifi/Bluetooth module.
> > >
> > > Add proper support for the optional Wifi and Bluetooth configuration on
> > > VAR-SOM-6UL so that it works out of the box, without any custom scripts.
> > >
> > > The SD card interface cannot be used if the Wifi/BT module is in use.
> >
> > ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
>
> This looks identical to the initial commit message?

Yes, sorry, My means needn't unrelated stuff. use below sentence should be
enough.

Frank
>
> > Add the optional Wifi and Bluetooth dtb on AR-SOM-6UL so that it works out
> > of the box.
>
> See comments below about name of dtb.
>
>
> > The SD card interface cannot be used if the Wifi/BT module is in use.
> >
> >
> > >
> > > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/Makefile            |  2 +
> > >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 18 ++---
> > >  .../nxp/imx/imx6ul-var-som-concerto-full.dts  | 18 +++++
> > >  .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi | 75 +++++++++++++++++++
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 15 ++++
> > >  .../nxp/imx/imx6ull-var-som-concerto-full.dts | 18 +++++
> > >  .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi | 15 ++++
> > >  7 files changed, 151 insertions(+), 10 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> > > index bc534d0fb1412..c7f24ee63071f 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > > @@ -339,6 +339,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> > >  	imx6ul-tx6ul-0011.dtb \
> > >  	imx6ul-tx6ul-mainboard.dtb \
> > >  	imx6ul-var-som-concerto.dtb \
> > > +	imx6ul-var-som-concerto-full.dtb \
> >
> > how about imx6ul-var-som-concerto-wifi.dtb?
>
> There is an exponential number of possible configurations (sd + wifi,
> eemc + wifi, eemc + eth and no wifi, etc). To simplify, I am simply
> adding a full DTB which will support all options on the EVK.
>
> Hugo.
>
>
> > >  	imx6ull-14x14-evk.dtb \
> > >  	imx6ull-colibri-aster.dtb \
> > >  	imx6ull-colibri-emmc-aster.dtb \
> > > @@ -377,6 +378,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> > >  	imx6ull-tqma6ull2-mba6ulx.dtb \
> > >  	imx6ull-tqma6ull2l-mba6ulx.dtb \
> > >  	imx6ull-var-som-concerto.dtb \
> > > +	imx6ull-var-som-concerto-full.dtb \
> > >  	imx6ull-uti260b.dtb \
> > >  	imx6ulz-14x14-evk.dtb \
> > >  	imx6ulz-bsh-smm-m2.dtb
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > index dd4ecff1eb786..af8c5d2db53d4 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > @@ -19,6 +19,14 @@ memory@80000000 {
> > >  		reg = <0x80000000 0x20000000>;
> > >  	};
> > >
> > > +	reg_3p3v: regulator-3p3v {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "3P3V";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > >  	reg_gpio_dvfs: reg-gpio-dvfs {
> > >  		compatible = "regulator-gpio";
> > >  		regulator-min-microvolt = <1300000>;
> > > @@ -68,9 +76,6 @@ ethphy0: ethernet-phy@1 {
> > >  };
> > >
> > >  &iomuxc {
> > > -	pinctrl-names = "default";
> > > -	pinctrl-0 = <&pinctrl_hog>;
> > > -
> > >  	pinctrl_enet1: enet1grp {
> > >  		fsl,pins = <
> > >  			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> > > @@ -97,13 +102,6 @@ MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> > >  		>;
> > >  	};
> > >
> > > -	pinctrl_hog: hoggrp {
> > > -		fsl,pins = <
> > > -			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
> > > -			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> > > -		>;
> > > -	};
> > > -
> > >  	pinctrl_i2c1: i2c1grp {
> > >  		fsl,pins = <
> > >  			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > > new file mode 100644
> > > index 0000000000000..519250b31db24
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > > @@ -0,0 +1,18 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > + * Variscite SoM mounted on it (6UL CPU variant).
> > > + *
> > > + * Copyright 2026 Dimonoff
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "imx6ul-var-som.dtsi"
> > > +#include "imx6ul-var-som-concerto-common.dtsi"
> > > +#include "imx6ul-var-som-wifi.dtsi"
> > > +
> > > +/ {
> > > +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > > +	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > > +};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > > new file mode 100644
> > > index 0000000000000..6d16ff7909dab
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > > @@ -0,0 +1,75 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Support optional Wifi/Bluetooth on Variscite VAR-SOM-6UL module.
> > > + *
> > > + * Copyright 2019-2024 Variscite Ltd.
> > > + * Copyright 2026 Dimonoff
> > > + */
> > > +
> > > +/ {
> > > +	reg_sd1_vmmc: regulator_sd1_vmmc {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "VMMC1";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +		startup-delay-us = <10000>;
> > > +	};
> > > +
> > > +	usdhc1_pwrseq: usdhc1-pwrseq {
> > > +		compatible = "mmc-pwrseq-simple";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_brcm_wifi>;
> > > +		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> > > +	};
> > > +};
> > > +
> > > +&iomuxc {
> > > +	pinctrl_32k_clk: 32kclkgrp {
> > > +		/*
> > > +		 * For TP option, an additional oscillator is assembled on the
> > > +		 * SOM to provide 32 kHz to the WiFi module. Without TP option,
> > > +		 * this pin is configured to provide the 32 KHz clock to the
> > > +		 * WiFi module.
> > > +		 */
> > > +		fsl,pins = <
> > > +			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
> > > +		>;
> > > +	};
> > > +};
> > > +
> > > +&tsc {
> > > +	status = "disabled";
> > > +};
> > > +
> > > +/* Bluetooth UART */
> > > +&uart2 {
> > > +	bluetooth {
> > > +		compatible = "brcm,bcm43438-bt";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_brcm_bt>;
> > > +		shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > > +		vbat-supply = <&reg_3p3v>;
> > > +		vddio-supply = <&reg_3p3v>;
> > > +	};
> > > +};
> > > +
> > > +&usdhc1 {
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
> > > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
> > > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
> > > +	no-1-8-v;
> > > +	non-removable;
> > > +	mmc-pwrseq = <&usdhc1_pwrseq>;
> > > +	vmmc-supply = <&reg_sd1_vmmc>;
> > > +	status = "okay";
> > > +
> > > +	brcmf: wifi@1 {
> > > +		compatible = "brcm,bcm4329-fmac"; /* LWB option: Sterling LWB5 */
> > > +		reg = <1>;
> > > +	};
> > > +};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > > index 35a0c0b3603fd..b4e6a9316dd81 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > > @@ -15,3 +15,18 @@ / {
> > >  	model = "Variscite VAR-SOM-6UL module";
> > >  	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
> > >  };
> > > +
> > > +&iomuxc {
> > > +	pinctrl_brcm_bt: brcm-bt-grp {
> > > +		fsl,pins = <
> > > +			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_brcm_wifi: brcm-wifi-grp {
> > > +		fsl,pins = <
> > > +			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> > > +			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> > > +		>;
> > > +	};
> > > +};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > > new file mode 100644
> > > index 0000000000000..7c0e313603630
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > > @@ -0,0 +1,18 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > + * Variscite SoM mounted on it (6ULL CPU variant).
> > > + *
> > > + * Copyright 2026 Dimonoff
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "imx6ull-var-som.dtsi"
> > > +#include "imx6ul-var-som-concerto-common.dtsi"
> > > +#include "imx6ul-var-som-wifi.dtsi"
> > > +
> > > +/ {
> > > +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > > +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> > > +};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > > index ba482a97623b2..3067ff6a1bc74 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > > @@ -13,3 +13,18 @@ / {
> > >  	model = "Variscite VAR-SOM-6UL module";
> > >  	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
> > >  };
> > > +
> > > +&iomuxc {
> > > +	pinctrl_brcm_bt: brcm-bt-grp {
> > > +		fsl,pins = <
> > > +			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_brcm_wifi: brcm-wifi-grp {
> > > +		fsl,pins = <
> > > +			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> > > +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> > > +		>;
> > > +	};
> > > +};
> > > --
> > > 2.47.3
> > >
> >
>
>
> --
> Hugo Villeneuve
