Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D686B3956C6
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80E06E882;
	Mon, 31 May 2021 08:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BA26E882;
 Mon, 31 May 2021 08:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLKvB96tQXRWOLZu6Z3m0uauW57O0UEVVDmrOgwCX0e2gs0XPNgdlj9Jl0bk8KHWu6Vf+nPDhtktegL0Iw9eqxgWBrXBHHaD2qRKx9dOeEbGDuQxB2shdBTQhyW5grcipQcTE3sg4fBxvarNRbASP556YkCG6sI9gZtun391egFmw2ir/umRRIqPLJTLsyiUjSXcB0iVb4S+zsvclVOHKgmij3wdHlDFxeqicmnrAfQTPOJhqWBPuGWk1egAwM86OcTSVSmzm8Yn3Kjc/E1lIqSNm87mNvztoWeI8vlv9XeqVbADcTjqm7gXH26U+/YMt0KlBtI+sKfA9y8bS3UO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLs1fvaKcFDOKvZFgXSt/iFn1RN9/eBCL7Zf0tvNwbc=;
 b=dssfkoX0ukpogfcqFksRuN4qkqHoKeoh3FxvtI4Wcxs9lz6w2I6y6FgJCpTHGMNOsVhCLzwuhbSjBdcFt7UcLJ9rKnXdxXOziBF7+GEfZO1BHHVuUDgmKQ70UkKzsd9kpd7UIrPbD4B4spntOUAsMhgfJgFn0xtnI9gBJwHdFqn3ty0GXGgia3VqkhMRhdqDfQW6HLHkq9vZwHXtbh9ccVzn9opDYKFbhZfg5vmY6RZIID8QsFL93yXyO3ShZz7calS3dO4Syv5lwjPhCrYvwkeqXmgtqYZZJj+hfiiK0D1rQuDxRZlPLGS2O0Tkdv2TWHWG+aGFDeYloKKC4nQ5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLs1fvaKcFDOKvZFgXSt/iFn1RN9/eBCL7Zf0tvNwbc=;
 b=y2ownauDMSBfZn69n7veyn2UdOpLMlMYfCG9xiDMelhVyXdRPh53gqxu55F6gEOq9WDt2BUovP1A9k2BlBbWB6BYJ7OOo7E1kzOSQRGdL/XIOqlreJqptt2FWJM3myy16mraLXVCoHLovR2wRuUk9EaG2gxkZHXA8tbgXyQhrFY=
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM5PR12MB1339.namprd12.prod.outlook.com (2603:10b6:3:70::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Mon, 31 May 2021 08:19:07 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::a4b1:38b7:ec94:8003]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::a4b1:38b7:ec94:8003%8]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 08:19:07 +0000
From: "Yu, Lang" <Lang.Yu@amd.com>
To: "thomas_os@shipmail.org" <thomas_os@shipmail.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
Thread-Topic: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
Thread-Index: AQHXUpf7leXvKSxZVUKsvyexEgFZo6r9QhEQ
Date: Mon, 31 May 2021 08:19:07 +0000
Message-ID: <DM6PR12MB4250B79297F587313D7645EBFB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
In-Reply-To: <20210527013051.4302-1-Lang.Yu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-05-31T08:19:03Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d5529307-3e5e-46bc-a9d9-469601290355;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.134.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f80753dc-c23c-4454-786e-08d9240cc29f
x-ms-traffictypediagnostic: DM5PR12MB1339:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1339D379C41186A014CF880DFB3F9@DM5PR12MB1339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20+pWoTQzq1vzjsAYKAV5ALsbC1wMwY5vrsw+Ex0lPweP6fD+YR3ok+aHi5xdXB1idLU2msge0glzHwsoZ4CJaCi6Y1fCPabwTB03DrPJm7UNcRk8g28eOBE73eWrHitV5wICajvGi51swqB6raF0CPlM2wLicIhVYg0HNpCFJq4GzBy3zz6TWtGA4GhmHi1cQPb7ol+SE8rK23/irDBcywrjhPuCCFIHYQf79QTGuXyNypeNtumJk4KvgIfLV8kck3Kzf3gTH3+8TUTI/CsexcCHne5bF7iGsbXLlwae90hnD6/zNaqAwL4nUc2se8TmUKlC7s6HQBEP5CKC7pOkhcUGlM+PHP16qU83Z5JAqdCee2wd/zRA5ObUpw8mf4syaOh/esIFzZapnRyFIqsrNeK1ZfdqXljzCAXW5IvwdRbOK0bW8qT/nGIpGW8aIW+2xMZLhTqZIbwZbQfWEMd6/apCNNHAFj6nyEzATMcUU9xkfGybrPHTdVFddiqA9UVKFcMy/bJ+E0X+q8Xlh8gg2YT/fuyTSjxH/a/CJ1gwAgPTVOF1rwy4BnEzxtp/wbLQBIbhFcpvnxAYrP/vwXUioeQvgJGhl0UuEs3+pi6+2M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(6506007)(86362001)(66556008)(5660300002)(122000001)(64756008)(71200400001)(55016002)(8936002)(9686003)(110136005)(316002)(83380400001)(186003)(478600001)(2906002)(4326008)(33656002)(7696005)(8676002)(66476007)(66446008)(66946007)(38100700002)(26005)(52536014)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UwIsbgFSaFuswiykI0m65A4+Z/XdkPUGqHncUfLM1+lXEzHprTz+q//Qn4uZ?=
 =?us-ascii?Q?e6xDETVwqBgNZYXziIORrHwpc37q70iLkGE2IQS47X93+tjRWFw5xCjYY0Sq?=
 =?us-ascii?Q?MaPIJWfqwGKOGGwqO7hRmrXeUST7e2goKlclcVR/UhdymPnZsU5CKba7qK54?=
 =?us-ascii?Q?4b+hiQMGvxblwLej2JjAWeRCM4Sn+MyA5mdRx4qJzsp4i36SGDko2RMCWEzd?=
 =?us-ascii?Q?U0iRbyBKWj2NxdmjrhXDRjsS6Ms2muO3J4NOZC3IclKgHK91to1QjdN38jjR?=
 =?us-ascii?Q?KFtGqR+1rkkI4lEgHB8wFRR3oBLArDtDBoQTh8WaF1hGjUpsZDOEoFOPKD//?=
 =?us-ascii?Q?txAAVkarU1QmvlbVlRZriF+JFutsGPCuWhVXwg/sHgnS8rHXJyvF+jWUubOn?=
 =?us-ascii?Q?mphW/NYA51VMSZa+m8m3cm5fF6SN8U8p26aiDcmh8q3Nc5VyNQ8nAufS6kg8?=
 =?us-ascii?Q?ZHKywsWDqi+6m+v0VxhP9OGJdCt96NpzsFr0aWeBrjdmT4ynv43a80U9FWiP?=
 =?us-ascii?Q?KgcdoBOzoR3qFRGWKmqn3pbDXddHpZKcUtrqnsaTEZ0GpZM8SK+LPyLEpwSz?=
 =?us-ascii?Q?ZBcCtw6SBggd3ov1zEMV6EyTuBCR2ILd4qJZwqPzHHMrQAdMFChDk3BEsqoE?=
 =?us-ascii?Q?zgPzk/ZZRJcZrdMeq0XIPp8sjDRmcp17PPJpJ2S4T/Fim98C1+Xhh6KTu/Qe?=
 =?us-ascii?Q?Aue2rOrcQFVQEGV2V1hKXE3K2FJTpcIck/t+GonFQ7Ktqs+GnKKT+J+lygth?=
 =?us-ascii?Q?R8sD5TiLAQwAPmiHKhptd6AzEIWO6gfXIqGGS+8RUdRxZDsh8eFhlkbo+thJ?=
 =?us-ascii?Q?cm5wF0pi2GiKkXDPJQETbqIGTCqGHvdm2X9XZgiZW+e8BnY7RY6UepLBILKr?=
 =?us-ascii?Q?SPy8eEEGIreMzauPY+ndmAOD6Qb6+TmJJ6kmb8ZHg2jRCU2jYWQ37eX+/fLt?=
 =?us-ascii?Q?5o7iIPpIvnERwBi1QxV9h5+tARL3DEh8rS6w2bk8UoqJRBtFVBadR9mHHx4v?=
 =?us-ascii?Q?eyXMQsURSvtRpdlbqmpYu+ZY1Zcw7opw48UjRT3AZ1nnS3OqDrfb0z9hoTUB?=
 =?us-ascii?Q?XzQVLrVBrax5JIU5KW+c+DtheMsFuZsc1n75L2Dv00Jk3LW82N36IkfSifYi?=
 =?us-ascii?Q?wJ4+O9lLwj3TBc/LEYjcoXLgryjQXXO+kqlILs8jbAC2Eh7HngW5qRff6bsx?=
 =?us-ascii?Q?0GpLLidQCIFUz0RA1/FOz3aC82FV7xkxwRXE9m2kFlRdRBIfoJF8LddTttBK?=
 =?us-ascii?Q?2Tk9CayTAfqoWMah+yb7X9fULbvUi6yBMQWjIL3inSWVTx+MzeQgFJcXp8zk?=
 =?us-ascii?Q?6+qJNkHQoWddstZOqiBWVyNB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80753dc-c23c-4454-786e-08d9240cc29f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:19:07.1839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vme8dzV3zvhjqwy4+mamvLrqj2wPjcOpz912tJr/VNAa7VUiMdSXB62bQ4/82/6GwLLHH6q7+i0qZBTBsxy+kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1339
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

>Hi,

>On 5/27/21 3:30 AM, Lang Yu wrote:
>> Make TTM_PL_FLAG_* start from zero and add
>> TTM_PL_FLAG_TEMPORARY flag for temporary
>> GTT allocation use.

>GTT is a driver private acronym, right? And it doesn't look like=20
>TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we instead set=20
>aside a mask in the PL flag for driver-private use?

Hi Thomas, =20

Thanks for your comments and advice, GTT means Graphics Translation Table h=
ere, seems
a general acronym. TTM_PL_FLAG_TEMPORARY may also be used by other drives.
I have made other patches for this. Please help review.=20

Regards,
Lang

>Thomas

>-----Original Message-----
>From: Yu, Lang <Lang.Yu@amd.com>
>Sent: Thursday, May 27, 2021 9:31 AM
>To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>Cc: Koenig, Christian <Christian.Koenig@amd.com>; Huang, Ray
><Ray.Huang@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>;
>Yu, Lang <Lang.Yu@amd.com>
>Subject: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
>
>Make TTM_PL_FLAG_* start from zero and add TTM_PL_FLAG_TEMPORARY flag
>for temporary GTT allocation use.
>
>Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>---
> include/drm/ttm/ttm_placement.h | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/drm/ttm/ttm_placement.h
>b/include/drm/ttm/ttm_placement.h index aa6ba4d0cf78..9f5cfc7c2d5a 100644
>--- a/include/drm/ttm/ttm_placement.h
>+++ b/include/drm/ttm/ttm_placement.h
>@@ -47,8 +47,9 @@
>  * top of the memory area, instead of the bottom.
>  */
>
>-#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>-#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>+#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>+#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>+#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>
> /**
>  * struct ttm_place
>--
>2.25.1
