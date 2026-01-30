Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK7yLeBHfGkSLwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 06:55:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14FB782C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 06:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8077010E903;
	Fri, 30 Jan 2026 05:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Mv1C5Jzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914AA10E908
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 05:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyTUQSpNuyg6eeB2Z4jI1EBgkulvTRB4ujwN1QQ10hWkpFDuY2qt0W4mK3om5A9s6f2kLyEaSHhzsd83puHtTQES+jdsyRjwq7H6Wsv/FPlCu69rpQTn6SVt7ImDiMtd0lMowchTiJfceGv1cAeh88UeHuy3wO8aEuTw/8Om99rk6B9oCxHhJ/Zp+j8HFe0Bvh8ItP5IpblReVUr2cZTF3kD/t5ftMBytI9upHjtQ3Ws1CDCer4TV9LbMz4Om0yejF2ZZISW6AhPDdoZE29NcJRFX9WyqYQqxda4tGrHbR+rzwHuapneRMeUPnKIlhel7qvlHlukUZ95sbFxoVLqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM8tQ+K4wGRJuxPKhSlT6YdGHmuCUgEA8I0NmacpuvU=;
 b=o3ee/Bn3Aln/lemFlaK+0AKifP9qgkgSvZ2kYeRxfA5Cti23ojlrHm7oyGh3wVb3jwRZV8yi6tadUhjxek8WGWIvkIaTKWyuuzAJiJLHyaIyzZnvQ2VpiRdlPegBz6+Cp2Wi9bjFUK8Hn8SPfeYR3hxIFUfY4LhqwQN2+Qzl3xlMgRJUdkeWu0VgtzH7nd2Dwh5UkT4i1RXd/Envlz2bAURR6a4sS8eWJIYbIHi3rV2YkhahUsCG4Emm+eHqsL2kyXlsz/JqmcL0sBq+qqZpPfKpe93PnGL2BYhDebSe20HHmr9qjKq2MCn3mHvjR/NteGjpx4aow3afWXxcKfsqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM8tQ+K4wGRJuxPKhSlT6YdGHmuCUgEA8I0NmacpuvU=;
 b=Mv1C5JzmN8bbKhYCHvSvA+tlyKQYAxzj4Nxx7hHV23wQeSpxX0DEZ1fnReJh9cFREV84mof4VBkeHoHdX+ToHyxS74RxJGX8Sgp7yfuSO4xiHfxvPJb6j9qY/e8wT4gEAqnBG1O4JxAayE8QYAITGRrku6VAwiJFLWj/pZK0CZ3Xg9XRQdKZBHFSDgIcNbGxJikMG+JjOQBkEO22unXJ79HaJe/Qp9eZVTmeZxyMB02IIbfxIpZm+qBw9Hpry+Xs5mNDo11tjxYNK4kS3zNdStRzWrlltLrh6aPKFqQGEvCjmEHsW/CsQtoXjz/yijWb9AcjjuLvLKCmd+RqrvpZew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 05:55:35 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:55:35 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
Date: Fri, 30 Jan 2026 13:55:08 +0800
Message-Id: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: e6eb5eb0-1e1c-4274-d9ac-08de5fc42f87
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vN/+4aYpii0QTPV7ET7dS5/8Rmcb4FZFNwK9/7fKSJCso9O60sAgeX1Wi+VK?=
 =?us-ascii?Q?mPrAvAsCcP5gaPbseUrbRTzdDlTBxp8k7Ek4CbXuPkFBCB4vr8K8DLLZyHWU?=
 =?us-ascii?Q?o6fbBNv1+fq/4XjDrhUopBKJ8Exdq5bCk1G+Bs4YB2vPm6j/Nv9DQl5jZa7U?=
 =?us-ascii?Q?CjVNf2vq+lGhPlJLi70aXCTv5V89sP8hhUeklSswP9xVKMccA6wFw+Wm3PRm?=
 =?us-ascii?Q?LeUpjtDZY5tTFrgjDy3tEN7VZQfOP4pFGzJl07xXh2z5jYEf23XfdmCmour3?=
 =?us-ascii?Q?LL3sjPsoNh+AeDht/92MIqk+K3WsJx0AiT5PZpJLmLhwDcLt+Qay9DqTudw7?=
 =?us-ascii?Q?AsNHuVfwPjFsD2soVjmRKmEQ7ly50ISeUrB2Ah4wE8t9Mc744HMcw9wiiPuW?=
 =?us-ascii?Q?YolKwVPHea+PkbEmWwQVDuBj0qnMI5R4baF6bHObrZsFHzOf4z9//zBagwfa?=
 =?us-ascii?Q?+2yXkXgIMQWfB/q0Uz5mHnGh7LQaiwuzAtAO/he6+bSw3CzzdELyCj6aU76u?=
 =?us-ascii?Q?CX2omK6By10x/rLXtCegkwG9Gw1uXhbPs/v0MZTQHQhmxRspi6gxD5hFdQ/K?=
 =?us-ascii?Q?7fgWYFXtcX7L8k28sBv2L/05onD6RDmANqIu2+T/br9vSpVKobaR90QziyBD?=
 =?us-ascii?Q?G6KgVqZamYS1gKFRdlocz3paM6st//jQ9/8bIl5Rh0upj0MJFIVVp6Id3ljF?=
 =?us-ascii?Q?S59o/hRp0EtKvGzgM/Igqh8aI+gHSfrKwwIxywgZaKcqkPxXxQTxf3y6KssT?=
 =?us-ascii?Q?iXXkZefbe5e995PNxklvfmO0kGIRsqBuVDIVyOOkNiqgr/N1iSCWmFmEDDlL?=
 =?us-ascii?Q?bhyaZWyEjoK2Q5T0EGsk8j7FF3/K7GQiUqX3n+WM2WrmYXBW5Se4MVbdPsMm?=
 =?us-ascii?Q?n+VVUZBhLits/APhn3259D+O0UxiBvfkagkRndH1N243ThC6TL2nJDmk2+Be?=
 =?us-ascii?Q?+4kRpc/NgQgGvE6ewDO6xIH/nYU+tj9e9EyHwuZsU10Ii/8dnWYmG/CPngFy?=
 =?us-ascii?Q?/vZ2e1cHUjvn9ZqINTzHTjxB3C770FN4FIpGOAwItMHsoLHHyWz+IC5M0CcZ?=
 =?us-ascii?Q?tJXZDSO4+OCRYkv2tbedkVt+ZjQxFf7p4IX7tF5sbLrX2UOuPT8L75Wbz3Za?=
 =?us-ascii?Q?RQI729aOhPOElWxS3EiYPmyP27hAdAvyoLEBSkNdjJpvPRXZtuNhWCKkgrYo?=
 =?us-ascii?Q?ynpCCZZ+YleUY+qntP+T7QX+xXEZwgknljCKvLdOuyej31GZQO128SeRlvlD?=
 =?us-ascii?Q?txaEa0p1AckgUIFlUAMks5mTiHt2OkB2Ndqr6RX5NcSKBmI+qjyKPoSoeoK3?=
 =?us-ascii?Q?BANWBZb0Hngkhkrlc709bCbr/wXuPdadIbXzHLoZKpV3+Do3Go3wFDs5WPa3?=
 =?us-ascii?Q?3STmzHjdW8W/pfH0CnYPhOfKDemwjv3oap+HLI0x+f+/YSPFLkdVTo+2bWgp?=
 =?us-ascii?Q?jKDA4xGledcs7Trcp2+EPveUMglo9a0Z1NGYklLUu592fRx+XprZhZ5qIfwp?=
 =?us-ascii?Q?isUB7uUyK2Pqga8+y/HcmXkPNcR+lceJQF4Vo7qwSM7pfbaU/23slFJSMc6K?=
 =?us-ascii?Q?kjpDT5k9bd1sLDeA5jyn3lh7C5f8YLDlJfwrDzz3sYEK78YmFTN4R0g/8OV9?=
 =?us-ascii?Q?C92grDSHbwQtFTYJYVthIWM28SVIytkFD09ScWzW6pyr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nn0gIzm1nBn/ts+K071iOmEGZqDh8ok0twF98fFBLZlgMznJNcoGCkfLKGyE?=
 =?us-ascii?Q?cYC+9wHhaiVPYQbFJo5JwHuvPOggk8UIaG0Uv5jKIH0bq1yDKqHJD+/RL0G/?=
 =?us-ascii?Q?Ej9fZC+j4Y6MCwfIOH+KYMm06wg+He68fCQm9DpHZnFrLla9NMDV/9ItFeCo?=
 =?us-ascii?Q?MyaPr7Ui0wm8/KR2W4it8W/JbhlHs4ThMrjh+bdqscLwmAtoEsJYcpQpAMHp?=
 =?us-ascii?Q?oAAJNrp7zFPWo7qBPfRTZdMo0EYy6ncGQwgzKTU8YyCMnzCsLob0o8X9BxH6?=
 =?us-ascii?Q?8lCbqYURoR/oOeWdExkD1aau9g3tWMhXx3TmNuhkd6DHZFzbd7d/s5VV9kPT?=
 =?us-ascii?Q?4ICDtlGAMvkEtYvjto8SlebtjDYHbEYbS9+Hue94tl+qpa1V6IeCzp/Zt+Ij?=
 =?us-ascii?Q?bXutItIIbMJh2j0b48gsN1PPdsYMJYDQddKU5pIjH5GX2Qn5OLFo6fuONHcN?=
 =?us-ascii?Q?K6kQ/DLuLSICzm7y61BB23Ciqsh+dq4PE1hUvdYB89hF2GXSdiF+qdurdEw6?=
 =?us-ascii?Q?ei4A3Wr+VCPHBlKRhphATvO2/M+3t7AsGn7ZlTcmyl0XPEFc/3tMcUGj0xDC?=
 =?us-ascii?Q?Wj400g3+XpuZtwqRAXPpC9Jb9P+QDcDfo6QQfWegWsPpevTFCCzmRuAz2ZoT?=
 =?us-ascii?Q?iSq3bbJdLl4MoLEa+3TZRj5Zvqexyf9QG3SPpcxLNc28BXbSs8GBlfQEGIyY?=
 =?us-ascii?Q?TMzzVgU4ihA8oBfUUdMyYLqCp93oHSOFyIRjSKIr5Oaz8Dafl/43xgRPfDnW?=
 =?us-ascii?Q?e8rFmG5GtTOw3tmpYyzhzBqW5XBZeeLr71F24dRxFIe06VBsulinrlm/mpdi?=
 =?us-ascii?Q?XuLrJsj+PD/USeg18QXJk8RBDptQvOdWdsEWJslQe7A06/0b1bbGGPzzmqnU?=
 =?us-ascii?Q?0Z9RZ430zQ/ppIljJConOMVMeZJeBhWHTD0V9sS3K7EoJBcNFiqq5VrswGkC?=
 =?us-ascii?Q?lOBmt6DvJIkBtXatSsTlyhW8bcsEQEHTW5bo8WNr0pKui+SDXEMEIgJV2ov5?=
 =?us-ascii?Q?0iX6zgT+WAYdJ1dyPpyFC2L1nC8tpFHQZ76oNQlauDg40SysdN64rgcHRljo?=
 =?us-ascii?Q?tAQEfYS+ydneB6qoppnjRUJ8YQFrxTMLr3LYp0Uck4s3yTTvFBFQYQdsHGSY?=
 =?us-ascii?Q?NbRjo+YEWp+xrDCgzltUY55GCWkL11hGhcU5z+5lEhWE1DLr2xxEGai7umOb?=
 =?us-ascii?Q?XOXePlXrlDRsuYJC+OYDa7EqI4V2AzMRrc8ImSS6NSYTSzVoqbMQpO29nopF?=
 =?us-ascii?Q?CoEqcHoFAWKMYqxY9GGs8WaiNFpz4D/qi4G89TkAvPFUxnkCWCsHLOXUxTe8?=
 =?us-ascii?Q?qBa+4okEfR2AClyoLTwPY9C6R780iPeytUbc5hyO9echelXt8Xe8XL7lmR10?=
 =?us-ascii?Q?r7nOQ62E3MOI+56Y0wOriCI0Mok550pfWnImMYwfE0NB2UMQcKQ0lfDGP58n?=
 =?us-ascii?Q?HSOIIQomHPx1/K3G3ktI3+DE8VThkxgMfjKEj/azyQwY5H/pz9qdLir9eTmO?=
 =?us-ascii?Q?HYBTtzi06BNoGoyl1zueKnRK6/yUekIhZQhZ9KfTaKqeZjWu3N8hiRpX6KFu?=
 =?us-ascii?Q?NwmBzIQ+Nt/+VrTwgZqUwApfH9fL4e5N1q30MurKytSA58xnYVrwAtyhPgNP?=
 =?us-ascii?Q?ljI2DmQ0XLojZoxXmMXLslTI5ij5VYr9VQsVXxwOcEklqp4dZzaJ+MiAFQgW?=
 =?us-ascii?Q?jUjaaTC5/qcV1EfSGXb3R1NUrCcw144dRCbRsY2hTfTXsQZ86wzvaov25fEw?=
 =?us-ascii?Q?G0AEausffg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eb5eb0-1e1c-4274-d9ac-08de5fc42f87
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:55:35.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 324XTcIyRdbAqnuD9PU2pjWoTHrageQqshgS726q20dFJ9eAU+bO3qOwzWkAl/6/XBgQpT+TqTsbVCPuGzmp1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1B14FB782C
X-Rspamd-Action: no action

There is an audio channel shift issue with multi channel case, first run
the channel order is correct, but second run the channel order is shifted.
The recovery method is to reset the pai interface.

The reset can be handled by pm runtime, so add the pm runtime function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
index 8d13a35b206a..1afc729da9b9 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <sound/asoundef.h>
@@ -33,6 +34,7 @@
 
 struct imx8mp_hdmi_pai {
 	struct regmap	*regmap;
+	struct device	*dev;
 };
 
 static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
@@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
 	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
 	int val;
 
+	if (pm_runtime_get_sync(hdmi_pai->dev) < 0)
+		return;
+
 	/* PAI set control extended */
 	val =  WTMK_HIGH(3) | WTMK_LOW(3);
 	val |= NUM_CH(channel);
@@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
 
 	/* Stop PAI */
 	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+
+	pm_runtime_put_sync(hdmi_pai->dev);
 }
 
 static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
@@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
 	struct imx8mp_hdmi_pai *hdmi_pai;
 	struct resource *res;
 	void __iomem *base;
+	int ret;
 
 	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
 	if (!hdmi_pai)
@@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
 	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
 	plat_data->priv_audio = hdmi_pai;
 
+	hdmi_pai->dev = dev;
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable pm runtime: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

