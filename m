Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE108C4334
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88AD10E7CD;
	Mon, 13 May 2024 14:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="UZgif2oW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2034.outbound.protection.outlook.com [40.92.23.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61D610E7CD;
 Mon, 13 May 2024 14:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdufI2gXzhEwbxLVyxDPL6BR0N/r3Q9gRxyw17hkKxdJxoXiW3AhbJXXpmgLb8oPZrnnO87GXmkDRzguMVFCJKew5OSHmHS4YrqB7lTRuxT3VD2McFxJNTeH53yLrQlZkz7wefxavSLgd3px5T9GaGHWXRnCv3NXPDQDOrttsbLOibnSyQPQTqViDyAhujNpy1ePLZbJSwejE8HI71wmyUfF9xAP4iqeeTdev06XrZPIOp7KVZzbDxo8MTpihr1zOKAikEQlN+2faAvIJ6k48Kgu2dL9bmWUIYhxwY5MkVDBgAMsBQLKBhGf6bMVNSFKjxdiisdphBd2r+ixCqOOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ii9GsWnJ7D6mP1n2yJF+TxiwCJPferw8vPhzhtBwuE=;
 b=BhMrBE5lVPUONtRZbpBL65/0hRdAqLBO16pYRvEBGzLM6qvZmIKR6LD8axIfJ/idmi4PNCkjdZwsd+PNoN7N2HaCn5Efbv0rWYKNr2T5icAWlfIv3upJUQshgd6Y/1jvQ0aE0/uhZIpYQQooWz4hehn9W8I0SF6FmWDl6Pcc+nIYRXOR65kYx3iUi5iVpC/mBXK0bcF1IFJVW+JthA13P6qPHHgQTP/gm8g0XXqQ6wfcq6roKabzkkARbwOLk0IoNW+4s00mE552zUu5MdGktxoXNhm86zb418OF69uzm0yABl/z25njarlqM0tVyRpTyGyzQVcpc3rrQ8ztmg03bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ii9GsWnJ7D6mP1n2yJF+TxiwCJPferw8vPhzhtBwuE=;
 b=UZgif2oWLp5zkmqatU8JLifKuM21JL3MeDqsGZeOX53ZbcAfN/BhUJGHLLsrqUihlpjEu6tXWQ/0qqiqGC5twRVV9Ie5AIo0v9y++UTIEVMhi2Ek0fkkOU8h5zYau0xWr3WYc7hEVl5xovUh2D+lDkQ5xs9vaiEioa9G7Jj4WDFJyuBi3O+08BaHp8/xUEHWBHtB1dIC97RLXh+37WMhLtO217wrNiJ+WOiu3arOhWdfrUyZRGgIVISAOOOkVh6NjLnD9y9wuFrr4eAxXdISArh3GbgFKE5uI55KgcrEyn0t3Fl77d1BqSzaNvqckhn52GnV4z3Z1CiXXiAHPo37Rg==
Received: from BYAPR03MB4168.namprd03.prod.outlook.com (2603:10b6:a03:78::23)
 by SA3PR03MB7303.namprd03.prod.outlook.com (2603:10b6:806:2f4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 14:23:37 +0000
Received: from BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a]) by BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 14:23:37 +0000
From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
To: nirmoy.das@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>
Subject: [PATCH] drm/i915: Correct error handler
Date: Mon, 13 May 2024 14:23:29 +0000
Message-ID: <BYAPR03MB41682C46F27D118AE5C511FAADE22@BYAPR03MB4168.namprd03.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [X4fCUgcXNv/AEpY3y0SrsbXmZQJZsmcW]
X-ClientProxiedBy: CH5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::10) To BYAPR03MB4168.namprd03.prod.outlook.com
 (2603:10b6:a03:78::23)
X-Microsoft-Original-Message-ID: <20240513142329.832-1-jiashengjiangcool@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB4168:EE_|SA3PR03MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f88b23-8884-4ace-2b95-08dc735847a8
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199019|3430499023|3420499023|440099019|3412199016|1710799017; 
X-Microsoft-Antispam-Message-Info: dkhMLEUrhvHPrpGdrXvps+vnPq356ewUsS5HRlHpKUIMUW+iHALWeHVN/FajPtN81ZCiiuSXmJpvUGFztxA6Bv7jWxGdaiEHEqP+eFH9aYA6/3wjm3ByuT+JvGQy9SYff+1YzVxv0mYza+lcUb7wCpE2n8O+NEbooKw8/qeSm6yJ7LdtLbjIfPIdH2c4tpEo3M03E/0GXubDhny62awZElLLvf3V/oXo8t8GyOYVhMG3fzYJDiaVL1Cza1nsYZqi62GLvvb4D11e6ZW1bhEyCV2olOsuW9kddsZqhFmGt3c6Eq00c2PQhPzjhKMRIRhgjVXVZHlpME3LDzR5KpEDV5i4LnVlQ2XqwLvsC0/1DY6qvtmSUaxzv30QefGmV0v7/jJn7iNXrLQqqLwOmQPKjTyCGUbcT3p8Vt7dOkr9Z8W5ak3wIOCc/w/4USFw+huLWnGufl2RHY+tCX4Ia1y56knxBNqqrCTCz8fdfi2l0Yr9ua3YzWyqyrCkOtH9ZCaS+7BJVXdvkoXlvDq6iJ7kwPCK1TFMzGYxpszm2Gegw5clmzJLp0i7aNJzcmGB9dZqrH0A8iLv70Amp9XCeslTD0aHwARH0/uDRQMxbDrzuySmJ2zfsgrmnD/I33GoZ2vn
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4CvAqqa4xVJk/P7xR9uane0cFeWh+//Hk30aLgjLrF5tAqPgFxT6fd5nWhOA?=
 =?us-ascii?Q?YlwB+nyp3fUPVPugHPs2Mw9+izEazp1O6M0hdwTi/u/TufDOJJ33ekEVusTK?=
 =?us-ascii?Q?R/56mWk4/8/0J2c6RefdR2Sf9aG6JLdwYzWo5dNHsPh985RGIPM+MNnD9nZA?=
 =?us-ascii?Q?qJt7eSf89aSUrUiu5fz6w3TnY4+pKq86MzPVK86EFMfVYTV9e1Oe2taV/elI?=
 =?us-ascii?Q?k8PVfgLjj73juqG7ws+U8wqdCfrs+MW9bwOh0P1Hh5o7WjOmmcsRCp4EZmaa?=
 =?us-ascii?Q?JHeGW11Y8ATbqNd/C8phQD0LBf5VfwaJ0WKpaSW5jrie3edSetB17YY08dGi?=
 =?us-ascii?Q?bUu1q3c5ApiCKVaasxCAQECCiliDGQPmMgsiAo6l0doAAoROfTyA0DT69nQN?=
 =?us-ascii?Q?gdXYi8iGxmLGDmgVpFbgVwp5cGZnMxdJ/tAfEkYUTpIIQOVTA8neLW9wDfs2?=
 =?us-ascii?Q?3lT799u3nlwBDsNDcYs3cNX5tY+p8i+cCSIFdWiDfKoBYxIWp4BOsyMpf7FC?=
 =?us-ascii?Q?7vvgic9cApji1Yph9eHnShHJn6jE+yDPNzjrQmcK3+i3jBiMCfph3lp4nF4I?=
 =?us-ascii?Q?qTYQDEAOkyhVk9jyZueKC/aH+B12ldgrGWfmIoD5K38zYuX+Dr9ivto+k1f5?=
 =?us-ascii?Q?2JL4LUhZ/MDvTRUimXKV9RY3yhmu8Z7rpW2SK9tN4OW93/U0ElJI2AZEp9B8?=
 =?us-ascii?Q?AsFNonsL2xK1FTphIk4SGpxOTLdSrgUgnVJJvLPjVgfEHnI0ErDO4JgzMJsR?=
 =?us-ascii?Q?2qHVzoWebqTkSKoeMFu9kVfrGdzcO1zjmK1zhNvFGoKyp3TMuCA+uAVh6GCI?=
 =?us-ascii?Q?2s089J8aM0NSzTSJW+x4+cXvBzZCUwhZq/GfP8bnegX+OfMZgAi0uIYsnguy?=
 =?us-ascii?Q?SQiEyo18H0RFqnWqAzDCMIydz2x8lHkN8TyFXLbeXf+6L0cBOZOl53uiZg5W?=
 =?us-ascii?Q?shgZW9zYXoGCBI0z6wB8SoCsiHjE36+XDG+F5ZW5xdrrsPV4L8Jcl0Cwo0tl?=
 =?us-ascii?Q?gEk8JKa5OzZaVO5skgRQrcRJBpxymeQEFr/VTD5mGgusd3aVxJB3yV3IRN0D?=
 =?us-ascii?Q?dOHGu00VcdDidG2EXc693JD39Pejz7o/nF04sWUficpPzEP6uANNh+NJLzlt?=
 =?us-ascii?Q?+O1D/a1WUKe9HUc5QRqL0GyUfX9ThFjxxGKL1MwBF+sI4VgFn/NwlE6HOdZZ?=
 =?us-ascii?Q?mtGjTJR7R9y56zy8zH1BJ4iGOlDc4GqF0KV4xaOIzeDvCrzRdXLv8ID+QJ1u?=
 =?us-ascii?Q?i8DfrSkC9Zmfp6DLogNY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f88b23-8884-4ace-2b95-08dc735847a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4168.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 14:23:37.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7303
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

> On 5/11/2024 5:48 PM, Jiasheng Jiang wrote:
>> Replace "slab_priorities" with "slab_dependencies" in the error handler to avoid memory leak.
> 
> Nice catch. I would make the subject more like:
> 
> drm/i915: Fix memory leak by correcting cache object name in error handler
> 
>>
>> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> 
> Also need Cc: <stable@vger.kernel.org> # v5.2+
> 
> With those:
> 
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> 
> Nirmoy

Thanks.
I will submit a v2.

- Jiasheng
