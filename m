Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450744B9B23
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573010EAFF;
	Thu, 17 Feb 2022 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2138.outbound.protection.outlook.com [40.107.244.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98AE10EAFD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9lPLHGbfW5b4NjkHP8uPEprwM5/G3El3jmhTATw/UxhLLk1hrlmmediy6vhECwfdZOGufvjpSGMe2H/WYXnauPyvlHY6ga6SQ/tRLr5Z5f5uNBRhrinArcKTd+V4Kilu0at55/+VTOO4O4jPwm4qyqkEL/BlG3h1g4eB/Ka0r7GL6MUe88oT9PRmC3ORBBmpK407jUbjHTMtTFwtVL1yW1TxZOOWcZMt4drkkRUCNEEhpK3Sek3NLdetCNYL6X6H6cqrfhVh/mpAkK4ZikuXwSTUZqc3XsPOWdxBUygOOpdQs+SP0/nMgkRkrQRoKsNUzJUknMukdhZxyEaxE0O0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Fjbh9JIHv+FK38T2CLcKvUjK68V4R4ZZSD5skhbCc=;
 b=cEWkxcfS1jQktvsSXHj1Gx0OpiC0rNbZJBgqnqenDOtQ4jy6XxakypWpFd/KdLgzwLMNr64T/q79vx0usitPk9jToG06IA7bBPJ3zTefZkueJcD6V0tAleDEM4kTVnmz+s82zOCIw60xuAwJQk6ncp+7DdG9SFLXvfN+5GJ+AX+yW9C+b0okwFjFQKrq9hkOuzVnVtq8pC9sIPy3C8BlIUU4nvPR3SF9pyDX+nMQJ0SDi1gZ50hS06wQGSyr4xqYyFOu5xZHMtryziBtkvDimfrK05FxRwcDPnC+3C8NkSwfi5G/Clyml7JaTGy2Jqavf7FUcefmQCHSK6JffZFpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Fjbh9JIHv+FK38T2CLcKvUjK68V4R4ZZSD5skhbCc=;
 b=3vWr09H1pdGNPMgggZTWyj9MKYf1AV1E2jm3EwEFgSDDqNq1V0+G5UKTPkrWJHG6Z+5uhEf7WkueQIXLzdoHY1lFz7x567XBLvbg0MfhWMyayiYLWWnoZmfX2uy3cqE9LEGQbxCX3hOeZDFd0SdizKqL/bCYRx5+kKnia6Qc7Hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CY4PR0401MB3697.namprd04.prod.outlook.com (2603:10b6:910:8a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 08:31:25 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%7]) with mapi id 15.20.4995.015; Thu, 17 Feb 2022
 08:31:24 +0000
Date: Thu, 17 Feb 2022 16:31:19 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in
 aux read command.
Message-ID: <20220217083119.GA3781632@anxtwsw-Precision-3640-Tower>
References: <20220217082224.1823916-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217082224.1823916-1-hsinyi@chromium.org>
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31049ef0-5f24-4211-6451-08d9f1efe21f
X-MS-TrafficTypeDiagnostic: CY4PR0401MB3697:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0401MB3697ACEFC631FADDCFFD50A2C7369@CY4PR0401MB3697.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LESsctow/xH+9lIMqkXWIigupe7invfhuCNXYjjMFqvjMqQRk/mF/BV7iOnFB8tb71x7Qt4bXi1T6965/NhmgLqNYEwWD5v6w42WFsFnL1YL88Hqi8DV68FpNfPjxvu5uqkXFwR490MhxKBkuZjTy2ETzgPiboQXaVd92B1Q6YQeqnLyOx4CJaewOGm3FtDuT+0VicbVeDuCpQmYyq0t7v6+W9x+8V2kzFQlB1lRDgbCtqL72U3rJ2ZaqtcO2FBBNfFct3uxYnhnB5sjJOVsYDyyIkw8NfuO7ZYLpjGok9JELnvLJGj48A/hTHDmGCe9cLdIPpM0wAsr6jk+ju/sFx0LkV6qn4GQGGUr/J7lDVEVjDFPBxYyowKNiF7v+9vvrPEshlvAlomzgZlNNVnm9u3O1oXTlfu+x0fph3xbP87nDCGH0Fm90AlMsV3TDFsdD41QvF283n4CW+byS51GyTqHQZsEYXxuVxFxufjQKpA1xQ3yTPENYxUdKhhG2Xkh0OOuc4lgW0XAIP1sdjNeKIkFvLmPcy8BNX+D8KSRcY90gZHXi0AKikfaYcpSyxzqiqc4GB5uUS7DMhxhbj+RuYka9/zYYeKK8VYWR3xqwDFW2ChDcMovK1U0S5tMXAf88vU+hzbA5vjBNEmso9g2B2FGDpycFPzN57BCgeZN15uijLPOWM+cALLZlCiKFPVpQQDocVMG5h/Ab7BOTK55ylJzgcTKPbFmzf9z3CR0Fh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(1076003)(6916009)(26005)(6666004)(186003)(55236004)(6506007)(52116002)(6512007)(8676002)(9686003)(316002)(66476007)(66946007)(8936002)(66556008)(33716001)(508600001)(86362001)(6486002)(54906003)(83380400001)(4326008)(38350700002)(38100700002)(2906002)(33656002)(5660300002)(70780200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bvNxYgzE8YMT/qAhi/AQpf2eyME6hxtwN+c29MJ5l30m6f2lmomVGPVEopa9?=
 =?us-ascii?Q?hCaEm0SemZlcFnKhf04KwJvo+Jy+YlZjXdwsLBGqHbRkxjp3zMRrsTZM0aKa?=
 =?us-ascii?Q?yxioy1UqA/+rdrmzueTfC3iGbQhVuGS2al/y35I2vT/kubFtq2kqw5y44iOC?=
 =?us-ascii?Q?Ei5LHjgdmH0xPhdjBIGTERlLXl+aOuW1Nb8AWtpYTbxwW9AglkYdJf1XddP1?=
 =?us-ascii?Q?58yP+cGt2yrARida70/OVnWyHZKO8EVwPfFs1XiGEYjlZRCajkWdtVvhUgo4?=
 =?us-ascii?Q?Dspl0IvOwGpqr6xomrUR5VdEq2RY95jKE7ac1RkAWeFl0yzHrotcrNtnuR/i?=
 =?us-ascii?Q?JmVLvzLEPijHQEF1P1+CZ/PaWgmzL95I/hyZaIbguyiCl8M1IaDVFsrZXPsN?=
 =?us-ascii?Q?5QW9q1RPeKUvEu8pFcAGPteXv+znE2zztxihprLMmEgDSf380HWwaxCWU47Z?=
 =?us-ascii?Q?VMjQcPir3BgyfzauvK+6ys7K6rJFC5eB6mahzW4NRgdjivaZMeSNJRucYg6H?=
 =?us-ascii?Q?ptFMZ0Py4LK6sFITuO7KTl7GTKBggCwL8mxUovG2x8IBehGxKsWgaxSdDOQP?=
 =?us-ascii?Q?zDWdsAeXxRes0XSEvh3TmBSTahy3Hz+8paQ8Ss44aC9ksSiZJ4l0/FUE0Bty?=
 =?us-ascii?Q?ittrRv7xNclnGgOslKDPkxefAfd7u34rZcCtZ4cBTVugCMmKyuYscWb8yldk?=
 =?us-ascii?Q?bDNbhZD4edSxXZnV6QVoUBOhVmD4LgqPVHRlbrRFsp3Zp5nwoC+IbtOKmhHP?=
 =?us-ascii?Q?HrxFHBN7XuW59AfuL0VXlLGf5VJxxZAoOeyMCUrU600PyS4HbLfML/5mWh//?=
 =?us-ascii?Q?ACpwccZMhVcxaWIK8weFdnXUn+U+jhmNBj3jhYoCUD39yvWxX3cauX6pSGvM?=
 =?us-ascii?Q?XwcdBR9LbGl5/aDO2/lxnlcWXWoSEh+FBHZkwEQEueV4r2NGD0e8EE2vBwlZ?=
 =?us-ascii?Q?NBC9M5AutKMCSb7qwVD/1u7m7rZqCidi1Qy09sdCNafYMAA4KYHTio624G8D?=
 =?us-ascii?Q?HEmsFa8V6eLnDvrr+LbZVfCp2R+uXEFPkdti2F0kvx6DTinv3FNR17PiNTbL?=
 =?us-ascii?Q?Nd7umM7kC4zz9qAMeBEWKk6TGBPiX0QulSce6niE9Lk3Fz0j01nJzK1VZPT9?=
 =?us-ascii?Q?20mgwNFOSY/X2+sixCwOcQXBQ0InEm0mSQz839Yn3AtZfTULRcyOXrkughYj?=
 =?us-ascii?Q?rpc5u5rDj7VOUB6Gz9RiaK2Ca9hheDHMzVZnZid0tEk3pQllKd3pqOk6hVA1?=
 =?us-ascii?Q?KTi4mTDbpHlYwwPnUXEbewEAowkSf7v/KdwZqCsiPjnQCCBK3EU4SbjOC/S7?=
 =?us-ascii?Q?E51O+1mERGhw+wP3lNyLrPwWaH1RS4xnW5Mpntcd2+Ae0ZJrTrGviE3iqLCY?=
 =?us-ascii?Q?wk3om7H2Hrrb+J2hI54UN0/vUUj4QtLKAAd/1NJnXpe8nACrPKtR5nj4l2ke?=
 =?us-ascii?Q?hMQBvNnbZgIlXDR/lEahAuX8rOHz7TgpGsx0bjrSGGSWrUV6KHoMy91QWWTQ?=
 =?us-ascii?Q?cLDzf6/s7L1c0a3rnIYI/6IHlr2hC0A2Z9GDRjXRA3T/IyCbPv9FU+GZgj1k?=
 =?us-ascii?Q?Z7mdhgltCyZ2lTG6dpclBFVT7vSyHv69ocy4utZP3oSZb9AP1ZBiGEQE7LeY?=
 =?us-ascii?Q?b/h4hCjT6MCOhh1t4mm5QZ4=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31049ef0-5f24-4211-6451-08d9f1efe21f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:31:24.5945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpSr51ToepN4SNsGt/UH2GjjZ/wVE2Ce5h+ttmh5F8zeZj6EKVKIyGMMTlGUEAmw/HJAMQQVqh7sxztMXZRv3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3697
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 04:22:25PM +0800, Hsin-Yi Wang wrote:
> If the previous transfer didn't end with a command without DP_AUX_I2C_MOT,
> the next read trasnfer will miss the first byte. But if the command in
> previous transfer is requested with length 0, it's a no-op to anx7625
> since it can't process this command. anx7625 requires the last command
> to be read command with length > 0.
> 
> It's observed that if we clear the DP_AUX_I2C_MOT in read transfer, we
> can still get correct data. Clear the read commands with DP_AUX_I2C_MOT
> bit to fix this issue.

Hi Hsin-Yi, thanks for the patch!

Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin
> 
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2: Offline discussed with Xin Ji, it's better to clear the bit on
> read commands only.
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 633618bafd75d3..2805e9bed2c2f4 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -253,6 +253,8 @@ static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 address,
>  	addrm = (address >> 8) & 0xFF;
>  	addrh = (address >> 16) & 0xFF;
>  
> +	if (!is_write)
> +		op &= ~DP_AUX_I2C_MOT;
>  	cmd = DPCD_CMD(len, op);
>  
>  	/* Set command and length */
> -- 
> 2.35.1.265.g69c8d7142f-goog
