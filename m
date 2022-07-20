Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FC57B75A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800AC18AD77;
	Wed, 20 Jul 2022 13:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6579518AD77
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcyshxyFtay2s0olx4eIukvz4KmFGnQR6Mqg2+e/XQX7czK4ka/B2i/7T8umdQC+TEtK3CjGkTrPXoVgzY1fBBXiZ6TU+a2KpwSJ5rvyA+l+D/iwhkGMqP+J11HPsMxcd8GmJsS7Toh7dvOesugfYRmmdO8hQTDy58iSuASUWeCA2YbwOP/P5mEASv7XUk2vxckPRxt29XIKZO87W+Q406axIo+EJOjf4/ugisW+SO2oJTMAGsoOZa4q/JV8Pnl0yWAkIZUPScGAi1xgJioahjryAv2XbHZqX4d40sqvQG8qt3PfH1iD/LZvA2tdoPLnk1xtXaLJE7/f8XdDBESi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP1J+ANiHPXv0hTyES8nmUG2xirEA+8pqq2svLpc+MI=;
 b=OtjG3tTDvh2x5I0VfCXTV4I++zwVWtxBJOGWAELtOUJkOPyY//K3stVa9jh3xcHAccZmGv67dZLbZvu1GGBOr1NBzod6LHpnzOezf3bAeLl4p9pnNbAnE160K+BEKom4Kpyj6Syb8BVZfSGjVVFeJ1z75wrKqekKiwhRO68Xs/I+z2U3GgNXevNoKYyY57pJcm3WCzYxA/vhfS3gj389N0bu90maMqYRqKNYaUvRyjQmyWN7fFS8K8Yxhkv/ts3CApqwE4xHBx9UHYVw51bmaxSI3osg83AtvoF8Br5/uPz1EKHj8laC/q1uTgGgmbTP4PRYPSpFI+P2tP0eXtyMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP1J+ANiHPXv0hTyES8nmUG2xirEA+8pqq2svLpc+MI=;
 b=oEAIgyQHeAiCMNLpFnMbxdzqNbAfQIApjRZa4spb0qQy3qUZJstgfNNGYZzsuuEXhjdAap3uF9EoMJ4OWQtj4bz98xObQhkrRS/6p2z5KwoI7p6WP2B9ddrX3LFbClYg9fuwAlH/D+AWUs3Am/UaW5BLnR0JZ0WOmUiICYat8ys=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BN8PR05MB6706.namprd05.prod.outlook.com (2603:10b6:408:54::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.16; Wed, 20 Jul
 2022 13:23:18 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5458.016; Wed, 20 Jul 2022
 13:23:18 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@redhat.com"
 <airlied@redhat.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "airlied@linux.ie" <airlied@linux.ie>, "alison.wang@nxp.com"
 <alison.wang@nxp.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "stefan@agner.ch" <stefan@agner.ch>
Subject: Re: [PATCH 1/7] drm/vmwgfx: Remove trailing whitespace
Thread-Topic: [PATCH 1/7] drm/vmwgfx: Remove trailing whitespace
Thread-Index: AQHYnBMQPjjz3C6OgUihI8YOzDkGcq2HP5kA
Date: Wed, 20 Jul 2022 13:23:18 +0000
Message-ID: <f246097ebffe6069a755f9f32008a2e0016f167e.camel@vmware.com>
References: <20220720083058.15371-1-tzimmermann@suse.de>
 <20220720083058.15371-2-tzimmermann@suse.de>
In-Reply-To: <20220720083058.15371-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad8c75b8-1015-422b-3314-08da6a5302b7
x-ms-traffictypediagnostic: BN8PR05MB6706:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdaWqxduKCNEZHGFdiPXaEKRYp4COFUWfe2POmZ/LQnNwhMUH6e9kfzeGPaaNZe9hDLj81r9cv6J82j0UFih+16H1K0zWB6rQn9NziFpxQDWFGdGjfJ8eVaa7CwilI1D+JjgAjx7HXi2A5ezCIm3FfCdqNRU4639iB3wyJTWA9JnNHYEt/v7xa+J17vcE/q7OW0P7DCD9oT+On3duDjm3PxsnJBIzHWr21QKwQhDv+sEGHXE2KBh4ql2rh2IvD2NxpRMS5PU+Jsu074y5ctqPpy992K2hfSxl28RT+zqMs4Yh5XlQw6tJ2biXeuXrs3RHthrDJ7gUqx6s7QEw8ufc5NKlQBF8qiyRSWmGX8bqhmyxuHvNpXiqEuRqVJsAKJfnbVqlTmZn9KwcBKjYLbysx5x5f76nwVln7B4JibQLz5YR2kgcKvUBy2LLAA/ZdA3GdPYrknH7lj5SXBGwVU7ZD2eOd/fPJHUMTEPdVCSf4cZLTusNOunBh3wzwPRSbt8TEHFPFPHJrD3Prk7OlNAUiqy5a6AYfXtmrhiUuc+24MPC408LEgtz5jHJKQ60b0+5xMsrwZxFCqNuzOeJdrdTsJ3WoPcTJqB1nfhuAmMQeoP0raS8aovWdkRQkLEh7d8GLjRjOHm/B7+xyLyUBxZGqB21b3pGpl3G75z8UmD6FR4iaDIqVNnMa1JWYFkco8IidEYYe+5nAE6pDm4CWV6lNjUYPKgvwD9cxni2M4As8PtBZHPgnM2wtjPHVG2cLWNzT/VsiJ1w0ChqcpQd8s/pgPysV3hbDOu0CgyJHXb2tNWJtNfwGY8Cqk65nnVyRK/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(86362001)(36756003)(2906002)(41300700001)(478600001)(186003)(558084003)(107886003)(316002)(6512007)(26005)(2616005)(8676002)(71200400001)(76116006)(64756008)(38100700002)(66446008)(66556008)(5660300002)(66476007)(66946007)(122000001)(38070700005)(54906003)(8936002)(6486002)(110136005)(6506007)(4326008)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnQzZG12WldJQkdRZ0pGRkV3ZFVETENIN0FvQkhKem1peTR6WStYdm0wZHAr?=
 =?utf-8?B?TENuYmMzNG1CajlnREI4d3RCZERkYXBtQXhpYkduNFVhOWVXNGJWQlk2YmR0?=
 =?utf-8?B?RHVMTnIvOWNINitSamZiSk1YT1k1WDdaSEdVc3dnNWprd3EycERYNnJINXNR?=
 =?utf-8?B?Y1FMWkgzQlhxTUtPdDNsbjNZNzRvWUJEaWZQYm51dzZIdlQ5VmFhK1prdTZH?=
 =?utf-8?B?RU4xZTVXMUtTdWtaYmNYTWVWRkVISlE3SzdGQU1nQzNTVDRPTDFmVXVzVGsx?=
 =?utf-8?B?RW5lZlBJMTJWakxiNGh2KzV4WnpkNDRRZkphZzYrQVBwbHV4SEExT2lFRUdC?=
 =?utf-8?B?eUd4U3p5YXh3ZVp1cXI4SHQ1QW5MSms4T1lUM1VqcnZ2aEdkcWNPV0czYVZT?=
 =?utf-8?B?NXhkWmNORE9lMmJ5bHVXYnMvZ3NodkZBR1o2TTd4MndZMHdUQ1NmVWdoODFN?=
 =?utf-8?B?TXJ1QmNuK1VGeDQ1d2JISHBMUTZoWlkxUVhWcHRiZjd4S2hEUzExWFVqM285?=
 =?utf-8?B?cmN1U0FLN1YrVjNGZHBKRFFkQlRXd1hDY05VelRCTUNWU1gwa3VxTUg4MTFa?=
 =?utf-8?B?TVVncDQ3UHVWNDFjNmdRWkgrZjNJbjVmNmhLaXF3V2ZvZnJacTl3MHN4R2ZB?=
 =?utf-8?B?TmwrQ1ZGMUZmWkZHYW95VVlCT2lSMDd6cHZuTHhRTjdmOXFuNjN2LzYyZno0?=
 =?utf-8?B?RjlGQmk2WEFNcUQrVktBUWFrSkRFWWdZZ24rUlVkMW5nbjhaeGRXam8yVE1y?=
 =?utf-8?B?ZmpBanpYa0w0aXZENUx5WDhjemJoV3RNcWVja2xGNGlKekR4NmZIc045dS9I?=
 =?utf-8?B?YTJxWXBpanNRbHJzNmFSZjJmbDgrSGtVL1JsbXliQjZ2dlppUzNWZnVkUWhM?=
 =?utf-8?B?SHdzeWxRS04xQlVFUUNzd0JCMFBOdmw5MG5CUVgrSTY1YXFWSnRySVdtekxo?=
 =?utf-8?B?OFF3enppWENzYTA5SW5wN1hIM0JHSlNKaHJzUXpKR2d3Ym5zMjJpN1ZvZzFZ?=
 =?utf-8?B?Q2dOWDViSUp4d2ZxbWdJd2cwNUpmMnFSNlR4QXZaRW40dGZDb0JIMHo3bW4v?=
 =?utf-8?B?cm01WmhWd0RKMnZBaHM2TUlURjhMWFpWSndIZWEwSWhqODNzMlF6QllWaUdZ?=
 =?utf-8?B?dnVORXJOaGpYaWxycnRIZXRNQ2hPWENjVGJJRng0ZEE3UDZGdDI4RU1TQlRG?=
 =?utf-8?B?L3B5WTYwUTYwQ20rc1diWjRKd2t1WG9pRGcwR2V6TUttOGRBMjZIUU9Uc1VL?=
 =?utf-8?B?eENWQWd3bmtPTC9YK1c0aHBFdjIwZzZLSnZsbzdjZjBzTTVWUXJaaStQc0RP?=
 =?utf-8?B?VWlRZ3NUNTJITEM0QUJ3a016UHN6V0dQZ1d4WmpiaUlnb3IxeHBXWXlJdlMz?=
 =?utf-8?B?N2Z1bVFRUUljOWVJaDRzcVdoMk5PWGxvT3IwSC83M2pXWEl4Y0xJZjdaZ2VR?=
 =?utf-8?B?eGM2c2VrNDkrVGdWRURWSTkzVmVYMGxIVTBJUWQzMXE3akVBN1FRZXY0M3BX?=
 =?utf-8?B?VEtDWmVwZHBZVHpnWDVVRkk3V1Ztd0RtczFNc1E2MGhIcDBNOXVRSXgzcVlH?=
 =?utf-8?B?OWJwS3orSXRzamNpaFh1amg5K0FLaml5ZUgzTlNmd2VTcmQ5QU9VemRqeS9T?=
 =?utf-8?B?ZjJyTk9KWFNGK0ZqWUFUK3NHSVlpQ01xOFFZeFlwT2RKWWFKeldPWEphSk85?=
 =?utf-8?B?MEY3dzkwK0tNVVRUL2pyNmtGNkJLM2YwVlFSQjVzVXlSZkgzdTA3OGt1QUZG?=
 =?utf-8?B?enhhZElyZitEcW4xSWd4Mit6b2xhUXFBbEJ5dkJBSjlpTVM1V3VaVmcydVQ0?=
 =?utf-8?B?NUZkaUFKZDMzNXFRbk1BMUpJSU9VZkNETlN6ZFFsWlR6OHBYVFFoUytQRlZF?=
 =?utf-8?B?ZW9FdnhvRWJpemJXMkNaOG1tVFdlZWQyak4yWFFtbVc3UTA4TC9nT29ENDZI?=
 =?utf-8?B?eU5UNm95OFQ0c3NXNkxBNGJKaDhzTWQ5MGpTNVlEbVlDaFMrU01NMDJUMUc4?=
 =?utf-8?B?enRxN1ZQU0dkQzlvb3dDdjdzbytrL2JnRmVtNHR2V2pGVDBMSnF0VUhIOFd6?=
 =?utf-8?B?WlZsbU5ueDVtd3dhTXk3d0pPZkl3ckV4RjdBeVc1K2hRdmhNK0puWGhJVWpO?=
 =?utf-8?Q?acenK0pP7B+S392XejHjAewMF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC708EBC9BC7FA46A6D3C8C7BAA3EC86@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8c75b8-1015-422b-3314-08da6a5302b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:23:18.6580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPzFwyMt3fFbefBy7MivCRrCl4LwEyG1b/Ke1srkHFLNokAsE5KkQxFFfFJ92TySazM3JZRFi2CwnN7YfCPlDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR05MB6706
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA3LTIwIGF0IDEwOjMwICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gRml4IGNvZGluZyBzdHlsZS4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClRo
YW5rcyENCg0KUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo=
