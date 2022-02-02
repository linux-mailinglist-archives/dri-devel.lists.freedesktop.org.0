Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB34A76FA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC16810E3AC;
	Wed,  2 Feb 2022 17:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on2131.outbound.protection.outlook.com [40.107.23.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0C510E2EE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7u0yirI28LiyaGoqcfqzuwqZd29Vt4LbA5jFb4KM58pBn8PLc/crjksafeBEyZjb/9xq6jAfR0AE6/tEcx/1OEGgQbLxScemPeGlwMBtw1Jv+h+reK2OmJdgX7e+WfZsb0XKajJpb3fguSIt/1zLTfBJBA9fHKtFYne0GU/c6J0mSZCHp5Aco1ppXsMNZ6rvwHz9c2eYHx95jAIP5dIWtO8O1f8/m9leWOGytwef85LX3D1bRhbkw6HHI3arVcU5EUSleBwkmfkT4NMKgI6hSPZbopk4Gdm7YpHGwxYPxjwmWWtlrqRkO+u+tQpvHS5xwJFrC9H5Nx9NCq8c+4Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z6b81h0mx+ZU70Eq5709KiJU3FI7/GzUwp64V50kqk=;
 b=CFrRq78Nhqg8z5oBfaQDl7sL9z5gzhRWB1+0Rv7mNQgfHdAhzzTWOlAb8RR1nS5meyNzEROM4NODZq/MjH4Nw8SxuED0ihjwnFwdmRVln/Bl/7TmHHlosrJaSuC4lAwG06LMmgKflfi8BWQvaTzogexvw9ezCqbgHi04/+P+zQBz8qBbgAZvno38TZ1RpgahoHkAiK1QC70lSyCG+72qqtmdc6mdguzSCZ8ha00TcvdcNZ3vzNOIG9Bfm6vCkJK6ESURbJp0Hq1wqf9LF9VKCXeMz9BVcgc3yxGmDGIOzI6WMFrR6HSrVSnSwNoAnc2rvkLRhd8xV0Ona63mnY5Efw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z6b81h0mx+ZU70Eq5709KiJU3FI7/GzUwp64V50kqk=;
 b=WxEGISI5KQ0RW0G6HOmczu54ZZz7QsbY6wtqbnw2pa+KBgUxDdPXxRWXRXw8976gLpT5mPfuhrrDN6Z0jKeYtfpMUAtNi0isVjfnA54/URcRYDCFNr/1Dy//M/lcqhy51zRUDhB9VrVnXkhRl4nyWCOIqe+W7J/zOLnCcwbIvBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4a::9) by
 ZR0P278MB0473.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 2 Feb 2022 15:42:33 +0000
Received: from ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
 ([fe80::51d6:e688:ee1f:70f1]) by ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
 ([fe80::51d6:e688:ee1f:70f1%5]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 15:42:33 +0000
Subject: Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 dri-devel@lists.freedesktop.org
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
From: Denys Drozdov <denys.drozdov@toradex.com>
Message-ID: <5374a438-ac8b-05f4-9913-f918ed6aa8c0@toradex.com>
Date: Wed, 2 Feb 2022 17:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
Content-Type: multipart/alternative;
 boundary="------------985E03446B01C80A9D881182"
Content-Language: en-US
X-ClientProxiedBy: AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) To ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:4a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45950a79-f126-4d57-a419-08d9e662a112
X-MS-TrafficTypeDiagnostic: ZR0P278MB0473:EE_
X-Microsoft-Antispam-PRVS: <ZR0P278MB047313371FF5E3740E1BA069F1279@ZR0P278MB0473.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZqqo+YTr1Cyk7s+GNzD584JdTHtF6eZAmMmf8Zx8ey6LOvlr892+y645GbFdpMXH/eETVJ2LYva9D7mboointRhnrsrb6VBESgZTR28I+Gg1hN69Y5HbyypapEZr/Swe3JXDOOw7qS4FonZQpkzTkdwEKtYpBeGl2NNv0e180L8JMPTcQhtexJoHQfHpoAOdURcVBPkdtFkVYTKBWPA6D9zHZtLLnYp009mV+7tbmlvFWpCAZPS45gEnT7ydfOFlNBLfNoL2Fhqqcuci16k3akiBtSvqSImSldMDHCRhGakKaW5ufnIDOJPgyBS6wfUfI4k87JJqwmuAM8uMgZFqWvKVT9yPwDDO5UEOJuS5G5LaUABD+rUCKdxXh+55+ORDOXK7J8um+TlidQ6ueETPtx2p4NFAt9Bk4v6iQLWcDHjRSztYqoDqx9Oy3tMXStpVBJOFGTbCRGVNpzz0TeYAU3LUhlxsfpSexpUGRwfMPAsO7fmBBGJmBheMIU7+0o8nZuHvoVTZV4UEDM9FVwdPzTJvqs/nsEE222DglU++g5nJydCAdguqVEBSpstvN/caKrKxa/3xb1PE1OxYp1qrUTp/pedfFrcTEBHxjvxupALHZnUOYLxgBsMU1AW3ZHN236wFjklVPMjDNSbg5sf69jxqXn3VfPT9gj3QEMSIYpTNT5Puj2Nn12tKHz1CCytRMBtOCByBbkNomeLSUzvRBpcXZNhoXaFg8RcNilm25VaXt009havtyddncqfyOSg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(54906003)(5660300002)(36756003)(44832011)(31686004)(508600001)(107886003)(166002)(8676002)(66476007)(66556008)(26005)(186003)(2616005)(52116002)(86362001)(6512007)(6506007)(31696002)(53546011)(33964004)(2906002)(7416002)(966005)(6486002)(38350700002)(38100700002)(66946007)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFFRVBjMVM5S3d4UmVmS1JoTWxwcnplZFpWdnM3ajBWR1cxT0pJbzRrV2Jp?=
 =?utf-8?B?NE9iYjhUVkRQMEZ1RVltR2VpLy8rYTE4c3RIemhYVk42cHJ6bnJsN3pjbll3?=
 =?utf-8?B?OVFOclBxQUNRLzBBOVZkM0ZMek5KVHRKdis0c0E2VEdtVVcyWHNqaktHOEZ5?=
 =?utf-8?B?TFZFL0xMQUZoU1lmTE95R3JLRnRCRVpGajg2aEZVbEZQMC9BYnZrZUhZQVBx?=
 =?utf-8?B?WUsrK2tBdzhFa2tBQUZYZk1tazc1dDdWbzhCUU9URG40K0NMYXZTMjJ2V0hR?=
 =?utf-8?B?ZERzTVBnMy9ZSjl5a2NMZmhoS3l1MERoRzhybWE5Z0prdzJQRU9mK3lWcjVV?=
 =?utf-8?B?NTBqclFiMmk1L1AzaGVtS0VsNWc1MXk3RzdicnRWSzM1eGhLRUJqNFpOQUJu?=
 =?utf-8?B?a1d2V05jYm1QRy95UlVXYXl1MFRqSUJBYjc4YkQwM3c1c2srOFAxQ056WnZC?=
 =?utf-8?B?bG9yMlZXZ1dQalBYVkhiN1ZpN05HOTlDcUQ1N2hSL1ZIa29wL2I3M3QxajNH?=
 =?utf-8?B?eHhlSlVBamdLdlgrc3psUXF6NStLTDJWK2ZzSGRqS3JSaWJPcSs0bmNnazJJ?=
 =?utf-8?B?QmdZa3pJMzJuNnFqcnpseEtBb2JTWWxxa011RzNDT2xrQm1FZ0h5WDVZR081?=
 =?utf-8?B?Qm0wcEJGc3F3U2dXR0laVUVYckRuWHJFSGQ0c1M0dlY1QTVGUGV0VnVhaEhC?=
 =?utf-8?B?SUhMR1ZmbHZFejdkbVNQbHhtZlJRZDNiYXh1R1JMVXN6b3pVSEUwa2FQTDc3?=
 =?utf-8?B?VFZjZ0QwY2Z2ZGlUd3N1cjkxTjRHUFlVZHdXQm1NbmhnNVhiMk1ZWHNsU1M5?=
 =?utf-8?B?TzNWaFNONUx3Njc4bVZBdU52bHROMEliM2t5QmpGN3VBT0kwNkl3eDUxQS9B?=
 =?utf-8?B?R1hFcjFib05Ma3N2bmRtY1BCYUp3dHBNb25NdEZLbUFhS3FzcGlxNE51a2hi?=
 =?utf-8?B?SHdkWkFRMHVPNmdJRk1YK1BHcGthQ0dBWXJlZUdLZlVLUzA3WGdVMnZJNUd5?=
 =?utf-8?B?NGNmOGc1Z3I1NXI1QlMyalFCK2dpaGNEekUzSjFDbDMzcHc5UFF4UGxnbWRy?=
 =?utf-8?B?SjhQRE83Njc5WVZVWHZXdGlHL2QxTnQrQnQ1RlphR200YUZvMEN2a09ENWM4?=
 =?utf-8?B?aDNnV2ExSTU0RFc5VkgwMnNTZ0JGTDBhb0JwYVZRTUtTS0RQRUJhS0VMTGlp?=
 =?utf-8?B?ckRMc0VlUGVpVk1lQW4rZ21KdWZXUjJpQ21HQkd6NUU2S3ZZYWRwaDA2UklR?=
 =?utf-8?B?cGU4bFlDbUxXVitEZGVuUzZYKzg5Y0QxdlJZYldIQWgxVGRGN1FVTEFIRlpw?=
 =?utf-8?B?ZWVNVVNYdmt5VXVBWnJQbFIxRmE1Si9QM2JPSkZJbHY4MVJaTW82MXhBbU9u?=
 =?utf-8?B?dmlJRGFDc2xzSUhrVnpGRGRsN3FMZThyVnM3VHVaR2lTZVR3eTJBK2taMWtS?=
 =?utf-8?B?UFFIMGZZZWcvOFRBSzNaUFhVbGNBVmlVVThCeEdMdEM4OThBYm1IQzV5ZVNO?=
 =?utf-8?B?WjdIc05WQ0hyWmZlRzQ4VW1lWEI5T1Zwb3NnQmUvQWk5eTdlaktkbHE1Y0Zx?=
 =?utf-8?B?c1BWeFJId3hLcy83bTFEWC80SWNtQWpxcC90b092Y2YwTC85S3RTQWZTdFNK?=
 =?utf-8?B?eGRHMDNjamZqNUxWVTV4aFlpNkYrbzNzRDdxL2FDOWR3RGVmVUhIdWxFZGFP?=
 =?utf-8?B?SUhDdlRxbE9oNVUvMDRZSHphL25raGJqaGdCdXVrb2xNTmhmSHBxeElMYjVN?=
 =?utf-8?B?T0tPK2hIOUJBT0IwdEFMdkVYNndBNEM4dXY0MWhhdFFWMjhjVkFaMjJuVXJH?=
 =?utf-8?B?Rzh4UUJleWJadk1NVjlVSWpvZ3BiTzdEaE9oRE04VnB6UUlhYUViUVE0S2d1?=
 =?utf-8?B?Q2E3amVNVlZDcU5hbGQ5UlBMSkxwVFhqdFM5Q0NyMXFFcEQ1bWRSQ29NU2Nh?=
 =?utf-8?B?bitOUTV6NW5GUkxUZmFwM3N0b0JLQ1BKZ09ZODQzTGZRYUJpTC9ZU1NIdWpD?=
 =?utf-8?B?cGRnMkx1Z1lxd0h5eEs3RWoranQ2WkR0MnJ0YXRwU2VYeGFJLzNQRVNjK1dN?=
 =?utf-8?B?a1pHTXNqZ0RpT2w3eVJqN0N6UnU4aVA3TkpSQ2xRMXkrNFExZzc2Y0JVNkcw?=
 =?utf-8?B?bE8xdS9ZaE1jaHZydkxCNUtUSjZJaHdTVnNscGR4elIvdnpkUnRxTnVMc3BI?=
 =?utf-8?B?T2FCWjNZNVlQaGRNUkltZUhpeGtMdDRpY1NKM080WXg4REhXckdWNStVTHBs?=
 =?utf-8?B?VDh0bmJvd0pnc2paQ05oQjlCaHhBPT0=?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45950a79-f126-4d57-a419-08d9e662a112
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0899.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:42:33.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIkC0naulcB8Y+5UgHE0HQpMbfNXkrfWl+UX2Fd0sfXfK2TOb7OxD1ULdWB8R1T7s+8VO+kGWCWBzhIhd3i7M2fVsoWQev9ae2O+GWZOSWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0473
X-Mailman-Approved-At: Wed, 02 Feb 2022 17:41:11 +0000
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Denys Drozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------985E03446B01C80A9D881182
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/1/22 1:07 PM, Christoph Niedermaier wrote:
> Without the data-mapping devicetree property my display won't
> work properly. It is flickering, because the bus flags won't
> be assigned without a defined bus format by the imx parallel
> display driver. There was a discussion about the removal [1]
> and an agreement that a better solution is needed, but it is
> missing so far.

Obviously bus format in panel-dpi is broken, so this revert
looks necessary. The current state of panel-dpi isn't consistent
with changes introduced in commit 4a1d0dbc8332231d1d500d7a1d13c45457262a97

> So what would be the better approach?

Another approach is using panel instead of panel-dpi.

>
> [1] https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1
>
> This reverts commit d021d751c14752a0266865700f6f212fab40a18c.

But, also you need to revert 99f155d0776fb8838e326efce056aa08e25433d0

> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>

Tested-by: Denys Drozdov <denys.drozdov@toradex.com>



--------------985E03446B01C80A9D881182
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/1/22 1:07 PM, Christoph
      Niedermaier wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:%3C20220201110717.3585-1-cniedermaier@dh-electronics.com%3E">
      <pre class="moz-quote-pre" wrap="">Without the data-mapping devicetree property my display won't
work properly. It is flickering, because the bus flags won't
be assigned without a defined bus format by the imx parallel
display driver. There was a discussion about the removal [1]
and an agreement that a better solution is needed, but it is
missing so far. </pre>
    </blockquote>
    <pre>Obviously bus format in panel-dpi is broken, so this revert 
looks necessary. The current state of panel-dpi isn't consistent 
with changes introduced in commit 4a1d0dbc8332231d1d500d7a1d13c45457262a97</pre>
    <blockquote type="cite" cite="mid:%3C20220201110717.3585-1-cniedermaier@dh-electronics.com%3E">
      <pre class="moz-quote-pre" wrap="">So what would be the better approach?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Another approach is using panel instead of panel-dpi.</pre>
    <pre></pre>
    <blockquote type="cite" cite="mid:%3C20220201110717.3585-1-cniedermaier@dh-electronics.com%3E">
      <pre class="moz-quote-pre" wrap="">

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/357659/?series=74705&amp;rev=1">https://patchwork.freedesktop.org/patch/357659/?series=74705&amp;rev=1</a>

This reverts commit d021d751c14752a0266865700f6f212fab40a18c.
</pre>
    </blockquote>
    <pre>But, also you need to revert 99f155d0776fb8838e326efce056aa08e25433d0</pre>
    <blockquote type="cite" cite="mid:%3C20220201110717.3585-1-cniedermaier@dh-electronics.com%3E">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Christoph Niedermaier <a class="moz-txt-link-rfc2396E" href="mailto:cniedermaier@dh-electronics.com">&lt;cniedermaier@dh-electronics.com&gt;</a></pre>
    </blockquote>
    <pre>Tested-by: Denys Drozdov <a class="moz-txt-link-rfc2396E" href="mailto:denys.drozdov@toradex.com">&lt;denys.drozdov@toradex.com&gt;</a>
</pre>
    <br>
  </body>
</html>

--------------985E03446B01C80A9D881182--
