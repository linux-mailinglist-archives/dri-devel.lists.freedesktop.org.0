Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B701D746806
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 05:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94710E282;
	Tue,  4 Jul 2023 03:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622C10E00E;
 Tue,  4 Jul 2023 03:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVS9u0/rQlfNeCR0nw+mvclb+qsAGuyd92r5bazLL+G0JrEZel4MxRH/7QRwYyZpCFu4VvOBQ05heHmeM3WhAXotRZmgr84Isn1zvO2PMVFwYvELMxNFZmGAbF2t2CmP08rhy3ZdoKdBdhEBgbaC3Yluc9q6G9zkSAmyUgBfZt0Rtae5or1LzGRc9tbKQvUcOhbq9kEUte0iTylL+sDrWgo8GkzfuZGyJDyXW80OH3Pm8v6nxltnk8uzWmmomlshQ9sFfOS3pmrLvWIZMD/kdXWZeitDYJ63AVcTzEhb7/39DuYSM3zmRW770HPcbsuSBsV9bUQJyO2J9xGf6UoLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7TEowdZSs6QVTNeBa+P37ejcHrRyCE9JU4FJCcqJGc=;
 b=gPbVQS9mYa2HWQRUMughSt4ErPgyedstxUjvSS3LuRerGcYx4GLPr7Fqe3+XBKbp3ezfYIqJotws2YdN6cQ+9bpm10iAut1JPr8hBOXubFKXPeBHlsEXujgoddr30KHDtwbBbS//mlAr4FxYSpF4bThCkJEXqgh4/4UUTeKbo2hLvJahBxIoFfJQGoL2tEjnkShG5bM426xRkUWsQ+NVav/Nvcz2EmHl6S+Bu19gEvC3jb5dOCKzT8zjt5/AfKCOGeLiJhsYbawPGRE+D9JApZ0r1bnth1nr+lSowCKcH7lK9gxbgqrl3Fl8GdzJyCombT60ldBKOHMbOjGPXoHixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7TEowdZSs6QVTNeBa+P37ejcHrRyCE9JU4FJCcqJGc=;
 b=EnouIlWbBMH8y/JGA4iyD3EOpV+GI7Fh3gSTM/x/lacwAnoa9ps2BK2qYQKoDOC1+x1ocRd2D8w/UDTDD9YurA/cILGt6w6Vg/i9jO7w4ybo/lfSZl4GotC7dPkRTn2AnVP0Jvs7aKHbAXVZykU8oQN4rfdPjCFMpgjZ4fILJNs=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4879.namprd12.prod.outlook.com (2603:10b6:5:1b5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Tue, 4 Jul 2023 03:41:19 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 03:41:19 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Simon Horman <simon.horman@corigine.com>
Subject: RE: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZqz5nCvlP5HKi7kqHZhT1UyZB3K+jWeEAgAWiIwA=
Date: Tue, 4 Jul 2023 03:41:19 +0000
Message-ID: <DM6PR12MB26191F38EE311E332F479C66E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com> <ZJ7a4pvrjJbU2qjJ@corigine.com>
In-Reply-To: <ZJ7a4pvrjJbU2qjJ@corigine.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=3c5649c5-da0e-4b47-b8e8-a32e25fd0a35;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-04T03:40:18Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DM6PR12MB4879:EE_
x-ms-office365-filtering-correlation-id: 09e8e369-b6ea-486f-ea34-08db7c408732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EoWxGTJfiDd7eobynhRQrSOnHI1XCMH80LnnqE2GgSavzXYrrulcBQHMwRcgW1lC8mVichCK+es05oZuTU8fyspTsiYn+vER2XsFiHsVGiMhI5JXsusS55GrmurQfsuGJk5RAr5cbOiDgkk6Opjf5PzLy4DF3nJ+VFM5vX9tdxQkWBI6SKTsvONgKw1VLCkF5m+/20WQyVEruUwj3WrEIdwOj5HGfQAgJiIoT12Z9Hufz5oqVKuj97pogD2f1glvLfXeDYTYCp8FC9qOowDceELGmhnqcvj7rhUB0n1BOr3q6ufhzxOWEhis2rl7R2brEmYiiqoqPdAg2/sj410x1Dfn3AqhUi59IVLm5geNHHtYEoUqNZBsBJsJsdLXgsHazW6pey9dhQUisxjTB6aOkHOTgNfepZf6E6NR2dS1Og5Z0aYKtrH6g2gQBUDlf9cc96poppW5/3lq7mWswGuEzJ1MFL79djD60eehz9oFwXBMR/pJXAeOrvGDp82AGzPNnlh7kmApLWbN806+TEw9Mz7woLZIvnrQg/47ttCiH+wsh1Qiy4KOKiVRMgVR496+W0zvakwHe5h1Np95RMNkW0S2KDuK3MHXwF9Fg7ioM7rWGRh32BM7kflcX7vtdmBS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(26005)(478600001)(9686003)(71200400001)(6506007)(86362001)(186003)(122000001)(64756008)(38100700002)(54906003)(4326008)(6916009)(66946007)(66446008)(66556008)(66476007)(83380400001)(7696005)(53546011)(76116006)(316002)(8936002)(8676002)(52536014)(7416002)(38070700005)(41300700001)(2906002)(55016003)(5660300002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aeF/EXih001+1A2XCuQs1n1vyAzqV7j7H9nC2EsLssQcvzRCAfvVwNpb4vn/?=
 =?us-ascii?Q?rGbnKPxo89HZpXmpUfjF7vRkwJ8rA509ulNpkk+QWbqFX2llQDE+wbrt5RYv?=
 =?us-ascii?Q?cyeH3zu0cs16/oKDFpt1QqmOMvBng9HwpnzdRuh6kJA/ePCHSse3GIg7xiE4?=
 =?us-ascii?Q?qgIRmaq/wVudmXurQtGLNkm6SiCDbqjn2RaSQGUDsH4eT45xv6aXX4o5L1qx?=
 =?us-ascii?Q?y2Uq8tlROtaQ5+Ij5wd6yjm3meXjL50Ho4Sm+l1TjgY6ig2fZ9Q3twR1ld2F?=
 =?us-ascii?Q?XdzI0rNgJpIjPvH7+oDx8bqAiisoac81d4Qt4+4ZvJmdSWfrOOYTcjFGasEr?=
 =?us-ascii?Q?XvRpR1BH1hzS5I7M9Vi//aAb95DlTCJYqLhRs4RDBF2NknOZqsh/cmdTg53s?=
 =?us-ascii?Q?kAD5YAlsiniZFu0wMulGAgmBTJaHR+fSNGU7tVd/xXURmBkhld+q5SQV5+dM?=
 =?us-ascii?Q?evldFr1LsJcDIsWYE7+iWLPNr4sXxaxlHvEWr0majoR0Pe8qFEukvKX1W504?=
 =?us-ascii?Q?ymRCaaBvq1CcVQbc5RRVSzK3W/2y+oPnH+v5iCqfrIfD5QtEz8ciPiKyaOTf?=
 =?us-ascii?Q?lHBNoF9jBpPaX5Voxt9Vt+6FTh6Uoe6I6epzRE/Y41PGX4hihvEg93XxMao1?=
 =?us-ascii?Q?0rhXtTdlhEGSe736NB2bO5L7BZWsCBRGcR6sga0s1vyXJ4gWk5QQg6NEjVLF?=
 =?us-ascii?Q?sRMSVE7s25JG2Xc4SsCczyGym69ykbWvUs/Xrbe2qoE7i/vcbL7+7VSuqM5w?=
 =?us-ascii?Q?CeXNVc+Y7noq//ESPK0emYRFPRFvhN18AdQk4w9inSajZnrPRAJAAbcMG+MO?=
 =?us-ascii?Q?vX1pL0x4UurP+pJyflnFVQmm54ttYKZv/QoPvLRn0FK6Lrc5fPdhUFu7mo4R?=
 =?us-ascii?Q?cUzXaf9Kar3F/69MqQgYChDn4Xj2KYTQRQ3/7Ks4drbUtbSGdWVU7TJQjdD2?=
 =?us-ascii?Q?ziwlKlknQUaXparWjx0lDrgh8sYi7ikXkOebzkN6FO/WXCLWAz90IvHM9yl9?=
 =?us-ascii?Q?d1GNcFjn8jqcMxVBXlqLnt/EUsCWE+L/gwI7C2q8kOX/U1FIgEXneDFgJNZJ?=
 =?us-ascii?Q?sGu1Swfe18gNAQuTGgrbV3EsWYHZLOf7uM2UkSM265E1AyYAWDNQxfv7gbio?=
 =?us-ascii?Q?jYxiVKNPhwfdyDSRrtiowZWPFtrlynjY4+xIriLPwr92gXz1Ui9Pq5cFirxA?=
 =?us-ascii?Q?6S9oNm+yL7mSuflHt1mxlvXgsTfJG4fBR43KFI+WzrzjZCw3kOoPYxDsiscb?=
 =?us-ascii?Q?dvozkoBcIJZa7TBqN//txwQA9Kw50QfKjRC/gJYk9mqHa3+gdwEI5j+3Kx5o?=
 =?us-ascii?Q?RZNFrruuFNMS7cKJmiB2+dbzEhl3EGB/ECNFSZr4NwgLOB2oycfJKG+ggnuy?=
 =?us-ascii?Q?pOwWJgOZWKQkD8m35FMcn7NYpUFcgCVtMHcXZo3FbMupjeK8BIl/W1rWgoBC?=
 =?us-ascii?Q?2jKGCOEo3v1gYcPX/l1qmTuqdFfZtxo/ch9KrD+5b4X7kdVMV5A7sAteSWt1?=
 =?us-ascii?Q?p1ikKM4862P1xCeBJm3nDIuI1kCU+Sghn599SUzFIAJh2m6qthDzCvnRxco4?=
 =?us-ascii?Q?wASI1XbTJbkbL0CNZhc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e8e369-b6ea-486f-ea34-08db7c408732
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 03:41:19.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/AFs5mUdtCubz4UTXNXmC055s6k9wY8pWXnCiMPNur3XLhgiciYYqo2YOTGfh00
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4879
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Simon Horman <simon.horman@corigine.com>
> Sent: Friday, June 30, 2023 9:39 PM
> To: Quan, Evan <Evan.Quan@amd.com>
> Cc: rafael@kernel.org; lenb@kernel.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; Limonciello, Mario <Mario.Limonciello@amd.com>;
> mdaenzer@redhat.com; maarten.lankhorst@linux.intel.com;
> tzimmermann@suse.de; hdegoede@redhat.com; jingyuwang_vip@163.com;
> Lazar, Lijo <Lijo.Lazar@amd.com>; jim.cromie@gmail.com;
> bellosilicio@gmail.com; andrealmeid@igalia.com; trix@redhat.com;
> jsg@jsg.id.au; arnd@arndb.de; linux-kernel@vger.kernel.org; linux-
> acpi@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-wireless@vger.kernel.org;
> netdev@vger.kernel.org
> Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
> mitigations
>
> On Fri, Jun 30, 2023 at 06:32:32PM +0800, Evan Quan wrote:
>
> ...
>
> > diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
> > new file mode 100644
> > index 000000000000..3ca95786cef5
> > --- /dev/null
> > +++ b/include/linux/wbrf.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Wifi Band Exclusion Interface
> > + * Copyright (C) 2023 Advanced Micro Devices
> > + */
> > +
> > +#ifndef _LINUX_WBRF_H
> > +#define _LINUX_WBRF_H
> > +
> > +#include <linux/device.h>
> > +
> > +/* Maximum number of wbrf ranges */
> > +#define MAX_NUM_OF_WBRF_RANGES             11
> > +
> > +struct exclusion_range {
> > +   /* start and end point of the frequency range in Hz */
> > +   uint64_t        start;
> > +   uint64_t        end;
> > +};
> > +
> > +struct exclusion_range_pool {
> > +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> > +   uint64_t
>       ref_counter[MAX_NUM_OF_WBRF_RANGES];
> > +};
> > +
> > +struct wbrf_ranges_in {
> > +   /* valid entry: `start` and `end` filled with non-zero values */
> > +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> > +};
> > +
> > +struct wbrf_ranges_out {
> > +   uint32_t                num_of_ranges;
> > +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> > +} __packed;
> > +
> > +enum wbrf_notifier_actions {
> > +   WBRF_CHANGED,
> > +};
>
> Hi Evan,
>
> checkpatch suggests that u64 and u32 might be more appropriate types here=
,
> as they are Kernel types, whereas the ones use are user-space types.
Thanks for pointing this out. Will update them accordingly.

Evan
>
> ...
