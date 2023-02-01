Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA246861CD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 09:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D74C10E165;
	Wed,  1 Feb 2023 08:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::717])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009C010E165
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 08:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONvrJkiYt6bzvEUdS3eN7BSKzF9v+7b1GJEVUmI1HCl/VSNRlHqVDkqcMKj69Ydl8CGGX2jxxOJV0tkma/o0PnA5jpHGZkL+ziDBVFUsUGrGxFiLp6nVxtSMmjwxitDEkKb5FEiDzXBJXjP+Dgan64qMei5/9oMwp9CIWcYiDCMA759XtPhwwuzITWutHEwVfGrn+VfgoftjsA4nJZx+t2cVEje2HMA4IfQd3MtrTDeAGKANBmZCLrJTaY1Djrt1YUq3TbpuhgZus5uk2i2BnXlAkxTWZGiCbBZi8IRI/W2J8FtyNomwI9Ta4OMok2RPNdmwaNnrUVpzTMalTzbyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzQ3o9Vg35dAfl01tFGLapprPMEHehfv947FPLiKmBY=;
 b=kjjtRiVw+caYK6y7880b3IQGU3XE0ILFQBTD6ba2NZbsvoSfI4W/NZzrolwMmx3A7F1WY5eD3ae1ZLXupF9mO2tQ5jToQoMFc7OoT7MgtOszazuYvt8SrE7VMmc6ifIYmOlkC/icGoDzS+w3e3UARSV9WC5FvKvW8IOx/IVrWMsjw1nrjBJ3vPiMZ4kn4H82b/oOQwiGvnhvb+H5u0Q20jvRmDk6MdQFTTLv5eMHC7DT3HmyEL3N1WtT4e3CxPP7QchmJSTZ5K0bOrFlHq+L1JwG1bW0J65dQWtOsgYxmKqIXgpk7qdhne4IFUwZEd6Bd1RKDLcEBeiXetYKTQ/tWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzQ3o9Vg35dAfl01tFGLapprPMEHehfv947FPLiKmBY=;
 b=QvuzmXT1B4VCenMxEdpBuA8xlzlw8yOWnJcpxjR36R321PoggJNFs3oKk0135rGEhOB6cfu2wKNKklCYqFdclqN2cvM5OmSvNvfzNVgNhj35N/9sdBmiQc45yVsVzbOqSxoNjN92JFSLTdqAux5YsgbcNGZYsrekxavoE0OfJgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB7374.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:616::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 08:37:44 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 08:37:44 +0000
Message-ID: <87f18227-e5e8-b7b1-d501-5ee746b05512@kontron.de>
Date: Wed, 1 Feb 2023 09:37:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Tim Harvey
 <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d9ab34-365f-4d1c-4bfb-08db042f9698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5oJBmKdzfJ71nB5P6zTTNmcmCSNm4YdgtBMXpWEkXiPUOty9ejPhQQiE89l/SfWJDZcVWnj+hm/qMl4ZDt0ojYyetvXgyx8faTLgVAPtQhc5+EcFgguJX85gEOTlUDRXuzYM3hT9klbyZHLeT/VUZ/0wLPC+98DuJ2hZD4+8prhY/QR2p1nmDY8dOK4BV2BMxtfRgeQLzCnUSJ4J6JljBtb+gpJlCpaL9AN41bUml0PyjaI9h/Uuqz+uSFfwcehvWs2X+0BN97Y3gFp1mSZrePdv4BcLtd9SOHja9tmR1QWjGRqM+lmFb6xEWV0RbJbXm/6n6HDYuoTPv51uM2mdsx7XVZA1CNaqxVKsZl6DNc+lQ8iw2RAhKLfVabsrfKMH5ZBWPNorNSqmibMsu9T0jwAMQ9oMh/6C5bIpSjfbkcOddaEv9w3aqdTqP/elmpq9axHMZSvvWyaURsbZ0xEfPs5DhmZD3JTKl4wo4seDs8PfDVprK8linanzwP3P0xltpr5Nt7ZiuG5v1mSdiEP0m5Mh2ldz4Q1BAqClwuLlElgwhBKz5MrizphzCYv0Vx/yxnrkwZWqBVA+dPFPxIQDbbJXFkUbhnnXpAZOqHhdWOqJAdYTAoUKG1Jv6mHRYFoYRaYe63RYXewaaJk6d/MQMUw2sjkAvSywdZT8naZTEznFWx/oaygNVR1sDqVHIYsnJZR/KHuIg5SOQxDUQddMWEQ3Ga3uHeCPtJa4o4MZQZJ/nUL188zz6KzbYKxBQsgDlMMFiV4Lfk+jn1E0cQSJxKEGhQa/gFeQhGz4EQ5tF48=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(6666004)(31686004)(6506007)(478600001)(186003)(66476007)(53546011)(66556008)(8676002)(6512007)(4326008)(6486002)(66946007)(966005)(38100700002)(2616005)(41300700001)(83380400001)(2906002)(7416002)(8936002)(86362001)(921005)(36756003)(44832011)(110136005)(316002)(54906003)(5660300002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykh3UXBHZng5ZzJteFc1ZjJXK0wvNExXSUNaK2cybDVIVVlPYTJzeFVoZDkv?=
 =?utf-8?B?dXZSU2xkcTB2c2hMdUpoMTBGVGR5eEpEdHNXbm9kVDlyZlpzdDVFbDhqUUZY?=
 =?utf-8?B?ekUvQkx1Zkx5MzcyWkNzSm1BK3VzNnB0LzNBOE9aWWlMektva3dUbTFHdUls?=
 =?utf-8?B?cUxCUU1LTlhXNWlqTWFYOWFDMW15Z3lCRmlIVTFPYzlSSUhRU1NyenRMaXpn?=
 =?utf-8?B?cXc0bnc1UWtDTHlXUWRzRUZYemxvWnZ4OXlMVC9aazUyaEpYSUIxQVJLODZx?=
 =?utf-8?B?a3FkalNRN2Fmb0F0aTZKTUgxd0VaNW9NNW9RZGFpNnllSFI5ZEpuUXp4cWF2?=
 =?utf-8?B?UzF5aEVtWGo3UElRTjRzYUhublZGWkRIZ3dWR1ZmbGh0RFNRa2loR29PK1lt?=
 =?utf-8?B?dkR5cjVjbFZ2UktPanRFWFBUWTBMc3laZXVDNDI3alJSMHliSmZpMXFSZldO?=
 =?utf-8?B?N0I1Z1R5aG53a3pWYWk4NHRxMjJ3SnJuMzFXN204UlFEQkJ6bzhUd1lua1px?=
 =?utf-8?B?VGU1UXhtbHg2N3ZpNXU2WUhkN2JPd3NGeTRLRkNpZUFjY0kzbnRJSmxGMFBN?=
 =?utf-8?B?M21kdnNaZG4wVUJJR0ZabEZZRXZZL2RlZW5oNjZiZ25EV3B3VnE4VDBEdXNK?=
 =?utf-8?B?aS90L3N1OHFwaXRYSUh6Q2hJaHM4UGRKMEJiRm1QcFppdVZodzd6QnpkOFdW?=
 =?utf-8?B?RUw3K01XMHVxaDI0QjlUU0szUnU1UFpBcDF5S29mTkJOckNhNVFKMDEyZXMx?=
 =?utf-8?B?Y2txZVc0VG5FK1hVVkJKUnY0VTRHZFJSdEFBeWhieTkwQVRZRjRRcFN5UWM1?=
 =?utf-8?B?MHF3YWVjZDFwVUpzTkFTMjlqdVQvTlRPaGFwZDlSVkVtcGtXQWExN0lZL3Fp?=
 =?utf-8?B?RnpvOE5OOXlzMndFVWtKamVxYmI1aHVvSDBUTS9OOWpnWUwxQXNnaFN2YU9V?=
 =?utf-8?B?UjF1YXFhS0xSNTg0Z0Y5bmRrL1ZpNE0wOXpvK1dhWDZiS0l5dFRQTHJVa1p3?=
 =?utf-8?B?cG9BZTQzZjlwMFd4dWprWGVJOFNXc2NXb2s1ZEQ1Y052am0wM054L0FyWXFL?=
 =?utf-8?B?VHBNTjdHUjZvZlV2MUpKQTBlNTV5Wk05M29BS2x1RDZRQitlbjQ0RzJWd3li?=
 =?utf-8?B?RHFrQXhXTVB0eVJ2c3UvQTJlZGNMbitoOVFKN1FtSUY1ajV4TDgvOVUzd0NM?=
 =?utf-8?B?UzJhUVdEeDY5ckJ1a1JRaURId0ptRFdxbHNQVFhDM2pKei9yTzJna005OGQ2?=
 =?utf-8?B?YnBnakdsWkhiSHBKRHFzbjVPR2ovNFcvTm9aQ2xYaUtkZk0yZlJCTG1lUi82?=
 =?utf-8?B?akFqZWdldkpoN25tRjFrL3VmZWVGWUhTdXF2eFdabmducFU5RmVNUmgzdjJn?=
 =?utf-8?B?b1o3WXpSc1p4cVJPYzA3MVZFUHk0Zmk4c2lBM0xaN2tNU3lqQWFLMnZEL0h2?=
 =?utf-8?B?SzlUZGhwL1N2Q1RxeWRlNXhtc0tSb3lPeU1GVW9nczlBdDNsRDk2enlhSXpy?=
 =?utf-8?B?dTF0WFRUZWpnaWhTMHgzVlJhNDhReUpxZUcwanNnOHNvTFlaY1U1ekRYWDFS?=
 =?utf-8?B?bjNxM1d0cDM5QktDTk14Ti8vSmJaUk5id2ErZmc4WHhDU1g5U200em1wNWFV?=
 =?utf-8?B?NElWYVZLcnpaUGdFWmE3ZUZ6OSt6WERGcGxPYjNmeGt5SzZVWjhyOFE4ZzVp?=
 =?utf-8?B?cXA3VWl4MW5vRjZIVlA5VWpNK2tZSmFqdy9mclZENTJSYkZOUzhoR05VYTBk?=
 =?utf-8?B?Q1A2YmtkamQya1FlN0RNMUkzTStzS3lNOGZNT3FSTnZ0eWVRWHBsc1FwdmRS?=
 =?utf-8?B?bHVpa0hnTFUwN2NoUlJOV3ovVjRYNDAvMjIvRnJvdWc4OXRnZFZSYk1jeDJC?=
 =?utf-8?B?ZmlzdHdQVHNHVS9hNlZCcE96eEoxR09keVQyc3hnZnViMTBTZTBhdnh4WXY2?=
 =?utf-8?B?Q3lEc1JrakhkckFqRy9HYytDUU5oUklQYkp0ZHpHQkw4d2xSRWs1QnNZZEpm?=
 =?utf-8?B?NUdyMHQ1eXlLalQ2K3UwTG5tQXEvY2xvK2RpVCtsQncxVGpEYlJpN0xmUk9q?=
 =?utf-8?B?cXlRUVlzNWlSSHAwbjNWZzgzSDRuMGRVRXJ1VSsxQmpTYjVXWTNEaUlrMW92?=
 =?utf-8?B?NGJTVHQ5Tm1uenRIU1NPaXBLNlo4d3JBOG1QOEFEUVNrRlRRemdxK3dVWjFV?=
 =?utf-8?Q?sprEdB3uelfZJf0ed4X4uf8+BFB3Iqt74PEEJsvBX2PE?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d9ab34-365f-4d1c-4bfb-08db042f9698
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 08:37:44.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMS5vIPCaGPoMKd6Uwl5rBGOKJxkz+eFKxmEXNfWrxuqBnfguDt7X22xOx/fL3xiRJkLS37JMCwC18xj2AeAW9LG/x9XvV/mcp214SevLSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7374
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.01.23 15:44, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> 
> Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
> 
> Patch 0005 - 0006: optional PHY, PMS_P offset
> 
> Patch 0007       : introduce hw_type
> 
> Patch 0008	 : fixing host init
> 
> Patch 0009	 : atomic_check
> 
> Patch 0010	 : input_bus_flags
> 
> Patch 0011	 : atomic_get_input_bus_fmts
> 
> Patch 0012 - 0013: component vs bridge
> 
> Patch 0014	 : DSIM bridge
> 
> Patch 0015 - 0016: i.MX8M Mini/Nano
> 
> Patch 0017 - 0018: i.MX8M Plus
> 
> Changes for v12:
> - collect RB from Marek V
> - add te_irq_handler hook
> - fix comments from Marek V
> - update atomic_get_input_bus_fmts logic
> 
> Changes for v11:
> - collect RB from Frieder Schrempf
> - collect ACK from Rob
> - collect ACK from Robert
> - fix BIT macro replacements
> - fix checkpatch --strict warnings
> - fix unneeded commit text
> - drop extra lines
> 
> Changes for v10:
> - rebase on drm-misc-next
> - add drm_of_dsi_find_panel_or_bridge
> - add devm_drm_of_dsi_get_bridge
> - fix host initialization (Thanks to Marek Szyprowski)
> - rearrange the tiny patches for easy to review
> - update simple names for enum hw_type
> - add is_hw_exynos macro
> - rework on commit messages
> 
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>   list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
> 
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
> 
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
> 
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge 
> 
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
> 
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
> 
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
> 
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Repo:
> https://github.com/openedev/kernel/tree/imx8mm-dsi-v12
> 
> v11:
> https://lore.kernel.org/all/20230123151212.269082-1-jagan@amarulasolutions.com/

I have tested this series (again) on Kontron DL i.MX8MM (= Kontron BL
i.MX8MM + 7" LVDS display connected through SN65DSI84 bridge).

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
i.MX8MM
