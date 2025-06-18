Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7FADE348
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BB810E391;
	Wed, 18 Jun 2025 05:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RIapu7Sk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DAF10E391
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 05:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJt0L6rtLIIBevJ8yG/sDSa2Gb4G4DNgi+a3hGKR4fUyOVqsea2wBdRmOlDHU+yxSQcY6yXsMvWot4c6km1DPnxKUbZ85bSbSTM5tcKoYni1iijnXVBbZ9bbfqPOp4qmsyL4AeuP+IwgnIoR6WCqWh8cRo10+D/4QPdmkFWYcVNIHftfJZ2FrqJcqAnzjkd7ljxYxpskHmGHNQDv3yJAVtdbBjC2auMStvZ7zT+xr7bUkvDPTHKQ0tOofZnyeupSVx/Bk0TYajDW0V8eG8fpBstpCU5TttfwjWQ5qc6+jdB3yza3vGw7v4TkDz42z2dr4cFstzq0qIxvUMV351SnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3gjqESIb0hfedvJANNVJM6LEBHkMS4KZbAbvdEAaLA=;
 b=hu8d2/TvhRT2c84jW2NZ1uL1K9Ct6gH2/bmZ4vcqUkcq2aoZP86lRAunxOx5yiErYFKEiXH2W+c74dtTC/1xbPY2MCv6DLEdpkrpy3tPF2vy3l1CFqZpHh8O2NVt08N3MStmnlhAwK+/6JOS22IYPjMTbtEafQGQCyKPNdAS+YjmtLd5dIJ6whmHJo5ewIiIc7MZdiSaxiP6tve14CcaEiipElpPWmpyjkxq2z0x+w9IkmlKuPdyj9Lv17NxtoU/3U/07UQwTw8xLEjwR3kwVkbyOV/JSPCGpMpWP/5ZmTngSgKizMO1qkAAxXOF5Yg1YiaLCUXQfhmSOij1LO/l3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3gjqESIb0hfedvJANNVJM6LEBHkMS4KZbAbvdEAaLA=;
 b=RIapu7SkBg9a9uysjAWGwx6uZBqDPvJDqr3DxZRoSc+zGOAi2NqlvAel+DsJRiSI9SNiw8/vlAhB2PFrEXZ4WWp9dRdqMrCKhKOOZ9NarP33mK2S5kZM3Lynk933a5PemqQfVwtP0DWXc8RHpkdJCC07DTasquiRdWpreAZ+C43SMuBEqmb6hzr1pmDOM5OT1SbP2gxRM9IosHmTH5h4lwRoOyUWHc4Qj0psLBowW0CvC0kEQz6yjlFDauzj2Bdqy6L2QEhdvgJtqJEpHrFwonF/wysQww1+3PJ+OY2pwfUqYSbgszMX5a1akV4nKZ9x8q53cgQVnHz9ceW7OHL/xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9267.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 05:55:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 05:55:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH] drm/vblank: Fix vbl time for IRQ fired at the end of display
 active region
Date: Wed, 18 Jun 2025 13:56:03 +0800
Message-Id: <20250618055603.2644430-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: f71823a4-db63-4857-1191-08ddae2cb07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fB4t8N4i+M9mVZEYBnrbquTwA2Tf/UZDflvldlIsx9G6C6+3MBW7B50/ZWv7?=
 =?us-ascii?Q?uJ4DXqIIw9CKM40nxIyLB8laxrAaKi35iA+sqVb6dIEFfiFprA785UJrfaK5?=
 =?us-ascii?Q?JiJmIAAQYnyxWM9Y4IFUii+X8FVD4ozrwd+XT2y18+A0raSYs+r/mEMSPrhH?=
 =?us-ascii?Q?o/gop/F9alb5pLfhnlbMhEeLV9qFtqDanm0QgtBGHsLdFdcXsRLCQmrTb4qo?=
 =?us-ascii?Q?xXMwyzKwLLvH5i8tLwtx+H4HB6GnI9JNM6SRrfjHAF526zzxL2JOjg18bAIu?=
 =?us-ascii?Q?pdwbZqY7LrTd3dHHo0pEjWB3I94BS0TEUUCwyUbIbjG0UDguDay9TE+T1gNJ?=
 =?us-ascii?Q?VaLqURoMJIAC/p5jgcOsXSiaWemJZ/5XCj6J46Ll0aCDeDLwp1fO8aMqzPcR?=
 =?us-ascii?Q?KSH0xotlgALNcVhhYo2H72AoSgzdP4hBjtC7dNB8UbTF/A0Q034sq0PJhX06?=
 =?us-ascii?Q?f3/YY9+GnUfiocF8Ty5xjDP4ygSOE6fnqb3UpNZmYoXFPVc0SBraByPnONh1?=
 =?us-ascii?Q?NgB3i53ys4hOiyTl7WIRymGMOSjXBzoPpQYToEXLX/rgB0sJf2TOk2Y5QhKS?=
 =?us-ascii?Q?UaG3O7yzUkztzzqhm/y0G0ceKlDtZt0VuS7QstGglsdTJsAj46aEjUU3Acjh?=
 =?us-ascii?Q?zDKwhfv+wcxg5HX6V3+VT+TN0op9D5uFJ0tDuo10PIWOtX/YC8w8OJEYax+c?=
 =?us-ascii?Q?CJ7bMRAQQ9+SuhhpbI9ROeTd2ZstLEv+bezu1CqZTZqQUHbyZrQ4f51GxU1S?=
 =?us-ascii?Q?vIaZGXlqAMucjKfoU5daa/DdWCKMPRjAVXctRGFC8Kilr4+nlaEqhV0QToek?=
 =?us-ascii?Q?HB6sek/0pkapWdyNBxHLaGOVYI2UeDKbYKAr3CZz7hcnwAmKPzJGW9/93nEz?=
 =?us-ascii?Q?BxGWlbEJJOyjViIBE6zBeiCwbo5HMupCKyF9uJLVb2AttEmyt5yX1KCnrK4r?=
 =?us-ascii?Q?yGedcP/1Xw4wjaUKhiwbGjuHeC5R6IDZA8UhWGwO9lauryRn+0xb9xvYWzYi?=
 =?us-ascii?Q?M87TqlxIiIt3gB7+b2+n2U6Dgu5075HT2QTzlelwCSRXzbQEcYuUuiYa0O9C?=
 =?us-ascii?Q?sFzCtLgmaQ6/jh9RQ2KAypXDuZGYLX+b7Ufgg5sjZhcFA81FWLRk2IccDqM/?=
 =?us-ascii?Q?CQ53QltD/1Z8IotCjscYKfwONnC80MIV1lhzr4S2K2dtz6Nd/7W6wuPFkIap?=
 =?us-ascii?Q?xBx7BzJ9uFoFpq7sZBvQ0g/50ct/qmEgQmK5R/HQeTQoI2Py5dm66Rpx96KJ?=
 =?us-ascii?Q?M5sRAlItHsMsqXlpmyOmraEZDX4FJHibWmHklMTAfvyIRQYCE8M7eYPy2xiQ?=
 =?us-ascii?Q?1lZtruYcdeSlfGv7ihyT3q7z/EOWIkmru5g6SyWdqrmxVXVPATUOJyHlEwv4?=
 =?us-ascii?Q?2PaEa1cydJLkt0JaWlr/RbiL78PB5WC2wBypw8cEG8TYeM1i95N1tJ5KWOsB?=
 =?us-ascii?Q?HZ6SrXyp/cHb9YdBgpad9qfVeVgCtG17WbNKvUmHfEoEqO5DnTozGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ys2Xx9UlxLveh/6wsnEybLtp1Y3FMtSUaQmmSuVVMczNtVgRrwgRK5P3I/ZA?=
 =?us-ascii?Q?mP+MSTOcNPxBUIyrvwfIW+W+auWf/bJHRVyo/D88vLqaKc+ORHjEi/+IxZjV?=
 =?us-ascii?Q?bY4wWmVlWe85Bogh1H9Z0vycKGusA5RtMISbG4qFhZmhYBOw/M8BS4a+16ud?=
 =?us-ascii?Q?+GK5fSb6V4mvFFWL8yP7nJmSOOfQcikxQwM4cy50HkPMAXTdH+CBTELXmPIQ?=
 =?us-ascii?Q?0CvPFXo3bRneZGUuQHoPR/dKTThEtHoohTZMa2r5KVbr3eMPGRcAff9tB4Gj?=
 =?us-ascii?Q?DPwuiVHTYL3qUOBr0qk0eKg7reW0wMsvm0DDfYLIH5KZgvEDBOfiMFmdyY15?=
 =?us-ascii?Q?Txl5OdHx7lQyrH2Hjr8AAsEf2jLCWIB4v62ETvkwTNhfN1puh0hlPIJgoTXI?=
 =?us-ascii?Q?K5aRmdv0/To4evf6cXWQzDy/LqQGpI/ku0M1dGZrfz+SPLqBkzGFl0OWjbxP?=
 =?us-ascii?Q?+Gi5cS+zZOFr96xgDRdMQ48Agyc2qFIK+80kx5trW+t5pWKlqjHb0QMAopWX?=
 =?us-ascii?Q?dJS8qfHiEJOFJLH+Vg45ctfevn9EEqOBwxXuz7WpydTrTseRaG4z5Qc0pn3q?=
 =?us-ascii?Q?wcBZ0ps0Unh+/M/dSCpi0GbtF0klQBH3A7B0NS/kHHNhJ6W1XlZ16y2dQH3F?=
 =?us-ascii?Q?nr7ewGXq0Uz0IMZrn5CZY8SXV2gLvFr8I2KHLMOKn621njXrmR/FVXsj8eSG?=
 =?us-ascii?Q?6ytGj8ygeWDjO7CpPV9MdO/RjOPArOvFBMPvpw+xwf605rG9g/LM9XISiFkj?=
 =?us-ascii?Q?yLu1cPCl4KtKVlmjjOtGpwlDWznpOSa/chZcugNmR0+UEV4uJgaCOLZRmKg0?=
 =?us-ascii?Q?7ISLmMKfc6mVrfkc6qGVhATnVAnBG2dIhYbTo8ep11gJNKVzgdjUGMFJ49dL?=
 =?us-ascii?Q?Otez01ncGHu1JlV4Fb4ehzR+L3OdNsNAnOjIpYjUxsaoB3y6M0IrwFDvXZsL?=
 =?us-ascii?Q?fMoDaR4/eMl51LE5HgrfcY/tzQsmzDn5CrW+zRrmuVMGT/ziCFAzCtm74e2K?=
 =?us-ascii?Q?GJl6QMMSCkBQ4D9ytHCRyJKmdX84xu09/v8p/lLkrKV1uCch9+IXZL/uKyqN?=
 =?us-ascii?Q?iJLAD/XFoy+OmfdoM9UH6Khx4esfh7WMrqLz4JsHv5gs7XyFIXS+UakB4OCW?=
 =?us-ascii?Q?BIWeXiJ3tkZ748EuYHkeXmW/OeFfrI5RmEIJVWcAlFsEM2aM4T2MEmhXF2EK?=
 =?us-ascii?Q?oTr+J0oepqKYZ8HzVmi7qGscI00sib+a2s0eskDseR3nLKefbRvkZgD3526q?=
 =?us-ascii?Q?7cYKbgphUfj0ZYOy7Ck8PqgvC1UAFnyjrKWFZ/QP1FmaurlmovepTw5UhKq2?=
 =?us-ascii?Q?pl9c8oX8QDzJ1RFbphLYp+kqDY7v4LEHs2XMbp8QMP9qjUOfOv8aUZvkEpuE?=
 =?us-ascii?Q?TvcNSUxFjyHOGn/FhRdgE8JvVTtVd2kFkemL6niSnEZ7yyY9aUFuK+hSUyxa?=
 =?us-ascii?Q?4i6sFH504dYIsnuKlzpf8zy1EsfPXiSu41mPkiAQiPBGga3yKRox8ij3yTqf?=
 =?us-ascii?Q?R1ehLC7TjBQp98MEiOPilh2qkTavxGP94GuIpssgW1pj4TZZkCdv0ZaFdnjE?=
 =?us-ascii?Q?aSjoM4WB9i7n7MBQ/NU/50x6w7yfGW7iZ4EgQ+Kw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71823a4-db63-4857-1191-08ddae2cb07e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 05:55:12.4465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25h9FJmcjFcmA3D1UIBJh+j7F4tWcoDjp/3sLjVpC8unSuSC9nJ9BuLt8VWEyiz609bhSX5FPl02Ea2yFTiSug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9267
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

Helper drm_crtc_vblank_helper_get_vblank_timestamp_internal() aims to
return the timestamp for end of vblank from the vblank_time pointer.
For vblank interrupt fired at the end of vblank, it's fine to subtract
time delta(as a positive value) according to scanout position from
etime to get the timestamp.  However, for vblank interrupt fired at
the end of display active region, the read-out scanout position could
be at the horizontal blank region of the last display active line,
which causes the calculated timestamp to be one frame eariler.  To fix
this, subtract the time duration of an entire frame from the time delta
for the problematic case so that the final timestamp moves forward for
one frame.

This fixes weston assertion on backward timestamp when comparing
timestamps for consecutive frames.  The issue can be seen with a display
controller which fires off vblank interrupt at the end of display active
region.  The display controller driver is not yet upstreamed though.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/drm_vblank.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..c228d327bf17 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -782,6 +782,15 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	delta_ns = div_s64(1000000LL * (vpos * mode->crtc_htotal + hpos),
 			   mode->crtc_clock);
 
+	/*
+	 * For vblank interrupt fired off at the end of display active region,
+	 * subtract time duration of an entire frame if vpos happens to be the
+	 * display active lines(hpos is in the horizontal blank region).
+	 */
+	if (in_vblank_irq && vpos == mode->crtc_vdisplay)
+		delta_ns -= div_u64(1000000LL * mode->crtc_htotal * mode->crtc_vtotal,
+				    mode->crtc_clock);
+
 	/* Subtract time delta from raw timestamp to get final
 	 * vblank_time timestamp for end of vblank.
 	 */
-- 
2.34.1

