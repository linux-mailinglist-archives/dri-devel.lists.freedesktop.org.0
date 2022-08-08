Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F375158CC1B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 18:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2E110EC5F;
	Mon,  8 Aug 2022 16:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA36A10E028
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 16:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RA1gmTxhG5A4ZCoX5Ids1yy1f9zYTadl1l3Uak6Xubl+rIWWj+cXrm/gPcxKg8W2r3ABLdE71J4c1GbZbR6f6T+5aHYd9vj1700wLIyjfcxSmogThJeNDkxhtZNh3186U513IbqxhV4Y75mdBhbN05ZdRMd0roKK1jkC8hn2GBssdyDtl3QGKK39HKZiS4wHwYk2M2dDIHiP8u2IsQKIfs1j4ZcKg4JCDYAdS8tnygh5End7W3TmRYaalCxj6yc9CngwRT4VoVbnUbnAJMAQXvl65/2x998Ro6/jPgsAEzlLJcAokEUp4NExsW3ZRvkb4AIZlw7dhv3+OAE61v5YNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BqaHw7FXH7IftVfn9tw3S/F57TQQhKXkNKYEnKy2yw=;
 b=HUzchIoXO75lJg3ORrZTf0rbtu1/bWDDTrfPP3oXYv4db6eRtyp8W9VqvUanc51tjm/tsuFVclqcULihhRgpDfWJARnQiKWTv+NG/Bh413+fBEgGTQmNgph3ytwyJqAQEWFPGYes0l0b8dd2yXqQv/Be5De1spz43OYfn87kXyJSqKRyrA0iw8IiLxeohMNfm7aWoGnJZ7Okv3BaHfdzLhXkSmLJQlTNfrLNnBWCee6Aba0MX31wQ4O2hfjKNokrvLla5PjIGksizoDquRn6GNWh2nXANBDoK/3fKMQsuT1AvBEem89HBfaOt0PuWftAfcK6b3p0RlHgfFnwQkWVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BqaHw7FXH7IftVfn9tw3S/F57TQQhKXkNKYEnKy2yw=;
 b=oV+ikYVeDxRlklTVQ8i+bamCVsdmRP4/jthh9AgYLxbYEgeRPpv2GeCwFF09eSjs/8aSeVtrDnrK4AiFgg+9wb96lk4JX9PFoz9zInwMSi95kYAnJsKiWBrwjsBZPO4LtcPVpmCJ27A3Sum9qbf0DXf+KmI5+idaZ9UtBBdVDFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BY5PR03MB5153.namprd03.prod.outlook.com (2603:10b6:a03:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 16:28:24 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 16:28:24 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Add pixel formats used in Synatpics SoC
Date: Tue,  9 Aug 2022 00:27:48 +0800
Message-Id: <20220808162750.828001-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 309287c8-0c5f-45bb-d618-08da795b0390
X-MS-TrafficTypeDiagnostic: BY5PR03MB5153:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWbPtkOb2X15ubjhEB5/XOEgh7NNvIHTWuGf0VH/V2a07Ao93bvR/o9VJ475oxQQTE5O3wSBN2p3aEfZ4jkDeXUUyO+6XbLGYXbvjVNu9TdnTGbZ/1HUudxeF7nY+p7YNPGEYf+RmWkulQA+NaAHgRMmKW6s0DbEBRU1J8oETaZenCm6gOsEZzlBRtUqtoz0kDQFr2cplZYPAkz4Rmj7+cEWgIQaUxyNg2C3mvicgBRIOuN7U34eWrBknJghpOEs2L32N8+pbyoB9lJ9dB9/sgOAP3EcY9HQ0dFeOokCOHUvyuhfvHvFzlF3wpZVByOLRw1k478gSof6UAaBvbWZxnOtn2jNDffQ9OOkSqF7cB1nATfzVR/cTj4Arv7Kdh8bfG7mPWtgchURQs/QqtcSV8DYhQOHeNO6uEeE6K3eTv38euJmQP0ecwtTa8oClALemNtlnH7gDVgv4mdxLykGgqbVcl6ZVO2tYMiZ5IHUyLtsWBIGHESf6PrShmiv7DJ7RIO4IrYcqya59rJX6l2NpjCe0vwSJLXNknPZOgvQec3jKS45Ze/+RanSn9fP/3D3PZ+6AaM42JwoX1joeP3tUD5J4ylCxP2B9zZS8Jv2YrQ55xygdad9EwSy5fCGICAlYz2wA16NHMx82q6BSgqNOMLYNykZqsoR8LJRaldTgKSH26R+HVN0UGFHFNbD76CxfQPJLcjkQ6+UfKmvDMtitDhFHHpMbq42ueXUzWNrJSw8Do2GavRwBXpWKTkYQGBL4+GFDsagHOM/2UvqAUSeT1pyjFobJZ3U/kBvTjBYzCbRXXHHKi9r9OrIdCdI8c8s5ArnJjwLp3zInkggHTIbng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(346002)(39850400004)(396003)(66556008)(36756003)(86362001)(6916009)(66946007)(66476007)(8676002)(4326008)(5660300002)(966005)(6486002)(8936002)(478600001)(316002)(38100700002)(107886003)(38350700002)(6666004)(41300700001)(6506007)(52116002)(2906002)(7416002)(1076003)(26005)(2616005)(83380400001)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d/i0NsJvckTbGcySGNlrk8vspNqUAKESoOLI/FlebW6Yq0w+e2j3GRgbXIL2?=
 =?us-ascii?Q?Gvf/oYiSEK4mQaJwNs2eipCxTaL60BmHulIfslt4l6MQRIcysNLpopDoIeA7?=
 =?us-ascii?Q?hn0h3sVlc8cLytZes4mRfId9qjh8Q/v+EQo2uhHao+k8LF/HXDQ6zk4ISLDn?=
 =?us-ascii?Q?SfiISlne3KGFx77/YpBRR1trXA2EkFU2H/prYNpSooDWZEPCw/I7F+z343eQ?=
 =?us-ascii?Q?tIGGPby3OlLt5PaSxQ3woBnzY6ysk6SLqnRAMg4FUykfRGpLSsWuFr63tdrb?=
 =?us-ascii?Q?hORItr9lQDocdZXEZq9Nky/UUxeySJxgtLbsFlaJSzOtCz2X0qUo2Kz7lV3O?=
 =?us-ascii?Q?F4DBzbPRC9sk7tc6gEgXr4ler+1LMg2coQfjfZYDQx4n1+WeMQxgCru5vluW?=
 =?us-ascii?Q?TxDO5PB8KXrBazP5WbiNe6KfaAE4NjZCAWPx9HoP2kbq/UJEf2n9eZl7+o+c?=
 =?us-ascii?Q?DYtQmKkWVs9xg+la2aS1p8w7SRIPimRec01nrPmU4/9BEYlkrozkhYZKdFUa?=
 =?us-ascii?Q?ioKRclx9S/kGPDi5CBe6IQXd53ZWjQJcWD10KOEqZ9jpsLjP08s6uh8hUkrq?=
 =?us-ascii?Q?X3NDwrvDiavS6PSg/sLuP8rl5iscbzOX48/EpT24IgLelX6rqUrL6Mpn38/t?=
 =?us-ascii?Q?R5VRIbmp8OsFxyj+Ws2Sav36D42OSYHn4SGyBfAIGOHdmk8vFNuqrYcNz4zN?=
 =?us-ascii?Q?mshChD+XEFzpaARC4qWjTuG19bdaqYAz3adw3+7+cUPnvrxGguf8B3mnNb+i?=
 =?us-ascii?Q?OPpP4JDjpmPoXrXlcnknCgk3KadxMufEylmdZvfJCh0RpOcDhLnzzQLcZOnT?=
 =?us-ascii?Q?5yWatnvWrqZZUst5IywfCUcyPqhKwaQAl8uXD2rviPH0P/Slrk7gGOAYYBRd?=
 =?us-ascii?Q?K/FC8EWx/tT8XmBAKNBmCCDkIpmqAnNLocPENZmAU5fIQ/mmWgxFYma9bObV?=
 =?us-ascii?Q?hNYISRS8EYpBB64vjx+r91sL+5o3VMJWVu1yWIi4RGQ29M7S0bXnP17sIWBo?=
 =?us-ascii?Q?Mklqt7mOuqsFMLCWTHEpC3+GpWMCgkdAYcq17f+10ytGG5UK7KAYU7htc5VS?=
 =?us-ascii?Q?n1OKKSncOKtBafQyW7DvznXeEMwv0aF93bz5XiFFaYlRfcrrhZJFdF0TSRX4?=
 =?us-ascii?Q?FQq8DhdoD8hVo9nl/T8O/2C+i29KJbFUk2TAFyj9CAnmybQJJl6cnnHcn57j?=
 =?us-ascii?Q?MyncEfCea/dlrGwy3GgvuvsUes6AaNyKkztajwtRchg8ZEgo4HQ13Ibnk2xD?=
 =?us-ascii?Q?6u0A2Kufv0DSs+ykIUKG5Xgs7hUDg4TXFnNw8MirRYnQLnm3V07tcmW79aZY?=
 =?us-ascii?Q?9KA6NujkVPh3QV5Ns/ut+zGcGiUDDEsFIt+OHrXXbF6N7IuG60IsAWg9pB6L?=
 =?us-ascii?Q?3lKfZhrPvB+hy6lbHjUU6/eL6d7bv7kp7PfLiuXKsbvduHZRt0ZRV6T6Ts1J?=
 =?us-ascii?Q?Zo+3uWtdu4P8juY1TUo6HiWZAVmH9Z91sr1+xc6e0vc4IIHWt3Fv324VlXo0?=
 =?us-ascii?Q?5rahYP242xl9eWNT58otAQM5M+gtzLnn10a02w1ZgTY+JKdpJAUxZaoAHMfw?=
 =?us-ascii?Q?VG7WZb8gGJP/H2Dz/byqBwOFhzRT8Kou4zxwF4Nq?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309287c8-0c5f-45bb-d618-08da795b0390
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 16:28:23.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uf2WFyT+mGQXSits8kNLi3ZMJGUxyUS26jDSaQxitck8QZC1E145lSNWK9Xxe31WbN/VcSrRoJFGQkaexwPGDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5153
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 tzimmermann@suse.de, sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>,
 laurent.pinchart@ideasonboard.com, ribalda@chromium.org,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, jszhang@kernel.org,
 ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Those pixel formats are used in Synaptics's VideoSmart series SoCs,
likes VS640, VS680.  I just disclose the pixel formats used in the video
codecs and display pipeline this time. Actually any device with a MTR
module could support those tiled and compressed pixel formats. The more
detail about MTR module could be found in the first patch of this serial
of mail.

We may not be able to post any drivers here in a short time, the most of
work in this platform is done in the Trusted Execution Environment and
we didn't use the optee framework.

Please notice that, the memory planes used for video codecs would be 5
when the compression is invoked while it would be 4 for display, the
extra planes in the video codecs is for the decoding internally usage,
it can't append the luma or chroma buffer as many other drivers do,
because this buffer could be only accessed by the video codecs itself,
it requests a different memory security attributes. Any other reason is
described in the v4l pixel formats's patch. I don't know whether a
different numbers of memory planes between drm and v4l2 is acceptable.

I only posted the compression fourcc for the v4l2, because it is really
hard to put the uncompression version of pixel formats under the fourcc.
I would be better that we could have something likes format modifers in
drm here.

https://synaptics.com/products/multimedia-solutions

Hsia-Jun(Randy) Li (2):
  drm/fourcc: Add Synaptics VideoSmart tiled modifiers
  [WIP]: media: Add Synaptics compressed tiled format

 drivers/media/v4l2-core/v4l2-common.c |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c  |  2 ++
 include/uapi/drm/drm_fourcc.h         | 49 +++++++++++++++++++++++++++
 include/uapi/linux/videodev2.h        |  2 ++
 4 files changed, 54 insertions(+)

-- 
2.17.1

