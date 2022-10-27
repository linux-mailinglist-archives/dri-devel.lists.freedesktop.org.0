Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B371360F9DE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D710E642;
	Thu, 27 Oct 2022 13:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366010E642
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 13:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIyhqbwUB4nnoY71NOogF3sloysZVc0TUuzfCZaMC2GJ+A1Yr8ZDthLtFl8HK2v2UwbglhhtRbZuo04E2tLFfVJycYdtTyAluRDBGVtdhzbtIU9lXoODJV0ik6XpWItf53toEujq9UUuy2oHeJOj1JL0AJxJBaapP8ub5qLb6b6+ST8DpRIhIXhCSkSOpWC27QlHDfITI0lkad/lN/OQ6Q11GSeku9qTSquEKBUku1i4B4/hqjWRfnRifdeI8kAC7K5m/JvWuXy+h0wfS53SR6Ha98TyWwYE+p267fKe4dunFSuJVmwF/5AILSuRVwCbjENCi9oy2Q+XpYI5ypFK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqgq5J/a6D2NJ/94eXKOxT4z3HdQk4SVfp5QliBOe3Y=;
 b=St1nyK7f4Eig3hcjwIfT8eqQA/Npr1K+KD5aXaotZzgdIGLFtRjzmP4FNc/SaEx5MFFk0yWUHANESV/9+CpvB5IfD+uvpGRIShW7qq3kfxloDoKwcN0L7auJsxlFmzp1AD33j4Y4yNfwARt14/NwgIbIIW8khZCUQYBWV0YILICJ9RCJN5SJrj0fFQzk9HsISHgfKrIFsl7raoqeunIOV63iauC5aGswkdPuoMa4msdFl+Pq6Vh8ySm+OvVhn8fiA3gz4DxoxKISu02HJp8bBo6r2yiEV6S4+JU+nRgTQnY2sU8nmVdqX9olC5QG6moPxGQWcRC916KnnAW65GkGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqgq5J/a6D2NJ/94eXKOxT4z3HdQk4SVfp5QliBOe3Y=;
 b=U0thMhUM00pVEJHC9yat6BCY5gvnXunkTJ5ploBB9W9BrUjE+Prf368nFxEDckEzEURwPebzIhX6tUOD/hC2Ekl7/eQw30giV6XVngh3OjTGhxwBzCmoIFosOpRPNztSNZ7fp/hHT4/NJMUG6OPIPcWCVozGazGq6JnlF3m7nCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 13:58:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8%3]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 13:58:23 +0000
Message-ID: <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 27 Oct 2022 21:57:42 +0800
In-Reply-To: <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7f64a6-4b92-4bb6-4fbd-08dab8234fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyb7U21+XmoBLiGTn25YxzrJgaqj8KJ99wHB/u+AQN00IhBmvuFEZsxgGbBRhZL8HbxR2LggG4z/OuVbnwR5e5eYPXrVTiRJYv5uOTylp2MSEUTsCddzrtWvgxlLOQL5ZOswhQlOUK2kJBzRG7KpFyojTqWnhuaiN0GX8ACmMUrGyN9o9EoEkyrohJZxDMK8OLi/lT1Z3kD25c+1QeHuxyjkMxuJ6VqKQmKdzZuNkcZ7UooUNNbGav48uLY+fxpfy5WbW455vFgZR/uC8oayCIJdaWMZX2Wqfxt2GLxM850xqllTOY+rKCiZbZWgut3fKjOVS2hJXUcZb0ethuSKX1690Iukt5JyNgBz/epqVihEDSn7T3sMyR98F5+05EIugzmPc6NoOIbdxhP28oWrg3yKXW1k32Wj5NvNQDZ/plNiKlQOAGi2n6SV/wEp/wm3QESqZzFqlRlel7LToUOpADF9YolFpcH6DY7eav224StQqpZgZiWNF6PqbsMA3kHPEdpQz/wWd4Beo2H5GnUBahTmhWN/+AbwKtrwcNxV4UAmuIkAY8PIVW69IaVALXL6Q0YYriou+1aKwHxsJOrDFCJsK0O/Bgapg0zsLBERbHwScixh8y6y5VsBySNj/PtFTWTQiuJVercFZ/r4Q1wu5ehXEYrVjc3/31jpKjOBu/sYR82KPWGLuS61yfRIumv/ggmYTHr0E25kslr3dhi3ugqCSMCNkIprOWWZ55L1PlZxyo5+n9+OWtoWik4+6s/BEf2CGFt6hMynBbj2+/2Wx9xazNS0sSKmv0SqWu4ds3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(2906002)(2616005)(5660300002)(41300700001)(86362001)(38350700002)(38100700002)(4001150100001)(6512007)(83380400001)(8936002)(54906003)(478600001)(66556008)(26005)(6486002)(316002)(52116002)(6666004)(53546011)(4326008)(8676002)(66946007)(186003)(66476007)(6506007)(36756003)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZCeGVqRy84bUFRbFJQZk8zbnZaaUFvK1NjdFNMRERPVmJQcXRpcDhyNG1q?=
 =?utf-8?B?TENaaDFJek5xaTBqUzJEeFVLSG5tY3l0Rkd4R0srNVlreDlTOU1JekViK2xP?=
 =?utf-8?B?TVlBaTR2Rmt3MEp0YkJZazlEYXF4NHhLSEFOZFVlUE1KU1V2a1Qwcnd4KzZ5?=
 =?utf-8?B?TlliK0U5dG5IZXc4MnVFQkJwYWtIRnF4Nm41ay9VaUhSREl4cDFxVXk3NmRX?=
 =?utf-8?B?Z0xQNmVHY0FCNTd0ZC9QMXZkQUNzT210bjZHaFZsK2FpaWUyc2VWZ1JRNElY?=
 =?utf-8?B?UVQxdm5wSDR6QkJkWDEvbXBpVUpOSXRacEJIeXJQT1BURHBPUXVybnRQdkEz?=
 =?utf-8?B?T1JGaXNwUkdSTlBEc0R0YTE3S25zcnp2YjJpTXYyNE5jNGdVMU5zWU1nTnZk?=
 =?utf-8?B?MnplcEFqendkMkxTQjlQejBtem55L29oSTNIYitCOGNjVTI4OHQ4bEhZOUE2?=
 =?utf-8?B?dW5scVZvdXpWc2FQZG50KzI5d1M3SkdyRUNjSldLSDFKUWttZ0VBOXVMaS90?=
 =?utf-8?B?a0pSRkwybExCTEEycEZDdlJ0dHZYcmxOM1lYOUc4NTdVdjJKTFM5aXdnQVZo?=
 =?utf-8?B?eDBBdWxtcEw2QlE3aDV3YnYwVDViOW0wcWRYZ1oySDJzZERmVnpXNTM4dlhs?=
 =?utf-8?B?WlVpam9FWmRUTFM3d2VMMmxSRDAyNXVuRU5QaDR3U0JXTm5zZ2owTmVoSzRu?=
 =?utf-8?B?NGlLbUNURG1YMWoxSzRyOXVvQnhQcUNkSlJFdkdwbERwNU1FV0tBTlZ6Y1JV?=
 =?utf-8?B?bjdXeHlURE9YYXI5ZkhiN2E2eDRJckFRNDc1MU1MckNUdHdhQko2WVo5dWtY?=
 =?utf-8?B?NVQrcU9iMzNWdC9rUWFiOWtrS0ZqNVVlWDdjZ0VnVHg0cSt4YkRSb3ZLb3VG?=
 =?utf-8?B?c3RUSUJzaUlWMVdOOEswTXlOVGZ1dURiUHRyZkFkR2dQQXpiWU1UT2ExRGFV?=
 =?utf-8?B?dTc0eVpYMWxuQWxST3ZMVlNmMlBaVW44a3AzdDJQdVZOVS90bHhvYkFkUVpJ?=
 =?utf-8?B?ZzVNOFg4T1haWURSU3dLMTdwL1YwRnl2dzlBVmg2QVdiZ1RrcXZFcUkvVkhV?=
 =?utf-8?B?R256Yy9jRWVsTHhmVWp5UWgrWitZVlBXYmRXMk80dXJkVmkzL3ArUXovQkEx?=
 =?utf-8?B?cll2dmlhK1ZhdGlwN2pVQlNidkROc3pGcFNHWHFXZG10MGg2L0tjUThLbTZU?=
 =?utf-8?B?bWdIbnJHVTE0dTFzZDRIdWxxNzdZVG5VTzVsNzlkNFpxcDJzR0FRWUkvRmY1?=
 =?utf-8?B?RjhBYXQ5djFvSHVQSE42emptWVNyVzNRMmRrNEdVcXBpOUk5K0N5UUVmMGRi?=
 =?utf-8?B?TERsSUpBYXFKcFUvNzhDTzhJbEE5SkpYTGtZWGorQW1jZ1hua1NrdmdpZnBl?=
 =?utf-8?B?TUllSnBrVVYwMVJWUWwzbGhkVzZNeWNJWWV3QVBqcjA4RWJhZzZ1REY5VkFn?=
 =?utf-8?B?bTMvM0ZYbmgwZll3LzVGNWdDakZVWEgrT1I5VnpDWWxncmxVZHlFcDNSYW1l?=
 =?utf-8?B?SGxRV2FkVGF3NDNUdklCSEdHd0k4ZE1FWGlQNjU0WURtOHNMUXZ0VVJoQVF4?=
 =?utf-8?B?OTVYMlYvemtIcEFZZFhncUM1TkRPcm9IcTR4NGRKTzhlUDExMUFseUZpUmUr?=
 =?utf-8?B?eklGZDJTMVZPd3RySjdibEorNkVSYkcxa0ZzQm5XcXcwK1ZJNDVEZTkyWkls?=
 =?utf-8?B?MEMxT0VXZFQwMCthS3ZkM2hhb2Vyd0Y4eWx5YUcvTkk4WVJOQXBFWFYzVG5G?=
 =?utf-8?B?dW95NGU4SVl0Nlg1N0FWenNpK3pwSXh4TTVQWlB1SW9pa3hhdjlhcEdHYTQy?=
 =?utf-8?B?VkJnamorMk5meXg0SXNUbFF0R1JMVVlJSjY1UG5WY2J0SnhNYVRwa2pQcFFp?=
 =?utf-8?B?V1VLVjZhaThJZjdtbmdWQ3haNzJKRzdubzkxanFaaEYvTUZiOHYxcE1sV1BC?=
 =?utf-8?B?TlRmMFROZ1hpc29kYUtvZW9FaHJHdXRDSUczQWNVZjNvWS9jRUJNVGVDd3lL?=
 =?utf-8?B?bHFiZzJMYnVnL2hCVEZqbzhoWDhrM3JrR21iaTZiMWJXcmFCRHdORWFUdWlU?=
 =?utf-8?B?aElrTUR1ZGVMbXBhSmh4eUpDU05WUWRSTlUzVGZtMUozU09zdlV5VWNzeXZz?=
 =?utf-8?Q?Iroro2c14E8N+uT3+2U7304gl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7f64a6-4b92-4bb6-4fbd-08dab8234fb7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:58:23.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjdwZlBMt61Nj3pB4GZA8X+aYY4qFXH+XbgBzVpw2+1l+mIdtbofcTNiGCpOXQHz9LnQrTtjdxO2Rjrr9btETw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-10-27 at 12:03 +0200, Marek Vasut wrote:
> On 10/27/22 07:45, Liu Ying wrote:
> 
> Hi,
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > index a5302006c02cd..aee7babb5fa5c 100644
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct
> > > lcdif_drm_private *lcdif)
> > >   	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > >   	reg |= CTRLDESCL0_5_EN;
> > >   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +
> > > +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE
> > > / 3) |
> > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 *
> > > PANIC0_THRES_RANGE / 3),
> > 
> > Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in lcdif_regs.h?
> > 
> > Downstream kernel uses the below threshold values:
> > a) i.MX8mp EVK board with LPDDR4
> > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
> > 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
> > 
> > b) i.MX8mp EVK board with DDR4
> > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
> > 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
> > 
> > Jian told me that LCDIF3 needs different sets of threshold values
> > for
> > different types of DDR to avoid 4k HDMI display issues and the
> > threshold values impact overall DDR/bus utilization(?), so
> > downstream
> > kernel chooses to get optional threshold value properties from
> > LCDIF DT
> > node.
> > 
> > Instead of always using 1/3 and 2/3, maybe there are three options:
> > 1) Same to downstream kernel, take 1/3 and 2/3 as default values
> > and
> > get optional threshold values from DT properties - no additional
> > properties are acceptable in the existing DT binding doc?
> > 2) Check pixel clock rate, and if it is greater than a certain
> > value,
> > use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
> > 3) Always use 2/3 and 3/3.
> 
> Why 2/3 and 3/3 instead of 1/3 and 2/3 ?

2/3 and 3/3 trigger panic signal more easily than 1/3 and 2/3. 

> 
> Seems like 1/3 and 2/3 provides enough FIFO margin for every
> scenario.

I didn't tune the threshold values.  What I was told is that some
usecases suffer from the FIFO underflows with 1/3 and 2/3.  And, it
appears that FIFO doesn't underflow with 1/2 and 3/4 or 2/3 and 3/3 in
those usecases.  That's why downstream kernel chooses to use 1/2 and
3/4 or 2/3 and 3/3.

> 
> > > +	       lcdif->base + LCDC_V8_PANIC0_THRES);
> > > +
> > > +	/*
> > > +	 * Enable FIFO Panic, this does not generate interrupt, but
> > > +	 * boosts NoC priority based on FIFO Panic watermarks.
> > > +	 */
> > > +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
> > > +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
> > 
> > This should be enabled _before_ LCDIF controller starts to fetch
> > pixels, otherwise, there is chance that the FIFO still underflows.
> 
> That means _before_ DISP_PARA_DISP_ON or CTRLDESCL0_5_EN ?

I'm not sure which one triggers LCDIF controller start to fetch pixels,
but it doesn't hurt to enable FIFO panic before both of the two I
think.

> 
> > >   }
> > >   
> > >   static void lcdif_disable_controller(struct lcdif_drm_private
> > > *lcdif)
> > > @@ -348,6 +360,9 @@ static void lcdif_disable_controller(struct
> > > lcdif_drm_private *lcdif)
> > >   	u32 reg;
> > >   	int ret;
> > >   
> > > +	/* Disable FIFO Panic NoC priority booster. */
> > > +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);
> > 
> > Similar to enablement, this should be disabled _after_ LCDIF
> > controller
> > stops fetching pixels.
> 
> Same question as above applies, which bits controls that part,
> DISP_ON 
> or CTRLDESCL0_5_EN ? I suspect the later.

Again, I'm not sure, but it doesn't hurt to disable FIFO panic after
both of the two I think.

> 
> > > +
> > >   	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > >   	reg &= ~CTRLDESCL0_5_EN;
> > >   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > > b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > > index fb74eb5ccbf1d..3d2f81d6f995e 100644
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > > @@ -255,6 +255,7 @@
> > >   
> > >   #define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
> > >   #define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> > > +#define PANIC0_THRES_RANGE		512
> > 
> > Should be 511? If high threshold is 3/3 and PANIC0_THRES_RANGE =
> > 512,
> > PANIC0_THRES_HIGH will overflow and zero is set.
> 
> Let's rename this to PANIC0_THRES_MAX too.

Sounds good.

Regards,
Liu Ying

